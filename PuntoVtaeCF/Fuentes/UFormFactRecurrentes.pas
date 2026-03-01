unit UFormFactRecurrentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons, Grids,
  DB, DBGrids, ExtCtrls, RXCtrls, ComCtrls, IBCustomDataSet, IBStoredProc,
  UActivapermisos,RxMemDS, RxLookup, WinSkinData, RxSpin, Menus;

type
  TfrmGenFactRecurrentes = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBStatusLabel4: TDBStatusLabel;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RxDBGrid4: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn7: TBitBtn;
    DBDateEdit2: TDBDateEdit;
    Label6: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    rxDatos: TRxMemoryData;
    rxDatosNumero: TIntegerField;
    rxDatosstatus: TStringField;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label7: TLabel;
    BitBtn8: TBitBtn;
    SkinData1: TSkinData;
    BitBtn9: TBitBtn;
    RxLabel1: TRxLabel;
    edtFechaFactura: TDateEdit;
    BitBtn10: TBitBtn;
    SpeedButton1: TSpeedButton;
    BitBtn11: TBitBtn;
    Label8: TLabel;
    DataSource1: TDataSource;
    DBText1: TDBText;
    Label9: TLabel;
    DBText2: TDBText;
    Label10: TLabel;
    DBText3: TDBText;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ProgressBar1: TProgressBar;
    RxSpinEdit1: TRxSpinEdit;
    RxLabel2: TRxLabel;
    PopupOpciones: TPopupMenu;
    EstatusContrato1: TMenuItem;
    RxSpeedButton12: TRxSpeedButton;
    Clientes1: TMenuItem;
    Label11: TLabel;
    Label12: TLabel;
    procedure BitBtn1Click2(Sender: TObject);
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn4Click2(Sender: TObject);
    procedure BitBtn5Click2(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtFechaFacturaExit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure RxDBGrid4GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure EstatusContrato1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);

  private
    { Private declarations }
    procedure ProcCrearFacturas;
    procedure UseFormVentas;
  public
    { Public declarations }
  end;

var
  frmGenFactRecurrentes: TfrmGenFactRecurrentes;
  porcientoItbi : Real;
  Serie_Asignadoncf : Integer;
  _ShowImpFact  :Boolean;
  FechaIniFct, FechaFinFct : TDateTime;
implementation

uses UDatModInventario, UDatModFactura, uglobal, UDatModCxc, UFactServicio,
  uFormAsignarNCFVenta, UDatModCompania, UDatosVentas, UProcVentaRapida,
  UDatModUsuarios, UDatModClientes, UBuscarClientesPersonasP,
  UFormServFijos, UInventarioProd, UFormImpFactRecurrentes,
  UMaestroClientes;

{$R *.dfm}


procedure TfrmGenFactRecurrentes.BitBtn1Click2(Sender: TObject);
begin
 if dmFactura.tblProgServIguala.State = dsBrowse then
  begin
    dmFactura.tblProgServIguala.Append;
    dmFactura.tblProgServIgualaSTATUS.Value:='A';
    dmFactura.tblProgServIgualaFECHA_INI.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmFactura.tblProgServIgualaFECHA_Fin.Value := ExtraerFecha(GlbFechaTrnDiaria)+365;
    dmFactura.tblProgServIgualaINSERTADO_POR.Value := strUserName;
    dmFactura.tblProgServIgualaCOD_USUARIO_IN.Value:= VarUsuarioGlb;
    dmFactura.tblProgServIgualaFECHA_IN.Value  := Now;
    if dmClientes.qryClientes.Locate('CODIGO_CTE', dmFactura.tblProgServIgualaCODIGO_CTE.Value, []) then
    begin
      if (dmClientes.qryClientesTIPO_CF.Value <> '') then
      dmFactura.tblProgServIgualaTIPO_NCF.Value:=dmClientes.qryClientesTIPO_CF.Value;
    end;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmGenFactRecurrentes.BitBtn2Click2(Sender: TObject);
begin
 if dmFactura.tblProgServIguala.State = dsBrowse then
  begin
    dmFactura.tblProgServIguala.Edit;
  end;
end;

