#!/bin/bash

TIMEFORMAT='%2R'

if [ $# -lt 3 ]; then
	echo -e "\nError: número de argumentos inválido. Uso: $0 archivoSistema archivoBucle0 archivoBucle1\n"
	exit 1
fi

time1+=$( { time `cp $1 $1_2`; } 2>&1 )
vel1=$( bc <<<"scale=2; 200/$time1" )
time2+=$( { time `cp $1 $2_2`; } 2>&1 )
vel2=$( bc <<<"scale=2; 200/$time2" )
time3+=$( { time `cp $1 $3_2`; } 2>&1 )
vel3=$( bc <<<"scale=2; 200/$time3" )

time4+=$( { time `cp $2 $2_2`; } 2>&1 )
vel4=$( bc <<<"scale=2; 200/$time4" )
time5+=$( { time `cp $2 $1_2`; } 2>&1 )
vel5=$( bc <<<"scale=2; 200/$time5" )
time6+=$( { time `cp $2 $3_2`; } 2>&1 )
vel6=$( bc <<<"scale=2; 200/$time6" )

time7+=$( { time `cp $3 $3_2`; } 2>&1 )
vel7=$( bc <<<"scale=2; 200/$time7" )
time8+=$( { time `cp $3 $1_2`; } 2>&1 )
vel8=$( bc <<<"scale=2; 200/$time8" )
time9+=$( { time `cp $3 $2_2`; } 2>&1 )
vel9=$( bc <<<"scale=2; 200/$time9" )

echo -e "\nResultados operaciones entrada/salida:"
echo -e "======================================\n"

echo -e "Copiar de sistema propio (ext4) a si mismo: $time1 segundos, $vel1 MB/s"
echo -e "Copiar de sistema propio (ext4) a sistema bucle 0 (xfs): $time2 segundos, $vel2 MB/s"
echo -e "Copiar de sistema propio (ext4) a sistema bucle 1 (btrfs): $time3 segundos, $vel3 MB/s\n"

echo -e "Copiar de sistema bucle 0 (xfs) a si mismo: $time4 segundos, $vel4 MB/s"
echo -e "Copiar de sistema bucle 0 (xfs) a sistema propio (ext4): $time5 segundos, $vel5 MB/s"
echo -e "Copiar de sistema bucle 0 (xfs) a sistema bucle 1 (btrfs): $time6 segundos, $vel6 MB/s\n"

echo -e "Copiar de sistema bucle 1 (btrfs) a si mismo: $time7 segundos, $vel7 MB/s"
echo -e "Copiar de sistema bucle 1 (btrfs) a sistema propio (ext4): $time8 segundos, $vel8 MB/s"
echo -e "Copiar de sistema bucle 1 (btrfs) a sistema bucle 0 (xfs): $time9 segundos, $vel9 MB/s"

echo -e "\n"
