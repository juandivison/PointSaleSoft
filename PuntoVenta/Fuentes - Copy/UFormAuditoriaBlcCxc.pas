unit UFormAuditoriaBlcCxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxCtrls, DB, IBCustomDataSet, Grids, DBGrids, RxDBCtrl, RxMemDS,
  RxLookup, IBQuery, Buttons, StdCtrls, ComCtrls, WinSkinData, Mask,
  DBCtrls;

type
  TfrmAuditoriaBlcCxc = class(TForm)
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DBStatusLabel5: TDBStatusLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBStatusLabel3: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    RxDBGrid4: TRxDBGrid;
    RxDBGrid5: TRxDBGrid;
    rxdbLookupCte: TRxDBLookupCombo;
    edtCodcte: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tblVentasMast: TIBDataSet;
    tblVentasMastNUMERO: TIntegerField;
    tblVentasMastFECHA: TDateTimeField;
    tblVentasMastCIA_KEY: TIntegerField;
    tblVentasMastCODIGO_CTE: TIntegerField;
    tblVentasMastCODIGO_VENDEDOR: TIntegerField;
    tblVentasMastFORMA_PAGO: TSmallintField;
    tblVentasMastNUMERO_NCF: TIBStringField;
    tblVentasMastNUMERO_FACTURA: TIBStringField;
    tblVentasMastOBSERVACION: TIBStringField;
    tblVentasMastMONEDA: TIBStringField;
    tblVentasMastVALOR_TOTAL_DET: TFloatField;
    tblVentasMastMONTO_TOTAL_ITBIS: TFloatField;
    tblVentasMastFECHA_IN: TDateTimeField;
    tblVentasMastIN_POR: TIBStringField;
    tblVentasMastFECHA_MOD: TDateTimeField;
    tblVentasMastMOD_POR: TIBStringField;
    tblVentasMastSERIE_NCF_ASIGNADO: TIntegerField;
    tblVentasMastMONTO_BRUTO: TFloatField;
    tblVentasMastPORC_DESCUENTO: TIntegerField;
    tblVentasMastMONTO_DESCUENTO: TFloatField;
    tblVentasMastMONTO_INICIAL: TFloatField;
    tblVentasMastNOMBRE_CLIENTE_GENERAL: TIBStringField;
    tblVentasMastTIPO_VENTA: TSmallintField;
    tblVentasMastCOMENTARIO: TIBStringField;
    tblVentasMastCOTIZACION_ORIGEN: TIntegerField;
    tblVentasMastREFERENCIACTE: TIBStringField;
    tblVentasMastMONTO_RECARGO: TFloatField;
    tblVentasMastTIPONCFIFISCAL: TIntegerField;
    tblVentasMastMONTO_EXONERADO_ITBIS: TFloatField;
    tblVentasMastNIF_IMPRESO: TSmallintField;
    tblVentasMastIDRETENCION: TIntegerField;
    tblVentasMastPROPINALEGAL: TFloatField;
    tblVentasMastPORCPROPINALEGAL: TFloatField;
    tblVentasMastPROPINA: TFloatField;
    tblVentasMastTICKET_ID: TIntegerField;
    tblVentasMastSUB_TOTALITBIS: TFloatField;
    tblVentasMastCOD_USR_CAJA: TIntegerField;
    tblVentasMastCOD_SUBCLIENTE: TIntegerField;
    tblVentasMastVENTAARS: TSmallintField;
    tblVentasMastCOD_CAJA: TIntegerField;
    tblVentasMastSTATUS: TIBStringField;
    tblTranscxc: TIBDataSet;
    tblTranscxcSERIE: TFloatField;
    tblTranscxcCIA_KEY: TIntegerField;
    tblTranscxcTIPO_DOC: TIntegerField;
    tblTranscxcMONEDA: TIBStringField;
    tblTranscxcFECHA: TDateTimeField;
    tblTranscxcNUMERO_DOC: TIntegerField;
    tblTranscxcCODIGO_CLIENTE: TIntegerField;
    tblTranscxcCODIGO_SERV: TIntegerField;
    tblTranscxcCONCEPTO: TIBStringField;
    tblTranscxcTIPO_TRANF: TSmallintField;
    tblTranscxcORIGEN: TIBStringField;
    tblTranscxcVALOR_DOCUMENTO: TFloatField;
    tblTranscxcDEBITO: TFloatField;
    tblTranscxcCREDITO: TFloatField;
    tblTranscxcMONTOCLD: TFloatField;
    tblTranscxcSTATUS: TIBStringField;
    tblTranscxcTIPO_SERV: TIntegerField;
    tblTranscxcCAMPOCODIGOSERVAUXI: TIntegerField;
    tblTranscxcFECHA_IN: TDateTimeField;
    tblTranscxcIN_POR: TIBStringField;
    tblTranscxcFECHA_MOD: TDateTimeField;
    tblTranscxcMOD_POR: TIBStringField;
    tblTranscxcNUMERO_TRN_VENTA: TIntegerField;
    tblTranscxcCODIGO_VENDEDOR: TIntegerField;
    tblTranscxcNUMERO_RECIBO: TIntegerField;
    tblTranscxcNUM_NCF_AFECTADO: TIBStringField;
    tblTranscxcSTATUS_CNT: TIBStringField;
    tblTranscxcNUMPOL: TIntegerField;
    tblTranscxcNOTA: TIBStringField;
    tblFactura: TIBDataSet;
    tblFacturaSERIE: TFloatField;
    tblFacturaNUMERO: TFloatField;
    tblFacturaCIA_KEY: TIntegerField;
    tblFacturaMONEDA: TIBStringField;
    tblFacturaTIPO: TSmallintField;
    tblFacturaCODIGO_CTE: TIntegerField;
    tblFacturaFECHA: TDateTimeField;
    tblFacturaDESCRIPCION: TIBStringField;
    tblFacturaMONTO_FACT: TFloatField;
    tblFacturaRCXC: TIBStringField;
    tblFacturaRCNT: TIBStringField;
    tblFacturaSTATUS: TIBStringField;
    tblFacturaFECHA_IN: TDateTimeField;
    tblFacturaIN_POR: TIBStringField;
    tblFacturaFECHA_MOD: TDateTimeField;
    tblFacturaMOD_POR: TIBStringField;
    tblFacturaFECHA_VENCE: TDateTimeField;
    tblFacturaTIPO_FACTURA: TSmallintField;
    tblFacturaAPLICA_TIPODESC: TSmallintField;
    tblFacturaNUMERO_TRN_VTA: TIntegerField;
    tblFacturaPORC_ATRASOCXC: TFloatField;
    tblFacturaIDFACTWISPRO: TIBStringField;
    tblBalanceCteCxc: TIBDataSet;
    tblBalanceCteCxcCODIGO: TIntegerField;
    tblBalanceCteCxcSERVICIO: TIntegerField;
    tblBalanceCteCxcMONEDA: TIBStringField;
    tblBalanceCteCxcCTA1_BCE: TIBStringField;
    tblBalanceCteCxcCTA2_BCE: TIBStringField;
    tblBalanceCteCxcCTA3_BCE: TIBStringField;
    tblBalanceCteCxcBALANCE_ACT: TFloatField;
    tblBalanceCteCxcBALANCE_ANT: TFloatField;
    tblBalanceCteCxcDEBITO_MES: TFloatField;
    tblBalanceCteCxcCREDITO_MES: TFloatField;
    tblBalanceCteCxcDEBITO_ACM: TFloatField;
    tblBalanceCteCxcCREDITO_ACM: TFloatField;
    tblBalanceCteCxcFECHA_BCE: TDateTimeField;
    tblBalanceCteCxcFECHA_ULT_PAGO: TDateTimeField;
    tblBalanceCteCxcSTATUS_BCE: TIBStringField;
    tblBalanceCteCxcFECHA_IN: TDateTimeField;
    tblBalanceCteCxcIN_POR: TIBStringField;
    tblBalanceCteCxcFECHA_MOD: TDateTimeField;
    tblBalanceCteCxcMOD_POR: TIBStringField;
    tblBalanceCteCxcCODIGOAUXI: TIntegerField;
    tblBalanceCteCxcCODIGOTEMPORAL: TIntegerField;
    tblFacturaPendiente: TIBDataSet;
    tblFacturaPendienteTIPO: TIntegerField;
    tblFacturaPendienteMONEDA: TIBStringField;
    tblFacturaPendienteNUMERO_FACT: TIntegerField;
    tblFacturaPendienteMONTO_PENDIENTE: TFloatField;
    tblFacturaPendienteSTATUS: TIBStringField;
    tblFacturaPendienteFECHA_IN: TDateTimeField;
    tblFacturaPendienteIN_POR: TIBStringField;
    tblFacturaPendienteFECHA_MOD: TDateTimeField;
    tblFacturaPendienteMOD_POR: TIBStringField;
    tblFacturaPendienteNUMERO_TRN_VTA: TIntegerField;
    DataSource1: TDataSource;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteNOMBRE_CTE: TIBStringField;
    qryClienteNOMBRE_ABREV: TIBStringField;
    qryClienteNOMBRE_FACTURAR: TIBStringField;
    qryClienteDIRECCION_CONT: TIBStringField;
    qryClienteTELEF_CONTACTO: TIBStringField;
    qryClienteCIUDAD: TIBStringField;
    qryClienteRNC: TIBStringField;
    qryClienteRNC_NUMERO: TIBStringField;
    qryClienteCEDULA: TIBStringField;
    qryClientePRECIO_ID: TIntegerField;
    qryClienteLIMITE_CREDITO: TFloatField;
    qryClienteCANT_DIAS_CREDITO: TSmallintField;
    qryClienteCIA_KEY: TIntegerField;
    qryClienteUSARLEVELPRECIO: TSmallintField;
    qryClienteCOD_VENDEDOR: TIntegerField;
    qryClienteTIPO_CF: TIBStringField;
    qryClienteNOMBRECLIENTE: TIBStringField;
    qryClienteNSS: TIBStringField;
    rxtblclientes: TRxMemoryData;
    rxtblclientesCodigoPropietario: TIntegerField;
    DataSource7: TDataSource;
    RxDBGrid6: TRxDBGrid;
    tblBlchistorico: TIBDataSet;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    tblBlchistoricoCODIGO: TIntegerField;
    tblBlchistoricoSERVICIO: TIntegerField;
    tblBlchistoricoMONEDA: TIBStringField;
    tblBlchistoricoFECHA_HISTORICO: TDateTimeField;
    tblBlchistoricoBALANCE_ACT: TFloatField;
    tblBlchistoricoBALANCE_ANT: TFloatField;
    tblBlchistoricoDEBITO_MES: TFloatField;
    tblBlchistoricoCREDITO_MES: TFloatField;
    tblBlchistoricoDEBITO_ACM: TFloatField;
    tblBlchistoricoCREDITO_ACM: TFloatField;
    tblBlchistoricoSTATUS: TIBStringField;
    tblBlchistoricoFECHA_IN: TDateTimeField;
    tblBlchistoricoIN_POR: TIBStringField;
    tblBlchistoricoFECHA_MOD: TDateTimeField;
    tblBlchistoricoMOD_POR: TIBStringField;
    tblBlchistoricoCAMPOCODIGOSERVAUXI: TIntegerField;
    tblBlchistoricoCAMPOCODSERVOLD: TIntegerField;
    DataSource8: TDataSource;
    DBStatusLabel6: TDBStatusLabel;
    DBStatusLabel4: TDBStatusLabel;
    BitBtn6: TBitBtn;
    SkinData1: TSkinData;
    TabSheet3: TTabSheet;
    RxDBGrid7: TRxDBGrid;
    BitBtn7: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn8: TBitBtn;
    dsqryDatosblccxc: TDataSource;
    qryFechaIniBlc: TIBQuery;
    qryFechaIniBlcFECHAMIN: TDateTimeField;
    qryFechaIniBlcFECHAMAX: TDateTimeField;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    RxDBGrid8: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    tblReciboBlcxc: TIBDataSet;
    tblReciboBlcxcFECHA_RECIBO: TDateTimeField;
    tblReciboBlcxcNUMERO_RECIBO: TIntegerField;
    tblReciboBlcxcCODIGO_CTE: TIntegerField;
    tblReciboBlcxcBALANCE_ACTUAL: TFloatField;
    dstblReciboBlcxc: TDataSource;
    RxDBGrid9: TRxDBGrid;
    Label1: TLabel;
    fctIngresos: TIBDataSet;
    fctIngresosCODIGO_CTE: TIntegerField;
    fctIngresosSERIE: TFloatField;
    fctIngresosNUMERO: TFloatField;
    fctIngresosNUMERO_FACT: TFloatField;
    fctIngresosMONTO_FACT: TFloatField;
    fctIngresosMONEDA: TIBStringField;
    fctIngresosSTATUS: TIBStringField;
    fctIngresosCODIGO_SERVICIO: TIntegerField;
    fctIngresosTIPO: TIntegerField;
    fctIngresosTIPO_DOC: TIntegerField;
    dsfctIngresos: TDataSource;
    RxDBGrid10: TRxDBGrid;
    Label2: TLabel;
    lblBlcPendiente: TLabel;
    Label4: TLabel;
    procedure rxdbLookupCteEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rxdbLookupCteChange(Sender: TObject);
    procedure rxdbLookupCteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtCodcteChange(Sender: TObject);
    procedure rxdbLookupCteExit(Sender: TObject);
    procedure edtCodcteExit(Sender: TObject);
    procedure tblFacturaAfterScroll(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure tblBalanceCteCxcAfterScroll(DataSet: TDataSet);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure TabSheet1Resize(Sender: TObject);
    procedure RxDBGrid5Enter(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure tblTranscxcAfterScroll(DataSet: TDataSet);
    procedure tblFacturaPendienteAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditoriaBlcCxc: TfrmAuditoriaBlcCxc;

implementation
  uses UDatModConectar, UGlobal, UDatModCxc, UFormSelFecha,
  URepEstadoCtaCxc, UFormFacturas, UCobrarFacturas, UFormAplicarDbCrCxc;
{$R *.dfm}

procedure TfrmAuditoriaBlcCxc.rxdbLookupCteEnter(Sender: TObject);
begin
  rxtblclientes.Edit;
end;

procedure TfrmAuditoriaBlcCxc.SpeedButton1Click(Sender: TObject);
begin
  if (edtCodcte.Text <> '') then
  begin
    if qryCliente.Locate('CODIGO_CTE',edtCodcte.Text,[]) then
    begin
      rxtblclientes.EmptyTable;
      rxtblclientes.Insert;
      rxtblclientesCodigoPropietario.Value:=qryClienteCODIGO_CTE.Value;
      rxtblclientes.Post;
      rxdbLookupCteChange(self);
      
      tblReciboBlcxc.Close;
      tblReciboBlcxc.Params[0].Value:= qryClienteCODIGO_CTE.Value;
      tblReciboBlcxc.Open;

      fctIngresos.Close;
      fctIngresos.Params[0].Value:= qryClienteCODIGO_CTE.Value;
      fctIngresos.Open;
    end;
  end;
end;

procedure TfrmAuditoriaBlcCxc.FormCreate(Sender: TObject);
begin
  dmCxc.qryRepServ.close;
  rxtblclientes.Close;
  rxtblclientes.Open;
  qryCliente.Close;
  qryCliente.Open;
  PageControl1.ActivePage:=TabSheet1;
end;

procedure TfrmAuditoriaBlcCxc.rxdbLookupCteChange(Sender: TObject);
begin
  tblVentasMast.Close;
  tblTranscxc.Close;
  tblFacturaPendiente.Close;
  tblBalanceCteCxc.Close;
  tblFactura.Close;
  tblVentasMast.params[0].Value:=rxtblclientesCodigoPropietario.Value;
  tblTranscxc.params[0].Value:=rxtblclientesCodigoPropietario.Value;
  tblFactura.params[0].Value:=rxtblclientesCodigoPropietario.Value;
  tblFacturaPendiente.params[0].Value:=rxtblclientesCodigoPropietario.Value;
  tblBalanceCteCxc.params[0].Value:=rxtblclientesCodigoPropietario.Value;
  tblVentasMast.open;
  tblTranscxc.open;
  tblFacturaPendiente.open;
  tblBalanceCteCxc.open;
  tblFactura.open;
  tblFactura.first;
  if not rxtblclientesCodigoPropietario.IsNull then
  edtCodcte.Text:=rxtblclientesCodigoPropietario.AsString;  
end;

procedure TfrmAuditoriaBlcCxc.rxdbLookupCteClick(Sender: TObject);
begin
  rxtblclientes.Edit;
end;

procedure TfrmAuditoriaBlcCxc.BitBtn1Click(Sender: TObject);
var
  a,m,d : Word;              
  codCte:Integer;
  xImp : Boolean;
  fecha : string;
begin
  GlbBalanceAnt := 0;
  xImp := False;
  codCte :=rxtblclientesCodigoPropietario.Value;
  dmcxc.stpFechaIniBceHist.Params[4].Value:= codCte;//codigo_cte_in
  dmcxc.stpFechaIniBceHist.Params[5].Value:= GlbFechaTrnDiaria;//fecha_in
  if (GlbMonedaBase > 0) then
     dmcxc.stpFechaIniBceHist.Params[6].Value:= IntToStr(GlbMonedaBase)
  else
  dmcxc.stpFechaIniBceHist.Params[6].Value:= '1';

  dmcxc.stpFechaIniBceHist.ExecProc;

  qryFechaIniBlc.Close;
  qryFechaIniBlc.params[0].value:= codCte;
  qryFechaIniBlc.open;

  frmSelFecha :=TfrmSelFecha.Create(Nil);
  try
    if not qryFechaIniBlcFECHAMIN.IsNull then
    begin
      frmSelFecha.FechaIni.Date := qryFechaIniBlcFECHAMIN.Value;
      frmSelFecha.FechaFin.Date := qryFechaIniBlcFECHAMAX.Value;
    end else
    begin
     if not dmcxc.stpFechaIniBceHist.Params[2].IsNull then
     begin
        if (dmcxc.stpFechaIniBceHist.Params[2].Value < GlbFechaTrnDiaria) then
        frmSelFecha.FechaIni.Date := dmcxc.stpFechaIniBceHist.Params[2].Value
        else
        begin
          frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;
        end;
     end
     else
     frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;

     if (dmcxc.stpFechaIniBceHist.Params[2].Value > GlbFechaTrnDiaria) then
     frmSelFecha.FechaFin.Date := dmcxc.stpFechaIniBceHist.Params[2].Value
     else
     frmSelFecha.FechaFin.Date := GlbFechaTrnDiaria;
    end;
    if frmSelFecha.Showmodal = mrOk then
    begin
      GlbFechaInicial := ExtraerFecha(frmSelFecha.FechaIni.Date); //ExtraerFecha(ibsqlFechaMinPrestActivo.FieldByName('fmin').AsDateTime);
      GlbFechaFinal   := ExtraerFecha(frmSelFecha.FechaFin.Date);
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha := Nil;
  end;

  DecodeDate(GlbFechaInicial,a,m,d);
  if (m = 1) and (d = 1 ) then
  begin
    M:=12;
    Dec(a);
  end;
  if (d = 1) then
  begin
    Dec(m);
    d:=DiasEnElMes(a,m)
  end else Dec(d);

  dmCxc.qrybceHistCte.Close;
  dmCxc.qrybceHistCte.Params[0].Value:= 0;//historico
  if (not dmcxc.stpFechaIniBceHist.Params[0].IsNull) then
  begin
    dmCxc.qrybceHistCte.params[1].Value:= dmcxc.stpFechaIniBceHist.Params[0].Value;//EncodeDate(a,m,d);
    dmCxc.qrybceHistCte.Params[2].Value:= dmcxc.stpFechaIniBceHist.Params[0].Value;//EncodeDate(a,m,d);
  end else
  begin
    dmCxc.qrybceHistCte.params[1].Value:= EncodeDate(a,m,d);
    dmCxc.qrybceHistCte.Params[2].Value:= EncodeDate(a,m,d);
  end;
  dmCxc.qrybceHistCte.Params[3].Value:= '1';
  dmCxc.qrybceHistCte.Params[4].Value:= CodCte;
  dmCxc.qrybceHistCte.Params[5].Value:= CodCte;
  dmCxc.qrybceHistCte.Open;

  dmCxc.qryRepServ.Close;

  dmCxc.qryRepServ.Params[0].Value := ExtraerFecha(GlbFechaInicial);
  dmCxc.qryRepServ.Params[1].Value := ExtraerFecha(GlbFechaFinal); //ExtraerFecha(GlbFechaFinal);
  dmCxc.qryRepServ.Params[2].Value := CodCte;
  dmCxc.qryRepServ.Open;

  dmCxc.qryRepServ.RecordCount;
        
  //usar siguiente query para estado general de cxc
  dmCxc.qrySQLBlceAntCxcCte.Close;
  if not dmCxc.qrySQLBlceAntCxcCte.Prepared then
  dmCxc.qrySQLBlceAntCxcCte.Prepare;
  dmCxc.qrySQLBlceAntCxcCte.Params[0].Value:= CodCte; //codigoclienteini
  dmCxc.qrySQLBlceAntCxcCte.Params[1].Value:= CodCte; //codigoclientefin
  dmCxc.qrySQLBlceAntCxcCte.Params[2].Value:= ExtraerFecha(GlbUltimoDiaMesAnt(GlbFechaInicial)+1); //FechaIni
  dmCxc.qrySQLBlceAntCxcCte.Params[3].Value:= ExtraerFecha(GlbFechaInicial-1); //FechaFin
  dmCxc.qrySQLBlceAntCxcCte.Params[4].Value:= '1'; //Moneda
  dmCxc.qrySQLBlceAntCxcCte.Params[5].Value:= GlbUltimoDiaMesAnt(GlbFechaInicial); //fecha_blc_Anterior
  dmCxc.qrySQLBlceAntCxcCte.ExecQuery;

  if dmCxc.qrySQLBlceAntCxcCte.Open then
  begin
    GlbBalanceAnt:=dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('BALANCE_ANT').AsFloat +
                   dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('DEBITO').AsFloat +
                   dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('CREDITO').AsFloat;
  end;
  qckRepXServ:=TQckRepXServ.Create(Nil);
  try
    if (dmCxc.qryRepServ.recordcount = 0) then
    begin
      qckRepXServ.rxNoRecord.Open;
      qckRepXServ.rxNoRecord.Insert;
      if not dmcxc.stpFechaIniBceHist.Params[3].IsNull then
      qckRepXServ.rxNoRecordDescripcion.Value:= dmcxc.stpFechaIniBceHist.Params[3].Value
      else
      qckRepXServ.rxNoRecordDescripcion.Value:= '*** NO RECORD ENCONTRADO ***';
      qckRepXServ.rxNoRecord.Post;
    end;
    //t qckRepXServ.Prepare;
    glbTPag := qckRepXServ.PageNumber;
    if xImp then
    begin
      qckRepXServ.PrinterSetup;
      qckRepXServ.Print;
    end else
    qckRepXServ.Preview;
    //if Assigned(frmConsultaFacturas) then
    //f frmConsultaFacturas.chkExportaPDF.Checked then
    //ReportExport(qckRepXServ,GlbRutaInformes+'\EstadoCxcCte'+IntToStr(CodCte)+'.pdf');
  finally
  qckRepXServ.rxNoRecord.Close;
  qckRepXServ.Free;
  qckRepXServ := Nil;
  end;
end;

procedure TfrmAuditoriaBlcCxc.BitBtn2Click(Sender: TObject);
begin
  try
    begin        
      frmCobrarFacturas:=TfrmCobrarFacturas.Create(nil);
      try
        frmCobrarFacturas.edit1.Text:=rxtblclientesCodigoPropietario.AsString;
        frmCobrarFacturas.Button2Click(Self);
        frmCobrarFacturas.Showmodal;
      finally
      frmCobrarFacturas.Free;
      frmCobrarFacturas:=Nil;
      end;
    end;
  finally
  end;
end;

procedure TfrmAuditoriaBlcCxc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (tblVentasMast.State in [dsEdit, dsInsert]) or
     (tblTranscxc.State in [dsEdit, dsInsert]) or
     (tblFactura.State in [dsEdit, dsInsert]) or
     (tblFacturaPendiente.State in [dsEdit, dsInsert]) or
     (tblBalanceCteCxc.State in [dsEdit, dsInsert]) then
  begin
    if MessageDlg('Tienes datos sin guardar, aún deseas cerrar la ventana?',mtWarning,[mbyes, mbno],0) = mryes then
    begin
      CanClose:=True;
      tblVentasMast.Close;
      tblTranscxc.Close;
      tblFacturaPendiente.Close;
      tblBalanceCteCxc.Close;
      tblFactura.Close;
      tblBlchistorico.Close;      
    end else CanClose:=False;
  end;
end;

procedure TfrmAuditoriaBlcCxc.edtCodcteChange(Sender: TObject);
begin
  SpeedButton1Click(self);
end;

procedure TfrmAuditoriaBlcCxc.rxdbLookupCteExit(Sender: TObject);
begin
  if not rxtblclientesCodigoPropietario.IsNull then
  edtCodcte.Text:=rxtblclientesCodigoPropietario.AsString;
end;

procedure TfrmAuditoriaBlcCxc.edtCodcteExit(Sender: TObject);
begin
  if (edtCodcte.Text = '') then exit;
  if not qryCliente.Locate('CODIGO_CTE', edtCodcte.Text,[]) then
  begin
    tblVentasMast.Close;
    tblTranscxc.Close;
    tblFacturaPendiente.Close;
    tblBalanceCteCxc.Close;
    tblFactura.Close;
    MessageDlg('No existe, verifique', mtinformation,[mbok],0);
  end;
end;

procedure TfrmAuditoriaBlcCxc.tblFacturaAfterScroll(DataSet: TDataSet);
begin
  tblVentasMast.Locate('NUMERO_FACTURA', tblFacturaNUMERO.Value,[]);
  tblTranscxc.Locate('NUMERO_DOC', tblFacturaNUMERO.Value,[]);
  tblFacturaPendiente.Locate('NUMERO_FACT', tblFacturaNUMERO.Value,[]);
  tblBalanceCteCxc.Locate('CODIGO', tblFacturaCODIGO_CTE.Value,[]);
end;

procedure TfrmAuditoriaBlcCxc.BitBtn3Click(Sender: TObject);
begin
  GlbSalvarQuery(tblVentasMast);
  GlbSalvarQuery(tblTranscxc);
  GlbSalvarQuery(tblFacturaPendiente);
  GlbSalvarQuery(tblBalanceCteCxc);
  if tblFactura.state = dsEdit then
  begin
   tblFacturaFECHA_MOD.Value:=now;
   tblFacturaMOD_POR.Value:=GlbUsuarioLogueado;
  end;
  GlbSalvarQuery(tblFactura);
  tblVentasMast.Close;
  tblTranscxc.Close;
  tblFactura.Close;
  tblFacturaPendiente.Close;
  tblBalanceCteCxc.Close;
  tblVentasMast.open;
  tblTranscxc.open;
  tblFacturaPendiente.open;
  tblBalanceCteCxc.open;
  tblFactura.open;  
end;

procedure TfrmAuditoriaBlcCxc.BitBtn5Click(Sender: TObject);
begin
  tblBlchistorico.Close;
  tblBlchistorico.Open;
end;

procedure TfrmAuditoriaBlcCxc.tblBalanceCteCxcAfterScroll(
  DataSet: TDataSet);
begin
  tblBlchistorico.Close;
  tblBlchistorico.params[0].value:=tblBalanceCteCxcCODIGO.Value;
  tblBlchistorico.Open;
end;

procedure TfrmAuditoriaBlcCxc.BitBtn4Click(Sender: TObject);
begin
  GlbSalvarQuery(tblBlchistorico);
  GlbSalvarQuery(tblReciboBlcxc);
end;

procedure TfrmAuditoriaBlcCxc.BitBtn6Click(Sender: TObject);
begin
  frmAplicarDbCrCxc:=TfrmAplicarDbCrCxc.Create(nil);
  try
    frmAplicarDbCrCxc.rxData.Insert;
    frmAplicarDbCrCxc.rxDataFecha.Value:=tblVentasMastFECHA.Value;
    frmAplicarDbCrCxc.rxDataNumeroDoc.Value:=9999;//cambiar
    frmAplicarDbCrCxc.rxDataMoneda.Value:='1';
    frmAplicarDbCrCxc.rxDataTipo_tranf.Value:=2;
    frmAplicarDbCrCxc.rxDataCodigoCliente.Value:=rxtblclientesCodigoPropietario.Value;

    frmAplicarDbCrCxc.ShowModal;
  finally
  frmAplicarDbCrCxc.Free;
  frmAplicarDbCrCxc:=Nil;
  end;
end;

procedure TfrmAuditoriaBlcCxc.TabSheet1Enter(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmAuditoriaBlcCxc.BitBtn7Click(Sender: TObject);
var
  LastDateOfMonth, FirstDateOfMonth: TDateTime;
  TotalBalance: Double;
begin
  dmCxc.qryDatosblccxc.First;
  ProgressBar1.Max := dmCxc.qryDatosblccxc.RecordCount;
  ProgressBar1.Visible := True;

  while Not dmCxc.qryDatosblccxc.Eof do
  begin
    dmCxc.qryDatosblccxc.Next;
    ProgressBar1.StepIt;
  end;
  BitBtn5Click(Self);  
end;


procedure TfrmAuditoriaBlcCxc.BitBtn8Click(Sender: TObject);
var
  a,m,d : Word;              
  codCte:Integer;
  xImp : Boolean;
  fecha : string;
begin
  GlbBalanceAnt := 0;
  xImp := False;
  codCte :=rxtblclientesCodigoPropietario.Value;
  tblReciboBlcxc.Close;
  tblReciboBlcxc.Params[0].Value:= codCte;
  tblReciboBlcxc.Open;

  fctIngresos.Close;
  fctIngresos.Params[0].Value:= codCte;
  fctIngresos.Open;

  qryFechaIniBlc.Close;
  qryFechaIniBlc.params[0].value:= codCte;
  qryFechaIniBlc.open;

  dmcxc.stpFechaIniBceHist.Params[4].Value:= codCte;//codigo_cte_in
  dmcxc.stpFechaIniBceHist.Params[5].Value:= GlbFechaTrnDiaria;//fecha_in
  if (GlbMonedaBase > 0) then
     dmcxc.stpFechaIniBceHist.Params[6].Value:= IntToStr(GlbMonedaBase)
  else
  dmcxc.stpFechaIniBceHist.Params[6].Value:= '1';

  dmcxc.stpFechaIniBceHist.ExecProc;

  frmSelFecha :=TfrmSelFecha.Create(Nil);
  try
    if not qryFechaIniBlcFECHAMIN.IsNull then
    begin
      frmSelFecha.FechaIni.Date := qryFechaIniBlcFECHAMIN.Value;
      frmSelFecha.FechaFin.Date := qryFechaIniBlcFECHAMAX.Value;
    end else
    begin
     if not dmcxc.stpFechaIniBceHist.Params[2].IsNull then
     begin
        if (dmcxc.stpFechaIniBceHist.Params[2].Value < GlbFechaTrnDiaria) then
        frmSelFecha.FechaIni.Date := dmcxc.stpFechaIniBceHist.Params[2].Value
        else
        begin
          frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;
        end;
     end
     else
     frmSelFecha.FechaIni.Date := GlbFechaTrnDiaria;

     if (dmcxc.stpFechaIniBceHist.Params[2].Value > GlbFechaTrnDiaria) then
     frmSelFecha.FechaFin.Date := dmcxc.stpFechaIniBceHist.Params[2].Value
     else
     frmSelFecha.FechaFin.Date := GlbFechaTrnDiaria;
   end;
    if frmSelFecha.Showmodal = mrOk then
    begin
      GlbFechaInicial := ExtraerFecha(frmSelFecha.FechaIni.Date); //ExtraerFecha(ibsqlFechaMinPrestActivo.FieldByName('fmin').AsDateTime);
      GlbFechaFinal   := ExtraerFecha(frmSelFecha.FechaFin.Date);
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha := Nil;
  end;

  dmCxc.qryDatosblccxc.Close;
  dmCxc.qryDatosblccxc.params[0].value:=ExtraerFecha(GlbFechaInicial);
  dmCxc.qryDatosblccxc.params[1].value:=ExtraerFecha(GlbFechaFinal);

  dmCxc.qryDatosblccxc.params[2].value:= rxtblclientesCodigoPropietario.Value;
  dmCxc.qryDatosblccxc.open;
              
  dmCxc.qryDatosblccxc.Last;
  dmCxc.qryDatosblccxc.First;
  {
  DecodeDate(GlbFechaInicial,a,m,d);
  if (m = 1) and (d = 1 ) then
  begin
    M:=12;
    Dec(a);
  end;
  if (d = 1) then
  begin
    Dec(m);
    d:=DiasEnElMes(a,m)
  end else Dec(d);

  dmCxc.qrybceHistCte.Close;
  dmCxc.qrybceHistCte.Params[0].Value:= 0;//historico
  if (not dmcxc.stpFechaIniBceHist.Params[0].IsNull) then
  begin
    dmCxc.qrybceHistCte.params[1].Value:= dmcxc.stpFechaIniBceHist.Params[0].Value;//EncodeDate(a,m,d);
    dmCxc.qrybceHistCte.Params[2].Value:= dmcxc.stpFechaIniBceHist.Params[0].Value;//EncodeDate(a,m,d);
  end else
  begin
    dmCxc.qrybceHistCte.params[1].Value:= EncodeDate(a,m,d);
    dmCxc.qrybceHistCte.Params[2].Value:= EncodeDate(a,m,d);
  end;
  dmCxc.qrybceHistCte.Params[3].Value:= '1';
  dmCxc.qrybceHistCte.Params[4].Value:= CodCte;
  dmCxc.qrybceHistCte.Params[5].Value:= CodCte;
  dmCxc.qrybceHistCte.Open;

  dmCxc.qryRepServ.Close;

  dmCxc.qryRepServ.Params[0].Value := ExtraerFecha(GlbFechaInicial);
  dmCxc.qryRepServ.Params[1].Value := ExtraerFecha(GlbFechaFinal); //ExtraerFecha(GlbFechaFinal);
  dmCxc.qryRepServ.Params[2].Value := CodCte;
  dmCxc.qryRepServ.Open;

  dmCxc.qryRepServ.RecordCount;
        
  //usar siguiente query para estado general de cxc
  dmCxc.qrySQLBlceAntCxcCte.Close;
  if not dmCxc.qrySQLBlceAntCxcCte.Prepared then
  dmCxc.qrySQLBlceAntCxcCte.Prepare;
  dmCxc.qrySQLBlceAntCxcCte.Params[0].Value:= CodCte; //codigoclienteini
  dmCxc.qrySQLBlceAntCxcCte.Params[1].Value:= CodCte; //codigoclientefin
  dmCxc.qrySQLBlceAntCxcCte.Params[2].Value:= ExtraerFecha(GlbUltimoDiaMesAnt(GlbFechaInicial)+1); //FechaIni
  dmCxc.qrySQLBlceAntCxcCte.Params[3].Value:= ExtraerFecha(GlbFechaInicial-1); //FechaFin
  dmCxc.qrySQLBlceAntCxcCte.Params[4].Value:= '1'; //Moneda
  dmCxc.qrySQLBlceAntCxcCte.Params[5].Value:= GlbUltimoDiaMesAnt(GlbFechaInicial); //fecha_blc_Anterior
  dmCxc.qrySQLBlceAntCxcCte.ExecQuery;

  if dmCxc.qrySQLBlceAntCxcCte.Open then
  begin
    GlbBalanceAnt:=dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('BALANCE_ANT').AsFloat +
                   dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('DEBITO').AsFloat +
                   dmCxc.qrySQLBlceAntCxcCte.Fieldbyname('CREDITO').AsFloat;
  end;
  }

end;

procedure TfrmAuditoriaBlcCxc.TabSheet1Resize(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmAuditoriaBlcCxc.RxDBGrid5Enter(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmAuditoriaBlcCxc.PageControl1Enter(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmAuditoriaBlcCxc.tblTranscxcAfterScroll(DataSet: TDataSet);
begin
  if tblReciboBlcxc.State = dsInactive then
  begin
    tblReciboBlcxc.Close;
    tblReciboBlcxc.Params[0].Value:= qryClienteCODIGO_CTE.Value;
    tblReciboBlcxc.Open;

    fctIngresos.Close;
    fctIngresos.Params[0].Value:= qryClienteCODIGO_CTE.Value;
    fctIngresos.Open;

  end;
  if tblTranscxcTIPO_DOC.Value = 2 then
  begin
    tblReciboBlcxc.Locate('NUMERO_RECIBO',tblTranscxcNUMERO_DOC.Value,[]);
    fctIngresos.Locate('NUMERO',tblTranscxcNUMERO_RECIBO.Value,[]);
  end else
  fctIngresos.Locate('NUMERO_FACT',tblTranscxcNUMERO_DOC.Value,[]);
end;

procedure TfrmAuditoriaBlcCxc.tblFacturaPendienteAfterOpen(
  DataSet: TDataSet);
  var montoBlc:Currency;
begin
  tblFacturaPendiente.DisableControls;
  tblFacturaPendiente.First;
  montoBlc:=0;
  while not tblFacturaPendiente.eof do
  begin
    montoBlc:=montoBlc + tblFacturaPendienteMONTO_PENDIENTE.Value;
    tblFacturaPendiente.Next;
  end;
  lblBlcPendiente.Caption:= InsertarComa(FloatToStr(montoBlc));
  tblFacturaPendiente.First;                     
  tblFacturaPendiente.EnableControls;
end;

end.
