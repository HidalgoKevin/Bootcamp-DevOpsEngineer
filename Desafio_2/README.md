# Desafio 2
Este documento sirve como guía práctica, ofreciendo un instructivo detallado para la creacion, configuración y ejecución de un pipeline en Jenkins. Se abordan tanto los procesos manuales como los automatizados, destacando cómo estos últimos permiten la ejecución continua sin intervención del usuario, desencadenada por los cambios realizados por los desarrolladores. El objetivo es proporcionar una comprensión integral de ambos enfoques, subrayando la eficiencia y la automatización en entornos DevOps.

| Caracteristica        | Script Pipeline | Pipeline Script from SCM  | 
|-------------|--------|------------------------|
| Fuente de Definicion | Definido directamente en el Jenkins como script | Almacenado en un sistema de control de versiones como Git, vinculado a Jenkins |
| Control de versiones | Sin control de versiones directo, los cambios necesitan actualizaciones manuales | Control de versiones total a través del repositorio de origen |
| Flexibilidad | Flexibilidad limitada; los cambios requieren actualizaciones manuales en Jenkins | Altamente flexible; los cambios se pueden gestionar a través de confirmaciones de Git |
| Activación | Activada manualmente o mediante trabajos cron simples | Activada automáticamente por cambios en el SCM (por ejemplo, webhook de GitHub) |
| Colaboración | Es más difícil colaborar; los cambios están localizados en Jenkins. | Colaboración más sencilla; todos los miembros del equipo pueden contribuir a través de Git |
| Capacidad de reversión | Se requiere intervención manual para la reversión | Reversión simple a través de Git revert o cambio de rama |
| Tiempo de configuración | Rápido de configurar para proyectos pequeños, pero complejo de mantener para proyectos grandes. | Requiere configuración inicial de SCM y webhooks, pero es más fácil de mantener. |
| Escalabilidad | Menos escalable para equipos grandes o proyectos múltiples | Altamente escalable; se integra bien con los flujos de trabajo del equipo y las ramificaciones |
| Seguimiento de cambios | Difícil realizar un seguimiento de los cambios o un seguimiento de auditoría | Todos los cambios se rastrean en el SCM |
| Integración | Integración básica; limitado a lo que está configurado directamente en Jenkins. | Capacidades de integración avanzadas, aprovechando los flujos de trabajo de Git. |
 
---

# Ejecucion de un Pipeline de Jenkins
Se procedera a comentar el procedimiento para ejecutar un pipeline en jenkins tanto de forma manual y automatizada.

## Forma Manual
1. **Acceder a Jenkins**: Abre tu navegador web y accede a la URL de servidor Jenkins (en este caso la URL expuesta por Ngrok).
2. **Iniciar sesión**: Ingresa tus credenciales de usuario y contraseña para acceder al dashboard de Jenkins.
3. **Buscar el pipeline**: En el dashboard de Jenkins debes navegar por los distintos directorios con el fin de encontrar el pipeline a ejecutar, en este caso el pipeline Desafio2 se encuentra almacenado en el directorio Bootcamp-DevOps.
4. **Seleccionar el pipeline**: Haz clic en el pipeline Desafio2 para abrir sus detalles.
5. **Ejecutar el pipeline manualmente**: En la vista del pipeline, busca el botón **Build Now** (Construir Ahora) en el menú de opciones a la izquierda y haz clic en él. Esto iniciará la ejecución del pipeline de forma manual.
6. **Verificar la ejecución**: Después de iniciar el pipeline, podrás visualizar las ejecuciones realizadas en el Historial de Tareas las cuales pueden finalizar correctamente o finalizar con un error.
7. **Revisión de resultados**: Una vez completada la ejecución, podrás revisar el resultado y el log para verificar que todo se haya ejecutado correctamente.

Estos pasos te permitirán ejecutar y supervisar un pipeline en Jenkins (en este caso Desafio2), tanto manualmente como de manera automatizada según tus necesidades.

