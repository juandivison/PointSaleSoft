unit UfrmEcfSecuenciasConfig;

{ PointSaleSoft, Delphi 7 / Firebird 2.5.
  CP7 QA: solicitud visual de tipos DGII E31..E47.
  La Principal aprueba por servicio central; nunca se autoautoriza.
  Solo E31/E32 tienen ruta REMOTO autorizable en este checkpoint.
  Los otros 8 tipos quedan solicitables, pero LOCAL hasta su integracion.
  No utiliza DFM. No emite e-CF ni consume secuencias.
}

interface

uses
  Windows, SysUtils, Classes, Forms, Controls, StdCtrls, ExtCtrls,
  ComCtrls, Dialogs, IniFiles;

type
  TfrmEcfSecuenciasConfig = class(TForm)
  private
    FCia: Integer;
    FSucursal, FIniPath, FSeccion, FRnc: string;
    lblAmbito, lblUrl, lblEstado, lblAviso: TLabel;
    edtUrl: TEdit;
    lvTipos: TListView;
    btnGuardar, btnSolicitar, btnConsultar, btnCatalogo, btnCerrar: TButton;
    procedure CrearInterfaz;
    procedure Cargar;
    procedure GuardarClick(Sender: TObject);
    procedure SolicitarClick(Sender: TObject);
    procedure ConsultarClick(Sender: TObject);
    procedure CatalogoClick(Sender: TObject);
    procedure CerrarClick(Sender: TObject);
    function LeerRnc: string;
    function TiposSeleccionados: string;
    function SecretoActual: string;
    procedure GuardarValores(const ANombres, AValores: TStrings);
    procedure GuardarSeleccion;
    function Enviar(const ACuerpo: string): TStringList;
    procedure ActualizarEstado;
  public
    constructor CreateConfig(AOwner: TComponent; ACia: Integer;
      const ASucursal, AIniPath: string);
  end;

procedure MostrarConfiguracionSecuencias(ACia: Integer;
  const ASucursal, AIniPath: string);

implementation

uses
  IBDatabase, IBQuery, ComObj, Variants, UDatModConectar,
  UEcfApiCredencialesIni;

const
  { Catalogo DGII de respaldo sin conexion; el servidor publica los nombres
    y su estado operativo. NO son rangos fiscales ni capacidades de emision. }
  TIPOS_CANTIDAD = 10;
  TIPOS: array[0..9] of string =
    ('E31','E32','E33','E34','E41','E43','E44','E45','E46','E47');
  NOMBRES: array[0..9] of string =
    ('Credito fiscal','Consumo','Nota de debito','Nota de credito',
     'Compras','Gastos menores','Regimenes especiales','Gubernamental',
     'Exportaciones','Pagos al exterior');

function BCryptGenRandom(hAlgorithm: THandle; pbBuffer: Pointer;
  cbBuffer, dwFlags: Cardinal): Cardinal; stdcall;
  external 'bcrypt.dll';

function CodigoValido(const S: string): Boolean;
var I: Integer;
begin
  Result := False;
  for I := 0 to TIPOS_CANTIDAD - 1 do
    if S = TIPOS[I] then begin Result := True; Exit; end;
end;

function RutaRemoteImplementada(const ATipo: string): Boolean;
begin
  { La ruta de ventas remota aun solo esta integrada para E31 y E32. }
  Result := (ATipo = 'E31') or (ATipo = 'E32');
end;

function SoloDigitos(const S: string): Boolean;
var I: Integer;
begin
  Result := (Length(S) = 9) or (Length(S) = 11);
  if not Result then Exit;
  for I := 1 to Length(S) do
    if not (S[I] in ['0'..'9']) then begin Result := False; Exit; end;
end;

function IdNuevo: string;
var G: TGUID;
begin
  if CreateGUID(G) <> 0 then
    raise Exception.Create('No se pudo crear identidad de activacion.');
  Result := LowerCase(Copy(GUIDToString(G), 2, 36));
end;

function SecretoAleatorio: string;
var Bytes: array[0..31] of Byte; I: Integer;
begin
  if BCryptGenRandom(0, @Bytes[0], SizeOf(Bytes), 2) <> 0 then
    raise Exception.Create('El generador seguro de Windows no esta disponible.');
  Result := '';
  for I := 0 to High(Bytes) do Result := Result + LowerCase(IntToHex(Bytes[I], 2));
  FillChar(Bytes, SizeOf(Bytes), 0);
