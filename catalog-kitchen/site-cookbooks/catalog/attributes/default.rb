# site-cookbooks/catalog/attributes/default.rb.

#
# This is a big long boring list of attributes that the recipes will use.
# To find all the options that are available to you, you'll have to look at the recipe's documentation.
# If you're following along at home, make this file and paste in the values you see from Github.
# We'll be coming back to these as we run through our recipes.
#

# sets the ruby version to be installed by RVM. note that I'm making a gemset for the rails application.
default.rvm.default_ruby = "ruby-2.0.0-p247"
default.rvm.user_installs = [
  { 'user'          => 'rails',
    'default_ruby'  => 'ruby-2.0.0-p247'
  }
]

# some default packages we want to install
default.packages = %w(vim git htop mongodb)

# Users
default.users = ['ubuntu', 'rails']
default.user.ssh_keygen = false

# SSH
default.openssh.server.permit_root_login = 'no'
default.openssh.server.password_authentication = 'no'
default.openssh.server.allow_groups = 'sudo'
default.openssh.server.login_grace_time = '30'
default.openssh.server.use_p_a_m = 'no'
default.openssh.server.print_motd = 'no'

# nginx
default.nginx.init_style = "runit"
default.nginx.default_site_enabled = false

# our Java variables
default.java.jdk_version = "7"
