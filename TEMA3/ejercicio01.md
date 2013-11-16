# Ejercicios 1:
### Instala LXC en tu versión de Linux favorita.

Instalamos LXC usando `sudo apt-get install lxc`.

![eje01_img01](imagenes/eje01_img01.png)

Antes de usar LXC deberemos comprobar si nuestro sistema está preparado para usar este tipo de tecnología y si está configurado correctamente, para ello ejecutamos `lxc-checkconfig`:

![eje01_img02](imagenes/eje01_img02.png)

Vemos que aparece **User namespace: missing**, por lo que comentan en un comentario de [este hilo](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1191600/comments/9) el motivo de esto es que en las últimas versiones del kernel no se ha incluido la opción de activar "CONFIG_USER_NS" en el archivo de configuración del kernel dentro del directorio **/boot** para poder usar los espacios de usuario, aunque esto no debería impedir que LXC funcionase.

Después de las comprobaciones, procedemos a crear el contenedor usando `sudo lxc-create -t ubuntu -n una-caja`, necesitando primero descargar todos los paquetes para crear el contenedor antes de instalarlo y configurarlo para que sea funcional.

![eje01_img03](imagenes/eje01_img03.png)

Una vez que el contenedor esté creado, nos indicará que el nombre de usuario y el password para acceder al mismo es **"ubuntu"**:

![eje01_img04](imagenes/eje01_img04.png)

Comprobamos que el contenedor se ha creado correctamente listando todos los contenedores creados con LXC en nuestro sistema (`sudo lxc-ls --fancy`):

![eje01_img05](imagenes/eje01_img05.png)

Y arrancamos dicho contenedor con `sudo lxc-start -n una-caja`, pidiéndonos ahora el terminal que introduzcamos el nombre de usuario y contraseña para acceder.

![eje01_img06](imagenes/eje01_img06.png)
