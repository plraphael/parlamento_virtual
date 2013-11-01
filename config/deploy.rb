require 'bundler/capistrano'
require 'sidekiq/capistrano'
require 'capistrano/ext/multistage'

set :stages, %w(production staging)
set :default_stage, 'staging'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :application, 'responsa'
set :repository,  $PATH_TO_GITHUB_REPO
set :deploy_to, "/var/www/#{application}"
set :branch, 'development'

set :scm, :git
set :scm_verbose, true

set :deploy_via, :remote_cache
set :use_sudo, true
set :keep_releases, 3
set :user, 'deployer'

set :bundle_without, [:development, :test, :acceptance]

set :rake, "#{rake} --trace"

set :default_environment, {
  'PATH' => '/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH'
}

after 'deploy:update_code', :upload_env_vars

after 'deploy:setup' do
  sudo "chown -R #{user} #{deploy_to} && chmod -R g+s #{deploy_to}"
end

namespace :deploy do
  desc <<-DESC
  Send a USR2 to the unicorn process to restart for zero downtime deploys.
  runit expects 2 to tell it to send the USR2 signal to the process.
  DESC
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "sv 2 /home/#{user}/service/#{application}"
  end
end

task :upload_env_vars do
  upload(".env.#{rails_env}", "#{release_path}/.env.#{rails_env}", :via => :scp)
end