## Forma Automatizada
Para que se ejecute un pipeline de forma automatizada (sin intervencion manual en jenkins), un desarrollador puede aplicar un cambio (o simular uno) en el repositorio de github. 
Los pasos a realizar son:

1. **Descargar Repositorio**: Un usuario puede descargarse el repositorio en su PC local utilizando el comando git clone <url del repositorio>, en este caso seria: 
```bash
git clone https://github.com/HidalgoKevin/nodejs-helloworld-api.git
```
Importante! Para ejecutar este comando de Git, debe tener instalado git en su PC local para que tome los comandos correspondientes.

2. **Realizar un cambio o commit**: Una vez clonado el repositorio en tu pc local, para que se ejecute el pipeline de forma automatica, se tiene que aplicar un cambio al codigo del repositorio o simular un cambio.
En este caso haremos un commit vacio (simulando un cambio vacio) al repositorio con el comando:
```bash
git commit --allow-empty -m "Your commit message here"
```
3. **Pushear el cambio o commit**: Una vez ejecutado, utilizaremos un push para llevar ese commit al repositorio:
```bash
git push
```
4. **Verificar Push en el Repositorio**: Si se accede al repositorio, se podra visualizar cual es el codigo y fecha del ultimo push realizado.
5. **Verificar Ejecucion Automatica**: Para verificar la ejecucion automatica, 
- Se debe acceder a Jenkins e ir al directorio en donde se encuentra el Pipeline y acceder a el.
- Se deberia visualizar que hubo una ejecucion recientemente.
6. **Ver el Log de Ejecucion**: Se puede ver el log de la ejecucion, presionando clic en el boton "Console log" el cual te llevara a la interfaz en donde te mostrara todos los pasos que se ejecutaron del codigo del Jenkinsfile.

---

# Procedimiento para la Creacion y Configuracion de un Pipeline en Jenkins
Se procederá a detallar los puntos necesarios y opcionales para la creación y configuración de un pipeline para que se pueda ejecutar de forma manual y automatizada.

## 1). Exponer una URL con Ngrok (opcional)
Para exponer un Jenkins a externos, se puede utilizar la aplicación gratuita Ngrok siguiendo los siguientes pasos: 
1. **Acceder a la Instancia (VM)**: Acceder a la instancia (Maquina Virtual) ya creada en donde está instalado Jenkins (en este caso multipasss), mediante el comando:
```bash
multipass shell <Instancia>
```
2. **Levantar URL Publica**: Utilizar el siguiente comando de la aplicación Ngrok que está instalada en la misma instancia que Jenkins para exponer su servicio a externos.
```bash
ngrok http http://localhost:8080
```
Una vez ejecutado el comando se creará una URL expuesta a internet a la cual cualquier persona podrá acceder.
* Observación: Dicha URL expuesta tiene una duración en Horas, y si se cancela el comando de Ngrok ejecutado con **Ctrl + c** dejará de estar activa dicha URL.

Dicha URL expondrá el Jenkins, pero solo podrán acceder aquellos que posean credenciales en la misma.

---

## 2). Crear un Fork (opcional)
Con el fin de utilizar un repositorio externo (de otro usuario) se deberá crear un Fork del repositorio, se debe realizar los siguientes pasos:
1. **Accede a GitHub**: Abre tu navegador web y dirígete a la página principal de GitHub en https://github.com/ 
2. **Iniciar Sesión**: Ingresa tus credenciales de usuario y contraseña para acceder a tu cuenta de GitHub.
3. **Buscar el repositorio**: En la barra de búsqueda de GitHub, ingresa yosoyfunes/nodejs-helloworld-api y presiona Enter.
4. **Seleccionar resultado**: Selecciona el repositorio que aparece en los resultados de búsqueda para acceder a la página principal del repositorio.
5. **Realizar el Fork**: En la esquina superior derecha de la página del repositorio, verás un botón que dice Fork al cual debes darle clic. 
GitHub te llevará a una página donde podrás seleccionar tu cuenta o la organización donde deseas hacer el fork (Owner). Selecciona la opción deseada.
6. **Verificar el Fork**: Después de hacer clic en **Create Fork**, serás redirigido a una copia del repositorio en tu propia cuenta de GitHub. El nombre del repositorio en este caso quedaría como KevinHidalgo/nodejs-helloworld-api.

