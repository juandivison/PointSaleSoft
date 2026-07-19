TSS/SUIRPLUS - Refactor validado AM/NV
======================================

Archivos incluidos:
- UTssExporters.pas
- UTssValidator.pas
- samples\AM_130787931_042026.txt
- samples\NV_130787931_042026.txt
- samples\RT_130787931_042026.txt
- samples\130787931_042026_BO.txt
- samples\130787931_042026_RD.txt

Cambios clave:
1) AM y NV ya generan layout base validado por el validador SUIR:
   - AM: encabezado 20, detalle base 312, sumario 7.
   - NV: encabezado 20, detalle base 330, sumario 7.

2) Ingresos exentos 01/02/03:
   - Si el monto es cero, NO se escribe el bloque.
   - Si el monto es mayor que cero, se agrega al final como:
     01 + monto16, 02 + monto16, 03 + monto16.

3) Salario_ISR y Salario_INFOTEP:
   - Si son iguales al Salario_SS, se exportan en cero.
   - Solo se exportan con valor cuando son diferentes.

4) Dependientes adicionales:
   - Corrige NOMBRES_DEPENDIENTE a 50 posiciones para cuadrar detalle 158.
   - Elimina dependencia de TIPO_NOVEDAD en el validador porque el layout RD no lo usa.

5) INFOTEP:
   - Fecha de nacimiento en DDMMAAAA.
   - Nombre oficial: RNC_MMAAAA_BO.txt.

Notas:
- El validador usado por el usuario solo lista AM, AR, NV y RT. No valida BO/RD.
- BO y RD deben probarse en su modulo/flujo correspondiente de SUIRPLUS.
- Reemplazar las unidades, borrar DCU antiguos y hacer Build All.
