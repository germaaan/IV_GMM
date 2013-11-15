# Ejercicios 8:
### 2. Implementar usando el fichero de configuración de cgcreate una política que dé menos prioridad a los procesos de usuario que a los procesos del sistema (o viceversa).

El fichero de configuración de cgcreate es "/etc/cgconfig.conf", pero para poder realizar esta configuración de forma permanente, debemos tener instalado el paquete "libcgroup" si usamos una distribución basada en Red Hat o "libcgroup-dev" si usamos una basa en Debian.

Para modificar la prioridad del proceso según su grupo tendremos que utilizar el parámetro "cpu.shares", por lo que al principio del fichero de configuración deberemos indicar donde está montado el subsistema de cgroup, que para el caso de nuestra gestión de la cpu será "cpu = /sys/fs/cgroup/cpu".

Ahora tenemos que definir un grupo para procesos de usuario (al que llamaremos "user_proc") y otro grupo para procesos de sistema (con el nombre "sys_proc"), indicando que los procesos de usuario tendrán un prioridad del 30% frente a los procesos del sistema que tendrán una prioridad del 70%; como el valor total de "cpu.shares" es 1024, fijaremos un valor de 307 para procesos de usuario y 717 para procesos de sistema, quedando el fichero con el siguiente contenido:

```
mount {
   cpu = /sys/fs/cgroup/cpu;
}

group user_proc {
    cpu {
        cpu.shares = "307";
    }
}

group sys_proc {
    cpu {
        cpu.shares = "717";
    }
}
```
Lo siguiente será modificar el archivo "/etc/cgrules.conf" para definir las reglas usadas por el demonio "cgrulesengd" para mover los procesos a su cgroup especifico, por ejemplo todos los procesos ejecutados por mi usuario (germaaan) pertenecerán al grupo "user_proc" y todos los procesos ejecutados por root pertenecerán al grupo "sys_proc"; para ello el fichero quedará de la siguiente forma:
```
#<usuario/grupo>    <controlador(es)>    <cgroup>
germaaan            cpu                  user_proc
root                cpu                  sys_proc
```

Para finalizar, solo nos falta crear la jerarquía de cgroup y establecer los parámetros definidos, lo que hacemos con 'sudo service cgconfig start'; e iniciar el servicio cgred para que arranque el demonio cgrulesengd y busque los procesos a los que aplicar las reglas definidas en el archivo "/etc/cgrules.conf".

### 3. Usar un programa que muestre en tiempo real la carga del sistema tal como htop y comprobar los efectos de la migración en tiempo real de una tarea pesada de un procesador a otro (si se tiene dos núcleos en el sistema).

### 4. Configurar un servidor para que el servidor web que se ejecute reciba mayor prioridad de entrada/salida que el resto de los usuarios.

Para realizar esta configuración deberemos modificar otra vez el archivo "/etc/cgconfig.conf", y está vez tendremos que usar el parámetro "blkio.weight", por lo que tendremos que indicar donde se encuentra el controlador del bloqueo de entrada/salida, en nuestro caso será "blkio = /sys/fs/cgroup/blkio".

Ahora tendremos que crear un grupo para los servidores al que llamaremos "servers" y dentro del cual indicaremos que le vamos a dar un prioridad mayor de entrada/salida que al resto de usuarios, los valores posibles para este parámetro van de un rango desde 100 hasta 1000, así que para que el los servidores tengan bastante más prioridad le vamos a dar un "peso" de 700. El archivo de configuración quedaría: 


```
mount {
   blkio = /sys/fs/cgroup/blkio;
}

group servers {
    blkio {
        blkio.weight = "700";
    }
}
```
Ejecutamos 'sudo service cgconfig start', para crear la jerarquía de cgroup y establecer los parámetros definidos. Si el servidor que tenemos funcionando es un servidor Apache, deberemos añadir la directiva de configuración 'CGROUP_DAEMON="blkio:/http"' al fichero de configuración "/etc/apache2/apache2.conf" para que el servidor tenga conocimiento de que pertenece a un grupo de control, algo similar a las reglas que definimos en el archivo "/etc/cgrules.conf" para que un proceso fuera movido a su grupo correspondiente.
