# Ejercicios 2:
### Usando las tablas de precios de servicios de alojamiento en Internet y de proveedores de servicios en la nube. Comparar el coste durante un año de un ordenador con un procesador estándar (escogerlo de forma que sea el mismo tipo de procesador en los dos vendedores) y con el resto de las características similares (tamaño de disco duro equivalente a transferencia de disco duro) si la infraestructura comprada se usa sólo el 1% o el 10% del tiempo.

Para comparar precios sobre servicio de alojamiento en Internet hemos consultado los precios de dos plataformas diferentes de hosting [“1&1 Hosting”](http://www.1and1.es/hosting-linux) y [“Hostalia”](http://www.hostalia.com/alojamiento/planes-hosting-base.html). El primero nos ofrece en su plan más básico una capacidad de 10 GB de espacio en disco por un precio de 2’99€/mes, el segundo nos ofrece 5GB de disco duro a 8’25€/mes. En los proveedores de servicios en la nube hemos seleccionado [“Amazon EC2”](http://aws.amazon.com/es/ec2/pricing/) y [“Windows Azure”](http://www.windowsazure.com/es-es/pricing/details/cloud-services/), en este tipo de proveedores lo general es que se tarife el precio del servicio según horas de uso, así tenemos que para lo descrito en ambas plataformas como una “instancia pequeña estándar”, en el primero (funcionando bajo RHEL) tiene un costo de 0’088€/hora y en el segundo de 0’044€/hora.

Como la infraestructura será usada durante el 1% o 10% del año por el que ha sido adquirida, esto significara que el tiempo de uso será de 87’6 horas u 876 horas (365 días del año por 24 horas de cada día, hacen un total de 8760 horas).

Para las plataformas de hosting, independientemente del uso dado a la infraestructura, el precio es cerrado por meses, pero en los proveedores de la nube si tenemos que calcular el coste producido por dicho uso, así que el resultado de la comparativa sería.

* **1&1 Hosting: 12 meses por 2’99€/mes = 35’88€**
* **Hostalia: 12 meses por 8’25€/mes = 99€**
* **Amazon EC2: 87’6 horas por 0’088€/hora = 7’71€**
* **Amazon EC2: 876 horas por 0’088€/hora = 77’09**
* **Windows Azure: 87’6 horas por 0’044€/hora = 3’85€**
* **Windows Azure: 876 horas por 0’044€/hora = 38’54€**

Como podemos observar, si nuestro uso de la infraestructura es muy poco, hay una gran diferencia entre usar servicios en la nube y servicios de alojamiento, teniendo el primero un precio mucho más competitivo, según aumente las horas de funcionamiento el precio en ambas alternativas se va equiparando más, por lo que la decisión la deberemos tomar en función del uso que vayamos a darle a dicha infraestructura.
