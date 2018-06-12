# Correo_Inicio_equipo

Pequeño .Bat con la funcion que cada vez que se inicie el equipo envia un correo con la fecha y la hora, en caso de no tener conexion almacena las entradas en un log para enviarlas posteriormente.

Contiene un apartado configuracion (rellenar correctamente)

::CFG +++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA CARPETA PRINCIPAL
set RUTAPRINCIPAL=C:\MAIL                                < ruta donde se crearan los archivos temporales
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA DE FICHEROS
set RUTALOG=%RUTAPRINCIPAL%\LOG.txt
set RUTATESTIGOCONEXION=%RUTAPRINCIPAL%\TESTIGOCONEXION.txt
::CORREO
set DE=test.com
set PARA="test.com"

set SUJETO="Inicio del equipo"
set MENSAJE="Se inicio el equipo a las %date% %time%"

set SUJETOADJ="Adjunto inicio equipo"
set MENSAJEADJ="Adjunto inicio equipo"
::CUENTA
set SERVER="smtp.com"
set USUARIO="test.com"
SET PASSWORD="test"
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++

NOTAS: 
- Se tiene que agregar el .bat para que se ejecute cada vez que se inicie el equipo en tareas programadas.
- Se tiene que tener Blat en el mismo directorio que el bat.

Si tu servidor solo admite conexiones seguras, quieres usar gmail o algun otro. 
tendras que instalar stunnel para agregar el SSL.

Ejemplo de uso con Gmail.

Una vez instalado, se nos abrira debajo en la barra de tareas a mano derecha un GUI lo abrimos.

Entramos a configuration > edit configuration y se abrira un txt de configuracion. 

buscamos la parte donde indique el servidor smtp de gmail y cambiamos la linea de accept que son las conexiones que acepta indicaremos despues de los dos puntos el numero de puerto que queramos en este ejemplo lo indicamos como 1099 

//--------------------------------------

[gmail-smtp]

client = yes

accept = 127.0.0.1:1099

connect = smtp.gmail.com:465

verifyChain = yes

CAfile = ca-certs.pem

checkHost = smtp.gmail.com

OCSPaia = yes

//--------------------------------------

Guardamos y salimos. 

Despues hacemos click sobre el botton de windows y ingresamos a “stunnel Service Install”. para instalarlo como servicio
y “stunnel Service Start” para iniciarlo.

Por ultimo en la variable de SERVER dentro del .bat colocamos 127.0.0.1:1099 que indica que nos conectamos al stunnel.

Espero que les sirva.

