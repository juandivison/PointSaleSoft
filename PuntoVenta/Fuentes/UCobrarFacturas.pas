unit UCobrarFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, EditNew, RxMemDS, Buttons, ExtCtrls, RXCtrls,
  ShellApi, IBStoredProc, Menus, RxLookup, IBSQL, ComCtrls, Mask, DBCtrls, RxToolEdit;

type
  TfrmCobrarFacturas = class(TForm)
    SkinData1: TSkinData;
    RxDBGrid1: TRxDBGrid;
    qryFactPendiente: TIBQuery;
    qryFactPendienteCODIGO_CTE: TIntegerField;
    qryFactPendienteFECHA: TDateTimeField;
    qryFactPendienteNOMBRE_CTE: TIBStringField;
    qryFactPendienteNOMBRE_FACTURAR: TIBStringField;
    qryFactPendienteTIPO: TIntegerField;
    qryFactPendienteMONEDA: TIBStringField;
    qryFactPendienteNUMERO_FACT: TIntegerField;
    qryFactPendienteMONTO_PENDIENTE: TFloatField;
    qryFactPendienteSTATUS: TIBStringField;
    dsqryFactPendiente: TDataSource;
    edtMontoAcobrar: TEditN;
    Label1: TLabel;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    rxFacturaACobrar: TRxMemoryData;
    BitBtn5: TBitBtn;
    rxFacturaACobrarCodCte: TIntegerField;
    rxFacturaACobrarNumFactura: TIntegerField;
    rxFacturaACobrarMontoAbonado: TFloatField;
    rxFacturaACobrarTipoCobro: TSmallintField;
    Shape1: TShape;
    RxLabel1: TRxLabel;
    edtDisponible: TEditN;
    rxAcumulador: TRxMemoryData;
    rxAcumuladorMonto: TFloatField;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    dsrxFacturaACobrar: TDataSource;
    Label2: TLabel;
    RxLabel2: TRxLabel;
    stp_UpdateCxc: TIBStoredProc;
    RxSpeedButton5: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    BuscarCliente1: TMenuItem;
    ReImprimirRecibo1: TMenuItem;
    rxFacturaACobrarTipoFactPend: TIntegerField;
    rxFacturaACobrarformaPago: TIntegerField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label15: TLabel;
    rxFormaPago: TRxMemoryData;
    rxFormaPagoformaPago: TSmallintField;
    rxFormaPagoNumeroDocumento: TStringField;
    rxFormaPagoNumeroTarjeta: TStringField;
    rxFormaPagoTipoTarjeta: TSmallintField;
    rxFormaPagoProveedorTarjeta: TSmallintField;
    rxFormaPagoNumeroAutorizacion: TStringField;
    rxFormaPagoMes: TSmallintField;
    rxFormaPagoAnio: TSmallintField;
    rxFormaPagoMONTOAUTORIZADO: TFloatField;
    dsrxFormaPago: TDataSource;
    stpactfctingresos: TIBStoredProc;
    RxLabel3: TRxLabel;
    ibsqlLastNum: TIBSQL;
    rxFacturaACobrarConcepto: TStringField;
    rxFacturaACobrarNombreCliente: TStringField;
    edtMontoTotal: TEditN;
    Label3: TLabel;
    ibstpProcInsCxcHist: TIBStoredProc;
    qryBlcCxcRecibo: TIBQuery;
    qryBlcCxcReciboBALANCE_ACTUAL: TFloatField;
    CheckBox1: TCheckBox;
    qryRetencionDgii: TIBQuery;
    qryRetencionDgiiCODIGO_CTE: TIntegerField;
    qryRetencionDgiiPORCIENTO: TFloatField;
    edtNota: TEdit;
    Label4: TLabel;
    CheckBox4: TCheckBox;
    rxFacturaACobrarMontoNCRAplicado: TCurrencyField;
    rxFacturaACobrarMontoFactura: TCurrencyField;
    AplicaRetencin1: TMenuItem;
    Button1: TButton;
    BitBtn8: TBitBtn;
    qryFactPendienteNUMPOL: TIntegerField;
    Label5: TLabel;
    cboxUseLogo: TComboBox;
    qryLogoTipoAfiliado: TIBQuery;
    qryLogoTipoAfiliadoIDTIPO: TIntegerField;
    qryLogoTipoAfiliadoRUTA_LOGO: TIBStringField;
    qryLogoTipoAfiliadoDESCRIPCION: TIBStringField;
    dtpkFechaAplicaPago: TDateTimePicker;
    Label6: TLabel;
    qryFactPendienteCONCEPTO: TIBStringField;
    qryFactPendienteNUMERO_TRN_VTA: TIntegerField;
    rxFacturaACobrarConceptoCxc: TStringField;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Label9: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    qryClienteStd: TIBQuery;
    qryClienteStdCODIGO_CTE: TIntegerField;
    qryClienteStdNOMBRE_FACTURAR: TIBStringField;
    qryClienteStdRNC_NUMERO: TIBStringField;
    rxLabelNoExiste: TRxLabel;
    BitBtn9: TBitBtn;
    RadioGroup2: TRadioGroup;
    RxDBGrid3: TRxDBGrid;
    dsqryClienteStd: TDataSource;
    qryEmpleados: TIBQuery;
    dsqryEmpleado: TDataSource;
    Label55: TLabel;
    rxcboxEmpleados: TComboBox;
    qryEmpleadosCODIGO: TIntegerField;
    qryEmpleadosDESC_CARGO: TIBStringField;
    qryEmpleadosNOMBREVENDEDOR: TIBStringField;
    VerTransfCte1: TMenuItem;
    qryFactPendienteMONTOPENALIDADCXC: TFloatField;
    ReenviaPagoaWispro1: TMenuItem;
    SkinData2: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure edtMontoAcobrarChange(Sender: TObject);
    procedure ReImprimirRecibo1Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure qryFactPendienteAfterOpen(DataSet: TDataSet);
    procedure CheckBox4Click(Sender: TObject);
    procedure AplicaRetencin1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure cboxUseLogoChange(Sender: TObject);
    procedure dtpkFechaAplicaPagoExit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure RxDBGrid3CellClick(Column: TColumn);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure RxDBGrid3Exit(Sender: TObject);
    procedure rxcboxEmpleadosChange(Sender: TObject);
    procedure VerTransfCte1Click(Sender: TObject);
    procedure ReenviaPagoaWispro1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClick(Sender: TObject);

  private
    { Private declarations }
    procedure AbrirTablaRetenciones(xcodcte:integer);
    Procedure ProcInsertaFactura(x:smallint; y:smallint);
    Function TotalFacturas:Real;
    Procedure ProcSumar;
    Function SumarFactAcobrar:Real;
    Procedure ProcFacturasACxc;
    procedure ProcUpdateFactPendiente;
    procedure guardarReciboMaster;
    procedure guardarReciboDetalle(descDetalle : String);
    procedure ImprimirRecibo(tipo :smallint);
    procedure RegistrarDetallesIngresos;
    procedure RegistrarDetalleCheque(numRecibo : Integer);        
    function FNumReciboMax : Integer;
    procedure DescargaNotaCredito;
    procedure ProcRetencionARS(Desc:string;numFct: integer;_monto :Currency);
    //procedure ProcSumarSel;
    procedure ProcUpdateFactPendienteARS(numFct: integer;_seriecxc:integer;_monto :Currency);
    Function CheckIfTransExiste:Boolean;
    procedure ProcInsertarDetPagos(numtrn : integer);
  public
    { Public declarations }
    CodCte : Integer;
    strNombreEmpresa : String;
  end;

var
  frmCobrarFacturas: TfrmCobrarFacturas;
  cont : Integer;
  strNumero : String;
  mto : Currency;
  _codUsuario : Integer;
  ReConfirmaPago:boolean;

implementation

uses UDatModConectar, UGlobal, UDatModCxc, UDatModIngresos,
  UDatModUsuarios, UDetalleFormaDePago, URepReciboAbonoCXC, UBuscarClientesPersonasP,
  UFormIngChequesDet, URepReciboIngresoAI, UDatmodDatosGenerales,
  URepReciboIngresoByM, URepReciboIngresoByB, UFormIndiqueMontoRetencion,
  UActivapermisos, UFormCertEnCxc, UMaestroClientes, UDatModClientes,
  URepReciboIngreso, URepReciboIngGen, URepReciboIngGenPOS,
  UReipReimpFastRetailPOS, frmTransferenciasBanco,
  URepReciboIngresoAIFarmacia;

{$R *.dfm}

