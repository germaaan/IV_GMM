# Ejercicio 10
### Instalar docker.

```
sudo apt-get update
sudo apt-get install linux-image-extra-`uname -r`
```

![eje10_img01](imagenes/eje10_img01.png)

```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
```

![eje10_img02](imagenes/eje10_img02.png)

```
sudo sh -c "echo deb http://get.docker.io/ubuntu docker main\ /etc/apt/sources.list.d/docker.list"
```

![eje10_img03](imagenes/eje10_img03.png)

```
sudo apt-get update
sudo apt-get install lxc-docker
```

![eje10_img04](imagenes/eje10_img04.png)

```
sudo docker -d &
```

![eje10_img05](imagenes/eje10_img05.png)
