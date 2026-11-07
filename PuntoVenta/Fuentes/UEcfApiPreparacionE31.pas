unit UEcfApiPreparacionE31;

{
  CP8 / Delphi 7. Preparar una E31 TEST SIN ENVIARLA.
  Lee RNC del emisor de la transaccion REAL (no del selector de pantalla),
  genera Factura.txt con el Builder existente, convierte el TXT al contrato
  publico v1 y persiste los bytes originales e identidad idempotente.
  No envia por HTTP, no reserva otro e-NCF, no modifica VENTAS_MAST.
}

interface

uses
  SysUtils, IBDatabase, UEcfApiIntento;

function PrepararFacturaE31ParaApiTest(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const AOutputDir: string): TEcfApiIntento;

implementation

uses
  DB, IBQuery, UFacturaTxtBuilder, UEcfCanalConfig, UEcfApiV1Json;

function LeerRncEmisorDeFactura(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer): string;
var
  Q: TIBQuery;
begin
  Result := '';
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADatabase;
    Q.Transaction := ATransaction;
    Q.SQL.Text :=
      'SELECT a.RNC_NUMERO AS RNC_EMISOR ' +
      'FROM VENTAS_MAST vm ' +
      'INNER JOIN COMPANIA a ON a.CODIGO = vm.CIA_KEY ' +
      'WHERE vm.NUMERO = :NUMERO';
    Q.ParamByName('NUMERO').AsInteger := ANumeroTrn;
    Q.Open;
    if not Q.Eof then
      Result := Trim(Q.FieldByName('RNC_EMISOR').AsString);
  finally
    Q.Free;
  end;
  if Result = '' then
    raise Exception.Create('La factura no tiene RNC emisor resoluble desde VENTAS_MAST.');
end;

procedure VerificarSinTimbreAnterior(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer);
var
  Q: TIBQuery;
begin
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADatabase;
    Q.Transaction := ATransaction;
    Q.SQL.Text :=
      'SELECT FIRST 1 ENCF FROM ECF_TIMBRE_LOG WHERE TRN = :TRN';
    Q.ParamByName('TRN').AsInteger := ANumeroTrn;
    Q.Open;
    if not Q.Eof then
      raise Exception.Create('La transaccion ya tiene timbre en ECF_TIMBRE_LOG. ' +
        'Conciliar antes de considerar un nuevo canal.');
  finally
    Q.Free;
  end;
end;

function PrepararFacturaE31ParaApiTest(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const AOutputDir: string): TEcfApiIntento;
var
  Rnc, G, Externa, Ruta, JsonUtf8, Carpeta: string;
  Config: TEcfCanalConfiguracion;
  Previo: TEcfApiIntento;
  Builder: TFacturaTxtBuilder;
  Construido: TFacturaTxtBuildResult;
begin
  if (ADatabase = nil) or (ATransaction = nil) or
     (not ADatabase.Connected) or (not ATransaction.InTransaction) then
    raise Exception.Create('Se requiere conexion y transaccion IBX activas.');
  if ANumeroTrn <= 0 then
    raise Exception.Create('Numero de transaccion invalido.');
  Rnc := LeerRncEmisorDeFactura(ADatabase,ATransaction,ANumeroTrn);
  Config := CargarConfiguracionCanalEcf(ADatabase,ATransaction,Rnc);
  if (Config.Canal <> ceIdesiApi) or (Config.Ambiente <> aeTest) then
    raise Exception.Create('Preparacion E31 permitida solo en IDESI_API / TEST.');
  { Bloquea incluso si el usuario cambio la configuracion despues de un intento. }
  if CargarIntentoApiPorFactura(ADatabase,Rnc,ANumeroTrn,Previo) then
    raise Exception.Create('Ya existe un intento API registrado para esta factura. ' +
      'Usar conciliacion; no volver a generar JSON ni identidad.');
  VerificarSinTimbreAnterior(ADatabase,ATransaction,ANumeroTrn);

  Carpeta := Trim(AOutputDir);
  if Carpeta = '' then
    raise Exception.Create('Ruta de trabajo fiscal obligatoria.');
  Carpeta := IncludeTrailingPathDelimiter(Carpeta);
  if not DirectoryExists(Carpeta) then
    if not ForceDirectories(Carpeta) then
      raise Exception.Create('No se pudo crear carpeta para Factura.txt API.');
  Ruta := Carpeta + 'Factura_' + IntToStr(ANumeroTrn) + '.txt';

  Builder := TFacturaTxtBuilder.Create(ADatabase,ATransaction);
  try
    Construido := Builder.GenerateFacturaTxt(ANumeroTrn,Ruta);
  finally
    Builder.Free;
  end;
  if (Construido.TipoEcf <> 'E31') or (Construido.DetailCount <= 0) then
    raise Exception.Create('El contrato API CP8 permite E31 con detalle valido.');

  { Generar identidad UNA SOLA VEZ, antes del JSON; mismo ID se persiste. }
  G := NuevoIdIntentoEcf;
  Externa := 'PS-TEST-' + Rnc + '-' + IntToStr(ANumeroTrn) + '-' + G;
  JsonUtf8 := ConstruirJsonE31PublicV1(Construido.OutputFile,Rnc,Externa);
  Result := PrepararIntentoApiE31(ADatabase,Config,ANumeroTrn,
    Construido.ENcf,JsonUtf8,G);
end;

end.
