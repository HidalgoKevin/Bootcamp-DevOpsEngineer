# Desafio 7

## Descripción
El objetivo principal es diseñar e implementar una infraestructura en AWS para servir contenido estático de manera eficiente, segura y global utilizando las mejores prácticas de Infraestructura como Código (IaC) con Terraform. Para ello, se habilitan dos opciones de origen de contenido: Amazon S3 y Amazon EC2, ambas integradas con Amazon CloudFront, el cual optimiza la distribución del contenido al reducir la latencia y proporcionar acceso global seguro.

Esta infraestructura debe cumplir con los siguientes lineamientos técnicos:

### Flexibilidad en el origen de contenido:

-  Opción 1: Amazon S3:
Configurar un bucket S3 para almacenar y servir contenido estático.
Hacer que el bucket sea privado, asegurando que únicamente CloudFront tenga acceso al contenido mediante Origin Access Control (OAC).

- Opción 2: Amazon EC2:
Configurar una instancia EC2 con Nginx para servir contenido estático.
Proteger la instancia con un grupo de seguridad, permitiendo únicamente tráfico HTTP en el puerto 80 y acceso SSH restringido a una IP específica.

### Entrega de contenido segura y rápida:
Utilizar Amazon CloudFront como capa de distribución global para entregar el contenido con menor latencia.
Implementar un redireccionamiento automático a HTTPS para asegurar que todas las solicitudes sean servidas de forma segura.

### Reusabilidad y modularidad del código:
Implementar una solución basada en módulos reutilizables de Terraform, que encapsulen la lógica para crear y configurar tanto S3 como EC2, junto con sus respectivas distribuciones de CloudFront.
Usar archivos de variables para parametrizar las configuraciones y facilitar la personalización de los despliegues.

### Optimización operativa:
Habilitar escalabilidad y adaptabilidad, permitiendo que cualquiera de las opciones pueda ser utilizada según las necesidades del negocio.
Documentar y describir cada sección del código para garantizar la transparencia y facilitar su mantenimiento.

### Pruebas y evidencias:
Proporcionar la URL pública de CloudFront para demostrar que el sitio está funcionando correctamente.
Capturas de pantalla que validen el acceso exitoso al contenido distribuido por CloudFront.
Esta implementación no solo garantiza un servicio eficiente y seguro, sino que también promueve buenas prácticas en el desarrollo y despliegue de infraestructura, asegurando que los recursos sean manejados de manera eficiente, fácilmente replicables y seguros en un entorno AWS.