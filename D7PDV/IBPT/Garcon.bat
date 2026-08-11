@echo off
title Acesso MobGarcom
color 0A
echo Procurando IP da rede...

:: 1. Pega o IP local
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /i "IPv4"') do set IP=%%i
:: Remove os espacos em branco
set IP=%IP: =%

echo O IP encontrado foi: %IP%:88
echo Gerando tela de acesso...

:: 2. Define onde salvar a pagina temporaria
set HTMLFILE="%temp%\AcessoMobGarcom.html"

:: 3. Cria a pagina HTML com visual moderno
echo ^<!DOCTYPE html^> > %HTMLFILE%
echo ^<html^>^<head^>^<title^>Acesso MobGarcom^</title^> >> %HTMLFILE%
echo ^<style^> >> %HTMLFILE%
echo body { font-family: Arial, sans-serif; text-align: center; background-color: #f0f2f5; margin-top: 50px; } >> %HTMLFILE%
echo .card { background: #ffffff; padding: 40px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); display: inline-block; } >> %HTMLFILE%
echo h1 { color: #2c3e50; margin-top: 0; } >> %HTMLFILE%
echo p { color: #555555; font-size: 18px; margin-bottom: 25px; } >> %HTMLFILE%
echo .ip-link { color: #e74c3c; text-decoration: none; font-weight: bold; font-size: 22px; } >> %HTMLFILE%
echo ^</style^>^</head^>^<body^> >> %HTMLFILE%
echo ^<div class="card"^> >> %HTMLFILE%
echo ^<h1^>📱 Acesso ao MobGarcom^</h1^> >> %HTMLFILE%
echo ^<p^>Aponte a camera do seu celular para o QR Code abaixo para conectar.^</p^> >> %HTMLFILE%
:: O QR Code
echo ^<img src="https://api.qrserver.com/v1/create-qr-code/?size=300x300^&data=http://%IP%:88" alt="QR Code"^> >> %HTMLFILE%
echo ^<br^>^<br^> >> %HTMLFILE%
echo ^<p^>Ou digite o endereco abaixo no navegador do celular:^</p^> >> %HTMLFILE%
echo ^<a class="ip-link" href="http://%IP%:88" target="_blank"^>http://%IP%:88^</a^> >> %HTMLFILE%
echo ^</div^> >> %HTMLFILE%
echo ^</body^>^</html^> >> %HTMLFILE%

:: 4. Abre a pagina no navegador padrao do Windows
start "" %HTMLFILE%

exit