# Documentación

La documentación se encuentra en [notion](https://www.notion.so/bukhr/ActiveJob-DelayedJob-v-s-GoodJob-v-s-Sidekiq-535fcd4acf7243a6826eeee0bea490da)

Instalación:

* `brew install redis`

* Correr el benchmark `bin/run_benchmark Nk` puede recibir un argumento donde se señalan los Nk jobs a ejecutarse (N = 100) por defecto, y un segundo argumento con un 2 si se desea correr la versión 2 del benchmark para comparar memoria e IPS.