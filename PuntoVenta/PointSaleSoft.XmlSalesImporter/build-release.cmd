@echo off
setlocal

cd /d "%~dp0"

set "PROJECT=PointSaleSoft.XmlSalesImporter.csproj"
set "OUTPUT=publish"

if exist "%OUTPUT%" (
  echo Limpiando publicacion anterior...
  rmdir /s /q "%OUTPUT%"
)

echo Publicando ejecutable unico autocontenido para Windows x64...

dotnet publish "%PROJECT%" ^
  -c Release ^
  -r win-x64 ^
  --self-contained true ^
  -p:PublishSingleFile=true ^
  -p:IncludeNativeLibrariesForSelfExtract=true ^
  -p:EnableCompressionInSingleFile=true ^
  -p:PublishTrimmed=false ^
  -p:DebugType=None ^
  -p:DebugSymbols=false ^
  -o "%OUTPUT%"

if errorlevel 1 (
  echo.
  echo ERROR: No fue posible publicar el proyecto.
  exit /b 1
)

echo.
echo Publicacion completada correctamente.
echo Ejecutable: %CD%\%OUTPUT%\PointSaleSoft.XmlSalesImporter.exe
echo.
echo NOTA: Las dependencias de .NET y NuGet estan incluidas en el EXE.
echo       appsettings.json permanece separado para permitir cambiar
echo       la conexion Firebird y las rutas sin recompilar.

endlocal
