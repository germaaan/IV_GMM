# Ejercicios 1:
### Instalar chef en la máquina virtual que vayamos a usar.

Primero hay que instalar **Ruby** y **Ruby Gems** en la máquina virtual.

```
sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems
```

![eje01_img01](imagenes/eje01_img01.png)

Ahora instalamos **chef** como una gema de Ruby, también instalamos de la misma manera **ohai** como complemento de chef.

```
sudo gem install ohai chef
```

![eje01_img02](imagenes/eje01_img02.png)
