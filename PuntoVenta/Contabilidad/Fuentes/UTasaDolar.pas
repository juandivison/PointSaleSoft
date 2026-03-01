unit UTasaDolar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ToolEdit, RXDBCtrl,
  Mask, Grids, DBGrids, RXCtrls, IBCustomDataSet, DB, DBCtrls, WinSkinData;

type
  TfrmMoneda = class(TForm)
    dtqryMonedaDet: TDataSource;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnInsertar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBText1: TDBText;
    RxDBGrid1: TRxDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    chBocHistorico: TCheckBox;
    qryMonedaDet: TIBDataSet;
    qryMonedaDetSERIE: TIntegerField;
    qryMonedaDetCODIGO: TIBStringField;
    qryMonedaDetFECHA_INICIAL: TDateTimeField;
    qryMonedaDetFECHA_FINAL: TDateTimeField;
    qryMonedaDetVALOR: TFloatField;
    qryMonedaDetINSERTADO_POR: TIBStringField;
    qryMonedaDetFECHA_IN: TDateTimeField;
    qryMonedaDetMOD_POR: TIBStringField;
    qryMonedaDetFECHA_UPD: TDateTimeField;
    qryMonedaDetDescripcion: TStringField;
    SkinData1: TSkinData;
    procedure qryMonedaDetCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure chBocHistoricoClick(Sender: TObject);
    procedure IBDataSet1CalcFields(DataSet: TDataSet);
    procedure qryMonedaDetFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
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

uses UDatosCambioTasa, uglobal, UDatModCon, UFormSelFecha;

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
  2:qryMonedaDetDescripcion.Value := 'Dolar';
  3:qryMonedaDetDescripcion.Value := 'EURO';
  else qryMonedaDetDescripcion.Value := 'Moneda Error';
  end;
end;

procedure TfrmMoneda.qryMonedaDetFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (DataSet['Codigo']= StrToInt(mcodigo));
end;

end.
