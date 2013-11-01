Antes do deploy:
- Instalar openssh
- Instalar chef com o comando de http://www.opscode.com/chef/install/

Deploy:
- knife solo cook user@server

Após
- cat ~/.ssh/id_rsa.pub | ssh user@server.com "sudo sshcommand acl-add dokku progrium"