procedure TfrmCobrarFacturas.BitBtn1Click(Sender: TObject);
begin
  if (GLBECOM = 1) then
  if RxDBGrid1.SelCount = 1 then
  begin
    if edtDisponible.ValueFloat = 0 then
    edtDisponible.ValueFloat:= qryFactPendienteMONTO_PENDIENTE.Value;
  end;

  if (edtDisponible.ValueFloat > 0.01) then
  ProcInsertaFactura(1{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmCobrarFacturas.ProcInsertaFactura(x, y: smallint);
var i:integer;
    MontoDisponible : Real;
begin
  if rxfacturaacobrar.State = dsinactive then
  rxFacturaACobrar.Open;
  if CheckBox4.Checked then
  begin
    if Not rxFacturaACobrar.Locate('numfactura',qryFactPendienteNUMERO_FACT.Value,[]) then
    begin
      rxFacturaACobrar.Insert;
      rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
      rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
      rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
      rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
      rxFacturaACobrarMontoFactura.Value := qryFactPendienteMONTO_PENDIENTE.Value;
      rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;
      if not qryFactPendienteCONCEPTO.IsNull then
      rxFacturaACobrarConceptoCxc.Value  :=qryFactPendienteCONCEPTO.Value
      else
      rxFacturaACobrarConceptoCxc.Value  := '';
      //MontoDisponible:=
       if edtDisponible.ValueFloat > qryFactPendienteMONTO_PENDIENTE.Value then
      begin
        rxFacturaACobrarMontoAbonado.Value := qryFactPendienteMONTO_PENDIENTE.Value;
        rxFacturaACobrarConcepto.Value:='Saldo';
      end else
      begin
        rxFacturaACobrarMontoAbonado.Value :=
        {qryFactPendienteMONTO_PENDIENTE.Value -} edtDisponible.ValueFloat;
        rxFacturaACobrarConcepto.Value:='Abono';
      end;
      if (glbEcom = 1) and (rxFacturaACobrarConceptoCxc.Value <> '') then
      rxFacturaACobrarConcepto.Value:= rxFacturaACobrarConcepto.Value +' '+
      rxFacturaACobrarConceptoCxc.Value;
      rxFacturaACobrarMontoNCRAplicado.Value:=rxFacturaACobrarMontoAbonado.Value;
      rxFacturaACobrar.Post;
    end;
    exit;
  end;

  Case x Of
  2:begin //Solo factura seleccionada
    if (rxDBGrid1.SelectedRows.Count > 0) then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if not rxFacturaACobrar.locate('numfactura',qryFactPendienteNUMERO_FACT.Value,[]) then
        begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarMontoFactura.Value := qryFactPendienteMONTO_PENDIENTE.Value;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;

          if not qryFactPendienteCONCEPTO.IsNull then
          rxFacturaACobrarConceptoCxc.Value  :=qryFactPendienteCONCEPTO.Value
          else
          rxFacturaACobrarConceptoCxc.Value  := '';
          //MontoDisponible:=
          if edtMontoAcobrar.ValueFloat < qryFactPendienteMONTO_PENDIENTE.Value then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtMontoAcobrar.ValueFloat;
            rxFacturaACobrarConcepto.Value:='Abono';
          end else
          rxFacturaACobrarMontoAbonado.Value :=
          qryFactPendienteMONTO_PENDIENTE.Value;// - edtMontoAcobrar.ValueFloat;
          rxFacturaACobrarConcepto.Value:='Saldo';
          
           if (glbEcom = 1) and (rxFacturaACobrarConceptoCxc.Value <> '') then
           rxFacturaACobrarConcepto.Value:= rxFacturaACobrarConcepto.Value +' '+
           rxFacturaACobrarConceptoCxc.Value;

          rxFacturaACobrarMontoNCRAplicado.Value:=0;
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  1:begin //Facturas seleccionadas
    if (rxDBGrid1.SelectedRows.Count = 1) then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if not rxFacturaACobrar.locate('numfactura',qryFactPendienteNUMERO_FACT.Value,[]) then
        begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarMontoFactura.Value := qryFactPendienteMONTO_PENDIENTE.Value;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;

          if not qryFactPendienteCONCEPTO.IsNull then
          rxFacturaACobrarConceptoCxc.Value  :=qryFactPendienteCONCEPTO.Value
          else
          rxFacturaACobrarConceptoCxc.Value  := '';

          //t if qryFactPendienteMONTO_PENDIENTE.Value > edtMontoAcobrar.ValueFloat then
          if qryFactPendienteMONTO_PENDIENTE.Value > edtDisponible.ValueFloat then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtDisponible.ValueFloat;
            rxFacturaACobrarConcepto.Value:='Abono';
          end else
          begin
            rxFacturaACobrarMontoAbonado.Value :=qryFactPendienteMONTO_PENDIENTE.Value;
            rxFacturaACobrarConcepto.Value:='Saldo';
          end;

           if (glbEcom = 1) and (rxFacturaACobrarConceptoCxc.Value <> '') then
           rxFacturaACobrarConcepto.Value:= rxFacturaACobrarConcepto.Value +' '+
           rxFacturaACobrarConceptoCxc.Value;

          rxFacturaACobrarMontoNCRAplicado.Value:=0;
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  end;
end;

procedure TfrmCobrarFacturas.RxDBGrid1Exit(Sender: TObject);
begin
  ProcSumar;
  //ProcSumarSel;
end;

procedure TfrmCobrarFacturas.FormShow(Sender: TObject);
begin
  qryFactPendiente.Close;
  qryFactPendiente.Params[0].Value:= CodCte;
  qryFactPendiente.Open;
  edtMontoAcobrar.SetFocus;
end;

procedure TfrmCobrarFacturas.BitBtn5Click(Sender: TObject);
var
  parameters : string;
  ExecuteResult: integer;

begin
  if rxFacturaACobrar.RecordCount = 0 then
  begin
    MessageDlg('Nada para procesar, verifique.', mtError, [mbOK], 0);
    Exit;
  end;

  if CheckIfTransExiste then
  begin
    MessageDlg('Número de transferencia ya existe, verifique.',mtError,[mbok],0);
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
    exit;
  end;

  if rxFormaPagoformaPago.IsNull then
  begin
    MessageDlg('Favor indicar forma de pago.', mtError, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    Exit;
  end;
  if (Abs(SumarFactAcobrar - edtMontoAcobrar.ValueFloat) > 0.009) then
  begin
  if SumarFactAcobrar <> (edtMontoAcobrar.ValueFloat) then
  begin
    MessageDlg('Favor verificar monto factura(s) a cobrar.', mtError, [mbOK], 0);
    Exit;
  end;
  end;
  if (edtDisponible.ValueFloat > 0) then
  begin
    MessageDlg('Monto pendiente debe ser igual a cero (0).', mtError, [mbOK], 0);
    Exit;
  end;
  BitBtn5.Enabled:=False;
  if (GLBSam = 1 ) then
  begin
    if qryLogoTipoAfiliado.Locate('DESCRIPCION',cboxUseLogo.Text,[]) then
    GlbLogoServSam:=qryLogoTipoAfiliadoRUTA_LOGO.Value
    else
    GlbLogoServSam:='';
  end else GlbLogoServSam:='';
  if dmcxc.rxIngChequeDet.RecordCount = 0 then
  RxDBLookupCombo1Exit(Self);
  ProcFacturasACxc;//Registrar pago en tabla trans_cxc    //Guardar paso 1

  if (CheckBox4.Checked) then
  DescargaNotaCredito;

  RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);

  ImprimirRecibo(0);
  if (GLBECOM = 1) then
  begin
    //Aplicar pago en WisProCloud

    dmClientes.tblContractWisPro.Close;
    dmClientes.tblContractWisPro.Open;
    if dmClientes.tblContractWisPro.Locate('CODIGO_CTE',dmIngresos.qryRepIngMasterCODIGO_CTE.Value,[]) then
    begin
      try
        parameters :=Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /NUMRECIBOERP=%s /AUTO=1',
        [GlbUsuarioLogueado,'1','91',dmClientes.tblContractWisProID.Value,
        dmIngresos.qryRepIngMasterNUMERO.AsString]);
        ExecuteResult:=  ShellExecute(0, 'Open', PChar(GlbRutaWisPro), PChar(parameters), PChar(''), SW_Hide);

        if ExecuteResult <= 32 then
        begin
          WriteToLog('Error: ' + IntToStr(ExecuteResult));
          ShowMessage('Verifique ejecutable comm con WisProAPI : ' + IntToStr(ExecuteResult));
        end;
      except on E : Exception do
      begin
        WriteToLog (E.ClassName+' Error. Mensaje: '+E.Message);
        LogInformacionTxt('Error aplicando pago en WisProAPi. Recibo Ing. No.'+dmIngresos.qryRepIngMasterNUMERO.AsString);
      end;
    end;

    Sleep(3000);
    end;

    try
      if dmClientes.tblContractWisPro.Locate('CODIGO_CTE',qryFactPendienteCODIGO_CTE.Value,[]) then
      begin
        if (UpperCase(trim(dmClientes.tblContractWisProSTATE.Value)) = 'ALERTED') OR
         (UpperCase(trim(dmClientes.tblContractWisProSTATE.Value)) = 'DISABLED') then
        WinExec(PChar(GlbRutaWisPro+Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /StatusContract=%s /CodigoCliente=%s /AUTO=1',
        [GlbUsuarioLogueado,'1','70',dmClientes.tblContractWisProID.Value,'enabled',
        dmClientes.tblContractWisProCODIGO_CTE.AsString])), SW_HIDE);  //activar
        dmClientes.tblContractWisPro.Close;
      end;
    except
    end;
  end;
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  dmcxc.rxIngChequeDet.EmptyTable;
  edtDisponible.SetFloat(0);
  edtMontoAcobrar.SetFloat(0);
  BitBtn6Click(Self);
  RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
  BitBtn5.Enabled:=True;
  rxFormaPago.EmptyTable;
end;

