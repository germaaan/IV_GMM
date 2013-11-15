# Ejercicios 3:
### Crear un programa simple en cualquier lenguaje interpretado para Linux, empaquetarlo con CDE y probarlo en diferentes distribuciones.

Como programa simple vamos a crear un básico “Hola mundo” en BASH al que llamaremos `hola_mundo.sh`:
```
#!/bin/bash
echo "hola mundo"
```

Damos permisos de ejecución sobre el archivo con el comando `chmod u+x hola_mundo.sh`.

Ahora necesitamos obtener CDE, para ello nos bajaremos su codigo fuente directamente desde su repositorio público de GitHub usando `git` y después lo instalamos.

Con `git` clonamos el directorio con el comando `git clone git://github.com/pgbovine/CDE.git`,  una vez descargado entramos en el directorio "CDE" y generamos la aplicación con `make`. 

Para empaquetar el programa desde el directorio "CDE" usamos el comando `./cde ./hola_mundo.sh` (previamente habiendo copiado el programa al directorio actual).

Solo nos queda empaquetar como un archivo "tar.gz" (o el formato de comprensión que prefiramos) los archivos generados en el anterior paso, que serán los que se encuentre en el directorio "cde-package". Si usamos el formato "tar.gz" comprimiremos usando `tar czvf hola_mundo.tar.gz cde-package/` y descromprimiremos usando `tar xzvf hola_mundo.tar.gz`.

Para ejecutar el programa con CDE deberemos introducir la ruta hasta el archivo `hola_mundo.sh.cde` (en nuestro caso: `cde-package/cde-root/home/germaaan/CDE/hola_mundo.sh.cde`), que será el que llame al programa `cde-exec` y ejecutará el programa que hemos empaquetado con CDE (el `hola_mundo.sh` original).
