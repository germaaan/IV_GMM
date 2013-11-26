# Ejercicios 5:
### Comparar las prestaciones de un servidor web en una jaula y el mismo servidor en un contenedor. Usar nginx.

Para comparar las prestaciones vamos a usar una jaula y un contenedor con el mismo sistema instalado, **Ubuntu 13.10 64 bits**. Antes de realizar las pruebas vamos a comprobar que el servidor **nginx** funciona correctamente en ambos sistemas. Aunque no sea necesario, vamos a modificar la página de inicio por defecto para personalizarla, el archivo a editar se encuentra en **/usr/share/nginx/html/index.html**. Ahora comprobamos que el servidor está ejecutándose en ambos sistemas (`service nginx status`).

* Vemos que está ejecutándose en la jaula: 
![eje05_img01](imagenes/eje05_img01.png)

* Vemos que también está ejecutándose en el contenedor:
![eje05_img02](imagenes/eje05_img02.png)

La jaula tiene la misma dirección IP que el sistema anfitrión, pero cuando creamos un contenedor con LXC este crea una interfaz virtual para el contenedor con su propia dirección IP, así que comprobamos cual es la dirección del contenedor (`ifconfig`, la dirección es **"10.0.3.45"**).

![eje05_img03](imagenes/eje05_img03.png)

Ya solo nos queda comprobar que los servidores funcione correctamente, así que desde el navegador de nuestro sistema accedemos a la dirección de ambos servidores.

* Para acceder al servidor instalado dentro del contenedor introducimos la dirección **"http://10.0.3.45/"**:
![eje05_img04](imagenes/eje05_img04.png)

* Para acceder al servidor instalado dentro de la jaula introducimos la dirección **"http://127.0.0.1/"**:
![eje05_img05](imagenes/eje05_img05.png)

Ambos servidores funcionan correctamente, por lo que vamos a medir las prestaciones de los mismos. Para realizar la medición vamos a usar la aplicación **"ab"** (Apache Benchmark), una utilidad muy sencilla que nos permite hacer pruebas de carga a cualquier tipo de servidor web. Para usarlo hay que indicar un número de conexiones a realizar y la concurrencia con la que se realizarán las mismas, para que los resultados sean más fiables vamos a realizar el test a cada servidor unas 10 veces. El número de conexiones será X y el la concurrencia será Y... (continuar)
