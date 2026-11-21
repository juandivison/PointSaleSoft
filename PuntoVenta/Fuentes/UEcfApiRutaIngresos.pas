unit UEcfApiRutaIngresos;

{ CP13.12. Entrada central IDESI API sin modificar los botones comerciales.
  Si hay intento previo: solamente GET metadata. Si no: POST unico por el
  despachador persistente. ASLAN lo resuelve el caller por su ruta original. }

interface

function ProcesarIdesiSiCorresponde(ANumeroTrn, AUsarFacturaTxt: Integer;
  const ARutaEcfExe, AIniPath: string; out AMensaje: string): Boolean;

implementation

uses
  SysUtils, IBQuery, IBDatabase, UDatModConectar, UEcfCanalConfig,
  UEcfApiSwitch, UEcfApiIntento, UEcfApiClienteV1,
  UEcfApiDespachoIngresos, UEcfApiConsultaDocumento, UEcfApiTimbreLog;

function ProcesarIdesiSiCorresponde(ANumeroTrn, AUsarFacturaTxt: Integer;
  const ARutaEcfExe, AIniPath: string; out AMensaje: string): Boolean;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  Rnc, ENcf, RutaTxt, Directorio: string;
  IniciadaAqui, TieneIntento: Boolean;
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  Respuesta: TEcfApiRespuestaV1;
  MsgTimbre, IniEfectivo, IniIdesi: string;
begin
  Result := False;
  AMensaje := '';
  if ANumeroTrn <= 0 then
    raise Exception.Create('Numero TRN invalido para envio e-CF.');
  { El INI operativo esta junto a IdesiToolECF.exe (Bin\Idesi).
    El caller CP13.12 podia usar erroneamente la carpeta del ERP. }
  IniIdesi := IncludeTrailingPathDelimiter(
    ExtractFilePath(ExpandFileName(ARutaEcfExe))) + 'repconf_cr.ini';
  if FileExists(IniIdesi) then
    IniEfectivo := IniIdesi
  else
    IniEfectivo := AIniPath;
  if not FileExists(IniEfectivo) then
    raise Exception.Create('No se encontro repconf_cr.ini de IDESI.');
  Tx := dmConectar.IBTransaction1;
  IniciadaAqui := not Tx.InTransaction;
  if IniciadaAqui then Tx.StartTransaction;
  try
    Q := TIBQuery.Create(nil);
    try
      Q.Database := dmConectar.IBDatabase1;
      Q.Transaction := Tx;
      Q.SQL.Text :=
        'SELECT N.NUMERO_NCF, C.RNC_NUMERO AS RNC_EMISOR ' +
        'FROM VENTAS_MAST V ' +
        'LEFT JOIN NCF_ASIGNADOS N ON N.SERIE = V.SERIE_NCF_ASIGNADO ' +
        'LEFT JOIN COMPANIA C ON C.CODIGO = V.CIA_KEY ' +
        'WHERE V.NUMERO = :NUMERO';
      Q.ParamByName('NUMERO').AsInteger := ANumeroTrn;
      Q.Open;
      if Q.Eof then raise Exception.Create('VENTAS_MAST no tiene el TRN.');
      Rnc := Trim(Q.FieldByName('RNC_EMISOR').AsString);
      ENcf := Trim(Q.FieldByName('NUMERO_NCF').AsString);
    finally
      Q.Free;
    end;
  finally
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;

  if (Rnc = '') or (Copy(UpperCase(ENcf),1,1) <> 'E') then
    raise Exception.Create('Factura sin RNC emisor o e-NCF E.');
  Config := ResolverCanalEcfConsulta(dmConectar.IBDatabase1,Tx,
    Rnc,ANumeroTrn,TieneIntento,Intento);
  if Config.Canal <> ceIdesiApi then Exit; {ASLAN: no se modifica.}
  Result := True;

  if TieneIntento then
  begin
    { Ni un segundo POST: la consulta GET no altera el estado persistido. }
    if RecuperarTimbreIdesiApi(dmConectar.IBDatabase1,Tx,
      ANumeroTrn,IniEfectivo,MsgTimbre) then
      AMensaje := 'IDESI API: intento previo (' + Intento.EstadoLocal +
        '), '+ MsgTimbre
    else
      AMensaje := 'IDESI API: intento previo (' + Intento.EstadoLocal +
        '), e-NCF ' + ENcf + '. ' + MsgTimbre + ' Sin nuevo POST.';
    Exit;
  end;

  RutaTxt := '';
  if AUsarFacturaTxt = 1 then
  begin
    Directorio := IncludeTrailingPathDelimiter(
      ExtractFilePath(ExpandFileName(ARutaEcfExe))) + 'factura_txt';
    if (not DirectoryExists(Directorio)) and (not ForceDirectories(Directorio)) then
      raise Exception.Create('No se pudo crear directorio FacturaTxt IDESI.');
    RutaTxt := IncludeTrailingPathDelimiter(Directorio) +
      'factura_' + IntToStr(ANumeroTrn) + '.txt';
  end;

  Respuesta := EnviarIngresoPersistidoIdesiApi(dmConectar.IBDatabase1,Tx,
    ANumeroTrn,AUsarFacturaTxt,IniEfectivo,RutaTxt,True);
  AMensaje := 'IDESI API envio realizado. TRN=' + IntToStr(ANumeroTrn) +
    ', e-NCF=' + ENcf + ', HTTP=' + IntToStr(Respuesta.StatusCode) +
    '. La aceptacion fiscal debe verificarse por consulta.';
  { Solo una lectura inmediata; si DGII aun procesa, el boton Validar e-CF
    recupera mas tarde sin segundo POST. El fallo de timbre no reenvia. }
  try
    RecuperarTimbreIdesiApi(dmConectar.IBDatabase1,Tx,
      ANumeroTrn,IniEfectivo,MsgTimbre);
    AMensaje := AMensaje + ' ' + MsgTimbre;
  except
    on E: Exception do
      AMensaje := AMensaje + ' Timbre pendiente de recuperacion: ' +
        E.Message;
  end;
end;

end.
