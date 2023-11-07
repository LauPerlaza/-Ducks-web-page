#  Ducks Web Page - Infraestructura de AWS 
---

by Laura Perlaza

## Información general
---

Este repositorio contiene la infraestructura para el proyecto "Ducks Web Page", que se ejecuta en Amazon Web Services (AWS) utilizando Terraform.
La infraestructura consta de 

- Una Virtual Private Cloud (VPC) dividida en subredes públicas y privadas
- Una instancia EC2 con Ubuntu y Apache
- Un grupo de Auto Scaling
- Amazon Certificate Manager (ACM)
- Un  Load Balancer (ALB)
- Amazon Route 53 
- un sistema de CI/CD implementado con GitHub Actions. 

Todo el estado de Terraform se almacena en un bucket de Amazon S3 para una gestión eficiente. Este diseño garantiza la escalabilidad, disponibilidad y seguridad de la aplicación web.
