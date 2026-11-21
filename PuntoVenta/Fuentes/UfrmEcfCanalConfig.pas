unit UfrmEcfCanalConfig;

{
  PointSaleSoft / Delphi 7 / Firebird 2.5 / IBX.
  CP12: mantenimiento administrativo de ECF_CANAL_CONFIG y consulta
  EXCLUSIVAMENTE de lectura de ECF_API_INTENTO.

  CP12-H3: permite QA E31 TEST EXCLUSIVAMENTE MANUAL en pestaña separada.
  No activa envios en el cierre de venta ni modifica ECF_TIMBRE_LOG.
  Usa exclusivamente dmConectar.IBDatabase1 / IBTransaction1.
  Nunca finaliza transacciones activadas por otro modulo.
  La escritura es atomica mediante la transaccion compartida y SAVEPOINT.
  PROD no puede activarse desde este formulario.
  No implementar acceso desde el menu sin validar privilegios fiscales.
}

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, Grids, IBDatabase, IBQuery, DB, UEcfCanalConfig;

type
  TfrmEcfCanalConfig = class(TForm)
    pgPrincipal: TPageControl;
    tsConfiguracion: TTabSheet;
    tsIntentos: TTabSheet;
    tsAuditoria: TTabSheet;
    lblIntro: TLabel;
    lblEmisor: TLabel;
    cboEmisor: TComboBox;
    lblCanal: TLabel;
    cboCanal: TComboBox;
    lblAmbiente: TLabel;
    cboAmbiente: TComboBox;
    lblEstadoConfig: TLabel;
    lblFechaConfig: TLabel;
    lblMotivo: TLabel;
    edtMotivo: TEdit;
    lblAdvertencia: TLabel;
    btnGuardar: TButton;
    btnReleer: TButton;
    lblFiltro: TLabel;
    cboFiltroEstado: TComboBox;
    btnBuscarIntentos: TButton;
    grdIntentos: TStringGrid;
    lblResumenIntentos: TLabel;
    lblIdentidad: TLabel;
    grdAuditoria: TStringGrid;
    btnConsultarAuditoria: TButton;
    lblResumenAuditoria: TLabel;
    pnlPie: TPanel;
    lblPie: TLabel;
    btnCerrar: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cboEmisorChange(Sender: TObject);
    procedure cboCanalChange(Sender: TObject);
    procedure cboAmbienteChange(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnReleerClick(Sender: TObject);
    procedure btnBuscarIntentosClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure grdIntentosClick(Sender: TObject);
    procedure btnConsultarAuditoriaClick(Sender: TObject);
  private
    FDatabase: TIBDatabase;
    FUsuarioApp: string;
    FAutorizado: Boolean;
    FInicializado: Boolean;
    FBloquearEventos: Boolean;
    FConfigExiste: Boolean;
    FExisteIntentos: Boolean;
    FExisteAuditoria: Boolean;
    FCanalAnterior: string;
    FAmbienteAnterior: string;
    FFechaAnterior: TDateTime;
    FFechaAnteriorNula: Boolean;
    FFechaAnteriorSql: string;
    FIndiceEmisor: Integer;
    FRncs: TStringList;
    FBtnProbarApiTest: TButton;
    FBtnProbarApiProd: TButton;
    FBtnProbarOAuthTest: TButton;
    FLblOAuthTest: TLabel;
    FTabE31Test: TTabSheet;
    FEdtE31Trn: TEdit;
    FBtnPrepararE31: TButton;
    FBtnEnviarE31: TButton;
    FBtnConciliarE31: TButton;
    FMemoE31: TMemo;
    FLblEndpointApi: TLabel;
    FLblResultadoApi: TLabel;
    FEstadoApiTest: string;
    FEstadoApiProd: string;
    procedure CrearControlesSaludApi;
    procedure ActualizarEndpointApi;
    procedure ActualizarResultadoApi;
    procedure ProbarSaludApi(AAmbiente: TAmbienteEcf);
    procedure btnProbarApiTestClick(Sender: TObject);
    procedure btnProbarApiProdClick(Sender: TObject);
    procedure btnProbarOAuthTestClick(Sender: TObject);
    procedure CrearControlesE31Test;
    function ConfiguracionTestPersistida: TEcfCanalConfiguracion;
    procedure btnPrepararE31Click(Sender: TObject);
    procedure btnEnviarE31Click(Sender: TObject);
    procedure btnConciliarE31Click(Sender: TObject);
    procedure MostrarIntentoE31(const AIntentoId, AENcf, AEstado: string;
      ANumeroTrn, ARequestBytes: Integer; const ABodyUtf8: AnsiString);
    function SolicitarSecretoOAuthTest(out ASecret: string): Boolean;
    function TransaccionNueva(AEscritura: Boolean;
      out AIniciadaAqui: Boolean): TIBTransaction;
    function ConsultaNueva(ATx: TIBTransaction): TIBQuery;
    function TablaExiste(ATx: TIBTransaction; const ANombre: string): Boolean;
    function RncSeleccionado: string;
    function EquipoActual: string;
    function HayCambios: Boolean;
    procedure VerificarEsquema;
    procedure CargarEmisores;
    procedure CargarConfiguracion;
    procedure ConsultarIntentos;
    procedure ConsultarAuditoria;
    procedure ConfigurarGridAuditoria;
    procedure ActualizarControles;
    procedure ConfigurarGrid;
    procedure GuardarConfiguracion;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Preparar(ADatabase: TIBDatabase;
      const AUsuarioApp: string; AEdicionAutorizada: Boolean);
  end;

procedure MostrarMantenimientoEcf(ADatabase: TIBDatabase;
  const AUsuarioApp: string; AEdicionAutorizada: Boolean);

implementation

uses UDatModConectar, UEcfApiHealth, UEcfApiOAuthTest,
  UEcfApiIntento, UEcfApiQaE31, UEcfApiEnvioE31, UEcfApiHttp,
  UEcfApiConsultaE31;

{$R *.dfm}

function RncNormalizado(const AValor: string): string;
var
  I: Integer;
  C: Char;
begin
  Result := '';
  for I := 1 to Length(AValor) do
  begin
    C := AValor[I];
    if C in ['0'..'9'] then
      Result := Result + C
    else if not (C in [' ', '-']) then
    begin
      Result := '';
      Exit;
    end;
  end;
  if not (Length(Result) in [9, 11]) then
    Result := '';
end;

procedure MostrarMantenimientoEcf(ADatabase: TIBDatabase;
  const AUsuarioApp: string; AEdicionAutorizada: Boolean);
var
  F: TfrmEcfCanalConfig;
begin
  if (ADatabase = nil) or (not ADatabase.Connected) then
    raise Exception.Create('El mantenimiento e-CF requiere conexion Firebird activa.');
  F := TfrmEcfCanalConfig.Create(nil);
  try
    F.Preparar(ADatabase, AUsuarioApp, AEdicionAutorizada);
    F.ShowModal;
  finally
    F.Free;
  end;
end;

constructor TfrmEcfCanalConfig.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRncs := TStringList.Create;
  FIndiceEmisor := -1;
  FInicializado := False;
  FBloquearEventos := False;
  FAutorizado := False;
  FExisteIntentos := False;
  FExisteAuditoria := False;
  FEstadoApiTest := 'Sin comprobar';
  FEstadoApiProd := 'Sin comprobar';
end;

destructor TfrmEcfCanalConfig.Destroy;
begin
  FRncs.Free;
  inherited Destroy;
end;

procedure TfrmEcfCanalConfig.Preparar(ADatabase: TIBDatabase;
  const AUsuarioApp: string; AEdicionAutorizada: Boolean);
begin
  if FInicializado then
    raise Exception.Create('Formulario e-CF ya inicializado.');
  if dmConectar = nil then
    raise Exception.Create('dmConectar no esta disponible.');
  if (ADatabase = nil) or (ADatabase <> dmConectar.IBDatabase1) or
     (not dmConectar.IBDatabase1.Connected) then
    raise Exception.Create('Se requiere dmConectar.IBDatabase1 conectado.');
  if (dmConectar.IBTransaction1 = nil) or
     (dmConectar.IBTransaction1.DefaultDatabase <> dmConectar.IBDatabase1) then
    raise Exception.Create('IBTransaction1 no esta asociado a IBDatabase1.');
  FDatabase := dmConectar.IBDatabase1;
  FUsuarioApp := Trim(AUsuarioApp);
  FAutorizado := AEdicionAutorizada;
  if FAutorizado and (FUsuarioApp = '') then
    raise Exception.Create('No se permite editar sin usuario autenticado.');
end;

function TfrmEcfCanalConfig.TransaccionNueva(AEscritura: Boolean;
  out AIniciadaAqui: Boolean): TIBTransaction;
begin
  if (dmConectar = nil) or (FDatabase <> dmConectar.IBDatabase1) or
     (not FDatabase.Connected) then
    raise Exception.Create('Conexion global Firebird no disponible.');
  Result := dmConectar.IBTransaction1;
  if (Result = nil) or (Result.DefaultDatabase <> FDatabase) then
    raise Exception.Create('Transaccion global IBTransaction1 no vinculada.');
  if AEscritura and not FAutorizado then
    raise Exception.Create('Usuario sin permiso de escritura fiscal.');

  { No alterar Params de la transaccion global ni crear otra transaccion.
    El propietario del modulo que ya la inicio conserva el control del COMMIT. }
  AIniciadaAqui := not Result.InTransaction;
  if AIniciadaAqui then
    Result.StartTransaction;
end;

function TfrmEcfCanalConfig.ConsultaNueva(
  ATx: TIBTransaction): TIBQuery;
begin
  if ATx <> dmConectar.IBTransaction1 then
    raise Exception.Create('Consulta con transaccion ajena a dmConectar.');
  Result := TIBQuery.Create(nil);
  Result.Database := dmConectar.IBDatabase1;
  Result.Transaction := ATx;
end;

function TfrmEcfCanalConfig.TablaExiste(
  ATx: TIBTransaction; const ANombre: string): Boolean;
var
  Q: TIBQuery;
begin
  Q := ConsultaNueva(ATx);
  try
    Q.SQL.Text :=
      'SELECT FIRST 1 RDB$RELATION_NAME FROM RDB$RELATIONS ' +
      'WHERE RDB$RELATION_NAME = :TABLA ' +
      'AND COALESCE(RDB$SYSTEM_FLAG,0) = 0';
    Q.ParamByName('TABLA').AsString := ANombre;
    Q.Open;
    Result := not Q.Eof;
  finally
    Q.Free;
  end;
end;

function TfrmEcfCanalConfig.RncSeleccionado: string;
begin
  Result := '';
  if (cboEmisor.ItemIndex >= 0) and
     (cboEmisor.ItemIndex < FRncs.Count) then
    Result := FRncs[cboEmisor.ItemIndex];
end;

function TfrmEcfCanalConfig.EquipoActual: string;
var
  Buffer: array[0..MAX_COMPUTERNAME_LENGTH] of Char;
  N: DWORD;
begin
  N := SizeOf(Buffer);
  if Windows.GetComputerName(Buffer, N) then
    Result := Copy(StrPas(Buffer), 1, 64)
  else
    Result := 'NO_DISPONIBLE';
end;

function TfrmEcfCanalConfig.HayCambios: Boolean;
begin
  Result := (cboCanal.Text <> FCanalAnterior) or
    (cboAmbiente.Text <> FAmbienteAnterior);
end;

procedure TfrmEcfCanalConfig.ConfigurarGrid;
begin
  grdIntentos.ColCount := 8;
  grdIntentos.FixedCols := 0;
  grdIntentos.FixedRows := 1;
  grdIntentos.RowCount := 2;
  grdIntentos.Options := [goFixedVertLine, goFixedHorzLine,
    goVertLine, goHorzLine, goColSizing, goRowSelect];
  grdIntentos.ColWidths[0] := 220;
  grdIntentos.ColWidths[1] := 75;
  grdIntentos.ColWidths[2] := 108;
  grdIntentos.ColWidths[3] := 112;
  grdIntentos.ColWidths[4] := 65;
  grdIntentos.ColWidths[5] := 130;
  grdIntentos.ColWidths[6] := 130;
  grdIntentos.ColWidths[7] := 85;
  grdIntentos.Cells[0, 0] := 'ID_INTENTO';
  grdIntentos.Cells[1, 0] := 'NUMERO_TRN';
  grdIntentos.Cells[2, 0] := 'e-NCF';
  grdIntentos.Cells[3, 0] := 'ESTADO_LOCAL';
  grdIntentos.Cells[4, 0] := 'HTTP';
  grdIntentos.Cells[5, 0] := 'CREACION';
  grdIntentos.Cells[6, 0] := 'CAMBIO';
  grdIntentos.Cells[7, 0] := 'BYTES';
end;

procedure TfrmEcfCanalConfig.ConfigurarGridAuditoria;
begin
  grdAuditoria.ColCount := 8;
  grdAuditoria.FixedCols := 0;
  grdAuditoria.FixedRows := 1;
  grdAuditoria.RowCount := 2;
  grdAuditoria.Options := [goFixedVertLine, goFixedHorzLine,
    goVertLine, goHorzLine, goColSizing, goRowSelect];
  grdAuditoria.ColWidths[0] := 142;
  grdAuditoria.ColWidths[1] := 70;
  grdAuditoria.ColWidths[2] := 120;
  grdAuditoria.ColWidths[3] := 120;
  grdAuditoria.ColWidths[4] := 106;
  grdAuditoria.ColWidths[5] := 110;
  grdAuditoria.ColWidths[6] := 260;
  grdAuditoria.ColWidths[7] := 68;
  grdAuditoria.Cells[0, 0] := 'FECHA_CAMBIO';
  grdAuditoria.Cells[1, 0] := 'OPERACION';
  grdAuditoria.Cells[2, 0] := 'VALOR ANTERIOR';
  grdAuditoria.Cells[3, 0] := 'VALOR NUEVO';
  grdAuditoria.Cells[4, 0] := 'USUARIO';
  grdAuditoria.Cells[5, 0] := 'EQUIPO';
  grdAuditoria.Cells[6, 0] := 'MOTIVO';
  grdAuditoria.Cells[7, 0] := 'ID';
end;

procedure TfrmEcfCanalConfig.ConsultarAuditoria;
var
  Tx: TIBTransaction;
  IniciadaAqui: Boolean;
  Q: TIBQuery;
  Rnc: string;
  I: Integer;
  Anterior: string;
begin
  ConfigurarGridAuditoria;
  if not FExisteAuditoria then
  begin
    lblResumenAuditoria.Caption :=
      'Migracion 03 pendiente: sin tabla ECF_CANAL_CONFIG_AUDIT.';
    Exit;
  end;
  Rnc := RncSeleccionado;
  if Rnc = '' then Exit;
  Tx := TransaccionNueva(False, IniciadaAqui);
  try
    Q := ConsultaNueva(Tx);
    try
      try
        Q.SQL.Text :=
          'SELECT FIRST 100 ID_AUDIT, FECHA_CAMBIO, TIPO_OPERACION, ' +
          'CANAL_ANTERIOR, AMBIENTE_ANTERIOR, CANAL_NUEVO, ' +
          'AMBIENTE_NUEVO, USUARIO_APP, EQUIPO, MOTIVO ' +
          'FROM ECF_CANAL_CONFIG_AUDIT WHERE RNC_EMISOR = :RNC ' +
          'ORDER BY FECHA_CAMBIO DESC, ID_AUDIT DESC';
        Q.ParamByName('RNC').AsString := Rnc;
        Q.Open;
        I := 1;
        while not Q.Eof do
        begin
          if grdAuditoria.RowCount <= I then
            grdAuditoria.RowCount := I + 1;
          if Q.FieldByName('CANAL_ANTERIOR').IsNull then
            Anterior := '(sin registro)'
          else
            Anterior := Q.FieldByName('CANAL_ANTERIOR').AsString + '/' +
              Q.FieldByName('AMBIENTE_ANTERIOR').AsString;
          grdAuditoria.Cells[0,I] := Q.FieldByName('FECHA_CAMBIO').AsString;
          grdAuditoria.Cells[1,I] := Q.FieldByName('TIPO_OPERACION').AsString;
          grdAuditoria.Cells[2,I] := Anterior;
          grdAuditoria.Cells[3,I] := Q.FieldByName('CANAL_NUEVO').AsString +
            '/' + Q.FieldByName('AMBIENTE_NUEVO').AsString;
          grdAuditoria.Cells[4,I] := Q.FieldByName('USUARIO_APP').AsString;
          grdAuditoria.Cells[5,I] := Q.FieldByName('EQUIPO').AsString;
          grdAuditoria.Cells[6,I] := Q.FieldByName('MOTIVO').AsString;
          grdAuditoria.Cells[7,I] := Q.FieldByName('ID_AUDIT').AsString;
          Inc(I);
          Q.Next;
        end;
        Q.Close;
        if IniciadaAqui then Tx.Commit;
        lblResumenAuditoria.Caption := 'RNC ' + Rnc + ': ' +
          IntToStr(I - 1) + ' cambio(s) mostrados (maximo 100).';
      except
        if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    { IBTransaction1 es propiedad de dmConectar; NO liberar. }
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;
end;

procedure TfrmEcfCanalConfig.btnConsultarAuditoriaClick(Sender: TObject);
begin
  try
    ConsultarAuditoria;
  except
    on E: Exception do
      MessageDlg('Error consultando auditoria: ' + E.Message,
        mtError, [mbOK], 0);
  end;
end;

procedure TfrmEcfCanalConfig.CrearControlesE31Test;
var
  L: TLabel;
begin
  if FTabE31Test <> nil then Exit;
  FTabE31Test := TTabSheet.Create(Self);
  FTabE31Test.PageControl := pgPrincipal;
  FTabE31Test.Name := 'tsPruebaE31Test';
  FTabE31Test.Caption := 'E31 TEST (manual)';
  FTabE31Test.TabVisible := FAutorizado;

  L := TLabel.Create(Self);
  L.Parent := FTabE31Test;
  L.SetBounds(20, 20, 850, 36);
  L.AutoSize := False;
  L.WordWrap := True;
  L.Caption := 'SOLO QA E31 / IDESI_API TEST. Factura comercial YA confirmada. ' +
    'Primero preparar y revisar; despues enviar una sola vez.';

  L := TLabel.Create(Self);
  L.Parent := FTabE31Test;
  L.SetBounds(20, 70, 150, 18);
  L.Caption := 'Numero de transaccion:';

  FEdtE31Trn := TEdit.Create(Self);
  FEdtE31Trn.Parent := FTabE31Test;
  FEdtE31Trn.Name := 'edtE31TestTrn';
  FEdtE31Trn.SetBounds(175, 66, 130, 24);
  FEdtE31Trn.MaxLength := 10;

  FBtnPrepararE31 := TButton.Create(Self);
  FBtnPrepararE31.Parent := FTabE31Test;
  FBtnPrepararE31.SetBounds(322, 63, 195, 31);
  FBtnPrepararE31.Caption := '1. Preparar E31 TEST';
  FBtnPrepararE31.OnClick := btnPrepararE31Click;

  FBtnEnviarE31 := TButton.Create(Self);
  FBtnEnviarE31.Parent := FTabE31Test;
  FBtnEnviarE31.SetBounds(531, 63, 195, 31);
  FBtnEnviarE31.Caption := '2. Enviar E31 TEST';
  FBtnEnviarE31.OnClick := btnEnviarE31Click;

  FBtnConciliarE31 := TButton.Create(Self);
  FBtnConciliarE31.Parent := FTabE31Test;
  FBtnConciliarE31.SetBounds(531, 104, 195, 31);
  FBtnConciliarE31.Caption := '3. Conciliar / XML';
  FBtnConciliarE31.OnClick := btnConciliarE31Click;

  L := TLabel.Create(Self);
  L.Parent := FTabE31Test;
  L.SetBounds(20, 151, 875, 42);
  L.AutoSize := False;
  L.WordWrap := True;
  L.Caption := 'OBLIGATORIO: comprobar moneda DOP, importe, comprador, ' +
    'e-NCF TEST disponible y ausencia de emision previa ASLAN/DGII. ' +
    'Un HTTP 200 no equivale a aceptacion fiscal.';

  FMemoE31 := TMemo.Create(Self);
  FMemoE31.Parent := FTabE31Test;
  FMemoE31.Name := 'memoE31TestResultado';
  FMemoE31.SetBounds(20, 202, 860, 256);
  FMemoE31.ReadOnly := True;
  FMemoE31.ScrollBars := ssBoth;
  FMemoE31.WordWrap := False;
  FMemoE31.Lines.Text :=
    'Sin factura preparada. Esta pestaña NO emite automaticamente.';
end;

function TfrmEcfCanalConfig.ConfiguracionTestPersistida:
  TEcfCanalConfiguracion;
var
  Tx: TIBTransaction;
  IniciadaAqui: Boolean;
begin
  if not FAutorizado then
    raise Exception.Create('Solo administradores fiscales pueden probar la emision.');
  if RncSeleccionado <> '130177092' then
    raise Exception.Create('Esta prueba E31 esta limitada al RNC de IDESI SRL.');
  if HayCambios then
    raise Exception.Create('Existen cambios de canal sin guardar. Recargue datos.');
  Tx := TransaccionNueva(False, IniciadaAqui);
  try
    Result := CargarConfiguracionCanalEcf(
      dmConectar.IBDatabase1,Tx,RncSeleccionado);
  finally
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;
  if (Result.Canal <> ceIdesiApi) or (Result.Ambiente <> aeTest) or
     (Result.BaseUrl <> 'https://api-staging.idesisa.com') or
     (Result.ClientId <> 'idesi-staging') then
    raise Exception.Create('El RNC debe tener IDESI_API / TEST persistido.');
end;

procedure TfrmEcfCanalConfig.MostrarIntentoE31(
  const AIntentoId, AENcf, AEstado: string;
  ANumeroTrn, ARequestBytes: Integer; const ABodyUtf8: AnsiString);
begin
  FMemoE31.Clear;
  FMemoE31.Lines.Add('RNC = 130177092 | Ambiente TEST');
  FMemoE31.Lines.Add('TRN = ' + IntToStr(ANumeroTrn));
  FMemoE31.Lines.Add('e-NCF = ' + AENcf);
  FMemoE31.Lines.Add('ID_INTENTO = ' + AIntentoId);
  FMemoE31.Lines.Add('ESTADO = ' + AEstado);
  FMemoE31.Lines.Add('REQUEST_BYTES = ' + IntToStr(ARequestBytes));
  FMemoE31.Lines.Add('REVISAR JSON antes de enviar:');
  FMemoE31.Lines.Add('------------------------------------------');
  { Vista informativa. El envio usa los bytes originales del BLOB, no Memo. }
  FMemoE31.Lines.Add(string(ABodyUtf8));
end;

procedure TfrmEcfCanalConfig.btnPrepararE31Click(Sender: TObject);
var
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  NumeroTrn: Integer;
  Carpeta: string;
  AutorizarCommitRetaining: Boolean;
begin
  FBtnPrepararE31.Enabled := False;
  try
    try
      Config := ConfiguracionTestPersistida;
      if (not TryStrToInt(Trim(FEdtE31Trn.Text),NumeroTrn)) or
         (NumeroTrn <= 0) then
        raise Exception.Create('Especifique NUMERO_TRN entero positivo.');
      if CargarIntentoApiPorFactura(FDatabase,Config.RncEmisor,
        NumeroTrn,Intento) then
      begin
        MostrarIntentoE31(Intento.IdIntento,Intento.ENcf,
          Intento.EstadoLocal,NumeroTrn,Length(Intento.RequestUtf8),
          Intento.RequestUtf8);
        MessageDlg('Ya existe el intento ' + Intento.IdIntento + '. ' +
          'No se regenero el JSON. Revisar estado.',mtInformation,[mbOK],0);
        Exit;
      end;

      if MessageDlg('Preparar E31 sobre factura YA CONFIRMADA ' +
        IntToStr(NumeroTrn) + ' del RNC 130177092? ' + #13#10 +
        'No hace envio HTTP. SOLO TEST.', mtConfirmation,
        [mbYes,mbNo],0) <> mrYes then Exit;

      AutorizarCommitRetaining := dmConectar.IBTransaction1.InTransaction;
      if AutorizarCommitRetaining then
        if MessageDlg(
          'IBTransaction1 esta activa (puede ser solo por lecturas).' + #13#10 +
          'CommitRetaining CONFIRMARA cualquier cambio pendiente ' +
          'de otros modulos sobre esta transaccion global.' + #13#10 +
          'Asegurese de que no haya operaciones comerciales sin confirmar.' + #13#10 +
          'Autoriza CommitRetaining para preparar E31 TEST?',
          mtWarning,[mbYes,mbNo],0) <> mrYes then Exit;

      Carpeta := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP')) +
        'PointSaleSoft_EcfApi_Test';
      Intento := PrepararE31TestDesdeFacturaConfirmada(FDatabase,
        NumeroTrn,Carpeta,AutorizarCommitRetaining);
      MostrarIntentoE31(Intento.IdIntento,Intento.ENcf,
        Intento.EstadoLocal,NumeroTrn,Length(Intento.RequestUtf8),
        Intento.RequestUtf8);
      ConsultarIntentos;
      MessageDlg('Intento PREPARADO y confirmado en Firebird. ' +
        'Revise el JSON y el e-NCF antes del POST.',mtInformation,[mbOK],0);
    except
      on E: Exception do
        MessageDlg('Preparacion E31 TEST bloqueada: ' + E.Message,
          mtError,[mbOK],0);
    end;
  finally
    FBtnPrepararE31.Enabled := True;
  end;
end;

procedure TfrmEcfCanalConfig.btnEnviarE31Click(Sender: TObject);
var
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  Respuesta: TEcfApiRespuestaHttp;
  NumeroTrn: Integer;
  Confirmacion, Secret: string;
  AutorizarCommitRetaining: Boolean;
begin
  FBtnEnviarE31.Enabled := False;
  Secret := '';
  try
    try
      Config := ConfiguracionTestPersistida;
      if (not TryStrToInt(Trim(FEdtE31Trn.Text),NumeroTrn)) or
         (NumeroTrn <= 0) then
        raise Exception.Create('Especifique NUMERO_TRN entero positivo.');
      if not CargarIntentoApiPorFactura(FDatabase,Config.RncEmisor,
        NumeroTrn,Intento) then
        raise Exception.Create('Primero prepare y confirme el intento E31 TEST.');
      if Intento.EstadoLocal <> 'PREPARADO' then
        raise Exception.Create('Intento en estado ' + Intento.EstadoLocal +
          '. NO reintentar; primero conciliar.');
      if (Intento.Ambiente <> 'TEST') or
         (Intento.BaseUrl <> Config.BaseUrl) or
         (Copy(Intento.ENcf,1,3) <> 'E31') then
        raise Exception.Create('Intento/ambiente/tipo no coinciden con el canal TEST.');

      MostrarIntentoE31(Intento.IdIntento,Intento.ENcf,
        Intento.EstadoLocal,NumeroTrn,Length(Intento.RequestUtf8),
        Intento.RequestUtf8);
      Confirmacion := '';
      if not InputQuery('Confirmacion fiscal TEST',
        'Escriba exactamente el e-NCF que verifico libre en TEST:',
        Confirmacion) then Exit;
      if Trim(Confirmacion) <> Intento.ENcf then
        raise Exception.Create('Confirmacion e-NCF no coincide. POST bloqueado.');
      if MessageDlg(
        'ULTIMA CONFIRMACION DE EMISION TEST' + #13#10 +
        'RNC: ' + Intento.RncEmisor + #13#10 +
        'TRN: ' + IntToStr(NumeroTrn) + #13#10 +
        'e-NCF: ' + Intento.ENcf + #13#10 +
        'Compruebe importe, comprador, moneda DOP y secuencia TEST.' + #13#10 +
        'Se enviara UNA SOLA VEZ a https://api-staging.idesisa.com.' + #13#10 +
        'Confirmar POST fiscal TEST?',mtWarning,[mbYes,mbNo],0) <> mrYes then
        Exit;
      AutorizarCommitRetaining := dmConectar.IBTransaction1.InTransaction;
      if AutorizarCommitRetaining then
        if MessageDlg(
          'IBTransaction1 sigue activa.' + #13#10 +
          'El POST TEST exige guardar TRANSMITIENDO ANTES de la red.' + #13#10 +
          'CommitRetaining confirma TODOS los cambios pendientes en ' +
          'la transaccion global.' + #13#10 +
          'Autoriza CommitRetaining antes de enviar E31 TEST?',
          mtWarning,[mbYes,mbNo],0) <> mrYes then Exit;
      if not SolicitarSecretoOAuthTest(Secret) then Exit;

      Respuesta := EjecutarPrimerPostE31Test(FDatabase,Config,
        NumeroTrn,Secret,True,AutorizarCommitRetaining);
      FMemoE31.Lines.Add('------------------------------------------');
      FMemoE31.Lines.Add('POST TEST HTTP ' + IntToStr(Respuesta.StatusCode));
      FMemoE31.Lines.Add('Respuesta (no implica aceptacion DGII):');
      FMemoE31.Lines.Add(string(Respuesta.BodyUtf8));
      ConsultarIntentos;
      MessageDlg('POST TEST respondio HTTP ' +
        IntToStr(Respuesta.StatusCode) + '. ' +
        'No equivale a aceptacion fiscal. Verificar /details, XML y auditoria.',
        mtInformation,[mbOK],0);
    except
      on E: Exception do
        MessageDlg('Envio E31 TEST interrumpido: ' + E.Message + #13#10 +
          'Revisar ECF_API_INTENTO. Si TRANSMITIENDO/AMBIGUO: NO reemitir.',
          mtError,[mbOK],0);
    end;
  finally
    Secret := '';
    FBtnEnviarE31.Enabled := True;
  end;
end;

procedure TfrmEcfCanalConfig.btnConciliarE31Click(Sender: TObject);
var
  Config: TEcfCanalConfiguracion;
  Intento: TEcfApiIntento;
  NumeroTrn: Integer;
  Secret, Token: string;
  Datos: TConsultaE31Test;
begin
  FBtnConciliarE31.Enabled := False;
  Secret := '';
  Token := '';
  try
    try
      Config := ConfiguracionTestPersistida;
      if (not TryStrToInt(Trim(FEdtE31Trn.Text),NumeroTrn)) or
         (NumeroTrn <= 0) then
        raise Exception.Create('Indique el numero de transaccion E31.');
      if not CargarIntentoApiPorFactura(FDatabase,Config.RncEmisor,
        NumeroTrn,Intento) then
        raise Exception.Create('No existe intento persistido para ese TRN.');
      if (Intento.RncEmisor <> Config.RncEmisor) or
         (Intento.NumeroTrn <> NumeroTrn) or
         (Intento.Ambiente <> 'TEST') or
         (Intento.BaseUrl <> Config.BaseUrl) or
         (Copy(Intento.ENcf,1,3) <> 'E31') then
        raise Exception.Create('Intento no corresponde al RNC, canal o TEST.');
      if Intento.EstadoLocal = 'PREPARADO' then
        raise Exception.Create('La factura esta PREPARADA, pero no se ha enviado. ' +
          'Conciliacion remota no sustituye la emision.');
      if not SolicitarSecretoOAuthTest(Secret) then Exit;
      Token := ObtenerTokenIdesiTestCacheGlobal(Config,Secret);
      Secret := '';
      FMemoE31.Clear;
      FMemoE31.Lines.Add('CONCILIACION TEST SOLO GET; SIN POST');
      FMemoE31.Lines.Add('TRN=' + IntToStr(NumeroTrn) +
        ' RNC=' + Config.RncEmisor + ' e-NCF=' + Intento.ENcf);
      FMemoE31.Lines.Add('Estado local previo: ' + Intento.EstadoLocal);
      FMemoE31.Lines.Add('No se modifica Firebird ni el estado local.');
      FMemoE31.Lines.Add('----------------------------------------');
      Datos := ConsultarE31YRecuperarXmlTest(Config,Token,Intento.ENcf,
        NumeroTrn);
      FMemoE31.Lines.Add('ESTADO DGII: HTTP ' + IntToStr(Datos.EstadoHttp));
      FMemoE31.Lines.Add(string(Datos.EstadoJson));
      FMemoE31.Lines.Add('----------------------------------------');
      FMemoE31.Lines.Add('METADATOS: HTTP ' + IntToStr(Datos.MetadataHttp));
      FMemoE31.Lines.Add(string(Datos.MetadataJson));
      FMemoE31.Lines.Add('----------------------------------------');
      FMemoE31.Lines.Add('XML FIRMADO: HTTP ' + IntToStr(Datos.XmlHttp));
      if Datos.ArchivoXml <> '' then
      begin
        FMemoE31.Lines.Add('XML descargado (' + IntToStr(Datos.XmlBytes) +
          ' bytes): ' + Datos.ArchivoXml);
        FMemoE31.Lines.Add('Validar firma digital y contenido de XML ' +
          'antes de importar el documento al ERP.');
      end
      else
        FMemoE31.Lines.Add(Datos.XmlDetalle);
      FMemoE31.Lines.Add('Verificar currentStatusVerified=true y ' +
        'status=ACCEPTED en la respuesta de DGII.');
      MessageDlg('GET finalizados. Revise el Memo: estado DGII, ' +
        'metadatos y XML. Sin nuevos envios ni escrituras Firebird.',
        mtInformation,[mbOK],0);
    except
      on E: Exception do
        MessageDlg('Conciliacion E31 TEST: ' + E.Message +
          #13#10 + 'No se realizo POST. No reemitir el comprobante.',
          mtError,[mbOK],0);
    end;
  finally
    Secret := '';
    Token := '';
    FBtnConciliarE31.Enabled := True;
  end;
end;

procedure TfrmEcfCanalConfig.CrearControlesSaludApi;
begin
  { Controles dinamicos para no modificar el DFM existente de Delphi 7. }
  if FBtnProbarApiTest <> nil then Exit;

  FBtnProbarApiTest := TButton.Create(Self);
  FBtnProbarApiTest.Parent := tsConfiguracion;
  FBtnProbarApiTest.Name := 'btnProbarApiTest';
  FBtnProbarApiTest.SetBounds(327, 402, 145, 32);
  FBtnProbarApiTest.Caption := 'Probar API TEST';
  FBtnProbarApiTest.OnClick := btnProbarApiTestClick;

  FBtnProbarApiProd := TButton.Create(Self);
  FBtnProbarApiProd.Parent := tsConfiguracion;
  FBtnProbarApiProd.Name := 'btnProbarApiProd';
  FBtnProbarApiProd.SetBounds(483, 402, 145, 32);
  FBtnProbarApiProd.Caption := 'Probar API PROD';
  FBtnProbarApiProd.OnClick := btnProbarApiProdClick;

  FBtnProbarOAuthTest := TButton.Create(Self);
  FBtnProbarOAuthTest.Parent := tsConfiguracion;
  FBtnProbarOAuthTest.Name := 'btnProbarOAuthTest';
  FBtnProbarOAuthTest.SetBounds(646, 402, 184, 32);
  FBtnProbarOAuthTest.Caption := 'Probar OAuth TEST';
  FBtnProbarOAuthTest.OnClick := btnProbarOAuthTestClick;

  FLblEndpointApi := TLabel.Create(Self);
  FLblEndpointApi.Parent := tsConfiguracion;
  FLblEndpointApi.Name := 'lblEndpointApi';
  FLblEndpointApi.AutoSize := False;
  FLblEndpointApi.SetBounds(18, 321, 895, 18);

  FLblResultadoApi := TLabel.Create(Self);
  FLblResultadoApi.Parent := tsConfiguracion;
  FLblResultadoApi.Name := 'lblResultadoApi';
  FLblResultadoApi.AutoSize := False;
  FLblResultadoApi.SetBounds(18, 444, 895, 36);
  FLblResultadoApi.WordWrap := True;

  FLblOAuthTest := TLabel.Create(Self);
  FLblOAuthTest.Parent := tsConfiguracion;
  FLblOAuthTest.Name := 'lblOAuthTest';
  FLblOAuthTest.AutoSize := False;
  FLblOAuthTest.SetBounds(18, 480, 895, 18);
  FLblOAuthTest.Caption := 'OAuth TEST: pendiente (no se ha solicitado token).';

  ActualizarResultadoApi;
  ActualizarEndpointApi;
end;

procedure TfrmEcfCanalConfig.ActualizarEndpointApi;
var
  Ambiente: TAmbienteEcf;
  Texto: string;
begin
  if FLblEndpointApi = nil then Exit;
  if not FConfigExiste then
    Texto := 'Canal persistido: sin configuracion registrada'
  else if FCanalAnterior <> 'IDESI_API' then
    Texto := 'Canal persistido: ' + FCanalAnterior +
      ' (no utiliza endpoint IDESI API)'
  else
  begin
    if FAmbienteAnterior = 'PROD' then
      Ambiente := aeProd
    else
      Ambiente := aeTest;
    Texto := 'Endpoint persistido: ' + UrlBaseIdesiApi(Ambiente) +
      '  |  client_id: ' + ClientIdIdesiApi(Ambiente);
  end;
  if HayCambios then
    Texto := 'CAMBIOS SIN GUARDAR. ' + Texto;
  FLblEndpointApi.Caption := Texto;
end;

procedure TfrmEcfCanalConfig.ActualizarResultadoApi;
begin
  if FLblResultadoApi = nil then Exit;
  FLblResultadoApi.Caption :=
    'TEST: ' + FEstadoApiTest + #13#10 +
    'PROD: ' + FEstadoApiProd;
end;

procedure TfrmEcfCanalConfig.ProbarSaludApi(AAmbiente: TAmbienteEcf);
var
  Respuesta: TEcfApiHealthResultado;
  Texto: string;
  CursorAnterior: TCursor;
begin
  { No se inicia transaccion, no se consulta Firebird ni se cambia el canal. }
  if (FBtnProbarApiTest = nil) or (FBtnProbarApiProd = nil) then Exit;
  FBtnProbarApiTest.Enabled := False;
  FBtnProbarApiProd.Enabled := False;
  CursorAnterior := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Respuesta := ConsultarSaludIdesiApi(AAmbiente);
    Texto := Respuesta.Detalle + ' | ' + Respuesta.Url;
    if AAmbiente = aeTest then
      FEstadoApiTest := Texto
    else
      FEstadoApiProd := Texto;
    ActualizarResultadoApi;
  finally
    Screen.Cursor := CursorAnterior;
    FBtnProbarApiTest.Enabled := True;
    FBtnProbarApiProd.Enabled := True;
  end;
end;

procedure TfrmEcfCanalConfig.btnProbarApiTestClick(Sender: TObject);
begin
  ProbarSaludApi(aeTest);
end;

procedure TfrmEcfCanalConfig.btnProbarApiProdClick(Sender: TObject);
begin
  ProbarSaludApi(aeProd);
end;

function TfrmEcfCanalConfig.SolicitarSecretoOAuthTest(
  out ASecret: string): Boolean;
var
  Ventana: TForm;
  Aviso: TLabel;
  Entrada: TEdit;
  Aceptar: TButton;
  Cancelar: TButton;
begin
  Result := False;
  ASecret := '';
  Ventana := TForm.CreateNew(nil);
  try
    Ventana.Caption := 'IDESI API TEST - Autenticacion OAuth';
    Ventana.BorderStyle := bsDialog;
    Ventana.Position := poScreenCenter;
    Ventana.ClientWidth := 520;
    Ventana.ClientHeight := 154;

    Aviso := TLabel.Create(Ventana);
    Aviso.Parent := Ventana;
    Aviso.SetBounds(16, 12, 480, 37);
    Aviso.AutoSize := False;
    Aviso.WordWrap := True;
    Aviso.Caption := 'Ingrese el client_secret de idesi-staging. ' +
      'No se guarda en Firebird ni en archivos.';

    Entrada := TEdit.Create(Ventana);
    Entrada.Parent := Ventana;
    Entrada.SetBounds(16, 58, 488, 24);
    Entrada.PasswordChar := '*';
    Entrada.MaxLength := 512;

    Aceptar := TButton.Create(Ventana);
    Aceptar.Parent := Ventana;
    Aceptar.Caption := 'Comprobar';
    Aceptar.SetBounds(308, 107, 94, 28);
    Aceptar.Default := True;
    Aceptar.ModalResult := mrOk;

    Cancelar := TButton.Create(Ventana);
    Cancelar.Parent := Ventana;
    Cancelar.Caption := 'Cancelar';
    Cancelar.SetBounds(410, 107, 94, 28);
    Cancelar.Cancel := True;
    Cancelar.ModalResult := mrCancel;

    Ventana.ActiveControl := Entrada;
    if Ventana.ShowModal = mrOk then
    begin
      if Trim(Entrada.Text) <> '' then
      begin
        ASecret := Entrada.Text;
        Result := True;
      end;
    end;
    Entrada.Text := '';
  finally
    Ventana.Free;
  end;
end;

procedure TfrmEcfCanalConfig.btnProbarOAuthTestClick(Sender: TObject);
var
  Config: TEcfCanalConfiguracion;
  Secret: string;
  Respuesta: TEcfApiOAuthTestResultado;
  CursorAnterior: TCursor;
begin
  { Solo pruebe el RNC/ambiente YA PERSISTIDOS; no se cambia Firebird. }
  if (not FAutorizado) or (not FConfigExiste) or
     (FCanalAnterior <> 'IDESI_API') or (FAmbienteAnterior <> 'TEST') or
     HayCambios or (RncSeleccionado = '') then
  begin
    MessageDlg('Guarde primero IDESI_API / TEST para el RNC seleccionado ' +
      'y recargue los datos. No debe haber cambios pendientes.',
      mtWarning, [mbOK], 0);
    Exit;
  end;

  Secret := '';
  if not SolicitarSecretoOAuthTest(Secret) then Exit;
  try
    Config.RncEmisor := RncSeleccionado;
    Config.Canal := ceIdesiApi;
    Config.Ambiente := aeTest;
    Config.BaseUrl := UrlBaseIdesiApi(aeTest);
    Config.ClientId := ClientIdIdesiApi(aeTest);

    FBtnProbarOAuthTest.Enabled := False;
    FBtnProbarApiTest.Enabled := False;
    FBtnProbarApiProd.Enabled := False;
    CursorAnterior := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      FLblOAuthTest.Caption := 'OAuth TEST: consultando autorizacion...';
      FLblOAuthTest.Repaint;
      Respuesta := ProbarAutenticacionIdesiApiTest(Config, Secret);
      FLblOAuthTest.Caption := Respuesta.Detalle;
    finally
      Screen.Cursor := CursorAnterior;
      FBtnProbarApiProd.Enabled := True;
      FBtnProbarApiTest.Enabled := True;
      FBtnProbarOAuthTest.Enabled := True;
    end;
  except
    on E: Exception do
    begin
      { No se muestran access_token, client_secret ni el body HTTP. }
      FLblOAuthTest.Caption := 'OAuth TEST: error (' + E.ClassName + ').';
      MessageDlg('No se completo la verificacion OAuth TEST: ' +
        E.Message, mtError, [mbOK], 0);
    end;
  end;
  Secret := '';
end;

procedure TfrmEcfCanalConfig.FormShow(Sender: TObject);
begin
  if FInicializado then
    Exit;
  FInicializado := True;
  CrearControlesSaludApi;
  CrearControlesE31Test;
  cboCanal.Items.Clear;
  cboCanal.Items.Add('ASLAN');
  cboCanal.Items.Add('IDESI_API');
  cboAmbiente.Items.Clear;
  cboAmbiente.Items.Add('TEST');
  cboAmbiente.Items.Add('PROD');
  cboFiltroEstado.Items.Clear;
  cboFiltroEstado.Items.Add('TODOS');
  cboFiltroEstado.Items.Add('PREPARADO');
  cboFiltroEstado.Items.Add('TRANSMITIENDO');
  cboFiltroEstado.Items.Add('HTTP_RECIBIDO');
  cboFiltroEstado.Items.Add('AMBIGUO');
  cboFiltroEstado.Items.Add('CONCILIADO');
  cboFiltroEstado.ItemIndex := 0;
  ConfigurarGrid;
  ConfigurarGridAuditoria;
  lblIntro.Caption := 'BD ACTIVA: ' + FDatabase.DatabaseName + #13#10 +
    'Canal e-CF por RNC. Sin secretos, tokens ni envio fiscal.';
  try
    VerificarEsquema;
    CargarEmisores;
    if cboEmisor.Items.Count > 0 then
    begin
      cboEmisor.ItemIndex := 0;
      FIndiceEmisor := 0;
      CargarConfiguracion;
      ConsultarIntentos;
      ConsultarAuditoria;
    end
    else
      lblEstadoConfig.Caption := 'No hay RNC validos en COMPANIA.';
    ActualizarControles;
  except
    on E: Exception do
    begin
      FAutorizado := False;
      btnGuardar.Enabled := False;
      lblEstadoConfig.Caption := 'Mantenimiento no disponible: ' + E.Message;
      lblPie.Caption := 'Sin cambios; revise migraciones y permisos Firebird.';
      MessageDlg('No se pudo inicializar mantenimiento e-CF:' + #13#10 +
        E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmEcfCanalConfig.VerificarEsquema;
var
  Tx: TIBTransaction;
  IniciadaAqui: Boolean;
  TieneConfig: Boolean;
begin
  Tx := TransaccionNueva(False, IniciadaAqui);
  try
    try
      TieneConfig := TablaExiste(Tx, 'ECF_CANAL_CONFIG');
      FExisteIntentos := TablaExiste(Tx, 'ECF_API_INTENTO');
      FExisteAuditoria := TablaExiste(Tx, 'ECF_CANAL_CONFIG_AUDIT');
      if IniciadaAqui then Tx.Commit;
    except
      if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
      raise;
    end;
  finally
    { IBTransaction1 es propiedad de dmConectar; NO liberar. }
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;
  if not TieneConfig then
    raise Exception.Create('Falta ECF_CANAL_CONFIG: ejecutar migracion 01 en BD de desarrollo.');
end;

procedure TfrmEcfCanalConfig.CargarEmisores;
var
  Tx: TIBTransaction;
  IniciadaAqui: Boolean;
  Q: TIBQuery;
  Rnc, Nombre: string;
begin
  FRncs.Clear;
  cboEmisor.Items.Clear;
  Tx := TransaccionNueva(False, IniciadaAqui);
  try
    Q := ConsultaNueva(Tx);
    try
      try
        Q.SQL.Text := 'SELECT RNC_NUMERO, NOMBRE FROM COMPANIA ORDER BY NOMBRE';
        Q.Open;
        while not Q.Eof do
        begin
          Rnc := RncNormalizado(Q.FieldByName('RNC_NUMERO').AsString);
          Nombre := Trim(Q.FieldByName('NOMBRE').AsString);
          if (Rnc <> '') and (FRncs.IndexOf(Rnc) < 0) then
          begin
            FRncs.Add(Rnc);
            cboEmisor.Items.Add(Rnc + ' - ' + Nombre);
          end;
          Q.Next;
        end;
        Q.Close;
        if IniciadaAqui then Tx.Commit;
      except
        if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    { IBTransaction1 es propiedad de dmConectar; NO liberar. }
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;
end;

procedure TfrmEcfCanalConfig.CargarConfiguracion;
var
  Tx: TIBTransaction;
  IniciadaAqui: Boolean;
  Q: TIBQuery;
  Rnc: string;
begin
  Rnc := RncSeleccionado;
  if Rnc = '' then Exit;
  FBloquearEventos := True;
  try
    FConfigExiste := False;
    FFechaAnteriorNula := True;
    FFechaAnterior := 0;
    FFechaAnteriorSql := '';
    FCanalAnterior := 'ASLAN';
    FAmbienteAnterior := 'TEST';
    Tx := TransaccionNueva(False, IniciadaAqui);
    try
      Q := ConsultaNueva(Tx);
      try
        try
          Q.SQL.Text :=
            'SELECT CANAL_ENVIO, API_AMBIENTE, FECHA_ACTUALIZACION, ' +
            'CAST(FECHA_ACTUALIZACION AS VARCHAR(24)) AS FECHA_SQL ' +
            'FROM ECF_CANAL_CONFIG WHERE RNC_EMISOR = :RNC';
          Q.ParamByName('RNC').AsString := Rnc;
          Q.Open;
          if not Q.Eof then
          begin
            FConfigExiste := True;
            FCanalAnterior := UpperCase(Trim(
              Q.FieldByName('CANAL_ENVIO').AsString));
            FAmbienteAnterior := UpperCase(Trim(
              Q.FieldByName('API_AMBIENTE').AsString));
            FFechaAnteriorNula := Q.FieldByName('FECHA_ACTUALIZACION').IsNull;
            if not FFechaAnteriorNula then
            begin
              FFechaAnterior := Q.FieldByName('FECHA_ACTUALIZACION').AsDateTime;
              FFechaAnteriorSql := Q.FieldByName('FECHA_SQL').AsString;
            end;
          end;
          Q.Close;
          if IniciadaAqui then Tx.Commit;
        except
          if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
          raise;
        end;
      finally
        Q.Free;
      end;
    finally
      { IBTransaction1 es propiedad de dmConectar; NO liberar. }
      if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
    end;
    if (FCanalAnterior <> 'ASLAN') and
       (FCanalAnterior <> 'IDESI_API') then
      raise Exception.Create('CANAL_ENVIO invalido en ECF_CANAL_CONFIG.');
    if (FAmbienteAnterior <> 'TEST') and
       (FAmbienteAnterior <> 'PROD') then
      raise Exception.Create('API_AMBIENTE invalido en ECF_CANAL_CONFIG.');
    cboCanal.ItemIndex := cboCanal.Items.IndexOf(FCanalAnterior);
    cboAmbiente.ItemIndex := cboAmbiente.Items.IndexOf(FAmbienteAnterior);
    if FConfigExiste then
      lblEstadoConfig.Caption := 'Configuracion registrada: ' + Rnc
    else
      lblEstadoConfig.Caption :=
        'Sin registro; al guardar se creara ASLAN / TEST para ' + Rnc;
    if FFechaAnteriorNula then
      lblFechaConfig.Caption := 'Ultima actualizacion: no disponible'
    else
      lblFechaConfig.Caption := 'Ultima actualizacion: ' +
        DateTimeToStr(FFechaAnterior);
    edtMotivo.Text := '';
    ActualizarControles;
  finally
    FBloquearEventos := False;
  end;
end;

procedure TfrmEcfCanalConfig.ActualizarControles;
begin
  ActualizarEndpointApi;
  btnGuardar.Enabled := FAutorizado and (RncSeleccionado <> '') and
    FExisteAuditoria;
  cboCanal.Enabled := FAutorizado and (RncSeleccionado <> '');
  cboAmbiente.Enabled := FAutorizado and (RncSeleccionado <> '');
  edtMotivo.Enabled := FAutorizado and (RncSeleccionado <> '');
  if not FAutorizado then
    lblAdvertencia.Caption :=
      'SOLO CONSULTA: el usuario no tiene permiso de edicion fiscal.'
  else if not FExisteAuditoria then
    lblAdvertencia.Caption :=
      'Falta migracion 03 (auditoria): se bloquea Guardar.'
  else
    lblAdvertencia.Caption :=
      'PROD bloqueado en CP12. IDESI_API/TEST NO emite automaticamente.';
  if FExisteIntentos then
    lblPie.Caption := 'Intentos API: solo lectura. No borrar ni reiniciar estados.'
  else
    lblPie.Caption :=
      'Falta ECF_API_INTENTO: migracion 02 antes de habilitar IDESI_API.';
end;

procedure TfrmEcfCanalConfig.cboEmisorChange(Sender: TObject);
begin
  if FBloquearEventos then Exit;
  if (FIndiceEmisor >= 0) and HayCambios then
    if MessageDlg('Existen cambios sin guardar. Desea descartarlos?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      FBloquearEventos := True;
      try
        cboEmisor.ItemIndex := FIndiceEmisor;
      finally
        FBloquearEventos := False;
      end;
      Exit;
    end;
  FIndiceEmisor := cboEmisor.ItemIndex;
  try
    CargarConfiguracion;
    ConsultarIntentos;
    ConsultarAuditoria;
  except
    on E: Exception do
    begin
      btnGuardar.Enabled := False;
      MessageDlg('Error al cargar emisor: ' + E.Message, mtError,
        [mbOK], 0);
    end;
  end;
end;

procedure TfrmEcfCanalConfig.cboCanalChange(Sender: TObject);
begin
  if not FBloquearEventos then ActualizarControles;
end;

procedure TfrmEcfCanalConfig.cboAmbienteChange(Sender: TObject);
begin
  if not FBloquearEventos then ActualizarControles;
end;

procedure TfrmEcfCanalConfig.GuardarConfiguracion;
var
  Tx: TIBTransaction;
  IniciadaAqui: Boolean;
  Q: TIBQuery;
  Rnc, CanalNuevo, AmbienteNuevo, Motivo: string;
  CambioDeRuta: Boolean;
  Pendientes: Integer;
  Afectadas: Integer;
  SavepointActivo: Boolean;
begin
  if not FAutorizado then
    raise Exception.Create('Usuario no autorizado a editar configuracion fiscal.');
  if not FExisteAuditoria then
    raise Exception.Create('Migracion 03 de auditoria obligatoria antes de guardar.');
  Rnc := RncSeleccionado;
  if Rnc = '' then
    raise Exception.Create('Seleccione un RNC valido de COMPANIA.');
  CanalNuevo := cboCanal.Text;
  AmbienteNuevo := cboAmbiente.Text;
  if (CanalNuevo <> 'ASLAN') and (CanalNuevo <> 'IDESI_API') then
    raise Exception.Create('Canal no reconocido.');
  if AmbienteNuevo <> 'TEST' then
    raise Exception.Create('La configuracion PROD esta bloqueada en CP12.');
  if (CanalNuevo = 'IDESI_API') and (not FExisteIntentos) then
    raise Exception.Create('Debe instalar ECF_API_INTENTO antes de elegir IDESI_API.');
  Motivo := Trim(edtMotivo.Text);
  if Length(Motivo) < 8 then
    raise Exception.Create('Indique un motivo de al menos 8 caracteres.');
  if Length(Motivo) > 250 then
    raise Exception.Create('Motivo: maximo 250 caracteres.');
  if Length(FUsuarioApp) > 60 then
    raise Exception.Create('Usuario de aplicacion excede 60 caracteres.');
  CambioDeRuta := (not FConfigExiste) or HayCambios;
  if not CambioDeRuta then
    Exit;

  if (CanalNuevo = 'IDESI_API') and (FCanalAnterior <> 'IDESI_API') then
    if MessageDlg('Atencion: seleccionar IDESI_API en TEST BLOQUEARA ' +
      'la emision automatica mientras el POST siga deshabilitado.' + #13#10 +
      'Desea guardar esta configuracion en la BD conectada?',
      mtWarning, [mbYes, mbNo], 0) <> mrYes then Exit;

  if MessageDlg('Confirmar cambio fiscal para RNC ' + Rnc + ':' + #13#10 +
    FCanalAnterior + '/' + FAmbienteAnterior + ' -> ' +
    CanalNuevo + '/' + AmbienteNuevo + '?' + #13#10 +
    'Motivo: ' + Motivo,
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  Tx := TransaccionNueva(True, IniciadaAqui);
  SavepointActivo := False;
  try
    Q := ConsultaNueva(Tx);
    try
      try
        if not IniciadaAqui then
        begin
          { Preserva operaciones pendientes que otros formularios hayan realizado
            dentro de la misma transaccion global. }
          Q.SQL.Text := 'SAVEPOINT SP_UFRM_ECFCANAL';
          Q.ExecSQL;
          SavepointActivo := True;
        end;
        if FExisteIntentos then
        begin
          Q.SQL.Text :=
            'SELECT COUNT(*) FROM ECF_API_INTENTO ' +
            'WHERE RNC_EMISOR = :RNC AND ESTADO_LOCAL <> ''CONCILIADO''';
          Q.ParamByName('RNC').AsString := Rnc;
          Q.Open;
          Pendientes := Q.Fields[0].AsInteger;
          Q.Close;
          if Pendientes <> 0 then
            raise Exception.Create('Existen ' + IntToStr(Pendientes) +
              ' intentos sin conciliar. Cambio de configuracion bloqueado.');
        end;

        if FConfigExiste then
        begin
          Q.SQL.Text :=
            'UPDATE ECF_CANAL_CONFIG SET CANAL_ENVIO = :NUEVOCANAL, ' +
            'API_AMBIENTE = :NUEVOAMB, FECHA_ACTUALIZACION = CURRENT_TIMESTAMP ' +
            'WHERE RNC_EMISOR = :RNC AND CANAL_ENVIO = :ANTCANAL ' +
            'AND API_AMBIENTE = :ANTAMB';
          if FFechaAnteriorNula then
            Q.SQL.Add('AND FECHA_ACTUALIZACION IS NULL')
          else
            Q.SQL.Add('AND CAST(FECHA_ACTUALIZACION AS VARCHAR(24)) = :ANTFECHA');
          Q.ParamByName('NUEVOCANAL').AsString := CanalNuevo;
          Q.ParamByName('NUEVOAMB').AsString := AmbienteNuevo;
          Q.ParamByName('RNC').AsString := Rnc;
          Q.ParamByName('ANTCANAL').AsString := FCanalAnterior;
          Q.ParamByName('ANTAMB').AsString := FAmbienteAnterior;
          if not FFechaAnteriorNula then
            Q.ParamByName('ANTFECHA').AsString := FFechaAnteriorSql;
          Q.ExecSQL;
          Afectadas := Q.RowsAffected;
          if Afectadas <> 1 then
            raise Exception.Create('Configuracion alterada por otro proceso. ' +
              'Recargue los datos antes de modificar.');
        end
        else
        begin
          Q.SQL.Text :=
            'INSERT INTO ECF_CANAL_CONFIG ' +
            '(RNC_EMISOR,CANAL_ENVIO,API_AMBIENTE,FECHA_ACTUALIZACION) ' +
            'VALUES (:RNC,:NUEVOCANAL,:NUEVOAMB,CURRENT_TIMESTAMP)';
          Q.ParamByName('RNC').AsString := Rnc;
          Q.ParamByName('NUEVOCANAL').AsString := CanalNuevo;
          Q.ParamByName('NUEVOAMB').AsString := AmbienteNuevo;
          Q.ExecSQL;
          if Q.RowsAffected <> 1 then
            raise Exception.Create('No se inserto configuracion fiscal.');
        end;

        Q.SQL.Text :=
          'INSERT INTO ECF_CANAL_CONFIG_AUDIT ' +
          '(ID_AUDIT,RNC_EMISOR,TIPO_OPERACION,CANAL_ANTERIOR, ' +
          'AMBIENTE_ANTERIOR,CANAL_NUEVO,AMBIENTE_NUEVO, ' +
          'USUARIO_APP,EQUIPO,MOTIVO) VALUES ' +
          '(GEN_ID(GEN_ECF_CANAL_CONFIG_AUDIT,1),:RNC,:TIPO, ';
        if FConfigExiste then
          Q.SQL.Add(':ANTCANAL,:ANTAMB,')
        else
          Q.SQL.Add('NULL,NULL,');
        Q.SQL.Add(':NUEVOCANAL,:NUEVOAMB,:USUARIO,:EQUIPO,:MOTIVO)');
        Q.ParamByName('RNC').AsString := Rnc;
        if FConfigExiste then
        begin
          Q.ParamByName('TIPO').AsString := 'UPDATE';
          Q.ParamByName('ANTCANAL').AsString := FCanalAnterior;
          Q.ParamByName('ANTAMB').AsString := FAmbienteAnterior;
        end
        else
          Q.ParamByName('TIPO').AsString := 'INSERT';
        Q.ParamByName('NUEVOCANAL').AsString := CanalNuevo;
        Q.ParamByName('NUEVOAMB').AsString := AmbienteNuevo;
        Q.ParamByName('USUARIO').AsString := FUsuarioApp;
        Q.ParamByName('EQUIPO').AsString := EquipoActual;
        Q.ParamByName('MOTIVO').AsString := Motivo;
        Q.ExecSQL;
        if Q.RowsAffected <> 1 then
          raise Exception.Create('Fallo al registrar auditoria fiscal.');
        if SavepointActivo then
        begin
          Q.SQL.Text := 'RELEASE SAVEPOINT SP_UFRM_ECFCANAL';
          Q.ExecSQL;
          SavepointActivo := False;
        end;
        if IniciadaAqui then Tx.Commit;
      except
        if IniciadaAqui then
        begin
          if Tx.InTransaction then Tx.Rollback;
        end
        else if SavepointActivo then
        begin
          { Deshacer solo el cambio de este formulario, no la transaccion ajena. }
          Q.SQL.Text := 'ROLLBACK TO SAVEPOINT SP_UFRM_ECFCANAL';
          Q.ExecSQL;
          Q.SQL.Text := 'RELEASE SAVEPOINT SP_UFRM_ECFCANAL';
          Q.ExecSQL;
          SavepointActivo := False;
        end;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    { IBTransaction1 es propiedad de dmConectar; NO liberar. }
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;
  { Solo si la iniciamos se hizo COMMIT aqui. Si habia una transaccion
    global ajena, los cambios quedan sujetos a su COMMIT/ROLLBACK. }
  if IniciadaAqui then
    MessageDlg('Configuracion y auditoria confirmadas en Firebird.',
      mtInformation, [mbOK], 0)
  else
    MessageDlg('Configuracion y auditoria actualizadas en IBTransaction1.' +
      #13#10 + 'PENDIENTE: el proceso propietario debe confirmar la ' +
      'transaccion global (COMMIT).', mtWarning, [mbOK], 0);
  try
    CargarConfiguracion;
    ConsultarIntentos;
    ConsultarAuditoria;
  except
    on E: Exception do
    begin
      btnGuardar.Enabled := False;
      MessageDlg('Actualizacion SQL realizada; fallo la lectura visual. ' +
        'Verifique el estado de la transaccion global. Detalle: ' + E.Message,
        mtWarning, [mbOK], 0);
    end;
  end;
end;

procedure TfrmEcfCanalConfig.btnGuardarClick(Sender: TObject);
begin
  try
    GuardarConfiguracion;
  except
    on E: Exception do
      MessageDlg('No se guardo configuracion e-CF:' + #13#10 +
        E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TfrmEcfCanalConfig.btnReleerClick(Sender: TObject);
begin
  if HayCambios then
    if MessageDlg('Descartar cambios y recargar desde Firebird?',
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
  try
    VerificarEsquema;
    CargarConfiguracion;
    ConsultarIntentos;
    ConsultarAuditoria;
  except
    on E: Exception do
    begin
      btnGuardar.Enabled := False;
      MessageDlg('Error al recargar: ' + E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmEcfCanalConfig.ConsultarIntentos;
var
  Tx: TIBTransaction;
  IniciadaAqui: Boolean;
  Q: TIBQuery;
  Rnc, Estado: string;
  I, C: Integer;
begin
  ConfigurarGrid;
  Rnc := RncSeleccionado;
  if not FExisteIntentos then
  begin
    lblResumenIntentos.Caption := 'Migracion 02 pendiente: sin tabla ECF_API_INTENTO.';
    lblIdentidad.Caption := '';
    Exit;
  end;
  if Rnc = '' then Exit;
  Estado := '';
  if cboFiltroEstado.ItemIndex > 0 then
    Estado := cboFiltroEstado.Text;
  Tx := TransaccionNueva(False, IniciadaAqui);
  try
    Q := ConsultaNueva(Tx);
    try
      try
        Q.SQL.Text :=
          'SELECT FIRST 100 ID_INTENTO,NUMERO_TRN,ENCF,ESTADO_LOCAL, ' +
          'HTTP_STATUS,FECHA_CREACION,FECHA_CAMBIO,REQUEST_BYTES ' +
          'FROM ECF_API_INTENTO WHERE RNC_EMISOR = :RNC';
        if Estado <> '' then
          Q.SQL.Add('AND ESTADO_LOCAL = :ESTADO');
        Q.SQL.Add('ORDER BY FECHA_CREACION DESC, ID_INTENTO DESC');
        Q.ParamByName('RNC').AsString := Rnc;
        if Estado <> '' then
          Q.ParamByName('ESTADO').AsString := Estado;
        Q.Open;
        I := 1;
        while not Q.Eof do
        begin
          if grdIntentos.RowCount <= I then
            grdIntentos.RowCount := I + 1;
          grdIntentos.Cells[0,I] := Q.FieldByName('ID_INTENTO').AsString;
          grdIntentos.Cells[1,I] := Q.FieldByName('NUMERO_TRN').AsString;
          grdIntentos.Cells[2,I] := Q.FieldByName('ENCF').AsString;
          grdIntentos.Cells[3,I] := Q.FieldByName('ESTADO_LOCAL').AsString;
          grdIntentos.Cells[4,I] := Q.FieldByName('HTTP_STATUS').AsString;
          grdIntentos.Cells[5,I] := Q.FieldByName('FECHA_CREACION').AsString;
          grdIntentos.Cells[6,I] := Q.FieldByName('FECHA_CAMBIO').AsString;
          grdIntentos.Cells[7,I] := Q.FieldByName('REQUEST_BYTES').AsString;
          Inc(I);
          Q.Next;
        end;
        Q.Close;
        if IniciadaAqui then Tx.Commit;
        C := I - 1;
        lblResumenIntentos.Caption := 'RNC ' + Rnc + ': ' +
          IntToStr(C) + ' intento(s) mostrados (maximo 100).';
        if C > 0 then
          lblIdentidad.Caption := 'ID: ' + grdIntentos.Cells[0,1]
        else
          lblIdentidad.Caption := 'Sin intentos para el filtro.';
      except
        if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    { IBTransaction1 es propiedad de dmConectar; NO liberar. }
    if IniciadaAqui and Tx.InTransaction then Tx.Rollback;
  end;
end;

procedure TfrmEcfCanalConfig.btnBuscarIntentosClick(Sender: TObject);
begin
  try
    ConsultarIntentos;
  except
    on E: Exception do
      MessageDlg('Error consultando intentos: ' + E.Message,
        mtError, [mbOK], 0);
  end;
end;

procedure TfrmEcfCanalConfig.grdIntentosClick(Sender: TObject);
begin
  if (grdIntentos.Row >= 1) and
    (Trim(grdIntentos.Cells[0, grdIntentos.Row]) <> '') then
    lblIdentidad.Caption := 'ID: ' +
      grdIntentos.Cells[0, grdIntentos.Row];
end;

procedure TfrmEcfCanalConfig.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if FInicializado and HayCambios then
    CanClose := MessageDlg('Hay cambios sin guardar. Cerrar el mantenimiento?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TfrmEcfCanalConfig.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

end.