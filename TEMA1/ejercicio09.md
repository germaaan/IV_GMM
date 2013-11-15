# Ejercicios 9:
### Comprobar si el procesador o procesadores instalados lo tienen. ¿Qué modelo de procesador es? ¿Qué aparece como salida de esa orden?

El modelo de procesador es "Intel(R) Core(TM) i5-2450M". Como podemos ver como resultado de la salida del comando 'egrep '^flags.*(vmx|svm)' /proc/cpuinfo', el flag "vmx" se encuentra entre todos los flag del procesador, por lo que sabemos que el procesador usa tecnología de virtualización a nivel de hardware.

![eje09_img01](imagenes/eje09_img01.png)
