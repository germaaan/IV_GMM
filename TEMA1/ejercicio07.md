# Ejercicios 7:
### 1. Crear diferentes grupos de control sobre un sistema operativo Linux. Ejecutar en uno de ellos el navegador en otro un procesador de textos y en uno último cualquier otro proceso. Comparar el uso de recurso de unos y otros durante un tiempo determinado.

Para esta tarea vamos a usar el paquete `cgroup-bin` ya que nos simplificará mucho el proceso. Lo primero es crear el grupo de control para gestionar los recursos sobre nuestro usuario para poder trabajar con él, esto lo hacemos con `sudo cgcreate -t germaaan:germaaan -a germaaan:germaaan -g memory,cpuacct:ejercicio`. Ahora creamos un subgrupo por cada una de las aplicaciones a controlar, en nuestro caso el navegador Firefox, el procesador de texto Gedit y el reproductor de audio Rhythmbox; para ello usamos los siguientes comandos:
```
sudo cgcreate -t germaaan:germaaan -a germaaan:germaaan -g memory,cpuacct:ejercicio/navegador
sudo cgcreate -t germaaan:germaaan -a germaaan:germaaan -g memory,cpuacct:ejercicio/procesador_texto
sudo cgcreate -t germaaan:germaaan -a germaaan:germaaan -g memory,cpuacct:ejercicio/reproductor_audio
```

Y procedemos a la ejecución de los subgrupos de control con: 
```
sudo cgexec -g memory,cpuacct:ejercicio/navegador firefox
sudo cgexec -g memory,cpuacct:ejercicio/procesador_texto gedit
sudo cgexec -g memory,cpuacct:ejercicio/reproductor_audio rhythmbox
```

Lo único que nos quedaría es revisar los resultados en los ficheros de cada uno de los subgrupos, concretamente los valores de "memory.max_usage_in_bytes", que nos indica la memoria usada en bytes, y "cpuacct.usage", que nos indica el tiempo de CPU consumido en nanosegundos. Los resultados obtenidos son los siguientes:

### "memory.max_usage_in_bytes":
* Firefox:	268832768
* Gedit: 	26165248
* Rhythmbox: 	49115136

### "cpuacct.usage":
* Firefox: 	123615242184
* Gedit: 	3069603838
* Rhythmbox: 	12550582980

Como era de esperar, el navegador es el que más recursos necesita tanto de memoria como de procesador, aunque siendo mucho más alto el tiempo de procesador en proporción a los otros dos procesos.
