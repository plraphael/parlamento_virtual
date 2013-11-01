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

# First,we need to make sure the direct exists and has the right permissions
directory "#{node[:deploy_to]}" do
  owner 'rails'
  group 'www-data'
  recursive true
end

# Here is where the  sockets  for nginx + unicorn will go
directory "/var/run/#{node[:server_name]}" do
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
     server_name: node.server_name
   )
end


# now add the service and we're done. 
service 'nginx'


execute  "apt-get update; apt-get upgrade; apt-get clean"
