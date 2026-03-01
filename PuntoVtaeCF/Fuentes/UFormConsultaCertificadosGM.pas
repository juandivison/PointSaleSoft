unit UFormConsultaCertificadosGM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, RxToolEdit,
  EditNew, DB, IBCustomDataSet, IBQuery;

type
  TfrmConsultaCertificadosGMovil = class(TForm)
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
    edtNumGarantia: TEditN;
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
    edtMarca: TEdit;
    Label8: TLabel;
    edtModelo: TEdit;
    Label9: TLabel;
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
  frmConsultaCertificadosGMovil: TfrmConsultaCertificadosGMovil;

implementation
  uses UDatModConectar, UDatModReportes, UDatModClientes,
  UFormEnviarEmailCertificadosGMovil;

  
{$R *.dfm}

procedure TfrmConsultaCertificadosGMovil.ComboBox1Change(Sender: TObject);
begin
  if qryCliente.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCte.SetInteger(qryClienteCODIGO_CTE.Value);
end;

procedure TfrmConsultaCertificadosGMovil.ComboBox2Change(Sender: TObject);
begin
  //if qryAgencia.Locate('DESCRIPCION',ComboBox2.Text,[]) then
  //edtCodigoAgencia.SetInteger(qryAgenciaCODIGO_AGENCIA.Value);
end;

procedure TfrmConsultaCertificadosGMovil.edtCodigoAgenciaExit(Sender: TObject);
begin
  if (edtCodigoAgencia.Text <> '') then
  if qryAgencia.Locate('CODIGO_AGENCIA', edtCodigoAgencia.ValueInteger,[]) then
  ComboBox2.Text := qryAgenciaDESCRIPCION.Value;
end;

