#!/bin/bash

ARCHIVO=$1

#Reemplazamos los espacios en blanco por saltos de linea y eliminamos los signos de puntuacion
TEXTO=$(cat "$ARCHIVO" | tr -d '.,:;()¡!?¿°"$%')

#Asignamos como longitud más larga 0 y como más corta la de la primer palabra
MASLARGA=0
MASCORTA=$(echo "$TEXTO" | awk '{print $1}' | wc -c)

#Definimos un acumulador y un contador para el promedio
ACUMULADOR=0
CONTADOR=0


for PALABRA in $TEXTO; do
    LONG=${#PALABRA}

	ACUMULADOR=$((ACUMULADOR + LONG))
	CONTADOR=$((CONTADOR + 1))

    if [ "$LONG" -gt "$MASLARGA" ]; then
       MASLARGA=$LONG
    fi

    if [ "$LONG" -lt "$MASCORTA" ]; then
        MASCORTA=$LONG
    fi
done

echo "Longitud más larga: $MASLARGA"
echo "Longitud más corta: $MASCORTA"

#Usamos la basic calculator para sacar el promedio con decimales
if [ "$CONTADOR" -gt 0 ]; then
	echo "Longitud promedio: $(echo "scale=2; $ACUMULADOR / $CONTADOR" | bc)"
fi
exit 0
