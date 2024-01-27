# ACTIVIDAD 1

## Tipos de kernel y sus diferencias

Tipos de kernel:
* Monolítico: El kernel completo opera como una
única unidad en espacio de núcleo. Linux es un
ejemplo de un kernel monolítico.

* Microkernel: Solo las funciones esenciales
residen en el espacio de núcleo, mientras que
servicios adicionales se ejecutan en el espacio
de usuario. Esto puede proporcionar mayor
modularidad y flexibilidad.

* Híbrido: Combina características de los kernels
monolíticos y microkernels para lograr un
equilibrio entre rendimiento y modularidad.

* Exokernel: Se encarga únicamente de asignar los 
recursos del hardware a los diferentes programas 
en ejecución. Los programas tienen un control completo 
sobre los recursos asignados, lo que les permite 
aprovechar al máximo el hardware. Su rendimiento es
excepcional, pero es muy complejo de implementar
y puede requerir modificaciones significativas en las 
aplicaciones existentes.

## User vs Kernel Mode

|              |   Ventajas   |  Desventajas   |
|    :---:     |     :---:    |     :---:      |
| Monolítico   |  Rendimiento <br /> Simplicidad |                |
| Microkernel  |              |                |
| Híbrido      |              |                |
| Exokernel    |              |                |

## Interruptions vs traps
