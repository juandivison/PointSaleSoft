unit UTasaDolar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, rxToolEdit, RXDBCtrl,
  Mask, Grids, DBGrids, RXCtrls, IBCustomDataSet, DB, DBCtrls, WinSkinData,
  ComCtrls, DateUtils;

type                               
  TfrmMoneda = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    chBocHistorico: TCheckBox;
    dtqryMonedaDet: TDataSource;
    qryMonedaDet: TIBDataSet;
    qryMonedaDetSERIE: TIntegerField;
    qryMonedaDetCODIGO: TIBStringField;
    qryMonedaDetFECHA_INICIAL: TDateTimeField;
    qryMonedaDetFECHA_FINAL: TDateTimeField;
    qryMonedaDetDescripcion: TStringField;
    qryMonedaDetVALOR: TFloatField;
    qryMonedaDetINSERTADO_POR: TIBStringField;
    qryMonedaDetFECHA_IN: TDateTimeField;
    qryMonedaDetMOD_POR: TIBStringField;
    qryMonedaDetFECHA_UPD: TDateTimeField;
    SkinData1: TSkinData;
    tblMoneda: TIBDataSet;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaFECHA_IN: TDateTimeField;
    tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField;
    tblMonedaMODIFICADO_POR: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DataSource1: TDataSource;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    RxDBGrid2: TRxDBGrid;
    DBStatusLabel2: TDBStatusLabel;
    Shape1: TShape;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    btnCancelarDet: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure qryMonedaDetCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure chBocHistoricoClick(Sender: TObject);
    procedure IBDataSet1CalcFields(DataSet: TDataSet);
    procedure qryMonedaDetFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblMonedaAfterScroll(DataSet: TDataSet);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnCancelarDetClick(Sender: TObject);
    procedure qryMonedaDetBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure RefrescarDetalle;
  public
    { Public declarations }
    mCodigo : string;
    function ValidarCadenaMoneda(const ACodigo: string;
      var AError: string): Boolean;
  end;

var
  frmMoneda: TfrmMoneda;
  sqlText : String;
  cont : Integer = 1;
implementation

uses UDatosCambioTasa, uglobal, UDatModConectar, UFormSelFecha, IBSQL;

{$R *.DFM}

function AjustarTextoCampo(const AValor: string; AMaxLen: Integer): string;
begin
  Result := Trim(AValor);

  if (AMaxLen > 0) and (Length(Result) > AMaxLen) then
    Result := Copy(Result, 1, AMaxLen);
end;

procedure TfrmMoneda.qryMonedaDetCalcFields(DataSet: TDataSet);
begin
  if qryMonedaDetCodigo.IsNull then exit; 
  case qryMonedaDetCodigo.AsInteger of
  1:qryMonedaDetDescripcion.Value := 'Peso';
  2:qryMonedaDetDescripcion.Value := 'Dolar';
  end;  
end;

procedure TfrmMoneda.FormCreate(Sender: TObject);
begin
  { Validación central antes de cualquier Post manual. }
  qryMonedaDet.BeforePost := qryMonedaDetBeforePost;

  { El código de moneda lo determina el registro maestro; no debe cambiarse
    manualmente en MONEDA_DET. }
  DBEdit1.ReadOnly := True;

  tblMoneda.Close;
  tblMoneda.Open;
  if cont = 1 then
  sqlText:=qryMonedaDet.SelectSQL.Text;
  cont:=0;
  if chBocHistorico.Checked then
  begin
    qryMonedaDet.Close;
    qryMonedaDet.SelectSQL.clear;
    qryMonedaDet.SelectSQL.text:='Select * from moneda_det order by fecha_inicial';
    if not qryMonedaDet.Prepared then
    qryMonedaDet.Prepare;
    qryMonedaDet.Open;
  end else
  begin
    frmSelFecha:=TfrmSelFecha.create(nil);
    try
      if frmSelFecha.showmodal = mrOk then
      begin
        qryMonedaDet.Close;
        if qryMonedaDet.Prepared then
        qryMonedaDet.Unprepare;
        qryMonedaDet.SelectSQL.Clear;
        qryMonedaDet.SelectSQL.Text:=SqlText;
        qryMonedaDet.Prepare;
        qryMonedaDet.Params[0].Value := ExtraerFecha(frmSelFecha.FechaIni.Date);
        qryMonedaDet.Open;
      end;
    finally
    frmSelFecha.free;
    frmSelFecha:=nil;
    end;
  end;
end;

