unit UFormEnviarEmailCertificados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, RxDBCtrl, RxCtrls, DB, Buttons,
  WinSkinData, QuickRpt;

type
  TfrmEnviaEmailCertificados = class(TForm)
    RxDBGrid1: TRxDBGrid;
    CheckBox1: TCheckBox;
    dsqryRepCertificadoSam: TDataSource;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    CheckBox2: TCheckBox;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormShow(Sender: TObject);
    //procedure QRCompositeReport1AddReports(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    notEmailSet:smallint;
  end;

var
  frmEnviaEmailCertificados: TfrmEnviaEmailCertificados;

implementation
  uses UDatModClientes, UGlobal, qckRepCertificadoSAM, UDatModFactura,
  UFormEnviarEmail, UDatModCompania, qckRepCertificadoSAMNew,
  qckRepCertificadoSAMNewP2, UDatmodDatosGenerales;
  
{$R *.dfm}

procedure TfrmEnviaEmailCertificados.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  RxDBGrid1.SelectAll
  else
  RxDBGrid1.UnselectAll;
end;

procedure TfrmEnviaEmailCertificados.BitBtn1Click(Sender: TObject);
var
   i, j: Integer;
   _clienteMail : String;
begin
  if dmClientes.qryRepCertificadoSamEMAIL.IsNull then
  begin
    MessageDlg('Cliente no tiene Email asignado, verifique.', mtInformation,[mbok],0);
    exit;
  end;
  GlbEnviaEmail := true;
  GlbIDTipoEmail:= 100; //Detalle NCF
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');

  _clienteMail:='';

  if RxDBGrid1.SelectedRows.Count>0 then
  with RxDBGrid1.DataSource.DataSet do
  for i:=0 to RxDBGrid1.SelectedRows.Count-1 do
  begin
    GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
    if dmClientes.qryRepCertificadoSamEMAIL.IsNull then
    continue;

    _clienteMail:= dmClientes.qryRepCertificadoSamEMAIL.Value;

    dmClientes._XCodCte := dmClientes.qryRepCertificadoSamCodigo_Cte.Value;
    dmclientes._chassis:= dmClientes.qryRepCertificadoSamCHASSIS.Value;
    dmClientes.qryRepCertificadoSam.Filtered:=True;
    qckCertificadoSamNew:=TqckCertificadoSamNew.Create(Nil);
    qckCertificadoSamNew.Prepare;
    GlbEnviaEmailDirecto:=False;
    //qckCertificadoSam.Preview;
    try
      qckCertificadoSamNewP2:= TqckCertificadoSamNewP2.Create(nil);
      try
        ReportExportEstandar(
        qckCertificadoSamNewP2, GlbRutaInformes+'\Sam_CertificadoPoliticas'+
        dmClientes.qryRepCertificadoSamNUMPOLIZA_CERT.AsString+'.pdf'
        ,'Certificado',false, dmClientes.qryRepCertificadoSamEMAIL.Value); 
      finally
      qckCertificadoSamNewP2.free;
      qckCertificadoSamNewP2:=nil;
      end;
      
      ReportExportEstandar(
      qckCertificadoSamNew, GlbRutaInformes+'\Sam_Certificado'+
      dmClientes.qryRepCertificadoSamNUMPOLIZA_CERT.AsString+'.pdf'
      ,'Certificado',false, dmClientes.qryRepCertificadoSamEMAIL.Value);
      dmClientes.qryRepCertificadoSam.Filtered:=False;
    finally
    qckCertificadoSamNew.free;
    qckCertificadoSamnew:=Nil;
    end;
    dmClientes.qryRepCertificadoSam.Filtered:=False;
  end;
  if ((glbZipFile <> '') And (Not GlbEnviaEmailDirecto) ) then
  begin
    if FileExists(glbZipFile) then
    begin
      //if (GlbNombreArchivoRev <> '') then
      GlbNombreArchivo:=glbZipFile;//+';'+GlbNombreArchivoRev;
      frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
      try
        GlbIDTipoEmail := 100; //Estandar
        GlbEnviaEmail:= BitBtn1.Visible;
        if dmCompania.tblCompania.State = dsInactive then
           dmCompania.tblCompania.Open;
           //dmCompania.tblCompania.close;

           dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);

           frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;// dmReporte.qryReporteIngACCOUNT_NAME.Value;

           frmEnviarEmail.edtDestinatario.Text := Trim(_clienteMail); //dmCompania.tblCompaniaEMAIL.Value;
           frmEnviarEmail.edtTema.Text         := 'Certificado';//;+ //GlbRutaInformes+'\ListadoPolizas'+
           //'_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf';
           frmEnviarEmail.memMensaje.Lines.Clear;
           frmEnviarEmail.memMensaje.Lines.Add('Certificado');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');
           frmEnviarEmail.memMensaje.Lines.Add('');

           frmEnviarEmail.Showmodal;
           if frmEnviarEmail._EmailEnviado then
         begin
           dmdatos.tblDatosNotifyGEmail.close;
           dmdatos.tblDatosNotifyGEmail.params[0].Value:=dmClientes.qryRepCertificadoSamCHASSIS.Value; //chassis
           dmdatos.tblDatosNotifyGEmail.params[0].Value:=dmClientes.qryRepCertificadoSamnumero.Value; //numero
           dmdatos.tblDatosNotifyGEmail.Open;
           if (dmdatos.tblDatosNotifyGEmail.RecordCount > 0) then
           begin
             dmdatos.tblDatosNotifyGEmailNOTIFY_EMAIL.Value:=1;
             GlbSalvarQuery(dmdatos.tblDatosNotifyGEmail);
           end;
         end;
         finally
         frmEnviarEmail.Free;
         frmEnviarEmail:= Nil;
         end;
         GlbNombreArchivoRev:='';
      end;
  end;
  GlbIDTipoEmail:=0;
  dmclientes._chassis :='';
