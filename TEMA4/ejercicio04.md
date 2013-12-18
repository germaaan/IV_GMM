# Ejercicios 4:
### Crear uno o varios sistema de ficheros en bucle usando un formato que no sea habitual (xfs o btrfs) y comparar las prestaciones de entrada/salida entre sí y entre ellos y el sistema de ficheros en el que se encuentra, para comprobar el overhead que se añade mediante este sistema

Para crear los sistemas de ficheros en bucle, primero generamos los archivos de imagen que convertiremos en los dispositivos en bluce:

```
qemu-img create -f raw xfs_1.img 100M
qemu-img create -f raw xfs_2.img 100M
```
