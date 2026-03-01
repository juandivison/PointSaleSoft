unit UFormPolizasCXC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, ExtCtrls, EditNew, IBQuery,
  Buttons, Grids, DBGrids, RxDBCtrl, WinSkinData;

type
  TfrmPolizasCxc = class(TForm)
    qryDatosVehiculos: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    edtCodCte: TEditN;
    ComboBox2: TComboBox;
    edtCodigoAgencia: TEditN;
    RadioGroup1: TRadioGroup;
    edtNumPoliza: TEditN;
    ComboBox3: TComboBox;
    edtCodigoDealer: TEditN;
    edtColor: TEdit;
    edtChasis: TEdit;
    edtPlaca: TEdit;
    qryAgencia: TIBQuery;
    qryAgenciaCODIGO_AGENCIA: TIntegerField;
    qryAgenciaDESCRIPCION: TIBStringField;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    qryDealer: TIBQuery;
    qryDealerCODIGO_DEALER: TIntegerField;
    qryDealerDESCRIPCION: TIBStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryDatosVehiculosNUMERO: TIntegerField;
    qryDatosVehiculosCODIGO_CTE: TIntegerField;
    qryDatosVehiculosPLACA: TIBStringField;
    qryDatosVehiculosIDMARCA: TIntegerField;
    qryDatosVehiculosMODELO: TIBStringField;
    qryDatosVehiculosANO_VEH: TIntegerField;
    qryDatosVehiculosFECHA_VENCE_SEGURO: TDateTimeField;
    qryDatosVehiculosTIPO_SEGURO: TSmallintField;
    qryDatosVehiculosCIA_SEGURO: TIBStringField;
    qryDatosVehiculosEMPRESA_LABORA: TIBStringField;
    qryDatosVehiculosFECHA_IN: TDateTimeField;
    qryDatosVehiculosIN_POR: TIBStringField;
    qryDatosVehiculosCODIGO_DEALER: TIntegerField;
    qryDatosVehiculosCODIGO_AGENCIA: TIntegerField;
    qryDatosVehiculosCOLOR: TIBStringField;
    qryDatosVehiculosNUM_CERTIFICADO: TIntegerField;
    qryDatosVehiculosCHASSIS: TIBStringField;
    qryDatosVehiculosNUMPOL: TIntegerField;
    qryDatosVehiculosSTATUSCXC: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    qryDatosVehiculosFECHA_APERTURA: TDateTimeField;
    qryDatosVehiculosTIPO_AFILIADO: TSmallintField;
    qryDatosVehiculosPOLIZA_ESPECIAL: TSmallintField;
    chkFilterEmailEnviado: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtNumPolizaChange(Sender: TObject);
    procedure edtCodigoAgenciaChange(Sender: TObject);
    procedure edtCodigoDealerChange(Sender: TObject);
    procedure edtCodCteChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkFilterEmailEnviadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPolizasCxc: TfrmPolizasCxc;

implementation
  uses UDatModConectar, UGlobal;
{$R *.dfm}

procedure TfrmPolizasCxc.FormCreate(Sender: TObject);
begin
  qryCliente.Close;
  qryCliente.Open;
  qryCliente.First;
  while not qryCliente.eof do
  begin
    ComboBox1.Items.Add(qryClienteNOMBRE_FACTURAR.Value);
    qryCliente.next;
  end;
  qryCliente.First;
  ComboBox1.Text:=qryClienteNOMBRE_FACTURAR.Value;

  qryAgencia.Close;
  qryAgencia.Open;
  qryAgencia.First;
  while not qryAgencia.eof do
  begin
    ComboBox2.Items.Add(qryAgenciaDESCRIPCION.Value);
    qryAgencia.next;
  end;
  qryAgencia.First;
  ComboBox2.Text:=qryAgenciaDESCRIPCION.Value;

  qryDealer.Close;
  qryDealer.Open;
  qryDealer.First;
  while not qryDealer.eof do
  begin
    ComboBox3.Items.Add(qryDealerDESCRIPCION.Value);
    qryDealer.next;
  end;
  qryDealer.First;
  ComboBox3.Text:=qryDealerDESCRIPCION.Value;
  ComboBox3Change(Self);
  ComboBox2Change(Self);
  ComboBox1Change(Self);
