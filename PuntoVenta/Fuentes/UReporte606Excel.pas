unit UReporte606Excel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
  DateUtils;

type
  TfrmReporte606Excel = class(TForm)
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    pnlPeriodo: TPanel;
    lblDesde: TLabel;
    lblHasta: TLabel;
    dtpDesde: TDateTimePicker;
    dtpHasta: TDateTimePicker;
    lblAyuda: TLabel;
    btnGenerar: TBitBtn;
    btnCerrar: TBitBtn;
    qry606: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGenerarClick(Sender: TObject);
  private
    procedure PrepararQuery;
    procedure ConfigurarEtiquetas;
    procedure ExportarReporte;
    function NombreBaseArchivo: string;
    function TieneRegistrosDetalle: Boolean;
  public
    class procedure Ejecutar(AOwner: TComponent);
  end;

implementation

uses
  UDatModConectar, UGlobal;

{$R *.dfm}

class procedure TfrmReporte606Excel.Ejecutar(AOwner: TComponent);
var
  F: TfrmReporte606Excel;
begin
  F := TfrmReporte606Excel.Create(AOwner);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TfrmReporte606Excel.FormCreate(Sender: TObject);
begin
  dtpDesde.Date := StartOfTheMonth(Date);
  dtpHasta.Date := EndOfTheMonth(Date);

  qry606.Database := dmConectar.IBDatabase1;
  qry606.Transaction := dmConectar.IBTransaction1;
end;

procedure TfrmReporte606Excel.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

function TfrmReporte606Excel.NombreBaseArchivo: string;
var
  DirBase: string;
begin
  DirBase := 'C:\Electronico\Reportes\606\';

  Result :=
    DirBase +
    'Reporte606_' +
    FormatDateTime('yyyymmdd', dtpDesde.Date) +
    '_' +
    FormatDateTime('yyyymmdd', dtpHasta.Date) +
    '_';
end;