procedure TfrmConsultaCertificadosGMovil.edtCodCteExit(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

procedure TfrmConsultaCertificadosGMovil.BitBtn3Click(Sender: TObject);
var
  i : integer;
begin
  AbrirDatos;
  if dmclientes.qryRepCertificadoSamG.recordCount = 0 then
  begin
    MessageDlg('Cliente no existe, verifique.', mtInformation,[mbok],0);
    exit;
  end;

  if (chkEnviarEmail.Checked) then
  begin
    frmEnviaEmailCertificadosGM:= TfrmEnviaEmailCertificadosGM.Create(nil);
    try
      frmEnviaEmailCertificadosGM.BitBtn1.Visible  :=True;
      frmEnviaEmailCertificadosGM.BitBtn3.Visible  :=False;
      frmEnviaEmailCertificadosGM.CheckBox2.Checked:=True;
      if chkEnviarEmail.Checked then
      begin
        if (dmClientes.qryRepCertificadoSamGEMAIL.Value = '') OR
        (dmClientes.qryRepCertificadoSamGEMAIL.IsNull) then
        frmEnviaEmailCertificadosGM.notEmailSet:=0
        else
        frmEnviaEmailCertificadosGM.notEmailSet:=1;
      end;
      frmEnviaEmailCertificadosGM.ShowModal;
    finally
    frmEnviaEmailCertificadosGM.free;
    frmEnviaEmailCertificadosGM:=nil;
    end;
  end else
  begin
    dmClientes._XCodCte := dmClientes.qryRepCertificadoSamGCodigo_Cte.Value;
    dmClientes.qryRepCertificadoSamG.Filtered:=True;
    dmClientes.qryRepCertificadoSamG.Last;
    dmClientes.qryRepCertificadoSamG.First;
    //for i:=0 to dmClientes.qryRepCertificadoSam.RecordCount - 1 do
    //begin

    frmEnviaEmailCertificadosGM:= TfrmEnviaEmailCertificadosGM.Create(Nil);
    try
      frmEnviaEmailCertificadosGM.BitBtn3.Left:= frmEnviaEmailCertificadosGM.BitBtn1.Left;
      frmEnviaEmailCertificadosGM.BitBtn3.Visible:=True;
      frmEnviaEmailCertificadosGM.BitBtn1.Visible:=False;
      frmEnviaEmailCertificadosGM.ShowModal;
    finally
    frmEnviaEmailCertificadosGM.Free;
    frmEnviaEmailCertificadosGM:= Nil;
    end;

    //dmClientes.qryRepCertificadoSam.Next;
    //end;
  end;
end;

procedure TfrmConsultaCertificadosGMovil.ComboBox3Change(Sender: TObject);
begin
  if qryDealer.Locate('DESCRIPCION', ComboBox3.Text,[]) then
  edtCodigoDealer.SetInteger(qryDealerCODIGO_DEALER.Value);
end;

procedure TfrmConsultaCertificadosGMovil.edtCodCteChange(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

procedure TfrmConsultaCertificadosGMovil.edtCodigoAgenciaChange(Sender: TObject);
begin
  if (edtCodigoAgencia.Text <> '') then
  if qryAgencia.Locate('CODIGO_AGENCIA', edtCodigoAgencia.ValueInteger,[]) then
  ComboBox2.Text := qryAgenciaDESCRIPCION.Value;
end;

procedure TfrmConsultaCertificadosGMovil.edtCodigoDealerChange(Sender: TObject);
begin
  if (edtCodigoDealer.Text <> '') then
  if qryDealer.Locate('CODIGO_DEALER', edtCodigoDealer.ValueInteger,[]) then
  ComboBox3.Text := qryDealerDESCRIPCION.Value;
end;

procedure TfrmConsultaCertificadosGMovil.FormCreate(Sender: TObject);
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

  //qryAgencia.Close;
  //qryAgencia.Open;
  //qryAgencia.First;
  //while not qryAgencia.eof do
  //begin
  //  ComboBox2.Items.Add(qryAgenciaDESCRIPCION.Value);
  //  qryAgencia.next;
  //end;
  //qryAgencia.First;
  //ComboBox2.Text:=qryAgenciaDESCRIPCION.Value;

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
  //ComboBox2Change(Self);
  ComboBox1Change(Self);
end;

procedure TfrmConsultaCertificadosGMovil.AbrirDatos;
var
  strCondicion : String;
  strSubCond : string;
begin
  dmClientes.qryRepCertificadoSamG.Close;
  dmClientes.qryRepCertificadoSamG.Filtered:=False;
  dmClientes.qryRepCertificadoSamG.SQL.Clear;

  strSubCond:= ' Where ((upper(d.Modelo) =' +chr(39) + UpperCase(edtModelo.Text) + chr(39)+')';

  //strSubCond:= strSubCond + ' or (upper(d.Color) =' +chr(39) + UpperCase(edtColor.Text) + chr(39)+')';

  strSubCond:= strSubCond + ' or (upper(d.Marca) =' +chr(39) + UpperCase(edtMarca.Text) + chr(39)+')) ';

  if ((edtModelo.Text <> '') or (edtMarca.Text <> '')) then
  strCondicion:=  strSubCond
  else 
  if chkPorVencer.Checked then
  begin
    strCondicion:= ' Where d.FECHAVENCE between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if chkVencido.Checked then
  begin
    strCondicion:= ' Where d.FECHAVENCE > '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 0 then
  begin
    if not CheckBox2.Checked then
    strCondicion:= ' Where r.CODIGO_CTE = ' + edtCodCte.Text
    else
    strCondicion:= ' Where r.CODIGO_CTE = ' + edtCodCte.Text+
    ' d.FECHAVENCE Between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 1 then
  begin
    if not CheckBox2.Checked then
    strCondicion:= ' Where d.CODIGO_DEALER = '+edtCodigoAgencia.Text
    else
    strCondicion:= ' Where d.CODIGO_DEALER = '+edtCodigoAgencia.Text+
    ' d.FECHA_VENCE_SEGURO Between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end  else
  {if RadioGroup1.ItemIndex = 2 then
  begin
    if not CheckBox2.Checked then
    strCondicion:= ' Where d.CODIGO_DEALER = ' + edtCodigoDealer.Text
    else
    strCondicion:= ' Where d.CODIGO_DEALER = ' + edtCodigoDealer.Text+
    ' d.FECHAVENCE Between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else  }
  if RadioGroup1.ItemIndex = 2 then
  begin
    strCondicion:= ' Where d.FECHAVENCE between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 3 then
  begin
    strCondicion:= ' Where d.GARANTIANUM = '+edtNumGarantia.Text;
  end else
  if RadioGroup1.ItemIndex =4 then
  strCondicion := '';

  if chboxPolizaEspecial.Checked then
  strCondicion := ' Where d.Poliza_Especial = 1';
     
  dmClientes.qryRepCertificadoSamG.SQL.Text:=
  qryRepCertificadoSam_0.SQL.Text+
  strCondicion;
  dmClientes.qryRepCertificadoSamG.Open;
end;

procedure TfrmConsultaCertificadosGMovil.chkVencidoClick(Sender: TObject);
begin
  if chkVencido.Checked then
  begin
    CheckBox2.Checked   := false;
    chkPorVencer.Checked:= false;
  end;
end;

procedure TfrmConsultaCertificadosGMovil.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 5 then
  begin
    chkVencido.Checked  := False;
    chkPorVencer.Checked:= False;
    CheckBox2.Checked   := False;
  end;
end;

end.
