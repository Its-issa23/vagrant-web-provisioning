# Taller: Vagrant con Provisionamiento (Shell)

## Resumen
Proyecto de práctica para levantar 2 VMs con Vagrant:
- web (Apache + PHP)
- db (PostgreSQL)

## Archivos principales
- Vagrantfile
- provision-web.sh
- provision-db.sh
- www/index.html
- www/info.php

## Instrucciones de uso
1. Clonar repo:
   `git clone <repo-url>`
2. Entrar al directorio y levantar VMs:
   `vagrant up`
3. Acceder a:
   - Web: http://192.168.56.10/
   - Info PHP: http://192.168.56.10/info.php

## Scripts
- `provision-web.sh` instala Apache, PHP, copia archivos en `/var/www/html`.
- `provision-db.sh` instala PostgreSQL, configura acceso en la red privada, crea DB `taller` y user `webuser`.

## Capturas
(image.png)(image-1.png)

## Credenciales (para pruebas)
- PostgreSQL user: `webuser`
- PostgreSQL password: `webpass`
- DB: `taller`
