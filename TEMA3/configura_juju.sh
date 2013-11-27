#!/bin/bash
# Script para autoconfigurar juju con mysql y mediawiki en cualquier máquina

# Inicializar el entorno de juju
juju init
# Seleccionar un entorno de trabajo local
juju switch local
# Crear el contenedor juju
juju bootstrap
# Instalar mediawiki
juju deploy mediawiki
# Instalar mysql
juju deploy mysql
# Crear la relación necesaria entre mediawiki y mysql
juju add-relation mediawiki:db mysql
# Publicar el acceso al servicio mediawiki
juju expose mediawiki
