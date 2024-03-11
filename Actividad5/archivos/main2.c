#include <stdio.h>
#include <pthread.h>

int main() {
    pid_t pid;

    pid = fork();
    if (pid == 0) { /*child process */
        fork();
        pthread_t newThread;
        pthread_create(&newThread, NULL, NULL, NULL);
    }
    fork();

    // Calculamos el número total de procesos únicos
    // Cada vez que se llama a fork(), se duplica el número de procesos existentes
    // por lo tanto, para calcular el número de procesos únicos, calculamos 2^3 = 8
    // para las tres llamadas fork() realizadas.
    int procesos = 2*2*2;

    // Calculamos el número total de hilos únicos
    // Ya que solo se crea un hilo en la rama del proceso hijo, el número total de hilos únicos es 1.
    int hilos = 1;

    printf("Número de procesos únicos creados: %d\n", procesos);
    printf("Número de hilos únicos creados: %d\n", hilos);

    return 0;
}