end;

procedure TfrmPolizasCxc.ComboBox1Change(Sender: TObject);
begin
  if qryCliente.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCte.SetInteger(qryClienteCODIGO_CTE.Value);
end;

procedure TfrmPolizasCxc.ComboBox2Change(Sender: TObject);
begin
  if qryAgencia.Locate('DESCRIPCION',ComboBox2.Text,[]) then
  edtCodigoAgencia.SetInteger(qryAgenciaCODIGO_AGENCIA.Value);
end;

procedure TfrmPolizasCxc.ComboBox3Change(Sender: TObject);
begin
  if qryDealer.Locate('DESCRIPCION', ComboBox3.Text,[]) then
  edtCodigoDealer.SetInteger(qryDealerCODIGO_DEALER.Value);
end;

procedure TfrmPolizasCxc.BitBtn3Click(Sender: TObject);
var
  strCond : string;
begin
  qryDatosVehiculos.Close;
  case RadioGroup1.ItemIndex of
  0: begin
       strCond := 'Select * from DATOSVEHICULO Where CODIGO_CTE like '+chr(39)+edtCodCte.Text+'%'+chr(39);
     end;
  1: begin
       strCond := 'Select * from DATOSVEHICULO Where CODIGO_AGENCIA like '+chr(39)+edtCodigoAgencia.Text+'%'+chr(39);
     end;
  2: begin
       strCond := 'Select * from DATOSVEHICULO Where CODIGO_DEALER like '+chr(39)+edtCodigoDealer.Text+'%'+chr(39);
     end;
  3: begin
       strCond := 'Select * from DATOSVEHICULO Where (NUM_CERTIFICADO like '+chr(39)+edtNumPoliza.Text+'%'+chr(39)+') or '
       +'(NUMPOL like '+chr(39)+edtNumPoliza.Text+'%'+chr(39)+') ';
     end;
  4: begin
       strCond := 'Select * from DATOSVEHICULO Where upper(CHASSIS) like '+chr(39)+'%'+edtChasis.Text+'%'+chr(39);;
     end;
  5: begin
       strCond := 'Select * from DATOSVEHICULO Where upper(placa) like '+chr(39)+'%'+edtPlaca.Text+'%'+chr(39);;
     end;
  6: begin
       strCond := 'Select * from DATOSVEHICULO';
     end;

  end;
  qryDatosVehiculos.SQL.Text:= strCond;
  qryDatosVehiculos.Open;
end;

procedure TfrmPolizasCxc.edtNumPolizaChange(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=3;
end;

procedure TfrmPolizasCxc.edtCodigoAgenciaChange(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=1;
end;

procedure TfrmPolizasCxc.edtCodigoDealerChange(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=2;
end;

procedure TfrmPolizasCxc.edtCodCteChange(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=0;
end;

procedure TfrmPolizasCxc.BitBtn1Click(Sender: TObject);
begin
  if (qryDatosVehiculos.RecordCount = 0) or (qryDatosVehiculos.State = dsInactive) then
  BitBtn3Click(Self);
end;

procedure TfrmPolizasCxc.chkFilterEmailEnviadoClick(Sender: TObject);
begin
  if chkFilterEmailEnviado.Checked then
  begin
    qryDatosVehiculos.Close;
    qryDatosVehiculos.SQL.Text:= 'Select r.* from DATOSVEHICULO r where r.NOTIFY_EMAIL = 1';
    qryDatosVehiculos.Open;
  end 
  else
    BitBtn3Click(Self);  
end;

end.
