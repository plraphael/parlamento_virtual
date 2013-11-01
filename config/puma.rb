environment "production"
threads 8, 32
bind "unix:///var/run/parlamentovirtual.org/puma.sock"
workers 10
preload_app!
