

<p align="center">
<img src="./imagenes/logo.jpg">
</p>

# Manual técnico

En este manual técnico del proyecto de aplicación web HOME EASY, se explicará las funciones tanto de administrador como de usuario, esta aplicación trata sobre una empresa que realiza cotizaciones online para venta de hormigón por metro cubico y cuenta con tres valores de precio de manera inicial ya que hay 3 tipos de mezclas sería el tipo 1, tipo 2 y tipo 3 con diferentes valores
A continuación, se mostrará la estructura de las tablas 

### Tabla registro de usuario
<p align="center">
<img src="./imagenes/tablaregistros.jpg">
</p>

### Tabla cotizaciones
<p align="center">
<img src="./imagenes/tablacotizacion.jpg">
</p>

### Tabla contacto
<p align="center">
<img src="./imagenes/tablacontacto.jpg">
</p>

##Tabla stock
<p align="center">
<img src="./imagenes/stock.jpg">
</p>

### Tabla total stock (nota: en esta tabla no se ingresarán datos de forma manual solo mostrara el total de stock)
<p align="center">
<img src="./imagenes/totalstock.jpg">
</p>


A continuacion se dara a conocer el funcionamiento del sistema web home easy, se mostrara la pantalla de registro en la cual solo se debe poner el nombre de usuario que debe ser unico para cada persona al igual que el correo electronico 
<p align="center">
<img src="./imagenes/login.jpg">
</p>

Se ha creado una cuenta de ejemplo con el nombre de usuario “carlos” y contraseña “12345” a modo de ejemplo para que sea administrador, el cual tendra todos los privilegios en la plataforma web
<p align="center">
<img src="./imagenes/pantallacotizacion.jpg">
</p>

Y otras cuentas de usuarios que solo tendrán acceso a 2 páginas de “cotización” y “contacto” como por ejemplo nombre de usuario “Vladimir” y contraseña “12345”
<p align="center">
<img src="./imagenes/pantalla.jpg">
</p>

Las contraseñas se almacenan en la base de datos encriptadas en SHA256 para tener una mayor seguridad de los datos del cliente y o usuario y un token para verificar a este mismo
<p align="center">
<img src="./imagenes/contraseña.jpg">
</p>

<p align="center">
<img src="./imagenes/token.jpg">
</p>

Se realizaron validaciones de campos de formularios como del teléfono que sea numérico, el email sea coherente en cuanto a formato y el ingreso de cantidades numéricas también
<p align="center">
<img src="./imagenes/validaciones.jpg">
</p>

## A continuación, se verá cada pantalla con sus respectivos formularios y campos

### Pantalla contacto
<p align="center">
<img src="./imagenes/pantallacontacto.jpg">
</p>


### Pantalla cotización
<p align="center">
<img src="./imagenes/pantallacotizacion.jpg">
</p>


### Pantalla stock
<p align="center">
<img src="./imagenes/pantallastock.jpg">
</p>


### Pantalla total stock
<p align="center">
<img src="./imagenes/pantallatotalstock.jpg">
</p>

### En esta pantalla se mostrará las funciones de los botones de los formularios
<p align="center">
<img src="./imagenes/funciones.jpg">
</p>

Algunas cosas que no se lograron arreglar por el momento fue que llegara un correo de verificación para autentificar la cuenta creada, una solución momentánea fue ingresar al registro de la tabla donde se almacenan los datos de creación de usuario y modificar el valor a “0” para que se pudiera verificar la cuenta
<p align="center">
<img src="./imagenes/validacionusuario.jpg">
</p>

