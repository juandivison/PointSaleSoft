@echo off
setlocal

dotnet restore
if errorlevel 1 exit /b 1

dotnet build -c Release
if errorlevel 1 exit /b 1

echo Build completado.
echo.
echo Para publicar con todas las dependencias:
echo dotnet publish .\PointSaleSoft.XmlSalesImporter.csproj -c Release -r win-x64 --self-contained true -o .\publish
