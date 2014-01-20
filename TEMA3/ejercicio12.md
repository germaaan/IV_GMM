# Ejercicio 12
### Crear un usuario propio e instalar nginx en el contenedor creado de esta forma

Si iniciamos un seudo-terminal interactivo desde una imagen Ubuntu, podremos comprobar desde otro terminal que se ha creado un contenedor con dicha imagen.

```
sudo docker run -i -t ubuntu /bin/bash

sudo docker ps
```

![eje12_img01](imagenes/eje12_img01.png)

Una de las primeras cosas que vamos a hacer en nuestro contenedor es crear un usuario propio, al que le voy a dar el nombre de **usudocker**, además lo añadiré al grupo **sudo** para que pueda realizar tareas que necesitan permisos de administración, como puede ser instalar paquetes.

```
useradd -d /home/usudocker -m usudocker
passwd usudocker
adduser usudocker sudo
login usudocker
```

![eje12_img02](imagenes/eje12_img02.png)

Para instalar **nginx** primero hay que añadir su repositorio, como es un repositorio PPA, primero hay que instalar el siguiente paquete:

```
sudo apt-get install software-properties-common
```

![eje12_img04](imagenes/eje12_img03.png)

Ahora sí, añadimos el repositorio de **nginx**.

```
sudo add-apt-repository ppa:nginx/stable
```

![eje12_img05](imagenes/eje12_img04.png)

Y solo tenemos que actualizar la lista de paquetes e instalarlo.

```
sudo apt-get update
sudo apt-get install nginx
```

![eje12_img06](imagenes/eje12_img05.png)