procedure TfrmMoneda.btnInsertarClick(Sender: TObject);
begin
  if frmMoneda.qryMonedaDetCodigo.Value <> '1' then
  begin
    MessageDlg('Record activo debe ser pesos, verifique',mtError,[mbok],0);
    Exit;
  end;

  if qryMonedaDet.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(
      'Hay un registro de moneda en edición. Guarde o cancele ese cambio ' +
      'antes de utilizar Cambiar Tasa.',
      mtError,[mbOK],0);
    Exit;
  end;

  if qryMonedaDet.UpdatesPending then
  begin
    MessageDlg(
      'Existen cambios manuales pendientes de guardar en MONEDA_DET. ' +
      'Guárdelos o cancélelos antes de utilizar Cambiar Tasa.',
      mtError,[mbOK],0);
    Exit;
  end;

  if MessageDlg('Seguro que quiere cambiar tasa actual?',mtInformation,
     [mbyes,mbNo],0)=mrno then Exit;

  frmDatosCambioTasa:=TfrmDatosCambioTasa.Create(nil);
  try
    if frmDatosCambioTasa.ShowModal = mrOK then
      RefrescarDetalle;
  finally
    frmDatosCambioTasa.free;
    frmDatosCambioTasa:=nil;
  end;
end;

procedure TfrmMoneda.btnSalvarClick(Sender: TObject);
var
  VError  : string;
  VCodigo : string;
begin
  { Maestro de monedas: conservar comportamiento existente. }
  if tblMoneda.State in [dsEdit, dsInsert] then
  begin
    if frmMoneda.tblMoneda.State in [dsEdit,dsInsert] then
    begin
      frmMoneda.tblMoneda.Post;
      frmMoneda.tblMoneda.ApplyUpdates;
    end;

    if not frmMoneda.tblMoneda.Transaction.InTransaction then
      frmMoneda.tblMoneda.Transaction.StartTransaction;

    try
      frmMoneda.tblMoneda.Transaction.CommitRetaining;
    except
      frmMoneda.tblMoneda.Transaction.RollbackRetaining;
      raise;
    end;
  end;

  { MONEDA_DET usa CachedUpdates. Esto permite que el usuario prepare
    manualmente más de un cambio (por ejemplo, dividir un intervalo) y que
    la cadena completa se valide ANTES del Commit. }
  if frmMoneda.qryMonedaDet.State in [dsEdit,dsInsert] then
    frmMoneda.qryMonedaDet.Post;

  if qryMonedaDetCODIGO.IsNull then
    VCodigo := tblMonedaCODIGO.AsString
  else
    VCodigo := qryMonedaDetCODIGO.AsString;

  if Trim(VCodigo) = '' then
  begin
    MessageDlg('No se pudo determinar la moneda a validar.',
      mtError,[mbOK],0);
    Exit;
  end;

  if not frmMoneda.qryMonedaDet.Transaction.InTransaction then
    frmMoneda.qryMonedaDet.Transaction.StartTransaction;

  try
    { Aplicar dentro de la transacción, pero todavía NO confirmar. }
    frmMoneda.qryMonedaDet.ApplyUpdates;

    { La validación ve los cambios no confirmados porque utiliza la misma
      transacción IBX. Si hay solapamiento o hueco, hacemos rollback. }
    VError := '';
    if not ValidarCadenaMoneda(VCodigo, VError) then
      raise Exception.Create(VError);

    //frmMoneda.qryMonedaDet.Transaction.CommitRetaining;
    GlbSalvarQuery(frmMoneda.qryMonedaDet)
  except
    on E: Exception do
    begin
      if frmMoneda.qryMonedaDet.Transaction.InTransaction then
        frmMoneda.qryMonedaDet.Transaction.RollbackRetaining;

      { Después del rollback, sincronizar la vista con Firebird para que
        nunca quede mostrando como guardado un rango rechazado. }
      try
        frmMoneda.qryMonedaDet.CancelUpdates;
      except
      end;

      RefrescarDetalle;

      MessageDlg(
        'No se guardaron los cambios de vigencia de la moneda.' + #13#10 +
        E.Message,
        mtError,[mbOK],0);
      Exit;
    end;
  end;
end;

procedure TfrmMoneda.btnModificarClick(Sender: TObject);
begin
  if qryMonedaDet.State = dsBrowse then
  begin
    if MessageDlg('La tasa no debe ser modificada, salvo que el valor sea erroneo,Continuar?',
       mtinformation,[mbyes,mbno],0)=mryes then
    begin
      qryMonedaDet.Edit;
      qryMonedaDetfecha_upd.Value := Date;
      qryMonedaDetMOD_POR.Value   := AjustarTextoCampo(StrUserName, qryMonedaDetMOD_POR.Size);
    end;
  end;
