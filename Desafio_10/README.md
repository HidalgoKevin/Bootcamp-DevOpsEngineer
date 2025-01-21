# Guía de Instalación y Configuración de ArgoCD
## 1. Instalación de Prerrequisitos
Antes de iniciar con la instalación de ArgoCD, asegurémonos de contar con las herramientas necesarias.

### Instalar kubectl
Descarga kubectl correspondiente a tu versión de Kubernetes desde su página oficial.
https://kubernetes.io/docs/tasks/tools/

Una vez instalado, se puede verificar la instalación:

```bash
kubectl version --client --output=yaml
```

### Instalar Minikube
Descarga e instala Minikube desde su página oficial.
https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download

Una vez instalado, se debe iniciar el clúster local:

```bash
minikube start
```

---

## 2. Instalación de ArgoCD
ArgoCD se instala en un namespace dedicado dentro de Kubernetes.

- Paso 1: Crear el namespace para ArgoCD

```bash
kubectl create namespace argocd
```

- Paso 2: Aplicar los manifiestos de instalación
Descarga los manifiestos prediseñados de instalación desde el repositorio oficial de ArgoCD:

```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Verifica que todos los pods estén en estado Running:

```bash
kubectl get pods -n argocd
```

- Paso 3: Exponer el servicio de ArgoCD
Por defecto, el servicio argocd-server está configurado como ClusterIP. Debemos exponerlo para acceder al dashboard:

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Accede al dashboard de ArgoCD en https://localhost:8080.

- Paso 4: Obtener las credenciales de inicio de sesión
**Usuario**: admin.
**Contraseña**: Es el nombre del pod de argocd-server. Obténlo con:

```bash
kubectl get pods -n argocd -o name | grep argocd-server | cut -d'/' -f2
```

3. Configuración de un Repositorio de Git
ArgoCD permite gestionar aplicaciones desde un repositorio Git.

- Paso 1: Crear un repositorio en GitHub
Crea un repositorio en GitHub para gestionar los manifiestos de tu aplicación.
Añade un archivo deployment.yaml y otros recursos necesarios.

- Paso 2: Conectar ArgoCD con el repositorio
Desde el dashboard de ArgoCD, selecciona "New App".

Configura los detalles:
- **App Name**: mi-aplicacion.
- **Project**: default.
- **Repository URL**: URL de tu repositorio GitHub.
- **Path**: Carpeta que contiene los manifiestos.
- **Cluster URL**: https://kubernetes.default.svc
- **Namespace**: Namespace deseado para desplegar la aplicación.
Haz clic en "Create" para iniciar el despliegue.

4. Validación del Despliegue
Verifica que la aplicación aparece en el dashboard de ArgoCD como Synced y Healthy.
Confirma que los recursos están creados en Kubernetes:

```bash
kubectl get all -n <namespace_de_la_aplicación>
```
