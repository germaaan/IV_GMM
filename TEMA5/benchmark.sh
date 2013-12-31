#!/bin/bash

TIMEFORMAT='%2R'

if [ $# -lt 1 ]; then
    echo -e "\nError: número de argumentos inválido. Uso: $0 archivo\n"
    exit 1
fi

time1+=$( { time `cp $1 $1_2`; } 2>&1 )
vel1=$( bc <<<"scale=2; 200/$time1" )

echo -e "\nResultados operaciones entrada/salida: $time1 segundos, $vel1 MB/s"
echo -e "=====================================\n"