end;

procedure TfrmEnviaEmailCertificados.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEnviaEmailCertificados.BitBtn3Click(Sender: TObject);
begin
  dmclientes._chassis:= dmClientes.qryRepCertificadoSamCHASSIS.Value;
  dmClientes.qryRepCertificadoSam.Filtered:=False;
  dmClientes.qryRepCertificadoSam.Filtered:=True;
  
  qckCertificadoSamNew  := TqckCertificadoSamNew.Create(Nil);
  try

    qckCertificadoSamNew.Preview;

    GlbEnviaEmail:=False;
    GLBMostrarArchivo:=True;
    if CheckBox2.Checked then
    begin
      //Anterior
      ReportExportEstandarG(qckCertificadoSamNew,
      GlbRutaInformes + '\Sam_Certificado'+
      dmClientes.qryRepCertificadoSamNUMPOLIZA_CERT.AsString+'_'+dmClientes.qryRepCertificadoSamPLACA.AsString+'.pdf');
    end;
  finally
  qckCertificadoSamNew.free;
  qckCertificadoSamNew:=Nil;
  //FreeAndNil(qckCertificadoSamNewP2);
  end;
  dmClientes.qryRepCertificadoSam.Filtered:= False;
  dmclientes._chassis:='';
  dmClientes.qryRepCertificadoSam.Filtered:= True;
end;

procedure TfrmEnviaEmailCertificados.BitBtn4Click(Sender: TObject);
begin
  qckCertificadoSamNewP2:= TqckCertificadoSamNewP2.Create(nil);
  try
    qckCertificadoSamNewP2.Preview;
  finally
  qckCertificadoSamNewP2.free;
  qckCertificadoSamNewP2:=nil;
  end;
end;

procedure TfrmEnviaEmailCertificados.RxDBGrid1GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (dmClientes.qryRepCertificadoSamNOTIFY_EMAIL.Value = 1) then
  begin
    Background:= clMoneyGreen;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmEnviaEmailCertificados.FormShow(Sender: TObject);
begin
  if notEmailSet = 0 then
  begin
    Label1.Visible:=False;
  end;
end;

end.
