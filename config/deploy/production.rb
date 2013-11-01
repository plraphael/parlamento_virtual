set :server_ip, fabsn.dyndns.ath.cx
server server_ip, :app, :wep, :primary => true
set :rais_env, 'production'
set :branch, 'master'
