#!/bin/bash

# Nombre del pipe
PIPE=/tmp/chat_pipe

# Función para el participante 1
participant1() {
    while true; do
        read -p "Participante 1: " message
        echo "$message" > $PIPE
        if read -r message <$PIPE; then
            echo "Participante 2: $message"
        fi
    done
}

# Función para el participante 2
participant2() {
    while true; do
        if read -r message <$PIPE; then
            echo "Participante 1: $message"
        fi
        read -p "Participante 2: " message
        echo "$message" > $PIPE
    done
}

# Crea el pipe si no existe
[ -p $PIPE ] || mkfifo $PIPE

# Ejecutar las funciones en paralelo en subprocesos
participant1 &
participant2 &

# Esperar hasta que ambos participantes terminen
wait
