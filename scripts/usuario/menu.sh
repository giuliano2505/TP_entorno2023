#!/bin/bash
#
while true; do
	#Menu de opciones
	echo "selecione una opcion:"
	echo "1. Clasificador de arvhivos"
	echo "2. Monitor del sistema"
	echo "3. Analizador de texto"
	echo "4. Salir"

read option

 case $option in
	1)./scripts/clasificador.sh;;
	2)./scripts/monitor.sh;;
	3)./scripts/analizador.sh;;
	4)exit;;
	*)echo "Opcion invalida"
 esac		
done
