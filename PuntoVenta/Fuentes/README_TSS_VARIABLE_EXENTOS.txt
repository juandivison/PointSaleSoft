TSS FIX - Ingresos exentos variables

Causa del error:
El archivo AM estaba generando siempre 366 posiciones, dejando los bloques 02/03 como espacios cuando no habia monto.
El validador SUIR interpreta cada bloque de 18 posiciones agregado al final como un ingreso exento reportado.
Si el bloque existe y esta vacio/cero, marca invalido Preaviso o Pension alimenticia.

Correccion aplicada en UTssExporters.pas:
- FormatExento devuelve cadena vacia cuando el monto <= 0.
- BuildExentos agrega solo bloques positivos, en orden: 01, 02, 03.
- CheckDetailLen acepta longitud variable:
  AM: 312, 330, 348 o 366
  NV: 330, 348, 366 o 384
  RT: 258, 276, 294 o 312
  BO/RD siguen fijos.

Archivo de prueba incluido:
AM_130787931_042026_VARIABLE_EXENTOS.txt
- Encabezado: 20
- Detalle sin exentos: 312
- Detalle solo regalia: 330
- Detalle regalia + pension: 348
- Sumario: 7
