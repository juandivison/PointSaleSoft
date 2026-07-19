Corrección de formato TXT TSS según instructivos subidos:

1) Ya no se genera pipe-delimited.
2) Se genera archivo de ancho fijo con registros E/D/S.
3) Sumario: S + total de registros del archivo, incluyendo encabezado y sumario.
4) Periodo: MMAAAA.
5) Fechas: DDMMAAAA.
6) Montos: 16 posiciones, ceros a la izquierda, dos decimales.
7) Layouts implementados:
   - AM: encabezado 20, detalle 366, sumario 7.
   - NV: encabezado 20, detalle 384, sumario 7.
   - BO: encabezado 20, detalle 182, sumario 7.
   - RD: encabezado 14, detalle 158, sumario 7.
   - RT: encabezado 20, detalle 312, sumario 7.

Nombres de archivo sugeridos:
- AM_RNC_MMAAAA.txt
- NV_RNC_MMAAAA.txt
- RNC_MMAAAA_BO.txt
- RNC_MMAAAA_RD.txt
- RT_RNC_MMAAAA.txt

Nota importante:
El archivo UFrmTssExportCenter.pas incluido está basado en la última versión con selector
de compañía/RNC y se parcheó para agregar PERIODO_TSS en el dataset y generar nombres
de archivo conforme a los instructivos.
