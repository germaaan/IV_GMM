#!/bin/bash
# Script para la instalación de Nginx

# Actualiza la lista de paquetes e instalar Nginx
sudo apt-get update && apt-get install -y nginx

# Reiniciamos Nginx y comprobamos su estado de ejecución
sudo service nginx restart && sudo service nginx status