procedure TfrmGenFactRecurrentes.BitBtn3Click2(Sender: TObject);
begin
  if dmFactura.tblProgServIguala.State in [dsEdit,dsInsert] then
  begin
    dmFactura.tblProgServIguala.Cancel;
  end else
  if MessageDlg('Borrar record?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    dmFactura.tblProgServIguala.Delete;
    if not dmFactura.tblProgServIguala.Transaction.InTransaction then
    dmFactura.tblProgServIguala.Transaction.StartTransaction;
    try
      dmFactura.tblProgServIguala.Transaction.CommitRetaining;
    except
    dmFactura.tblProgServIguala.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmGenFactRecurrentes.BitBtn4Click2(Sender: TObject);
begin
  if dmFactura.tblProgServIguala.State in [dsEdit,dsInsert] then
  begin
    if dmFactura.tblProgServIguala.State = dsInsert then
    begin
      dmFactura.tblProgServIgualaNumero.Value:=FsqlMaxNumero('PROG_IGUALAS ','numero');
      if dmFactura.tblProgServIgualaNumero.IsNull or (dmFactura.tblProgServIgualaNumero.Value = 0) then
     dmFactura.tblProgServIgualaNumero.Value:=1;
    end;
    dmFactura.tblProgServIguala.Post;
    dmFactura.tblProgServIguala.ApplyUpdates;
    if not dmFactura.tblProgServIguala.Transaction.InTransaction then
    dmFactura.tblProgServIguala.Transaction.StartTransaction;
    try
      dmFactura.tblProgServIguala.Transaction.CommitRetaining;
    except
    dmFactura.tblProgServIguala.Transaction.RollbackRetaining;
    end;
  end;
  dmFactura.qryCantProgServ.Close;
  dmFactura.qryCantProgServ.Open;
end;

procedure TfrmGenFactRecurrentes.BitBtn5Click2(Sender: TObject);
begin
  if dmFactura.tblProgServIguala.State in [dsInactive, dsBrowse] then
  begin
    dmFactura.tblProgServIguala.Close;
    dmFactura.tblProgServIguala.Open;
  end;
  dmFactura.qryCantProgServ.Close;
  dmFactura.qryCantProgServ.Open;
end;

procedure TfrmGenFactRecurrentes.UseFormVentas;
  var
  serieDoc : Integer;
  valorNCF : String;
  MontoItbis : Extended;
  montoneto: Extended;
  flag : boolean;
begin
  dmFactura.DataModuleCreate(self);
  
  GlbFacturaArtioffice:=0;
  BitBtn7.Enabled:=False;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  flag:=False;
  GlbCodDivInventario:= 1;
  frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
  try

    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;

    frmProcVentaRapida.lblInventario.Caption :='ALMACEN PRINCIPAL';

    ProcGlbSecuenciaNCF;//Chequea Disponibilidad de sec ncf
    GlbFactRecurrente:=True;
    frmProcVentaRapida.DescFactRecurrente:='Servicio Mes '+
    NombreMes[StrToInt(FormatDateTime('mm',edtFechaFactura.Date))]+' '+
    FormatDateTime('yyyy',edtFechaFactura.Date);

    ProgressBar1.Max:= dmFactura.tblProgServIguala.RecordCount;
    ProgressBar1.Position:=0;
    
    While Not dmFactura.tblProgServIguala.Eof Do
    begin
      if (dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value >= edtFechaFactura.Date) then
      begin
        dmFactura.tblProgServIguala.Next;
        continue;
      end;
      if (dmFactura.tblProgServIgualaFECHA_FIN.Value < edtFechaFactura.Date) then
      begin
        dmFactura.tblProgServIguala.Next;
        continue;
      end;

      if (UpperCase(dmFactura.tblProgServIgualaSTATUS.Value) = 'C') then
      begin
        dmFactura.tblProgServIguala.Next;
        continue;
      end;

      if dmFactura.tblProgServIgualaTIPO_NCF.IsNull then
      frmProcVentaRapida._GenNCFFactR:=False
      else
      frmProcVentaRapida._GenNCFFactR:=True;

      frmProcVentaRapida.tablaPropietario.EmptyTable;
      frmProcVentaRapida.tablaPropietario.Append;
      frmProcVentaRapida.tablaPropietarioCodigoPropietario.Value:=
      dmFactura.tblProgServIgualaCODIGO_CTE.Value;
      frmProcVentaRapida.tablaPropietario.Post;

      frmProcVentaRapida.xnumprogrec := dmFactura.tblProgServIgualaNUMERO.Value;
      frmProcVentaRapida.rxdbLookupCteExit(Self);

      frmProcVentaRapida.ProcSetNCFCliente;

      //if (dmFactura.tblProgServIgualaCARGAR_ITBIS.Value = 1) then
      //MontoItbis := (dmFactura.tblProgServIgualaMonto.Value * porcientoItbi / 100);
      //montoneto:= dmFactura.tblProgServIgualaMonto.Value + MontoItbis;

      if frmProcVentaRapida.rxVenta.State = dsBrowse then
      frmProcVentaRapida.BitBtn1Click(Self);
      //frmProcVentaRapida.rxVenta.Append;
      frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(dmFactura.tblServProgIgualaCODIGO_PRODUCTO.Value);
      frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);
      FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), dmFactura.tblServProgIgualaCODIGO_PRODUCTO.Value);

      frmProcVentaRapida.rxVentaFecha.Value := ExtraerFecha(edtFechaFactura.Date);
      frmProcVentaRapida.rxVentaCant.Value  := 1;
      frmProcVentaRapida.rxVentaPrecio.Value:= dmFactura.tblProgServIgualaMONTO.Value;
      frmProcVentaRapida.rxVentaDescripcion.Value := dmFactura.tblServProgIgualaDESCRIPCION.Value;
      frmProcVentaRapida.rxVentaTipoUnidad.Value  :=1;
      frmProcVentaRapida.rxVentaStatus.Value   :='A';
      frmProcVentaRapida.rxVentaTipoVenta.Value:=0;
      frmProcVentaRapida.rxVentaDescripcion.Value:= dmFactura.tblProgServIgualaDescripcionServicio.Value;
      frmProcVentaRapida.rxVentaCodArticulo.Value:= dmFactura.tblServProgIgualaCODIGO_PRODUCTO.Value;
      frmProcVentaRapida.edtCodigo.Text          := dmFactura.tblServProgIgualaCODIGO_PRODUCTO.AsString;

      if frmProcVentaRapida.rxVenta.State in [dsBrowse] then
      frmProcVentaRapida.rxVenta.Edit;

      frmProcVentaRapida.rxVentaIDTasaITBIS.Value := GlbIDTasa;
      if (GlbIgI = 1) and (GlbCalcItbis = 0) then
      frmProcVentaRapida.rxVentaIDTasaITBIS.Value := 1;

      frmProcVentaRapida.edtCodigoExit(self);

      frmProcVentaRapida.DBEdit1Exit(Self);
      frmProcVentaRapida.DBEdit2Exit(Self);

      if frmProcVentaRapida.rxVenta.State in [dsInsert,dsEdit] then
      frmProcVentaRapida.rxVenta.Post;

      frmProcVentaRapida.BitBtn2Click(Self);

      //frmProcVentaRapida.ShowModal;
      if frmProcVentaRapida.rxVenta.RecordCount > 0 then
      frmProcVentaRapida.BitBtn6Click(Self);

      dmFactura.tblProgServIguala.Edit;

      dmFactura.tblProgServIgualaFECHA_ULT_FACT.Value:= ExtraerFecha(edtFechaFactura.Date);
      GlbSalvarQuery(dmFactura.tblProgServIguala);
      flag:=True;

      //Genera factura solo a record actual
      if RadioButton1.Checked then
      Break;

      GlbFactRecurrente:=True;
      dmFactura.tblProgServIguala.Next;
      ProgressBar1.StepIt;
    end;
    //frmProcVentaRapida.ShowModal;

  finally
  frmProcVentaRapida.Free;
  frmProcVentaRapida:= Nil;
  end;
  GlbCodDivInventario:= -1;                    
  GlbFactRecurrente:=False;
  BitBtn7.Enabled:=True;

  ProgressBar1.Visible:=False;

  Beep;
  //if flag and  _ShowImpFact then
  //BitBtn8Click(self);
