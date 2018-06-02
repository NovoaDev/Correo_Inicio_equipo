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
goto VERIFICARCONEXION

:VERIFICARCONEXION
if exist %RUTATESTIGOCONEXION% del %RUTATESTIGOCONEXION%
set ERRORLEVEL =
ping -n 1 www.google.com > %RUTATESTIGOCONEXION%
@find /C "La solicitud de ping no pudo encontrar el host" %RUTATESTIGOCONEXION% > null
if %ERRORLEVEL%==0 call :VERIFICASIEXISTELOG "NO"
if %ERRORLEVEL%==1 call :VERIFICASIEXISTELOG "SI"

:VERIFICASIEXISTELOG
set EXISTECONNECT=%~1
if %EXISTECONNECT% EQU SI (
	if exist %RUTALOG% ( call :AGREGALINEAENLOG "SI" ) else ( call :ENVIARCORREO )
) else ( call:AGREGALINEAENLOG "NO" )
goto:EOF

:AGREGALINEAENLOG
set ENVIALOG=%~1
if not exist %RUTALOG% echo Creacion de fichero  ----------------------------------------------------------- >>%RUTALOG%
echo Se inicio el equipo a las %date% %time% >> %RUTALOG%
if %ENVIALOG% EQU SI ( call :ENVIARCORREOADJ ) else ( goto FIN )
goto:EOF

:ENVIARCORREO
blat -body %MENSAJE% -to %PARA% -subject %SUJETO% -i %DE% -server %SERVER% -f %DE% -u %USUARIO% -pw %PASSWORD% -noh
if %ERRORLEVEL%==0 ( goto FIN ) else ( call :AGREGALINEAENLOG "NO" )
goto:EOF

:ENVIARCORREOADJ
blat -body %MENSAJEADJ% -to %PARA% -subject %SUJETOADJ% -i %DE% -server %SERVER% -f %DE% -u %USUARIO% -pw %PASSWORD% -attach %RUTALOG% -noh
if %ERRORLEVEL%==0 ( call :ELIMINALOG ) else ( goto FIN )
goto:EOF

:ELIMINALOG
DEL %RUTALOG%
goto FIN
goto:EOF

:FIN
exit