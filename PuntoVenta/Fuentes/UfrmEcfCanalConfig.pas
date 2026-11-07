unit UfrmEcfCanalConfig;

{
  PointSaleSoft / Delphi 7 / Firebird 2.5 / IBX.
  CP12: mantenimiento administrativo de ECF_CANAL_CONFIG y consulta
  EXCLUSIVAMENTE de lectura de ECF_API_INTENTO.

  NO transmite e-CF, NO modifica ECF_API_INTENTO ni ECF_TIMBRE_LOG,
  NO modifica la transaccion de venta ni la transaccion global de IBX.
  PROD no puede activarse desde este formulario.
  No implementar acceso desde el menu sin validar privilegios fiscales.
}

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, Grids, IBDatabase, IBQuery, DB;

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
    FIndiceEmisor: Integer;
    FRncs: TStringList;
    function TransaccionNueva(AEscritura: Boolean): TIBTransaction;
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
  if (ADatabase = nil) or (not ADatabase.Connected) then
    raise Exception.Create('No hay conexion Firebird disponible.');
  FDatabase := ADatabase;
  FUsuarioApp := Trim(AUsuarioApp);
  FAutorizado := AEdicionAutorizada;
  if FAutorizado and (FUsuarioApp = '') then
    raise Exception.Create('No se permite editar sin usuario autenticado.');
end;

function TfrmEcfCanalConfig.TransaccionNueva(
  AEscritura: Boolean): TIBTransaction;
begin
  if (FDatabase = nil) or (not FDatabase.Connected) then
    raise Exception.Create('Conexion Firebird no disponible.');
  Result := TIBTransaction.Create(nil);
  try
    Result.DefaultDatabase := FDatabase;
    Result.Params.Clear;
    Result.Params.Add('read_committed');
    Result.Params.Add('rec_version');
    Result.Params.Add('wait');
    if AEscritura then
      Result.Params.Add('write')
    else
      Result.Params.Add('read');
    Result.StartTransaction;
  except
    Result.Free;
    raise;
  end;
end;

function TfrmEcfCanalConfig.ConsultaNueva(
  ATx: TIBTransaction): TIBQuery;
begin
  Result := TIBQuery.Create(nil);
  Result.Database := FDatabase;
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
  Tx := TransaccionNueva(False);
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
        Tx.Commit;
        lblResumenAuditoria.Caption := 'RNC ' + Rnc + ': ' +
          IntToStr(I - 1) + ' cambio(s) mostrados (maximo 100).';
      except
        if Tx.InTransaction then Tx.Rollback;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    Tx.Free;
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

procedure TfrmEcfCanalConfig.FormShow(Sender: TObject);
begin
  if FInicializado then
    Exit;
  FInicializado := True;
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
  TieneConfig: Boolean;
begin
  Tx := TransaccionNueva(False);
  try
    try
      TieneConfig := TablaExiste(Tx, 'ECF_CANAL_CONFIG');
      FExisteIntentos := TablaExiste(Tx, 'ECF_API_INTENTO');
      FExisteAuditoria := TablaExiste(Tx, 'ECF_CANAL_CONFIG_AUDIT');
      Tx.Commit;
    except
      if Tx.InTransaction then Tx.Rollback;
      raise;
    end;
  finally
    Tx.Free;
  end;
  if not TieneConfig then
    raise Exception.Create('Falta ECF_CANAL_CONFIG: ejecutar migracion 01 en BD de desarrollo.');
end;

procedure TfrmEcfCanalConfig.CargarEmisores;
var
  Tx: TIBTransaction;
  Q: TIBQuery;
  Rnc, Nombre: string;
begin
  FRncs.Clear;
  cboEmisor.Items.Clear;
  Tx := TransaccionNueva(False);
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
        Tx.Commit;
      except
        if Tx.InTransaction then Tx.Rollback;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    Tx.Free;
  end;
end;

procedure TfrmEcfCanalConfig.CargarConfiguracion;
var
  Tx: TIBTransaction;
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
    FCanalAnterior := 'ASLAN';
    FAmbienteAnterior := 'TEST';
    Tx := TransaccionNueva(False);
    try
      Q := ConsultaNueva(Tx);
      try
        try
          Q.SQL.Text :=
            'SELECT CANAL_ENVIO, API_AMBIENTE, FECHA_ACTUALIZACION ' +
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
              FFechaAnterior := Q.FieldByName('FECHA_ACTUALIZACION').AsDateTime;
          end;
          Q.Close;
          Tx.Commit;
        except
          if Tx.InTransaction then Tx.Rollback;
          raise;
        end;
      finally
        Q.Free;
      end;
    finally
      Tx.Free;
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
  Q: TIBQuery;
  Rnc, CanalNuevo, AmbienteNuevo, Motivo: string;
  CambioDeRuta: Boolean;
  Pendientes: Integer;
  Afectadas: Integer;
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

  Tx := TransaccionNueva(True);
  try
    Q := ConsultaNueva(Tx);
    try
      try
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
            Q.SQL.Add('AND FECHA_ACTUALIZACION = :ANTFECHA');
          Q.ParamByName('NUEVOCANAL').AsString := CanalNuevo;
          Q.ParamByName('NUEVOAMB').AsString := AmbienteNuevo;
          Q.ParamByName('RNC').AsString := Rnc;
          Q.ParamByName('ANTCANAL').AsString := FCanalAnterior;
          Q.ParamByName('ANTAMB').AsString := FAmbienteAnterior;
          if not FFechaAnteriorNula then
            Q.ParamByName('ANTFECHA').AsDateTime := FFechaAnterior;
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
        Tx.Commit;
      except
        if Tx.InTransaction then Tx.Rollback;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    Tx.Free;
  end;
  { El COMMIT ya ocurrio. Un fallo posterior de lectura NO debe
    presentarse falsamente como un fallo del guardado fiscal. }
  MessageDlg('Configuracion y auditoria guardadas correctamente.',
    mtInformation, [mbOK], 0);
  try
    CargarConfiguracion;
    ConsultarIntentos;
    ConsultarAuditoria;
  except
    on E: Exception do
    begin
      btnGuardar.Enabled := False;
      MessageDlg('Guardado confirmado; fallo la actualizacion visual. ' +
        'Cierre y reabra el formulario. Detalle: ' + E.Message,
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
  Tx := TransaccionNueva(False);
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
        Tx.Commit;
        C := I - 1;
        lblResumenIntentos.Caption := 'RNC ' + Rnc + ': ' +
          IntToStr(C) + ' intento(s) mostrados (maximo 100).';
        if C > 0 then
          lblIdentidad.Caption := 'ID: ' + grdIntentos.Cells[0,1]
        else
          lblIdentidad.Caption := 'Sin intentos para el filtro.';
      except
        if Tx.InTransaction then Tx.Rollback;
        raise;
      end;
    finally
      Q.Free;
    end;
  finally
    Tx.Free;
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
