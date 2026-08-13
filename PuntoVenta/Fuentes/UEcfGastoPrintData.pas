unit UEcfGastoPrintData;

interface

uses
  SysUtils, Classes, DB, IBQuery, IBDatabase, UDatModConectar;

type
  TEcfGastoPrintData = class
  private
    FMaster: TIBQuery;
    FDetalle: TIBQuery;
    FTrn: Integer;
    procedure PrepararMaster;
    procedure PrepararDetalle;
    function CampoTexto(AQuery: TDataSet; const ACampo: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Cargar(ATrn: Integer);
    function EsAceptado: Boolean;
    function TipoEcfTexto: string;
    function TipoEcfDescripcion: string;

    property Master: TIBQuery read FMaster;
    property Detalle: TIBQuery read FDetalle;
    property Trn: Integer read FTrn;
  end;

implementation

constructor TEcfGastoPrintData.Create;
begin
  inherited Create;

  FMaster := TIBQuery.Create(nil);
  FMaster.Database := dmConectar.IBDatabase1;
  FMaster.Transaction := dmConectar.IBTransaction1;

  FDetalle := TIBQuery.Create(nil);
  FDetalle.Database := dmConectar.IBDatabase1;
  FDetalle.Transaction := dmConectar.IBTransaction1;

  PrepararMaster;
  PrepararDetalle;
end;

destructor TEcfGastoPrintData.Destroy;
begin
  FDetalle.Free;
  FMaster.Free;
  inherited Destroy;
end;

procedure TEcfGastoPrintData.PrepararMaster;
begin
  FMaster.SQL.Text :=
    'SELECT ' +
    '  m.NUMERO AS TRN, ' +
    '  m.FECHA AS FECHA_DOCUMENTO, ' +
    '  m.TIPO_CF, ' +
    '  m.ECF AS ENCF, ' +
    '  m.MONTO AS MONTO_PAGADO, ' +
    '  m.OBSERVACION, ' +
    '  COALESCE(m.IND_MONTO_GRAVADO, 0) AS IND_MONTO_GRAVADO, ' +
    '  p.DESCRIPCION AS PROVEEDOR, ' +
    '  p.RNC_PROVEEDOR AS DOCUMENTO_PROVEEDOR, ' +
    '  p.CALYYNUM AS DIRECCION_PROVEEDOR, ' +
    '  p.EMAIL AS EMAIL_PROVEEDOR, ' +
    '  c.NOMBRE AS EMPRESA, ' +
    '  c.RNC_NUMERO AS RNC_EMISOR, ' +
    '  c.CALLEYNUMERO AS DIRECCION_EMISOR, ' +
    '  g.ESTADO, ' +
    '  g.TRACK_ID, ' +
    '  g.CODIGO_SEGURIDAD, ' +
    '  g.FECHA_EMISION, ' +
    '  g.FECHA_FIRMA, ' +
    '  g.MONTO_TOTAL, ' +
    '  g.URL_IMAGE, ' +
    '  g.XML_FIRMADO, ' +
    '  (SELECT SUM( ' +
    '     CASE ' +
    '       WHEN COALESCE(m.IND_MONTO_GRAVADO, 0) = 1 ' +
    '       THEN COALESCE(d.VALOR, 0) - COALESCE(d.MONTO_ITBIS, 0) ' +
    '       ELSE COALESCE(d.VALOR, 0) ' +
    '     END) ' +
    '   FROM TRANS_OPERACION_DET d ' +
    '   WHERE d.NUMERO = m.NUMERO ' +
    '     AND COALESCE(d.STATUS, ''A'') <> ''C'') AS BASE_FISCAL, ' +
    '  (SELECT SUM(COALESCE(d.MONTO_ITBIS, 0)) ' +
    '   FROM TRANS_OPERACION_DET d ' +
    '   WHERE d.NUMERO = m.NUMERO ' +
    '     AND COALESCE(d.STATUS, ''A'') <> ''C'') AS TOTAL_ITBIS, ' +
    '  (SELECT SUM(COALESCE(d.MONTO_ITBIS_RETENIDO, 0)) ' +
    '   FROM TRANS_OPERACION_DET d ' +
    '   WHERE d.NUMERO = m.NUMERO ' +
    '     AND COALESCE(d.STATUS, ''A'') <> ''C'') AS TOTAL_RET_ITBIS, ' +
    '  (SELECT SUM(COALESCE(d.MONTO_ISR_RETENIDO, 0)) ' +
    '   FROM TRANS_OPERACION_DET d ' +
    '   WHERE d.NUMERO = m.NUMERO ' +
    '     AND COALESCE(d.STATUS, ''A'') <> ''C'') AS TOTAL_RET_ISR ' +
    'FROM TRANS_OPERACION_MASTER m ' +
    'LEFT JOIN PROVEEDORES p ON p.CODIGO_CTE = m.COD_PROVEEDOR ' +
    'LEFT JOIN COMPANIA c ON c.CODIGO = m.CIA_KEY ' +
    'LEFT JOIN ECF_GASTO_ENVIO g ' +
    '  ON g.CIA_KEY = m.CIA_KEY ' +
    ' AND g.TRN = m.NUMERO ' +
    ' AND g.ENCF = m.ECF ' +
    'WHERE m.NUMERO = :TRN ' +
    '  AND m.TIPO_CF IN (41, 43)';
end;

procedure TEcfGastoPrintData.PrepararDetalle;
begin
  FDetalle.SQL.Text :=
    'SELECT ' +
    '  d.SERIE, ' +
    '  d.COD_SERV_PROD, ' +
    '  COALESCE(NULLIF(TRIM(d.OBSERVACION), ''''), ' +
    '           NULLIF(TRIM(p.DESCRIPCION), ''''), ''ITEM'') AS DESCRIPCION, ' +
    '  COALESCE(d.CANTIDAD, 0) AS CANTIDAD, ' +
    '  COALESCE(d.PRECIO, 0) AS PRECIO, ' +
    '  COALESCE(d.VALOR, 0) AS VALOR, ' +
    '  COALESCE(d.MONTO_ITBIS, 0) AS MONTO_ITBIS, ' +
    '  COALESCE(d.MONTO_ITBIS_RETENIDO, 0) AS MONTO_ITBIS_RETENIDO, ' +
    '  COALESCE(d.MONTO_ISR_RETENIDO, 0) AS MONTO_ISR_RETENIDO, ' +
    '  d.IND_BIEN_SERVICIO, ' +
    '  CASE d.IND_BIEN_SERVICIO ' +
    '    WHEN 1 THEN ''Bien'' ' +
    '    WHEN 2 THEN ''Servicio'' ' +
    '    ELSE '''' ' +
    '  END AS TIPO_BS ' +
    'FROM TRANS_OPERACION_DET d ' +
    'LEFT JOIN PRODUCTOS p ON p.CODIGO = d.COD_SERV_PROD ' +
    'WHERE d.NUMERO = :TRN ' +
    '  AND COALESCE(d.STATUS, ''A'') <> ''C'' ' +
    'ORDER BY d.SERIE';
end;

procedure TEcfGastoPrintData.Cargar(ATrn: Integer);
begin
  if ATrn <= 0 then
    raise Exception.Create('Numero de transaccion de gasto no valido.');

  FTrn := ATrn;

  FMaster.Close;
  FMaster.ParamByName('TRN').AsInteger := ATrn;
  FMaster.Open;

  if FMaster.IsEmpty then
    raise Exception.Create(
      'No se encontro una operacion E41/E43 para la transaccion ' +
      IntToStr(ATrn) + '.');

  FDetalle.Close;
  FDetalle.ParamByName('TRN').AsInteger := ATrn;
  FDetalle.Open;

  if FDetalle.IsEmpty then
    raise Exception.Create(
      'La operacion E41/E43 no contiene lineas de detalle para imprimir.');
end;

function TEcfGastoPrintData.CampoTexto(
  AQuery: TDataSet; const ACampo: string): string;
begin
  Result := '';
  if (AQuery = nil) or (AQuery.FindField(ACampo) = nil) then
    Exit;

  if not AQuery.FieldByName(ACampo).IsNull then
    Result := Trim(AQuery.FieldByName(ACampo).AsString);
end;

function TEcfGastoPrintData.EsAceptado: Boolean;
var
  S: string;
begin
  S := UpperCase(CampoTexto(FMaster, 'ESTADO'));
  Result := Pos('ACEPTADO', S) > 0;
end;

function TEcfGastoPrintData.TipoEcfTexto: string;
begin
  Result := 'E' + CampoTexto(FMaster, 'TIPO_CF');
end;

function TEcfGastoPrintData.TipoEcfDescripcion: string;
begin
  if CampoTexto(FMaster, 'TIPO_CF') = '41' then
    Result := 'COMPROBANTE ELECTRONICO DE COMPRAS'
  else if CampoTexto(FMaster, 'TIPO_CF') = '43' then
    Result := 'COMPROBANTE ELECTRONICO PARA GASTOS MENORES'
  else
    Result := 'COMPROBANTE ELECTRONICO DE GASTOS';
end;

end.
