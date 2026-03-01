unit UFormReporteMotoresVeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, RxToolEdit,
  EditNew, DB, IBCustomDataSet, IBQuery, Menus, RxCtrls;

type
  TfrmReportesVehiculos = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    edtCodCte: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    chboxExportarPDF: TCheckBox;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    SkinData1: TSkinData;
    qryRepVehiculos_0: TIBQuery;
    chkEnviarEmail: TCheckBox;
    PopupMenu1: TPopupMenu;
    popConsulta: TMenuItem;
    qckGenReporte: TMenuItem;
    Excel1: TMenuItem;
    edtColor: TEdit;
    Label7: TLabel;
    edtChasis: TEdit;
    Label8: TLabel;
    edtPlaca: TEdit;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    edtmatricula: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RadioGroup2: TRadioGroup;
    procedure ComboBox1Change(Sender: TObject);
    procedure edtCodCteExit(Sender: TObject);
    procedure edtCodCteChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirDatos;
    //procedure ImpCertificado;
  public
    { Public declarations }
  end;

var
  frmReportesVehiculos: TfrmReportesVehiculos;
  qrCriterio : string;

implementation
  uses UDatModConectar, UDatModReportes, UDatModClientes,
  UGlobal, UCompania, UDatModCompania, UFormEnviarEmail, UqckRepVeh,
  UBuscarClientesPersonasP, UFormConsVeh;
  
{$R *.dfm}

procedure TfrmReportesVehiculos.ComboBox1Change(Sender: TObject);
begin
  if qryCliente.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCte.SetInteger(qryClienteCODIGO_CTE.Value);
end;

procedure TfrmReportesVehiculos.edtCodCteExit(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

{not en uso
procedure TfrmReportesPoliza.ImpCertificado();//no en uso
var
  i : integer;
begin
  AbrirDatos;
  if dmclientes.qryRepVehiculos.recordCount = 0 then
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
    dmClientes.qryRepVehiculos.Filtered:=True;
    dmClientes.qryRepVehiculos.Last;
    dmClientes.qryRepVehiculos.First;
    //for i:=0 to dmClientes.qryRepVehiculos.RecordCount - 1 do
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

    //dmClientes.qryRepVehiculos.Next;
    //end;
  end;
end;   }

procedure TfrmReportesVehiculos.edtCodCteChange(Sender: TObject);
begin
  if (edtCodCte.Text <> '') then
  if qryCliente.Locate('CODIGO_CTE', edtCodCte.ValueInteger,[]) then
  ComboBox1.Text := qryClienteNOMBRE_FACTURAR.Value;
end;

procedure TfrmReportesVehiculos.FormCreate(Sender: TObject);
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

  ComboBox1Change(Self);
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
end;

procedure TfrmReportesVehiculos.AbrirDatos;
var
  strCondicion : String;
  strSubCond : string;
begin
  dmClientes.qryRepVehiculos.Close;
  dmClientes.qryRepVehiculos.Filtered:=False;
  dmClientes.qryRepVehiculos.SQL.Clear;

  //if (edtPlaca.Text <> '') then
  strSubCond:= ' Where (upper(PLACA) =' +chr(39) + uppercase(edtPlaca.Text) + chr(39)+')';

  //if (edtColor.Text <> '') And (edtPlaca.Text <> '') then
  strSubCond:= strSubCond + ' or (upper(Color) =' +chr(39) + UpperCase(edtColor.Text) + chr(39)+')';

   //if (edtChasis.Text <> '') And (edtColor.Text <> '') then
  strSubCond:= strSubCond + ' or (upper(CHASSIS) =' +chr(39) + UpperCase(edtChasis.Text) + chr(39)+') ';
  //strSubCond:= strSubCond + ' or (upper(Matricula) =' +chr(39) + UpperCase(edtmatricula.Text) + chr(39)+') ';

  if ((edtPlaca.Text <> '') or (edtColor.Text <> '') or (edtChasis.Text <> '')) then
  strCondicion:=  strSubCond
  else
  {if chkPorVencer.Checked then
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
  end else }
  if RadioGroup1.ItemIndex = 0 then
  begin
    strCondicion:= ' Where CODIGO_CTE = ' + edtCodCte.Text;
    //chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    //' and '+
    //chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if (RadioGroup1.ItemIndex = 1) and (RadioGroup2.ItemIndex = 0) then
  begin
    strCondicion:= ' Where M.FECHA_ASIGNADO  between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if (RadioGroup1.ItemIndex = 1) and (RadioGroup2.ItemIndex = 1) then
  begin
    strCondicion:= ' Where (M.FECHA_ASIGNADO is null) and FECHA_INICIO between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else 
  if RadioGroup1.ItemIndex = 1 then
  begin
    strCondicion:= ' Where FECHA_INICIO between '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39)+
    ' and '+
    chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaFinal.Date)+chr(39);
  end else
  if RadioGroup1.ItemIndex = 1 then
  strCondicion:='';


  dmClientes.qryRepVehiculos.SQL.Text:=
  qryRepVehiculos_0.SQL.Text+
  strCondicion + ' Order by FECHA_INICIO,FICHA';
  dmClientes.qryRepVehiculos.Open;
  Case RadioGroup1.ItemIndex of
  0: qrCriterio:='Por cliente';
  1: qrCriterio:='Por Fecha';
  2: qrCriterio:='Todos';
  end;

  Case RadioGroup2.ItemIndex of
  0: qrCriterio:=qrCriterio+', vendidos.';
  end;

