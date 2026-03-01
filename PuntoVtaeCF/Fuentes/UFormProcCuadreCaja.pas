unit UFormProcCuadreCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, RxMemDS, EditNew, WinSkinData,
  rxToolEdit, RXDBCtrl, Buttons, RXCtrls, ExtCtrls, RxLookup,
  IBCustomDataSet, IBTable, UGetDateTipoM, ComCtrls, Grids, DBGrids;

type
  TfrmCuadreCaja = class(TForm)
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
  frmCuadreCaja: TfrmCuadreCaja;
  esConsulta : boolean;
implementation

uses UDatModCuadrexRuta, uglobal, UDatModUsuarios, UDatModCxc,
  UFrmConsultaCuadreCaja, URepCuadreCaja, URepCuadreCajaPOS,
  UFormMantDepositos, UDatModTransCnt;

{$R *.dfm}

procedure TfrmCuadreCaja.FormCreate(Sender: TObject);
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
  if GlBLimao = 0 then
  begin
    Label62.Visible:=False;
    Label63.Visible:=False;
    DBEdit43.Visible:=False;
    DBEdit44.Visible:=False;
  end;
end;

procedure TfrmCuadreCaja.BitBtn1Click(Sender: TObject);
begin
  if rxCuadre.State = dsBrowse then
  begin
    rxCuadre.Insert;
    rxCuadreMoneda.Value:='1';//pesos default;
    rxCuadreFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);
    if rxCuadreCOD_EMPLEADO.IsNull then
    rxCuadreCOD_EMPLEADO.Value := VarUsuarioGlb;

    ProcesaCobroVisaNetCardnet;
    ProcIniciaRxTotales;
    DBEdit34Exit(Self);
    DBEdit34.SetFocus;
  end;
end;
procedure TfrmCuadreCaja.ProcesaCobroVisaNetCardNet;
begin
  dmcxc.qryCobrosConTarjetaCuadre.Close;
  dmcxc.qryCobrosConTarjetaCuadre.Params[0].Value:= rxCuadreFECHA.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[1].Value:= rxCuadreMoneda.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[2].Value:= rxCuadreMoneda.Value;
  dmcxc.qryCobrosConTarjetaCuadre.Params[3].Value:= rxCuadreCOD_EMPLEADO.Value;
  
  dmcxc.qryCobrosConTarjetaCuadre.Open;
  dmcxc.qryCobrosConTarjetaCuadre.RecordCount;
  dmcxc.qryCobrosConTarjetaCuadre.First;
  if dmcxc.qryCobrosConTarjetaCuadre.RecordCount = 0 then
  begin
    rxCuadreCarnet.Value := 0;
    rxCuadreVisaNet.Value:= 0;
  end;
  While not dmcxc.qryCobrosConTarjetaCuadre.Eof do
  begin
    //1-visanet 2-CarNET
    if dmcxc.qryCobrosConTarjetaCuadreCODIGO_PROVEEDOR.Value = 2 then
    rxCuadreCarnet.Value:= dmcxc.qryCobrosConTarjetaCuadreMONTO.Value
    else
    if dmcxc.qryCobrosConTarjetaCuadreCODIGO_PROVEEDOR.Value = 1 then
    rxCuadreVisaNet.Value:= dmcxc.qryCobrosConTarjetaCuadreMONTO.Value;
    dmcxc.qryCobrosConTarjetaCuadre.next;
  end;
end;

procedure TfrmCuadreCaja.BitBtn3Click(Sender: TObject);
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
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[28].Value:= rxCuadreCarnet.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[29].Value:= rxCuadreVisaNet.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[30].Value:= rxCuadreTransferencia.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.Params[31].Value:= rxCuadreTransferenciaCxc.Value;
  dmCuadrexRuta.sp_InsertCuadreCaja.ExecProc;
  if not dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.InTransaction then
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.StartTransaction;
  try
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.CommitRetaining;
  except
  dmCuadrexRuta.sp_InsertCuadreCaja.Transaction.RollbackRetaining;
  end;
  //rxTotales.Close;
  //rxTotales.Open;
  //rxCuadre.Close;
  //rxCuadre.Open;
end;

procedure TfrmCuadreCaja.ProcIniciaRxTotales;
begin
  rxTotales.close;
  rxTotales.Open;
  rxTotales.Insert;

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
end;

