unit UFormEnviarEmailCertificadosGMovil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, RxDBCtrl, RxCtrls, DB, Buttons,
  WinSkinData, QuickRpt;

type
  TfrmEnviaEmailCertificadosGM = class(TForm)
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
    notEmailSet : smallint;
  end;

var
  frmEnviaEmailCertificadosGM: TfrmEnviaEmailCertificadosGM;

implementation
  uses UDatModClientes, UGlobal, qckRepCertificadoSAM, UDatModFactura,
  UFormEnviarEmail, UDatModCompania, 
  qckRepCertificadoSAMNewP2, qckRepCertificadoSAMNewGM,
  qckRepCertificadoSAMNewP2GMovil, UDatmodDatosGenerales;
  
{$R *.dfm}

procedure TfrmEnviaEmailCertificadosGM.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  RxDBGrid1.SelectAll
  else
  RxDBGrid1.UnselectAll;
end;

procedure TfrmEnviaEmailCertificadosGM.BitBtn1Click(Sender: TObject);
var
   i, j: Integer;
   _clienteMail : String;
begin
  if dmClientes.qryRepCertificadoSamGEMAIL.IsNull then
  begin
    MessageDlg('Cliente no tiene Email asignado, verifique.', mtInformation,[mbok],0);
    //exit;
  end;
  GlbEnviaEmail := true;
  GlbIDTipoEmail:= 101; //Certificado
  if (Not DirectoryExists('Informes')) then
  CreateDir('Informes');

  _clienteMail:='';

  if RxDBGrid1.SelectedRows.Count>0 then
  with RxDBGrid1.DataSource.DataSet do
  for i:=0 to RxDBGrid1.SelectedRows.Count-1 do
  begin
    GotoBookmark(pointer(RxDBGrid1.SelectedRows.Items[i]));
    if dmClientes.qryRepCertificadoSamGEMAIL.IsNull then
    continue;

    _clienteMail:= dmClientes.qryRepCertificadoSamGEMAIL.Value;
    GlbTIPOAFILIADO:=dmClientes.qryRepCertificadoSamGTIPO_AFILIACION.AsString;
    dmDatos.tblTipoAfiliado.close;
    dmDatos.tblTipoAfiliado.open;
    try
      if dmDatos.tblTipoAfiliado.locate('IDTIPO',GlbTIPOAFILIADO,[]) then
      begin
        GlbCartaPresenta:=dmdatos.tblTipoAfiliadoRUTACARTABIENVENIDA.Value;
      end else
      begin
        GlbCartaPresenta:='';
        //GlbCartaPresenta:=frmtrgtr.tRegistroGlbCartaPresenta.Value;
        //GLBRutaImpGarantia:=frmtrgtr.tRegistroEXEGARANTIAMOVIL.Value;
      end;
    except
    GlbCartaPresenta:='';
    end;

    dmClientes._XCodCte := dmClientes.qryRepCertificadoSamGCODIGO_CTE.Value;
    dmclientes._GARANTIANUM:= dmClientes.qryRepCertificadoSamGGARANTIANUM.AsString;
    dmClientes.qryRepCertificadoSamG.Filtered:=True;
    qckCertificadoSamNewGMovil:=TqckCertificadoSamNewGMovil.Create(Nil);
    qckCertificadoSamNewGMovil.Prepare;
    GlbEnviaEmailDirecto:=False;
    //qckCertificadoSam.Preview;
    try
      qckCertificadoSamNewGMovil:= TqckCertificadoSamNewGMovil.Create(nil);
      qckCertificadoSamNewP2GMovil:= TqckCertificadoSamNewP2GMovil.Create(nil);
      try
        ReportExportEstandarGSam(qckCertificadoSamNewGMovil,qckCertificadoSamNewP2GMovil,
        GlbRutaInformes + 'Sam_CertificadoGMovilNum'+
        dmClientes.qryRepCertificadoSamGGARANTIANUM.AsString+'.pdf');
      finally
      end;

      GlbNombreArchivo:= glbZipFile;

      dmClientes.qryRepCertificadoSamG.Filtered:=False;
    finally
    end;
  end;
  if ((glbZipFile <> '') And (Not GlbEnviaEmailDirecto) ) then
  begin
    if FileExists(glbZipFile) then
    begin
      //if (GlbNombreArchivoRev <> '') then
      GlbNombreArchivo:=glbZipFile;//+';'+GlbNombreArchivoRev;
      frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
      try
        GlbIDTipoEmail := 101; //Certificado Garantia
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

procedure TfrmEnviaEmailCertificadosGM.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEnviaEmailCertificadosGM.BitBtn3Click(Sender: TObject);
begin
  dmclientes._GARANTIANUM:= dmClientes.qryRepCertificadoSamGGARANTIANUM.AsString;
  dmClientes.qryRepCertificadoSamG.Filtered:=False;
  dmClientes.qryRepCertificadoSamG.Filtered:=True;
  //dmClientes.qryRepCertificadoSamG.sql.text
  qckCertificadoSamNewGMovil := TqckCertificadoSamNewGMovil.Create(Nil);
  try

    qckCertificadoSamNewGMovil.Preview;

    GlbEnviaEmail:=False;
    GLBMostrarArchivo:=True;
    if CheckBox2.Checked then
    begin
      //Anterior
      ReportExportEstandarG(qckCertificadoSamNewGMovil,
      GlbRutaInformes + 'Sam_CertificadoGMovilNum'+
      dmClientes.qryRepCertificadoSamGGARANTIANUM.AsString+'.pdf');
    end;
  finally
  qckCertificadoSamNewGMovil.free;
  qckCertificadoSamNewGMovil:=Nil;
  //FreeAndNil(qckCertificadoSamNewP2);
  end;
  dmClientes.qryRepCertificadoSamG.Filtered:= False;
  dmclientes._GARANTIANUM:='';
  dmClientes.qryRepCertificadoSamG.Filtered:= True;
end;

procedure TfrmEnviaEmailCertificadosGM.BitBtn4Click(Sender: TObject);
begin
  qckCertificadoSamNewP2GMovil:= TqckCertificadoSamNewP2GMovil.Create(nil);
  try
    qckCertificadoSamNewP2GMovil.Preview;
  finally
  qckCertificadoSamNewP2GMovil.free;
  qckCertificadoSamNewP2GMovil:=nil;
  end;
end;

procedure TfrmEnviaEmailCertificadosGM.RxDBGrid1GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if (dmClientes.qryRepCertificadoSamGNOTIFY_EMAIL.Value = 1) then
  begin
    Background:= clMoneyGreen;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmEnviaEmailCertificadosGM.FormShow(Sender: TObject);
begin
  if notEmailSet = 0 then
  begin
    Label1.Visible:=False;
  end;
end;

end.
