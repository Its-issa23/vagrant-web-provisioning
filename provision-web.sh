#!/bin/bash
set -e

# Evita que el sistema pida confirmaciones durante la instalación
export DEBIAN_FRONTEND=noninteractive

echo "===== Actualizando paquetes ====="
apt-get update -y

echo "===== Instalando Apache y PHP ====="
apt-get install -y apache2 php libapache2-mod-php php-pgsql

echo "===== Habilitando y arrancando Apache ====="
systemctl enable apache2
systemctl start apache2

echo "===== Copiando archivos del sitio web ====="
# Limpia la carpeta por defecto y copia tus archivos de /vagrant/www (carpeta compartida)
rm -rf /var/www/html/*
cp -r /vagrant/www/* /var/www/html/
chown -R www-data:www-data /var/www/html

echo "===== Reiniciando Apache ====="
systemctl restart apache2

echo "===== Provisionamiento WEB completado ====="
