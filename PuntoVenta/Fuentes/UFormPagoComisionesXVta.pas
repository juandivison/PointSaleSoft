unit UFormPagoComisionesXVta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, WinSkinData, DB, Buttons, ComCtrls,
  Grids, DBGrids, RxDBCtrl, DBCtrls;

type
  TfrmPagoComisiones = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    dstblComisionXVta: TDataSource;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    dsqryVentasComisionableSum: TDataSource;
    dsqryVentasComisionables: TDataSource;
    RxDBGrid2: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    RxDBGrid3: TRxDBGrid;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    edtPorcCom: TEdit;
    Label6: TLabel;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    cboxListaVendedores: TComboBox;
    dsqryVendedores: TDataSource;
    cboxVendedoresresumen: TComboBox;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cboxListaVendedoresChange(Sender: TObject);
    procedure cboxVendedoresresumenChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
  private
    { Private declarations }
    function FCantDiasAPagar(fechaini:Tdatetime;fechafin:TDateTime):string;
  public
    { Public declarations }
  end;

var
  frmPagoComisiones: TfrmPagoComisiones;
  _codigoEmpleado : Integer;
  
implementation



uses USelTipoNomIntegrar, UGlobal, UFormNominaEmpleado, UDatModComisiones,
  DateUtils;

{$R *.dfm}

procedure TfrmPagoComisiones.FormCreate(Sender: TObject);
var
  fechaini, fechafin: TDateTime;
begin
  dmComision.qryVendedores.close;
  dmComision.qryVendedores.open;
  cboxListaVendedores.Clear;
  cboxVendedoresresumen.Clear;
  dmComision.qryVendedores.first;
  While Not dmComision.qryVendedores.Eof do
  begin
    cboxListaVendedores.Items.Add(dmComision.qryVendedoresNOMBREVENDEDOR.Value);
    cboxVendedoresresumen.Items.Add(dmComision.qryVendedoresNOMBREVENDEDOR.Value);
    dmComision.qryVendedores.Next;
  end;

  cboxListaVendedores.Text:=dmComision.qryVendedoresNOMBREVENDEDOR.value;
  cboxVendedoresresumen.Text:=dmComision.qryVendedoresNOMBREVENDEDOR.value;
  cboxVendedoresresumenChange(Self);
  cboxListaVendedoresChange(Self);

  frmSelDatosIntegrarNom:=TfrmSelDatosIntegrarNom.Create(Nil);
  try
    if frmSelDatosIntegrarNom.ShowModal = mrOk then
    begin
      glbFechaNom := ExtraerFecha(frmSelDatosIntegrarNom.dtpkFechaNom.Datetime);

      frmSelDatosIntegrarNom.VerificarTipoCia;
      frmSelDatosIntegrarNom.VerificarTipoNomina(frmSelDatosIntegrarNom.xTipoNomina);
      frmNominaEmpleado:=TfrmNominaEmpleado.create(Nil);
      try
        GlbRangoFechaNomina(glbFechaNom,fechaini, fechafin);
        DateTimePicker1.DateTime:=fechaini;
        DateTimePicker2.DateTime:=fechafin;
        dmcomision.qryVentasComisionable.Close;
        dmcomision.qryVentasComisionable.Params[0].value:=ExtraerFecha(fechaini);
        dmcomision.qryVentasComisionable.Params[1].value:=ExtraerFecha(fechafin);
        dmcomision.qryVentasComisionable.Open;
        //frmNominaEmpleado.Showmodal;
      finally
      frmNominaEmpleado.Free;
      frmNominaEmpleado:=Nil;
      end;
    end;
  finally
  frmSelDatosIntegrarNom.free;
  frmSelDatosIntegrarNom:=nil;
  end;
  BitBtn5Click(Self);
  Label9.Caption:= '';
  Label9.Caption:= FCantDiasAPagar(DateTimePicker1.Date,DateTimePicker2.Date);
end;

