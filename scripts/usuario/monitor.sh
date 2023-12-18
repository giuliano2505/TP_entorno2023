#/bin/bash

#Guardamos un timestamp para el nombre
TIMESTAMP=$(date +"%d_%m_%Y:%H_%M_%S")

#Uso de CPU
#Ejecutamos top en modo completo con solo una actualizacion
#Extraemos la linea que tiene el uso del CPU
#Imprimimos el segundo campo de la linea
USOCPU=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $2}')

exit 0
