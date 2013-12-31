# Ejercicios 3:
### Crear un benchmark de velocidad de entrada salida y comprobar la diferencia entre usar paravirtualización y arrancar la máquina virtual simplemente con `qemu-system-x86_64 -hda /media/Backup/Isos/discovirtual.img`

Para medir la velocidad de entrada salida voy a usar un scrip parecido al que usé en el ejercicio 4 del tema 4. El código del script sería:

```
#!/bin/bash

TIMEFORMAT='%2R'

if [ $# -lt 1 ]; then
    echo -e "\nError: número de argumentos inválido. Uso: $0 archivo\n"
    exit 1
fi

time1+=$( { time `cp $1 $1_2`; } 2>&1 )
vel1=$( bc <<<"scale=2; 200/$time1" )

echo -e "\nResultados operaciones entrada/salida: $time1 segundos, $vel1 MB/s"
echo -e "=====================================\n"
```

También creamos 1 archivo de 200MB que será el que usemos:

```
dd if=/dev/urandom of=archivo bs=191 count=1048576
```

Primero arrancamos la máquina sin usar paravirtualización de la entrada/salida:



Arrancamos la máquina ahora con la paravirtualización 
