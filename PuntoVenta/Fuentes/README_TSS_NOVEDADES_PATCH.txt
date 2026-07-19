PATCH TSS NOVEDADES - DELPHI 7 / FIREBIRD 2.5
================================================

Archivos incluidos:

1) 01_TSS_NOVEDADES_SCHEMA.sql
   - Crea GEN_TSS_NOVEDAD_MANUAL_ID.
   - Crea TSS_NOVEDAD_MANUAL.
   - Crea triggers BI/BU para ID y auditoria.
   - Crea indices basicos.

2) UFrmTssNovedadManual.pas / .dfm
   - Formulario para poblar novedades manuales TSS:
     LM = Licencia maternidad
     LD = Licencia discapacidad
     LV = Licencia voluntaria
     AD = Actualizacion manual de datos/salario
     OT = Codigo interno/texto libre. OT no se exporta al TXT de novedades si no se ajusta a codigo TSS permitido.

3) UFrmTssExportCenter.pas
   - Refactorizado para cargar Novedades desde DB:
     IN: EMPLEADO.FECHA_ENTRADA dentro del periodo.
     SA: EMPLEADO.FECHA_SALIDA dentro del periodo.
     AD: HISTORICO_EMPLEADOS con cambio de salario.
     VC: EMPLEADO + VACACIONES usando FECHA_EFECTIVA y CANT_DIAS.
     LM/LD/LV/AD manual: TSS_NOVEDAD_MANUAL.
   - TIPO_NOMINA se mapea asi:
     1 => 001 semanal
     2 => 002 quincenal
     3 => 003 mensual

4) UTssExporters.pas
   - Exportador de Novedades con orden de columnas segun plantilla:
     Clave Nomina, Tipo Novedad, Fecha Inicio, Fecha Fin, Tipo Doc, Numero Documento, etc.

5) UTssValidator.pas
   - Valida codigos principales:
     Novedades: IN, SA, VC, LV, LM, LD, AD
     Dependientes: ID, SD
     Tipo Doc: C, N, P
     Sexo: M, F

Consideraciones:

- VACACIONES debe existir con al menos:
  CODIGO, FECHA_EFECTIVA, CANT_DIAS.

- FECHA_EFECTIVA se interpreta como inicio real de vacaciones.
- FECHAVACACIONES de EMPLEADO queda como fecha de pago/referencia, pero el exportador usa VACACIONES.FECHA_EFECTIVA para VC.
- El calculo de fecha final de vacaciones descuenta domingos. Si tambien deben excluirse sabados o feriados, hay que agregar calendario laboral.

- El archivo TXT sigue usando TAB (#9) como delimitador en UTssFormatUtils.pas:
  TSS_DEFAULT_DELIMITER = #9;
  Si TSS exige otro separador, cambiar ahi.

Integracion sugerida al menu:

uses UFrmTssNovedadManual;

procedure TMainForm.mnuNovedadesManualClick(Sender: TObject);
begin
  if frmTssNovedadManual = nil then
    frmTssNovedadManual := TfrmTssNovedadManual.Create(Application);
  frmTssNovedadManual.ShowModal;
end;

Antes de probar:

1. Ejecutar 01_TSS_NOVEDADES_SCHEMA.sql.
2. Agregar UFrmTssNovedadManual.pas al proyecto.
3. Reemplazar UFrmTssExportCenter.pas, UTssExporters.pas y UTssValidator.pas por los incluidos.
4. Mantener el DFM actual de UFrmTssExportCenter.dfm.
5. Compilar.