procedure TfrmReporte606Excel.PrepararQuery;
begin
  qry606.Close;
  qry606.SQL.Clear;

  {
    REPORTE DE APOYO PARA FORMATO 606
    ---------------------------------
    Una fila por operación / NCF.

    Reglas importantes:
    - Excluye TRANS_OPERACION_MASTER.STATUS = 'C'.
    - Excluye detalles cancelados.
    - Excluye NCF_ASIGNADOS_COMPRA cancelados.
    - Si la operación usa m.ECF (E41/E43 electrónico autogenerado),
      solamente entra cuando ECF_GASTO_ENVIO tiene estado ACEPTADO.
    - E43/B13 usa el RNC de la propia compañía en el campo RNC/Cédula 606.
    - Para E41 con precio incluido, la base se reconstruye igual que
      el extractor fiscal: 18% / 16%.
    - No inventa Tipo Retención ISR cuando el sistema no tiene el código 606.
      Se deja para revisión contable, salvo Arrendamientos (IDTIPO_COMPRA=3).
  }

  qry606.SQL.Add('WITH');
  qry606.SQL.Add('DETALLE AS (');
  qry606.SQL.Add('  SELECT');
  qry606.SQL.Add('    d.NUMERO AS TRN,');

  { Base fiscal de servicios }
  qry606.SQL.Add('    SUM(CASE');
  qry606.SQL.Add('      WHEN COALESCE(d.IND_BIEN_SERVICIO, p.IND_BIEN_SERVICIO) = 2 THEN');
  qry606.SQL.Add('        CASE');
  qry606.SQL.Add('          WHEN m.TIPO_CF = ''41'' AND COALESCE(m.IND_MONTO_GRAVADO,0) = 1');
  qry606.SQL.Add('               AND t.IDITBISECF = 1');
  qry606.SQL.Add('            THEN (d.CANTIDAD * d.PRECIO) / 1.18');
  qry606.SQL.Add('          WHEN m.TIPO_CF = ''41'' AND COALESCE(m.IND_MONTO_GRAVADO,0) = 1');
  qry606.SQL.Add('               AND t.IDITBISECF = 2');
  qry606.SQL.Add('            THEN (d.CANTIDAD * d.PRECIO) / 1.16');
  qry606.SQL.Add('          ELSE (d.CANTIDAD * d.PRECIO)');
  qry606.SQL.Add('        END');
  qry606.SQL.Add('      ELSE 0');
  qry606.SQL.Add('    END) AS MONTO_SERVICIOS,');

  { Base fiscal de bienes }
  qry606.SQL.Add('    SUM(CASE');
  qry606.SQL.Add('      WHEN COALESCE(d.IND_BIEN_SERVICIO, p.IND_BIEN_SERVICIO) = 1 THEN');
  qry606.SQL.Add('        CASE');
  qry606.SQL.Add('          WHEN m.TIPO_CF = ''41'' AND COALESCE(m.IND_MONTO_GRAVADO,0) = 1');
  qry606.SQL.Add('               AND t.IDITBISECF = 1');
  qry606.SQL.Add('            THEN (d.CANTIDAD * d.PRECIO) / 1.18');
  qry606.SQL.Add('          WHEN m.TIPO_CF = ''41'' AND COALESCE(m.IND_MONTO_GRAVADO,0) = 1');
  qry606.SQL.Add('               AND t.IDITBISECF = 2');
  qry606.SQL.Add('            THEN (d.CANTIDAD * d.PRECIO) / 1.16');
  qry606.SQL.Add('          ELSE (d.CANTIDAD * d.PRECIO)');
  qry606.SQL.Add('        END');
  qry606.SQL.Add('      ELSE 0');
  qry606.SQL.Add('    END) AS MONTO_BIENES,');

  qry606.SQL.Add('    SUM(COALESCE(d.MONTO_ITBIS,0)) AS ITBIS_FACTURADO,');
  qry606.SQL.Add('    SUM(COALESCE(d.MONTO_ITBIS_RETENIDO,0)) AS ITBIS_RETENIDO,');
  qry606.SQL.Add('    SUM(COALESCE(d.MONTO_ISR_RETENIDO,0)) AS ISR_RETENIDO');

  qry606.SQL.Add('  FROM TRANS_OPERACION_DET d');
  qry606.SQL.Add('  JOIN TRANS_OPERACION_MASTER m ON m.NUMERO = d.NUMERO');
  qry606.SQL.Add('  LEFT JOIN PRODUCTOS p ON p.CODIGO = d.COD_SERV_PROD');
  qry606.SQL.Add('  LEFT JOIN TASA_ITBIS t ON t.IDTASAITBIS = d.IDTASAITBIS');
  qry606.SQL.Add('  WHERE m.CIA_KEY = :CIA_KEY');
  qry606.SQL.Add('    AND m.FECHA >= :FECHA_DESDE');
  qry606.SQL.Add('    AND m.FECHA < :FECHA_HASTA_SIG');
  qry606.SQL.Add('    AND COALESCE(m.STATUS,''A'') <> ''C''');
  qry606.SQL.Add('    AND COALESCE(d.STATUS,''A'') <> ''C''');
  qry606.SQL.Add('  GROUP BY d.NUMERO');
  qry606.SQL.Add('),');

  qry606.SQL.Add('BASE AS (');
  qry606.SQL.Add('  SELECT');
  qry606.SQL.Add('    m.NUMERO AS TRN,');
  qry606.SQL.Add('    m.FECHA AS FECHA_COMPROBANTE,');

  { Fecha de pago: no inventar pago para operaciones a crédito }
  qry606.SQL.Add('    CASE');
  qry606.SQL.Add('      WHEN m.FPAGO = 1 THEN m.FECHA');
  qry606.SQL.Add('      ELSE NULL');
  qry606.SQL.Add('    END AS FECHA_PAGO,');

  { Nombre para revisión humana }
  qry606.SQL.Add('    COALESCE(NULLIF(TRIM(p.DESCRIPCION),''''),');
  qry606.SQL.Add('             NULLIF(TRIM(p.NOMBRE_ABR),''''),');
  qry606.SQL.Add('             ''PROVEEDOR '' || CAST(m.COD_PROVEEDOR AS VARCHAR(12))) AS PROVEEDOR,');

  { RNC/Cédula 606. B13/E43 y B17/E47 son autogenerados: usar RNC propio }
  qry606.SQL.Add('    CASE');
  qry606.SQL.Add('      WHEN TRIM(COALESCE(m.TIPO_CF,'''')) IN (''13'',''43'',''17'',''47'')');
  qry606.SQL.Add('        THEN c.RNC_NUMERO');
  qry606.SQL.Add('      WHEN p.TIPODOC IN (1,2)');
  qry606.SQL.Add('        THEN NULLIF(TRIM(p.RNC_PROVEEDOR),'''')');
  qry606.SQL.Add('      ELSE NULL');
  qry606.SQL.Add('    END AS RNC_CEDULA,');

  qry606.SQL.Add('    CASE');
  qry606.SQL.Add('      WHEN TRIM(COALESCE(m.TIPO_CF,'''')) IN (''13'',''43'',''17'',''47'') THEN 1');
  qry606.SQL.Add('      WHEN p.TIPODOC IN (1,2) THEN p.TIPODOC');
  qry606.SQL.Add('      ELSE NULL');
  qry606.SQL.Add('    END AS TIPO_ID,');

  qry606.SQL.Add('    m.IDTIPO_COMPRA AS TIPO_BIEN_SERVICIO_606,');
  qry606.SQL.Add('    CASE m.IDTIPO_COMPRA');
  qry606.SQL.Add('      WHEN 1 THEN ''Gastos de personal''');
  qry606.SQL.Add('      WHEN 2 THEN ''Trabajos, suministros y servicios''');
  qry606.SQL.Add('      WHEN 3 THEN ''Arrendamientos''');
  qry606.SQL.Add('      WHEN 4 THEN ''Gastos de activos fijos''');
  qry606.SQL.Add('      WHEN 5 THEN ''Gastos de representacion''');
  qry606.SQL.Add('      WHEN 6 THEN ''Otras deducciones admitidas''');
  qry606.SQL.Add('      WHEN 7 THEN ''Gastos financieros''');
  qry606.SQL.Add('      WHEN 8 THEN ''Gastos extraordinarios''');
  qry606.SQL.Add('      WHEN 9 THEN ''Compras/costo de venta''');
  qry606.SQL.Add('      WHEN 10 THEN ''Adquisiciones de activos''');
  qry606.SQL.Add('      WHEN 11 THEN ''Gastos de seguros''');
  qry606.SQL.Add('      ELSE ''REVISAR TIPO COMPRA''');
  qry606.SQL.Add('    END AS DESC_TIPO_COMPRA,');

  qry606.SQL.Add('    TRIM(COALESCE(NULLIF(TRIM(m.ECF),''''),');
  qry606.SQL.Add('                  NULLIF(TRIM(m.NUMERO_NCF),''''),');
  qry606.SQL.Add('                  NULLIF(TRIM(na.ECF),''''),');
  qry606.SQL.Add('                  NULLIF(TRIM(na.NUMERO_NCF),''''), '''')) AS NCF,');

  { El módulo de gastos actual no captura todavía referencia de NC para el 606 }
  qry606.SQL.Add('    CAST('''' AS VARCHAR(19)) AS NCF_MODIFICADO,');

  qry606.SQL.Add('    CAST(COALESCE(d.MONTO_SERVICIOS,0) AS NUMERIC(15,2)) AS MONTO_SERVICIOS,');
  qry606.SQL.Add('    CAST(COALESCE(d.MONTO_BIENES,0) AS NUMERIC(15,2)) AS MONTO_BIENES,');
  qry606.SQL.Add('    CAST(COALESCE(d.MONTO_SERVICIOS,0) + COALESCE(d.MONTO_BIENES,0)');
  qry606.SQL.Add('         AS NUMERIC(15,2)) AS TOTAL_MONTO_FACTURADO,');
  qry606.SQL.Add('    CAST(COALESCE(d.ITBIS_FACTURADO,0) AS NUMERIC(15,2)) AS ITBIS_FACTURADO,');
  qry606.SQL.Add('    CAST(COALESCE(d.ITBIS_RETENIDO,0) AS NUMERIC(15,2)) AS ITBIS_RETENIDO,');

  { Campos 606 no capturados por este módulo: valores base editables por Contabilidad }
  qry606.SQL.Add('    CAST(0 AS NUMERIC(15,2)) AS ITBIS_SUJETO_PROPORCIONALIDAD,');
  qry606.SQL.Add('    CAST(0 AS NUMERIC(15,2)) AS ITBIS_LLEVADO_COSTO,');
  qry606.SQL.Add('    CAST(COALESCE(d.ITBIS_FACTURADO,0) AS NUMERIC(15,2)) AS ITBIS_POR_ADELANTAR,');
  qry606.SQL.Add('    CAST(0 AS NUMERIC(15,2)) AS ITBIS_PERCIBIDO_COMPRAS,');

  { Solo Arrendamiento puede inferirse con seguridad desde IDTIPO_COMPRA=3.
    Otros ISR requieren clasificación contable explícita. }
  qry606.SQL.Add('    CASE');
  qry606.SQL.Add('      WHEN COALESCE(d.ISR_RETENIDO,0) <= 0 THEN NULL');
  qry606.SQL.Add('      WHEN m.IDTIPO_COMPRA = 3 THEN 1');
  qry606.SQL.Add('      ELSE NULL');
  qry606.SQL.Add('    END AS TIPO_RETENCION_ISR,');

  qry606.SQL.Add('    CAST(COALESCE(d.ISR_RETENIDO,0) AS NUMERIC(15,2)) AS MONTO_RETENCION_RENTA,');
  qry606.SQL.Add('    CASE');
  qry606.SQL.Add('      WHEN COALESCE(d.MONTO_SERVICIOS,0) > 0 AND COALESCE(d.ISR_RETENIDO,0) > 0');
  qry606.SQL.Add('        THEN CAST((d.ISR_RETENIDO * 100.00) / d.MONTO_SERVICIOS AS NUMERIC(9,2))');
  qry606.SQL.Add('      ELSE CAST(0 AS NUMERIC(9,2))');
  qry606.SQL.Add('    END AS TASA_ISR_APLICADA,');
  qry606.SQL.Add('    CAST(0 AS NUMERIC(15,2)) AS ISR_PERCIBIDO_COMPRAS,');
  qry606.SQL.Add('    CAST(0 AS NUMERIC(15,2)) AS IMPUESTO_SELECTIVO_CONSUMO,');
  qry606.SQL.Add('    CAST(0 AS NUMERIC(15,2)) AS OTROS_IMPUESTOS_TASAS,');
  qry606.SQL.Add('    CAST(0 AS NUMERIC(15,2)) AS PROPINA_LEGAL,');

  { Forma de pago 606, no confundir con código e-CF }
  qry606.SQL.Add('    CASE m.IDCODIGO_TPAGODGII');
  qry606.SQL.Add('      WHEN 1 THEN 1');   { Efectivo }
  qry606.SQL.Add('      WHEN 2 THEN 3');   { Tarjeta crédito }
  qry606.SQL.Add('      WHEN 3 THEN 2');   { Cheque }
  qry606.SQL.Add('      WHEN 7 THEN 4');   { Crédito }
  qry606.SQL.Add('      WHEN 12 THEN 3');  { Tarjeta débito }
  qry606.SQL.Add('      WHEN 18 THEN 2');  { Transferencia }
  qry606.SQL.Add('      WHEN 19 THEN 2');  { Depósito }
  qry606.SQL.Add('      WHEN 22 THEN 5');  { Permuta }
  qry606.SQL.Add('      ELSE NULL');
  qry606.SQL.Add('    END AS FORMA_PAGO_606,');

  qry606.SQL.Add('    m.TIPO_CF AS TIPO_CF,');
  qry606.SQL.Add('    m.MONTO AS MONTO_PAGADO_PROVEEDOR,');

  qry606.SQL.Add('    COALESCE((');
  qry606.SQL.Add('      SELECT FIRST 1 e.ESTADO');
  qry606.SQL.Add('      FROM ECF_GASTO_ENVIO e');
  qry606.SQL.Add('      WHERE e.CIA_KEY = m.CIA_KEY');
  qry606.SQL.Add('        AND e.TRN = m.NUMERO');
  qry606.SQL.Add('      ORDER BY e.ID DESC');
  qry606.SQL.Add('    ), '''') AS ESTADO_ECF,');

  { Advertencias para el contable; no altera los montos }
  qry606.SQL.Add('    CAST(');
  qry606.SQL.Add('      CASE');
  qry606.SQL.Add('        WHEN TRIM(COALESCE(NULLIF(TRIM(m.ECF),''''),');
  qry606.SQL.Add('                           NULLIF(TRIM(m.NUMERO_NCF),''''),');
  qry606.SQL.Add('                           NULLIF(TRIM(na.ECF),''''),');
  qry606.SQL.Add('                           NULLIF(TRIM(na.NUMERO_NCF),''''), '''')) = ''''');
  qry606.SQL.Add('          THEN ''REVISAR: SIN NCF''');
  qry606.SQL.Add('        WHEN p.TIPODOC NOT IN (1,2) AND');
  qry606.SQL.Add('             TRIM(COALESCE(m.TIPO_CF,'''')) NOT IN (''13'',''43'',''17'',''47'')');
  qry606.SQL.Add('          THEN ''REVISAR: TIPO ID NO ADMISIBLE EN 606''');
  qry606.SQL.Add('        WHEN COALESCE(d.ISR_RETENIDO,0) > 0 AND');
  qry606.SQL.Add('             m.IDTIPO_COMPRA <> 3');
  qry606.SQL.Add('          THEN ''REVISAR: CLASIFICAR TIPO RETENCION ISR''');
  qry606.SQL.Add('        WHEN m.FPAGO = 2 AND');
  qry606.SQL.Add('             (COALESCE(d.ITBIS_RETENIDO,0) > 0 OR COALESCE(d.ISR_RETENIDO,0) > 0)');
  qry606.SQL.Add('          THEN ''REVISAR: FECHA PAGO DE RETENCION''');
  qry606.SQL.Add('        WHEN m.IDCODIGO_TPAGODGII NOT IN (1,2,3,7,12,18,19,22)');
  qry606.SQL.Add('          THEN ''REVISAR: FORMA DE PAGO 606''');
  qry606.SQL.Add('        ELSE ''OK''');
  qry606.SQL.Add('      END AS VARCHAR(100)');
  qry606.SQL.Add('    ) AS REVISION_CONTABLE');

  qry606.SQL.Add('  FROM TRANS_OPERACION_MASTER m');
  qry606.SQL.Add('  JOIN DETALLE d ON d.TRN = m.NUMERO');
  qry606.SQL.Add('  LEFT JOIN PROVEEDORES p ON p.CODIGO_CTE = m.COD_PROVEEDOR');
  qry606.SQL.Add('  LEFT JOIN COMPANIA c ON c.CODIGO = m.CIA_KEY');
  qry606.SQL.Add('  LEFT JOIN NCF_ASIGNADOS_COMPRA na');
  qry606.SQL.Add('    ON na.SERIE = m.SERIE_NCF_ASIGNADO');
  qry606.SQL.Add('   AND na.TIPO_NCF = m.TIPO_CF');

  qry606.SQL.Add('  WHERE m.CIA_KEY = :CIA_KEY');
  qry606.SQL.Add('    AND m.FECHA >= :FECHA_DESDE');
  qry606.SQL.Add('    AND m.FECHA < :FECHA_HASTA_SIG');
  qry606.SQL.Add('    AND COALESCE(m.STATUS,''A'') <> ''C''');

  { Si existe asignación, tampoco puede estar cancelada }
  qry606.SQL.Add('    AND NOT EXISTS (');
  qry606.SQL.Add('      SELECT 1');
  qry606.SQL.Add('      FROM NCF_ASIGNADOS_COMPRA nac');
  qry606.SQL.Add('      WHERE nac.SERIE = m.SERIE_NCF_ASIGNADO');
  qry606.SQL.Add('        AND COALESCE(nac.STATUS,''A'') = ''C''');
  qry606.SQL.Add('    )');

  { Los E41/E43 electrónicos autogenerados solo tienen validez tributaria
    si DGII/ASLAN los dejó aceptados. Las compras convencionales o e-CF
    recibidos de terceros usan NUMERO_NCF y no pasan por este filtro. }
  qry606.SQL.Add('    AND (');
  qry606.SQL.Add('      NULLIF(TRIM(COALESCE(m.ECF,'''')),'''') IS NULL');
  qry606.SQL.Add('      OR EXISTS (');
  qry606.SQL.Add('        SELECT 1');
  qry606.SQL.Add('        FROM ECF_GASTO_ENVIO eg');
  qry606.SQL.Add('        WHERE eg.CIA_KEY = m.CIA_KEY');
  qry606.SQL.Add('          AND eg.TRN = m.NUMERO');
  qry606.SQL.Add('          AND eg.ENCF = m.ECF');
  qry606.SQL.Add('          AND UPPER(TRIM(COALESCE(eg.ESTADO,''''))) STARTING WITH ''ACEPTADO''');
  qry606.SQL.Add('      )');
  qry606.SQL.Add('    )');
  qry606.SQL.Add('),');

  { El detalle final y una fila TOTAL GENERAL.
    ExporToExcel exporta exactamente el dataset, por eso el total se construye aquí. }
  qry606.SQL.Add('SALIDA AS (');
  qry606.SQL.Add('  SELECT');
  qry606.SQL.Add('    0 AS ORDEN,');
  qry606.SQL.Add('    b.TRN, b.FECHA_COMPROBANTE, b.FECHA_PAGO, b.PROVEEDOR,');
  qry606.SQL.Add('    b.RNC_CEDULA, b.TIPO_ID, b.TIPO_BIEN_SERVICIO_606,');
  qry606.SQL.Add('    b.DESC_TIPO_COMPRA, b.NCF, b.NCF_MODIFICADO,');
  qry606.SQL.Add('    b.MONTO_SERVICIOS, b.MONTO_BIENES, b.TOTAL_MONTO_FACTURADO,');
  qry606.SQL.Add('    b.ITBIS_FACTURADO, b.ITBIS_RETENIDO,');
  qry606.SQL.Add('    b.ITBIS_SUJETO_PROPORCIONALIDAD, b.ITBIS_LLEVADO_COSTO,');
  qry606.SQL.Add('    b.ITBIS_POR_ADELANTAR, b.ITBIS_PERCIBIDO_COMPRAS,');
  qry606.SQL.Add('    b.TIPO_RETENCION_ISR, b.MONTO_RETENCION_RENTA, b.TASA_ISR_APLICADA,');
  qry606.SQL.Add('    b.ISR_PERCIBIDO_COMPRAS, b.IMPUESTO_SELECTIVO_CONSUMO,');
  qry606.SQL.Add('    b.OTROS_IMPUESTOS_TASAS, b.PROPINA_LEGAL, b.FORMA_PAGO_606,');
  qry606.SQL.Add('    b.TIPO_CF, b.MONTO_PAGADO_PROVEEDOR, b.ESTADO_ECF,');
  qry606.SQL.Add('    b.REVISION_CONTABLE');
  qry606.SQL.Add('  FROM BASE b');

  qry606.SQL.Add('  UNION ALL');

  qry606.SQL.Add('  SELECT');
  qry606.SQL.Add('    1 AS ORDEN,');
  qry606.SQL.Add('    CAST(NULL AS INTEGER) AS TRN,');
  qry606.SQL.Add('    CAST(NULL AS TIMESTAMP) AS FECHA_COMPROBANTE,');
  qry606.SQL.Add('    CAST(NULL AS TIMESTAMP) AS FECHA_PAGO,');
  qry606.SQL.Add('    CAST(''TOTAL GENERAL'' AS VARCHAR(80)) AS PROVEEDOR,');
  qry606.SQL.Add('    CAST('''' AS VARCHAR(20)) AS RNC_CEDULA,');
  qry606.SQL.Add('    CAST(NULL AS INTEGER) AS TIPO_ID,');
  qry606.SQL.Add('    CAST(NULL AS INTEGER) AS TIPO_BIEN_SERVICIO_606,');
  qry606.SQL.Add('    CAST('''' AS VARCHAR(60)) AS DESC_TIPO_COMPRA,');
  qry606.SQL.Add('    CAST('''' AS VARCHAR(19)) AS NCF,');
  qry606.SQL.Add('    CAST('''' AS VARCHAR(19)) AS NCF_MODIFICADO,');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.MONTO_SERVICIOS),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.MONTO_BIENES),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.TOTAL_MONTO_FACTURADO),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.ITBIS_FACTURADO),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.ITBIS_RETENIDO),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.ITBIS_SUJETO_PROPORCIONALIDAD),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.ITBIS_LLEVADO_COSTO),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.ITBIS_POR_ADELANTAR),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.ITBIS_PERCIBIDO_COMPRAS),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(NULL AS INTEGER) AS TIPO_RETENCION_ISR,');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.MONTO_RETENCION_RENTA),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(NULL AS NUMERIC(9,2)) AS TASA_ISR_APLICADA,');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.ISR_PERCIBIDO_COMPRAS),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.IMPUESTO_SELECTIVO_CONSUMO),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.OTROS_IMPUESTOS_TASAS),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.PROPINA_LEGAL),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST(NULL AS INTEGER) AS FORMA_PAGO_606,');
  qry606.SQL.Add('    CAST('''' AS VARCHAR(4)) AS TIPO_CF,');
  qry606.SQL.Add('    CAST(COALESCE(SUM(b.MONTO_PAGADO_PROVEEDOR),0) AS NUMERIC(15,2)),');
  qry606.SQL.Add('    CAST('''' AS VARCHAR(32)) AS ESTADO_ECF,');
  qry606.SQL.Add('    CAST('''' AS VARCHAR(100)) AS REVISION_CONTABLE');
  qry606.SQL.Add('  FROM BASE b');
  qry606.SQL.Add(')');

  qry606.SQL.Add('SELECT');
  qry606.SQL.Add('  s.TRN, s.FECHA_COMPROBANTE, s.FECHA_PAGO, s.PROVEEDOR,');
  qry606.SQL.Add('  s.RNC_CEDULA, s.TIPO_ID, s.TIPO_BIEN_SERVICIO_606,');
  qry606.SQL.Add('  s.DESC_TIPO_COMPRA, s.NCF, s.NCF_MODIFICADO,');
  qry606.SQL.Add('  s.MONTO_SERVICIOS, s.MONTO_BIENES, s.TOTAL_MONTO_FACTURADO,');
  qry606.SQL.Add('  s.ITBIS_FACTURADO, s.ITBIS_RETENIDO,');
  qry606.SQL.Add('  s.ITBIS_SUJETO_PROPORCIONALIDAD, s.ITBIS_LLEVADO_COSTO,');
  qry606.SQL.Add('  s.ITBIS_POR_ADELANTAR, s.ITBIS_PERCIBIDO_COMPRAS,');
  qry606.SQL.Add('  s.TIPO_RETENCION_ISR, s.MONTO_RETENCION_RENTA, s.TASA_ISR_APLICADA,');
  qry606.SQL.Add('  s.ISR_PERCIBIDO_COMPRAS, s.IMPUESTO_SELECTIVO_CONSUMO,');
  qry606.SQL.Add('  s.OTROS_IMPUESTOS_TASAS, s.PROPINA_LEGAL, s.FORMA_PAGO_606,');
  qry606.SQL.Add('  s.TIPO_CF, s.MONTO_PAGADO_PROVEEDOR, s.ESTADO_ECF,');
  qry606.SQL.Add('  s.REVISION_CONTABLE');
  qry606.SQL.Add('FROM SALIDA s');
  qry606.SQL.Add('ORDER BY s.ORDEN, s.FECHA_COMPROBANTE, s.TRN');

  qry606.ParamByName('CIA_KEY').AsInteger := GlbCia_Key;
  qry606.ParamByName('FECHA_DESDE').AsDateTime := Trunc(dtpDesde.Date);
  qry606.ParamByName('FECHA_HASTA_SIG').AsDateTime := Trunc(dtpHasta.Date) + 1;

  qry606.Open;
  qry606.FetchAll;

  ConfigurarEtiquetas;
end;

procedure TfrmReporte606Excel.ConfigurarEtiquetas;
begin
  qry606.FieldByName('TRN').DisplayLabel := 'TRN';
  qry606.FieldByName('FECHA_COMPROBANTE').DisplayLabel := 'Fecha Comprobante';
  qry606.FieldByName('FECHA_PAGO').DisplayLabel := 'Fecha Pago';
  qry606.FieldByName('PROVEEDOR').DisplayLabel := 'Proveedor';
  qry606.FieldByName('RNC_CEDULA').DisplayLabel := 'RNC o Cedula';
  qry606.FieldByName('TIPO_ID').DisplayLabel := 'Tipo Id';
  qry606.FieldByName('TIPO_BIEN_SERVICIO_606').DisplayLabel := 'Tipo Bien/Servicio 606';
  qry606.FieldByName('DESC_TIPO_COMPRA').DisplayLabel := 'Descripcion Tipo Compra';
  qry606.FieldByName('NCF').DisplayLabel := 'NCF / e-NCF';
  qry606.FieldByName('NCF_MODIFICADO').DisplayLabel := 'NCF o Documento Modificado';
  qry606.FieldByName('MONTO_SERVICIOS').DisplayLabel := 'Monto Facturado Servicios';
  qry606.FieldByName('MONTO_BIENES').DisplayLabel := 'Monto Facturado Bienes';
  qry606.FieldByName('TOTAL_MONTO_FACTURADO').DisplayLabel := 'Total Monto Facturado';
  qry606.FieldByName('ITBIS_FACTURADO').DisplayLabel := 'ITBIS Facturado';
  qry606.FieldByName('ITBIS_RETENIDO').DisplayLabel := 'ITBIS Retenido';
  qry606.FieldByName('ITBIS_SUJETO_PROPORCIONALIDAD').DisplayLabel := 'ITBIS Sujeto Proporcionalidad';
  qry606.FieldByName('ITBIS_LLEVADO_COSTO').DisplayLabel := 'ITBIS Llevado al Costo';
  qry606.FieldByName('ITBIS_POR_ADELANTAR').DisplayLabel := 'ITBIS por Adelantar';
  qry606.FieldByName('ITBIS_PERCIBIDO_COMPRAS').DisplayLabel := 'ITBIS Percibido en Compras';
  qry606.FieldByName('TIPO_RETENCION_ISR').DisplayLabel := 'Tipo Retencion ISR';
  qry606.FieldByName('MONTO_RETENCION_RENTA').DisplayLabel := 'Monto Retencion Renta';
  qry606.FieldByName('TASA_ISR_APLICADA').DisplayLabel := 'Tasa ISR Aplicada %';
  qry606.FieldByName('ISR_PERCIBIDO_COMPRAS').DisplayLabel := 'ISR Percibido en Compras';
  qry606.FieldByName('IMPUESTO_SELECTIVO_CONSUMO').DisplayLabel := 'Impuesto Selectivo Consumo';
  qry606.FieldByName('OTROS_IMPUESTOS_TASAS').DisplayLabel := 'Otros Impuestos / Tasas';
  qry606.FieldByName('PROPINA_LEGAL').DisplayLabel := 'Monto Propina Legal';
  qry606.FieldByName('FORMA_PAGO_606').DisplayLabel := 'Forma Pago 606';
  qry606.FieldByName('TIPO_CF').DisplayLabel := 'Tipo CF';
  qry606.FieldByName('MONTO_PAGADO_PROVEEDOR').DisplayLabel := 'Monto Pagado Proveedor';
  qry606.FieldByName('ESTADO_ECF').DisplayLabel := 'Estado e-CF';
  qry606.FieldByName('REVISION_CONTABLE').DisplayLabel := 'Revision Contable';
end;

function TfrmReporte606Excel.TieneRegistrosDetalle: Boolean;
begin
  Result := False;

  if qry606.IsEmpty then
    Exit;

  qry606.First;

  {
    Cuando BASE no tiene registros, SALIDA devuelve solamente TOTAL GENERAL.
  }
  Result :=
    not qry606.FieldByName('TRN').IsNull;
end;

procedure TfrmReporte606Excel.ExportarReporte;
var
  Archivo: string;
begin
  if dtpHasta.Date < dtpDesde.Date then
    raise Exception.Create(
      'La fecha hasta no puede ser menor que la fecha desde.');

  PrepararQuery;

  if not TieneRegistrosDetalle then
  begin
    MessageDlg(
      'No existen operaciones activas elegibles para el reporte 606 en el periodo seleccionado.',
      mtInformation, [mbOK], 0);
    Exit;
  end;

  Archivo := NombreBaseArchivo;

  {
    Reutilizamos el procedimiento existente de UGlobal.
    La fila TOTAL GENERAL ya forma parte del dataset.
  }
  GLBMostrarArchivo := True;
  ExporToExcelFormateado(
    qry606,
    Archivo,
    True,   { agrega fecha/hora al nombre }
    False   { no enviar email automático }
  );

  MessageDlg(
    'Reporte 606 generado correctamente.' + #13#10 +
    'Periodo: ' +
    FormatDateTime('dd/mm/yyyy', dtpDesde.Date) + ' - ' +
    FormatDateTime('dd/mm/yyyy', dtpHasta.Date),
    mtInformation, [mbOK], 0);
end;

procedure TfrmReporte606Excel.btnGenerarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    try
      ExportarReporte;
    except
      on E: Exception do
      begin
        try
          LogInformacionTxt(
            'Reporte606Excel | ' +
            E.ClassName + ' | ' + E.Message
          );
        except
        end;

        MessageDlg(
          'No fue posible generar el reporte 606.' + #13#10 +
          E.Message,
          mtError, [mbOK], 0);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