procedure TfrmCuadreCaja.rxTotalesCalcFields(DataSet: TDataSet);
begin
  if rxTotalesMontoVisanet.IsNull then
  begin
  rxTotalesMontoVisanet.Value:= rxCuadreVisaNet.Value;
  rxTotalesMontoCarnet.Value:= rxCuadreCarnet.Value;
  end;
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
  rxTotalesMontoEnCheque.Value +
  rxTotalesMontoCarnet.Value  +
  rxTotalesMontoVisanet.Value;

  rxTotalesMontoPorTransf.Value:= rxCuadreTransferencia.Value + rxCuadreTransferenciaCxc.Value;

  rxTotalesDiferencia.Value:= rxTotalesTotalGeneral.Value -
  rxTotalesTotalVenta.Value +
  rxTotalesAjuste.Value -
  rxTotalesDieta.Value +
  rxTotalesRetiro.Value;


  rxTotalesTotalCuadre.Value:=
  rxSubtotal_1SubTotalVtaCredito.Value +
  rxTotalesTotalVenta.Value            +
  rxTotalesAjuste.Value                -
  rxTotalesDieta.Value                 +

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

procedure TfrmCuadreCaja.rxCuadreM2000Change(Sender: TField);
begin
  rxTotalesC2000.Value:= 2000 * rxCuadreM2000.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM1000Change(Sender: TField);
begin
  rxTotalesC1000.Value:= 1000 * rxCuadreM1000.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM500Change(Sender: TField);
begin
  rxTotalesC500.Value:= 500 * rxCuadreM500.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM200Change(Sender: TField);
begin
  rxTotalesC200.Value:= 200 * rxCuadreM200.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM100Change(Sender: TField);
begin
  rxTotalesC100.Value:= 100 * rxCuadreM100.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM50Change(Sender: TField);
begin
  rxTotalesC50.Value:= 50 * rxCuadreM50.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM25Change(Sender: TField);
begin
  rxTotalesC25.Value:= 25 * rxCuadreM25.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM20Change(Sender: TField);
begin
  rxTotalesC20.Value:= 20 * rxCuadreM20.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM10Change(Sender: TField);
begin
  rxTotalesC10.Value:= 10 * rxCuadreM10.Value;
end;

procedure TfrmCuadreCaja.rxCuadreM5Change(Sender: TField);
begin
  rxTotalesC5.Value:= 5 * rxCuadreM5.Value;
end;

procedure TfrmCuadreCaja.ProcTotal;
var
  Suma, Total : Extended;
