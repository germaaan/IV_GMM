# Ejercicios 8:
### Tras crear la cuenta de Azure, instalar las [herramientas de línea de órdenes (Command line interface, cli) del mismo](http://www.windowsazure.com/en-us/manage/install-and-configure-cli/) y configurarlas con la cuenta Azure correspondiente

Vamos a instalar **Windows Azure Cross-Platform Command-Line Interface**, pero antes es necesario instalar **Node.js**, por lo que añadimos el repositorio desde el que podemos instalar el paquete **nodejs**:

```
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
```

![eje08_img01](imagenes/eje08_img01.png)

E instalamos **Node.js**:

```
sudo apt-get install nodejs
```

![eje08_img02](imagenes/eje08_img02.png)

Ahora para instalar **Windows Azure Cross-Platform Command-Line Interface** he tenido problemas para instalarlo como se indica en el enlace del enunciado, así que he descargado el archivo con fuentes del mismo desde [aquí](http://az412849.vo.msecnd.net/downloads02/windowsazure-cli.0.7.4.tar.gz). Creamos una nueva carpeta, movemos el archivo dentro y los descomprimimos:

```
mkdir azure
cd azure
wget http://az412849.vo.msecnd.net/downloads02/windowsazure-cli.0.7.4.tar.gz
tar -xzf windowsazure-cli.0.7.4.tar.gz
```

![eje08_img03](imagenes/eje08_img03.png)

Hacemos las comprobaciones previas a la instalación, que en este caso es comprobar que **Node.js** y **Npm** están instalados:

```
./configure
```

![eje08_img04](imagenes/eje08_img04.png)

Y finalmente comenzamos la instalación:

```
sudo make install
```

![eje08_img05](imagenes/eje08_img05.png)

Una vez que tenemos **Azure** instalado, lo primero será descargar la configuración de publicación para mi cuenta, introduciendo el comando `azure account download` debería abrirse el navegador por defecto cargando la dirección `http://go.microsoft.com/fwlink/?LinkId=254432`, en mi caso no ha sido así por lo que he abierto manualmente el navegador e introducido la dirección. Después de introducir nuestro nombre de usuario y contraseña para iniciar sesión en Azure, automáticamente se descargará nuestro archivo de configuración que en mi caso se llama **Azpad245GZK8973-12-23-2013-credentials.publishsettings**, ya solo nos quedá importarlo y después borrarlo por seguridad:

```
azure account download
azure account import ~/Azpad245GZK8973-12-23-2013-credentials.publishsettings
rm ~/Azpad245GZK8973-12-23-2013-credentials.publishsettings
```

![eje08_img06](imagenes/eje08_img06.png)

Comprobamos que la cuenta ha sido importada correctamente:

```
azure account list
```

![eje08_img07](imagenes/eje08_img07.png)

Ahora creamos una cuenta de almacenamiento que como medida de precaución vamos a seleccionar que se almacene en **Europa Occidental/ West Europe**. Además necesitaremos las claves de la cuenta de almacenamiento, que una vez obtenidas vamos a almacenar en las variables de entorno **$AZURE_STORAGE_ACCOUNT** y **$AZURE_STORAGE_ACCESS_KEY**:

```
azure account storage create germaaan
azure account storage keys list germaaan
export AZURE_STORAGE_ACCOUNT=germaaan
export AZURE_STORAGE_ACCESS_KEY=CLAVE_ACCESO_ALMACENAMIENTO
echo $AZURE_STORAGE_ACCOUNT
echo $AZURE_STORAGE_ACCESS_KEY
```

![eje08_img08](imagenes/eje08_img08.png)

Esta cuenta de almacenamiento que acabamos de crear aparecerá igualmente reflejada en el panel de control de la web de Windows Azure:

![eje08_img09](imagenes/eje08_img09.png)
