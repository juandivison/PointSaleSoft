@echo off
setlocal
dotnet restore
if errorlevel 1 exit /b 1
dotnet build -c Release
if errorlevel 1 exit /b 1
echo Build completado.
