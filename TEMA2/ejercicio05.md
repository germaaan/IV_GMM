# Ejercicios 5:
### Instalar una jaula chroot para ejecutar el servidor web de altas prestaciones nginx.

Seguimos dentro de la jaula que estábamos usando en el ejercicio anterior, vamos a instalar `nginx`, pero como estamos en un entorno de terminal, para comprobar que funciona vamos a instalar también el navegador desde línea de comandos `curl`.

Para poder instalar `nginx` mediante `apt` primero tendremos que descargarnos la llave de su repositorio (`wget http://nginx.org/keys/nginx_signing.key`) y luego añadir la dirección del mismo (`echo "deb http://nginx.org/packages/ubuntu/ raring nginx" >> /etc/apt/sources.list` `echo "deb-src http://nginx.org/packages/ubuntu/ raring nginx" >>  /etc/apt/sources.list`:

![ejer05_img01](https://dl.dropboxusercontent.com/s/p261r1rir4d14qe/ejer05_img01.png)

Ahora simplemente tenemos que actualizar (`apt-get update`) e instalar los paquetes necesarios (`apt-get install nginx curl`):

![ejer05_img02](https://dl.dropboxusercontent.com/s/nek5gr0z430wrv2/ejer05_img02.png)

Comprobamos si `nginx` está funcionando (`service nginx status`) y lo arrancamos en caso de que esté parado (`service nginx start`). Si tuviéramos otro servidor funcionando en ese momento en el sistema que además estuviera usando el mismo puerto ("80" en este caso), obtendremos el error que vemos en pantalla de que la dirección por defecto que usa `nginx` ya está en uso; como suponemos que el otro servidor es un servidor `apache`, buscamos si hay alguno ejecutándose en este momento (`ps aux | grep apache`) y matamos las aplicaciones que obtengamos (`kill -9 1586 1589 1590`). Ya podemos arrancar `nginx` sin ningún problema y comprobar que está funcionando con el navegador `curl localhost`:

![ejer05_img03](https://dl.dropboxusercontent.com/s/pxlexfv78au0e17/ejer05_img03.png)
