# Ejercicios 5:
### Crear una máquina virtual Ubuntu e instalar en ella un servidor nginx para poder acceder mediante web.

Vamos a crear una máquina virtual en nuestra cuenta de Azure, la máquina virtual estará basada en una de las imágenes disponibles en dicha plataforma, por lo que primero vamos a listar todas las imágenes disponibles:

```
azure vm image list
```

![eje05_img01](imagenes/eje05_img01.png)

De entre todo el listado de imágenes nos interesa una que pertenezca a Ubuntu, por lo que vamos a elegir **"b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131215-en-us-30GB"** que pertenece a un **Ubuntu Server 13.10 de 64 bits**. Para conocer los detalles de esta imagen introducimos:

```
azure vm image show b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131215-en-us-30GB
```

![eje05_img02](imagenes/eje05_img02.png)

Procedemos con la creación de una máquina virtual a la que le damos un nombre (**germaaanbuntu**), indicamos la imagen a instalar (**azure vm create germaaanbuntu b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131215-en-us-30GB**), el nombre de usuario que además en esta máquina tendrá permisos de superusuario (**germaaan**), la contraseña del usuario (con una longitud de 8 caracteres, letras minúsculas, letras mayúsculas, números y al menos un caracter "especial"), la localización del servidor físico donde se almacenará (**--location "West Europe"** en nuestro caso por razones de seguridad) y que se pueda acceder mediante SSH (**--ssh**):

```
azure vm create germaaanbuntu b39f27a8b8c64d52b05eac6a62ebad85__Ubuntu-13_10-amd64-server-20131215-en-us-30GB germaaan PASSWORD --location "West Europe" --ssh
```

![eje05_img03](imagenes/eje05_img03.png)

Una vez que haya terminar de crearse la máquina virtual, aparecerá en nuestro listado de máquinas virtuales:

```
azure vm list
```

![eje05_img04](imagenes/eje05_img04.png)

Así que solo queda arrancarla:

```
azure vm start germaaanbuntu
```

![eje05_img05](imagenes/eje05_img05.png)

Como indicamos la opción de acceso mediante SSH, podremos acceder mediante realizando una conexión SSH indicando nuestro nombre de usuario y contraseña:

```
ssh germaaan@germaaanbuntu.cloudapp.net
```

![eje05_img06](imagenes/eje05_img06.png)

Pero por comodidad vamos a crear un par de llaves pública/privada para poder acceder directamente a nuestra máquina virtual en la nube desde nuestro ordenador sin tener que introducir una contraseña que ya hemos indicado que tiene que tener cierta complejidad. Así que en la máquina virtual creamos las claves SSH con `ssh-keygen -t rsa` y en el interior del archivo **"~/.ssh/authorized_keys"** copiamos el contenido de nuestra clave que se encuentra en el archivo **"~/.ssh/id_rsa.pub local"** (si no lo tenemos lo creamos igualmente con `ssh-keygen -t rsa`). Ya podemos acceder directamente a nuestra máquina virtual:

![eje05_img07](imagenes/eje05_img07.png)

Lo primero que deberiamos hacer por motivos de seguridad es actualizar los paquetes de nuestra máquina virtual, así que actualizamos la lista de paquetes:

```
sudo apt-get update
```

![eje05_img08](imagenes/eje05_img08.png)

Y aplicamos la actualizaciones existentes:

```
sudo apt-get upgrade
```

![eje05_img09](imagenes/eje05_img09.png)

Ahora ya instalamos **Nginx" para poder acceder vía web a nuestra máquina virtual:

```
sudo apt-get install nginx
```

![eje05_img10](imagenes/eje05_img10.png)

Vamos a moficiar la página de índice por defecto de Nginx para que muestre un mensaje personalizado, para lo que tenemos que modificar el archivo **"/usr/share/nginx/html/index.html"**. Seguramente Nginx esté parado, en cualquier caso podemos comprobar y arrancarlo:

```
sudo service nginx status
sudo service nginx start
```

![eje05_img11](imagenes/eje05_img11.png)

El servidor ya está funcionando, pero no estará accesible hasta que indiquemos un **extremo** a la máquina virtual, como no he encontrado la forma de hacerlo desde terminal, lo haré desde la página web de gestión de Azure. Lo único que tenemos que hacer es seleccionar nuestra máquina virtual de la página de máquinas virtuales accesible desde el panel de la izquierda, y entrar en la sección **"Extremos"**. Vemos que solo está activado el acceso mediante SSH que indicamos cuando creamos la máquina virtual:

![eje05_img12](imagenes/eje05_img12.png)

Pulsamos el botón **"Añadir"** de la parte inferior y nos aparecerá la ventana para agregar nuevos extremos. Seleccionamos la opción **"Agregar extremo independiente"**:

![eje05_img13](imagenes/eje05_img13.png)

Especificamos los detalles del extremo a crear, como queremos que sea un acceso web en nombre indicamos **"HTTP"**, protocolo **"TCP"** y puertos tanto público como privado el **"80"**.

![eje05_img14](imagenes/eje05_img14.png)

Comprobamos que se ha añadido un nuevo extremo **"HTTP"** a nuestra máquina virtual:

![eje05_img15](imagenes/eje05_img15.png)

Así que solo nos queda comprobar que la dirección [http://germaaanbuntu.cloudapp.net](http://germaaanbuntu.cloudapp.net) es accesible y muestra nuestra página de inicio personalizada.

![eje05_img16](imagenes/eje05_img16.png)