end;

procedure TfrmGenFactRecurrentes.BitBtn7Click(Sender: TObject);
var
  fini, ffin : Integer;
begin
  if MessageDlg('¿Desea generar facturas?',mtInformation,[mbyes,mbno],0)=mrNo then
  exit;
  ProgressBar1.visible:=True;
  dmCompania.tblcompania.Close;
  dmCompania.tblcompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  dmcxc.QrybalanceCtes.Close;
  dmcxc.QrybalanceCtes.Open;
  rxDatos.Close;
  rxDatos.Open;
  porcientoItbi := FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria),-1);
  ProcCrearFacturas;

end;

procedure TfrmGenFactRecurrentes.ProcCrearFacturas;
  var
  x: integer;
  truco : string;
  xc : integer;
begin
  if not RadioButton1.Checked then
  dmFactura.tblProgServIguala.First;

  xc:=dmFactura.tblProgServIgualaNUMERO.Value;
  _ShowImpFact:=False;
  if (RxSpinEdit1.AsInteger > 1) And (RadioButton1.Checked) then
  begin
    for x:=1 to RxSpinEdit1.AsInteger do
    begin
      dmFactura.tblProgServIguala.Locate('NUMERO',xc,[]);
      GlbFactRecurrente:=True;
      if x = 1 then
      FechaIniFct:= edtFechaFactura.Date;
      if x > 1 then
      truco:=FormatDateTime('dd/mmm/yyyy',edtFechaFactura.Date)
      else
      truco:=FormatDateTime('dd/mmm/yyyy',FechaIniFct);
      UseFormVentas;
      if (x < RxSpinEdit1.AsInteger) then
      begin
        edtFechaFactura.Date:=IncMonth(edtFechaFactura.Date,1);
        edtFechaFactura.Date:= GlbUltimoDiaMes(edtFechaFactura.Date);
        FechaFinFct:= ExtraerFecha(edtFechaFactura.Date);
        truco:=FormatDateTime('dd/mmm/yyyy',edtFechaFactura.Date);
      end;
      if (x = RxSpinEdit1.AsInteger -1 ) then
      _ShowImpFact := true;
    end;
  end else
  begin
    FechaIniFct:=ExtraerFecha(edtFechaFactura.Date);
    FechaFinFct:=ExtraerFecha(edtFechaFactura.Date);
    _ShowImpFact:=True;
    UseFormVentas;
  end;
  if _ShowImpFact then
  BitBtn8Click(self);  
