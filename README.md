
# Proyecto final - Entorno de programación 2023

Proyecto final para la materia Entorno de programación, de la Tecnicatura Universitaria en Inteligencia Artificial. El proyecto consiste en crear un contenedor que al ejecutarlo presente un menú de opciones para procesar un grupo de imagenes.

## Enunciado
Deberiamos subir el PDF del enunciado?

[Enunciado TP](https://link)


## Autores

- [Giuliano Carlachiani](https://github.com/giuliano2505/)
- [Valentina Balverdi](https://github.com/ValentinaBalverdi)
- [Agustina Yafusco](https://github.com/AgusG13)

## Previamente
En primer lugar instalamos git:
```bash
    sudo apt-get update
    sudo apt-get install git
```
Podemos chequear que funciona usando:
```bash
    git --version
```
Luego instalamos docker, sea desde la info oficial o bien corriendo:
```bash
    # Add Docker's official GPG key:
    sudo apt-get install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$UBUNTU_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
```
Seguido de:
```bash
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo groupadd docker
    sudo usermod -aG docker $USER
```
Y lo podemos probar con:
```bash
    docker run hello-world
```

Por ultimo vamos a configurar un certificado SSH para pushear al repositorio:
```bash
    ssh-keygen -t ed25519 -C "your_email@example.com"
```
Esto creara un nuevo certificado con nuestro correo, y nos pedira una ubicacion para guardarlo, podemos dejarla por defecto, tambien nos pedira ingresar una clave para este certificado (y repetirla).

Con la clave ya creada ejecutamos:
```bash
    ssh-add ~/.ssh/id_ed25519 # o bien la ruta en la que la hayamos guardado
```
y luego
```bash
cat ~/.ssh/id_ed25519.pub
```
Lo que imprimira la clave por pantalla, la copiamos al portapapeles y dentro de github nos dirigimos "Foto de perfil>Settings>SSH and GPG Keys>New SSH key", le asignamos un nombre y pegamos el contenido del portapapeles.

Por ultimo antes de trabajar con git, configurar:
```bash
    git config --global user.email "your_email"
    git config --global user.name "your_name"
```
Y asegurarse al hacer un git clone, que se usa el link de SSH del repo



# Instrucciones
## Contenedor GENERADOR
Para buildear el contenedor GENERADOR se debe ejecutar lo siguiente:

```bash
    docker build -f df_generador -t im_generador .
```
    
## Contenedor USUARIO
Para buildear el contenedor GENERADOR se debe ejecutar lo siguiente:

```bash
    ACA IRIA EL CODIGO PARA BUILDEAR
```
## Para correr los contenedores


```bash
    mkdir outputs_gen
    docker run -d --name generador --mount type=bind,src=$(pwd)/outputs_gen,dst=/app/outputs im_generador
    ACA PARA CORRER EL USUARIO
```
