unit UFormConsultaCertificados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, RxToolEdit,
  EditNew, DB, IBCustomDataSet, IBQuery;

type
  TfrmConsultaCertificados = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    edtCodCte: TEditN;
    ComboBox2: TComboBox;
    edtCodigoAgencia: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    chboxExportarPDF: TCheckBox;
    edtNumCertificado: TEditN;
    Label6: TLabel;
    ComboBox3: TComboBox;
    edtCodigoDealer: TEditN;
    chkVencido: TCheckBox;
    chkPorVencer: TCheckBox;
    BitBtn3: TBitBtn;
    qryAgencia: TIBQuery;
    qryDealer: TIBQuery;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    qryAgenciaCODIGO_AGENCIA: TIntegerField;
    qryAgenciaDESCRIPCION: TIBStringField;
    qryDealerCODIGO_DEALER: TIntegerField;
    qryDealerDESCRIPCION: TIBStringField;
    SkinData1: TSkinData;
    qryRepCertificadoSam_0: TIBQuery;
    CheckBox2: TCheckBox;
    chkEnviarEmail: TCheckBox;
    edtColor: TEdit;
    edtChasis: TEdit;
    Label8: TLabel;
    edtPlaca: TEdit;
    Label9: TLabel;
    Label7: TLabel;
    chboxPolizaEspecial: TCheckBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodigoAgenciaExit(Sender: TObject);
    procedure edtCodCteExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure edtCodCteChange(Sender: TObject);
    procedure edtCodigoAgenciaChange(Sender: TObject);
    procedure edtCodigoDealerChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkVencidoClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirDatos;
  public
    { Public declarations }
  end;

var
  frmConsultaCertificados: TfrmConsultaCertificados;

implementation
  uses UDatModConectar, UDatModReportes, UDatModClientes,
  qckRepCertificadoSAM, UFormEnviarEmailCertificados;
  
{$R *.dfm}

procedure TfrmConsultaCertificados.ComboBox1Change(Sender: TObject);
begin
  if qryCliente.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCte.SetInteger(qryClienteCODIGO_CTE.Value);
end;

procedure TfrmConsultaCertificados.ComboBox2Change(Sender: TObject);
begin
  if qryAgencia.Locate('DESCRIPCION',ComboBox2.Text,[]) then
  edtCodigoAgencia.SetInteger(qryAgenciaCODIGO_AGENCIA.Value);
end;

procedure TfrmConsultaCertificados.edtCodigoAgenciaExit(Sender: TObject);
begin
  if (edtCodigoAgencia.Text <> '') then
  if qryAgencia.Locate('CODIGO_AGENCIA', edtCodigoAgencia.ValueInteger,[]) then
  ComboBox2.Text := qryAgenciaDESCRIPCION.Value;
end;

