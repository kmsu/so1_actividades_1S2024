#!/bin/bash

# Nombre del pipe
PIPE=/tmp/chat_pipe

# Crea el pipe si no existe
[ -p $PIPE ] || mkfifo $PIPE

# Bucle para enviar mensajes
while true; do
    read -p "Participante 1: " message
    echo "$message" > $PIPE
    if read message <$PIPE; then
        echo "$message"
    fi
done
