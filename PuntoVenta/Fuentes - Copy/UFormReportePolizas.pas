unit UFormReportePolizas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, RxToolEdit,
  EditNew, DB, IBCustomDataSet, IBQuery, Menus, RxCtrls;

type
  TfrmReportesPoliza = class(TForm)
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
    PopupMenu1: TPopupMenu;
    RxSpeedButton1: TRxSpeedButton;
    popConsulta: TMenuItem;
    qckGenReporte: TMenuItem;
    Excel1: TMenuItem;
    edtColor: TEdit;
    Label7: TLabel;
    edtChasis: TEdit;
    Label8: TLabel;
    edtPlaca: TEdit;
    Label9: TLabel;
    chboxPolizaEspecial: TCheckBox;
    Label10: TLabel;
    edtModeloMarca: TEdit;
    BitBtn1: TBitBtn;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodigoAgenciaExit(Sender: TObject);
    procedure edtCodCteExit(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure edtCodCteChange(Sender: TObject);
    procedure edtCodigoAgenciaChange(Sender: TObject);
    procedure edtCodigoDealerChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkVencidoClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure popConsultaClick(Sender: TObject);
    procedure qckGenReporteClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNumCertificadoExit(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirDatos;
    //procedure ImpCertificado;
  public
    { Public declarations }
  end;

var
  frmReportesPoliza: TfrmReportesPoliza;

implementation
  uses UDatModConectar, UDatModReportes, UDatModClientes,
  qckRepCertificadoSAM, UFormEnviarEmailCertificados, UConsultaPolizas,
  UQckRepPolizas, UGlobal, UCompania, UDatModCompania, UFormEnviarEmail;
  
{$R *.dfm}

procedure TfrmReportesPoliza.ComboBox1Change(Sender: TObject);
begin
  if qryCliente.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCte.SetInteger(qryClienteCODIGO_CTE.Value);
end;

procedure TfrmReportesPoliza.ComboBox2Change(Sender: TObject);
begin
  if qryAgencia.Locate('DESCRIPCION',ComboBox2.Text,[]) then
  edtCodigoAgencia.SetInteger(qryAgenciaCODIGO_AGENCIA.Value);
end;

procedure TfrmReportesPoliza.edtCodigoAgenciaExit(Sender: TObject);
begin
  if (edtCodigoAgencia.Text <> '') then
  if qryAgencia.Locate('CODIGO_AGENCIA', edtCodigoAgencia.ValueInteger,[]) then
  ComboBox2.Text := qryAgenciaDESCRIPCION.Value;
end;

procedure TfrmReportesPoliza.edtCodCteExit(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  begin
    ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
    RadioGroup1.ItemIndex:=0;
  end;
end;

{not en uso
procedure TfrmReportesPoliza.ImpCertificado();//no en uso
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
      frmEnviaEmailCertificados.BitBtn1.Visible:=True;
      frmEnviaEmailCertificados.BitBtn3.Visible:=False;
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
end;   }

procedure TfrmReportesPoliza.ComboBox3Change(Sender: TObject);
begin
  if qryDealer.Locate('DESCRIPCION', ComboBox3.Text,[]) then
  edtCodigoDealer.SetInteger(qryDealerCODIGO_DEALER.Value);
end;

procedure TfrmReportesPoliza.edtCodCteChange(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

procedure TfrmReportesPoliza.edtCodigoAgenciaChange(Sender: TObject);
begin
  if (edtCodigoAgencia.Text <> '') then
  if qryAgencia.Locate('CODIGO_AGENCIA', edtCodigoAgencia.ValueInteger,[]) then
  ComboBox2.Text := qryAgenciaDESCRIPCION.Value;
end;

procedure TfrmReportesPoliza.edtCodigoDealerChange(Sender: TObject);
begin
  if (edtCodigoDealer.Text <> '') then
  if qryDealer.Locate('CODIGO_DEALER', edtCodigoDealer.ValueInteger,[]) then
  ComboBox3.Text := qryDealerDESCRIPCION.Value;
end;

procedure TfrmReportesPoliza.FormCreate(Sender: TObject);
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
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
end;

procedure TfrmReportesPoliza.AbrirDatos;
var
  strCondicion : String;
  strSubCond : string;
begin
  dmClientes.qryRepCertificadoSam.Close;
  dmClientes.qryRepCertificadoSam.Filtered:=False;
  dmClientes.qryRepCertificadoSam.SQL.Clear;

  //if (edtPlaca.Text <> '') then
  strSubCond:= ' Where ((upper(d.PLACA) =' +chr(39) + uppercase(edtPlaca.Text) + chr(39)+')';

  strSubCond:= strSubCond + ' or (upper(d.Color) =' +chr(39) + UpperCase(edtColor.Text) + chr(39)+')';

  strSubCond:= strSubCond + ' or (upper(d.CHASSIS) =' +chr(39) + UpperCase(edtChasis.Text) + chr(39)+') ';

  strSubCond:= strSubCond + ' or (upper(m.DESCRIPCION) =' +chr(39) + UpperCase(edtModeloMarca.Text) + chr(39)+')) ';

  if ((edtPlaca.Text <> '') or (edtColor.Text <> '') or (edtChasis.Text <> '')
                            or (edtModeloMarca.Text <> '')) then
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
    strCondicion:= ' Where d.FECHA_VENCE_SEGURO < '+
    chr(39)+FormatDateTime('mm/dd/yyyy', now)+chr(39);
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
    ' d.FECHA_VENCE_SEGURO Between '+
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
    //strCondicion:= ' Where d.NUM_CERTIFICADO = '+edtNumCertificado.Text;
    strCondicion:= ' Where (d.NUM_CERTIFICADO = '
    +edtNumCertificado.Text+' or d.NUMPOL ='+edtNumCertificado.Text+')';
  end else
  if RadioGroup1.ItemIndex = 5 then
  begin
    strCondicion := ' Where x.FECING is not null';
  end;

  if chboxPolizaEspecial.Checked then
  strCondicion := ' Where d.Poliza_Especial = 1';

  if (edtModeloMarca.Text <> '') then
  begin
    strCondicion :='';
    if chboxPolizaEspecial.Checked then
    strCondicion := ' Where d.Poliza_Especial = 1';

    if (strCondicion <> '') then
    strCondicion := strCondicion + ' and (upper(m.DESCRIPCION) =' +chr(39) + UpperCase(edtModeloMarca.Text) + chr(39)+')'
    else strCondicion :=' Where (upper(m.DESCRIPCION) =' +chr(39) + UpperCase(edtModeloMarca.Text) + chr(39)+')';
  end;

  if (edtChasis.Text <> '') then
  strCondicion:= ' Where (upper(d.CHASSIS) =' +chr(39) + UpperCase(edtChasis.Text) + chr(39)+') ';
   
  dmClientes.qryRepCertificadoSam.SQL.Text:=
  qryRepCertificadoSam_0.SQL.Text+
  strCondicion + ' Order by CODIGO_DEALER,CODIGO_AGENCIA,NUM_CERTIFICADO,NUMPOLIZA_CERT';
  dmClientes.qryRepCertificadoSam.Open;

  if dmClientes.tblclientes.state = dsInactive then
  begin
    dmClientes.tblclientes.Close;
    dmClientes.tblclientes.Filtered:=False;
    dmClientes.tblclientes.Open;
  end;
end;

procedure TfrmReportesPoliza.chkVencidoClick(Sender: TObject);
begin
  if chkVencido.Checked then
  begin
    CheckBox2.Checked   := false;
    chkPorVencer.Checked:= false;
  end;
end;

procedure TfrmReportesPoliza.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 5 then
  begin
    chkVencido.Checked  := False;
    chkPorVencer.Checked:= False;
    CheckBox2.Checked   := False;
  end;
end;

procedure TfrmReportesPoliza.popConsultaClick(Sender: TObject);
begin
  AbrirDatos;
  frmConsultaPolizas:=TfrmConsultaPolizas.Create(Nil);
  try
    frmConsultaPolizas.ShowModal;
  finally
  frmConsultaPolizas.free;
  frmConsultaPolizas:=nil;
  end;
end;

procedure TfrmReportesPoliza.qckGenReporteClick(Sender: TObject);
var
  _email : string;
begin
  AbrirDatos;

  if (dmCompania.tblCompaniaEMAIL.IsNull) then
  _email:=''
  else _email:= dmCompania.tblCompaniaEMAIL.Value;

  qckRepPolizaSam:=TqckRepPolizaSam.Create(nil);
  try
    if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mrno then
    qckRepPolizaSam.Preview
    else
    begin
      qckRepPolizaSam.PrinterSetup;
      qckRepPolizaSam.Print;
    end;
    if chboxExportarPDF.Checked then
    begin
      GlbEnviaEmail:= chkEnviarEmail.Checked;
      GlbEnviaEmailDirecto:=False;
      ReportExportEstandar(qckrepPolizaSam,GlbRutaInformes+'\ListadoPolizas'+
      '_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf','Listado de Polizas',false,_email);
    if FileExists(glbZipFile) then
    begin
      frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
      try
        GlbIDTipoEmail := 100; //Estandar
        GlbEnviaEmail:= chkEnviarEmail.Checked;
        if dmCompania.tblCompania.State = dsInactive then
           dmCompania.tblCompania.Open;
           dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
           frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;// dmReporte.qryReporteIngACCOUNT_NAME.Value;
           frmEnviarEmail.edtDestinatario.Text := dmCompania.tblCompaniaEMAIL.Value;
           frmEnviarEmail.edtTema.Text         := 'Listado de Póliza'+ //GlbRutaInformes+'\ListadoPolizas'+
           '_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf';
           frmEnviarEmail.memMensaje.Lines.Clear;
           frmEnviarEmail.memMensaje.Lines.Add('Relacion de Ingresos');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');

           frmEnviarEmail.Showmodal;
         finally
         frmEnviarEmail.Free;
         frmEnviarEmail:= Nil;
         end;
      end;
    end;
  finally
  qckRepPolizaSam.free;
  qckRepPolizaSam:=nil;
  end;
end;

procedure TfrmReportesPoliza.Excel1Click(Sender: TObject);
begin
  AbrirDatos;
  GlbEnviaEmail:= chkEnviarEmail.Checked;
  GLBMostrarArchivo:=True;
  ExporToExcel(dmClientes.qryRepCertificadoSam,GlbRutaInformes+'\ListadoPolizas',false);
  if FileExists(glbZipFile) then
    begin
      frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
      try
        GlbIDTipoEmail := 100; //Estandar
        GlbEnviaEmail:= chkEnviarEmail.Checked;
        if dmCompania.tblCompania.State = dsInactive then
           dmCompania.tblCompania.Open;
           dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
           frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;// dmReporte.qryReporteIngACCOUNT_NAME.Value;
           frmEnviarEmail.edtDestinatario.Text := dmCompania.tblCompaniaEMAIL.Value;
           frmEnviarEmail.edtTema.Text         := 'Listado de Póliza';//;+ //GlbRutaInformes+'\ListadoPolizas'+
           //'_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf';
           frmEnviarEmail.memMensaje.Lines.Clear;
           frmEnviarEmail.memMensaje.Lines.Add('Relación de Ingresos');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');

           frmEnviarEmail.Showmodal;
         finally
         frmEnviarEmail.Free;
         frmEnviarEmail:= Nil;
         end;
      end; 
end;

procedure TfrmReportesPoliza.BitBtn1Click(Sender: TObject);
begin
  AbrirDatos;
  if (dmClientes.qryRepCertificadoSam.RecordCount > 0) then
  begin
    dmClientes.tblClientes.Tag := -99;
    if dmclientes.tblClientes.State = dsBrowse then
    begin
      if dmclientes.tblClientes.Locate('CODIGO_CTE', dmClientes.qryRepCertificadoSamCODIGO_CTE.Value,[]) then
      Close;
    end;
  end;
end;

procedure TfrmReportesPoliza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmClientes.tblClientes.state = dsInactive then exit;
  dmClientes.tblClientes.Tag := 0;
  dmClientes.tblClientes.Next;
  dmClientes.tblClientes.Prior;
end;

procedure TfrmReportesPoliza.edtNumCertificadoExit(Sender: TObject);
begin
  if (edtNumCertificado.Text <> '') then
  RadioGroup1.ItemIndex:=4;
end;

end.
