@echo off

:: =========================================================================
::                   Author: lola-rica                                     =
::                   lolatmp@gmail.com                                     =
::                    github/Saycoron                                      =
:: =========================================================================

title /!\ Blat Mail /!\ By:Lola 

::CFG +++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA CARPETA PRINCIPAL
set RUTAPRINCIPAL=C:\MAIL
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++
::RUTA DE FICHEROS
set RUTALOG=%RUTAPRINCIPAL%\LOG.txt
set RUTATESTIGO=%RUTAPRINCIPAL%\TESTIGO.txt
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
if exist %RUTATESTIGO% del %RUTATESTIGO%
set ERRORLEVEL =
ping -n 1 www.google.com > %RUTATESTIGO%
@find /C "La solicitud de ping no pudo encontrar el host" %RUTATESTIGO% > null
if %ERRORLEVEL%==0 call:VERIFICASIEXISTELOG "NO" else call:VERIFICASIEXISTELOG "SI"

:VERIFICASIEXISTELOG
set EXISTECONNECT=%~1

if %EXISTECONNECT% EQU "SI" (
	if exist %RUTALOG% (
		call:AGREGALINEAENLOG "SI"
	) else (
	
	)
) else (
	if exist %RUTALOG% (

	) else (
	
	)
)

:AGREGALINEAENLOG
set ENVIALOG=%~1
if not exist %RUTALOG% echo Creacion de fichero  ----------------------------------------------------------- >>%RUTALOG%
echo Se inicio el equipo a las %date% %time% >> %RUTALOG%

if %ENVIALOG% EQU "SI" (
	call:ENVIARCORREOADJ "SI"
) else (

)

:ELIMINALOG
goto FIN

:ENVIARCORREO

blat -body %MENSAJE% -to %PARA% -subject %SUJETO% -i %DE% -server %SERVER% -f %DE% -u %USUARIO% -pw %PASSWORD% -noh

if exist %PARAMETRORUTAPROGRAMA% (

) else (

)

:ENVIARCORREOADJ

blat -body %MENSAJE% -to %PARA% -subject %SUJETO% -i %DE% -server %SERVER% -f %DE% -u %USUARIO% -pw %PASSWORD% -attach %RUTALOG% -noh
if %ERRORLEVEL%==0 goto ELIMINALOG else goto FIN


:FIN
exit