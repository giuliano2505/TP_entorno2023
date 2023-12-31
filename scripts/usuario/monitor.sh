#/bin/bash

#Guardamos un timestamp para el nombre
TIMESTAMP=$(date +"%d_%m_%Y:%H_%M_%S")

#Uso de CPU
#Ejecutamos top en modo completo con solo una actualizacion
#Extraemos la linea que tiene el uso del CPU
#Imprimimos el segundo campo de la linea
USOCPU=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print $2}')

#Uso de memoria
#Se podria hacer con top tambien
#Llamamos a freey capturamos la linea de memoria
#Tomamos el tercer campo(mem en uso), lo dividimos por el segundo (memtotal)y lo multiplicamos por 100
USORAM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

#Cantidad de procesos
#Llamamos a ps con la opcion e para que liste todos los procesos, 
#Se lo pasamos a wc, para que cuente la cantidad de lineas
#y le restamos una para eliminar el encabezado
NUMPROC=$(( $(ps -e | wc -l) - 1 ))

#Espacio libre
#Llamamos a df con las opciones -h (formato "humano") y / que indica que solo donde esta la raiz
#tail toma todas la lineas a partir de la segunda (Para eliminar el encabezado)
#awk imprime el tercer campo que es el espacio libre
LIBRE=$(df -h /  | tail -n +2 | awk '{print $3}')

BUFFER="CPU: $USOCPU\nRAM: $USORAM%\nProcesos: $NUMPROC\nEspacio libre: $LIBRE"

echo -e "$BUFFER" > "outputs/report_$TIMESTAMP.txt"
echo -e "$BUFFER"
exit 0
