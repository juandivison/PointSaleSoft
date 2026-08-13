EXCEL FORMATEADO - REPORTE 606
===============================

1. UGlobal
----------
Agregar a la interface:

procedure ExporToExcelFormateado(
  mTabla: TIBQuery;
  NombreArchivo: String;
  addFechaF: Boolean;
  emailAuto: Boolean
);

Luego agregar la implementación incluida en:

  ExporToExcelFormateado_UGlobal.txt

No es necesario eliminar ExporToExcel. Pueden coexistir para evitar
regresiones en otros reportes.

2. Reporte 606
--------------
UReporte606Excel.pas ya fue cambiado para llamar:

  ExporToExcelFormateado(...)

El DFM no necesitó cambios.

3. Formato aplicado
--------------------
- Intenta crear una tabla real de Excel (ListObject).
- Fallback: encabezado negrita + bordes + AutoFilter.
- AutoFit en todas las columnas DESPUES de escribir/formatear datos.
- Campos numéricos decimales: #,##0.00
- Campos enteros: #,##0
- Fecha: dd/mm/yyyy
- Fecha/hora: dd/mm/yyyy hh:mm
- Texto: formato @ para preservar RNC, cédulas, NCF/e-NCF y ceros iniciales.
- Congela la primera fila.
- Si el dataset contiene "TOTAL GENERAL", esa fila queda en negrita.
- Los totales NO se recalculan en el exportador; conserva los totales
  calculados por el query del 606.

4. Memoria / COM
----------------
Se refactorizó específicamente para evitar objetos colgados:

- Label y ProgressBars se crean con Frm como Owner.
- Solo se libera Frm; éste destruye sus controles.
- Dataset.DisableControls siempre tiene EnableControls en finally.
- Bookmark se restaura dentro de try/except.
- Workbook.Close(False) se ejecuta en finally.
- Excel.Application.Quit se ejecuta en finally.
- Todos los OleVariant se liberan en orden inverso mediante VarClear.
- El array Variant de datos también se libera.
- El directorio se valida ANTES de crear Excel.
- ShellExecute ocurre después de cerrar y liberar Excel.

Esto reduce el riesgo de dejar EXCEL.EXE ejecutándose tras una excepción.

5. Rendimiento
--------------
En lugar de escribir celda por celda, el dataset se carga en un array
Variant 2D y se asigna a Excel en una sola operación:

  RangoDatos.Value := Datos;

Esto es sustancialmente más rápido para reportes 606 con muchas filas.
