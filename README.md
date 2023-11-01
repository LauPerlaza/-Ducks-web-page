#  Ducks Web Page - Infraestructura de AWS 
---

by Laura Perlaza

## Información general
---

Este repositorio contiene una infraestructura de AWS (Amazon Web Services), con el código de terraform para crear los recursos que utilizamos como Amazon Certificate Manager (ACM), Application Load Balancer (ALB), Amazon Elastic Compute Cloud (EC2), Networking, Amazon Route 53 y un Target Group. El estado de terrafor se almacena esn un bucket de S3. 

## Descripción
---

Este repositorio alberga la configuración e infraestructura para el proyecto "Ducks Web Page" en AWS (Amazon Web Services). "Ducks Web Page" es una tienda en línea que se especializa en la venta de productos relacionados con patos. 

**Recursos creados:**

- **Networking:** El diseño de la infraestructura de red se basa en una Virtual Private Cloud (VPC) en AWS, que se divide en dos grupos de subredes para una mejor organización y seguridad.

    **subredes públicas:** En estas subredes, alojamos los recursos de AWS que requieren acceso directo a Internet. Los componentes ubicados en estas subredes pueden tener direcciones IP públicas, lo que permite que los recursos de AWS se comuniquen con ellos a través de Internet.
    **subredes privadas** Las subredes privadas albergan recursos de AWS que no necesitan acceso directo desde Internet. Los recursos en estas subredes no pueden asignar direcciones IP públicas y, por lo tanto, no están directamente expuestos a la web.

Cada subred se asocia con una zona de disponibilidad (AZ) de AWS para garantizar la alta disponibilidad y redundancia de los servicios. Es importante destacar que AWS recomienda distribuir los servicios en al menos dos subredes o AZ para garantizar la resiliencia.

La seguridad a nivel de VPC se gestiona a través de listas de control de seguridad de red (Network ACLs), que permiten controlar y filtrar el tráfico de red entrante y saliente. Además, se utiliza una tabla de rutas para dirigir el tráfico de manera efectiva dentro de la VPc. También se implementa un Internet Gateway para permitir la conectividad sólida con Internet cuando sea necesario.


-  **Amazon Elastic Compute Cloud (EC2):** La aplicación web se aloja en una instancia EC2 configurada con el sistema operativo Ubuntu y el servidor web Apache. Esto permite que la instancia sirva el contenido de la tienda en línea de patos. Este enfoque garantiza un ambiente controlado y seguro para la aplicación, al tiempo que proporciona escalabilidad y rendimiento.

- **Amazon Auto Scaling:** Se ha agregado un grupo de Auto Scaling a la instancia EC2 para garantizar la alta disponibilidad y escalabilidad de la aplicación web. Esto significa que, en función de la carga de tráfico, AWS puede crear automáticamente nuevas instancias EC2 idénticas para manejar un aumento de la demanda y, de manera similar, reducir la cantidad de instancias cuando la demanda disminuye. Esto ayuda a mantener el rendimiento de la aplicación y garantiza que esté siempre disponible para los usuarios.

- **Amazon Certificate Manager (ACM):** Se ha agregado un certificado ACM para habilitar HTTPS en la aplicación web. Esto proporciona una capa adicional de seguridad al cifrar las comunicaciones entre los usuarios y la aplicación.

- **Amazon Load Balancer (ALB):** Se ha implementado un Load Balancer, en las subredes públicas. El ALB distribuye de manera eficiente el tráfico entrante entre las instancias EC2 para garantizar la alta disponibilidad y escalabilidad de la aplicación web para mantener la aplicación en funcionamiento de manera confiable.

- **Amazon Route 53:** Se utiliza para administrar la zona DNS y enrutar el tráfico de Internet a la infraestructura de "Ducks Web Page". Route 53 permite una gestión eficaz de los registros DNS y asegura que los visitantes sean dirigidos al Load Balancer y, posteriormente, a las instancias EC2 para acceder a la tienda en línea de patos de manera confiable.

Este diseño integral garantiza la escalabilidad, la seguridad, la alta disponibilidad y la confiabilidad de la tienda en línea de patos y permite a los usuarios acceder al sitio de manera segura a través de HTTPS. Además, el Load Balancer y Amazon Route 53 mejoran el rendimiento y la eficiencia del enrutamiento del tráfico.

## CI/CD
---

La integración continua y la entrega continua se han implementado en este proyecto utilizando GitHub Actions. En la carpeta .github de este repositorio, se encuentra un archivo YAML que define la canalización de CI/CD. Esta canalización se activa automáticamente al realizar un commit en la rama "develop" del repositorio.

La canalización de CI/CD se encarga de realizar varias tareas, que pueden incluir:

- **Pruebas automáticas:** Verifica que el código sea funcional y no introduzca errores.
- **Generación de artefactos:** Compila y empaqueta la aplicación para su implementación.
- **Despliegue automático:** Automatiza la implementación de la infraestructura en el entorno de producción o pruebas.

Además, como parte del proceso de CI/CD:

**Almacenamiento en Amazon S3:** El archivo de backend se almacena en un bucket de Amazon S3, lo que permite gestionar y distribuir recursos de backend de manera eficiente.

**Base de datos en Amazon DynamoDB:** Se crea una tabla de DynamoDB mediante un script dentro del flujo de trabajo del pipeline. Esto habilita el almacenamiento y gestión de datos de backend de manera escalable y eficiente.