end;

procedure TfrmMoneda.chBocHistoricoClick(Sender: TObject);
begin
  FormCreate(self);
end;

procedure TfrmMoneda.IBDataSet1CalcFields(DataSet: TDataSet);
begin
  if qryMonedaDetCodigo.IsNull then Exit; 
  case qryMonedaDetCodigo.AsInteger of
  1:qryMonedaDetDescripcion.Value := 'Peso';
  2:qryMonedaDetDescripcion.Value := 'Dólar';
  3:qryMonedaDetDescripcion.Value := 'EURO';
  else qryMonedaDetDescripcion.Value := 'Moneda Error';
  end;
end;

procedure TfrmMoneda.qryMonedaDetFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DataSet['Codigo']= StrToInt(mcodigo));
end;

procedure TfrmMoneda.tblMonedaAfterScroll(DataSet: TDataSet);
begin
  mcodigo:=tblMonedaCODIGO.Value;
  qryMonedaDet.Filtered := False;
  qryMonedaDet.Filtered := True;
end;

procedure TfrmMoneda.BitBtn9Click(Sender: TObject);
begin
  tblMoneda.First;
end;

procedure TfrmMoneda.BitBtn10Click(Sender: TObject);
begin
  tblMoneda.Prior;
end;

procedure TfrmMoneda.BitBtn11Click(Sender: TObject);
begin
  tblMoneda.Next;
end;

procedure TfrmMoneda.BitBtn12Click(Sender: TObject);
begin
  tblMoneda.Last;
end;

procedure TfrmMoneda.BitBtn1Click(Sender: TObject);
begin
  if qrymonedadet.State = dsbrowse then
  begin
    qryMonedaDet.Append;
    qryMonedaDetCODIGO.Value:= tblMonedaCODIGO.Value;
    qryMonedaDetFECHA_INICIAL.Value:= GlbFechaTrnDiaria;
    qryMonedaDetFECHA_FINAL.Value:= IncYear(ExtraerFecha(GlbFechaTrnDiaria), 1);
    qryMonedaDetINSERTADO_POR.Value:= AjustarTextoCampo(StrUserName, qryMonedaDetINSERTADO_POR.Size);
    qryMonedaDetFECHA_IN.Value     := now;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmMoneda.BitBtn3Click(Sender: TObject);
begin
  if qryMonedaDet.State = dsInsert then
   qryMonedaDetSerie.Value := FsqlMaxNumero('moneda_det','serie');

    if qryMonedaDet.State in [dsInsert,dsEdit] then
    begin
      if qryMonedaDetCODIGO.IsNull then
      qryMonedaDetCODIGO.Value:= tblMonedaCODIGO.Value;
      qryMonedaDetFECHA_UPD.Value:= date;
      qryMonedaDetMOD_POR.Value:= AjustarTextoCampo(StrUserName, qryMonedaDetMOD_POR.Size);
    end;

  if qryMonedaDet.State in [dsInsert,dsEdit] then
  qryMonedaDet.Post;
end;

procedure TfrmMoneda.BitBtn2Click(Sender: TObject);
begin
  if qrymonedadet.State = dsbrowse then
  qryMonedaDet.Edit;
end;

procedure TfrmMoneda.btnCancelarDetClick(Sender: TObject);
begin
  if qryMonedaDet.State in [dsInsert,dsEdit] then
    qryMonedaDet.Cancel;
end;

procedure TfrmMoneda.qryMonedaDetBeforePost(DataSet: TDataSet);
var
  VIni : TDateTime;
  VFin : TDateTime;
begin
  if qryMonedaDetCODIGO.IsNull or
     (Trim(qryMonedaDetCODIGO.AsString) = '') then
  begin
    MessageDlg('Código de moneda es requerido.',mtError,[mbOK],0);
    Abort;
  end;

  if qryMonedaDetFECHA_INICIAL.IsNull then
  begin
    MessageDlg('Fecha inicial es requerida.',mtError,[mbOK],0);
    Abort;
  end;

  if qryMonedaDetFECHA_FINAL.IsNull then
  begin
    MessageDlg('Fecha final es requerida.',mtError,[mbOK],0);
    Abort;
  end;

  VIni := Trunc(qryMonedaDetFECHA_INICIAL.AsDateTime);
  VFin := Trunc(qryMonedaDetFECHA_FINAL.AsDateTime);

  if VIni > VFin then
  begin
    MessageDlg(
      'Rango de fechas inválido.' + #13#10 +
      'La Fecha Inicial no puede ser mayor que la Fecha Final.',
      mtError,[mbOK],0);
    Abort;
  end;

  if qryMonedaDetVALOR.IsNull or (qryMonedaDetVALOR.AsFloat <= 0) then
  begin
    MessageDlg('El valor de la tasa debe ser mayor que cero.',
      mtError,[mbOK],0);
    Abort;
  end;
