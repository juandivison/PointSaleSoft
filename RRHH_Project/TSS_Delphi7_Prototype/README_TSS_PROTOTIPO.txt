PROTOTIPO DELPHI 7 - CENTRO DE EXPORTACION TSS / SUIR PLUS
===========================================================

Objetivo:
Crear una pantalla user friendly para demostrar generacion de archivos TXT TSS usando datos dummy.

Archivos incluidos:
- TssExportPrototype.dpr
- UFrmTssExportCenter.pas
- UFrmTssExportCenter.dfm
- UTssTypes.pas
- UTssFormatUtils.pas
- UTssValidator.pas
- UTssExporters.pas

Tipos soportados en el prototipo:
1. Autodeterminacion
2. Novedades
3. Bonificacion INFOTEP
4. Dependientes Adicionales
5. Rectificativa IR-3

Uso rapido para demo:
1. Abrir TssExportPrototype.dpr en Delphi 7.
2. Compilar.
3. Ejecutar.
4. Elegir una pestana.
5. Pulsar Cargar Dummy.
6. Pulsar Validar.
7. Pulsar Generar TXT.

Notas tecnicas:
- El prototipo usa TClientDataSet para no depender de Firebird todavia.
- El TXT se genera delimitado por TAB (#9) desde UTssFormatUtils.TSS_DEFAULT_DELIMITER.
- Si el instructivo final exige otro delimitador, cambiar TSS_DEFAULT_DELIMITER.
- Los layouts estan separados en UTssExporters.pas.
- Las validaciones estan separadas en UTssValidator.pas.
- Para conectar con PointSaleSoft/Firebird, sustituir cdsPreview por el dataset real o cargarlo desde queries.

Importante:
Este prototipo usa columnas detectadas desde las plantillas oficiales suministradas. Antes de produccion,
comparar contra el instructivo vigente de TSS para confirmar delimitador, columnas obligatorias,
formato de fecha y codigos permitidos.
