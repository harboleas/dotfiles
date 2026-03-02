#!/bin/bash
# Uso: ./toggle.sh <COMANDO_PARA_LANZAR> <CLASE_DE_VENTANA>

CMD=$1
CLASS=$2

# 1. Si la ventana ya existe, la cerramos (Toggle OFF)
if hyprctl clients | grep -q "class: $CLASS"; then
    hyprctl dispatch closewindow class:$CLASS
else
    # 2. Si no existe, la lanzamos (Toggle ON)
    $CMD &
fi
