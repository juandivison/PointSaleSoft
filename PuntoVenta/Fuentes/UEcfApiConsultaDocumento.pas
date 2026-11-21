unit UEcfApiConsultaDocumento;

{
  CP13.9 - Solo GET fiscal IDESI API (estado, metadata, detalles, XML).
  Usa canal historico del intento si existe. Sin nuevos POST, sin fallback.
  El retorno XML es binario y NO se convierte a string de codepage.
  La persistencia / firma XMLDSig se implementaran en un checkpoint aparte.
}

interface

uses IBDatabase, UEcfApiClienteV1;

type
  TEcfConsultaIdesiTipo = (ectEstado, ectMetadatos, ectDetalles, ectXmlFirmado);

function ConsultarDocumentoIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const AIniPath: string;
  ATipoConsulta: TEcfConsultaIdesiTipo;
  const ARncComprador, ACodigoSeguridad: string): TEcfApiRespuestaV1;

implementation

uses SysUtils, DB, IBQuery, UEcfCanalConfig, UEcfApiSwitch,
  UEcfApiIntento, UDatModConectar;

function ConsultarDocumentoIdesiApi(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const AIniPath: string;
  ATipoConsulta: TEcfConsultaIdesiTipo;
  const ARncComprador, ACodigoSeguridad: string): TEcfApiRespuestaV1;
var
  Q: TIBQuery;
  Rnc, ENcf: string;
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  TieneIntento: Boolean;
  TxIniciadaAqui: Boolean;
begin
  Result.StatusCode := 0;
  Result.BodyBytes := '';
  Result.ContentType := '';
  Result.IdempotencyReplayed := '';
  if (dmConectar = nil) or (ADatabase = nil) or
     (ATransaction = nil) or (ADatabase <> dmConectar.IBDatabase1) or
     (ATransaction <> dmConectar.IBTransaction1) or
     (ATransaction.DefaultDatabase <> ADatabase) or
     (not ADatabase.Connected) or (ANumeroTrn <= 0) then
    raise Exception.Create('Consulta IDESI requiere conexion global y TRN valido.');
  { Lectura compatible con CommitRetaining: no cerrar la transaccion del ERP. }

  ENcf := '';
  Rnc := '';
  TxIniciadaAqui := not ATransaction.InTransaction;
  if TxIniciadaAqui then ATransaction.StartTransaction;
  try
    Q := TIBQuery.Create(nil);
    try
      Q.Database := ADatabase;
      Q.Transaction := ATransaction;
      Q.SQL.Text := 'SELECT N.NUMERO_NCF, C.RNC_NUMERO AS RNC_EMISOR ' +
        'FROM VENTAS_MAST V ' +
        'LEFT JOIN NCF_ASIGNADOS N ON N.SERIE = V.SERIE_NCF_ASIGNADO ' +
        'LEFT JOIN COMPANIA C ON C.CODIGO = V.CIA_KEY ' +
        'WHERE V.NUMERO = :NUMERO';
      Q.ParamByName('NUMERO').AsInteger := ANumeroTrn;
      Q.Open;
      if not Q.Eof then
      begin
        if not Q.FieldByName('NUMERO_NCF').IsNull then
          ENcf := Trim(Q.FieldByName('NUMERO_NCF').AsString);
        if not Q.FieldByName('RNC_EMISOR').IsNull then
          Rnc := Trim(Q.FieldByName('RNC_EMISOR').AsString);
      end;
    finally
      Q.Free;
    end;
  finally
    if TxIniciadaAqui and ATransaction.InTransaction then ATransaction.Rollback;
  end;
  if (Rnc = '') or (ENcf = '') then
    raise Exception.Create('No se pudo identificar RNC y e-NCF de factura.');

  Config := ResolverCanalEcfConsulta(ADatabase,ATransaction,
    Rnc,ANumeroTrn,TieneIntento,Intento);
  if Config.Canal <> ceIdesiApi then
    raise Exception.Create('Canal ASLAN. Esta operacion GET IDESI no aplica.');
  if TieneIntento and (not SameText(Intento.ENcf,ENcf)) then
    raise Exception.Create('e-NCF actual no coincide con el intento API historico.');

  case ATipoConsulta of
    ectEstado:
      Result := ConsultarEstadoIdesiV1(Config,AIniPath,ENcf);
    ectMetadatos:
      Result := ConsultarMetadatosIdesiV1(Config,AIniPath,ENcf);
    ectDetalles:
      Result := ConsultarDetallesIdesiV1(Config,AIniPath,ENcf,
        ARncComprador,ACodigoSeguridad);
    ectXmlFirmado:
      Result := DescargarXmlFirmadoIdesiV1(Config,AIniPath,ENcf);
  else
    raise Exception.Create('Operacion de consulta IDESI desconocida.');
  end;
end;

end.
