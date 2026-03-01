unit UFormProcCuadreCajaNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, RxMemDS, EditNew, WinSkinData,
  rxToolEdit, RXDBCtrl, Buttons, RXCtrls, ExtCtrls, RxLookup,
  IBCustomDataSet, IBTable, UGetDateTipoM, ComCtrls, Grids, DBGrids;

type
  TfrmCuadreCajaNew = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label1: TLabel;
    Label43: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label44: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Label45: TLabel;
    Shape3: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label46: TLabel;
    Label48: TLabel;
    Shape8: TShape;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    BitBtn4: TBitBtn;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    Panel1: TPanel;
    Label47: TLabel;
    Label49: TLabel;
    DBText1: TDBText;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBEdit37: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    rxCuadre: TRxMemoryData;
    rxCuadreCOD_EMPLEADO: TIntegerField;
    rxCuadreTURNO: TIntegerField;
    rxCuadreFECHA: TDateTimeField;
    rxCuadreINGRESO_CXC: TCurrencyField;
    rxCuadreMONTO_DEVOLUCION: TCurrencyField;
    rxCuadreM2000: TCurrencyField;
    rxCuadreM1000: TCurrencyField;
    rxCuadreM500: TCurrencyField;
    rxCuadreM200: TCurrencyField;
    rxCuadreM100: TCurrencyField;
    rxCuadreM50: TCurrencyField;
    rxCuadreM25: TCurrencyField;
    rxCuadreM20: TCurrencyField;
    rxCuadreM10: TCurrencyField;
    rxCuadreM5: TCurrencyField;
    rxCuadreMONTO_EN_CHEQUE: TCurrencyField;
    rxCuadreMONEDAS: TCurrencyField;
    rxCuadreAJUSTE: TCurrencyField;
    rxCuadreDIETA: TCurrencyField;
    rxCuadreRETIRO: TCurrencyField;
    rxCuadreVentaACredito: TCurrencyField;
    rxCuadreVentaAlContado: TCurrencyField;
    rxCuadreFondoEnCaja: TCurrencyField;
    rxCuadreNombreEmpleado: TStringField;
    rxCuadreMontoFinanciado: TCurrencyField;
    rxCuadreMontoInicialFinanciamiento: TCurrencyField;
    rxCuadreCantVtaContado: TIntegerField;
    rxCuadreCantVtaCredito: TIntegerField;
    rxCuadreCantIngCxc: TIntegerField;
    rxCuadreCantIngFinanc: TIntegerField;
    rxCuadreCantDevolucion: TIntegerField;
    rxCuadreCarnet: TCurrencyField;
    rxCuadreVisaNet: TCurrencyField;
    rxCuadreMoneda: TStringField;
    dsrxCuadre: TDataSource;
    rxTotales: TRxMemoryData;
    rxTotalesC2000: TCurrencyField;
    rxTotalesC1000: TCurrencyField;
    rxTotalesC500: TCurrencyField;
    rxTotalesC200: TCurrencyField;
    rxTotalesC100: TCurrencyField;
    rxTotalesC50: TCurrencyField;
    rxTotalesC25: TCurrencyField;
    rxTotalesC20: TCurrencyField;
    rxTotalesC10: TCurrencyField;
    rxTotalesC5: TCurrencyField;
    rxTotalesTotalGeneral: TCurrencyField;
    rxTotalesDiferencia: TCurrencyField;

    rxTotalesTotalVenta: TCurrencyField;
    rxTotalesMonedas: TCurrencyField;
    rxTotalesAjuste: TCurrencyField;
    rxTotalesDieta: TCurrencyField;
    rxTotalesRetiro: TCurrencyField;
    rxTotalesMontoEnCheque: TCurrencyField;
    rxTotalesFondoEnCaja: TCurrencyField;
    rxTotalesSubTotalVtaCredito: TCurrencyField;
    rxTotalesTotalCuadre: TCurrencyField;
    rxTotalesMontoCarnet: TCurrencyField;
    rxTotalesMontoVisanet: TCurrencyField;
    dsrxTotales: TDataSource;
    SkinData1: TSkinData;
    dsQryUsuarios: TDataSource;
    rxSubtotal_1: TRxMemoryData;
    rxSubtotal_1SubTotalVtaCredito: TCurrencyField;
    dsrxSubtotal_1: TDataSource;
    tblMoneda: TIBTable;
    tblMonedaCODIGO: TIBStringField;
    tblMonedaDESCRIPCION: TIBStringField;
    tblMonedaFECHA_IN: TDateTimeField;
    tblMonedaFECHA_UPCAMPO_FECHA_HORA: TDateTimeField;
    tblMonedaMODIFICADO_POR: TIBStringField;
    tblMonedaSIMBOLO: TIBStringField;
    dstblMoneda: TDataSource;
    GetDateTipoMoneda1: TGetDateTipoMoneda;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    Label59: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn6: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    dsqryListadodeCuadres: TDataSource;
    BitBtn7: TBitBtn;
    TabSheet3: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    Panel3: TPanel;
    Label60: TLabel;
    Button3: TButton;
    Button4: TButton;
    BitBtn8: TBitBtn;
    DateTimePicker2: TDateTimePicker;
    dsqryFechasConVentas: TDataSource;
    DateTimePicker3: TDateTimePicker;
    Label61: TLabel;
    BitBtn9: TBitBtn;
    rxNumeroTrnIng: TRxMemoryData;
    rxNumeroTrnIngNumero: TIntegerField;
    BitBtn10: TBitBtn;
    DBEdit43: TDBEdit;
    Label62: TLabel;
    Label63: TLabel;
    DBEdit44: TDBEdit;
    rxCuadrePropina: TCurrencyField;
    rxCuadrePropinaLegal: TCurrencyField;
    DBEdit2: TDBEdit;
    BitBtn11: TBitBtn;
    Label64: TLabel;
    rxCuadreCreditoARS: TCurrencyField;
    DBText6: TDBText;
    rxCuadreCantVtaCreditoArs: TIntegerField;
    Label65: TLabel;
    DBEdit45: TDBEdit;
    rxCuadreTransferencia: TCurrencyField;
    DBText7: TDBText;
    Label66: TLabel;
    rxCuadreCantTransferencia: TIntegerField;
    DBEdit46: TDBEdit;
    Label67: TLabel;
    Label68: TLabel;
    DBEdit47: TDBEdit;
    rxCuadreTransferenciaCxc: TCurrencyField;
    DBEdit48: TDBEdit;
    Label69: TLabel;
    rxTotalesMontoPorTransf: TCurrencyField;
    RxLabel1: TRxLabel;
    Label70: TLabel;
    DBEdit49: TDBEdit;
    rxCuadreAzul: TCurrencyField;
    rxTotalesMontoAzul: TCurrencyField;
    RxLabel2: TRxLabel;
    Label71: TLabel;
    DBEdit50: TDBEdit;
    rxTotalesMontoPorTarjetas: TCurrencyField;
    Label72: TLabel;
    DBEdit51: TDBEdit;
    rxCuadreIngCxcTarjeta: TCurrencyField;
    Label73: TLabel;
    DBText8: TDBText;
    rxCuadreCantIngCxcTarjeta: TIntegerField;
    Label74: TLabel;
    DBText9: TDBText;
    rxCuadreCantVtaContadoTarjeta: TIntegerField;
    Label75: TLabel;
    DBEdit52: TDBEdit;
    rxCuadreIngTarjeta: TCurrencyField;
    rxCuadreMontoDescuento: TCurrencyField;
    DBText10: TDBText;
    Label76: TLabel;
    Label77: TLabel;
    dsqryPrepagos: TDataSource;
    DBText11: TDBText;
    chkBoxRestarMontosTarj: TCheckBox;
    BitBtn12: TBitBtn;
    SpeedButton1: TSpeedButton;
    TabSheet4: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    dstblDistCashEnCaja: TDataSource;
    Panel4: TPanel;
    Label78: TLabel;
    Button5: TButton;
    Button6: TButton;
    BitBtn13: TBitBtn;
    DateTimePicker4: TDateTimePicker;
    Label79: TLabel;
    DateTimePicker5: TDateTimePicker;
    BitBtn14: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure rxTotalesCalcFields(DataSet: TDataSet);
    procedure rxCuadreM2000Change(Sender: TField);
    procedure rxCuadreM1000Change(Sender: TField);
    procedure rxCuadreM500Change(Sender: TField);
    procedure rxCuadreM200Change(Sender: TField);
    procedure rxCuadreM100Change(Sender: TField);
    procedure rxCuadreM50Change(Sender: TField);
    procedure rxCuadreM25Change(Sender: TField);
    procedure rxCuadreM20Change(Sender: TField);
    procedure rxCuadreM10Change(Sender: TField);
    procedure rxCuadreM5Change(Sender: TField);
    procedure rxCuadreMONEDASChange(Sender: TField);
    procedure rxCuadreAJUSTEChange(Sender: TField);
    procedure rxCuadreRETIROChange(Sender: TField);
    procedure rxCuadreDIETAChange(Sender: TField);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rxCuadreMONTO_EN_CHEQUEChange(Sender: TField);
    procedure rxCuadreFondoEnCajaChange(Sender: TField);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit34Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBDateEdit1Change(Sender: TObject);
    procedure rxCuadreVisaNetChange(Sender: TField);
    procedure rxCuadreCarnetChange(Sender: TField);
    procedure DBDateEdit1Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit36Exit(Sender: TObject);
    procedure DBEdit42Exit(Sender: TObject);
    procedure DBEdit41Exit(Sender: TObject);
    procedure DBEdit49Exit(Sender: TObject);
    procedure chkBoxRestarMontosTarjClick(Sender: TObject);
    procedure rxSubtotal_1EditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure rxTotalesEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure rxCuadreEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Panel4Enter(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
  private
    procedure ProcIniciaRxTotales;
    procedure ProcTotal;
    { Private declarations }
    procedure ProcInsDatosConsulta;
    procedure ProcesaCobroVisaNetCardNet;
    procedure ProcDatosCuadres(accion:Integer);
    procedure FechasConVentas(accion:smallint);

  public
    { Public declarations }
  end;

var
  frmCuadreCajaNew: TfrmCuadreCajaNew;
  esConsulta : boolean;
implementation

uses UDatModCuadrexRuta, uglobal, UDatModUsuarios, UDatModCxc,
  UFrmConsultaCuadreCaja, URepCuadreCaja, URepCuadreCajaPOS,
  UFormMantDepositos, UDatModTransCnt, UformVerificarVntasPagos,
  UFormCuadraEfeFondoCaja, DateUtils;

{$R *.dfm}

procedure TfrmCuadreCajaNew.FormCreate(Sender: TObject);
begin
  tblMoneda.Close;
  tblMoneda.Open;
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryUsuarios.First;
  rxCuadre.Close;
  rxCuadre.Open;
  rxTotales.Close;
  rxTotales.Open;
  rxSubtotal_1.Close;
  rxSubtotal_1.Open;
  rxSubtotal_1.Insert;
  rxSubtotal_1SubTotalVtaCredito.Value:=0;
  if GlbColegio= 1 then
  Panel1.Visible:= False
  else
  Panel1.Visible:= True;
  DateTimePicker2.Date:=GlbFechaTrnDiaria - 30;
  DateTimePicker3.Date:=GlbFechaTrnDiaria;
  DateTimePicker4.DateTime:=GlbFechaTrnDiaria-1;
  DateTimePicker5.DateTime:=GlbFechaTrnDiaria;
  if GlBLimao = 0 then
  begin
    Label62.Visible:=False;
    Label63.Visible:=False;
    DBEdit43.Visible:=False;
    DBEdit44.Visible:=False;
  end;
end;

procedure TfrmCuadreCajaNew.BitBtn1Click(Sender: TObject);
begin
  if rxCuadre.State = dsBrowse then
  begin
    rxCuadre.Insert;
    rxCuadreMoneda.Value:='1';//pesos default;
    rxCuadreFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    if rxCuadreCOD_EMPLEADO.IsNull then
    rxCuadreCOD_EMPLEADO.Value := VarUsuarioGlb;

    if (GLBFORMATOFACTPREIMP = 1) then
    chkBoxRestarMontosTarj.Checked:=True
    else
    chkBoxRestarMontosTarj.Checked:=False;

    ProcesaCobroVisaNetCardnet;
    ProcIniciaRxTotales;
    DBEdit34Exit(Self);
    DBEdit34.SetFocus;
  end;
end;
procedure TfrmCuadreCajaNew.ProcesaCobroVisaNetCardNet;
begin
  dmcxc.qryCobrosConTarjetaCuadre.Close;
  dmcxc.qryCobrosConTarjetaCuadre.Params[0].Value:= rxCuadreFECHA.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[1].Value:= rxCuadreMoneda.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[2].Value:= rxCuadreMoneda.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[3].Value:= rxCuadreCOD_EMPLEADO.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[4].Value:= rxCuadreMoneda.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[5].Value:= rxCuadreMoneda.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[6].Value:= rxCuadreCOD_EMPLEADO.Value;

  dmcxc.qryCobrosConTarjetaCuadre.Open;
  dmcxc.qryCobrosConTarjetaCuadre.RecordCount;
  dmcxc.qryCobrosConTarjetaCuadre.First;
  if dmcxc.qryCobrosConTarjetaCuadre.RecordCount = 0 then
  begin
    rxCuadreCarnet.Value := 0;
    rxCuadreVisaNet.Value:= 0;
    rxCuadreAzul.Value := 0;
  end;
  While not dmcxc.qryCobrosConTarjetaCuadre.Eof do
  begin
    //1-visanet 2-CarNET 3-Azul
    if dmcxc.qryCobrosConTarjetaCuadreCODIGO_PROVEEDOR.Value = 3 then
    rxCuadreAzul.Value:= dmcxc.qryCobrosConTarjetaCuadreMONTO.Value
    else
    if dmcxc.qryCobrosConTarjetaCuadreCODIGO_PROVEEDOR.Value = 2 then
    rxCuadreCarnet.Value:= dmcxc.qryCobrosConTarjetaCuadreMONTO.Value
    else
    if dmcxc.qryCobrosConTarjetaCuadreCODIGO_PROVEEDOR.Value = 1 then
    rxCuadreVisaNet.Value:= dmcxc.qryCobrosConTarjetaCuadreMONTO.Value;
    dmcxc.qryCobrosConTarjetaCuadre.next;
  end;
end;

procedure TfrmCuadreCajaNew.BitBtn3Click(Sender: TObject);
begin
  if rxCuadre.State In [dsInsert, dsEdit] then
  begin
    rxCuadre.Post;
  end;
  if rxTotales.State In [dsInsert, dsEdit] then
  begin
    rxTotales.Post;
  end;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[0].Value:= rxCuadreCod_Empleado.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[1].Value:= ExtraerFecha(rxCuadreFecha.Value);
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[2].Value:= rxCuadreIngreso_Cxc.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[3].Value:= rxCuadreVentaACredito.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[4].Value:= rxcuadreVentaAlcontado.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[5].Value:= rxCuadreMONTO_DEVOLUCION.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[6].Value:= rxCuadremonto_En_cheque.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[7].Value:= rxCuadreM2000.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[8].Value:= rxCuadreM1000.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[9].Value:= rxCuadreM500.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[10].Value:= rxCuadreM200.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[11].Value:= rxCuadreM100.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[12].Value:= rxCuadreM50.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[13].Value:= rxCuadreM25.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[14].Value:= rxCuadreM20.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[15].Value:= rxCuadreM10.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[16].Value:= rxCuadreM5.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[17].Value:= rxCuadreMONEDAS.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[18].Value:= rxCuadreAJUSTE.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[19].Value:= rxcuadredieta.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[20].Value:= rxcuadreRetiro.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[21].Value:= VarUsuarioGlb;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[22].Value:= 'A';
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[23].Value:= Now;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[24].Value:= Null;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[25].Value:= rxCuadreFondoEnCaja.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[26].Value:= rxCuadreMontoInicialFinanciamiento.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[27].Value:= trim(rxCuadreMONEDA.Value);
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[28].Value:= rxCuadreVisaNet.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[29].Value:= rxCuadreCarnet.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[30].Value:= rxCuadreTransferencia.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[31].Value:= rxCuadreTransferenciaCxc.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[32].Value:= rxCuadreAzul.Value;  
  dmCuadrexRuta.sp_InsertCuadreCaja.ExecProc;
  if not dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.InTransaction then
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.StartTransaction;
  try
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.CommitRetaining;
  except
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmCuadreCajaNew.ProcIniciaRxTotales;
begin
  rxTotales.close;
  rxTotales.Open;
  rxTotales.Insert;
  //rxTotalesMontoPorTarjetas.Value:= 0;
  //rxCuadreMONTO.Value := 0;
  if rxCuadre.State = dsInactive then exit;
  rxCuadreMONTO_DEVOLUCION.Value := 0;
  rxCuadreM2000.Value := 0;
  rxCuadreM1000.Value := 0;
  rxCuadreM500.Value  := 0;
  rxCuadreM200.Value  := 0;
  rxCuadreM100.Value  := 0;
  rxCuadreM50.Value   := 0;
  rxCuadreM25.Value   := 0;
  rxCuadreM20.Value   := 0;
  rxCuadreM10.Value   := 0;
  rxCuadreM5.Value    := 0;
  rxCuadreMONTO_EN_CHEQUE.Value := 0;
  rxCuadreMONEDAS.Value := 0;
  rxCuadreAJUSTE.Value  := 0;
  rxCuadreDIETA.Value   := 0;
  rxCuadreRETIRO.Value  := 0;
  rxCuadreMontoDescuento.Value:=0;
end;

procedure TfrmCuadreCajaNew.rxTotalesCalcFields(DataSet: TDataSet);
begin
  rxTotalesTotalGeneral.Value :=
  rxTotalesC2000.Value +
  rxTotalesC1000.Value +
  rxTotalesC500.Value +
  rxTotalesC200.Value +
  rxTotalesC100.Value +
  rxTotalesC50.Value +
  rxTotalesC25.Value +
  rxTotalesC20.Value +
  rxTotalesC10.Value +
  rxTotalesC5.Value +
  rxTotalesMonedas.Value +
  rxTotalesMontoEnCheque.Value;// +
//rxTotalesMontoCarnet.Value  +
//rxTotalesMontoVisanet.Value;

  rxTotalesMontoPorTransf.Value:= rxCuadreTransferencia.Value + rxCuadreTransferenciaCxc.Value;

  rxTotalesMontoPorTarjetas.Value:= rxCuadreCarnet.Value + rxCuadreAzul.Value + rxCuadreVisaNet.Value;

  if chkBoxRestarMontosTarj.Checked then
  rxTotalesDiferencia.Value:=
  (rxTotalesTotalGeneral.Value + rxTotalesMontoPorTarjetas.Value)
  - rxTotalesTotalVenta.Value
  + rxTotalesAjuste.Value
  - rxTotalesDieta.Value
  - rxTotalesRetiro.Value
  else
  rxTotalesDiferencia.Value:= rxTotalesTotalGeneral.Value - rxTotalesTotalVenta.Value
  + rxTotalesAjuste.Value -
  rxTotalesDieta.Value -
  rxTotalesRetiro.Value;

  rxTotalesTotalCuadre.Value:=
  rxTotalesTotalVenta.Value            +
  rxTotalesMontoPorTransf.Value        +
  rxSubtotal_1SubTotalVtaCredito.Value +
  rxTotalesMontoPorTarjetas.Value + 
  rxTotalesAjuste.Value                -
  rxTotalesDieta.Value                 -
  rxTotalesRetiro.Value;

  if rxTotalesDiferencia.Value < 0 then
  begin
    DBEdit33.Font.Color := clRed;
    Label1.Font.Color := clRed;
    Label1.Caption := 'Faltante';
  end else
  begin
    DBEdit33.Font.Color := clGreen;
    Label1.Font.Color := clGreen;
    Label1.Caption := 'Sobrante';
  end;
end;

procedure TfrmCuadreCajaNew.rxCuadreM2000Change(Sender: TField);
begin
  rxTotalesC2000.Value:= 2000 * rxCuadreM2000.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM1000Change(Sender: TField);
begin
  rxTotalesC1000.Value:= 1000 * rxCuadreM1000.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM500Change(Sender: TField);
begin
  rxTotalesC500.Value:= 500 * rxCuadreM500.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM200Change(Sender: TField);
begin
  rxTotalesC200.Value:= 200 * rxCuadreM200.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM100Change(Sender: TField);
begin
  rxTotalesC100.Value:= 100 * rxCuadreM100.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM50Change(Sender: TField);
begin
  rxTotalesC50.Value:= 50 * rxCuadreM50.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM25Change(Sender: TField);
begin
  rxTotalesC25.Value:= 25 * rxCuadreM25.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM20Change(Sender: TField);
begin
  rxTotalesC20.Value:= 20 * rxCuadreM20.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM10Change(Sender: TField);
begin
  rxTotalesC10.Value:= 10 * rxCuadreM10.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreM5Change(Sender: TField);
begin
  rxTotalesC5.Value:= 5 * rxCuadreM5.Value;
end;

procedure TfrmCuadreCajaNew.ProcTotal;
var
  Suma, Total : Extended;
  _MontoDescuento : Currency;
begin
  if (rxCuadre.State in [dsBrowse, dsInactive]) then
  exit;
  Suma:=0;
  _MontoDescuento:=0;
  dmcxc.qryPrepagos.Close;
  dmcxc.qryPrepagos.Params[0].Value:= ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryPrepagos.Params[1].Value:= rxCuadreCOD_EMPLEADO.Value;
  dmcxc.qryPrepagos.Open;
  //dmcxc.qryPrepagosMonto.Value

  dmcxc.qryTipoMvtoIngresoCuadre.Close;
  dmcxc.qryTipoMvtoIngresoCuadre.Params[0].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryTipoMvtoIngresoCuadre.Params[1].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryTipoMvtoIngresoCuadre.Params[2].Value := glbCia_Key;
  if not rxCuadreCOD_EMPLEADO.IsNull then
  dmcxc.qryTipoMvtoIngresoCuadre.Params[3].Value := rxCuadreCOD_EMPLEADO.Value
  else
  dmcxc.qryTipoMvtoIngresoCuadre.Params[3].Value := VarUsuarioGlb;
  dmcxc.qryTipoMvtoIngresoCuadre.Params[4].Value := rxCuadreMoneda.Value;
  dmcxc.qryTipoMvtoIngresoCuadre.Params[5].Value := rxCuadreMoneda.Value;
  dmcxc.qryTipoMvtoIngresoCuadre.ExecQuery;
  //dmcxc.qryTipoMvtoIngresoCuadre.Sql.Text
  dmcxc.qryIngPropinaLey.Close;
  dmcxc.qryIngPropinaLey.Params[0].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryIngPropinaLey.Params[1].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryIngPropinaLey.Params[2].Value := GlbCia_Key;
  if not rxCuadreCOD_EMPLEADO.IsNull then
  dmcxc.qryIngPropinaLey.Params[3].Value := rxCuadreCOD_EMPLEADO.Value
  else
  dmcxc.qryIngPropinaLey.Params[3].Value := VarUsuarioGlb;
  dmcxc.qryIngPropinaLey.Params[4].Value := rxCuadreMoneda.Value;
  dmcxc.qryIngPropinaLey.Params[5].Value := rxCuadreMoneda.Value;
  dmcxc.qryIngPropinaLey.ExecQuery;

  dmCuadrexRuta.qryDesembolso.Close;
  dmCuadrexRuta.qryDesembolso.Params[0].Value:= ExtraerFecha(rxCuadreFECHA.Value);
  dmCuadrexRuta.qryDesembolso.Params[1].Value:= rxCuadreCOD_EMPLEADO.Value;
  dmCuadrexRuta.qryDesembolso.Params[2].Value:= glbCia_Key;
  dmCuadrexRuta.qryDesembolso.Open;
  dmCuadrexRuta.qryDesembolso.First;

  Total:=0;
  rxCuadreVentaAlContado.Value:= 0;
  rxcuadrePropina.Value       :=0;
  rxCuadrePropinaLegal.value  := 0;
  rxCuadreINGRESO_CXC.Value      := 0;
  rxCuadreMONTO_DEVOLUCION.Value := 0;
  rxCuadreVentaACredito.Value    := 0;
  rxCuadreCreditoARS.Value       := 0;
  rxCuadreCantVtaCreditoArs.Value:=0;
  rxCuadreMontoFinanciado.Value  := 0;
  rxCuadreMontoInicialFinanciamiento.Value:=0;
  rxCuadreCantVtaContado.Value:= 0;
  rxCuadreCantVtaCredito.Value:= 0;
  rxCuadreCantIngCxc.Value    := 0;
  rxCuadreCantIngCxcTarjeta.Value:= 0;
  rxCuadreCantIngFinanc.Value := 0;
  rxCuadreCantDevolucion.Value:= 0;
  rxCuadreRETIRO.Value        := 0;
  rxCuadreTransferencia.Value := 0;
  rxCuadreTransferenciaCxc.Value :=0;
  rxCuadreIngCxcTarjeta.Value :=0;
  rxCuadreCantTransferencia.Value:=0;
  rxCuadreIngTarjeta.Value := 0;
  rxCuadreCantVtaContadoTarjeta.Value:=0;
  rxCuadreMontoDescuento.Value:=0;
  rxNumeroTrnIng.close;
  rxNumeroTrnIng.Open;

  if rxSubtotal_1.State = dsBrowse then
     rxSubtotal_1.Edit;
  rxSubtotal_1SubTotalVtaCredito.Value := 0;
     
  if dmcxc.qryIngPropinaLey.Open then
  begin
    While Not dmcxc.qryIngPropinaLey.Eof do
    begin     //dmcxc.qryTipoMvtoIngresoCuadre.sql.txt
      rxcuadrePropina.Value       := rxcuadrePropina.Value +
      dmcxc.qryIngPropinaLey.FieldByName('Propina').AsCurrency;
      rxCuadrePropinaLegal.Value  :=
      rxCuadrePropinaLegal.Value + dmcxc.qryIngPropinaLey.FieldByName('PropinaLegal').AsCurrency;
      dmcxc.qryIngPropinaLey.Next;
    end;
  end;

  if dmcxc.qryTipoMvtoIngresoCuadre.Open then
  begin
    While Not dmcxc.qryTipoMvtoIngresoCuadre.Eof do
    begin
      if not dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('MONTO_DESC_ITEM').IsNull then
      _MontoDescuento:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('MONTO_DESC_ITEM').Value;
      rxCuadreMontoDescuento.Value:=rxCuadreMontoDescuento.Value +_MontoDescuento;
      //temporal hoy Enero 20, 2024. Asignar 0 a _MontoDescuento ya que sobre descontando al valor neto ya aplicado.
      _MontoDescuento :=0;
      if (UpperCase(Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) = 'TARJETA')
         //tt and (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 2)
         and (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('ESCXC').Value = 0) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value) > 0 then
        begin
          rxCuadreIngTarjeta.Value:= rxCuadreIngTarjeta.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento;

          rxCuadreCantVtaContadoTarjeta.Value:=rxCuadreCantVtaContadoTarjeta.Value + 1;
        end;
      end else
      if (UpperCase(Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) = 'ING. CXC')
         and (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 1)
         and (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('ESCXC').Value = 1) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value) > 0 then
        begin
          rxCuadreINGRESO_CXC.Value:= rxCuadreINGRESO_CXC.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento;
          Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value - _MontoDescuento;
          rxCuadreCantIngCxc.Value:=rxCuadreCantIngCxc.Value + 1;
        end;
      end else
      if (UpperCase(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString) = 'ING. CXC')
         and (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 2)
         and (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('ESCXC').Value = 1) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value) > 0 then
        begin
          rxCuadreIngCxcTarjeta.Value:= rxCuadreIngCxcTarjeta.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento;
          rxCuadreCantIngCxcTarjeta.Value:=rxCuadreCantIngCxcTarjeta.Value + 1;
        end;
      end else 
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 1) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 3) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 4) or
         (
          (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 2)
          and (UpperCase(Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) = 'TARJETA')) then
         begin           
           if (UpperCase(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString) <> 'TARJETA')
           and (UpperCase(Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) <> 'TRANSFERENCIA') then
           begin
             if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value) > 0 then
             begin
               rxCuadreVentaAlContado.Value := rxCuadreVentaAlContado.Value +
               dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento;
               Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value - _MontoDescuento;
               rxCuadreCantVtaContado.Value:=rxCuadreCantVtaContado.Value + 1;
             end;
           end else
           begin

          end;
        end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 1) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 3) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 4) or
         (
          (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 2)
          and (UpperCase(Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) = 'EFECTIVO')) then
         begin
           if ((UpperCase(Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) <> 'TRANSFERENCIA')
           and ((Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) <> 'Depósito'))then
           begin
             if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value) > 0 then
             begin
               rxCuadreVentaAlContado.Value := rxCuadreVentaAlContado.Value +
               dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento;
               Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value - _MontoDescuento;
               rxCuadreCantVtaContado.Value:=rxCuadreCantVtaContado.Value + 1;
             end;
           end else
           begin

          end;
        end else
        if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 2) and
        (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('escxc').AsInteger =1) then
        begin
          Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
          rxCuadreINGRESO_CXC.Value:=rxCuadreINGRESO_CXC.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;//dmcxc.qryTipoMvtoIngresoCuadre.sql.text
          rxCuadreCantIngCxc.Value:=rxCuadreCantIngCxc.Value + 1;

      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 6) then
      begin
        if dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value > 0 then
        begin
          if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value = 0) then
          begin
            if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value < 0) then
            begin
              rxCuadreMONTO_DEVOLUCION.Value:= rxCuadreMONTO_DEVOLUCION.Value +
              (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento)* -1;
              Total:=(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento) *-1;
            end else
            begin
              rxCuadreMONTO_DEVOLUCION.Value:= rxCuadreMONTO_DEVOLUCION.Value
              + dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento;
              Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency - _MontoDescuento;
            end;
          end else
          begin
            if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency < 0) then
            begin
              rxCuadreMONTO_DEVOLUCION.Value:= rxCuadreMONTO_DEVOLUCION.Value + dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
              Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
            end else
            begin
              rxCuadreMONTO_DEVOLUCION.Value:= rxCuadreMONTO_DEVOLUCION.Value +dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency * -1;
              Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency * -1;
            end;
          end;
        end else
        begin
          if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency < 0) then
          begin
            rxCuadreMONTO_DEVOLUCION.Value:= rxCuadreMONTO_DEVOLUCION.Value + dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
            Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
          end else
          begin
            rxCuadreMONTO_DEVOLUCION.Value:= rxCuadreMONTO_DEVOLUCION.Value + dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency * -1;
            Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency *-1;
          end;          
        end;
        rxCuadreCantDevolucion.Value:=rxCuadreCantDevolucion.Value + 1;

      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 16) then
      begin
        rxCuadreMontoFinanciado.Value:= rxCuadreMontoFinanciado.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;
      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 7) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 8)
      then
      begin
        rxCuadreVentaACredito.Value  := rxCuadreVentaACredito.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value - _MontoDescuento;
        rxCuadreCantVtaCredito.Value := rxCuadreCantVtaCredito.Value + 1;
      end else
      begin
        if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 15) then
        begin
          Total := dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
          rxCuadreMontoInicialFinanciamiento.Value:= rxCuadreMontoInicialFinanciamiento.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value - _MontoDescuento;
        end;
      end;

      if ((UpperCase(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString) = 'TRANSFERENCIA')
               or (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 20)
               or (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 21)) and
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('EsCxc').AsInteger = 1) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value) > 0 then
        begin
          rxCuadreTransferenciaCxc.Value:=rxCuadreTransferenciaCxc.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;

          rxCuadreCantTransferencia.Value:=rxCuadreCantTransferencia.Value + 1;
        end;
      end else
      if (UpperCase(Trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString)) = 'TRANSFERENCIA') OR
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 20) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 21) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value) > 0 then
        begin
          rxCuadreTransferencia.Value:=rxCuadreTransferencia.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;

          rxCuadreCantTransferencia.Value:=rxCuadreCantTransferencia.Value + 1;
        end;
      end;

      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('MONTOCOBERTURA').Value > 0)
      and (trim(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').Value) = 'OTROS 1') then
      begin
        rxCuadreCantVtaCreditoArs.Value := rxCuadreCantVtaCreditoArs.Value + 1;
        rxCuadreCreditoARS.Value:= rxCuadreCreditoARS.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('MONTOCOBERTURA').Value;
        if rxSubtotal_1.State = dsEdit then
        rxSubtotal_1.Post;
      end;

      Suma:=Suma + total;
      total:= 0;
      dmcxc.qryTipoMvtoIngresoCuadre.Next;
    end;

    if rxSubtotal_1.State = dsBrowse then
    rxSubtotal_1.Edit;
    rxSubtotal_1SubTotalVtaCredito.Value := rxSubtotal_1SubTotalVtaCredito.Value +
    rxCuadreVentaACredito.Value + rxCuadreMontoFinanciado.Value+
    rxCuadreCreditoARS.Value;
    rxSubtotal_1.Post;

    dmCuadrexRuta.qryDesembolso.First;
    While Not dmCuadrexRuta.qryDesembolso.Eof do
    begin
      rxCuadreRETIRO.Value:= rxCuadreRETIRO.Value +
      dmCuadrexRuta.qryDesembolsoMONTO.Value;
      dmCuadrexRuta.qryDesembolso.Next;
    end;
    Suma:=Suma + rxTotalesFondoEnCaja.Value;

    ProcesaCobroVisaNetCardNet;

    if rxTotales.State = dsBrowse then
    rxTotales.Edit;
    rxTotalesTotalVenta.Value:= Suma;// + rxCuadreFondoEnCaja.Value;
    
    if esConsulta then
    begin

    end;
  end;
end;

procedure TfrmCuadreCajaNew.rxCuadreMONEDASChange(Sender: TField);
begin
  rxTotalesMonedas.Value := rxCuadreMONEDAS.Value; 
end;

procedure TfrmCuadreCajaNew.rxCuadreAJUSTEChange(Sender: TField);
begin
  rxTotalesAjuste.value:= rxCuadreAJUSTE.value;
end;

procedure TfrmCuadreCajaNew.rxCuadreRETIROChange(Sender: TField);
begin
  if rxTotales.state = dsBrowse then rxTotales.Edit;
  rxTotalesRetiro.Value:= rxCuadreRetiro.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreDIETAChange(Sender: TField);
begin
  rxTotalesDieta.value:= rxCuadreDieta.Value;
end;

procedure TfrmCuadreCajaNew.BitBtn5Click(Sender: TObject);
begin
  rxTotales.Close;
  rxTotales.Open;
  rxCuadre.Close;
  rxCuadre.Open;
  rxSubtotal_1.EmptyTable;
end;

procedure TfrmCuadreCajaNew.BitBtn2Click(Sender: TObject);
begin
  rxSubtotal_1.EmptyTable;
   frmConsultaDatosCCaja:=TfrmConsultaDatosCCaja.Create(Nil);
  try
    if frmConsultaDatosCCaja.ShowModal = mrOk then
    begin
      dmCuadrexRuta.qryDatosCuadreCaja.Close;
      if frmConsultaDatosCCaja.rxConsultatodos.Value = 1 then
      dmCuadrexRuta.qryDatosCuadreCaja.Params[0].Value:= Null
      else
      dmCuadrexRuta.qryDatosCuadreCaja.Params[0].Value:=
      frmConsultaDatosCCaja.rxConsultacodEmpleado.Value;

      dmCuadrexRuta.qryDatosCuadreCaja.Params[1].Value:=
      ExtraerFecha(frmConsultaDatosCCaja.rxConsultafechaIni.Value);
      dmCuadrexRuta.qryDatosCuadreCaja.Params[2].Value:= glbCia_Key;
      dmCuadrexRuta.qryDatosCuadreCaja.Params[3].Value:= frmConsultaDatosCCaja.rxConsultaMoneda.Value;
      dmCuadrexRuta.qryDatosCuadreCaja.Params[4].Value:= frmConsultaDatosCCaja.rxConsultaMoneda.Value;

      dmCuadrexRuta.qryDatosCuadreCaja.Open;
      dmCuadrexRuta.qryDatosCuadreCaja.First;
      if (dmCuadrexRuta.qryDatosCuadreCaja.RecordCount > 0) then
      begin
        ProcInsDatosConsulta;
        DBEdit34Exit(Self);
        ProcTotal;
      end else
      MessageDlg('No existen datos para los parámetros suministrados.',mtInformation, [mbOK], 0);
    end;
  finally
  frmConsultaDatosCCaja.Free;
  frmConsultaDatosCCaja:=Nil;
  end;
end;

procedure TfrmCuadreCajaNew.ProcInsDatosConsulta;
begin
  rxTotales.close;
  rxTotales.Open;
  rxTotales.Insert;
  //rxTotalesMontoPorTarjetas.Value:= 0;
  rxCuadre.close;
  rxCuadre.Open;
  rxCuadre.Insert;
  rxCuadreCod_Empleado.Value  := dmCuadrexRuta.qryDatosCuadreCajaCOD_EMPLEADO.Value;
  rxCuadreNombreEmpleado.Value:= UpperCase(dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value);

  rxCuadreFecha.Value := dmCuadrexRuta.qryDatosCuadreCajaFECHA.Value;
  rxCuadreIngreso_Cxc.Value      := dmCuadrexRuta.qryDatosCuadreCajaINGRESO_CXC.Value;
  rxCuadreVentaACredito.Value    := dmCuadrexRuta.qryDatosCuadreCajaVENTA_A_CREDITO.Value;
  rxcuadreVentaAlcontado.Value   := dmCuadrexRuta.qryDatosCuadreCajaVENTA_AL_CONTADO.Value;
  rxCuadreMONTO_DEVOLUCION.Value := dmCuadrexRuta.qryDatosCuadreCajaMONTO_DEVOLUCION.Value;
  rxCuadremonto_En_cheque.Value  := dmCuadrexRuta.qryDatosCuadreCajaMONTO_EN_CHEQUE.Value;
  rxCuadreCreditoARS.Value       := dmCuadrexRuta.qryDatosCuadreCajaMONTOCREDITOARS.Value;

  rxCuadreM2000.Value := dmCuadrexRuta.qryDatosCuadreCajaM2000.Value;
  rxCuadreM1000.Value := dmCuadrexRuta.qryDatosCuadreCajaM1000.Value;
  rxCuadreM500.Value  := dmCuadrexRuta.qryDatosCuadreCajaM500.Value;
  rxCuadreM200.Value  := dmCuadrexRuta.qryDatosCuadreCajaM200.Value;
  rxCuadreM100.Value  := dmCuadrexRuta.qryDatosCuadreCajaM100.Value;
  rxCuadreM50.Value   := dmCuadrexRuta.qryDatosCuadreCajaM50.Value;
  rxCuadreM25.Value   := dmCuadrexRuta.qryDatosCuadreCajaM25.Value;
  rxCuadreM20.Value   := dmCuadrexRuta.qryDatosCuadreCajaM20.Value;
  rxCuadreM10.Value   := dmCuadrexRuta.qryDatosCuadreCajaM10.Value;
  rxCuadreM5.Value    := dmCuadrexRuta.qryDatosCuadreCajaM5.Value;
  rxCuadreMONEDAS.Value := dmCuadrexRuta.qryDatosCuadreCajaMONTO_MONEDAS.Value;
  rxCuadreAJUSTE.Value  := dmCuadrexRuta.qryDatosCuadreCajaMONTO_AJUSTE.Value;
  rxcuadredieta.Value   := dmCuadrexRuta.qryDatosCuadreCajaMONTO_DIETA.Value;
  rxcuadreRetiro.Value  := dmCuadrexRuta.qryDatosCuadreCajaMONTO_RETIRO.Value;
  rxCuadreFondoEnCaja.Value := dmCuadrexRuta.qryDatosCuadreCajaMONTO_EN_FONDO.Value;
  rxCuadreVisaNet.Value     := dmCuadrexRuta.qryDatosCuadreCajaMONTO_VISANET.Value;
  rxCuadreCarnet.Value      := dmCuadrexRuta.qryDatosCuadreCajaMONTO_CARDNET.Value;
  rxCuadreMoneda.Value      := Trim(dmCuadrexRuta.qryDatosCuadreCajaMONEDA.Value);
  rxCuadreTransferencia.Value   := dmCuadrexRuta.qryDatosCuadreCajaTransferencia.Value;
  rxCuadreTransferenciaCxc.Value:= dmCuadrexRuta.qryDatosCuadreCajaTRANSFERENCIACxc.Value;
  rxCuadreAzul.Value:= dmCuadrexRuta.qryDatosCuadreCajaMONTO_AZUL.Value;
  rxCuadre.Post;
end;

procedure TfrmCuadreCajaNew.rxCuadreMONTO_EN_CHEQUEChange(Sender: TField);
begin
  rxTotalesMontoEnCheque.Value := rxCuadreMONTO_EN_CHEQUE.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreFondoEnCajaChange(Sender: TField);
begin
  rxTotalesFondoEnCaja.value:= rxCuadreFondoEnCaja.value;
end;

procedure TfrmCuadreCajaNew.BitBtn4Click(Sender: TObject);
begin
  if rxCuadre.State = dsbrowse then
  rxCuadre.Edit;
  
  try
  DBEdit41Exit(Self);
  DBEdit49Exit(Self);
  DBEdit42Exit(Self);
  except
  end;
  if GlbRepCuadrePos = 1 then
  begin
    qckRepCuadreCajaPOS:=TqckRepCuadreCajaPOS.Create(Nil);
    try
      qckRepCuadreCajaPOS.QRLabel46.Caption := Label1.Caption;
      qckRepCuadreCajaPOS.Prepare;
      glbTPag := qckRepCuadreCajaPOS.PageNumber;
      qckRepCuadreCajaPOS.Preview;
    finally
    qckRepCuadreCajaPOS.Free;
    qckRepCuadreCajaPOS:= Nil;
    end;
  end else
  begin
  qckRepCuadreCaja:=TqckRepCuadreCaja.Create(Nil);
  try
    qckRepCuadreCaja.QRLabel46.Caption := Label1.Caption;
    qckRepCuadreCaja.Prepare;
    glbTPag := qckRepCuadreCaja.PageNumber;
    qckRepCuadreCaja.Preview;
  finally
  qckRepCuadreCaja.Free;
  qckRepCuadreCaja:= Nil;
  end;
  end;
  rxTotales.Close;
  rxTotales.Open;
  rxCuadre.Close;
  rxCuadre.Open;
end;

procedure TfrmCuadreCajaNew.DBEdit34Exit(Sender: TObject);
begin
  if rxCuadre.State = dsBrowse then
  rxCuadre.Edit;
  if rxCuadre.State In [dsEdit, dsInsert] then
  begin
    rxCuadreCOD_EMPLEADO.Value := dmUsuarios.qryUsuariosCODIGO_EMPLEADO.Value;
    rxCuadreNombreEmpleado.Value:= UpperCase(dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value);
  end;
  ProcTotal;
end;

procedure TfrmCuadreCajaNew.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=False;
  if (rxCuadre.State In [dsEdit, dsInsert]) OR
     (rxTotales.State In [dsEdit, dsInsert])then
  begin
    MessageDlg('Hay una transaccion activa, verifique', mtInformation, [mbOK], 0);
    Exit;
  end;
  CanClose:=True;
end;

procedure TfrmCuadreCajaNew.DBDateEdit1Change(Sender: TObject);
begin
  ProcTotal;
  DateTimePicker4.DateTime:=ExtraerFecha(rxCuadreFECHA.Value);
  DateTimePicker5.DateTime:=ExtraerFecha(rxCuadreFECHA.Value);
end;

procedure TfrmCuadreCajaNew.rxCuadreVisaNetChange(Sender: TField);
begin
  rxTotalesMontoVisanet.Value:= rxCuadreVisaNet.Value;
end;

procedure TfrmCuadreCajaNew.rxCuadreCarnetChange(Sender: TField);
begin
  rxTotalesMontoCarnet.Value:= rxCuadreCarnet.Value;
end;

procedure TfrmCuadreCajaNew.DBDateEdit1Exit(Sender: TObject);
begin
  DBEdit34Exit(Self);
end;

procedure TfrmCuadreCajaNew.BitBtn6Click(Sender: TObject);
begin
  ProcDatosCuadres(0);
end;

procedure TfrmCuadreCajaNew.ProcDatosCuadres(accion: Integer);
var
  fechaIni : TDateTime;
begin
  if dmCuadrexRuta.ibsqlMaxFechaCuadre.Open then
  dmCuadrexRuta.ibsqlMaxFechaCuadre.Close;

  dmCuadrexRuta.ibsqlMaxFechaCuadre.ExecQuery;
  if Not (dmCuadrexRuta.ibsqlMaxFechaCuadre.FieldByName('fecha').IsNull) then
  fechaIni := dmCuadrexRuta.ibsqlMaxFechaCuadre.FieldByName('fecha').Value
  else
  fechaIni:=GlbFechaTrnDiaria;

  dmCuadrexRuta.qryListadodeCuadres.Close;

  if (accion = 0) then
  begin
    dmCuadrexRuta.qryListadodeCuadres.Params[0].Value := ExtraerFecha(fechaIni) - 15;
    dmCuadrexRuta.qryListadodeCuadres.Params[1].Value := ExtraerFecha(fechaIni);
    dmCuadrexRuta.qryListadodeCuadres.Open;
     DateTimePicker1.Date :=  dmCuadrexRuta.qryListadodeCuadres.Params[0].Value;
  end else
  if (accion = 1) then
  begin
    dmCuadrexRuta.qryListadodeCuadres.Params[0].Value := ExtraerFecha(DateTimePicker1.Date)+1;
    dmCuadrexRuta.qryListadodeCuadres.Params[1].Value := ExtraerFecha(DateTimePicker1.Date)+1;
    DateTimePicker1.Date :=  dmCuadrexRuta.qryListadodeCuadres.Params[0].Value;
  end else
  if (accion = 2) then
  begin
    //dmCuadrexRuta.qryListadodeCuadres.Params[0].Value := ExtraerFecha(DateTimePicker1.Date)-1;
    //dmCuadrexRuta.qryListadodeCuadres.Params[1].Value := ExtraerFecha(DateTimePicker1.Date);
    dmCuadrexRuta.qryListadodeCuadres.Params[0].Value := ExtraerFecha(DateTimePicker1.Date)-1;
    dmCuadrexRuta.qryListadodeCuadres.Params[1].Value := ExtraerFecha(DateTimePicker1.Date)-1;
    DateTimePicker1.Date :=  dmCuadrexRuta.qryListadodeCuadres.Params[0].Value;
  end else
  if (accion = 3) then
  begin
    if Not (dmCuadrexRuta.ibsqlMaxFechaCuadre.FieldByName('fecha').IsNull) then
    fechaIni := dmCuadrexRuta.ibsqlMaxFechaCuadre.FieldByName('fecha').Value
    else
    fechaIni:= GlbFechaTrnDiaria;
    dmCuadrexRuta.qryListadodeCuadres.Params[0].Value := ExtraerFecha(fechaIni);
    dmCuadrexRuta.qryListadodeCuadres.Params[1].Value := ExtraerFecha(fechaIni);
    DateTimePicker1.Date :=  dmCuadrexRuta.qryListadodeCuadres.Params[0].Value;
  end;
  dmCuadrexRuta.qryListadodeCuadres.Open;
end;

procedure TfrmCuadreCajaNew.Button1Click(Sender: TObject);
begin
  ProcDatosCuadres(1);
end;

procedure TfrmCuadreCajaNew.Button2Click(Sender: TObject);
begin
  ProcDatosCuadres(2);
end;

procedure TfrmCuadreCajaNew.BitBtn7Click(Sender: TObject);
begin
  ProcDatosCuadres(3);
end;

procedure TfrmCuadreCajaNew.FechasConVentas(accion: smallint);
begin
  dmCuadrexRuta.qryFechasConVentas.close;
  case accion of
    0:begin
        DateTimePicker2.Date := GlbFechaTrnDiaria - 30;
        DateTimePicker3.Date := GlbFechaTrnDiaria;
        dmCuadrexRuta.qryFechasConVentas.Params[0].Value := ExtraerFecha(DateTimePicker2.Date);
        dmCuadrexRuta.qryFechasConVentas.Params[1].Value := ExtraerFecha(DateTimePicker3.Date);
      end;
    1:begin
        DateTimePicker2.Date:=DateTimePicker2.Date - 1;
        dmCuadrexRuta.qryFechasConVentas.Params[0].Value := ExtraerFecha(DateTimePicker2.Date);
        dmCuadrexRuta.qryFechasConVentas.Params[1].Value := ExtraerFecha(DateTimePicker3.Date);
      end;
    2:begin
        DateTimePicker3.Date:=DateTimePicker3.Date + 1;
        dmCuadrexRuta.qryFechasConVentas.Params[0].Value := ExtraerFecha(DateTimePicker2.Date);
        dmCuadrexRuta.qryFechasConVentas.Params[1].Value := ExtraerFecha(DateTimePicker3.Date);
      end;
     3:begin
        dmCuadrexRuta.qryFechasConVentas.Params[0].Value := ExtraerFecha(DateTimePicker2.Date);
        dmCuadrexRuta.qryFechasConVentas.Params[1].Value := ExtraerFecha(DateTimePicker3.Date);
     end;
  end;
  dmCuadrexRuta.qryFechasConVentas.Open;dmCuadrexRuta.qryFechasConVentas.sql.text
end;

procedure TfrmCuadreCajaNew.BitBtn8Click(Sender: TObject);
begin
  FechasConVentas(0);
end;

procedure TfrmCuadreCajaNew.Button3Click(Sender: TObject);
begin
  FechasConVentas(2);
end;

procedure TfrmCuadreCajaNew.Button4Click(Sender: TObject);
begin
FechasConVentas(1);
end;

procedure TfrmCuadreCajaNew.BitBtn9Click(Sender: TObject);
begin
 FechasConVentas(3);
end;

procedure TfrmCuadreCajaNew.BitBtn10Click(Sender: TObject);
begin
  if rxCuadre.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Existe una transacción en proceso, verfique.', mtInformation, [mbOK], 0);
    PageControl1.TabIndex := 0;
    Exit;
  end;
  dmCuadrexRuta.qryDatosCuadreCaja.Close;
  dmCuadrexRuta.qryDatosCuadreCaja.Params[0].Value:=
  dmCuadrexRuta.qryListadodeCuadresCOD_EMPLEADO.Value;

  dmCuadrexRuta.qryDatosCuadreCaja.Params[1].Value:=
  ExtraerFecha(dmCuadrexRuta.qryListadodeCuadresFECHA.Value);
  dmCuadrexRuta.qryDatosCuadreCaja.Params[2].Value:= glbCia_Key;
  dmCuadrexRuta.qryDatosCuadreCaja.Params[3].Value:= dmCuadrexRuta.qryListadodeCuadresMONEDA.Value;
  dmCuadrexRuta.qryDatosCuadreCaja.Params[4].Value:= dmCuadrexRuta.qryListadodeCuadresMONEDA.Value;
  dmCuadrexRuta.qryDatosCuadreCaja.Open;
  dmCuadrexRuta.qryDatosCuadreCaja.First;

  esConsulta := False;
  if (dmCuadrexRuta.qryDatosCuadreCaja.RecordCount > 0) then
  begin
    esConsulta := True;
    ProcInsDatosConsulta;
    DBEdit34Exit(Self);
    ProcTotal;
    PageControl1.TabIndex := 0;
  end
end;

procedure TfrmCuadreCajaNew.BitBtn11Click(Sender: TObject);
begin
  if not Assigned(frmDepositos) then
  frmDepositos:=TfrmDepositos.Create(nil);
  try
    frmDepositos.show;
    frmDepositos.SpeedButton2Click2(Self);
    if dmTransCnt.tblDepositoMaster.state in [dsEdit, dsInsert] then
    dmTransCnt.tblDepositoMasterMONTO.Value:=
    rxTotalesTotalGeneral.Value; 
    //rxTotalesTotalCuadre.Value;
  finally

  end;
end;

procedure TfrmCuadreCajaNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(frmDepositos) then
  begin
    frmDepositos.free;
    frmDepositos:=nil;
  end;
end;

procedure TfrmCuadreCajaNew.DBEdit36Exit(Sender: TObject);
begin
  if rxCuadre.State in [dsEdit, dsInsert] then
  ProcTotal;
end;

procedure TfrmCuadreCajaNew.DBEdit42Exit(Sender: TObject);
begin
  if rxTotales.State = dsBrowse then
  rxTotales.Edit;
  //if rxCuadre.RecordCount = 0 then exit;
  if rxCuadre.State = dsBrowse then
  rxCuadre.Edit;
  //rxCuadreM5.Value:=rxCuadreM5.Value+1;
  //rxCuadreM5.Value:=rxCuadreM5.Value-1;

  rxTotalesMontoVisanet.Value:= rxCuadreVisaNet.Value
end;

procedure TfrmCuadreCajaNew.DBEdit41Exit(Sender: TObject);
begin
  //if rxCuadre.RecordCount = 0 then exit;
  if rxCuadre.State = dsBrowse then
  rxCuadre.Edit;
  //rxCuadreM5.Value:=rxCuadreM5.Value+1;
  //rxCuadreM5.Value:=rxCuadreM5.Value-1;
  if rxTotales.State = dsBrowse then
  rxTotales.Edit;
  rxTotalesMontoCarnet.Value:= rxCuadreCarnet.Value
end;

procedure TfrmCuadreCajaNew.DBEdit49Exit(Sender: TObject);
begin
  //if rxCuadre.RecordCount = 0 then exit;
  if rxCuadre.State = dsBrowse then
  rxCuadre.Edit;
  //rxCuadreM5.Value:=rxCuadreM5.Value+1;
  //rxCuadreM5.Value:=rxCuadreM5.Value-1;
  if rxTotales.State = dsBrowse then
  rxTotales.Edit;
  rxTotalesMontoAzul.Value:= rxCuadreAzul.Value
end;

procedure TfrmCuadreCajaNew.chkBoxRestarMontosTarjClick(Sender: TObject);
begin
  DBEdit42Exit(Self);
end;

procedure TfrmCuadreCajaNew.rxSubtotal_1EditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  var
   error : string;
  begin
   error:=e.Message;
end;

procedure TfrmCuadreCajaNew.rxTotalesEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  var
   error : string;
  begin
   error:=e.Message;
end;

procedure TfrmCuadreCajaNew.rxCuadreEditError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  var
   error : string;
  begin
   error:=e.Message;

end;

procedure TfrmCuadreCajaNew.BitBtn12Click(Sender: TObject);
begin
    frmVerificarValoresVtaPago:=TfrmVerificarValoresVtaPago.Create(nil);
  try
    frmVerificarValoresVtaPago.showmodal;
  finally
  FreeAndNil(frmVerificarValoresVtaPago);
  end;
end;

procedure TfrmCuadreCajaNew.SpeedButton1Click(Sender: TObject);
begin
try
  if rxCuadreFondoEnCaja.IsNull then
  begin
    MessageDlg('Favor indicar monto de fondos.', mtInformation,[mbok], 0);
    Exit;
  end;

  frmCuadreEfeFondoCaja:=TfrmCuadreEfeFondoCaja.Create(Nil);
  try
    frmCuadreEfeFondoCaja.xtVenta:=Abs(rxCuadreFondoEnCaja.Value);
    frmCuadreEfeFondoCaja.xCodEmp:= rxCuadreCOD_EMPLEADO.Value;
    frmCuadreEfeFondoCaja.xNombreempleado:= rxCuadreNombreEmpleado.Value;
    frmCuadreEfeFondoCaja.xFechaCuadre := ExtraerFecha(rxCuadreFECHA.Value);
    if (frmCuadreEfeFondoCaja.xFechaCuadre = 0) or
    (YearOf(frmCuadreEfeFondoCaja.xFechaCuadre) < 2000) or rxCuadreFECHA.IsNull then
    begin
      MessageDlg('Favor indicar fecha de cuadre.', mtInformation,[mbok], 0);
      Exit;
    end;
    frmCuadreEfeFondoCaja.ProcInserta;
    if frmCuadreEfeFondoCaja.Showmodal = mrOk then
    begin
      frmCuadreEfeFondoCaja.GuardarDatosDistBilletes;
    end;
  finally
  frmCuadreEfeFondoCaja.Free;
  frmCuadreEfeFondoCaja:=Nil;
  end;
except
end;
end;

procedure TfrmCuadreCajaNew.BitBtn13Click(Sender: TObject);
begin
  dmTransCnt.tblDistCashEnCaja.Close;
  if rxCuadreCOD_EMPLEADO.IsNull then
  begin
    dmTransCnt.tblDistCashEnCaja.params[0].AsInteger:= rxCuadreCOD_EMPLEADO.Value;
    dmTransCnt.tblDistCashEnCaja.params[1].AsInteger:= rxCuadreCOD_EMPLEADO.Value;
  end else
  begin
    dmTransCnt.tblDistCashEnCaja.params[0].AsInteger:= 0;
    dmTransCnt.tblDistCashEnCaja.params[1].AsInteger:= 5000;
  end;
  dmTransCnt.tblDistCashEnCaja.params[2].Value:=ExtraerFecha(DateTimePicker4.DateTime);
  dmTransCnt.tblDistCashEnCaja.params[3].Value:=ExtraerFecha(DateTimePicker5.DateTime);
  dmTransCnt.tblDistCashEnCaja.Open;
end;

procedure TfrmCuadreCajaNew.Button5Click(Sender: TObject);
begin
  DateTimePicker4.Date:=IncDay(DateTimePicker4.Date);
  BitBtn13Click(Self);
end;

procedure TfrmCuadreCajaNew.Button6Click(Sender: TObject);
begin
  DateTimePicker4.Date:=IncDay(DateTimePicker4.Date,-1);
  BitBtn13Click(Self);
end;

procedure TfrmCuadreCajaNew.Panel4Enter(Sender: TObject);
begin
  DateTimePicker4.DateTime:=ExtraerFecha(GlbFechaTrnDiaria);
  DateTimePicker5.DateTime:=ExtraerFecha(GlbFechaTrnDiaria);
end;

procedure TfrmCuadreCajaNew.BitBtn14Click(Sender: TObject);
begin
  dmTransCnt.tblDistCashEnCaja.Close;
  dmTransCnt.tblDistCashEnCaja.params[0].AsInteger:= 0;
  dmTransCnt.tblDistCashEnCaja.params[1].AsInteger:= 5000;
  dmTransCnt.tblDistCashEnCaja.params[2].AsDateTime:=ExtraerFecha(DateTimePicker4.DateTime);
  dmTransCnt.tblDistCashEnCaja.params[3].AsDateTime:=ExtraerFecha(DateTimePicker5.DateTime);
  dmTransCnt.tblDistCashEnCaja.Open;
end;

end.
