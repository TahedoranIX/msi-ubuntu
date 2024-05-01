#!/bin/bash

archivo="/sys/class/leds/platform::mute/brightness"

# Lee el valor actual del archivo
#estado_actual=$(amixer sget Master | grep -i '\[on\]')
estado_actual=$(cat "$archivo")

# Cambia el estado entre 'on' y 'off'
if [ "$estado_actual" == '0' ]; then
    nuevo_estado='1'
else
    nuevo_estado='0'
fi

# Escribe el nuevo estado en el archivo
echo $nuevo_estado > $archivo
# fi
