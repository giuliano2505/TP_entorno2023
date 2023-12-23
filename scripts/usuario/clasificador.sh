#!/bin/bash

#Carpeta de entrada
CARPETAENTRADA="/app/inputs"

#Carpeta de salida
CARPETASALIDA="/app/outputs/"

mkdir -p "$CARPETASALIDA/img"
mkdir -p "$CARPETASALIDA/snd"
mkdir -p "$CARPETASALIDA/txt"
chmod 777 "$CARPETASALIDA/img" "$CARPETASALIDA/snd" "$CARPETASALIDA/txt" 



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
        EXTENSION=".txt"
    elif echo "$tipo_archivo" | grep -q "image"; then
        SUBCARPETA="img/imagen"
        EXTENSION=".png"
    elif echo "$tipo_archivo" | grep -q "audio"; then
        SUBCARPETA="snd/sonido"
        EXTENSION=".wav"
    else
        continue
    fi

    # Construir el nuevo nombre con la ruta de salida
    RUTASALIDA="$CARPETASALIDA$SUBCARPETA$TIPO$CONTADOR.$EXTENSION"

    # Verificar si el nuevo nombre ya existe
    while [ -e "$RUTASALIDA" ]
    do
      ((CONTADOR++))
      RUTASALIDA="$CARPETASALIDA$SUBCARPETA$TIPO$CONTADOR.$EXTENSION"
    done

    mv "$ARCHIVO" "$RUTASALIDA"
    
  fi
done
echo -e "Archivos clasificados\n"