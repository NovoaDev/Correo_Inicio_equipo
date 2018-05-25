@echo off

:: =========================================================================
::                   Author: lola-rica                                     =
::                   lolatmp@gmail.com                                     =
::                    github/Saycoron                                      =
:: =========================================================================

title /!\ Blat Mail /!\ By:Lola 

::CFG +++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA DEL FICHERO LOG PARA LLEVAR UN REGISTRO
set RUTALOG=C:\TEST\LOG.txt
::CORREO
set DE=test.com
set PARA="test.com"

set SUJETO="Inicio del equipo"
set MENSAJE="Se inicio el equipo a las %date% %time%"

::CUENTA
set SERVER="smtp.com"
set USUARIO="test.com"
SET PASSWORD="test"
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++

:VERIFICARCONEXION

if exist %PARAMETRORUTAPROGRAMA% (

) else (
	
)

:VERIFICASIEXISTELOG

if exist %PARAMETRORUTAPROGRAMA% (

) else (
	
)

:AGREGALINEAENLOG

if exist %PARAMETRORUTAPROGRAMA% (

) else (
	
)

:ELIMINALOG

if exist %PARAMETRORUTAPROGRAMA% (

) else (
	
)

:ENVIARCORREO

blat -body %MENSAJE% -to %PARA% -subject %SUJETO% -i %DE% -server %SERVER% -f %DE% -u %USUARIO% -pw %PASSWORD% -noh

if exist %PARAMETRORUTAPROGRAMA% (

) else (

)

:ENVIARCORREOCONLOG

blat -body %MENSAJE% -to %PARA% -subject %SUJETO% -i %DE% -server %SERVER% -f %DE% -u %USUARIO% -pw %PASSWORD% -noh

if exist %PARAMETRORUTAPROGRAMA% (

) else (

)

:FIN
exit