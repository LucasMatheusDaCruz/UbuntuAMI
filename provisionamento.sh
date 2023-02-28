#!/bin/bash

# Atualiza o servidor
echo "Atualizando o servidor..."
sudo apt-get update && sudo apt-get upgrade -y

# Instala o Apache2 e o Unzip
echo "Instalando Apache2 e Unzip..."
sudo apt-get install apache2 unzip -y

# Baixa a aplicação e descompacta no diretório /tmp
echo "Baixando e descompactando a aplicação..."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -P /tmp/
sudo unzip /tmp/main.zip -d /tmp/

# Copia os arquivos da aplicação para o diretório padrão do Apache
echo "Copiando arquivos para o diretório do Apache..."
sudo cp -r /tmp/linux-site-dio-main/* /var/www/html/

# Reinicia o Apache
echo "Reiniciando o Apache..."
sudo service apache2 restart