procedure TfrmPagoComisiones.BitBtn3Click(Sender: TObject);
begin
  dmComision.qryVentasComisionable.Close;
  dmComision.qryVentasComisionable.Params[0].Value:=  ExtraerFecha(DateTimePicker1.Date);
  dmComision.qryVentasComisionable.Params[1].Value:=  ExtraerFecha(DateTimePicker2.Date);
  dmComision.qryVentasComisionable.Open;
  dmComision.tblComisionXVta.Close;
  dmComision.tblComisionXVta.Params[0].Value:=  ExtraerFecha(DateTimePicker1.Date);
  dmComision.tblComisionXVta.Params[1].Value:=  ExtraerFecha(DateTimePicker2.Date);
  dmComision.tblComisionXVta.Open;
end;

procedure TfrmPagoComisiones.BitBtn1Click(Sender: TObject);
begin
  GlbSalvarQuery(dmComision.tblComisionXVta);
end;

procedure TfrmPagoComisiones.BitBtn4Click(Sender: TObject);
begin
  dmComision.tblComisionXVta.Edit;
end;

procedure TfrmPagoComisiones.BitBtn5Click(Sender: TObject);
begin
  BitBtn3Click(self);
end;

procedure TfrmPagoComisiones.BitBtn6Click(Sender: TObject);
begin
  if dmComision.qryVentasComisionableSum.state = dsInactive then exit;
  dmComision.qryVentasComisionableSum.First;
  SpeedButton2Click(Self);
end;

procedure TfrmPagoComisiones.SpeedButton1Click(Sender: TObject);
begin
  BitBtn7Click(Self);
end;

procedure TfrmPagoComisiones.BitBtn7Click(Sender: TObject);
begin
  cboxListaVendedoresChange(Self);
  if dmComision.tblComisionXVta.State = dsInactive then exit;
  if not dmComision.tblComisionXVta.locate('CODIGO_EMPLEADO',dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value,[]) then
  begin
    dmComision.tblComisionXVta.Insert;
    dmComision.tblComisionXVtaTIPO.Value:=0;
    dmComision.tblComisionXVtaCODIGO_EMPLEADO.Value:= dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value;
    dmComision.tblComisionXVtaFECHA_PAGO.Value:= ExtraerFecha(glbFechaNom);
    dmComision.tblComisionXVtaFECHA_INICIO.Value:=ExtraerFecha(DateTimePicker1.Date);
    dmComision.tblComisionXVtaFECHA_FINAL.Value:=ExtraerFecha(DateTimePicker2.Date);
    dmComision.tblComisionXVtaSTATUS.Value:='A';
    dmComision.tblComisionXVtaFECHA_IN.Value:=now;
    dmComision.tblComisionXVtaIN_POR.Value:= strUserName;
    dmComision.tblComisionXVtaMONTO_BASE.Value:=dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;
    dmComision.tblComisionXVtaPORC_COMISION.Value:=StrToFloat(edtPorcCom.Text);
    dmComision.tblComisionXVtaMONTO_COMISION.Value:=
    dmComision.tblComisionXVtaMONTO_BASE.Value * dmComision.tblComisionXVtaPORC_COMISION.Value/100;
  end else
  begin
    dmComision.tblComisionXVta.Edit;
    dmComision.tblComisionXVtaMONTO_BASE.Value:=dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;
    dmComision.tblComisionXVtaPORC_COMISION.Value:=StrToFloat(edtPorcCom.Text);
    dmComision.tblComisionXVtaMONTO_COMISION.Value:=
    dmComision.tblComisionXVtaMONTO_BASE.Value * dmComision.tblComisionXVtaPORC_COMISION.Value/100;
  end;
  GlbSalvarQuery(dmComision.tblComisionXVta);
end;

procedure TfrmPagoComisiones.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmComision.tblComisionXVta.state in [dsedit, dsinsert] then
  begin
    if MessageDlg('Tienes una trasaccion pendiente, aún desea salir',mtinformation,[mbyes, mbno],0) = mrno then
    CanClose:=False
    else
    CanClose:=true;
  end else
  CanClose:=true;
end;

