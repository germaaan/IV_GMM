# Ejercicios 2:
### Mostrar los puentes configurados en el sistema operativo.

Para mostrar los puentes configurados usamos el comando `sudo brctl show`.

![eje02_img01](imagenes/eje02_img01.png)

### Crear un interfaz virtual y asignarlo al interfaz de la tarjeta wifi, si se tiene, o del fijo, si no se tiene.

Creamos un interfaz virtual (`sudo brctl addbr interfazprueba`) y comprobamos que se ha creado (`ip addr show`).

![eje02_img02](imagenes/eje02_img02.png)

Buscamos la interfaz "interfazprueba" que acabamos de crear en la salida.

![eje02_img03](imagenes/eje02_img03.png)

Asignamos esa interfaz a la primera interfaz de red cableada (eth0), volvemos a usar `sudo brctl show` para comprobar que la interfaz "interfazprueba" está asignada a la interfaz "eth0".

![eje02_img04](imagenes/eje02_img04.png)
