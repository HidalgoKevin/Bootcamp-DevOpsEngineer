<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://coveralls.io/github/nestjs/nest?branch=master" target="_blank"><img src="https://coveralls.io/repos/github/nestjs/nest/badge.svg?branch=master#9" alt="Coverage" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg" alt="Donate us"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow" alt="Follow us on Twitter"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->




# REALIZAR EL PORT-FORDWARD PARA EXPONER EL NGINX
kubectl port-forward pod/nombre_pod 80

# ANALIZAR COMO REEMPLAZO DEL MINIKUBE
https://github.com/yosoyfunes/ansible-k8s


## Descripción

En este desafío, vamos a crear un archivo Dockerfile para construir la aplicación NestJS y un archivo docker-compose.yml para levantar un entorno completo con Nginx (frontend), NestJS (backend), y MongoDB (base de datos). Este entorno permitirá a los desarrolladores trabajar localmente con facilidad.

## Ejecutar el proyecto

Se debe clonar el repositorio y acceder a la carpeta del proyecto
```bash
git clone https://github.com/HidalgoKevin/app-template-nestjs.git

cd app-template-nestjs
```

**Importante**: En el archivo **docker-compose.yml** esta seteado **version: '3.8'** que hace referencia a la version de docker, verificar que tu pc tenga una version de docker igual o superior o de lo contrario reportara un error que impedira avanzar.

Una vez dentro de la carpeta se debe ejecutar el siguiente comando que realizara la creacion de los contenedores.

```bash
docker-compose up -d
```

<p align="center">
<a href="#" target="_blank" rel="noopener noreferrer">
<img width="70%" heigth="70%" src="image/Resultado.png" alt="Ruta Pipeline">
</a>
</p>

Una vez creado, se puede validar si estan activos usando el comando:

```bash
docker ps
```

<p align="center">
<a href="#" target="_blank" rel="noopener noreferrer">
<img width="100%" heigth="100%" src="image/Contenedores.PNG" alt="Ruta Pipeline">
</a>
</p>

## Ejecutar Tests

Para comprobar el funcionamiento se pueden realizar los siguientes tests.

```bash
# unit tests
$ npm run test
```

Resultado esperado:

<p align="center">
<a href="#" target="_blank" rel="noopener noreferrer">
<img width="50%" heigth="50%" src="image/Test.PNG" alt="Ruta Pipeline">
</a>
</p>

```bash
# e2e tests
$ npm run test:e2e
```

Resultado esperado:

<p align="center">
<a href="#" target="_blank" rel="noopener noreferrer">
<img width="50%" heigth="50%" src="image/Test e2e.PNG" alt="Ruta Pipeline">
</a>
</p>

```bash
# test coverage
$ npm run test:cov
```

Resultado esperado:

<p align="center">
<a href="#" target="_blank" rel="noopener noreferrer">
<img width="50%" heigth="50%" src="image/Test cov.PNG" alt="Ruta Pipeline">
</a>
</p>