procedure TfrmPagoComisiones.cboxListaVendedoresChange(Sender: TObject);
begin
  if dmComision.qryVentasComisionable.state = dsInactive then exit;
  if dmComision.qryVendedores.Locate('NOMBREVENDEDOR',cboxListaVendedores.Text,[]) then
  begin
    _codigoEmpleado:=dmComision.qryVendedoresCODIGO.Value;
    if dmComision.qryVentasComisionable.Locate('CODIGO_VENDEDOR',_codigoEmpleado,[]) then
    begin
      if CheckBox1.Checked then
      begin
        CheckBox1.Caption:='Filtrado';
        dmComision.codVendedor:=dmComision.qryVentasComisionableCODIGO_VENDEDOR.Value;
        dmComision.qryVentasComisionable.Filtered:=True;
      end;
    end;
    //MessageDlg('No existe, verifique.',mtinformation,[mbok],0);
  end;
end;

procedure TfrmPagoComisiones.cboxVendedoresresumenChange(Sender: TObject);
begin
  if dmComision.qryVentasComisionableSum.State = dsInactive then exit;
  if dmComision.qryVendedores.Locate('NOMBREVENDEDOR',cboxVendedoresresumen.Text,[]) then
  begin
    _codigoEmpleado:=dmComision.qryVendedoresCODIGO.Value;
    dmComision.qryVentasComisionableSum.Locate('CODIGO_VENDEDOR',_codigoEmpleado,[]);
    //MessageDlg('No existe, verifique.',mtinformation,[mbok],0);
  end;
end;

procedure TfrmPagoComisiones.SpeedButton2Click(Sender: TObject);
begin
  if dmComision.qryVentasComisionableSum.State = dsInactive then exit;
  dmComision.qryVentasComisionableSum.first;
  while not dmComision.qryVentasComisionableSum.Eof do
  begin
    if not dmComision.tblComisionXVta.Locate('CODIGO_EMPLEADO;TIPO;FECHA_PAGO;',
    VarArrayOf([dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value,0,ExtraerFecha(glbFechaNom)]),[]) then
    begin
      dmComision.tblComisionXVta.Insert;
      dmComision.tblComisionXVtaTIPO.Value:=0;
      dmComision.tblComisionXVtaCODIGO_EMPLEADO.Value:= dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value;
      dmComision.tblComisionXVtaFECHA_PAGO.Value:= ExtraerFecha(glbFechaNom);
      dmComision.tblComisionXVtaFECHA_INICIO.Value:=ExtraerFecha(DateTimePicker1.Date);
      dmComision.tblComisionXVtaFECHA_FINAL.Value:=ExtraerFecha(DateTimePicker2.Date);
      dmComision.tblComisionXVtaSTATUS.Value:='A';
      dmComision.tblComisionXVtaFECHA_IN.Value:=now;
      dmComision.tblComisionXVtaIN_POR.Value:= strUserName;
      dmComision.tblComisionXVtaMONTO_BASE.Value:=dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;
      dmComision.tblComisionXVtaPORC_COMISION.Value:=StrToFloat(edtPorcCom.Text);
      dmComision.tblComisionXVtaMONTO_COMISION.Value:=
      dmComision.tblComisionXVtaMONTO_BASE.Value * dmComision.tblComisionXVtaPORC_COMISION.Value/100;
      GlbSalvarQuery(dmComision.tblComisionXVta);
    end else
    begin
      dmComision.tblComisionXVta.Edit;
      dmComision.tblComisionXVtaFECHA_INICIO.Value:=ExtraerFecha(DateTimePicker1.Date);
      dmComision.tblComisionXVtaFECHA_FINAL.Value:=ExtraerFecha(DateTimePicker2.Date);
      dmComision.tblComisionXVtaSTATUS.Value:='A';
      dmComision.tblComisionXVtaIN_POR.Value:= strUserName;
      dmComision.tblComisionXVtaMONTO_BASE.Value:=dmComision.qryVentasComisionableSumVALORTOTALVENTA.Value;
      dmComision.tblComisionXVtaPORC_COMISION.Value:=StrToFloat(edtPorcCom.Text);
      dmComision.tblComisionXVtaMONTO_COMISION.Value:=
      dmComision.tblComisionXVtaMONTO_BASE.Value * dmComision.tblComisionXVtaPORC_COMISION.Value/100;
      GlbSalvarQuery(dmComision.tblComisionXVta);
    end;
    dmComision.qryVentasComisionableSum.Next;
  end;
