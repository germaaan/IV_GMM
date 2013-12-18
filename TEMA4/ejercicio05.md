# Ejercicios 5:
### Instalar ceph en tu sistema operativo.

Para instalar todos los paquetes que necesitamos para usar **Ceph** podemos instalar el servidor de metadatos de Ceph (**ceph-mds**) y así se instalarán todas sus dependencias, entre las que podemos destacar el propio **ceph** y las utilidades comunes para montar e interactuar con un sistema de archivos Ceph (**ceph-fs-common** y **ceph-common**):

```
sudo apt-get install ceph-mds
```

![eje05_img01](imagenes/eje05_img01.png)