procedure TfrmCobrarFacturas.FormCreate(Sender: TObject);
begin
  _codUsuario:=-1;
  dmCxc.QryBancos.Close;
  dmCxc.QryBancos.params[0].Value:= glbCia_Key;
  dmCxc.QryBancos.Open;
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.params[0].value:=glbCia_Key;
  dmDatos.qryMembrete.open;

  qryClienteStd.close;
  qryClienteStd.params[0].Value:= glbCia_Key;
  qryClienteStd.Open;
  
  dtpkFechaAplicaPago.Visible:=True;
  dtpkFechaAplicaPago.DateTime:=ExtraerFecha(GlbFechaTrnDiaria);
  if GLBSAM = 0 then
  begin
    cboxUseLogo.Visible:=False;
    Label5.Visible     :=False;
    Button1.Enabled:=False;
    BitBtn8.Enabled:=False;
  end else
  begin
    dtpkFechaAplicaPago.Visible:=True;
    dtpkFechaAplicaPago.DateTime:=ExtraerFecha(GlbFechaTrnDiaria);
  end;
  dmcxc.rxIngChequeDet.Close;
  dmcxc.rxIngChequeDet.Open;
  dmIngresos.tblFormaPago.close;
  dmIngresos.tblFormaPago.Open;
  dmUsuarios.qryUsuarios.close;
  dmUsuarios.qryUsuarios.open;
  rxAcumulador.Close;
  rxAcumulador.Open;
  cont:=0;
  CodCte:=0;
  rxFormaPago.Close;
  rxFormaPago.Open;
  rxFormaPago.Insert;
  dmingresos.tblIngresoMaster.Close;
  dmingresos.tblIngresoMaster.Open;
  RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
  AbrirTablaRetenciones(dmingresos.tblIngresoMasterCODIGO_CTE.Value);
  cboxUseLogo.Clear;
  qryLogoTipoAfiliado.Close;
  qryLogoTipoAfiliado.Open;
  qryLogoTipoAfiliado.First;
  while not qryLogoTipoAfiliado.Eof do
  begin
    cboxUseLogo.Items.Add(qryLogoTipoAfiliadoDESCRIPCION.Value);
    qryLogoTipoAfiliado.Next;
  end;
  qryLogoTipoAfiliado.First;
  cboxUseLogo.Text:=qryLogoTipoAfiliadoDESCRIPCION.Value;
  cboxUseLogoChange(Self);
  RadioGroup1Click(Self);

  rxcboxEmpleados.Clear;
  qryEmpleados.Close;
  qryEmpleados.Open;
  qryEmpleados.First;
  while not qryEmpleados.Eof do
  begin
    rxcboxEmpleados.Items.Add(qryEmpleadosNOMBREVENDEDOR.Value);
    qryEmpleados.Next;
  end;
  if qryEmpleados.Locate('codigo',VarUsuarioGlb,[]) then
  rxcboxEmpleados.Text:= qryEmpleadosNOMBREVENDEDOR.Value
  else
  begin
    qryEmpleados.First;
    rxcboxEmpleados.Text:= qryEmpleadosNOMBREVENDEDOR.Value;
  end;
  rxcboxEmpleadosChange(Self);
  RadioGroup2Click(Self);
  if GLBECOM = 0 then
  ReenviaPagoaWispro1.Visible:=False
  else ReenviaPagoaWispro1.Visible:=True;
end;

procedure TfrmCobrarFacturas.BitBtn6Click(Sender: TObject);
begin
  rxAcumulador.Close;
  rxAcumulador.Open;
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  qryfactpendiente.Close;
  qryfactpendiente.Open;
  BitBtn7Click(Self);
  //rxcboxEmpleados.Clear;
end;

function TfrmCobrarFacturas.TotalFacturas: Real;
var
   monto : Real;
   i : integer;
begin
  monto:=0;
  if (rxDBGrid1.SelectedRows.Count > 0) then
  with rxDBGrid1.DataSource.DataSet do
  for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
  begin
    GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
    monto := monto + qryFactPendienteMONTO_PENDIENTE.Value;
  end;
  result := monto;
end;

procedure TfrmCobrarFacturas.ProcSumar;
  var
    x : Integer;
begin
  if Not Assigned(frmCobrarFacturas) then Exit;
  
  if frmCobrarFacturas.Showing then
  begin
    if rxAcumulador.recordcount = 0 then
    begin
      rxAcumulador.Insert;
      rxAcumuladorMonto.Value:=0;
      rxAcumulador.Post;
    end;
    rxAcumulador.Edit;
    rxAcumuladorMonto.Value:=edtMontoAcobrar.ValueFloat - SumarFactAcobrar;
    if (rxAcumuladorMonto.Value < 0.05) then
    rxAcumuladorMonto.Value:=0;
    if (rxAcumuladorMonto.Text <> '') then
    begin
      try
        if (rxAcumuladorMonto.Value >= 0) then
        begin
          if rxAcumuladorMonto.Value > 0.001 then
          edtDisponible.SetFloat(rxAcumuladorMonto.Value)
          else
          edtDisponible.SetFloat(0);
        end;
      except
      end;
    end;
    if edtDisponible.ValueFloat < 0 then
       RxLabel1.Font.Color:=clRed else
    RxLabel1.Font.Color:= clWindowText;
    rxAcumulador.Post;
  end;
end;

procedure TfrmCobrarFacturas.BitBtn7Click(Sender: TObject);
begin
  ProcSumar;
end;

