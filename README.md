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
- Actualmente Blat no admite conexiones seguras lo que significa que si su servidor de correo esta configurado solo para conexiones seguras no servira.
