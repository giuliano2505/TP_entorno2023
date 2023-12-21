#!/bin/bash

#Pedimos el nombre al usuario, verificamos si existe el archivo, o mostramos mensaje de error
FILE_EXIST=false

while [ "$FILE_EXIST" != true ]; do
    echo "Por favor, ingrese el nombre del archivo"
    echo -"Tenga en cuenta que solo se pueden procesar archivos dentro de /app/textos"
    read ARCHIVO

    #RUTA="/app/textos/$ARCHIVO"
    RUTA="./test/$ARCHIVO"
    # Verificar si la ruta es un archivo regular
    if [ -f "$RUTA" ]; then
        FILE_EXIST=true
    else
        echo -e "El archivo no existe o no es un archivo regular\n"
    fi
done


echo -e "\n"


while true; do
	#Menu de opciones
	echo "Seleccione una opcion:"
	echo "1. Indicador estadístico de longitud de palabras"
	echo "2. Buscador de palindromos"
	echo "3. Buscador de emails"
	echo "4. Salir"

read option

 case $option in
	1)./statsWords.sh "$RUTA";;
	2)./palindromeDetection.sh "$RUTA";;
	3)./mailAddressDetection.sh "$RUTA";;
	4)exit;;
	*)echo -e "Opcion invalida\n"
 esac		
done