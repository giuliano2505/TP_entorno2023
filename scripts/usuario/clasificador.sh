#!/bin/bash

#Carpeta de entrada
#CARPETAENTRADA="/app/inputs"
CARPETAENTRADA="./test"

#Carpeta de salida
#CARPETASALIDA="/app/outputs/"
CARPETASALIDA="./salida/"

mkdir -p "$CARPETASALIDA/img"
mkdir -p "$CARPETASALIDA/snd"
mkdir -p "$CARPETASALIDA/txt"


# Iterar sobre los archivos en la carpeta de entrada
for ARCHIVO in "$CARPETAENTRADA"/*
do
  CONTADOR=1
  # Verificar si es un archivo regular
  if [ -f "$ARCHIVO" ]; then

    #ACA HAY QUE CHEQUEAR QUE TIPO DE ARCHIVO ES USANDO FILE
    tipo_archivo=$(file -b --mime-type "$ARCHIVO")

    #DEBERIAMOS ELEGIR img/imagen , snd/sonido , txt/texto
    if echo "$tipo_archivo" | grep -q "text"; then
        SUBCARPETA="txt/texto"
    elif echo "$tipo_archivo" | grep -q "image"; then
        SUBCARPETA="img/imagen"
    elif echo "$tipo_archivo" | grep -q "audio"; then
        SUBCARPETA="snd/sonido"
    else
        continue
    fi
  fi


#####


    # Construir el nuevo nombre con la ruta de salida
    RUTASALIDA="$CARPETASALIDA$TIPO$CONTADOR.png"

    # Verificar si el nuevo nombre ya existe
    while [ -e "$RUTASALIDA" ]
    do
      ((CONTADOR++))
      RUTASALIDA="$CARPETASALIDA$SUBCARPETA$TIPO$CONTADOR.png"
    done

    cp "$ARCHIVO" "$RUTASALIDA"
    
  fi
done
