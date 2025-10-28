#!/bin/bash
set -e

# Evitar que el sistema pida confirmaciones
export DEBIAN_FRONTEND=noninteractive

echo "===== Actualizando paquetes ====="
apt-get update -y

echo "===== Instalando PostgreSQL ====="
apt-get install -y postgresql postgresql-contrib

echo "===== Configurando PostgreSQL para aceptar conexiones externas ====="
PG_VERSION=$(ls /etc/postgresql | head -n 1)
PG_CONF="/etc/postgresql/${PG_VERSION}/main/postgresql.conf"
PG_HBA="/etc/postgresql/${PG_VERSION}/main/pg_hba.conf"

# Escuchar en todas las direcciones IP
sed -i "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/g" "$PG_CONF"

# Permitir acceso desde la red privada (192.168.56.0/24)
echo "host    all             all             192.168.56.0/24          md5" >> "$PG_HBA"

echo "===== Reiniciando PostgreSQL ====="
systemctl restart postgresql

echo "===== Creando base de datos y usuario ====="
sudo -u postgres psql -c "CREATE DATABASE taller;" || true
sudo -u postgres psql -c "CREATE USER webuser WITH PASSWORD 'webpass';" || true
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE taller TO webuser;"

echo "===== Creando tabla y d

