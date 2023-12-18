#!/bin/bash

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
random_number=$((RANDOM % 3))


# Dependiendo del número aleatorio, llamar a la función correspondiente
case $random_number in
    0)
        generate_text_file "output_file"
        ;;
    1)
        generate_sound_file "output_file"
        ;;
    2)
        generate_image_file "output_file"
        ;;
    *)
        ;;
esac

mv "output_file" $(md5sum "output_file" | awk '{print $1}')
