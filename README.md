# Proyecto Final Fundamentos Sistemas Operativos

# 1. Descargar e Instalar Terraform
- Ingresa al sitio oficial de Terraform: https://www.terraform.io/downloads.html
- Descarga la versión adecuada para tu sistema operativo (Windows, macOS o Linux).
- Descomprime el archivo descargado en una ubicación de tu elección.
- Agrega la ruta de la carpeta descomprimida al variable de entorno PATH. Esto te permitirá ejecutar Terraform desde cualquier ubicación en tu terminal. Esto dependerá de cada sistema, pero por ejemplo, en Windows, podremos ir a "Editar las variables de entorno del sistema" y agregarlas desde allí.

# 2. Descargar e Instalar AWS CLI
- Visita la página de instalación de AWS CLI: https://aws.amazon.com/cli/
- Sigue las instrucciones para instalar AWS CLI en tu sistema operativo.
- Después de la instalación, abre una terminal y ejecuta aws --version para verificar que AWS CLI se instaló correctamente.

# 3. Configurar AWS en nuestro ambiente
- En la terminal, ejecutar el comando "aws configure".
- Se te pedirá ingresar las siguientes credenciales de AWS:
    AWS Access Key ID: Ingresa la clave de acceso de tu usuario IAM de AWS.
    AWS Secret Access Key: Ingresa la clave secreta correspondiente a la clave de acceso.
    Default region name: Establece la región por defecto en la que deseas trabajar (por ejemplo, "us-east-2").
    Default output format: Puedes dejar este campo en blanco o seleccionar un formato de salida por defecto, como json o xml.
NOTA: Para saber nuestros credenciales debemos iniciar sesión en AWS, y en el apartado de nuestro perfil, ir a "Credenciales de seguridad" y generar una clave de acceso que también nos generará un .csv con los valores.

# 4 Generar un Par de Claves SSH:
El archivo mykey.pub se refiere a la clave pública que corresponde a la clave privada que utilizarás para acceder a las instancias EC2. La clave pública es necesaria para establecer la autenticación segura a través de SSH en las instancias que se creen. 

- Podemos generar una usando el siguiente comando en la terminal (asegúrate de estar en un lugar seguro, ya que la clave privada debe mantenerse segura):
ssh-keygen -t rsa -b 4096 -C "email@example.com"
Esto generará una clave pública y una clave privada en tu directorio local que hace por defecto ~/.ssh/. El archivo id_rsa.pub es significa la clave pública.

Una vez que tienes la clave pública generada, puedes utilizarla en tu archivo de configuración de Terraform. En el código para lanzar la EC2, la línea ´public_key = file("mykey.pub")´ está indicando que Terraform tomará la clave pública del archivo mykey.pub en el mismo directorio donde esta el archivo de configuración de Terraform.

Para utilizar tu clave pública generada anteriormente, se debe cambiar el path de la línea anterior donde hayamos ubicado nuestra ssh.

# 5. Editar y Ejecutar el código de Terraform
- Para ejecutar el archivo de terraformInit.tf que está dentro de la carpeta de EC2_Instances, debemos abrir una terminal y colocarnos dentro del archivo .tf para correr la automatización. Algunos de los comandos necesarios para esta ejecución son:
        - terraform init: Inicializa el directorio de trabajo.
        - terraform plan: Muestra los recursos que serán creados o los que fueron modificados.
        - terraform apply: Crea los recursos definidos en tu código.
Debemos confirmar la creación de recursos escribiendo "yes" cuando se te solicite.

This is a final project for our course "Fundamentos de Sistemas Operativos" at Fidélitas University
