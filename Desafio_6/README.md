# Desafio 6

### Procedimiento

# Verificar el acceso por SSH

Para realizar la ajecucion del playbook se debe primero configurar el acceso por SSH. Los pasos son:
1. Obtener la clave PEM
- Se debe acceder al Sandbox de AWS Academy
- hacer clic en **Start Lab**
- Una vez haya cargado AWS se debe hacer click en el boton Details y acceder a la opcion **Show**
- Una vez ingresado se debe hacer clic en el boton **Show** de **SSH Key** y copiar la cadena de caracteres correspondiente.
- En la PC por la cual se realizara la ejecucion del Playbook por SSH, se debe crear un archivo con el nombre vockey.pem y pegar la cadena de caracteres copiada anteriormente.
- Una vez creado el vockey.pem se le debe dar permisos con el comando 
chmod 400 vockey.pem

2. Modificar instancia Bastion Host
- Se debe hacer clic en el boton **AWS** que se encuentra en el Sandbox para abrir el AWS levantado.
- Se debe acceder a las instancias de EC2 (Elastic Conteiner Services) y seleccionar el Bastion Host.
- Una vez marcada se debe ir a **Acciones** -> **Seguridad** --> **Modificar Rol de IAM**.
- Se debe seleccionar el rol de **LabInstanceProfile** el cual permitira el acceso por SSH.
- Una vez guardado los cambios y esperar que la instancia haya aplicado los cambios, se debe ingresar a la opcion **Conectar**.
- En la tercer opcion **SSH Client** especifica como se llama el host (ejemplo ec2-3-90-20-20.compute-1.amazonaws.com) y el nombre de usuario de AWS utilizado (ec2-user).

Para comprobar la conexion al EC2, se puede realizar de 2 formas:
- Realizar un ping al servidor
ansible -i inventario.ini all -m ping
- Acceder al servidor por SSH utilizando el comando que te da en **SSH Client**
Ejemplo: ssh -i "vocket.pem" ec2-user@ec2-54-103-204-123.compute-1.amazonaws.com

 

