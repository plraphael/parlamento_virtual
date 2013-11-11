Instalando em um Servidor
=========================

Antes
-----

É necessário ter um servidor ssh e chef client.

- Instalar pacote openssh-server
- Instalar Chef com o comando de http://www.opscode.com/chef/install/. Para Ubuntu 13.10 x86_64, o comando é

```sh
curl -L https://www.opscode.com/chef/install.sh | sudo bash
```

Deploy
------
```sh
cd catalog-kitchen
knife solo cook rails@parlamentovirtual.org
```

Após
----

É necessário subir a aplicação através do git e depois iniciar o puma.

- No cliente:

```sh
$ git remote add server ssh://rails@parlamentovirtual.org//var/www/parlamentovirtual.org/repo.git
$ git push server master
```
- No servidor (usuário rails):

```sh
$ rake db:mongoid:create_indexes
$ unix/start_server.sh
```

De agora em diante, para atualizar o site, basta:
```sh
$ git push server master
```
