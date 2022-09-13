# Documentación

La documentación se encuentra en [notion](https://www.notion.so/bukhr/ActiveJob-DelayedJob-v-s-GoodJob-v-s-Sidekiq-535fcd4acf7243a6826eeee0bea490da)

Instalación:

* `brew install redis`

* Correr el benchmark `bin/run_benchmark N` puede recibir un argumento donde se señalan los Nk jobs a ejecutarse (N = 100) por defecto, y un segundo argumento con un 2 si se desea correr la versión 2 del benchmark para comparar memoria e IPS.

# Resultados
El benchmark se divide en 2 pruebas principalmente, la primera es comparar las distintas medidas al momento de encolar 1K, 10K y 100K de workers y la segunda corresponde a encolar y procesar esas mismas cantidades de workers. 

El benchmark posee dos versiones, la primera solo mide tiempos de ejecución y para ejecutarla con 10.000 (10K) jobs se debe ejecutar el siguiente comando:

`bin/run_benchmark 10`

Por otro lado, la segunda versión utiliza [benchmark](https://github.com/ruby/benchmark) para medir tiempo de ejecución [benchmark-memory](https://github.com/michaelherold/benchmark-memory) para comparar utilización de memoria y [benchmark-ips](https://github.com/evanphx/benchmark-ips). Estos tests toman más tiempo porque realizan más iteraciones sobre los conjuntos de datos y para ejecutarlo con 10.000 jobs se debe ejecutar de la siguiente manera

`bin/run_benchmark 10 2`

Por otro lado, los resultados obtenidos en cada una de las pruebas se encuentran en `public/results` separados por la versión de la prueba realizada. Cada prueba se realizó 3 veces y se representa el promedio de ellas.

Las pruebas fueron realizadas en un MacBook Pro 2019 (2.6 GHz Six-Core Intel Core i7), con Ruby 2.7.4, Rails 6.1.6 y las siguientes versiones de los adaptadores:
* [DelayedJob](https://github.com/collectiveidea/delayed_job) 4.1.10
* [GoodJob](https://github.com/bensheldon/good_job) 3.4.4
* [Que](https://github.com/que-rb/que) 2.2
* [Sidekiq](https://github.com/mperham/sidekiq) 6.5.6

Si se desea deshabilitar una prueba de un adaptador (para agilizar los tests) se puede comentar la línea en el adaptador correspondiente en el archivo `bin/run_benchmark:76`


## ENQUEUING JOBS in seconds
### Benchmark v1
| **Adapter** | **1K** | **10K** | **100K** |
|-------------|--------|---------|----------|
| DelayedJob  |   1.43 |   13.03 |   230.38 |
| GoodJob     |   1.58 |   13.82 |   228.62 |
| QueJob      |   0.75 |    7.84 |   131.07 |
| Sidekiq     |   0.11 |    1.29 |    10.34 |

## ENQUEUING & PROCESSING JOBS in seconds

| **Adapter** | **1K** | **10K** | **100K** |
|-------------|--------|---------|----------|
| DelayedJob  |   5.28 |   72.76 |   803.37 |
| GoodJob     |   7.68 |   99.31 |  4201.24 |
| QueJob      |   6.64 |   33.05 |   358.55 |
| Sidekiq     |   0.75 |    4.52 |    72.73 |

## THROUGHPUT in jobs/sec
| **Adapter** | **1K** | **10K** | **100K** |
|-------------|--------|---------|----------|
| DelayedJob  |    189 |     137 |      124 |
| GoodJob     |    130 |     101 |       24 |
| QueJob      |    151 |     303 |      279 |
| Sidekiq     |   1333 |    2212 |     1375 |

## Comparative
![Enqueuing & Processing](public/ENQUEUING_JOBS_in_seconds.svg?raw=true "Adapters v/s Enqueing")

![Enqueuing & Processing](public/ENQUEUING_PROCESSING_JOBS_seconds.svg?raw=true "Adapters v/s Enqueing & Processing")