---

## (3). Configuración de Webhook
Para configurar un webhook en un repositorio de GitHub, se debe realizar los siguientes pasos:
1. **Accede a GitHub**: Abre tu navegador web y dirígete a la página principal de GitHub. 
> https://github.com/ 
2. **Iniciar Sesión**: Ingresa tus credenciales de usuario y contraseña para acceder a tu cuenta de GitHub.
3. **Accede al Repositorio**: Ve al repositorio donde deseas configurar el webhook.
4. **Ir a la Configuración del Repositorio**: En la página principal del repositorio, haz clic en la pestaña **Settings** ubicada en la parte superior derecha. 
5. **Acceder a Webhooks**: En el menú lateral izquierdo (Code and automation), desplázate hacia abajo y selecciona Webhooks.
6. **Crear un Nuevo Webhook**: Haz clic en el botón Add webhook.
7. **Configurar la URL del Payload**: En el campo Payload URL, ingresa la URL donde deseas que GitHub envíe las solicitudes POST cuando ocurra un evento en el repositorio (en este caso Jenkins). 
El Payload URL quedaría como con el formato URL_Jenkins/github-webhook/. Ejemplo:
> https://ad27-200-125-110-3.ngrok-free.app/github-webhook/
8. **Elegir el Tipo de Contenido**: En Content type, selecciona application/json para que GitHub envíe los datos del webhook en formato JSON.
- **Configurar el Secreto (Opcional)**: Si deseas agregar una capa adicional de seguridad, puedes ingresar un secreto en el campo Secret. Este valor se utiliza para generar una firma que puedes verificar en tu servidor.
- **Seleccionar Eventos**: Selecciona los eventos que deseas que activen el webhook. Puedes elegir que se envíen datos para todos los eventos (Just the push event.) o para eventos específicos como push, pull request, entre otros.
9. **Finalizar la Configuración**: Revisa todas las configuraciones y luego haz clic en Add webhook para crear el webhook.
10. **Verificación del Webhook**: Una vez creado el webhook, GitHub enviará una solicitud de prueba a la URL que has configurado. Puedes verificar en la página de Webhooks si la solicitud fue exitosa. 

Siguiendo estos pasos, habrás configurado un webhook en tu repositorio de GitHub. Este webhook enviará datos a la URL especificada cada vez que ocurra uno de los eventos seleccionados.

---

## 4). Creación de Token en Github
Para que Jenkins pueda acceder a un repositorio de Github se debe configurar un token que es una cadena alfanumérica que se utiliza como una clave sensible de acceso la cual se utilizara al momento de crear una Credencial en Jenkins.
Los pasos para crear un token en Github son los siguientes:
1. **Settings**: Se debe acceder a la opción Settings (configuración) de tu perfil de Github
2. **Developer Settings**: Se debe ir a la opción Developer Settings del menú de opciones a la izquierda. 
3. **Token Clasico**: Se debe desplegar las opciones de Personal Access token y hacer clic en **Token (classic)**
4. **Crear Token**: Se debe hacer clic en Generate new token y utilizar la opción classic, utilizando de referencia la screen. Se debe completar los campos
- **Note**: Seria el nombre del token a crear
- **Expiration**: Es el tiempo de vida del token a crear, en este caso se creó uno de 7 días.
- **Select scopes**: Se debe seleccionar los tipos de permisos de tendrá el Token, en este caso, se seleccionó todos los permisos relacionados a **repo** (repository) ya que le permitirá tener acceso a su comportamiento.
5. **Token generado**: Una vez creada te generara un token alfanumérico el cual cumple la funciona de una password, por lo cual se debe resguardar el valor del token en un archivo temporal hasta que se utilice para crear una credencial en Jenkins.

---

## 5). Creación y configuración del pipeline
Se describirá en detalle el procedimiento para crear y configurar todos los elementos necesarios para asegurar el correcto funcionamiento del pipeline en un proyecto NodeJS.