begin
  if (rxCuadre.State in [dsBrowse, dsInactive]) then
  exit;
  Suma:=0;

  dmcxc.qryTipoMvtoIngresoCuadre.Close;
  dmcxc.qryTipoMvtoIngresoCuadre.Params[0].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryTipoMvtoIngresoCuadre.Params[1].Value := ExtraerFecha(rxCuadreFECHA.Value);
  if not rxCuadreCOD_EMPLEADO.IsNull then
  dmcxc.qryTipoMvtoIngresoCuadre.Params[2].Value := rxCuadreCOD_EMPLEADO.Value
  else
  dmcxc.qryTipoMvtoIngresoCuadre.Params[2].Value := VarUsuarioGlb;
  dmcxc.qryTipoMvtoIngresoCuadre.Params[3].Value := rxCuadreMoneda.Value;
  dmcxc.qryTipoMvtoIngresoCuadre.Params[4].Value := rxCuadreMoneda.Value;
  dmcxc.qryTipoMvtoIngresoCuadre.ExecQuery;
  //dmcxc.qryTipoMvtoIngresoCuadre.Sql.Text
  dmcxc.qryIngPropinaLey.Close;
  dmcxc.qryIngPropinaLey.Params[0].Value := ExtraerFecha(rxCuadreFECHA.Value);
  dmcxc.qryIngPropinaLey.Params[1].Value := ExtraerFecha(rxCuadreFECHA.Value);
  if not rxCuadreCOD_EMPLEADO.IsNull then
  dmcxc.qryIngPropinaLey.Params[2].Value := rxCuadreCOD_EMPLEADO.Value
  else
  dmcxc.qryIngPropinaLey.Params[2].Value := VarUsuarioGlb;
  dmcxc.qryIngPropinaLey.Params[3].Value := rxCuadreMoneda.Value;
  dmcxc.qryIngPropinaLey.Params[4].Value := rxCuadreMoneda.Value;
  dmcxc.qryIngPropinaLey.ExecQuery;

  dmCuadrexRuta.qryDesembolso.Close;
  dmCuadrexRuta.qryDesembolso.Params[0].Value:= ExtraerFecha(rxCuadreFECHA.Value);
  dmCuadrexRuta.qryDesembolso.Params[1].Value:= rxCuadreCOD_EMPLEADO.Value;
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
  rxCuadreCantIngFinanc.Value := 0;
  rxCuadreCantDevolucion.Value:= 0;
  rxCuadreRETIRO.Value        := 0;
  rxCuadreTransferencia.Value := 0;
  rxCuadreTransferenciaCxc.Value :=0;
  rxCuadreCantTransferencia.Value:=0;
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
      rxCuadrePropinaLegal.value  :=
      rxCuadrePropinaLegal.value +
      dmcxc.qryIngPropinaLey.FieldByName('PropinaLegal').AsCurrency;
      dmcxc.qryIngPropinaLey.Next;
    end;
  end;

  if dmcxc.qryTipoMvtoIngresoCuadre.Open then
  begin

    While Not dmcxc.qryTipoMvtoIngresoCuadre.Eof do
    begin
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 1) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 3) or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 4) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value) > 0 then
        begin
          rxCuadreVentaAlContado.Value := rxCuadreVentaAlContado.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;//dmcxc.qryTipoMvtoIngresoCuadre.sql.text
          Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;
          rxCuadreCantVtaContado.Value:=rxCuadreCantVtaContado.Value + 1;
        end else
        begin

        end;
      end else
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 2) then
      begin
        Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
        rxCuadreINGRESO_CXC.Value:=rxCuadreINGRESO_CXC.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;
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
              dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency * -1;
              Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency *-1;
            end else
            begin
              rxCuadreMONTO_DEVOLUCION.Value:= rxCuadreMONTO_DEVOLUCION.Value + dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency;
              Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').AsCurrency;
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
              Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency *-1;
            end;
          end;
        end else
        begin
          //rxCuadreMONTO_DEVOLUCION.Value:= dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
          //Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
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
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value;
        rxCuadreCantVtaCredito.Value := rxCuadreCantVtaCredito.Value + 1;
      end else
      begin
        if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 15) then
        begin
          Total := dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
          rxCuadreMontoInicialFinanciamiento.Value:= rxCuadreMontoInicialFinanciamiento.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto').Value;
          //rxCuadreCantVtaContado.Value:=rxCuadreCantVtaContado.Value + 1;
        end;
      end;
      
      {t
      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 7) Or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 8) Or
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 15) then
      begin

        if rxSubtotal_1.State = dsBrowse then rxSubtotal_1.Edit;
        rxSubtotal_1SubTotalVtaCredito.Value := rxSubtotal_1SubTotalVtaCredito.Value +
        rxCuadreVentaACredito.Value + rxCuadreMontoFinanciado.Value;

        rxSubtotal_1.Post;
      end else   }

      if ((UpperCase(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString) = 'TRANSFERENCIA')
               or (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 20)) and
         (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('EsCxc').AsInteger = 1) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value) > 0 then
        begin
          rxCuadreTransferenciaCxc.Value:=rxCuadreTransferenciaCxc.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;

          rxCuadreCantTransferencia.Value:=rxCuadreCantTransferencia.Value + 1;

          //Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
        end;
      end else
      if (UpperCase(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_documento').AsString) = 'TRANSFERENCIA') OR
      (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('tipo_doc').AsInteger = 20) then
      begin
        if ABS(dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value) > 0 then
        begin
          rxCuadreTransferencia.Value:=rxCuadreTransferencia.Value +
          dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').Value;

          rxCuadreCantTransferencia.Value:=rxCuadreCantTransferencia.Value + 1;

          //Total:=dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('monto_recibido').AsCurrency;
        end;
      end;

      if (dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('MONTOCOBERTURA').Value > 0) then
      begin
        if rxSubtotal_1.State = dsBrowse then
        rxSubtotal_1.Edit;
        rxSubtotal_1SubTotalVtaCredito.Value := rxSubtotal_1SubTotalVtaCredito.Value +
        rxCuadreCreditoARS.Value;
        rxCuadreCantVtaCreditoArs.Value := rxCuadreCantVtaCreditoArs.Value + 1;
        rxCuadreCreditoARS.Value:= rxCuadreCreditoARS.Value +
        dmcxc.qryTipoMvtoIngresoCuadre.FieldByName('MONTOCOBERTURA').Value;
        rxSubtotal_1.Post;
      end;

      Suma:=Suma + total;
      total:= 0;
      dmcxc.qryTipoMvtoIngresoCuadre.Next;
    end;

    if rxSubtotal_1.State = dsBrowse then rxSubtotal_1.Edit;
    rxSubtotal_1SubTotalVtaCredito.Value := rxSubtotal_1SubTotalVtaCredito.Value +
    rxCuadreVentaACredito.Value + rxCuadreMontoFinanciado.Value;
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
      //if rxTotales.State in [dsEdit, dsInsert] then
      //rxTotales.Post;
      //if rxCuadre.State in [dsEdit, dsInsert] then
      //rxCuadre.Post;
    end;
  end;
end;

procedure TfrmCuadreCaja.rxCuadreMONEDASChange(Sender: TField);
begin
  rxTotalesMonedas.Value := rxCuadreMONEDAS.Value; 
end;

procedure TfrmCuadreCaja.rxCuadreAJUSTEChange(Sender: TField);
begin
  rxTotalesAjuste.value:= rxCuadreAJUSTE.value;
end;

procedure TfrmCuadreCaja.rxCuadreRETIROChange(Sender: TField);
begin
  if rxTotales.state = dsBrowse then rxTotales.Edit;
  rxTotalesRetiro.Value:= rxCuadreRetiro.Value;
end;

procedure TfrmCuadreCaja.rxCuadreDIETAChange(Sender: TField);
begin
  rxTotalesDieta.value:= rxCuadreDieta.Value;
end;

procedure TfrmCuadreCaja.BitBtn5Click(Sender: TObject);
begin
  rxTotales.Close;
  rxTotales.Open;
  rxCuadre.Close;
  rxCuadre.Open;
  rxSubtotal_1.EmptyTable;
end;

procedure TfrmCuadreCaja.BitBtn2Click(Sender: TObject);
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

procedure TfrmCuadreCaja.ProcInsDatosConsulta;
begin
  rxTotales.close;
  rxTotales.Open;
  rxTotales.Insert;
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
  rxCuadre.Post;
end;

procedure TfrmCuadreCaja.rxCuadreMONTO_EN_CHEQUEChange(Sender: TField);
begin
  rxTotalesMontoEnCheque.Value := rxCuadreMONTO_EN_CHEQUE.Value;
end;

procedure TfrmCuadreCaja.rxCuadreFondoEnCajaChange(Sender: TField);
begin
  rxTotalesFondoEnCaja.value:= rxCuadreFondoEnCaja.value;
end;

procedure TfrmCuadreCaja.BitBtn4Click(Sender: TObject);
begin
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

procedure TfrmCuadreCaja.DBEdit34Exit(Sender: TObject);
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

procedure TfrmCuadreCaja.FormCloseQuery(Sender: TObject;
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

procedure TfrmCuadreCaja.DBDateEdit1Change(Sender: TObject);
begin
  ProcTotal;
end;

procedure TfrmCuadreCaja.rxCuadreVisaNetChange(Sender: TField);
begin
  rxTotalesMontoVisanet.Value:= rxCuadreVisaNet.Value;
end;

procedure TfrmCuadreCaja.rxCuadreCarnetChange(Sender: TField);
begin
  rxTotalesMontoCarnet.Value:= rxCuadreCarnet.Value;
end;

procedure TfrmCuadreCaja.DBDateEdit1Exit(Sender: TObject);
begin
  DBEdit34Exit(Self);
end;

procedure TfrmCuadreCaja.BitBtn6Click(Sender: TObject);
begin
  ProcDatosCuadres(0);
end;

procedure TfrmCuadreCaja.ProcDatosCuadres(accion: Integer);
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

procedure TfrmCuadreCaja.Button1Click(Sender: TObject);
begin
  ProcDatosCuadres(1);
end;

procedure TfrmCuadreCaja.Button2Click(Sender: TObject);
begin
  ProcDatosCuadres(2);
end;

procedure TfrmCuadreCaja.BitBtn7Click(Sender: TObject);
begin
  ProcDatosCuadres(3);
end;

procedure TfrmCuadreCaja.FechasConVentas(accion: smallint);
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
  dmCuadrexRuta.qryFechasConVentas.Open;
end;

procedure TfrmCuadreCaja.BitBtn8Click(Sender: TObject);
begin
  FechasConVentas(0);
end;

procedure TfrmCuadreCaja.Button3Click(Sender: TObject);
begin
  FechasConVentas(2);
end;

procedure TfrmCuadreCaja.Button4Click(Sender: TObject);
begin
FechasConVentas(1);
end;

procedure TfrmCuadreCaja.BitBtn9Click(Sender: TObject);
begin
 FechasConVentas(3);
end;

procedure TfrmCuadreCaja.BitBtn10Click(Sender: TObject);
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

procedure TfrmCuadreCaja.BitBtn11Click(Sender: TObject);
begin
  if not Assigned(frmDepositos) then
  frmDepositos:=TfrmDepositos.Create(nil);
  try
    frmDepositos.show;
    frmDepositos.SpeedButton2Click2(Self);
    if dmTransCnt.tblDepositoMaster.state in [dsEdit, dsInsert] then
    dmTransCnt.tblDepositoMasterMONTO.Value:=
    rxTotalesTotalCuadre.Value;
  finally
  
  end;
end;

procedure TfrmCuadreCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(frmDepositos) then
  begin
    frmDepositos.free;
    frmDepositos:=nil;
  end;
end;

procedure TfrmCuadreCaja.DBEdit36Exit(Sender: TObject);
begin
  if rxCuadre.State in [dsEdit, dsInsert] then
  ProcTotal;
end;

end.
