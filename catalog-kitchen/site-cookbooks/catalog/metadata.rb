name             'catalog'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures catalog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'openssh', '~> 1.1.4'
depends 'user', '~> 0.3.0'
depends 'nginx'
depends 'simple_iptables', '~> 0.2.4'
depends 'rvm'
depends 'fail2ban'
depends 'apt'
depends 'build-essential'
depends 'memcached'
depends 'puma'