### 5.1). Instalación de NodeJS en la VM
Se debe realizar la instalación de NVM (Node Versión Management) utilizando el siguiente comando: 
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
```
Una vez instalado la NVM, se debe instalar NodeJS especificando la versión a instalar.
```bash
nvm install 20
```
- **Observación**: Es posible que una vez instalado NVM (Node Version Management) debas reiniciar la terminal (salir de la VM e ingresar nuevamente).

Una vez instalado NodeJS, se debe verificar la versión instalada en el entorno.
```bash
node -v
```
Debería devolver **v20.17.0**

Además se debe verificar la versión de NVM instalada en el entorno.
```bash
npm -v 
```
Debería devolver **10.8.2**

---

## 5.2).	Instalación de Plugins
Al ser un proyecto de NodeJS, para evitar la ejecución del Pipeline de Jenkins falle se debe instalar el Plugin correspondiente a NodeJS. Los pasos son los siguientes: 
1. **Acceder a Jenkins**: Abre tu navegador web y accede a la URL de servidor Jenkins (en este caso la URL expuesta por Ngrok).
2. **Iniciar sesión**: Ingresa tus credenciales de usuario y contraseña para acceder al dashboard de Jenkins.
3. **Acceder a la Gestión de Plugins**: 
- En el tablero de Jenkins, haz clic en **Manage Jenkins** (Gestionar Jenkins) en el menú de la izquierda.
- Dentro de la página de gestión, selecciona la opción “Plugins” de System Configuration.
4. **Buscar el Plugin de NodeJS**: 
- Dentro de la pestaña **Available** (Disponible), utiliza la barra de búsqueda para encontrar el plugin escribiendo **NodeJS**.
- Marca la casilla al lado del plugin de **NodeJS** y presiona el botón **Install** (Instalar).
5. **Instalar el Plugin**: 
- Haz clic en el botón **Install without restart** (Instalar sin reiniciar) para comenzar la instalación.
- Una vez haya finalizado la descarga y la instalación del Plugin, si no hay otros plugin por descargar, se debe marcar la casilla de **Reiniciar Jenkins cuando termine la instalación y no queden trabajos en ejecución**.
- **Importante**: El reinicio puede demorar bastante tiempo, por lo cual se recomienda instalar todos los plugin antes de realizar el reinicio.
- Procederá a reiniciar Jenkins para aplicar el Plugin instalado.
- Una vez finalizado, te solicita ingresar con tus credenciales y ya estará habilitado el Plugin para su uso.

---

## 5.3).	Configuración de Tools
Después de la instalación del plugin de NodeJS, se debe configurar el Tools correspondiente a dicho Plugin.
1. Se debe ir a Manage Jenkins, se accede desde el Dashboard.
2. Selecciona Global Tool Configuration (Configuración Global de Herramientas).
3. Desplázate hacia abajo hasta encontrar la sección **NodeJS**.
4. Configura la versión de NodeJS que deseas usar en tu entorno de Jenkins. Asegúrate de marcar la opción **Install automatically** (Instalar automáticamente) si deseas que Jenkins maneje la instalación de NodeJS.
5. En el campo Nombre se le puede setear un valor a gusto, pero en este caso como tomara el código del archivo Jenkinsfile del repositorio Github, el cual tiene un apartado tools, para que el pipeline lo reconozca se le debe colocar el mismo valor nodejs.
6. En el campo Versión debe ser igual o similar a la versión instalada en la VM (**5.1 Instalación de NodeJS en la VM**), en este caso sería la versión **20.17.0**
7. Después de configurar nodejs, haz clic en Save (Guardar) para aplicar los cambios.

Con estos pasos, tendrás el plugin de NodeJS instalado y configurado en Jenkins, listo para ser utilizado en tus pipelines.

## 5.4).	Crear una Credencial Jenkins
Una credencial Jenkins permite conectar, Jenkins con Github para acceder a un repositorio  (entre otras opciones), los pasos para crear una credencial son:
1. Desde el Dashboard (Panel de Control) se debe acceder a la opción Administrar Jenkins del panel de opciones a la Izquieda.
2. Debe acceder a la opción Credentials (Credenciales) en la lista de opciones de Security (Seguridad).
3. Cuando se accede se podrá visualizar las credenciales existentes (si se crearon previamente), como Credentials (Credenciales) estará vacío, se debe acceder “System” remarcado en la screen.
4. En System, acceder a Global credentials (unrestricted)
5. Una vez ingresado, se debe hacer clic en el botón el cual desplegara una interfaz para completar los datos de la credencial.
- Los campos **Kind** y **Scope** se dejan por defecto en este caso.
- En el campo **Username** se le puede colocar el nombre de tu cuenta de Github (en mi caso KevinHidalgo)
- En el campo **Password** debe ir valor del Token creado en Github (**4). Creación de Token en Github**)
- El campo **ID** es un nombre con el cual podes identificarlo entre todas las credenciales que puedas crear.
- El campo **Description** (descripción) que es Opcional, puedes colocar en él un texto para trasparentar el uso de dicha credencial. 
6. Una vez confirmada se creara la credencial la cual podrás utilizar al momento de configurar el pipeline.

---

## 5.5).	Creación de Pipeline
Este es un instructivo de la creación de un pipeline simple en Jenkins sin configuraciones:
1. **Acceder a Jenkins**: Abre tu navegador web y accede a la URL de servidor Jenkins (Puede ser el local como el expuesto por Ngrok).
2. **Iniciar sesión**: Ingresa tus credenciales de usuario y contraseña para acceder al dashboard de Jenkins.
En la página principal de Jenkins, haz clic en **New Item** (Nuevo Elemento) en el menú de la izquierda. 
3. **Crear un Nuevo Pipeline**: 
- En la página de creación de un nuevo ítem, escribe un nombre para tu pipeline.
- Selecciona la opción **Pipeline** y haz clic en **OK**.
4. **Configurar el Pipeline**:
- En la página de configuración del pipeline, ve a la sección **Pipeline**.
- Aquí tienes dos opciones para definir el pipeline:
  - **Script Pipeline**: El código a ejecutar se define directamente en el Pipeline.

<p align="center">
<a href="#" target="_blank" rel="noopener noreferrer">
<img width="100%" heigth="100%" src="Image/Script Pipeline.png" alt="Flujo Script Pipeline">
</a>
</p>

 - **Pipeline Script from SCM**: Si tu código de pipeline está en un repositorio de control de versiones (como Git), selecciona esta opción y configura los detalles del repositorio.
Para esta opción seguir los pasos del punto **5.6) Configuración del Pipeline**

<p align="center">
<a href="#" target="_blank" rel="noopener noreferrer">
<img width="100%" heigth="100%" src="Image/Pipeline Script from SCM.png" alt="Flujo Script Pipeline">
</a>
</p>

7. **Guardar y Ejecutar el Pipeline**:
- Después de configurar el pipeline, haz clic en **Save** (Guardar).

Este pipeline básico está configurado para ejecutarse manualmente, pero también puedes integrar webhooks de GitHub o configuraciones similares para automatizar su ejecución cuando se realicen cambios en el código.

---

## 5.6).	Configuración del Pipeline
Para que un pipeline utilice el código de un repositorio en ves del código escrito en el pipeline, ya que es más óptimo porque reduce los cambios en el pipeline (cualquier cambio realizado se realiza en el repositorio de Github). 

Se debe realizar los siguientes pasos para configurar el Pipeline Script from SCM.

1. Posicionado en el Pipeline se debe acceder a la opción **Configurar**
2. En la sección de **Build Triggers** se al activar la opción **GitHub hook trigger for GITScm polling** estaría habilitando que se dispare el pipeline de forma automática cuando se aplique un cambio sobre el repositorio de github configurado.
3. En la sección **Pipeline** estará el campo Definición en donde se especifica qué tipo de Pipeline se quiere crear (**Script Pipeline o un Pipeline Script from SCM**).
En este caso se utilizara la opción Pipeline Script from SCM.
- En el campo **SCM** se especificara de que gestor de versionado se tomara el código del repositorio, en este caso se colocara la opción de **Git** que viene por defecto instalado en Jenkins.
- Al seleccionar la opción **Git**, se desplegaran unos campos a completar para que pueda llegar al repositorio en cuestión.
- **Seccion Repositories**: 
**Repository URL**: Se debe colocar la URL del repositorio en donde se encuentra el código.
Si no conoces la URL, puedes obtenerla siguiendo estos pasos:
- Ir a tu Github (con la sesión ya iniciada)
- Ir a la sección de Repositorios y acceder al que quieres vincular.
- Una vez que hayas accedido al repositorio, para obtener la URL se debe hacer clic en **<> Code**, hacer click en la opcion **HTTPS** y copiar la URL que retorna.
- Así podrás obtener la URL del repositorio a utilizar.
**Credentials**: Se debe seleccionar la credencial que se utilizara para acceder al repositorio.
Si no posees una credencial creada, puedes generarla de 2 formas: 
- **Opción 1**: Siguiendo los pasos del punto **5.4 Crear una Credencial Jenkins**.
- **Opción 2**: Presionar el botón **+ Add** y utilizar la opción **Jenkins**
- La misma interfaz para cargar los datos de la credencial como en el punto (**5.4 Crear una Credencial Jenkins**).
- Una vez creada o seleccionada la credencial, se debe colocar el nombre del Branch del repositorio para que tome el código.
En este caso el nombre del branch es **/main** ya que así está en el repositorio.
- Una vez definido el branch, se debe definir el nombre del archivo Jenkinsfile que es el que contiene el código a ejecutarse.
El nombre a colocar debe obtenerse del repositorio.
- Una vez configurado todo, se hace clic en Guardar.

De esta forma se crea y configura el pipeline correspondiente a Desafio2.

# Glosario
Contiene una definición sobre los términos posibles que no conozcan.
1. **Branch**: Las branch son ramas que permiten desarrollar características, corregir errores, o experimentar con seguridad las ideas nuevas en un área contenida de tu repositorio. 
2. **Dashboard**: Es una herramienta de gestión de la información que monitoriza, analiza y muestra de manera visual.
3. **Fork**: Es un nuevo repositorio que comparte código y configuraciones de visibilidad con el repositorio original.
4. **Github**: Es una plataforma de desarrollo colaborativo para alojar proyectos utilizando el sistema de control de versiones Git.
5. **Jenkins**: Es un servidor open source de integración continua que permite compilar y probar proyectos de software de forma continua.
6. **Log**: Es un registro secuencial y cronológico de las operaciones realizadas.
7. **Multipass**: Es una herramienta flexible y potente, se puede utilizar para crear y destruir rápidamente máquinas virtuales (instancias) de Ubuntu en cualquier máquina host.
8. **Ngrok**: Es una aplicación multiplataforma que crea túneles (rutas) seguros a la máquina host local. Permite a los desarrolladores exponer un servidor de desarrollo local a Internet con un mínimo esfuerzo.
9. **NVM**: Node Version Manager, es una herramienta de línea de comandos que facilita la instalación, administración y cambio de versiones de Node. js en un sistema. NVM permite a los desarrolladores instalar y gestionar varias versiones de Node. js en una máquina sin interferencias entre ellas.
10. **Pipeline**: Es una serie de complementos que permiten integrar elementos relacionados con la entrega continua en el sistema.
11. **Plugins**: Es una aplicación (o programa informático) que permite extender las funciones de otra aplicación o programa sin tener que modificar el código
12. **Push**: El comando push (git push) sube el contenido de un repositorio local (tu pc) a un repositorio central (github).
13. **Pull Request**: Una solicitud de cambios es una propuesta para combinar un conjunto de cambios de una rama con otra. En una solicitud de cambios, los colaboradores pueden revisar y analizar el conjunto propuesto de cambios antes de integrar los cambios en el código base principal.