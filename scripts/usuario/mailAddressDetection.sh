#!/bin/bash

ARCHIVO=$1



#Armamos un filtro para sacar los correos
#le pasamos las opciones de grep 
#-E (regex extendidas) y -o (imprime solo la parte que coincide, no la linea)
#La expresion regular usa \b para delimitar palabras 
#Matchea con algunos caracteres antes del arroba
#Matchea con algunos caracteres despues del arroba
#Si o si tiene que terminar con un dominio de, al menos, dos letras
CORREOS=$(grep -E -o '\b[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-z|A-Z]{2,}\b' "$ARCHIVO")


echo -e "$CORREOS"

