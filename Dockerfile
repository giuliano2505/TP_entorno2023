# syntax=docker/dockerfile:1
# Partimos de la imagen de ubuntu
FROM ubuntu:20.04
# Agregamos la dependencia imagemagick para procesar la imagenes
RUN apt-get update && apt-get install -y --no-install-recommends imagemagick
# Seteamos como directorio de trabajo la carpeta /app (se crea automaticamente)
WORKDIR /app
# Agrega al contenedor la carpeta scripts
ADD scripts scripts
# Definimos el entrypoint (lo primero que se va a ejecutar)
ENTRYPOINT ["bash","/app/scripts/menu.sh"]
