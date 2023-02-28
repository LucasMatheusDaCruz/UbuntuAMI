#!/bin/bash

echo "Criando diretórios e definindo proprietário como root"
sudo mkdir /publico /adm /ven /sec
sudo chown root:root /publico /adm /ven /sec

echo "Criando grupos"
sudo groupadd GRP_ADM
sudo groupadd GRP_VEN
sudo groupadd GRP_SEC

echo "Criando usuários e adicionando aos grupos correspondentes"
sudo useradd -m -s /bin/bash Carlos && sudo usermod -a -G GRP_ADM Carlos
sudo useradd -m -s /bin/bash Maria && sudo usermod -a -G GRP_ADM Maria
sudo useradd -m -s /bin/bash Joao && sudo usermod -a -G GRP_ADM Joao
sudo useradd -m -s /bin/bash Debora && sudo usermod -a -G GRP_VEN Debora
sudo useradd -m -s /bin/bash Sebastiana && sudo usermod -a -G GRP_VEN Sebastiana
sudo useradd -m -s /bin/bash Roberto && sudo usermod -a -G GRP_VEN Roberto
sudo useradd -m -s /bin/bash Josefina && sudo usermod -a -G GRP_SEC Josefina
sudo useradd -m -s /bin/bash Amanda && sudo usermod -a -G GRP_SEC Amanda
sudo useradd -m -s /bin/bash Rogerio && sudo usermod -a -G GRP_SEC Rogerio

echo "Definindo permissões de diretórios e grupos"
sudo chmod 777 /publico
sudo chmod 770 /adm /ven /sec
sudo setfacl -m g:GRP_ADM:rwx /adm
sudo setfacl -m g:GRP_VEN:rwx /ven
sudo setfacl -m g:GRP_SEC:rwx /sec

echo "Definindo permissões de acesso aos diretórios dos grupos"
sudo setfacl -R -m u:Carlos:rwx,u:Maria:rwx,u:Joao:rwx /publico /adm
sudo setfacl -R -m u:Debora:rwx,u:Sebastiana:rwx,u:Roberto:rwx /publico /ven
sudo setfacl -R -m u:Josefina:rwx,u:Amanda:rwx,u:Rogerio:rwx /publico /sec