end;

procedure TfrmGenFactRecurrentes.FormCreate(Sender: TObject);
begin
  dmFactura.tblServProgIguala.Close;
  dmFactura.tblServProgIguala.Open;
  dmFactura.tblProgServIguala.Close;
  dmFactura.tblProgServIguala.Open;
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
  dmFactura.tblProgServIguala.Close;
  dmFactura.tblProgServIguala.Open;
  dmCxc.qryClientes.Close;
  dmCxc.qryClientes.Open;

  dmFactura.qryFechaUltMaxFRec.Close;
  dmFactura.qryFechaUltMaxFRec.Open;
  if dmFactura.qryFechaUltMaxFRecFECHAMAX.IsNull then
  edtFechaFactura.Date :=  GlbUltimoDiaMes(ExtraerFecha(GlbFechaTrnDiaria)+1)
  else
  edtFechaFactura.Date := ExtraerFecha(dmFactura.qryFechaUltMaxFRecFECHAMAX.Value)+1;
  edtFechaFactura.Date := GlbUltimoDiaMes(edtFechaFactura.Date);
  dmClientes.qryClientes.Close;
  dmClientes.qryClientes.Open;
  dmFactura.qryCantProgServ.Close;
  dmFactura.qryCantProgServ.Open;
end;

procedure TfrmGenFactRecurrentes.BitBtn8Click(Sender: TObject);
var
  f : integer;
begin
  frmImpresionFactRecurrente:=TfrmImpresionFactRecurrente.Create(nil);
  try
    //frmImpresionFactRecurrente._fechaFct.Date:=edtFechaFactura.date;
    if FechaIniFct >  0 then
    begin
    frmImpresionFactRecurrente._fechaFctIni.Date := FechaIniFct;
    frmImpresionFactRecurrente._fechaFctFin.Date:= FechaFinFct;
    end else
    begin
      frmImpresionFactRecurrente._fechaFctIni.Date := GlbFechaTrnDiaria;
      frmImpresionFactRecurrente._fechaFctFin.Date:= GlbUltimoDiaMes(GlbFechaTrnDiaria);
    end;
    frmImpresionFactRecurrente.BitBtn1Click(Self);
    
    frmImpresionFactRecurrente.ShowModal;
  finally
  frmImpresionFactRecurrente.free;
  frmImpresionFactRecurrente:=nil;
  end;
end;

procedure TfrmGenFactRecurrentes.BitBtn9Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      dmClientes.tblClientes.DisableControls;
      dmClientes.tblClientes.Tag := -1;
      if dmFactura.tblProgServIguala.State = dsBrowse then
      if not dmFactura.tblProgServIguala.Locate('codigo_cte', FrmBuscarClientesPersonas.CodigoCliente,[]) then
      MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0)
      else
      dmFactura.tblProgServIgualaCodigo_cte.Value:= FrmBuscarClientesPersonas.CodigoCliente;
      
      dmClientes.tblClientes.EnableControls;
      dmClientes.tblClientes.Tag := 0;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmGenFactRecurrentes.BitBtn10Click(Sender: TObject);
