#!/bin/bash

# Nombre del pipe
PIPE=/tmp/chat_pipe

# Bucle para recibir mensajes
while true; do
    if read message <$PIPE; then
        echo "Participante 1: $message"
    fi
    read -p "Participante 2: " message
    echo "Participante 2: $message" > $PIPE
done