procedure TfrmCobrarFacturas.BitBtn3Click(Sender: TObject);
begin
  ProcInsertaFactura(2{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmCobrarFacturas.BitBtn2Click(Sender: TObject);
begin
  if rxFacturaACobrar.RecordCount > 0 then
  rxFacturaACobrar.Delete;
  BitBtn7Click(Self);
end;

procedure TfrmCobrarFacturas.BitBtn4Click(Sender: TObject);
begin
  if MessageDlg('Cancelar facturas seleccionadas?', mtInformation, [mbyes, mbno], 0)=mryes then
  begin
    rxFacturaACobrar.First;
    While Not rxFacturaACobrar.Eof Do
    begin
      rxFacturaACobrar.Delete;
    end;
    mto:=0;
  end;
  BitBtn7Click(Self);
end;


function TfrmCobrarFacturas.SumarFactAcobrar: Real;
var
  t : Real;
begin
  t:=0;
  if rxFacturaACobrar.State = dsInactive then Exit;  
  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin
    t:= t + rxFacturaACobrarMontoAbonado.Value;
    rxFacturaACobrar.Next;
  end;
  result := t;
  RxLabel2.Caption:= InsertarComa(FloatToStr(t));
  //if (edtMontoAcobrar.ValueFloat >= t) then
  //RadioButton1.Checked := true
  //else
  //if (edtMontoAcobrar.ValueFloat < t) then
  //RadioButton1.Checked:=True;
end;

procedure TfrmCobrarFacturas.edtMontoAcobrarChange(Sender: TObject);
begin
  if edtMontoAcobrar.ValueFloat > 0 then
  begin
  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
  BitBtn3.Enabled:=True;
  BitBtn4.Enabled:=True;
  end else
  begin
  BitBtn1.Enabled:=False;
  BitBtn2.Enabled:=False;
  BitBtn3.Enabled:=False;
  BitBtn4.Enabled:=False;
  end;
  if dmcxc.rxIngChequeDet.State = dsBrowse then
  begin
    dmcxc.rxIngChequeDet.Edit;
    dmcxc.rxIngChequeDetMonto_Cheque.Value:= edtMontoAcobrar.ValueFloat;
  end;
  if dmcxc.rxIngChequeDet.State in [dsEdit, dsInsert] then
  dmcxc.rxIngChequeDet.Post;
end;

procedure TfrmCobrarFacturas.ProcFacturasACxc;
begin
  if dmcxc.qryTrancxc.State = dsInactive then
  begin
    dmcxc.qrytrancxc.Close;
    dmcxc.qrytrancxc.Params[2].Value := GlbCia_Key;
    dmcxc.qrytrancxc.Open;
  end;
    if dmingresos.tblIngresoMaster.state = dsInactive then
    dmingresos.tblIngresoMaster.Open;
    dmingresos.tblIngresoMaster.Append;
    dmingresos.tblIngresoMasterCIA_KEY.Value:= glbCia_Key;
    //dmingresos.tblIngresoMasterSERIE.Value:= FsqlMaxNumero('ingresos','Serie');
    dmingresos.tblIngresoMasterTIPO.Value   := rxFacturaACobrarTipoFactPend.Value;
    dmingresos.tblIngresoMasterNUMERO.Value := FsqlMaxNumero('ingresos','numero');
    dmingresos.tblIngresoMasterMONEDA.Value := qryFactPendienteMONEDA.Value;
    //if GLBSAM = 1 then
    dmingresos.tblIngresoMasterFECHA.Value  := ExtraerFecha(dtpkFechaAplicaPago.Date);
    //else
    //dmingresos.tblIngresoMasterFECHA.Value  := ExtraerFecha(glbFechatrnDiaria);
    dmingresos.tblIngresoMasterVALOR_ING.Value := SumarFactAcobrar;//edtmontoApagar.ValueFloat,
    dmingresos.tblIngresoMasterTIPO_ING.Value  := 2;//Credito, tipo_ing
    dmingresos.tblIngresoMasterNOMBRE_CTE.Value:= rxFacturaACobrarNombreCliente.Value;
    dmingresos.tblIngresoMasterCODIGO_CTE.Value:= rxFacturaACobrarCodCte.Value;
    dmingresos.tblIngresoMasterCOD_SERVICIO.Value:= 0;//codservicio
    dmingresos.tblIngresoMasterFORMA_PAGO.Value:=rxFormaPagoformaPago.Value;
    dmingresos.tblIngresoMasterDOCUMENTO.Value := rxFacturaACobrarNumFactura.AsString;
    dmingresos.tblIngresoMasterCONCEPTO.Value  := rxFacturaACobrarConcepto.Value;
    if _codUsuario > 0 then
    dmingresos.tblIngresoMasterCOD_EMPLEADO.Value := _codUsuario
    else
    dmingresos.tblIngresoMasterCOD_EMPLEADO.Value := VarUsuarioGlb;
    dmingresos.tblIngresoMasterSTATUS.Value  := 'A';
    dmingresos.tblIngresoMasterIN_POR.Value  := strUserName;
    dmingresos.tblIngresoMasterFECHA_IN.Value:= Now;
    if (edtNota.Text <> '') then
    dmingresos.tblIngresoMasterOBSERVACION.Value := edtNota.Text;
    GlbSalvarQuery(dmingresos.tblIngresoMaster);

    if Not CheckBox4.Checked then
    //Guardar Info Pago con Cheques
    RegistrarDetalleCheque(dmIngresos.tblIngresoMasterNUMERO.AsInteger);//Guardar paso 2

    strNumero := dmingresos.tblIngresoMasterNUMERO.AsString;

  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin
    dmcxc.qrytrancxc.Insert;
    dmcxc.qryTrancxcnumero_recibo.Value:=dmingresos.tblIngresoMasterNumero.AsInteger;
    //dmcxc.qrytrancxcserie.Value := FsqlMaxNumero('TRANS_CXC','SERIE');
    //if dmcxc.qrytrancxcserie.Value = 0 then
    //dmcxc.qrytrancxcserie.Value          := 1;
    dmcxc.qrytrancxctipo_doc.Value       := 2; //Recibo
    dmcxc.qrytrancxccia_key.Value        := GlbCia_Key;
    dmcxc.qrytrancxcmoneda.Value         := dmingresos.tblIngresoMasterMONEDA.Value;
    //if GLBSAM = 1 then
    dmcxc.qrytrancxcfecha.Value := ExtraerFecha(dtpkFechaAplicaPago.Date);
    //else
    //dmcxc.qrytrancxcfecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
    
    dmcxc.qrytrancxcnumero_doc.Value     := rxFacturaACobrarNumFactura.Value;
    dmcxc.qrytrancxctipo_serv.Value      := 2;
    dmcxc.qrytrancxccodigo_cliente.Value := rxFacturaACobrarCodCte.Value;
    dmcxc.qrytrancxccodigo_serv.Value    := 0;
    dmcxc.qrytrancxcconcepto.Value       := rxFacturaACobrarConcepto.Value;
    dmcxc.qrytrancxcValor_documento.Value:= rxFacturaACobrarMontoAbonado.Value;
    dmcxc.qrytrancxcTipo_tranf.Value     := 2;
    if _codUsuario > 0 then
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= _codUsuario
    else
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= VarUsuarioGlb;
    dmcxc.qryTrancxcIN_POR.Value         := strusername;
    dmcxc.qryTrancxcFECHA_IN.Value       := Now;
    dmcxc.qrytrancxcStatus.Value         := 'A';
    dmcxc.qrytrancxc.Post;
    dmcxc.qrytrancxc.ApplyUpdates;

    //if Not CheckBox4.Checked then
    ProcUpdateFactPendiente;//Actualiza tabla factura pendiente    //Guardar paso 3

      stpactfctingresos.Params[0].value:= FsqlMaxNumero('FctIngresos','Serie');
      stpactfctingresos.Params[1].Value:= dmIngresos.tblIngresoMasterNUMERO.Value;
      stpactfctingresos.Params[2].Value:= rxFacturaACobrarNumFactura.Value;
      stpactfctingresos.Params[3].Value:= rxFacturaACobrarMontoAbonado.Value;
      stpactfctingresos.Params[4].Value:= dmingresos.tblIngresoMasterMONEDA.Value;//FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value;
      stpactfctingresos.Params[5].Value:= 'A';
      stpactfctingresos.Params[6].Value:= 0;//Renta Vehiculo;dmIngresos.tblIngresosDetCOD_SERVICIO.Value;
      stpactfctingresos.Params[7].Value:= rxFacturaACobrarTipoFactPend.Value;// := qryFactPendienteTIPO.Value;
      stpactfctingresos.Params[8].Value:= 2;//Recibos;
      stpactfctingresos.ExecProc;

      try
        stpactfctingresos.Transaction.CommitRetaining;
      except
      stpactfctingresos.Transaction.RollbackRetaining;
      end;

      if dmIngresos.tblIngresoDet.state = dsInactive then
      dmIngresos.tblIngresoDet.open;

      dmIngresos.tblIngresoDet.Insert;
      dmIngresos.tblIngresoDetSERIE_MASTER.AsInteger:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
      dmIngresos.tblIngresoDetNUMERO_ING.AsInteger:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
      dmIngresos.tblIngresoDetMonto_Fact_pendte.Value:= rxFacturaACobrarMontoFactura.Value;
      //0,//CodServicio

      dmIngresos.tblIngresoDetCOD_SERVICIO.Value:=0;
      dmIngresos.tblIngresoDetCOD_DEPARTAMENTO.Value := '2';//,//Depto
      dmIngresos.tblIngresoDetDETALLE.Value := rxFacturaACobrarConcepto.Value;
      //,//edtMontoApagar.ValueFloat,
      dmIngresos.tblIngresoDetVALOR_DET.Value := rxFacturaACobrarMontoAbonado.Value;
      dmIngresos.tblIngresoDetSTATUS.Value := 'A';
      dmIngresos.tblIngresoDetVALOR_IMPUESTO.Value:=0;
      dmIngresos.tblIngresoDetPORC_DESCUENTO.Value:=0;
      dmIngresos.tblIngresoDetFECHA_IN.Value:= Now;
      dmIngresos.tblIngresoDetIN_POR.Value  := StrUserName;
      dmIngresos.tblIngresoDetFCTING_SERIE.Value :=stpactfctingresos.Params[0].value;
      //dmIngresos.tblIngresoDetFECHA_MOD.Value := Null;//,
      //dmIngresos.tblIngresoDetMOD_POR.Value:= null;//,//FrmRecibosYCtaXCobrar.rxFormaPagoTipoTarjeta.Value,
      if (rxFormaPago.RecordCount = 1) then
      begin
        dmIngresos.tblIngresoDetTIPO_TARJETA.Value := rxFormaPagoTipoTarjeta.Value;
        dmIngresos.tblIngresoDetNUMERO_TARJETA_CRED.Value:= rxFormaPagoNumeroTarjeta.Value;
        dmIngresos.tblIngresoDetANO_VENCE.Value := rxFormaPagoAnio.Value;
        dmIngresos.tblIngresoDetMES_VENCE.Value := rxFormaPagoMes.Value;
        dmIngresos.tblIngresoDetMONTOAUTORIZADO.Value  := rxFormaPagoMONTOAUTORIZADO.Value;
        dmIngresos.tblIngresoDetNUMERO_APROBACION.Value:= rxFormaPagoNumeroAutorizacion.Value;
      end;
      dmIngresos.tblIngresoDettipo.Value:= 1;//,
      //dmIngresos.tblIngresoDetcodigo_proveedor.Value:=stpactfctingresos.Params[0].value//fct_serie tabla fctingreso
      //]);

      dmIngresos.tblIngresoDet.Edit;
      GlbSalvarQuery(dmIngresos.tblIngresoDet);
      rxFacturaACobrar.Next;
      end;
  if Not dmcxc.qrytrancxc.Transaction.InTransaction then
  dmcxc.qrytrancxc.transaction.StartTransaction;
  try
    dmcxc.qrytrancxc.transaction.CommitRetaining;
  except
  dmcxc.qrytrancxc.transaction.RollbackRetaining;
  end;

  if Not stp_UpdateCxc.Transaction.InTransaction then
  stp_UpdateCxc.transaction.StartTransaction;
  try
    stp_UpdateCxc.transaction.CommitRetaining;
  except
  stp_UpdateCxc.transaction.RollbackRetaining;
  end;
  
  //ibstpProcInsCxcHist.Params[0].Value:= Output Parameter
  ibstpProcInsCxcHist.Params[1].Value:= dmingresos.tblIngresoMasterNUMERO.AsInteger;
  ibstpProcInsCxcHist.Params[2].Value:= rxFacturaACobrarCodCte.Value;
  ibstpProcInsCxcHist.Params[3].Value:= Trim(dmingresos.tblIngresoMasterMONEDA.Value);
  ibstpProcInsCxcHist.ExecProc;
  ProcInsertarDetPagos(dmcxc.qryTrancxcSERIE.AsInteger);
end;

procedure TfrmCobrarFacturas.ProcUpdateFactPendiente;
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  stp_UpdateCxc.Params[1].Value:= 2;//tipo
  stp_UpdateCxc.Params[2].Value:= dmingresos.tblIngresoMasterMONEDA.Value;//moneda
  stp_UpdateCxc.Params[3].Value:= rxFacturaACobrarNumFactura.Value;//numero_fact
  stp_UpdateCxc.Params[4].Value:= rxFacturaACobrarMontoAbonado.Value;//monto_pagado
  stp_UpdateCxc.Params[5].Value:= 'A';//status
  stp_UpdateCxc.Params[6].Value:= 1;//accion 1 = abono
  stp_UpdateCxc.Params[7].Value:= rxFacturaACobrarCodCte.Value;//CODIGO_CTE_IN
  stp_UpdateCxc.Params[8].Value:= GlbFechaTrnDiaria;
  stp_UpdateCxc.Params[9].Value:= dmcxc.qrytrancxcserie.Value;

  stp_UpdateCxc.ExecProc; //UPDATE balance_cte, facturas_pendiente,
                          //TRANS_CXC = R
end;

procedure TfrmCobrarFacturas.GuardarReciboMaster;
begin
end;

procedure TfrmCobrarFacturas.guardarReciboDetalle(descDetalle : String);
begin
end;

procedure TfrmCobrarFacturas.ImprimirRecibo(tipo :smallint);
var
  flag : Boolean;
begin
  ReConfirmaPago:=False;
  if tipo = 1 then
  begin
    strNumero := InputBox('Imprimir recibo de ingreso','Entre Número de Recibo','');
    dmIngresos.qryRepIngMaster.Close;
    dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
    dmIngresos.qryRepIngMaster.Open;
    qryBlcCxcRecibo.Close;
    qryBlcCxcRecibo.Params[0].Value := StrToInt(strNumero);
    qryBlcCxcRecibo.Params[1].Value := dmIngresos.qryRepIngMasterCODIGO_CTE.Value;    
    qryBlcCxcRecibo.Open;
  end else
  begin
    dmIngresos.qryRepIngMaster.Close;
    dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
    dmIngresos.qryRepIngMaster.Open;
    qryBlcCxcRecibo.Close;
    qryBlcCxcRecibo.Params[0].Value := StrToInt(strNumero);
    qryBlcCxcRecibo.Params[1].Value := dmIngresos.qryRepIngMasterCODIGO_CTE.Value;
    qryBlcCxcRecibo.Open;
  end;

  dmIngresos.tblIngresoMaster.Close;
  dmIngresos.tblIngresoMaster.params[0].Value:= ExtraerFecha(dmIngresos.qryRepIngMasterFECHA.Value);
  dmIngresos.tblIngresoMaster.params[1].Value:= ExtraerFecha(dmIngresos.qryRepIngMasterFECHA.Value);
  dmIngresos.tblIngresoMaster.Open;
  if not dmIngresos.tblIngresoMaster.Locate('NUMERO',dmIngresos.qryRepIngMaster.Params[0].Value,[]) then
  begin
    MessageDlg('Recibo no encontrado, verifique.', mtWarning, [mbOK], 0);
    exit;
  end;

  if _codUsuario > 0 then
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',_codUsuario,[])
  else
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);

  dmIngresos.qryRepIngMaster.Close;
  dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
  dmIngresos.qryRepIngMaster.Open;

  if (GlbFarmacia = 1) and (GlbFact55Pulg = 1) then
  begin
    qckReciboIngresoAIFarmacia:=TqckReciboIngresoAIFarmacia.Create(nil);
    try
      if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
      qckReciboIngresoAIFarmacia.qrLabelReimprimir.Caption:='Re-Impresion' else
      qckReciboIngresoAIFarmacia.qrLabelReimprimir.Caption:='';
      qckReciboIngresoAIFarmacia.preview;
    finally
    qckReciboIngresoAIFarmacia.free;
    qckReciboIngresoAIFarmacia:=nil;
    end;
  end else
  if (GlBBurgos = 1) then
  begin
    qckReciboIngresoByB:=TqckReciboIngresoByB.Create(Nil);
    try
      if (dmIngresos.tblIngresoMasterSTATUS.Value ='P') then
      qckReciboIngresoByB.qrLabelReimprimir.Caption:='Re-Impresion' else
      qckReciboIngresoByB.qrLabelReimprimir.Caption:='';
      qckReciboIngresoByB.Preview;
    finally
    qckReciboIngresoByB.Free;
    qckReciboIngresoByB:=Nil;
    end;
  end else
  if (UpperCase(GLBFormatoFactura) = 'BYMSERVICIOS') then
  begin
    qckReciboIngresoByM:=TqckReciboIngresoByM.Create(nil);
    try
      if (dmIngresos.tblIngresoMasterSTATUS.Value ='P') then
      qckReciboIngresoByM.qrLabelReimprimir.Caption:='Re-Impresion' else
      qckReciboIngresoByM.qrLabelReimprimir.Caption:='';
      qckReciboIngresoByM.preview;
    finally
    qckReciboIngresoByM.free;
    qckReciboIngresoByM:=nil;
    end;
  end else
  if (GLBSAM = 1) then
  begin
    if GLBRecCxcPOS = 0 then
    begin
      qckReciboIngresoGenPOS:=TqckReciboIngresoGenPOS.Create(nil);
      try
        if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
        qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='Re-Impresion' else
        qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='';
        if dmIngresos.qryRepIngMasterFORMA_PAGO.Value = 20 then
        qckReciboIngresoGenPOS.QRLabel17.Caption:='#Tranf.:'
        else
        begin
          qckReciboIngresoGenPOS.QRLabel17.Caption :='';
          qckReciboIngresoGenPOS.QRDBText13.Enabled:=False;
          //qckReciboIngresoGenPOS.ChildBand2.Height :=23;
        end;

      qckReciboIngresoGenPOS.Prepare;
      //qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='';
      if (dmIngresos.qryRepIngDetalle.RecordCount > 1) or (qckReciboIngresoGenPOS.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckReciboIngresoGenPOS.PageNumber > 1) then
            begin
              qckReciboIngresoGenPOS.Page.Length:=qckReciboIngresoGenPOS.Page.Length + 0.30;
              qckReciboIngresoGenPOS.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      qckReciboIngresoGenPOS.Preview;
    finally
    qckReciboIngresoGenPOS.free;
    qckReciboIngresoGenPOS:=nil;
    end;    
    end else
    begin
      qckReciboIngresoAI:=tqckReciboIngresoAI.Create(nil);
      try
        if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
        qckReciboIngresoAI.qrLabelReimprimir.Caption:='Re-Impresion' else
        qckReciboIngresoAI.qrLabelReimprimir.Caption:='';
        qckReciboIngresoAI.preview;
      finally
      qckReciboIngresoAI.free;
      qckReciboIngresoAI:=nil;
      end;
    end;
  end else
  if (GLBEcom = 1) then
  begin
    ReConfirmaPago:=True;
    begin
      qckReciboIngresoGenPOS:=TqckReciboIngresoGenPOS.Create(nil);
      try
      if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
      qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='Re-Impresion' else
      qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='';
      if dmIngresos.qryRepIngMasterFORMA_PAGO.Value = 20 then
      qckReciboIngresoGenPOS.QRLabel17.Caption:='#Tranf.:'
      else
      begin
        qckReciboIngresoGenPOS.QRLabel17.Caption :='';
        qckReciboIngresoGenPOS.QRDBText13.Enabled:=False;
        //qckReciboIngresoGenPOS.ChildBand2.Height :=23;
      end;

      qckReciboIngresoGenPOS.Prepare;
      //qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='';
      if (dmIngresos.qryRepIngDetalle.RecordCount > 1) or (qckReciboIngresoGenPOS.PageNumber > 1) then
      begin
        repeat
          begin
            if (qckReciboIngresoGenPOS.PageNumber > 1) then
            begin
              qckReciboIngresoGenPOS.Page.Length:=qckReciboIngresoGenPOS.Page.Length + 0.30;
              qckReciboIngresoGenPOS.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      qckReciboIngresoGenPOS.Preview;
    finally
    qckReciboIngresoGenPOS.free;
    qckReciboIngresoGenPOS:=nil;
    end;
    end;
  end else
  begin
    if GLBRecCxcPOS = 0 then
    begin
      qckReciboIngresoGenPOS:=TqckReciboIngresoGenPOS.Create(nil);
      try
        if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
        qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='Re-Impresion' else
        qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='';
        if dmIngresos.qryRepIngMasterFORMA_PAGO.Value = 20 then
        qckReciboIngresoGenPOS.QRLabel17.Caption:='#Tranf.:'
        else
        begin
          qckReciboIngresoGenPOS.QRLabel17.Caption :='';
          qckReciboIngresoGenPOS.QRDBText13.Enabled:=False;
          //qckReciboIngresoGenPOS.ChildBand2.Height :=23;
        end;

        qckReciboIngresoGenPOS.Prepare;
        //qckReciboIngresoGenPOS.qrLabelReimprimir.Caption:='';
        if (dmIngresos.qryRepIngDetalle.RecordCount > 1) or (qckReciboIngresoGenPOS.PageNumber > 1) then
        begin
        repeat
          begin
            if (qckReciboIngresoGenPOS.PageNumber > 1) then
            begin
              qckReciboIngresoGenPOS.Page.Length:=qckReciboIngresoGenPOS.Page.Length + 0.30;
              qckReciboIngresoGenPOS.Prepare;
              flag:=False;
            end else break;
          end;
        until flag = true;
      end;
      qckReciboIngresoGenPOS.Preview;
    finally
    qckReciboIngresoGenPOS.free;
    qckReciboIngresoGenPOS:=nil;
    end;    
    end else
    begin
    qckReciboIngresoGen:=TqckReciboIngresoGen.Create(nil);
    try
      if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
      qckReciboIngresoGen.qrLabelReimprimir.Caption:='Re-Impresion' else
      qckReciboIngresoGen.qrLabelReimprimir.Caption:='';
      if dmIngresos.qryRepIngMasterFORMA_PAGO.Value = 20 then
      qckReciboIngresoGen.QRLabel17.Caption:='#Tranf.:';

      qckReciboIngresoGen.Preview;
    finally
    qckReciboIngresoGen.free;
    qckReciboIngresoGen:=nil;
    end;
    end;
    {qckReciboIngreso:=TqckReciboIngreso.Create(nil);
    try
      if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
      qckReciboIngreso.qrLabelReimprimir.Caption:='Re-Impresion' else
      qckReciboIngreso.qrLabelReimprimir.Caption:='';
      qckReciboIngreso.Preview;
    finally
    qckReciboIngreso.free;
    qckReciboIngreso:=nil;
    end;}
  end;

  if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
  begin
    dmIngresos.tblIngresoMaster.Edit;
    dmIngresos.tblIngresoMasterSTATUS.Value := 'P';
    GlbSalvarQuery(dmIngresos.tblIngresoMaster);
  end;

  //Siguientes lineas ignoradas temporalmente
  exit;
  //qckReciboIngreso:=TqckReciboIngreso.Create(Nil);
  qckReciboAbonoCXC:= TQckReciboAbonoCXC.Create(Nil);
  try
    if (dmIngresos.tblIngresoMasterSTATUS.Value='P') then
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='Re-Impresion' else
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='';

    qckReciboAbonoCXC.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    qckReciboAbonoCXC.lblBalanceAct.Caption:= InsertarComa(qryBlcCxcReciboBALANCE_ACTUAL.AsString);
    //qckReciboAbonoCXC.qrLabelReimprimir.Caption:=;//aqui aqui aqui
    if dmIngresos.qryRepIngDetalle.RecordCount > 1 then
    begin
      qckReciboAbonoCXC.Page.Length := qckReciboAbonoCXC.Page.Length +
      dmIngresos.qryRepIngDetalle.RecordCount * 2;
    end;
    if  MessageDlg('Imprimir?',mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      qckReciboAbonoCXC.PrinterSetup;
      qckReciboAbonoCXC.Print;
    end else
    qckReciboAbonoCXC.Preview;
  finally
  qckReciboAbonoCXC.Free;
  qckReciboAbonoCXC:=Nil;
  if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
  begin
    dmIngresos.tblIngresoMaster.Edit;
    if (edtNota.Text <> '') then
    dmingresos.tblIngresoMasterOBSERVACION.Value := edtNota.Text;
    dmIngresos.tblIngresoMasterSTATUS.Value := 'P';
    GlbSalvarQuery(dmIngresos.tblIngresoMaster);
  end;
  end;
end;

procedure TfrmCobrarFacturas.ReImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo(1);
end;

procedure TfrmCobrarFacturas.BuscarCliente1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      frmCobrarFacturas.CodCte:=FrmBuscarClientesPersonas.CodigoCliente;
      AbrirTablaRetenciones(FrmBuscarClientesPersonas.CodigoCliente);
      strNombreEmpresa:=FrmBuscarClientesPersonas.nombrecliente;
      FormShow(Self);
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
  
end;

procedure TfrmCobrarFacturas.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if (rxFormaPagoformaPago.Value = 3) and (CheckBox4.Checked) then //cheques
  begin
    raise Exception.Create('Operacion no válida con nota de crédito');
    RxDBLookupCombo1.setfocus;
    exit;
  end;
  if edtMontoAcobrar.ValueInteger = 0 then
  begin
    MessageDlg('Indique monto a cobrar.', mtWarning, [mbOK], 0);
    Exit;
  end;
  if (rxFormaPagoformaPago.Value = 2) then
  RegistrarDetallesIngresos else
  if (rxFormaPagoformaPago.Value = 33) then //No usado cheques o transferencia
  begin
    frmDatosIngCheque:=TfrmDatosIngCheque.Create(nil);
    try
      if (rxFormaPagoformaPago.Value = 20) then
      begin
        frmDatosIngCheque.Label1.Caption:='#Transf';
        frmDatosIngCheque.Label3.Caption:='Monto';
      end;
      if dmcxc.rxIngChequeDet.State = dsInactive then
      begin
        dmcxc.rxIngChequeDet.Close;
        dmcxc.rxIngChequeDet.Open;
      end else
      if dmcxc.rxIngChequeDet.RecordCount = 0 then
        dmcxc.rxIngChequeDet.Insert
      else
      dmcxc.rxIngChequeDet.Edit;
        dmcxc.rxIngChequeDetMonto_Cheque.Value:= edtMontoAcobrar.ValueFloat;
      frmDatosIngCheque.Showmodal;
      if dmcxc.rxIngChequeDet.state in [dsEdit, dsInsert] then
      dmcxc.rxIngChequeDet.Post;
    finally
    frmDatosIngCheque.Free;
    frmDatosIngCheque:=Nil;
    end;
  end;

  if rxFormaPago.State in [dsEdit, dsInsert] then
  rxFormaPago.Post;
end;

function TfrmCobrarFacturas.FNumReciboMax: Integer;
begin
  ibsqlLastNum.Close;
  ibsqlLastNum.ExecQuery;
  Result := ibsqlLastNum.FieldByName('numeromax').AsInteger;
end;

procedure TfrmCobrarFacturas.qryFactPendienteAfterOpen(DataSet: TDataSet);
var
  monto : Extended;
begin
  qryFactPendiente.First;
  monto:=0;
  While not qryFactPendiente.Eof do
  begin
    monto := monto + qryFactPendienteMONTO_PENDIENTE.Value;
    qryFactPendiente.Next;
  end;
  qryFactPendiente.First;
  edtMontoTotal.SetFloat(monto);
  if (GLBECOM = 1) then
  begin
    edtMontoAcobrar.SetFloat(monto);
    RxDBGrid1.SelectAll;
    BitBtn3Click(Self);
  end;
end;

procedure TfrmCobrarFacturas.AbrirTablaRetenciones(xcodcte:integer);
begin
  qryRetencionDgii.Close;
  qryRetencionDgii.Params[0].Value:=xcodcte;
  qryRetencionDgii.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  qryRetencionDgii.Open;
  if qryRetencionDgii.RecordCount > 0 then
  begin
    CheckBox1.Checked:=True;
    CheckBox1.Caption:=Format('Descontar Retencion Impuesto de %s',[qryRetencionDgiiPORCIENTO.AsString])+'%';
    CheckBox1.Enabled:=False;
  end;
end;

procedure TfrmCobrarFacturas.RegistrarDetallesIngresos;
begin
  if edtMontoAcobrar.ValueInteger = 0 then
  begin
    MessageDlg('Indique monto a cobrar.', mtWarning, [mbOK], 0);
    Exit;
  end;
  frmAceptaDetalleFormaPago:=TfrmAceptaDetalleFormaPago.Create(Nil);
  try
    if rxFormaPago.State = dsInactive then
    begin
      rxFormaPago.Close;
      rxFormaPago.Open;
    end;
    dmIngresos.tblIngresoDet.Close;
    dmIngresos.tblIngresoDet.Open;
    frmAceptaDetalleFormaPago.montoPgdo:=edtMontoAcobrar.ValueFloat;
    //rxFormaPago.Insert;
    //frmCobrarFacturas.rxFormaPagoformaPago.Value:=fpago;
    if frmAceptaDetalleFormaPago.Showmodal = mrOk then
    begin
      if rxFormaPago.State in [dsEdit, dsInsert] then
      rxFormaPago.Post;
      //frmpagofacturas:=Tfrmpagofacturas.Create(Nil);
      //try
      //  if xNumeroFact > 0 then
      //  frmpagofacturas.edtnumfact.Text := IntToStr(xNumeroFact);
      //  frmpagofacturas.EdtMontoApagar.Text:= Format('%8.2f',[edtMontoAplicar.ValueFloat]);
      //  frmpagofacturas.IngresReciboMaster:=True;
      //  frmpagofacturas.Showmodal;
      //finally
      //frmpagofacturas.Free;
      //frmpagofacturas:=Nil;
      //end;
    end;
  finally
  frmAceptaDetalleFormaPago.Free;
  frmAceptaDetalleFormaPago:=Nil;
  end;
end;

procedure TfrmCobrarFacturas.RegistrarDetalleCheque(numRecibo: Integer);
begin
  if dmcxc.rxIngChequeDet.State = dsInactive then exit;
  if dmcxc.rxIngChequeDet.RecordCount = 0 then Exit;
  if rxFormaPagoFormapago.Value = 20 then  //Transferencia Banco
  begin
    dmIngresos.tblTransferencias.Close;
    dmIngresos.tblTransferencias.params[0].Value:= dmcxc.rxIngChequeDetNumero_Cheque.Value;
    dmIngresos.tblTransferencias.Open;
    dmIngresos.tblTransferencias.first;
    if dmIngresos.tblTransferencias.RecordCount = 0 then
    begin
      dmIngresos.tblTransferencias.Append;
      dmIngresos.tblTransferenciasNUMERO_TRANSF.Value:= dmcxc.rxIngChequeDetNumero_Cheque.Value;
      dmIngresos.tblTransferenciasCODIGO_CTE.Value   := qryFactPendienteCODIGO_CTE.Value;
      dmIngresos.tblTransferenciasCODIGO_BANCO.Value := dmcxc.rxIngChequeDetCodigo_Banco.Value;
      dmIngresos.tblTransferenciasMONTO.Value        := dmcxc.rxIngChequeDetMonto_Cheque.Value;
      dmIngresos.tblTransferenciasNUMERO_RECIBO.Value:= numRecibo;
      GlbSalvarQuery(dmIngresos.tblTransferencias);
    end;
    Exit;
  end;
  
  dmcxc.tblIngChequesDet.Close;
  dmcxc.tblIngChequesDet.Open;
  dmcxc.rxIngChequeDet.First;
  While not dmcxc.rxIngChequeDet.Eof do
  begin
    if dmcxc.rxIngChequeDetNumero_Cheque.IsNull then
    begin
      dmcxc.rxIngChequeDet.Next;
      Continue;
    end;
    dmcxc.tblIngChequesDet.Insert;
    dmcxc.tblIngChequesDetSERIE.Value:= FsqlMaxNumero('cobros_en_cheque','serie');
    if (dmcxc.tblIngChequesDetSERIE.IsNull) Or
    (dmcxc.tblIngChequesDetSERIE.Value = 0) then
    dmcxc.tblIngChequesDetSERIE.Value := 1;
    dmcxc.tblIngChequesDetNUMERO_RECIBO.Value:=numRecibo;
    dmcxc.tblIngChequesDetNUMERO_CHEQUE.Value:= dmcxc.rxIngChequeDetNumero_Cheque.Value;
    dmcxc.tblIngChequesDetCODIGO_BANCO.Value:= dmcxc.rxIngChequeDetCodigo_Banco.Value;
    dmcxc.tblIngChequesDetMONTO_CHEQUE.Value:= dmcxc.rxIngChequeDetMonto_Cheque.Value;
    if _codUsuario > 0 then
    dmcxc.tblIngChequesDetCOD_USUARIO.Value:= _codUsuario
    else
    dmcxc.tblIngChequesDetCOD_USUARIO.Value:= VarUsuarioGlb;
    
    dmcxc.tblIngChequesDetFECHA_IN.Value := Now;
    dmcxc.tblIngChequesDetIN_POR.Value := StrUserName;
    dmcxc.tblIngChequesDet.Post;
    dmcxc.tblIngChequesDet.ApplyUpdates;
    if not dmcxc.tblIngChequesDet.Transaction.InTransaction then
    dmcxc.tblIngChequesDet.Transaction.StartTransaction;
    try
      dmcxc.tblIngChequesDet.Transaction.CommitRetaining;
    except
    dmcxc.tblIngChequesDet.Transaction.RollbackRetaining;
    end;

    dmcxc.rxIngChequeDet.Next;
  end;
end;

procedure TfrmCobrarFacturas.DescargaNotaCredito;
var
  resto : Currency;
begin
  //if Not (CheckBox4.Checked) then Exit;
  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin

  if (rxFacturaACobrarMontoNCRAplicado.Value > 0) then
  begin
    dmDatos.tblDevolucionAbierta.First;
    resto:=rxFacturaACobrarMontoNCRAplicado.Value;
    While Not dmDatos.tblDevolucionAbierta.Eof Do
    begin
      dmDatos.tblDevolucionAbierta.Edit;
      if (resto >= dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value) then
      begin
        resto:=resto - dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value;
        dmDatos.tblDevolucionAbierta.Edit;
        dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value := 0;
        dmDatos.tblDevolucionAbiertaSTATUS.Value   := 'R';
        dmDatos.tblDevolucionAbiertaFECHA_MOD.Value:= Now;
        dmDatos.tblDevolucionAbiertaMOD_POR.Value  := StrUserName;
      end else
      begin
        dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value:=
        dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value - resto;
        resto:=0;
        //TotalesMontoNCRAplicado.Value;
        dmDatos.tblDevolucionAbiertaFECHA_MOD.Value:= Now;
        dmDatos.tblDevolucionAbiertaMOD_POR.Value  := StrUserName;
      end;
      GlbSalvarQuery(dmDatos.tblDevolucionAbierta);
      if (resto <= 0) then break;
      dmDatos.tblDevolucionAbierta.Next;
    end;
    dmDatos.tblDevolucionAbierta.Close;
    dmDatos.tblDevolucionAbierta.Open;
    rxFacturaACobrar.next;
  end;
  end;
end;

procedure TfrmCobrarFacturas.CheckBox4Click(Sender: TObject);
var
    montoNCR : Currency;
begin
  montoNCR:=0;
  dmDatos.tblDevolucionAbierta.Close;
  dmDatos.tblDevolucionAbierta.Params[0].Value := qryFactPendienteMONEDA.Value;//moneda
  dmDatos.tblDevolucionAbierta.Params[1].Value := qryFactPendienteCODIGO_CTE.Value; //codigocte
  dmDatos.tblDevolucionAbierta.Open;
  dmDatos.tblDevolucionAbierta.First;
  While Not dmDatos.tblDevolucionAbierta.Eof do
  begin
    montoNCR:= montoNCR + dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value;
    dmDatos.tblDevolucionAbierta.Next;
  end;
  edtMontoAcobrar.SetFloat(montoNCR);
end;

procedure TfrmCobrarFacturas.ProcRetencionARS(Desc:string;numFct: integer;_monto :Currency);
begin
   dmcxc.qrytrancxc.Insert;
  //dmcxc.qryTrancxcnumero_recibo.Value    := null;
    dmcxc.qrytrancxctipo_doc.Value       := 2; //Recibo
    dmcxc.qrytrancxccia_key.Value        := GlbCia_Key;
    dmcxc.qrytrancxcmoneda.Value         := '1';

    //if GLBSAM = 1 then
    dmcxc.qrytrancxcfecha.Value  := ExtraerFecha(dtpkFechaAplicaPago.Date);
    //else
    //dmcxc.qrytrancxcfecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxc.qrytrancxcnumero_doc.Value     := numFct;
    dmcxc.qrytrancxctipo_serv.Value      := 2;
    dmcxc.qrytrancxccodigo_cliente.Value := qryFactPendienteCODIGO_CTE.Value;
    dmcxc.qrytrancxccodigo_serv.Value    := 0;

    if (Desc = '') then
    dmcxc.qrytrancxcconcepto.Value       := 'Retención'
    else
    dmcxc.qrytrancxcconcepto.Value       := Desc;

    dmcxc.qrytrancxcValor_documento.Value:= _Monto;
    dmcxc.qrytrancxcTipo_tranf.Value     := 2;
    if _codUsuario > 0 then
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= _codUsuario
    else
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= VarUsuarioGlb;

    dmcxc.qryTrancxcIN_POR.Value         := strusername;
    dmcxc.qryTrancxcFECHA_IN.Value       := Now;
    dmcxc.qrytrancxcStatus.Value         := 'A';
    dmcxc.qrytrancxc.Post;
    dmcxc.qrytrancxc.ApplyUpdates;
    GlbSalvarQuery(dmcxc.qrytrancxc);
    //if Not CheckBox4.Checked then
    ProcUpdateFactPendienteARS(numFct,dmcxc.qryTrancxcSERIE.AsInteger,_monto);//Actualiza tabla factura pendiente
end;

procedure TfrmCobrarFacturas.ProcUpdateFactPendienteARS(numFct: integer;_seriecxc:integer;_monto :Currency);
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  stp_UpdateCxc.Params[1].Value:= 2;//tipo
  stp_UpdateCxc.Params[2].Value:= '1';//moneda
  stp_UpdateCxc.Params[3].Value:= numFct;//numero_fact
  stp_UpdateCxc.Params[4].Value:= _monto;//monto descontado ARS
  stp_UpdateCxc.Params[5].Value:= 'A';//status
  stp_UpdateCxc.Params[6].Value:= 1;//accion 1 = abono
  stp_UpdateCxc.Params[7].Value:= qryFactPendienteCODIGO_CTE.Value;//CODIGO_CTE_IN
  stp_UpdateCxc.Params[8].Value:= GlbFechaTrnDiaria;
  stp_UpdateCxc.Params[9].Value:= _seriecxc;

  stp_UpdateCxc.ExecProc;    //UPDATE balance_cte, facturas_pendiente,
                             //TRANS_CXC = R
  if Not stp_UpdateCxc.Transaction.InTransaction then
  stp_UpdateCxc.transaction.StartTransaction;
  try
    stp_UpdateCxc.transaction.CommitRetaining;
  except
  stp_UpdateCxc.transaction.RollbackRetaining;
  end;
                             
end;

procedure TfrmCobrarFacturas.AplicaRetencin1Click(Sender: TObject);
begin
  frmIndicaMontoRetencion:=TfrmIndicaMontoRetencion.Create(Nil);
  try
    if frmIndicaMontoRetencion.Showmodal = mrOk then
    begin
      if (frmIndicaMontoRetencion.Edit1.Text <> '') then
      begin
      if dmcxc.qryTrancxc.State = dsInactive then
      begin
        dmcxc.qrytrancxc.Close;
        dmcxc.qrytrancxc.Params[2].Value := GlbCia_Key;
        dmcxc.qrytrancxc.Open;
      end;
      ProcRetencionARS(frmIndicaMontoRetencion.Edit2.Text,qryFactPendienteNUMERO_FACT.Value,
      StrToFloat(frmIndicaMontoRetencion.Edit1.Text));
      frmIndicaMontoRetencion.Edit1.Text:='';
      qryFactPendiente.Close;
      qryFactPendiente.Params[0].Value:= CodCte;
      qryFactPendiente.Open;
      MessageDlg('Monto acreditado correctamente.',mtInformation,[mbok],0);
      end;
    end;
  finally
  frmIndicaMontoRetencion.Free;
  frmIndicaMontoRetencion:=Nil;
  end;
end;

procedure TfrmCobrarFacturas.Button1Click(Sender: TObject);
begin
  frmCertificadosEnCxc:=TfrmCertificadosEnCxc.Create(nil);
  try
    frmCertificadosEnCxc.xCodCte := qryFactPendienteCODIGO_CTE.Value;
    frmCertificadosEnCxc.tblCertificadosCte.Close;
    frmCertificadosEnCxc.tblCertificadosCte.Params[0].Value:=qryFactPendienteCODIGO_CTE.Value;
    frmCertificadosEnCxc.tblCertificadosCte.Open;
    frmCertificadosEnCxc.showmodal;
  finally
  frmCertificadosEnCxc.free;
  frmCertificadosEnCxc:=nil;
  end;
end;

procedure TfrmCobrarFacturas.BitBtn8Click(Sender: TObject);
begin
  if qryFactPendienteCODIGO_CTE.IsNull then exit;
  frmClientes:=TfrmClientes.Create(Nil);
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

    dmClientes.tblClientes.Tag := -1;
    if not dmClientes.tblClientes.Locate('codigo_cte', qryFactPendienteCODIGO_CTE.Value,[]) then
    begin
      MessageDlg('Cliente no encontrado verifique codigo.', mtInformation, [mbOK], 0);
      FreeAndNil(frmClientes);
      Exit;
    end;
    dmClientes.tblClientes.EnableControls;
    dmClientes.tblClientes.Tag := 0;
    dmClientes.tblDatosVehiculo.Close;
    dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblDatosVehiculo.open;
    if not qryFactPendienteNUMPOL.IsNull then
    dmClientes.tblDatosVehiculo.Locate('NUMPOL',qryFactPendienteNUMPOL.Value,[]);
    
    frmClientes.PageControl1.ActivePageIndex:=4;
    frmClientes.Showmodal;
  finally
  FreeAndNil(frmClientes);
  end;
end;

procedure TfrmCobrarFacturas.cboxUseLogoChange(Sender: TObject);
begin
  if qryLogoTipoAfiliado.Locate('DESCRIPCION',cboxUseLogo.Text,[]) then
  begin
    GlbLogoServSam:=qryLogoTipoAfiliadoruta_logo.value;
  end;
end;

procedure TfrmCobrarFacturas.dtpkFechaAplicaPagoExit(Sender: TObject);
begin
  dtpkFechaAplicaPago.Color:=clWindow;
end;

procedure TfrmCobrarFacturas.Button2Click(Sender: TObject);
begin
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  dmcxc.rxIngChequeDet.EmptyTable;
  RadioGroup1Click(Self);
  if qryClienteStd.state = dsInactive then
  begin
    qryClienteStd.close;
    qryClienteStd.params[0].Value:= glbCia_Key;
    qryClienteStd.Open;
  end;
  if qryClienteStd.Locate(glbCampoFilterCte,Edit1.Text,[loCaseInsensitive]) then
  begin
   CodCte:=qryClienteStdCODIGO_CTE.Value;
   AbrirTablaRetenciones(CodCte);
   strNombreEmpresa:=qryClienteStdNOMBRE_FACTURAR.Value;
   FormShow(Self);
  end;
  Refresh;  
end;

procedure TfrmCobrarFacturas.RadioGroup1Click(Sender: TObject);
begin
  GlbCampoFilterCte:='';
  case RadioGroup1.ItemIndex of
  0: begin
       glbCampoFilterCte:='codigo_cte';
       panel1.Height:= 57;
     end;
  1: begin
       glbCampoFilterCte:='rnc_numero';
       panel1.Height:= 57;
     end;
  2: glbCampoFilterCte:='nombre_facturar';
  3: begin
       glbCampoFilterCte:='Telef_contacto';
       panel1.Height:= 57;
     end;
  end;

  case RadioGroup1.ItemIndex of
  0: GlbOrderBy :=' order by codigo_cte';
  1: GlbOrderBy :=' order by rnc_numero';
  2: GlbOrderBy :=' order by nombre_facturar';
  3: GlbOrderBy :=' order by Telef_contacto';
  end;

Case RadioGroup1.ItemIndex of
  0:begin
      Label8.Caption:= RadioGroup1.Items.Strings[0];
    end;
  1:begin
      Label8.Caption:= RadioGroup1.Items.Strings[1];
    end;
  2:begin
      Label8.Caption:= RadioGroup1.Items.Strings[2];
    end;
  3:begin
      Label8.Caption:= RadioGroup1.Items.Strings[3];
    end;
  4:begin
      Label8.Caption:= RadioGroup1.Items.Strings[4];
    end;
  5:begin
      Label8.Caption:= RadioGroup1.Items.Strings[5];
    end;
  6:begin
      Label8.Caption:= RadioGroup1.Items.Strings[6];
    end;
  end;  
end;

procedure TfrmCobrarFacturas.BitBtn9Click(Sender: TObject);
begin
  BuscarCliente1Click(Self);
end;

procedure TfrmCobrarFacturas.RadioGroup2Click(Sender: TObject);
begin
  if rxFormaPago.State = dsBrowse then
  rxFormaPago.Edit;
  case RadioGroup2.ItemIndex of
  0:rxFormaPagoformaPago.Value:=1;
  1:begin
      rxFormaPagoformaPago.Value:=20;
      if dmcxc.rxIngChequeDet.RecordCount = 0 then
        dmcxc.rxIngChequeDet.Insert
      else
      dmcxc.rxIngChequeDet.Edit;
      dmcxc.rxIngChequeDetMonto_Cheque.Value:= 0;
      if dmcxc.rxIngChequeDet.state in [dsEdit, dsInsert] then
      dmcxc.rxIngChequeDet.Post;

      RxDBLookupCombo2.Enabled:=True;
      DBEdit1.Enabled:=True;
      Label10.Caption:='#Transferencia';
    end;
  2:begin
      rxFormaPagoformaPago.Value:=3;
      RxDBLookupCombo2.Enabled:=True;
      DBEdit1.Enabled:=True;
      Label10.Caption:='       #Cheque';
      if dmcxc.rxIngChequeDet.RecordCount = 0 then
        dmcxc.rxIngChequeDet.Insert
      else
      dmcxc.rxIngChequeDet.Edit;
      dmcxc.rxIngChequeDetMonto_Cheque.Value:= 0;
      if dmcxc.rxIngChequeDet.state in [dsEdit, dsInsert] then
      dmcxc.rxIngChequeDet.Post;

      RxDBLookupCombo1Change(Self);
    end;
  3:begin
      rxFormaPagoformaPago.Value:=2;
      RxDBLookupCombo1Change(Self);
      RxDBLookupCombo1Exit(Self);
    end;
  end;
  if rxFormaPago.State in [dsEdit, dsInsert] then
  rxFormaPago.Post;
end;

procedure TfrmCobrarFacturas.RxDBLookupCombo1Change(Sender: TObject);
begin
  if (rxFormaPagoformaPago.Value = 20) or
     (rxFormaPagoformaPago.Value = 3) then
  begin
    RxDBLookupCombo2.Enabled:=True;
    DBEdit1.Enabled:=True;
  end;
end;

function TfrmCobrarFacturas.CheckIfTransExiste: Boolean;
begin
  if (dmCxc.rxIngChequeDetNumero_Cheque.IsNull) or
    (dmCxc.rxIngChequeDetNumero_Cheque.Value < 0) then
  begin
    result:= False;
    exit;
  end;
  result:=false;
  dmIngresos.tblTransferencias.Close;
  dmIngresos.tblTransferencias.Params[0].Value:=dmCxc.rxIngChequeDetNumero_Cheque.Value;
  dmIngresos.tblTransferencias.Open;
  dmIngresos.tblTransferencias.First;
  if dmIngresos.tblTransferencias.RecordCount = 1 then
  begin
    result:=True;
  end;
end;

procedure TfrmCobrarFacturas.DBEdit1Exit(Sender: TObject);
begin
  if CheckIfTransExiste then
  begin
    MessageDlg('Número de transferencia ya existe, verifique.',mtError,[mbok],0);
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end;
end;

procedure TfrmCobrarFacturas.Edit1Enter(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 2 then
  begin
    panel1.BringToFront;
    panel1.Height:=377;
  end;
end;

procedure TfrmCobrarFacturas.RxDBGrid3CellClick(Column: TColumn);
begin
  Edit1.Text:= qryClienteStdNOMBRE_FACTURAR.Value;
end;

procedure TfrmCobrarFacturas.RxDBGrid3DblClick(Sender: TObject);
begin
  Edit1.Text   := qryClienteStdNOMBRE_FACTURAR.Value;
  panel1.Height:= 58;
  Button2Click(Self);
end;

procedure TfrmCobrarFacturas.RxDBGrid3Exit(Sender: TObject);
begin
  Edit1.Text   := qryClienteStdNOMBRE_FACTURAR.Value;
  panel1.Height:= 58;
  Button2Click(Self);
end;

procedure TfrmCobrarFacturas.rxcboxEmpleadosChange(Sender: TObject);
begin
  if qryEmpleados.Locate('NOMBREVENDEDOR',rxcboxEmpleados.Text,[]) then
  _codUsuario:= qryEmpleadosCodigo.Value;
end;

procedure TfrmCobrarFacturas.VerTransfCte1Click(Sender: TObject);
begin
  frmtransferencias:=Tfrmtransferencias.Create(nil);
  try
    frmtransferencias.AbrirDatos(qryFactPendienteCODIGO_CTE.Value);
    frmtransferencias.Showmodal;
  finally
  frmtransferencias.free;
  frmtransferencias:=nil;
  end;
end;

procedure TfrmCobrarFacturas.ProcInsertarDetPagos(numtrn: integer);
begin
  if rxFormaPagoMONTOAUTORIZADO.IsNull then Exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value              :=dmingresos.tblIngresoMasterFECHA.Value;
  dmcxc.tblDetallePagosTIPO_TARJETA.Value       :=rxFormaPagoTipoTarjeta.Value;
  dmcxc.tblDetallePagosNUMERO_TARJETA_CRED.Value:=rxFormaPagoNumeroTarjeta.Value;
  dmcxc.tblDetallePagosANO_VENCE.Value := rxFormaPagoAnio.Value;
  dmcxc.tblDetallePagosMES_VENCE.Value := rxFormaPagoMes.Value;
  dmcxc.tblDetallePagosMONTO_PAGADO.Value     := rxFormaPagoMONTOAUTORIZADO.Value;
  dmcxc.tblDetallePagosNUMERO_APROBACION.Value:= rxFormaPagoNumeroAutorizacion.Value;
  dmcxc.tblDetallePagosCODIGO_PROVEEDOR.Value := rxFormaPagoProveedorTarjeta.Value;

  dmcxc.tblDetallePagosTIPO.Value             := 2;//tarjeta
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 2;//tarjeta 
  dmcxc.tblDetallePagosNUMERO_CHEQUE.AsVariant   := null;//dmcxc.rxIngChequeDetNumero_Cheque.Value;
  dmcxc.tblDetallePagosCOD_BANCO_CHEQUE.AsVariant:= null;//dmcxc.rxIngChequeDetCodigo_Banco.Value;
  dmcxc.tblDetallePagosSERIE_TRN.Value           := numtrn;

  //No es necesario
  //dmcxc.tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
  dmcxc.tblDetallePagosAREA_TRANS.Value          := 2;//1-VENTAS, 2-Cuentas x Cobrar
  
  GlbSalvarQuery(dmcxc.tblDetallePagos);
end;

procedure TfrmCobrarFacturas.ReenviaPagoaWispro1Click(Sender: TObject);
var
  parameters : string;
  ExecuteResult: integer;
begin
  ImprimirRecibo(1);
  if not ReConfirmaPago then exit;
  if (GLBECOM = 1) then
  begin
    //Aplicar pago en WisProCloud
    dmClientes.tblContractWisPro.Close;
    dmClientes.tblContractWisPro.Open;
    if dmClientes.tblContractWisPro.Locate('CODIGO_CTE',dmIngresos.qryRepIngMasterCODIGO_CTE.Value,[]) then
    begin
      try
        parameters :=Format(' /username=%s /userAutenticated=%s /accion=%s /IDContract=%s /NUMRECIBOERP=%s /AUTO=1',
        [GlbUsuarioLogueado,'1','91',dmClientes.tblContractWisProID.Value,
        dmIngresos.qryRepIngMasterNUMERO.AsString]);
        ExecuteResult:=  ShellExecute(0, 'Open', PChar(GlbRutaWisPro), PChar(parameters), PChar(''), SW_Hide);

        if ExecuteResult <= 32 then
        begin
          WriteToLog('Error: ' + IntToStr(ExecuteResult));
          ShowMessage('Verifique ejecutable comm con WisProAPI : ' + IntToStr(ExecuteResult));
        end;
      except on E : Exception do
      begin
        WriteToLog (E.ClassName+' Error. Mensaje: '+E.Message);
        LogInformacionTxt('Error aplicando pago en WisProAPi. Recibo Ing. No.'+dmIngresos.qryRepIngMasterNUMERO.AsString);
      end;
      end;
    end;
  end;
end;

procedure TfrmCobrarFacturas.Edit1Change(Sender: TObject);
begin
  if Length(Edit1.Text) > 0 then
  BEGIN
    if qryClienteStd.Locate('NOMBRE_FACTURAR',edit1.Text,[loCaseInsensitive,loPartialKey]) then
    RxDBGrid3.Visible:=True;
  END
  else
  RxDBGrid3.Visible := False;
end;

procedure TfrmCobrarFacturas.FormClick(Sender: TObject);
begin
  refresh;
end;

end.
