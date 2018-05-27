# Correo_Inicio_equipo
Cada vez que se inicie el equipo envia un correo con la fecha y la hora, en caso de no tener conexion 
almacena las entradas en un log para enviarlas posteriormente.

Contiene un apartado configuracion (rellenar correctamente)
::CFG +++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA CARPETA PRINCIPAL
set RUTAPRINCIPAL=C:\MAIL                             < ruta donde se crearan los archivos temporales
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA DE FICHEROS
set RUTALOG=%RUTAPRINCIPAL%\LOG.txt
set RUTATESTIGO=%RUTAPRINCIPAL%\TESTIGO.txt
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

NOTA: Actualmente el envio de correo funciona correctamente con estos parametros, en mi caso uso arsis como servidor de correo pero si usas gmail
segun el servidor de correo se tendria que cambiar los parametros a usar del blat. 
