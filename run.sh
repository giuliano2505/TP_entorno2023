#!/bin/bash

mkdir -p outputs_gen outputs_usuario 

 docker run -d --rm \
 	--name generador \
 	--mount type=bind,src=$(pwd)/outputs_gen,dst=/app/outputs \
 	im_generador

 docker run -it --rm \
 	--name usuario \
 	--mount type=bind,src=$(pwd)/outputs_gen,dst=/app/inputs \
 	--mount type=bind,src=$(pwd)/outputs_usuario,dst=/app/outputs \
 	im_usuario