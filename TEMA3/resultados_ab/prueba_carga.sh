#!/bin/bash
# Script para automatizar las pruebas de carga de los servidores nginx

# Prueba del servidor instalado en la jaula
for i in {1..10..1}
	do
		ab -n 1000000 -c 10 http://127.0.0.1/index.html > prueba_jaula_$i.txt
	done

# Prueba del servidor instalado en el contenedor
for i in {1..10..1}
	do
		ab -n 1000000 -c 10 http://10.0.3.45/index.html > prueba_contenedor_$i.txt
	done
