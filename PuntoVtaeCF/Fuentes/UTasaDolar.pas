unit UTasaDolar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, rxToolEdit, RXDBCtrl,
  Mask, Grids, DBGrids, RXCtrls, IBCustomDataSet, DB, DBCtrls, WinSkinData,
  ComCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
    mCodigo : string;
  end;

var
  frmMoneda: TfrmMoneda;
  sqlText : String;
  cont : Integer = 1;
implementation

uses UDatosCambioTasa, uglobal, UDatModConectar, UFormSelFecha;

{$R *.DFM}

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
  if MessageDlg('Seguro que quiere cambiar tasa actual?',mtInformation,
     [mbyes,mbNo],0)=mrno then exit;
  frmDatosCambioTasa:=TfrmDatosCambioTasa.Create(nil);
  try
    if frmDatosCambioTasa.ShowModal = mrOK then
    begin
      if frmMoneda.qryMonedaDet.State in [dsEdit,dsInsert] then
      begin
        frmMoneda.qryMonedaDet.Post;
        frmMoneda.qryMonedaDet.ApplyUpdates;
      end;
      btnSalvarClick(Self);
    end;
  finally
   frmDatosCambioTasa.free;
   frmDatosCambioTasa:=nil;
  end;
end;

procedure TfrmMoneda.btnSalvarClick(Sender: TObject);
begin
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
    end;
  end;
  if frmMoneda.qryMonedaDet.State in [dsEdit,dsInsert] then
  begin
    frmMoneda.qryMonedaDet.Post;
    frmMoneda.qryMonedaDet.ApplyUpdates;
  end;
  if not frmMoneda.qryMonedaDet.Transaction.InTransaction then
  frmMoneda.qryMonedaDet.Transaction.StartTransaction;
  try
    frmMoneda.qryMonedaDet.Transaction.CommitRetaining;
  except
  frmMoneda.qryMonedaDet.Transaction.RollbackRetaining;
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
      qryMonedaDetMOD_POR.Value   := StrUserName;
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
    qryMonedaDetFECHA_FINAL.Value:= GlbFechaTrnDiaria + 365;
    qryMonedaDetINSERTADO_POR.Value:= strUserName;
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
      qryMonedaDetMOD_POR.Value:=strusername;
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

end.
