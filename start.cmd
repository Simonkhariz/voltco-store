@echo off
rem Starts VOLT.CO on this PC. XAMPP's MySQL must be running first.
cd /d "%~dp0"
if not exist .next\BUILD_ID call npm run build
start "VOLT.CO server" cmd /k npm run api
timeout /t 3 /nobreak >nul
start "" http://voltco.localhost:3106
npm run start
