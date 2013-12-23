# Ejercicios 1:
### Instalar los paquetes necesarios para usar KVM. Se pueden seguir estas instrucciones. Ya lo hicimos en el primer tema, pero volver a comprobar si nuestro sistema está preparado para ejecutarlo o hay que conformarse con la paravirtualización.

Instalamos los paquetes necesarios para usar **KVM**, aunque en este caso solo necesitaremos instalar **qemu-kvm** porque **libvirt-bin** y **virtinst** ya los instalamos en una ocasión anterior:

```
sudo apt-get install qemu-kvm libvirt-bin virtinst
```

Comprobamos que nuestro sistema está preparado para ejecutar VKM y no es necesario utilizar paravirtualización:

```
$ kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
```
