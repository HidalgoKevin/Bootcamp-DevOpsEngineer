# Desafio 7

## Descripción
El objetivo principal es diseñar e implementar una infraestructura en AWS para servir contenido estático de manera eficiente, segura y global utilizando las mejores prácticas de Infraestructura como Código (IaC) con Terraform. Para ello, se integra con Amazon CloudFront, el cual optimiza la distribución del contenido al reducir la latencia y proporcionar acceso global seguro.

Esta infraestructura debe cumplir con los siguientes lineamientos técnicos:

### Flexibilidad en el origen de contenido:

Configurar un bucket S3 para almacenar y servir contenido estático.
Hacer que el bucket sea privado, asegurando que únicamente CloudFront tenga acceso al contenido mediante Origin Access Control (OAC).

### Entrega de contenido segura y rápida:
Utilizar Amazon CloudFront como capa de distribución global para entregar el contenido con menor latencia.
Implementar un redireccionamiento automático a HTTPS para asegurar que todas las solicitudes sean servidas de forma segura.

### Reusabilidad y modularidad del código:
Implementar una solución basada en módulos reutilizables de Terraform, que encapsulen la lógica para crear y configurar un S3, junto con sus respectivas distribuciones de CloudFront.
Usar archivos de variables para parametrizar las configuraciones y facilitar la personalización de los despliegues.

### Optimización operativa:
Habilitar escalabilidad y adaptabilidad, permitiendo que cualquiera de las opciones pueda ser utilizada según las necesidades del negocio.
Documentar y describir cada sección del código para garantizar la transparencia y facilitar su mantenimiento.

### Pruebas y evidencias:
Proporcionar la URL pública de CloudFront para demostrar que el sitio está funcionando correctamente.
Capturas de pantalla que validen el acceso exitoso al contenido distribuido por CloudFront.
Esta implementación no solo garantiza un servicio eficiente y seguro, sino que también promueve buenas prácticas en el desarrollo y despliegue de infraestructura, asegurando que los recursos sean manejados de manera eficiente, fácilmente replicables y seguros en un entorno AWS.

----------------------------------------------------------------------------------------

# SUBIR UN ARCHIVO POR AWS CLI

Paso adicional para subir el archivo index.html después de la creación del bucket
Después de ejecutar terraform apply, puedes subir el archivo index.html al bucket S3 utilizando la CLI de AWS o cualquier otra herramienta que prefieras.

Subir el archivo index.html utilizando la CLI de AWS:
aws s3 cp index.html s3://mi-sitio-estatico/index.html

# CONFIGURAR LAS CREDENCIALES

Verifica si el archivo existe:
ls ~/.aws/credentials

Si el archivo no existe, tendrás que crearlo.
Crea el archivo si no existe:
mkdir -p ~/.aws
touch ~/.aws/credentials

Asegúrate de tener los permisos correctos:
chmod 600 ~/.aws/credentials

Edita el archivo usando un editor de texto: Si estás usando vim y recibes el error, intenta usar otro editor de texto como nano:
nano ~/.aws/credentials

Agrega tus credenciales:
[default]
aws_access_key_id = TU_ACCESS_KEY_ID
aws_secret_access_key = TU_SECRET_ACCESS_KEY

