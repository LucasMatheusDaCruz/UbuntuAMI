#!/bin/bash

# Criando diretórios
sudo mkdir /publico /adm /ven /sec

# Definindo proprietário dos diretórios como root
sudo chown root:root /publico /adm /ven /sec

# Criando grupos
sudo groupadd GRP_ADM
sudo groupadd GRP_VEN
sudo groupadd GRP_SEC

# Criando usuários
sudo useradd -m -s /bin/bash Carlos
sudo useradd -m -s /bin/bash Maria
sudo useradd -m -s /bin/bash Joao
sudo useradd -m -s /bin/bash Debora
sudo useradd -m -s /bin/bash Sebastiana
sudo useradd -m -s /bin/bash Roberto
sudo useradd -m -s /bin/bash Josefina
sudo useradd -m -s /bin/bash Amanda
sudo useradd -m -s /bin/bash Rogerio

# Adicionando usuários aos grupos correspondentes
sudo usermod -a -G GRP_ADM Carlos
sudo usermod -a -G GRP_ADM Maria
sudo usermod -a -G GRP_ADM Joao
sudo usermod -a -G GRP_VEN Debora
sudo usermod -a -G GRP_VEN Sebastiana
sudo usermod -a -G GRP_VEN Roberto
sudo usermod -a -G GRP_SEC Josefina
sudo usermod -a -G GRP_SEC Amanda
sudo usermod -a -G GRP_SEC Rogerio

# Definindo permissões de diretórios
sudo chmod 777 /publico
sudo chmod 770 /adm
sudo chmod 770 /ven
sudo chmod 770 /sec

# Definindo permissões de acesso aos diretórios dos grupos
sudo setfacl -m g:GRP_ADM:rwx /adm
sudo setfacl -m g:GRP_VEN:rwx /ven
sudo setfacl -m g:GRP_SEC:rwx /sec

# Definindo permissões de acesso para que usuários não possam acessar diretórios de outros grupos
sudo setfacl -R -m u:Carlos:rwx /publico /adm
sudo setfacl -R -m u:Maria:rwx /publico /adm
sudo setfacl -R -m u:Joao:rwx /publico /adm
sudo setfacl -R -m u:Debora:rwx /publico /ven
sudo setfacl -R -m u:Sebastiana:rwx /publico /ven
sudo setfacl -R -m u:Roberto:rwx /publico /ven
sudo setfacl -R -m u:Josefina:rwx /publico /sec
sudo setfacl -R -m u:Amanda:rwx /publico /sec
sudo setfacl -R -m u:Rogerio:rwx /publico /sec
