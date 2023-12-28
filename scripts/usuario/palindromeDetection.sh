#!/bin/bash

function esPalindromo {
    local PALABRA="$1"
    local REVERSO=$(echo "$PALABRA" | rev)
    if [ "$PALABRA" == "$REVERSO" ]; then
        return 0  #Es palindromo
    else
        return 1  
    fi
}

ARCHIVO=$1

#Eliminamos primero los caracteres especiales del idioma (para poder buscar palindromos)
#Esto lo tuvimos que cambiar porque sed no funcionaba dentro del docker
#iconv convierte los caracteres utf-8 de entrada en el ascii mas cercano (por TRANSLIT)
#Luego pasamos minusculas todo el texto
#Eliminamos signos de puntuacion
#Reemplazamos los espacios con salto de linea
TEXTO=$(cat "$ARCHIVO" |  iconv -f utf-8 -t ascii//TRANSLIT |tr '[:upper:]' '[:lower:]' | tr -d '.,:;()¡!?¿°"$%' | tr -s '[:space:]' '\n' )

for PALABRA in $TEXTO; do
    if esPalindromo "$PALABRA"; then
        echo "$PALABRA"
    fi
done

exit 0