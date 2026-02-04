@echo off
echo Starting QCoDeS + Labber installer...
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0power_shell_script.ps1"

echo.
echo Installer finished.
pause