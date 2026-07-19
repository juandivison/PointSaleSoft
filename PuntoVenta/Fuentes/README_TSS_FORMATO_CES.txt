Paquete TSS formato C/E/S
=========================

Archivos incluidos:
- UFrmTssExportCenter.pas
- UFrmTssExportCenter.dfm
- UTssExporters.pas

Cambios principales:
1. Se conserva la version con selector de compania y RNC automatico.
2. Se agrega PERIODO_TSS en formato AAAAMM al ClientDataSet.
3. El nombre sugerido del TXT usa: PREFIJO_RNC_AAAAMM.txt.
4. Autodeterminacion genera estructura:
   C|RNC|AAAAMM
   E|Cedula|Nombre|Apellido|Sexo|FechaNac|SalarioSDSS|SalarioISR|Otros|Regalia|Preaviso|Pension|IndicadorSalida|FechaSalida|
   S|Cantidad|TotalSalarioSDSS
5. Los otros exportadores tambien generan encabezado C y cierre S,
   usando prefijos de detalle N/B/D/R segun el tipo de archivo.
6. Se usa separador | y se mantienen campos vacios.
7. Montos salen con punto decimal y 2 decimales.
8. Fechas salen AAAAMMDD.
9. Cedulas/RNC salen solo con digitos.

Nota:
- Para Autodeterminacion se aplico directamente la regla indicada.
- Para Novedades/Bonificacion/Dependientes/IR3 se genero una salida
  coherente C/detalle/S basada en los campos actualmente disponibles.
  Si la plantilla oficial vigente exige columnas adicionales, se ajusta
  solo el metodo BuildDetailLine correspondiente en UTssExporters.pas.
