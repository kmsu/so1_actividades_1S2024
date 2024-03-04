#!/bin/bash

# Nombre de los Named Pipes (tubos con nombre)
pipe1=participant1_to_participant2
pipe2=participant2_to_participant1

# Verificar si los Named Pipes ya existen
if [ ! -p "$pipe1" ] || [ ! -p "$pipe2" ]; then
    # Crear los Named Pipes (tubos con nombre) si no existen
    mkfifo $pipe1 $pipe2
fi

# Función para el participante 1
participant1() {
    while true; do
        # Leer mensaje del participante 2 con un tiempo de espera de 1 segundo
        if read -t 1 -r message < $pipe2; then
            echo "Participant 2: $message"
        fi
        
        # Escribir mensaje para el participante 2
        if read -t 1 -r input; then
            echo "$input" > $pipe1
        fi
    done
}

# Función para el participante 2
participant2() {
    while true; do
        # Leer mensaje del participante 1 con un tiempo de espera de 1 segundo
        if read -t 1 -r message < $pipe1; then
            echo "Participant 1: $message"
        fi
        
        # Escribir mensaje para el participante 1
        if read -t 1 -r input; then
            echo "$input" > $pipe2
        fi
    done
}

# Ejecutar las funciones en paralelo en subprocesos
participant1 &
participant2 &

# Esperar hasta que ambos participantes terminen
wait