end;

procedure TfrmPagoComisiones.SpeedButton3Click(Sender: TObject);
begin
  if (dmComision.tblComisionXVtaSTATUS.Value = 'A') then
  begin
    dmComision.tblComisionXVta.Delete;
    GlbSalvarQuery(dmComision.tblComisionXVta);
  end;
end;

procedure TfrmPagoComisiones.SpeedButton4Click(Sender: TObject);
begin
  if dmComision.tblComisionXVta.state = dsInactive then exit;
  dmComision.tblComisionXVta.First;
  While not dmComision.tblComisionXVta.Eof do
  begin
    if (dmComision.tblComisionXVtaSTATUS.Value = 'A') then
    begin
      dmComision.tblComisionXVta.Delete;
      GlbSalvarQuery(dmComision.tblComisionXVta);
    end else
    dmComision.tblComisionXVta.Next;
  end;
end;

procedure TfrmPagoComisiones.RxDBGrid2Enter(Sender: TObject);
begin
  if dmComision.tblComisionXVta.state = dsInactive then
  begin
    dmComision.tblComisionXVta.Close;
    dmComision.tblComisionXVta.Params[0].Value:=  ExtraerFecha(DateTimePicker1.Date);
    dmComision.tblComisionXVta.Params[1].Value:=  ExtraerFecha(DateTimePicker2.Date);
    dmComision.tblComisionXVta.Open;
  end;
  dmComision.tblComisionXVta.Locate('CODIGO_EMPLEADO',
  dmComision.qryVentasComisionableSumCODIGO_VENDEDOR.Value,[]);
end;

procedure TfrmPagoComisiones.DBEdit1Exit(Sender: TObject);
begin
  if dmComision.tblComisionXVta.state in [dsEdit, dsInsert] then
  dmComision.tblComisionXVtaMONTO_COMISION.Value:=
  dmComision.tblComisionXVtaMONTO_BASE.Value * dmComision.tblComisionXVtaPORC_COMISION.Value/100;
end;

procedure TfrmPagoComisiones.DBEdit2Exit(Sender: TObject);
begin
  if dmComision.tblComisionXVta.state in [dsEdit, dsInsert] then
  dmComision.tblComisionXVtaMONTO_COMISION.Value:=
  dmComision.tblComisionXVtaMONTO_BASE.Value * dmComision.tblComisionXVtaPORC_COMISION.Value/100;
end;

procedure TfrmPagoComisiones.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CheckBox1.Caption:='Filtrado';
    dmComision.codVendedor:=dmComision.qryVentasComisionableCODIGO_VENDEDOR.Value;
    dmComision.qryVentasComisionable.Filtered:=True;
  end else
  dmComision.qryVentasComisionable.Filtered:=False;
end;

function TfrmPagoComisiones.FCantDiasAPagar(fechaini,
  fechafin: TDateTime): string;
  var
    cantD : integer;
begin
  cantD:= DaysBetween(fechafin,fechaini);
  if (cantD > 15) then
  Result:='*** Total Dias Comisiones?'+IntToStr(15);
end;

procedure TfrmPagoComisiones.DateTimePicker1Exit(Sender: TObject);
begin
  if (DateTimePicker2.Date < DateTimePicker1.Date) then
  begin
    MessageDlg('Verifica fecha inicial, no puede ser mayor a fecha final.',mtInformation,[mbok],0)
  end else
  Label9.Caption:= FCantDiasAPagar(DateTimePicker1.Date,DateTimePicker2.Date);
end;

procedure TfrmPagoComisiones.DateTimePicker2Exit(Sender: TObject);
begin
  if (DateTimePicker2.Date < DateTimePicker1.Date) then
  begin
    MessageDlg('Verifica fecha fecha final, no puede ser menor a fecha inicial.',mtInformation,[mbok],0)
  end
  else
  Label9.Caption:= FCantDiasAPagar(DateTimePicker1.Date,DateTimePicker2.Date);

end;

end.
