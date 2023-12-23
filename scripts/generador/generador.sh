#!/bin/bash

ARCHIVOSALIDA="/app/outputs/output_file"
# Función para generar archivos de texto
generate_text_file() {
    base64 /dev/urandom | head -c 500 > "$1"
}

# Función para generar archivos de sonido
generate_sound_file() {
    ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" "$1"
}

# Función para generar archivos de imagen
generate_image_file() {
    convert -size 100x100 xc: +noise Random "$1"
}

# Generar un número aleatorio para decidir qué tipo de archivo crear
TIPOARCHIVO=$(shuf -i 0-2 -n 1)


#Dependiendo del número aleatorio, llamar a la función correspondiente
#Le agregamos la extension para que funcionen las funciones de sonido e imagenes
case $TIPOARCHIVO in
    0)
        generate_text_file "$ARCHIVOSALIDA.txt"
        mv "$ARCHIVOSALIDA.txt" "/app/outputs/$(md5sum "$ARCHIVOSALIDA.txt" | awk '{print $1}')"
        ;;
    1)
        generate_sound_file "$ARCHIVOSALIDA.wav"
        mv "$ARCHIVOSALIDA.wav" "/app/outputs/$(md5sum "$ARCHIVOSALIDA.wav" | awk '{print $1}')"
        ;;
    2)
        generate_image_file "$ARCHIVOSALIDA.png"
        mv "$ARCHIVOSALIDA.png" "/app/outputs/$(md5sum "$ARCHIVOSALIDA.png" | awk '{print $1}')"
        ;;
    *)
        ;;
esac

chmod 666 /app/outputs/*