end;

function URLSegura(const S: string): Boolean;
var L: string;
begin
  L := LowerCase(Trim(S));
  Result := (Copy(L,1,8)='https://') and (Length(L)>12) and
    (Pos('@',L)=0) and (Pos('#',L)=0) and (Pos(' ',L)=0) and
    (Pos(#13,L)=0) and (Pos(#10,L)=0);
end;

function OrigenHttps(const U: string): string;
var
  S: string;
  I: Integer;
begin
  S := Trim(U);
  if not URLSegura(S) then
    raise Exception.Create('URL del servicio central no es HTTPS valido.');
  I := Pos('/', Copy(S, 9, Length(S)));
  if I <= 1 then
    raise Exception.Create('La URL debe contener ruta de servicio HTTPS.');
  Result := LowerCase(Copy(S, 1, 8 + I - 1));
end;

function EsHex64(const S: string): Boolean;
var I: Integer;
begin
  Result := Length(S) = 64;
  if not Result then Exit;
  for I := 1 to Length(S) do
    if not (S[I] in ['a'..'f','0'..'9']) then
    begin Result := False; Exit; end;
end;

function ParsearJsonPlano(const S: string): TStringList;
var P, Inicio: Integer; K, V: string;
  procedure Espacios;
  begin
    while (P <= Length(S)) and (S[P] in [' ',#9,#10,#13]) do Inc(P);
  end;
  function Cadena: string;
  begin
    if (P>Length(S)) or (S[P]<>'"') then
      raise Exception.Create('Respuesta JSON no valida.');
    Inc(P); Inicio := P;
    while (P<=Length(S)) and (S[P]<>'"') do
    begin
      if (S[P]='\') or (Ord(S[P])<32) then
        raise Exception.Create('JSON contiene escape no admitido.');
      Inc(P);
    end;
    if P>Length(S) then raise Exception.Create('JSON incompleto.');
    Result := Copy(S, Inicio, P-Inicio); Inc(P);
  end;
begin
  Result := TStringList.Create;
  try
    P:=1; Espacios;
    if (P>Length(S)) or (S[P]<>'{') then
      raise Exception.Create('Se esperaba objeto JSON.');
    Inc(P); Espacios;
    while (P<=Length(S)) and (S[P]<>'}') do
    begin
      K:=Cadena; Espacios;
      if (P>Length(S)) or (S[P]<>':') then
        raise Exception.Create('JSON sin separador.');
      Inc(P); Espacios; V:=Cadena;
      if Result.IndexOfName(K)>=0 then
        raise Exception.Create('JSON contiene campo duplicado.');
      Result.Add(K+'='+V); Espacios;
      if (P<=Length(S)) and (S[P]=',') then
      begin Inc(P); Espacios; end
      else Break;
    end;
    if (P>Length(S)) or (S[P]<>'}') then
      raise Exception.Create('JSON sin cierre.');
    Inc(P); Espacios;
    if P<=Length(S) then raise Exception.Create('JSON adicional no esperado.');
  except
    Result.Free; raise;
  end;
end;

procedure MostrarConfiguracionSecuencias(ACia: Integer;
  const ASucursal, AIniPath: string);
var F: TfrmEcfSecuenciasConfig;
begin
  F := TfrmEcfSecuenciasConfig.CreateConfig(nil, ACia, ASucursal, AIniPath);
  try F.ShowModal; finally F.Free; end;
end;

constructor TfrmEcfSecuenciasConfig.CreateConfig(AOwner: TComponent;
  ACia: Integer; const ASucursal, AIniPath: string);
begin
  inherited CreateNew(AOwner);
  if (ACia<=0) or (Trim(ASucursal)='') or (Trim(AIniPath)='') then
    raise Exception.Create('Identidad de empresa o INI no disponible.');
  FCia:=ACia; FSucursal:=Trim(ASucursal);
  FIniPath:=ExpandFileName(AIniPath);
  FSeccion:='ECF_SECUENCIA_'+IntToStr(FCia)+'_'+FSucursal;
  Caption:='Secuencias e-CF centralizadas - Configuracion TEST';
  Position:=poScreenCenter; BorderStyle:=bsDialog;
  ClientWidth:=810; ClientHeight:=515;
  Font.Name:='Tahoma'; Font.Size:=9;
  CrearInterfaz;
  Cargar;
end;

procedure TfrmEcfSecuenciasConfig.CrearInterfaz;
  function Etiqueta(const ATexto: string; X,Y,W: Integer): TLabel;
  begin
    Result:=TLabel.Create(Self); Result.Parent:=Self;
    Result.SetBounds(X,Y,W,22); Result.Caption:=ATexto;
  end;
  function Boton(const Texto: string; X,Y,W: Integer;
    AClick: TNotifyEvent): TButton;
  begin
    Result:=TButton.Create(Self); Result.Parent:=Self;
    Result.SetBounds(X,Y,W,30); Result.Caption:=Texto;
    Result.OnClick:=AClick;
  end;
  procedure Columna(const Texto: string; AAncho: Integer);
  var C: TListColumn;
  begin
    C:=lvTipos.Columns.Add; C.Caption:=Texto; C.Width:=AAncho;
  end;
var I: Integer; It: TListItem;
begin
  lblAmbito:=Etiqueta('',14,12,775);
  lblUrl:=Etiqueta('Servicio de activacion HTTPS de la Principal:',14,42,700);
  edtUrl:=TEdit.Create(Self); edtUrl.Parent:=Self;
  edtUrl.SetBounds(14,63,780,23);
  lvTipos:=TListView.Create(Self); lvTipos.Parent:=Self;
  lvTipos.SetBounds(14,99,780,305);
  lvTipos.ViewStyle:=vsReport; lvTipos.RowSelect:=True;
  lvTipos.Checkboxes:=True; lvTipos.ReadOnly:=True;
  Columna('Tipo',65); Columna('Documento DGII',290);
  Columna('Estado de activacion',195); Columna('Origen actual',115);
  Columna('Credencial',100);
  for I:=0 to TIPOS_CANTIDAD-1 do
  begin
    It:=lvTipos.Items.Add;
    It.Caption:=TIPOS[I];
    It.SubItems.Add(NOMBRES[I]);
    It.SubItems.Add('Sin solicitar');
    It.SubItems.Add('LOCAL');
    It.SubItems.Add('No');
  end;
  lblEstado:=Etiqueta('',14,414,775);
  lblAviso:=Etiqueta(
    'Los tipos E33-E47 se pueden solicitar. La emision remota solo se activara cuando su flujo este integrado.',
    14,437,780);
  btnCatalogo:=Boton('Actualizar catalogo',14,467,147,CatalogoClick);
  btnGuardar:=Boton('Guardar seleccion',170,467,133,GuardarClick);
  btnSolicitar:=Boton('Solicitar activacion',313,467,148,SolicitarClick);
  btnConsultar:=Boton('Consultar aprobacion',471,467,150,ConsultarClick);
  btnCerrar:=Boton('Cerrar',688,467,106,CerrarClick);
end;

function TfrmEcfSecuenciasConfig.LeerRnc: string;
var Tx: TIBTransaction; Q: TIBQuery;
begin
  Result:='';
  if (dmConectar=nil) or (not dmConectar.IBDatabase1.Connected) then
    raise Exception.Create('La base Firebird no esta conectada.');
  Tx:=TIBTransaction.Create(nil); Q:=TIBQuery.Create(nil);
  try
    Tx.DefaultDatabase:=dmConectar.IBDatabase1;
    Tx.Params.Add('read_committed'); Tx.Params.Add('rec_version');
    Q.Database:=dmConectar.IBDatabase1; Q.Transaction:=Tx;
    Tx.StartTransaction;
    Q.SQL.Text:='SELECT RNC_NUMERO FROM COMPANIA WHERE CODIGO=:C';
    Q.ParamByName('C').AsInteger:=FCia; Q.Open;
    if Q.Eof then raise Exception.Create('Empresa no localizada en COMPANIA.');
    Result:=Trim(Q.FieldByName('RNC_NUMERO').AsString);
    Q.Close; Tx.Commit;
  finally
    if Tx.InTransaction then Tx.Rollback;
    Q.Free; Tx.Free;
  end;
  if not SoloDigitos(Result) then
    raise Exception.Create('RNC emisor invalido en COMPANIA.');
end;

procedure TfrmEcfSecuenciasConfig.Cargar;
var Ini: TIniFile; I: Integer; Origen, Token, Global: string;
begin
  if not FileExists(FIniPath) then
    raise Exception.Create('No se encontro repconf_cr.ini: '+FIniPath);
  FRnc:=LeerRnc;
  lblAmbito.Caption:='RNC '+FRnc+' | Empresa '+IntToStr(FCia)+
    ' | Sucursal '+FSucursal+' | Ambiente TEST';
  Ini:=TIniFile.Create(FIniPath);
  try
    edtUrl.Text:=Trim(Ini.ReadString(FSeccion,'UrlActivacion',''));
    Global:=UpperCase(Trim(Ini.ReadString(FSeccion,'Origen','LOCAL')));
    if Global<>'LOCAL' then
      raise Exception.Create('Origen global no es LOCAL. Migre el INI ' +
        'antes de activar seleccion por tipo, sin perder reservas.');
    for I:=0 to TIPOS_CANTIDAD-1 do
    begin
      lvTipos.Items[I].Checked:=Ini.ReadBool(FSeccion,'Solicitar_'+TIPOS[I],False);
      Origen:=UpperCase(Trim(Ini.ReadString(FSeccion,'Origen_'+TIPOS[I],
        Ini.ReadString(FSeccion,'Origen','LOCAL'))));
      if (Origen<>'REMOTO') and (Origen<>'LOCAL') then
        raise Exception.Create('Origen invalido para '+TIPOS[I]);
      if (Origen='REMOTO') and not RutaRemoteImplementada(TIPOS[I]) then
        raise Exception.Create('Origen REMOTO no soportado para '+TIPOS[I]+
          '. Requiere reconciliacion antes de abrir configuracion.');
      lvTipos.Items[I].SubItems[2]:=Origen;
      Token:=Ini.ReadString(FSeccion,'TokenProtected_'+TIPOS[I],'');
      if Token='' then lvTipos.Items[I].SubItems[3]:='Sin token'
      else
      begin
        try
          Token:=DescifrarDPAPI(Token,FSeccion+'_'+TIPOS[I]);
          if Token='' then raise Exception.Create('Token vacio.');
          lvTipos.Items[I].SubItems[3]:='Protegida';
        except
          lvTipos.Items[I].SubItems[3]:='No accesible';
        end;
      end;
      if RutaRemoteImplementada(TIPOS[I]) then
        lvTipos.Items[I].SubItems[1]:='Ruta E31/E32 instalada'
      else
        lvTipos.Items[I].SubItems[1]:='Pendiente integrar emision';
    end;
    lblEstado.Caption:='Activacion central: '+
      Ini.ReadString(FSeccion,'EstadoActivacion','SIN_SOLICITUD');
  finally Ini.Free; end;
end;

procedure TfrmEcfSecuenciasConfig.GuardarValores(
  const ANombres, AValores: TStrings);
var Ini: TMemIniFile; I: Integer; Bkp: string;
begin
  if ANombres.Count<>AValores.Count then
    raise Exception.Create('Valores INI incompletos.');
  Bkp:=FIniPath+'.cp7-'+FormatDateTime('yyyymmdd-hhnnss-zzz',Now)+'.bak';
  if not Windows.CopyFile(PChar(FIniPath),PChar(Bkp),True) then
    raise Exception.Create('No se pudo respaldar el INI. No hubo cambios.');
  Ini:=TMemIniFile.Create(FIniPath);
  try
    try
      for I:=0 to ANombres.Count-1 do
        Ini.WriteString(FSeccion,ANombres[I],AValores[I]);
      Ini.UpdateFile;
    except
      Windows.CopyFile(PChar(Bkp),PChar(FIniPath),False);
      raise;
    end;
  finally Ini.Free; end;
end;

procedure TfrmEcfSecuenciasConfig.GuardarSeleccion;
var N,V: TStringList; I: Integer;
begin
  N:=TStringList.Create; V:=TStringList.Create;
  try
    for I:=0 to TIPOS_CANTIDAD-1 do
    begin
      N.Add('Solicitar_'+TIPOS[I]);
      if lvTipos.Items[I].Checked then V.Add('1') else V.Add('0');
    end;
    GuardarValores(N,V);
  finally N.Free; V.Free; end;
end;

function TfrmEcfSecuenciasConfig.TiposSeleccionados: string;
var I: Integer;
begin
  Result:='';
  for I:=0 to TIPOS_CANTIDAD-1 do
    if lvTipos.Items[I].Checked then
    begin
      if Result<>'' then Result:=Result+',';
      Result:=Result+TIPOS[I];
    end;
end;

function TfrmEcfSecuenciasConfig.SecretoActual: string;
var Ini: TIniFile; Protegido: string;
begin
  Ini:=TIniFile.Create(FIniPath);
  try Protegido:=Ini.ReadString(FSeccion,'SecretoActivacionProtected','');
  finally Ini.Free; end;
  if Protegido='' then raise Exception.Create('No existe solicitud de activacion.');
  Result:=DescifrarDPAPI(Protegido,FSeccion+'_ACTIVACION');
  if not EsHex64(Result) then raise Exception.Create('Secreto local de activacion invalido.');
end;

function TfrmEcfSecuenciasConfig.Enviar(const ACuerpo: string): TStringList;
var Http: OleVariant; Json: string; Codigo: Integer;
begin
  if not URLSegura(edtUrl.Text) then
    raise Exception.Create('Configure una URL HTTPS confiable de la Principal.');
  Http:=CreateOleObject('WinHttp.WinHttpRequest.5.1');
  Http.SetTimeouts(3000,3000,5000,5000);
  Http.Option[6]:=False; // Nunca seguir redirecciones.
  Http.Option[9]:=$00000800; // TLS 1.2.
  Http.Open('POST',Trim(edtUrl.Text),False);
  Http.SetRequestHeader('Content-Type','application/x-www-form-urlencoded');
  Http.SetRequestHeader('Accept','application/json');
  Http.Send(ACuerpo);
  Codigo:=Integer(Http.Status);
  Json:=string(Http.ResponseText);
  if Length(Json)>16384 then raise Exception.Create('Respuesta de servidor excesiva.');
  Result:=ParsearJsonPlano(Json);
  if Codigo<>200 then
  begin
    Json:=Result.Values['resultado']; Result.Free;
    raise Exception.Create('Central: '+Json+' (HTTP '+IntToStr(Codigo)+').');
  end;
end;

procedure TfrmEcfSecuenciasConfig.ActualizarEstado;
begin
  Cargar;
end;

procedure TfrmEcfSecuenciasConfig.CatalogoClick(Sender: TObject);
var Campos: TStringList; I: Integer; Nombre, Integrado: string;
begin
  try
    Campos:=Enviar('accion=catalogo');
    try
      if Campos.Values['resultado']<>'OK' then
        raise Exception.Create('Catalogo no disponible.');
      for I:=0 to TIPOS_CANTIDAD-1 do
      begin
        Nombre:=Campos.Values['nombre_'+TIPOS[I]];
        Integrado:=Campos.Values['integrado_'+TIPOS[I]];
        if Nombre='' then
          raise Exception.Create('El catalogo central no incluye '+TIPOS[I]);
        lvTipos.Items[I].SubItems[0]:=Nombre;
        if Integrado='0' then lvTipos.Items[I].SubItems[1]:='Pendiente servidor'
        else if not RutaRemoteImplementada(TIPOS[I]) then
          lvTipos.Items[I].SubItems[1]:='Pendiente PointSaleSoft'
        else lvTipos.Items[I].SubItems[1]:='Disponible para autorizacion';
      end;
      MessageDlg('Catalogo E31-E47 actualizado desde la Principal.',
        mtInformation,[mbOK],0);
    finally Campos.Free; end;
  except on E:Exception do
    MessageDlg('Catalogo: '+E.Message,mtError,[mbOK],0);
  end;
end;

procedure TfrmEcfSecuenciasConfig.GuardarClick(Sender: TObject);
begin
  try
    GuardarSeleccion;
    MessageDlg('Seleccion guardada. Esto NO habilita secuencias remotas.',
      mtInformation,[mbOK],0);
  except on E:Exception do
    MessageDlg('No se guardo seleccion: '+E.Message,mtError,[mbOK],0);
  end;
end;

procedure TfrmEcfSecuenciasConfig.SolicitarClick(Sender: TObject);
var Ini: TIniFile; Id, Secreto, Dispositivo, Tipos,
    PrevId, PrevTipos, PrevEstado, ActualUrl: string;
    N,V,Respuesta: TStringList;
begin
  try
    Tipos:=TiposSeleccionados;
    if Tipos='' then raise Exception.Create('Seleccione al menos un tipo de e-CF.');
    if not URLSegura(edtUrl.Text) then
      raise Exception.Create('Falta URL HTTPS de activacion de la Principal.');
    if MessageDlg('Solicitar a la Principal autorizacion para: '+Tipos+'?',
      mtConfirmation,[mbYes,mbNo],0)<>mrYes then Exit;
    Ini:=TIniFile.Create(FIniPath);
    try
      PrevId:=Ini.ReadString(FSeccion,'SolicitudId','');
      PrevTipos:=Ini.ReadString(FSeccion,'TiposSolicitados','');
      PrevEstado:=Ini.ReadString(FSeccion,'EstadoActivacion','');
      ActualUrl:=Ini.ReadString(FSeccion,'UrlActivacion','');
      Dispositivo:=Ini.ReadString(FSeccion,'DispositivoId','');
    finally Ini.Free; end;
    if Dispositivo='' then Dispositivo:=IdNuevo;
    if (PrevId<>'') and (PrevEstado<>'ACTIVA') then
    begin
      if PrevTipos<>Tipos then
        raise Exception.Create('Hay una solicitud pendiente para '+PrevTipos+
          '. Consulte primero su estado antes de cambiar los tipos.');
      if (ActualUrl<>'') and (ActualUrl<>Trim(edtUrl.Text)) then
        raise Exception.Create('No cambie el servidor de una solicitud pendiente.');
      Id:=PrevId; Secreto:=SecretoActual;
    end
    else
    begin
      Id:=IdNuevo; Secreto:=SecretoAleatorio;
      N:=TStringList.Create; V:=TStringList.Create;
      try
        N.Add('SolicitudId'); V.Add(Id);
        N.Add('DispositivoId'); V.Add(Dispositivo);
        N.Add('TiposSolicitados'); V.Add(Tipos);
        N.Add('EstadoActivacion'); V.Add('PENDIENTE');
        N.Add('UrlActivacion'); V.Add(Trim(edtUrl.Text));
        N.Add('SecretoActivacionProtected');
        V.Add(CifrarDPAPI(Secreto,FSeccion+'_ACTIVACION'));
        GuardarValores(N,V);
      finally N.Free;V.Free;end;
    end;
    { Id y secreto quedan guardados ANTES de realizar HTTPS. }
    Respuesta:=Enviar('accion=solicitar&solicitud_id='+Id+'&rnc='+FRnc+
      '&sucursal='+FSucursal+'&dispositivo_id='+Dispositivo+
      '&secreto='+Secreto+'&tipos='+Tipos);
    try
      if (Respuesta.Values['resultado']<>'PENDIENTE') or
         (Respuesta.Values['solicitud_id']<>Id) then
        raise Exception.Create('Solicitud no confirmada por el servidor.');
    finally Respuesta.Free; end;
    ActualizarEstado;
    MessageDlg('Solicitud enviada a la Principal. ID: '+Id+#13#10+
      'No se ha habilitado ninguna secuencia remota.',
      mtInformation,[mbOK],0);
  except on E:Exception do
    MessageDlg('Activacion: '+E.Message,mtError,[mbOK],0);
  end;
end;

procedure TfrmEcfSecuenciasConfig.ConsultarClick(Sender: TObject);
var Ini: TIniFile; Id, Secreto, Autorizados, Res, Tipos,
    Token, Tipo, UrlReservas: string; Campos, N,V: TStringList; I: Integer;
  function EstaAutorizado(const Codigo: string): Boolean;
  begin
    Result:=Pos(','+Codigo+',',','+Autorizados+',')>0;
  end;
begin
  try
    Ini:=TIniFile.Create(FIniPath);
    try
      Id:=Ini.ReadString(FSeccion,'SolicitudId','');
      Tipos:=Ini.ReadString(FSeccion,'TiposSolicitados','');
    finally Ini.Free; end;
    if Id='' then raise Exception.Create('No existe solicitud. Use Solicitar activacion.');
    Secreto:=SecretoActual;
    Campos:=Enviar('accion=estado&solicitud_id='+Id+'&secreto='+Secreto);
    try
      if (Campos.Values['resultado']<>'OK') or
         (Campos.Values['solicitud_id']<>Id) then
        raise Exception.Create('La Central devolvio una respuesta inconsistente.');
      Res:=Campos.Values['estado'];
      if Res='PENDIENTE' then
      begin
        MessageDlg('Solicitud pendiente de autorizacion por la Principal.',
          mtInformation,[mbOK],0);
        Exit;
      end;
      if Res='ACTIVA' then
      begin
        UrlReservas:=Campos.Values['url_reservas'];
        if OrigenHttps(UrlReservas)<>OrigenHttps(edtUrl.Text) then
          raise Exception.Create('Reservador en origen HTTPS distinto del servicio central.');
        { Recuperacion tras confirmacion HTTPS ambigua: solo activar los
          tipos cuyo token YA fue guardado localmente. }
        Autorizados:=Campos.Values['autorizados'];
        N:=TStringList.Create; V:=TStringList.Create;
        try
          for I:=0 to TIPOS_CANTIDAD-1 do
          begin
            Tipo:=TIPOS[I];
            if not EstaAutorizado(Tipo) then Continue;
            if not RutaRemoteImplementada(Tipo) then Continue;
            Ini:=TIniFile.Create(FIniPath);
            try Token:=Ini.ReadString(FSeccion,'TokenProtected_'+Tipo,'');
            finally Ini.Free;end;
            if Token='' then
              raise Exception.Create('Falta token local para '+Tipo+'. Requiere reconciliacion.');
            Token:=DescifrarDPAPI(Token,FSeccion+'_'+Tipo);
            if not EsHex64(Token) then
              raise Exception.Create('Token DPAPI no utilizable: '+Tipo);
            N.Add('Origen_'+Tipo);V.Add('REMOTO');
          end;
          N.Add('Url');V.Add(UrlReservas);
          N.Add('Ambiente');V.Add('TEST');
          N.Add('EstadoActivacion');V.Add('ACTIVA');
          GuardarValores(N,V);
        finally N.Free;V.Free;end;
        Cargar;
        MessageDlg('Activacion recuperada y validada localmente.',
          mtInformation,[mbOK],0);
        Exit;
      end;
      if Res<>'APROBADA' then
        raise Exception.Create('Estado remoto no admitido: '+Res);
      Autorizados:=Campos.Values['autorizados'];
      UrlReservas:=Campos.Values['url_reservas'];
      if OrigenHttps(UrlReservas)<>OrigenHttps(edtUrl.Text) then
        raise Exception.Create('Reservador en origen HTTPS distinto del servicio central.');
      if Autorizados='' then
        raise Exception.Create('La Principal no autorizo tipos.');
      N:=TStringList.Create;V:=TStringList.Create;
      try
        for I:=0 to TIPOS_CANTIDAD-1 do
        begin
          Tipo:=TIPOS[I];
          if not EstaAutorizado(Tipo) then Continue;
          if not RutaRemoteImplementada(Tipo) then
            raise Exception.Create('No hay ruta remota implementada: '+Tipo);
          if Pos(','+Tipo+',',','+Tipos+',')=0 then
            raise Exception.Create('La Central aprobo un tipo no solicitado.');
          Token:=Campos.Values['token_'+Tipo];
          if not EsHex64(Token) then
            raise Exception.Create('Credencial del servidor invalida: '+Tipo);
          N.Add('TokenProtected_'+Tipo);
          V.Add(CifrarDPAPI(Token,FSeccion+'_'+Tipo));
        end;
        if N.Count=0 then
          raise Exception.Create('Ningun tipo autorizado esta listo para emitir.');
        { Guardar tokens y URL confiable primero. Origen sigue LOCAL. }
        N.Add('Url');V.Add(UrlReservas);
        N.Add('Ambiente');V.Add('TEST');
        GuardarValores(N,V);
      finally N.Free;V.Free;end;
    finally Campos.Free;end;
    Campos:=Enviar('accion=confirmar&solicitud_id='+Id+'&secreto='+Secreto);
    try
      if Campos.Values['resultado']<>'CONFIRMADA' then
        raise Exception.Create('Confirmacion pendiente. Vuelva a consultar.');
    finally Campos.Free;end;
    { Recuperar usando estado ACTIVA, con la validacion local de tokens. }
    ConsultarClick(Sender);
  except on E:Exception do
    MessageDlg('Consultar aprobacion: '+E.Message,mtError,[mbOK],0);
  end;
end;

procedure TfrmEcfSecuenciasConfig.CerrarClick(Sender: TObject);
begin ModalResult:=mrCancel; end;

end.