procedure TfrmConsultaCertificados.edtCodCteExit(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

procedure TfrmConsultaCertificados.BitBtn3Click(Sender: TObject);
var
  i : integer;
begin
  AbrirDatos;
  if dmclientes.qryRepCertificadoSam.recordCount = 0 then
  begin
    MessageDlg('Cliente no existe, verifique.', mtInformation,[mbok],0);
    exit;
  end;

  if (chkEnviarEmail.Checked) then
  begin
    frmEnviaEmailCertificados:= TfrmEnviaEmailCertificados.Create(nil);
    try
      frmEnviaEmailCertificados.BitBtn1.Visible  :=True;
      frmEnviaEmailCertificados.BitBtn3.Visible  :=False;
      frmEnviaEmailCertificados.CheckBox2.Checked:=True;
      //frmEnviaEmailCertificados.BitBtn3Click(Self);
      if chkEnviarEmail.Checked then
      begin
        if (dmClientes.qryRepCertificadoSamEMAIL.Value = '') OR
        (dmClientes.qryRepCertificadoSamEMAIL.IsNull) then
        frmEnviaEmailCertificados.notEmailSet:=0
        else
        frmEnviaEmailCertificados.notEmailSet:=1;
      end;
      frmEnviaEmailCertificados.ShowModal;
    finally
    frmEnviaEmailCertificados.free;
    frmEnviaEmailCertificados:=nil;
    end;
  end else
  begin
    dmClientes._XCodCte := dmClientes.qryRepCertificadoSamCodigo_Cte.Value;
    dmClientes.qryRepCertificadoSam.Filtered:=True;
    dmClientes.qryRepCertificadoSam.Last;
    dmClientes.qryRepCertificadoSam.First;
    //for i:=0 to dmClientes.qryRepCertificadoSam.RecordCount - 1 do
    //begin

    frmEnviaEmailCertificados:= TfrmEnviaEmailCertificados.Create(Nil);
    try
      frmEnviaEmailCertificados.BitBtn3.Left:= frmEnviaEmailCertificados.BitBtn1.Left;
      frmEnviaEmailCertificados.BitBtn3.Visible:=True;
      frmEnviaEmailCertificados.BitBtn1.Visible:=False;
      frmEnviaEmailCertificados.ShowModal;
    finally
    frmEnviaEmailCertificados.Free;
    frmEnviaEmailCertificados:= Nil;
    end;

    //dmClientes.qryRepCertificadoSam.Next;
    //end;
  end;
end;

procedure TfrmConsultaCertificados.ComboBox3Change(Sender: TObject);
begin
  if qryDealer.Locate('DESCRIPCION', ComboBox3.Text,[]) then
  edtCodigoDealer.SetInteger(qryDealerCODIGO_DEALER.Value);
end;

procedure TfrmConsultaCertificados.edtCodCteChange(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

procedure TfrmConsultaCertificados.edtCodigoAgenciaChange(Sender: TObject);
begin
  if (edtCodigoAgencia.Text <> '') then
  if qryAgencia.Locate('CODIGO_AGENCIA', edtCodigoAgencia.ValueInteger,[]) then
  ComboBox2.Text := qryAgenciaDESCRIPCION.Value;
end;

procedure TfrmConsultaCertificados.edtCodigoDealerChange(Sender: TObject);
begin
  if (edtCodigoDealer.Text <> '') then
  if qryDealer.Locate('CODIGO_DEALER', edtCodigoDealer.ValueInteger,[]) then
  ComboBox3.Text := qryDealerDESCRIPCION.Value;
end;

procedure TfrmConsultaCertificados.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := Now;
  dbEditFechaFinal.Date := Now;
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

procedure TfrmConsultaCertificados.AbrirDatos;
var
  strCondicion : String;
  strSubCond : string;
begin
  dmClientes.qryRepCertificadoSam.Close;
  dmClientes.qryRepCertificadoSam.Filtered:=False;
  dmClientes.qryRepCertificadoSam.SQL.Clear;
    //if (edtPlaca.Text <> '') then

  strSubCond:= ' Where ((upper(d.PLACA) =' +chr(39) + UpperCase(edtPlaca.Text) + chr(39)+')';

  //if (edtColor.Text <> '') And (edtPlaca.Text <> '') then
  strSubCond:= strSubCond + ' or (upper(d.Color) =' +chr(39) + UpperCase(edtColor.Text) + chr(39)+')';

   //if (edtChasis.Text <> '') And (edtColor.Text <> '') then
  strSubCond:= strSubCond + ' or (upper(d.CHASSIS) =' +chr(39) + UpperCase(edtChasis.Text) + chr(39)+')) ';

  if ((edtPlaca.Text <> '') or (edtColor.Text <> '') or (edtChasis.Text <> '')) then
  strCondicion:=  strSubCond
  else 
  if chkPorVencer.Checked then
  begin
    strCondicion:= ' Where d.FECHA_VENCE_SEGURO between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if chkVencido.Checked then
  begin
    strCondicion:= ' Where d.FECHA_VENCE_SEGURO > '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 0 then
  begin
    if not CheckBox2.Checked then
    strCondicion:= ' Where r.CODIGO_CTE = ' + edtCodCte.Text
    else
    strCondicion:= ' Where r.CODIGO_CTE = ' + edtCodCte.Text+
    ' d.FECHA_VENCE_SEGURO Between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 1 then
  begin
    if not CheckBox2.Checked then
    strCondicion:= ' Where d.CODIGO_AGENCIA = '+edtCodigoAgencia.Text
    else
    strCondicion:= ' Where d.CODIGO_AGENCIA = '+edtCodigoAgencia.Text+
    ' d.FECHA_VENCE_SEGURO Between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end  else
  if RadioGroup1.ItemIndex = 2 then
  begin
    if not CheckBox2.Checked then
    strCondicion:= ' Where d.CODIGO_DEALER = ' + edtCodigoDealer.Text
    else
    strCondicion:= ' Where d.CODIGO_DEALER = ' + edtCodigoDealer.Text+
    ' d.FECHAFIN Between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 3 then
  begin
    strCondicion:= ' Where d.FECHA_VENCE_SEGURO between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 4 then
  begin
    strCondicion:= ' Where d.NUM_CERTIFICADO = '+edtNumCertificado.Text;
  end else
  if RadioGroup1.ItemIndex = 5 then
  strCondicion := '';

  if chboxPolizaEspecial.Checked then
  strCondicion := ' Where d.Poliza_Especial = 1';
     
  dmClientes.qryRepCertificadoSam.SQL.Text:=
  qryRepCertificadoSam_0.SQL.Text+
  strCondicion;
  dmClientes.qryRepCertificadoSam.Open;
end;

procedure TfrmConsultaCertificados.chkVencidoClick(Sender: TObject);
begin
  if chkVencido.Checked then
  begin
    CheckBox2.Checked   := false;
    chkPorVencer.Checked:= false;
  end;
end;

procedure TfrmConsultaCertificados.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 5 then
  begin
    chkVencido.Checked  := False;
    chkPorVencer.Checked:= False;
    CheckBox2.Checked   := False;
  end;
end;

end.