begin
  frmServiciosReg:=TfrmServiciosReg.Create(nil);
  try
    frmServiciosReg.showmodal;
  finally
  frmServiciosReg.free;
  frmServiciosReg:=nil;
  end;
end;

procedure TfrmGenFactRecurrentes.SpeedButton1Click(Sender: TObject);
begin
 if dmFactura.tblProgServIguala.State = dsBrowse then
  begin
    if MessageDlg('¿Ignorar generación NCF para este cliente?',mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      dmFactura.tblProgServIguala.Edit;
      dmFactura.tblProgServIgualaTIPO_NCF.AsVariant:=null;
      GlbSalvarQuery(dmFactura.tblProgServIguala);
    end;
  end
end;

procedure TfrmGenFactRecurrentes.edtFechaFacturaExit(Sender: TObject);
begin
  //if (dmFactura.tblProgServIgualaFECHA_INI.Value < edtFechaFactura.Date)
  //or (dmFactura.tblProgServIgualaFECHA_FIN.Value > edtFechaFactura.Date) then
  //begin
  //  MessageDlg('Fecha esta fuera de rango vigencia contrato, verifique.',mtError,[mbok],0);
  //end;
end;

procedure TfrmGenFactRecurrentes.BitBtn11Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    frmInventarioProd.PageControl1.TabIndex:=0;
    if not dmFactura.tblServProgIgualaCODIGO_PRODUCTO.IsNull then
    dmInventario.tblInventarioProd.Locate('codigo',dmFactura.tblServProgIgualaCODIGO_PRODUCTO.Value,[]);
    frmInventarioProd.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
end;

procedure TfrmGenFactRecurrentes.RxDBGrid4GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmFactura.tblProgServIgualaSTATUS.Value = 'C') then
  BackGround := clSilver
  else
  if (dmFactura.tblProgServIgualaFECHA_FIN.Value < NOw) then
  BackGround := clYellow
  else
  if not dmFactura.tblProgServIgualaSTATUSCONTRACTO.IsNull then
  begin
    if (LowerCase(dmFactura.tblProgServIgualaSTATUSCONTRACTO.Value) = 'disabled') then
    BackGround := $007586CC
    else
    if (LowerCase(dmFactura.tblProgServIgualaSTATUSCONTRACTO.Value) = 'alerted') then
    begin
      BackGround := $00BCF1E6;
      AFont.Color:=clBlack;
    end;
  end;
end;

procedure TfrmGenFactRecurrentes.RadioButton1Click(Sender: TObject);
begin
  RxLabel2.Visible:=True;
  RxSpinEdit1.Visible:=True;
end;

procedure TfrmGenFactRecurrentes.RadioButton2Click(Sender: TObject);
begin
  RxLabel2.Visible:=False;
  RxSpinEdit1.Visible:=False;
end;

procedure TfrmGenFactRecurrentes.EstatusContrato1Click(Sender: TObject);
begin
  //Se ejecuta el View_EstadocxcFactRec
  if MessageDlg('Desea desactivar contratos en WisPro por falta de pago?', mtInformation, [mbYes, mbNo], 0) = mryes then
  WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /AUTO=1',
  [GlbUsuarioLogueado,'1','60',
  '',
  ''])), SW_HIDE);
  Sleep(2000);
  Beep;
  MessageDlg('Proceso terminado, verifique',mtInformation,[mbok],0);
  BitBtn5Click2(Self);
end;

procedure TfrmGenFactRecurrentes.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Self);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;
    While Not dmUsuarios.qryRoles.Eof Do
    begin
      ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    if not dmFactura.tblProgServIgualaCODIGO_CTE.IsNull then
    begin
      dmclientes.tblClientes.Tag:=-1;
      dmclientes.tblClientes.DisableControls;
      dmclientes.tblClientes.Locate('CODIGO_CTE', dmFactura.tblProgServIgualaCODIGO_CTE.Value,[]);
      dmclientes.tblClientes.Tag:=0;
      dmclientes.tblClientes.EnableControls;
    end;
    frmClientes.PageControl1.ActivePageIndex:=0;
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  dmCxc.qryClientes.Close;
  dmCxc.qryClientes.Open;
end;

end.
