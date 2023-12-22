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
    if [[ $tipo_archivo == *"ASCII"* ]]; then
        mv "$ARCHIVO" "$CARPETASALIDA/txt"
    elif [[ $tipo_archivo == *"PNG"* ]]; then
        mv "$ARCHIVO" "$CARPETASALIDA/img"
    elif [[ $tipo_archivo == *"WAVE"* ]]; then
        mv "$ARCHIVO" "$CARPETASALIDA/snd"
    else
        echo "Archivo no clasificado: $ARCHIVO"
    fi
  fi
    #SUBCARPETA=img/imagen