end;

function TfrmMoneda.ValidarCadenaMoneda(const ACodigo: string;
  var AError: string): Boolean;
var
  Q          : TIBSQL;
  VSerie     : Integer;
  VSerieAnt  : Integer;
  VIni       : TDateTime;
  VFin       : TDateTime;
  VFinAnt    : TDateTime;
  VTieneAnt  : Boolean;
  VEsperada  : TDateTime;
begin
  Result := False;
  AError := '';
  VTieneAnt := False;
  VSerieAnt := 0;
  VFinAnt := 0;

  Q := TIBSQL.Create(nil);
  try
    Q.Database := dmConectar.IBDatabase1;
    Q.Transaction := dmConectar.IBTransaction1;
    Q.SQL.Text :=
      'select SERIE, FECHA_INICIAL, FECHA_FINAL ' +
      'from MONEDA_DET ' +
      'where CODIGO = :CODIGO ' +
      'order by FECHA_INICIAL, FECHA_FINAL, SERIE';

    Q.ParamByName('CODIGO').AsString := Trim(ACodigo);
    Q.ExecQuery;

    while not Q.Eof do
    begin
      VSerie := Q.FieldByName('SERIE').AsInteger;

      if Q.FieldByName('FECHA_INICIAL').IsNull or
         Q.FieldByName('FECHA_FINAL').IsNull then
      begin
        AError :=
          'Moneda ' + ACodigo + ': la SERIE ' + IntToStr(VSerie) +
          ' tiene Fecha Inicial o Fecha Final vacía.';
        Exit;
      end;

      VIni := Trunc(Q.FieldByName('FECHA_INICIAL').AsDateTime);
      VFin := Trunc(Q.FieldByName('FECHA_FINAL').AsDateTime);

      if VIni > VFin then
      begin
        AError :=
          'Moneda ' + ACodigo + ': rango inválido en SERIE ' +
          IntToStr(VSerie) + '. ' +
          FormatDateTime('dd/mm/yyyy',VIni) + ' - ' +
          FormatDateTime('dd/mm/yyyy',VFin) + '.';
        Exit;
      end;

      if VTieneAnt then
      begin
        if VIni <= VFinAnt then
        begin
          AError :=
            'Moneda ' + ACodigo + ': existe solapamiento de fechas entre ' +
            'SERIE ' + IntToStr(VSerieAnt) + ' y SERIE ' +
            IntToStr(VSerie) + '.' + #13#10 +
            'El rango anterior termina ' +
            FormatDateTime('dd/mm/yyyy',VFinAnt) +
            ' y el siguiente inicia ' +
            FormatDateTime('dd/mm/yyyy',VIni) + '.';
          Exit;
        end;

        VEsperada := VFinAnt + 1;
        if VIni <> VEsperada then
        begin
          AError :=
            'Moneda ' + ACodigo + ': existe un hueco entre rangos de fecha.' +
            #13#10 +
            'SERIE ' + IntToStr(VSerieAnt) + ' termina ' +
            FormatDateTime('dd/mm/yyyy',VFinAnt) + '.' + #13#10 +
            'La siguiente SERIE ' + IntToStr(VSerie) + ' inicia ' +
            FormatDateTime('dd/mm/yyyy',VIni) + '.' + #13#10 +
            'Debe iniciar exactamente el ' +
            FormatDateTime('dd/mm/yyyy',VEsperada) + '.';
          Exit;
        end;
      end;

      VTieneAnt := True;
      VSerieAnt := VSerie;
      VFinAnt := VFin;
      Q.Next;
    end;

    Result := True;
  finally
    Q.Free;
  end;
end;

procedure TfrmMoneda.RefrescarDetalle;
begin
  qryMonedaDet.DisableControls;
  try
    if qryMonedaDet.State in [dsEdit,dsInsert] then
      qryMonedaDet.Cancel;

    qryMonedaDet.Close;
    qryMonedaDet.Open;
  finally
    qryMonedaDet.EnableControls;
  end;
end;

end.
