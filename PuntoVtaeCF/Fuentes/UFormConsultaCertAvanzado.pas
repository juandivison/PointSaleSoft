unit UFormConsultaCertAvanzado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, RxToolEdit, DB, IBCustomDataSet, IBQuery, StdCtrls,
  EditNew, WinSkinData, Buttons, Grids, DBGrids, RxDBCtrl;

type
  TfrmConsultaCertAvanzada = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    edtCodCte: TEditN;
    cboxAgente: TComboBox;
    edtCodAgente: TEditN;
    edtNumCertificado: TEditN;
    ComboBox3: TComboBox;
    edtCodigoDealer: TEditN;
    edtColor: TEdit;
    edtChasis: TEdit;
    edtPlaca: TEdit;
    qryAgencia: TIBQuery;
    qryAgenciaCODIGO_AGENCIA: TIntegerField;
    qryAgenciaDESCRIPCION: TIBStringField;
    qryDealer: TIBQuery;
    qryDealerCODIGO_DEALER: TIntegerField;
    qryDealerDESCRIPCION: TIBStringField;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    Label3: TLabel;
    Label4: TLabel;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    qryDatos: TIBQuery;
    qryDatos_Base: TIBQuery;
    qryDatosFECHA_INI: TDateTimeField;
    qryDatosFECHA_FIN: TDateTimeField;
    qryDatosSECUENCIA_INICIAL: TIntegerField;
    qryDatosSECUENCIA_FINAL: TIntegerField;
    qryDatosSERIE: TIntegerField;
    qryDatosCODIGO: TIntegerField;
    qryDatosNUMERO_CERTIFICADO: TIntegerField;
    qryDatosCODIGO_CLIENTE: TIntegerField;
    qryDatosNOMBRECLIENTE: TIBStringField;
    qryDatosCODCTECONSIGNADO: TIntegerField;
    qryDatosCODAGENTEASIGNADO: TIntegerField;
    qryDatosNOMBREAGENTE: TIBStringField;
    qryDatosSTATUS: TIBStringField;
    qryDatosANO_VEH: TIntegerField;
    qryDatosCHASSIS: TIBStringField;
    qryDatosCOLOR: TIBStringField;
    qryDatosMODELO: TIBStringField;
    qryDatosPLACA: TIBStringField;
    dsqryDatos: TDataSource;
    qryDatosCODIGO_DEALER: TIntegerField;
    qryDatosCODAGENCIA: TIntegerField;
    qryEmpCodV: TIBQuery;
    qryEmpCodVCODIGO: TIntegerField;
    qryEmpCodVNOMBRE: TIBStringField;
    qryEmpCodVAPELLIDO: TIBStringField;
    qryEmpCodVNOMBRECOMPLETO: TIBStringField;
    CheckBox1: TCheckBox;
    BitBtn4: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    edtFechaIniPoliza: TDateEdit;
    edtFechaFinPoliza: TDateEdit;
    CheckBox2: TCheckBox;
    qryDatosFECHA_VENCE_SEGURO: TDateTimeField;
    lblPolVda: TLabel;
    qryDatosESPECIAL: TSmallintField;
    lblPolEsp: TLabel;
    CheckBox3: TCheckBox;
    qryDatosIDNUMERODVEH: TIntegerField;
    qryDatos_Base1: TIBQuery;
    qryDatosTIPO_AFILIADO: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure cboxAgenteChange(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure edtCodCteChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    _usesqlBase1 : boolean;
  end;

var
  frmConsultaCertAvanzada: TfrmConsultaCertAvanzada;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmConsultaCertAvanzada.FormCreate(Sender: TObject);
begin
  _usesqlBase1:= false;
  dbEditFechaInicial.Date := Now;
  dbEditFechaFinal.Date := Now;
  edtFechaIniPoliza.Date := GlbFechaTrnDiaria;
  edtFechaFinPoliza.Date := GlbUltimoDiaMes(GlbFechaTrnDiaria);
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

  qryEmpCodV.close;
  qryEmpCodV.Open;
  qryEmpCodV.first;
  cboxAgente.clear;
  while not qryEmpCodV.Eof do
  begin
    cboxAgente.Items.Add(qryEmpCodVNOMBRECOMPLETO.Value);
    qryEmpCodV.next;
  end;
  cboxAgente.Text:=qryEmpCodVNOMBRECOMPLETO.Value;
  cboxAgenteChange(Self);

  qryDealer.Close;
  qryDealer.Open;
  qryDealer.First;
  ComboBox3.Clear;
  while not qryDealer.eof do
  begin
    ComboBox3.Items.Add(qryDealerDESCRIPCION.Value);
    qryDealer.next;
  end;
  qryDealer.First;
  ComboBox3.Text:=qryDealerDESCRIPCION.Value;
  ComboBox3Change(Self);
  cboxAgenteChange(Self);
  ComboBox1Change(Self);
  BitBtn1Click(Self);
end;

procedure TfrmConsultaCertAvanzada.ComboBox1Change(Sender: TObject);
begin
  if qryCliente.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCte.SetInteger(qryClienteCODIGO_CTE.Value);
end;

procedure TfrmConsultaCertAvanzada.cboxAgenteChange(Sender: TObject);
begin
  if qryEmpCodV.locate('NOMBRECOMPLETO',cboxAgente.Text,[]) then
  begin
    edtCodAgente.Text := qryEmpCodVCODIGO.AsString;
  end;
end;

procedure TfrmConsultaCertAvanzada.ComboBox3Change(Sender: TObject);
begin
  if qryDealer.Locate('DESCRIPCION', ComboBox3.Text,[]) then
  edtCodigoDealer.SetInteger(qryDealerCODIGO_DEALER.Value);
end;

procedure TfrmConsultaCertAvanzada.edtCodCteChange(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

procedure TfrmConsultaCertAvanzada.BitBtn1Click(Sender: TObject);
begin
  edtCodCte.Clear;
  edtCodAgente.Clear;
  edtNumCertificado.Clear;
  edtCodigoDealer.Clear;
  edtColor.Clear;
  edtChasis.Clear;
  edtPlaca.Clear;
end;

procedure TfrmConsultaCertAvanzada.BitBtn3Click(Sender: TObject);
var
  strcond : string;
begin
  qryDatos.Close;
  strcond:='';
  if (edtCodCte.Text <> '') then
  begin
    if _usesqlBase1 then
    strcond:=' Where d.codigo_cte = '+edtCodCte.Text
    else
    strcond:=' Where t.CODIGO_CLIENTE = '+edtCodCte.Text;
  end;

  if (edtCodAgente.Text <> '') then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and a.codigo_agente = ' + edtCodAgente.Text
    else strcond:=' Where a.codigo_agente = ' + edtCodAgente.Text
  end;

  if (edtCodigoDealer.Text <> '') then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and d.CODIGO_DEALER = ' + edtCodigoDealer.Text
    else strcond:=' Where d.CODIGO_DEALER = ' + edtCodigoDealer.Text;
  end;

  if (edtNumCertificado.Text <> '') then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and r.NUMERO_CERTIFICADO = ' + edtNumCertificado.Text
    else strcond := ' Where r.NUMERO_CERTIFICADO = ' + edtNumCertificado.Text;
  end;

  if (edtChasis.Text <> '') then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and upper(d.CHASSIS) = ' +chr(39)+ edtChasis.Text+chr(39)
    else strcond := ' Where upper(d.CHASSIS) = ' + chr(39)+edtChasis.Text+chr(39);
  end;

  if (edtColor.Text <> '') then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and upper(d.COLOR) = ' + chr(39)+edtColor.Text+chr(39)
    else strcond := ' Where upper(d.COLOR) = ' + chr(39)+edtColor.Text+chr(39);
  end;

  if (edtPlaca.Text <> '') then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and upper(d.placa) = ' +chr(39)+ edtPlaca.Text+chr(39)
    else strcond := ' Where upper(d.placa) = ' +chr(39)+ edtPlaca.Text+chr(39);
  end;

  if CheckBox3.Checked then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and d.POLIZA_ESPECIAL = 1'
    else strcond:=' Where d.POLIZA_ESPECIAL = 1';
  end;
  if CheckBox2.Checked then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and d.FECHA_VENCE_SEGURO '+
    ' Between '+ chr(39)+FormatDatetime('mm/dd/yyyy', edtFechaIniPoliza.Date)+chr(39)+
    ' and ' + chr(39)+FormatDatetime('mm/dd/yyyy', edtFechaFinPoliza.Date)+chr(39)
    else strcond:=strcond + ' Where d.FECHA_VENCE_SEGURO '+
    ' Between '+ chr(39)+FormatDatetime('mm/dd/yyyy', edtFechaIniPoliza.Date)+chr(39)+
    ' and ' + chr(39)+FormatDatetime('mm/dd/yyyy', edtFechaFinPoliza.Date)+chr(39)

  end else
  if not CheckBox1.Checked then
  begin
    if (strcond <> '') then
    strcond:=strcond + ' and i.fecha_ini between ' + chr(39)+FormatDatetime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+chr(39)+FormatDatetime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39)
    else strcond := ' Where i.fecha_ini between ' + chr(39)+FormatDatetime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+chr(39)+FormatDatetime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end;
  if _usesqlBase1 then
  qryDatos.SQL.Text:=qryDatos_Base1.SQL.Text+strcond
  else
  qryDatos.SQL.Text:=qryDatos_Base.SQL.Text+strcond;
  qryDatos.Open;
end;

procedure TfrmConsultaCertAvanzada.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (not qryDatosFECHA_VENCE_SEGURO.IsNull) then
  if (qryDatosFECHA_VENCE_SEGURO.Value < now) then
  begin
    Background:= $0091F7F1;
    lblPolVda.Visible:=true;
    AFont.Color:=clBlack;
  end;
  if (qryDatosESPECIAL.Value = 1) then
  begin
    Background:= $00F7B3B8;
    lblPolEsp.Visible:=true;
    AFont.Color:=clWhite;
  end;
end;

end.
