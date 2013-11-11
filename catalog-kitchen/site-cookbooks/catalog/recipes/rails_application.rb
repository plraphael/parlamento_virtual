# site-cookbooks/recipes/rails_application.rb
#

# First thing, lets install the ruby we want, which we can define in the attributes.
rvm_default_ruby  node[:rvm][:default_ruby] do
 action :create
end

# There's a lot going on here. This does some prep work for our rails application, setting up some folder structures, 
# configuring the web server, and setting up a runit service for restarting Unicorn.
#
# this is the location Capistrano will deploy to. But we need to add a few things to get Unicorn working right and have a home 
# for our SSL certs. 
node.set[:deploy_to] = "/var/www/#{node[:server_name]}"
node.set[:rails_dir] = "#{node[:deploy_to]}/current"
node.set[:repo_dir] = "#{node[:deploy_to]}/repo.git"
node.set[:socket_dir] = "/var/run/#{node[:server_name]}"
node.set[:socket] = "#{node[:socket_dir]}/puma.sock"
# default from puma_config.rb, in puma cookbook
node.set[:puma_shared_dir] = "#{node[:deploy_to]}/shared/puma"

# First,we need to make sure the direct exists and has the right permissions
directory node[:deploy_to] do
  owner 'rails'
  group 'www-data'
  recursive true
end

# Here is where the sockets for nginx + unicorn will go
directory node[:socket_dir] do
  owner 'rails'
  group 'www-data'
  recursive true
end

# NGINX!

# this enables our site, kinda like a2ensite
execute 'enable-site' do
  command "ln -sf /etc/nginx/sites-available/#{node[:server_name]} /etc/nginx/sites-enabled/#{node[:server_name]}"
  notifies :restart, 'service[nginx]'
end

# Our configuration template. Take a look at templates/nginx.conf.erb to see what's going on. 
template "/etc/nginx/sites-available/#{node[:server_name]}" do
  source 'nginx.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :run, "execute[enable-site]", :immediately
  variables(
     server_name: node.server_name,
     socket: node[:socket],
     root: "#{node[:rails_dir]}/public"
   )
end

# now add the service and we're done. 
service 'nginx'


#
# Git stuff
#

# First,we need to make sure the direct exists and has the right permissions
directory node[:repo_dir] do
  owner 'rails'
  group 'www-data'
  recursive true
  action :create
end

bash 'createGitServer' do
  cwd node[:repo_dir]
  code <<-EOH
  git init --bare .
  git config --local --add receive.denyNonFastForwards true
  chown -R rails: .
  EOH
end

bash 'createGitWorkingTree' do
  code <<-EOH
  git clone #{node[:repo_dir]} #{node[:rails_dir]}
  chown -R rails: #{node.set[:rails_dir]}
  EOH
end

template "#{node[:repo_dir]}/hooks/post-receive" do
  source 'post-receive.erb'
  owner 'rails'
  group 'rails'
  mode 0755
  notifies :run, "execute[enable-site]", :immediately
  variables(
     workingTree: node[:rails_dir],
     pumaPhasedRestart: "#{node[:puma_shared_dir]}/puma_phased_restart.sh",
     pidFile: "#{node[:puma_shared_dir]}/app.pid"
  )
end


#
# Puma
#
puma_config "app" do
  directory node[:deploy_to]
  environment 'prodelopment'
  monit false
  thread_min 0
  thread_max 16
  workers 1
  bind "unix://#{node[:socket]}"
  owner 'rails'
  group 'www-data'
end