end;

procedure TfrmReportesVehiculos.SpeedButton1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.ShowModal = mrok then
    edtCodCte.Text:= IntToStr(FrmBuscarClientesPersonas.xCodigoCte);
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
end;

procedure TfrmReportesVehiculos.BitBtn3Click(Sender: TObject);
begin
  AbrirDatos;
  frmConsVeh:=TfrmConsVeh.Create(nil);
  try
    frmConsVeh.showmodal;
  finally
  frmConsVeh.free;
  frmConsVeh:=nil
  end;
end;

procedure TfrmReportesVehiculos.BitBtn4Click(Sender: TObject);
var
  _email : string;
begin
  qrCriterio:='';
  AbrirDatos;

  if (dmCompania.tblCompaniaEMAIL.IsNull) then
  _email:=''
  else _email:= dmCompania.tblCompaniaEMAIL.Value;

  qckRepVeh:=TqckRepVeh.Create(nil);
  try
    qckRepVeh.qrCriterio.Caption:= qrCriterio;
    if MessageDlg('Imprimir?',mtInformation,[mbyes,mbno],0) = mrno then
    qckRepVeh.Preview
    else
    begin
      qckRepVeh.PrinterSetup;
      qckRepVeh.Print;
    end;
    if chboxExportarPDF.Checked then
    begin
      GlbEnviaEmail:= chkEnviarEmail.Checked;
      GlbEnviaEmailDirecto:=False;
      ReportExportEstandar(qckRepVeh,GlbRutaInformes+'\ListadoVehiculosMotores'+
      '_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf','Listado de Vehículos',false,_email);

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
             frmEnviarEmail.edtTema.Text         := 'Listado de Vehículos/Motores'+ //GlbRutaInformes+'\ListadoPolizas'+
             '_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf';
             frmEnviarEmail.memMensaje.Lines.Clear;
             frmEnviarEmail.memMensaje.Lines.Add('Relacion de Vehículos/Motores');
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
  qckRepVeh.Free;
  qckRepVeh:= Nil;
  end;
end;

procedure TfrmReportesVehiculos.BitBtn5Click(Sender: TObject);
begin
  AbrirDatos;
  GlbEnviaEmail:= chkEnviarEmail.Checked;
  ExporToExcel(dmClientes.qryRepVehiculos,GlbRutaInformes+'\ListadoVehMotores',true);
  if FileExists(glbZipFile) then
    begin
      frmEnviarEmail:=TfrmEnviarEmail.Create(Nil);
      try
        GlbIDTipoEmail := 100; //Estandar
        GlbEnviaEmail  := chkEnviarEmail.Checked;
        if dmCompania.tblCompania.State = dsInactive then
           dmCompania.tblCompania.Open;
           dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
           frmEnviarEmail._cmdminio:= dmCompania.tblCompaniaNOMBRE.Value;// dmReporte.qryReporteIngACCOUNT_NAME.Value;
           frmEnviarEmail.edtDestinatario.Text := dmCompania.tblCompaniaEMAIL.Value;
           frmEnviarEmail.edtTema.Text         := 'Listado de Vehículos';//;+ //GlbRutaInformes+'\ListadoPolizas'+
           //'_Al'+ FormatDateTime('dd-mmm-yy', ExtraerFecha(Now))+'.pdf';
           frmEnviarEmail.memMensaje.Lines.Clear;
           frmEnviarEmail.memMensaje.Lines.Add('Relacion de Vehículos');
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

end.
