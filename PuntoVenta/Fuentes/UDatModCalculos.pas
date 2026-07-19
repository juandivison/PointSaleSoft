unit UDatModCalculos;

interface

uses
  SysUtils, Classes, DB, RxMemDS, IBSQL, IBCustomDataSet, Variants, IBQuery,
  IBStoredProc;

type
  TdmCalculos = class(TDataModule)
    ibsqlGetPorcDescFctSvr: TIBSQL;
    rxError: TRxMemoryData;
    rxErrorcont: TAutoIncField;
    rxErrornota: TStringField;
    qryPosExtraDet: TIBDataSet;
    qryPosExtraDetSERIE: TIntegerField;
    qryPosExtraDetNUMERO: TIntegerField;
    qryPosExtraDetFECHA: TDateTimeField;
    qryPosExtraDetD_MONEDA: TIBStringField;
    qryPosExtraDetD_TIPO_VENTA: TIntegerField;
    qryPosExtraDetD_CODIGO_PROD: TIntegerField;
    qryPosExtraDetD_CANT: TFloatField;
    qryPosExtraDetD_PRECIO: TFloatField;                    
    qryPosExtraDetD_TASA_ITBIS: TFloatField;
    qryPosExtraDetD_PORCDESCITEM: TFloatField;
    qryPosExtraDetT_PORCDESADICIONAL: TFloatField;
    qryPosExtraDetT_RECARGO: TFloatField;
    qryPosExtraDetT_PROPINA: TFloatField;
    qryPosExtraDetT_MONTOINTERES: TFloatField;
    qryPosExtraDetT_MONTONCRAPLICADO: TFloatField;
    qryPosExtraDetT_DEVOLUCION: TFloatField;
    qryPosExtraDetTC_TOTALNETO: TFloatField;
    qryPosExtraDetTC_ITBIS: TFloatField;
    qryPosExtraDetCOD_USUARIO: TIntegerField;
    qryConsultaPosExtraDet: TIBQuery;
    ibSqlDeletePosExtraDET: TIBSQL;
    qryPosExtraDetD_TIPO_UNIDAD: TIntegerField;
    qryConsultaPosExtraDetSERIE: TIntegerField;
    qryConsultaPosExtraDetNUMERO: TIntegerField;
    qryConsultaPosExtraDetCOD_USUARIO: TIntegerField;
    qryConsultaPosExtraDetFECHA: TDateTimeField;
    qryConsultaPosExtraDetD_MONEDA: TIBStringField;
    qryConsultaPosExtraDetD_TIPO_VENTA: TIntegerField;
    qryConsultaPosExtraDetD_CODIGO_PROD: TIntegerField;
    qryConsultaPosExtraDetD_CANT: TFloatField;
    qryConsultaPosExtraDetD_PRECIO: TFloatField;
    qryConsultaPosExtraDetD_TASA_ITBIS: TFloatField;
    qryConsultaPosExtraDetD_PORCDESCITEM: TFloatField;
    qryConsultaPosExtraDetT_PORCDESADICIONAL: TFloatField;
    qryConsultaPosExtraDetT_RECARGO: TFloatField;
    qryConsultaPosExtraDetT_PROPINA: TFloatField;
    qryConsultaPosExtraDetT_MONTOINTERES: TFloatField;
    qryConsultaPosExtraDetT_MONTONCRAPLICADO: TFloatField;
    qryConsultaPosExtraDetT_DEVOLUCION: TFloatField;
    qryConsultaPosExtraDetTC_TOTALNETO: TFloatField;
    qryConsultaPosExtraDetDC_MONTOBRUTO: TFloatField;
    qryConsultaPosExtraDetDC_MONTODESCITEM: TFloatField;
    qryConsultaPosExtraDetDC_PORCPROPLEGAL: TFloatField;
    qryConsultaPosExtraDetTC_MONTODESCGLOBAL: TFloatField;
    qryConsultaPosExtraDetDC_PROPINALEGAL: TFloatField;
    qryConsultaPosExtraDetDC_ESDESITEM: TIntegerField;
    qryConsultaPosExtraDetTC_SUBTOTAL: TFloatField;
    qryConsultaPosExtraDetTC_MONTODESCADICIONAL: TFloatField;
    qryConsultaPosExtraDetTC_MONTODESCITEMS: TFloatField;
    qryConsultaPosExtraDetTC_FMONTODESCNIVELITEM: TFloatField;
    qryConsultaPosExtraDetTC_MONTOITBISRECARGO_ITM: TFloatField;
    qryConsultaPosExtraDetTC_MONTOITBISRECARGO_GLB: TFloatField;
    qryConsultaPosExtraDetD_TIPO_UNIDAD: TIntegerField;
    qryPosExtraDetCODTEXTO: TIBStringField;
    qryConsultaPosExtraDetCODTEXTO: TIBStringField;
    qryConsultaPosExtraDetTOTAL_ITBIS: TFloatField;
    ibstpProcPosUpdTExtDet: TIBStoredProc;
    ibSqlDelCurrrentRPosExtraDET: TIBSQL;
    qryCheckVtaExtExiste: TIBQuery;
    qryPosExtraDetFECHA_COTIZA: TDateTimeField;
    qryPosExtraDetNUMERO_COTIZA: TIntegerField;
    qryConsultaPosExtraDetFECHA_COTIZA: TDateTimeField;
    qryConsultaPosExtraDetNUMERO_COTIZA: TIntegerField;
    ibstpproc_InseCotiVtaExtraDetDiscontinue: TIBStoredProc;
    ibstpproc_InseCotiVtaExtraDet: TIBQuery;
    qryConsultaPosExtraDetTC_ITBIS2: TFloatField;
    qryConsultaPosExtraDetD_TRANSPITBIS: TSmallintField;
    qryPosExtraDetD_TRANSPITBIS: TSmallintField;
    qryPosExtRrdDesc: TIBQuery;
    qryPosExtRrdDescSERIE: TIntegerField;
    qryPosExtRrdDescNUMERO: TIntegerField;
    qryPosExtRrdDescD_PORCDESCITEM: TFloatField;
    qryConsultaPosExtraDetDC_ITBIS_CLD: TFloatField;
    qryDatosItbPosExtra: TIBQuery;
    qryDatosItbPosExtraSERIE: TIntegerField;
    qryDatosItbPosExtraDC_ITBIS_CLD: TFloatField;
    qryDatosItbPosExtraTC_MONTOITBISRECARGO_GLB: TFloatField;
    qryDatosItbPosExtraTC_MONTOITBISRECARGO_ITM: TFloatField;
    qryConsultaPosExtraDetDC_ITBIS: TFloatField;
    qryPosExtraDetID: TFloatField;
    qryDatosCotiPosExtra: TIBQuery;
    qryDatosCotiPosExtraSERIE: TIntegerField;
    qryDatosCotiPosExtraNUMERO: TIntegerField;
    qryDatosCotiPosExtraCOD_USUARIO: TIntegerField;
    qryDatosCotiPosExtraFECHA: TDateTimeField;
    qryDatosCotiPosExtraTOTAL_ITBIS: TFloatField;
    qryDatosCotiPosExtraD_MONEDA: TIBStringField;
    qryDatosCotiPosExtraD_TIPO_VENTA: TSmallintField;
    qryDatosCotiPosExtraD_CODIGO_PROD: TIntegerField;
    qryDatosCotiPosExtraD_CANT: TFloatField;
    qryDatosCotiPosExtraD_PRECIO: TFloatField;
    qryDatosCotiPosExtraD_TASA_ITBIS: TFloatField;
    qryDatosCotiPosExtraD_PORCDESCITEM: TFloatField;
    qryDatosCotiPosExtraT_PORCDESADICIONAL: TFloatField;
    qryDatosCotiPosExtraT_RECARGO: TFloatField;
    qryDatosCotiPosExtraT_PROPINA: TFloatField;
    qryDatosCotiPosExtraT_MONTOINTERES: TFloatField;
    qryDatosCotiPosExtraT_MONTONCRAPLICADO: TFloatField;
    qryDatosCotiPosExtraT_DEVOLUCION: TFloatField;
    qryDatosCotiPosExtraTC_TOTALNETO: TFloatField;
    qryDatosCotiPosExtraTC_ITBIS: TFloatField;
    qryDatosCotiPosExtraD_TIPO_UNIDAD: TSmallintField;
    qryDatosCotiPosExtraCODTEXTO: TIBStringField;
    qryDatosCotiPosExtraDC_MONTOBRUTO: TFloatField;
    qryDatosCotiPosExtraDC_MONTODESCITEM: TFloatField;
    qryDatosCotiPosExtraDC_ITBIS_CLD: TFloatField;
    qryDatosCotiPosExtraDC_ITBIS: TFloatField;
    qryDatosCotiPosExtraDC_PORCPROPLEGAL: TFloatField;
    qryDatosCotiPosExtraTC_MONTODESCGLOBAL: TFloatField;
    qryDatosCotiPosExtraDC_PROPINALEGAL: TFloatField;
    qryDatosCotiPosExtraDC_ESDESITEM: TSmallintField;
    qryDatosCotiPosExtraTC_SUBTOTAL: TFloatField;
    qryDatosCotiPosExtraTC_MONTODESCITEMS: TFloatField;
    qryDatosCotiPosExtraTC_FMONTODESCNIVELITEM: TFloatField;
    qryDatosCotiPosExtraTC_MONTOITBISRECARGO_ITM: TFloatField;
    qryDatosCotiPosExtraTC_MONTOITBISRECARGO_GLB: TFloatField;
    qryDatosCotiPosExtraTC_MONTODESCADICIONAL: TFloatField;
    qryDatosCotiPosExtraNUMERO_COTIZA: TIntegerField;
    qryDatosCotiPosExtraFECHA_COTIZA: TDateTimeField;
    qryDatosCotiPosExtraD_TRANSPITBIS: TSmallintField;
    qryCheckGlbNumPos: TIBQuery;
    qryDatosCotiPosExtraDESCRIPCION_ESPECIAL: TMemoField;
    qryValorVta: TIBQuery;
    qryValorVtaMONTOBRUTO: TFloatField;
    qryGetSumVtaExtra: TIBQuery;
    qryGetSumVtaExtraNUMERO: TIntegerField;
    qryGetSumVtaExtraDC_MONTOBRUTO: TFloatField;
    qryGetSumVtaExtraD_TASA_ITBIS: TFloatField;
    qryGetSumVtaExtraT_PROPINA: TFloatField;
    qryGetSumVtaExtraT_MONTOINTERES: TFloatField;
    qryGetSumVtaExtraT_MONTONCRAPLICADO: TFloatField;
    qryGetSumVtaExtraTC_ITBIS: TFloatField;
    qryGetSumVtaExtraDC_MONTODESCITEM: TFloatField;
    qryGetSumVtaExtraTC_MONTODESCGLOBAL: TFloatField;
    qryGetSumVtaExtraTC_MONTODESCITEMS: TFloatField;
    qryGetSumVtaExtraTC_FMONTODESCNIVELITEM: TFloatField;
    qryGetSumVtaExtraTC_SUBTOTAL: TFloatField;
    qryGetSumVtaExtraTC_MONTODESCADICIONAL: TFloatField;
    qryGetSumVtaExtraDC_PROPINALEGAL: TFloatField;
    qryGetSumVtaExtraDC_ITBIS_CLD: TFloatField;
    qryGetSumVtaExtraTC_MONTOITBISRECARGO_GLB: TFloatField;
    qryGetSumVtaExtraTC_MONTOITBISRECARGO_ITM: TFloatField;
    qryGetSumVtaExtraT_RECARGO: TFloatField;
    qryGetSumVtaExtraTOTAL_ITBIS: TFloatField;
    stpproc_InsUpdVtaSum: TIBStoredProc;
    ibSQLCancelaVta: TIBSQL;
    qryVentas: TIBQuery;
    qryVentasDEt: TIBQuery;
    qryVentasNOMBRE_FACTURAR: TIBStringField;
    qryVentasNUMERO_NCF: TIBStringField;
    qryVentasFECHA: TDateTimeField;
    qryVentasNUMERO: TIntegerField;
    qryVentasCODIGO_CTE: TIntegerField;
    qryVentasMONTO_PAGADO: TFloatField;
    qryVentasVALOR_TOTAL_DET: TFloatField;
    qryVentasMONTO_TOTAL_ITBIS: TFloatField;
    qryVentasSTATUS: TIBStringField;
    qryVentasDEtSERIE: TIntegerField;
    qryVentasDEtNUMERO: TIntegerField;
    qryVentasDEtCODIGO_PROD: TIBStringField;
    qryVentasDEtCODIGO_BARRA: TIBStringField;
    qryVentasDEtDESCRIPCION: TIBStringField;
    qryVentasDEtCANTIDAD: TFloatField;
    qryVentasDEtPRECIO: TFloatField;
    qryVentasDEtPORC_DESC_DET: TFloatField;
    qryVentasDEtITBI_DET: TFloatField;
    qryVentasDEtVALOR_SERVICIO_DET: TFloatField;
    qryVentasDEtVALOR_TOTAL_DET: TFloatField;
    qryVentasDEtNUM_FACTURA: TFloatField;
    qryVentasDEtSTATUS_DET: TIBStringField;
    qryVentasDEtFECHA_IN: TDateTimeField;
    qryVentasDEtIN_POR: TIBStringField;
    qryVentasDEtFECHA_MOD: TDateTimeField;
    qryVentasDEtMOD_POR: TIBStringField;
    qryVentasDEtCANT_REGRESO: TFloatField;
    qryVentasDEtCANT_PROMO: TFloatField;
    qryVentasDEtMONTO_DIETA: TFloatField;
    qryVentasDEtMONTO_AJUSTE: TFloatField;
    qryVentasDEtSERIE_PROD: TIBStringField;
    qryVentasDEtSTATUS_CNT: TIBStringField;
    qryVentasDEtTIPO_UNIDAD: TIntegerField;
    qryVentasDEtITBIS_EXENTO: TSmallintField;
    qryVentasDEtTIPO_VENTA: TSmallintField;
    qryVentasDEtDESCRIPCIONPRODUCTO: TMemoField;
    qryVentasDEtCOD_EMPLEADO_CONDUCTOR: TFloatField;
    qryVentasDEtPLACA_VEHICULO: TIBStringField;
    qryVentasDEtMONEDA: TIBStringField;
    qryVentasDEtMONTO_TASA: TFloatField;
    qryVentasDEtCAPACIDAD: TFloatField;
    qryVentasDEtCANT_VIAJES: TFloatField;
    qryVentasDEtCANT_METROS_CUBICO: TFloatField;
    qryVentasDEtFICHA_VEH: TIntegerField;
    qryVentasDEtIDZONA_ORIGEN: TIntegerField;
    qryVentasDEtIDZONA_DETALLE: TIntegerField;
    qryVentasDEtPRECIO_COMPRA: TFloatField;
    qryVentasDEtCANT_CONDUCE: TFloatField;
    qryVentasDEtPORC_DESC_ITEM: TFloatField;
    qryVentasDEtMONTO_DESC_ITEM: TFloatField;
    qryVentasDEtITBIS_FISCAL_DET: TFloatField;
    qryVentasDEtIDTASAITBIS: TFloatField;
    qryVentasDEtMONTOIBISRECARGO: TFloatField;
    qryVentasDEtDC_ITBIS_CLD: TFloatField;
    qryVentasDEtTC_MONTOITBISRECARGO_GLB: TFloatField;
    qryVentasDEtTC_MONTOITBISRECARGO_ITM: TFloatField;
    qryPosExtraSum: TIBQuery;
    qryPosExtraSumNUMERO: TIntegerField;
    qryPosExtraSumDC_MONTOBRUTO: TFloatField;
    qryPosExtraSumD_TASA_ITBIS: TFloatField;
    qryPosExtraSumD_PORCDESCITEM: TFloatField;
    qryPosExtraSumT_PORCDESADICIONAL: TFloatField;
    qryPosExtraSumT_RECARGO: TFloatField;
    qryPosExtraSumT_PROPINA: TFloatField;
    qryPosExtraSumT_MONTOINTERES: TFloatField;
    qryPosExtraSumT_MONTONCRAPLICADO: TFloatField;
    qryPosExtraSumT_DEVOLUCION: TFloatField;
    qryPosExtraSumTC_TOTALNETO: TFloatField;
    qryPosExtraSumTC_ITBIS: TFloatField;
    qryPosExtraSumD_TRANSPITBIS: TSmallintField;
    qryPosExtraSumDC_MONTODESCITEM: TFloatField;
    qryPosExtraSumDC_PORCPROPLEGAL: TFloatField;
    qryPosExtraSumTC_MONTODESCGLOBAL: TFloatField;
    qryPosExtraSumDC_ESDESITEM: TIntegerField;
    qryPosExtraSumTC_MONTODESCITEMS: TFloatField;
    qryPosExtraSumTC_FMONTODESCNIVELITEM: TFloatField;
    qryPosExtraSumTC_SUBTOTAL: TFloatField;
    qryPosExtraSumTC_MONTODESCADICIONAL: TFloatField;
    qryPosExtraSumDC_PROPINALEGAL: TFloatField;
    qryPosExtraSumDC_ITBIS_CLD: TFloatField;
    qryPosExtraSumTC_MONTOITBISRECARGO_GLB: TFloatField;
    qryPosExtraSumTC_MONTOITBISRECARGO_ITM: TFloatField;
    qryGetTotalItbis: TIBQuery;
    qryGetTotalItbisT_RECARGO: TFloatField;
    qryGetTotalItbisSUBTOTALITBIS: TFloatField;
    qryGetTotalItbisITBIS_TOTAL: TFloatField;
    ibSqlUpdateVtaMast: TIBSQL;
    ibSqlUpdateVtaMastCotiza: TIBSQL;
    qryAplicaOferta: TIBQuery;
    qryAplicaOfertaCANTIDAD: TFloatField;
    qryAplicaOfertaTIPO_UNIDADOFTA: TIntegerField;
    qryAplicaOfertaCANT_TIPO_UNIDAD: TIntegerField;
    qryVentasDEtLEVEL_PRECIO_VENTA: TSmallintField;
    qryDatosCotiPosExtraLEVEL_PRECIO_VENT: TSmallintField;
    qryConsultaPosExtraDetLEVEL_PRECIO_VENT: TSmallintField;
    qryPosExtraDetLEVEL_PRECIO_VENT: TSmallintField;
    qryVerCotiConVta: TIBQuery;
    qryVerCotiConVtaNUMERO_TRN: TIntegerField;
    qryVerCotiConVtaNUMERO: TIntegerField;
    qryVerCotiConVtaFECHA: TDateTimeField;
    qryVerCotiConVtaSTATUS: TIBStringField;
    qryPosExtraSumTOTAL_ITBIS: TFloatField;
    ibstpproc_InseCotiVtaExtraDetSERIE: TIntegerField;
    ibstpproc_InseCotiVtaExtraDetNUMERO: TIntegerField;
    ibstpproc_InseCotiVtaExtraDetCODIGO_PROD: TIBStringField;
    ibstpproc_InseCotiVtaExtraDetDESCRIPCION: TIBStringField;
    ibstpproc_InseCotiVtaExtraDetCANTIDAD: TFloatField;
    ibstpproc_InseCotiVtaExtraDetPRECIO: TFloatField;
    ibstpproc_InseCotiVtaExtraDetPORC_DESC_DET: TFloatField;
    ibstpproc_InseCotiVtaExtraDetITBI_DET: TFloatField;
    ibstpproc_InseCotiVtaExtraDetVALOR_SERVICIO_DET: TFloatField;
    ibstpproc_InseCotiVtaExtraDetVALOR_TOTAL_DET: TFloatField;
    ibstpproc_InseCotiVtaExtraDetITBIS_EXENTO: TSmallintField;
    ibstpproc_InseCotiVtaExtraDetTIPO_VENTA: TSmallintField;
    ibstpproc_InseCotiVtaExtraDetPORC_DESC_ITEM: TFloatField;
    ibstpproc_InseCotiVtaExtraDetMONEDA: TIBStringField;
    ibstpproc_InseCotiVtaExtraDetMONTO_TASA: TFloatField;
    ibstpproc_InseCotiVtaExtraDetIDTASAITBIS: TFloatField;
    ibstpproc_InseCotiVtaExtraDetTIPO_UNIDAD: TSmallintField;
    ibstpproc_InseCotiVtaExtraDetMONTO_DESC_ITEM: TFloatField;
    ibstpproc_InseCotiVtaExtraDetLPORC_DESADICIONAL: TFloatField;
    ibstpproc_InseCotiVtaExtraDetLMONTO_RECARGO: TFloatField;
    ibstpproc_InseCotiVtaExtraDetLPROPINALEGAL: TFloatField;
    ibstpproc_InseCotiVtaExtraDetLPROPINA: TFloatField;
    ibstpproc_InseCotiVtaExtraDetNUMERO_COTIZA: TIntegerField;
    ibstpproc_InseCotiVtaExtraDetFECHA_COTIZA: TDateTimeField;
    ibstpproc_InseCotiVtaExtraDetTRANSPITBIS: TSmallintField;
    ibstpproc_InseCotiVtaExtraDetLEVEL_PRECIO_VENT: TSmallintField;
    ibstpproc_InseCotiVtaExtraDetCODTEXTO: TIBStringField;
    ibSqlUpdGlobalPosExtraDet: TIBSQL;
    qryConsultaPosExtraDetDC_MONTONETO: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure Totales_xxxAfterPost(DataSet: TDataSet);
    procedure qryPosExtraDetBeforePost(DataSet: TDataSet);
    procedure qryConsultaPosExtraDetAfterOpen(DataSet: TDataSet);
    procedure qryGetSumVtaExtraAfterOpen(DataSet: TDataSet);
    procedure qryGetSumVtaExtraBeforeOpen(DataSet: TDataSet);
    procedure qryVentasAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    FProcesandoCalculos: Boolean;
    FRecalculoPendiente: Boolean;
    FCambioGlobalPendiente: Boolean;
    function TieneDistribucionGlobalActiva: Boolean;
  public
    { Public declarations }
    serierxVenta : integer;
    EsBorrandoRecord : Boolean;
    CheckBox2Checked : Boolean;
    chKDescuentoGlobalChecked: Boolean;
    chkExentoChecked : Boolean;
    rdgFactServicioChecked : Boolean;
    CheckBox3Checked : Boolean;
    EsFactura : Boolean;
    EsFinanciamiento : Boolean;
    CheckBox4Checked : Boolean;
    xCodigoPropietario : Integer;
    esFeedback : Boolean;
    esFeedbackExtra : Boolean;
    FMontoDescNivelItem : Currency;
    CalcPropinaLegal : Boolean;
    datosCargados : Boolean;
    datosSetDataDone : Boolean;
    avoidLoop : Boolean;
    avoidLoopExtra : boolean;
    EsProcCalc    : Boolean;
    tmpValorTotal, tmpValorItbis : Currency;
    datCambio : boolean;
    procedure MarcarCambioGlobal;
    function GetNivelPrecioXUnidad(ACodProd: Integer;IDUNI: Integer;
                                    APrecio: Double;
                                    ATolerancia: Double = 0.01): Integer;
    procedure ProcesarSumaTotal;
    procedure CalcularDescIndirecto;
    procedure SetMontoNotaCredito;
    procedure LoadDataVenta(var rxVentaSource: TRxMemoryData);
    procedure LoadTotalVenta(var rxTotalSource:TRxMemoryData);

    procedure ProcesaCalculos;

    procedure SetDataVenta(var rxVentaTarget: TRxMemoryData);
    procedure SetTotalVenta(var rxTotalTarget:TRxMemoryData);
    function GettotalMontoDescuentoItem : Currency;

    procedure ProcInsertUpdatePosExtraDet(numstr:integer);
    procedure ProcDeletePosExtraDet(numstr:integer);
    procedure ProcDelRecPosExtraDet(serietrn: integer);
    procedure RecalcularDespuesDeEliminar(ANumero: Integer);
    procedure Pos_UpdateTotales(numstr:integer);
    function VtaExiste(num:integer;serie:integer;coduser:integer) : Boolean;
    function VtaExisteExtra(num:integer;serie:integer;coduser:integer) : Boolean;
    function GlbNumPosExiste(num:integer):Boolean;
    procedure ProcSetPorcDescValor(numstr:integer);
    procedure NotificaErrorByEmail(sms:string);
    procedure LogProcedureCalc(const ProcName: string);
    procedure RefrescarLineaActualDesdePosExtraDet;
    procedure ProcesaCalculosVentaCompleta;
    procedure ActualizarPosExtraSum(numstr: Integer);
    procedure RefrescarTodasLineasDesdePosExtraDet;
    procedure ActualizarValoresGlobalesPosExtraDet(numstr: Integer);
  end;

var
  dmCalculos: TdmCalculos;

implementation
    uses uglobal, UDatModFactura, UDatmodDatosGenerales, UProcVentaRapida,
  UFormDatosCotiza, UDatModConectar, UDatModInventario, UFormLog,
  UDatModCompania;
{$R *.dfm}

function FieldCurrValue(AField: TField): Currency;
begin
  if Assigned(AField) and (not AField.IsNull) then
    Result := AField.AsCurrency
  else
    Result := 0;
end;

procedure SetParamIfExists(AParams: TParams; const AName: string; const AValue: Variant);
var
  P: TParam;
begin
  P := AParams.FindParam(AName);
  if Assigned(P) then
    P.Value := AValue;
end;

function FieldExists(ADataSet: TDataSet; const AFieldName: string): Boolean;
begin
  Result := Assigned(ADataSet) and Assigned(ADataSet.FindField(AFieldName));
end;

function GetFieldCurr(ADataSet: TDataSet; const AFieldName: string; ADefault: Currency): Currency;
var
  F: TField;
begin
  Result := ADefault;

  if not Assigned(ADataSet) then
    Exit;

  F := ADataSet.FindField(AFieldName);

  if Assigned(F) and (not F.IsNull) then
    Result := F.AsCurrency;
end;

function DsFieldCurr(ADS: TDataSet; const AField: string; ADefault: Currency): Currency;
var
  F: TField;
begin
  Result := ADefault;

  if not Assigned(ADS) then Exit;

  F := ADS.FindField(AField);
  if Assigned(F) and (not F.IsNull) then
    Result := F.AsCurrency;
end;

function DsFieldInt(ADS: TDataSet; const AField: string; ADefault: Integer): Integer;
var
  F: TField;
begin
  Result := ADefault;

  if not Assigned(ADS) then Exit;

  F := ADS.FindField(AField);
  if Assigned(F) and (not F.IsNull) then
    Result := F.AsInteger;
end;

function DsFieldStr(ADS: TDataSet; const AField: string; const ADefault: string): string;
var
  F: TField;
begin
  Result := ADefault;

  if not Assigned(ADS) then Exit;

  F := ADS.FindField(AField);
  if Assigned(F) and (not F.IsNull) then
    Result := F.AsString;
end;
procedure TdmCalculos.LogProcedureCalc(const ProcName: string);
var
  F: TextFile;
begin
  if GlbEsDebugFiscal = 1 then exit;
  
  try  AssignFile(F, 'C:\temp\erp\ventas_eventos.txt');
  if not FileExists('C:\temp\erp\ventas_eventos..txt') then
    Rewrite(F)
  else
    Append(F);
  Writeln(F, DateTimeToStr(Now) + ' - ' + ProcName);
  CloseFile(F);
  except
  end;
end;


/// <summary>
///   Devuelve 1, 2, 3 o 4 si el precio indicado coincide (±Tol)
///   con PRECIOVENTA1…4 del producto; si no coincide, devuelve 5.
/// </summary>
/// <param name="ACodProd">Código del producto</param>
/// <param name="APrecio">Precio digitado por el usuario</param>
/// <param name="ATolerancia">Tolerancia en unidades monetarias; ej. 0.01</param>
function TdmCalculos.GetNivelPrecioXUnidad(ACodProd: Integer;IDUNI: Integer;
                                    APrecio: Double;
                                    ATolerancia: Double = 0.01): Integer;
var
  qryNivelPrecio : TIBQuery;
begin
  Result := 5;                                   // valor por defecto
  qryNivelPrecio:=TIBQuery.Create(nil);
  with qryNivelPrecio do
  begin
    Database:= dmConectar.IBDatabase1;
    Sql.Clear;

    Close;
    SQL.Text :=
      'select first 1 '+
      '  case '+
      '    when abs(:PRE - PRECIOVENTA1) < :TOL then 1 '+
      '    when abs(:PRE - PRECIOVENTA2) < :TOL then 2 '+
      '    when abs(:PRE - PRECIOVENTA3) < :TOL then 3 '+
      '    when abs(:PRE - PRECIOVENTA4) < :TOL then 4 '+
      '    else 5 '+
      '  end as NIVEL '+
      'from   PRECIO_UNIDADSURTIDORA '+
      'where  COD_PRODUCTO = :COD '+
      '  And  idunidad = :IDUN '+
      '  and  (  abs(:PRE - PRECIOVENTA1) < :TOL '+
      '      or abs(:PRE - PRECIOVENTA2) < :TOL '+
      '      or abs(:PRE - PRECIOVENTA3) < :TOL '+
      '      or abs(:PRE - PRECIOVENTA4) < :TOL )';
    ParamByName('IDUN').AsInteger := IDUNI;
    ParamByName('COD').AsInteger := ACodProd;
    ParamByName('PRE').AsFloat   := APrecio;
    ParamByName('TOL').AsFloat   := ATolerancia;
    Open;

    if not IsEmpty then
      Result := FieldByName('NIVEL').AsInteger;  // 1-4 según coincidencia
  end;
end;


procedure TdmCalculos.CalcularDescIndirecto;
var
  x : Integer;
  porItbi : Real;
begin
 with frmProcVentaRapida do
 begin
  porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value),-1);

  for x:=1 to 5 do
  begin
    ibsqlGetPorcDescFctSvr.Close;
    ibsqlGetPorcDescFctSvr.Params[0].Value:= x;
    ibsqlGetPorcDescFctSvr.ExecQuery;
    case ibsqlGetPorcDescFctSvr.FieldByName('tipo').AsInteger of
      1: begin
          if CheckBox3Checked then
          begin
          TotalesMontoDescGastosAdmin.Value:=
          TotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcGAdmin.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[1].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcGAdmin.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          
          end;
         end;
      2: begin
          if CheckBox3Checked then
          begin
          TotalesMontoDescItbisGastosAdmin.Value:=
          TotalesMontoDescGastosAdmin.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcItbisGAdmin.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[2].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcItbisGAdmin.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          end;
         end;
      3: begin
          TotalesMontoDescTransp.Value:=
          TotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcTrans.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[3].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcTrans.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
         end;
      4: begin
          TotalesMontoDescDirtecnica.Value:=
          TotalesSubTotal.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcDirTec.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[4].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcDirTec.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;          
         end;
      5: begin
          TotalesMontoDescItbisDirTecnica.Value:=
          TotalesMontoDescDirtecnica.Value * ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat / 100;
          TotalesPorcItbisDirTec.Value:=' '+ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsString+'%';
          dmFactura.stpInsertPorcOtrosCargosFServ.Params[5].Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
          TotalesTPorcItbisDirTec.Value:=ibsqlGetPorcDescFctSvr.FieldByName('Porciento').AsFloat;
         end;
    end;//case
  end;//for
  TotalesMontoDescImprevisto.Value:= 0;
  TotalesMontoDescItbisImprevisto.Value:= 0;
  if CheckBox2Checked then
  begin
    TotalesMontoDescImprevisto.Value:=
    TotalesSubTotal.Value * 4 / 100;
    TotalesMontoDescItbisImprevisto.Value :=
    TotalesMontoDescImprevisto.Value * porItbi/100;
    TotalesPorcImprevisto.Value:=' 4%';
    TotalesPorcItbisImprevisto.Value:=' '+FloatToStr(porItbi)+'%';
    TotalesTPorcItbisImprevisto.Value:=porItbi;
    dmFactura.stpInsertPorcOtrosCargosFServ.Params[7].Value:=4;
    TotalesTPorcImprevisto.Value:=4;
  end;
  end;
end;

procedure TdmCalculos.LoadDataVenta(var rxVentaSource: TRxMemoryData);
begin
end;


procedure TdmCalculos.LoadTotalVenta(var rxTotalSource: TRxMemoryData);
//var
//  x : Integer;
begin

end;

procedure TdmCalculos.ProcesaCalculos;
var
  LGlobalActivo: Boolean;
  LCambioGlobal: Boolean;
  LRefrescarTodas: Boolean;
begin
  if FProcesandoCalculos then
  begin
    FRecalculoPendiente := True;
    Exit;
  end;

  if not Assigned(frmProcVentaRapida) then
    Exit;

  if not frmProcVentaRapida.rxVenta.Active then
    Exit;

  if frmProcVentaRapida.rxVenta.IsEmpty then
    Exit;

  if GlbNumVtaPOS <= 0 then
    Exit;

  FProcesandoCalculos := True;
  frmProcVentaRapida.EnProcesoCalculo := True;

  try
    LogProcedureCalc('TdmCalculos.ProcesaCalculos INICIO');

    {
      Siempre sincroniza solo la línea modificada.
    }
    ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);

    {
      El recargo siempre es global.

      FCambioGlobalPendiente cubre el descuento global, incluso si
      el usuario lo cambió de un valor positivo a cero.
    }
    LCambioGlobal :=
      (frmProcVentaRapida.UltimaVariableModificada = tcRecargo) or
      FCambioGlobalPendiente;

    {
      Evalúa los valores actuales ya confirmados en Totales.
    }
    LGlobalActivo := TieneDistribucionGlobalActiva;

    {
      Solo propaga a todas las líneas cuando el usuario cambió
      realmente un valor global.
    }
    if LCambioGlobal then
      ActualizarValoresGlobalesPosExtraDet(GlbNumVtaPOS);

    {
      Firebird recalcula POS_EXTRA_SUM y Delphi refleja Totales.
    }
    Pos_UpdateTotales(GlbNumVtaPOS);

    {
      Si existe recargo o descuento global activo, un cambio en una línea
      modifica la distribución de todas las líneas.

      Sin esos valores globales, solo refrescamos la línea activa.
    }
    LRefrescarTodas :=
      LCambioGlobal or LGlobalActivo;

    if LRefrescarTodas then
      RefrescarTodasLineasDesdePosExtraDet
    else
      RefrescarLineaActualDesdePosExtraDet;

    FCambioGlobalPendiente := False;

    GlbCalculado := True;
    procCalc := False;
    FRecalculoPendiente := False;

    LogProcedureCalc(
      'TdmCalculos.ProcesaCalculos FIN ' +
      'Todas=' + BoolToStr(LRefrescarTodas, True)
    );

  finally
    frmProcVentaRapida.EnProcesoCalculo := False;
    FProcesandoCalculos := False;
  end;
end;


procedure TdmCalculos.ActualizarPosExtraSum(numstr: Integer);
begin
  if numstr <= 0 then
    Exit;

  {
    Este stored procedure debe hacer el trabajo pesado en Firebird:
      - leer POS_EXTRA_DET
      - calcular subtotal
      - calcular ITBIS
      - calcular descuentos
      - calcular recargos
      - calcular TC_TOTALNETO
      - insertar/actualizar POS_EXTRA_SUM
  }

  try
    stpproc_InsUpdVtaSum.Close;

    if stpproc_InsUpdVtaSum.Params.Count > 0 then
      stpproc_InsUpdVtaSum.Params[0].Value := numstr;

    if stpproc_InsUpdVtaSum.Params.Count > 1 then
      stpproc_InsUpdVtaSum.Params[1].Value := VarUsuarioGlb;

    SetParamIfExists(stpproc_InsUpdVtaSum.Params, 'NUMERO', numstr);
    SetParamIfExists(stpproc_InsUpdVtaSum.Params, 'NUMSTR', numstr);
    SetParamIfExists(stpproc_InsUpdVtaSum.Params, 'NUMEROSTR', numstr);
    SetParamIfExists(stpproc_InsUpdVtaSum.Params, 'COD_USUARIO', VarUsuarioGlb);
    SetParamIfExists(stpproc_InsUpdVtaSum.Params, 'CODUSER', VarUsuarioGlb);

    stpproc_InsUpdVtaSum.ExecProc;

    if not stpproc_InsUpdVtaSum.Transaction.InTransaction then
      stpproc_InsUpdVtaSum.Transaction.StartTransaction;

    try
      stpproc_InsUpdVtaSum.Transaction.CommitRetaining;
    except
      stpproc_InsUpdVtaSum.Transaction.RollbackRetaining;
      raise;
    end;

  except
    on E: Exception do
    begin
      LogProcedureCalc(
        'ERROR ActualizarPosExtraSum Num=' + IntToStr(numstr) +
        ' Error=' + E.Message
      );
      raise;
    end;
  end;
end;

procedure TdmCalculos.ProcesaCalculosVentaCompleta;
var
  Bmk: TBookmark;
begin
  if FProcesandoCalculos then
    Exit;

  if not Assigned(frmProcVentaRapida) then Exit;
  if not frmProcVentaRapida.rxVenta.Active then Exit;
  if frmProcVentaRapida.rxVenta.IsEmpty then Exit;

  FProcesandoCalculos := True;
  frmProcVentaRapida.EnProcesoCalculo := True;

  Bmk := nil;

  try
    LogProcedureCalc('TdmCalculos.ProcesaCalculosVentaCompleta INICIO');

    if not frmProcVentaRapida.rxVenta.IsEmpty then
      Bmk := frmProcVentaRapida.rxVenta.GetBookmark;

    frmProcVentaRapida.rxVenta.DisableControls;
    try
      frmProcVentaRapida.rxVenta.First;

      while not frmProcVentaRapida.rxVenta.Eof do
      begin
        if (not frmProcVentaRapida.rxVentaCodArticulo.IsNull) and
           (frmProcVentaRapida.rxVentaCodArticulo.Value > 0) and
           ((frmProcVentaRapida.rxVentaStatus.IsNull) or
            (frmProcVentaRapida.rxVentaStatus.Value <> 'C')) then
        begin
          ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
        end;

        frmProcVentaRapida.rxVenta.Next;
      end;

    finally
      frmProcVentaRapida.rxVenta.EnableControls;
    end;

    Pos_UpdateTotales(GlbNumVtaPOS);

    if Bmk <> nil then
    begin
      try
        if frmProcVentaRapida.rxVenta.BookmarkValid(Bmk) then
          frmProcVentaRapida.rxVenta.GotoBookmark(Bmk);
      finally
        frmProcVentaRapida.rxVenta.FreeBookmark(Bmk);
        Bmk := nil;
      end;
    end;

    RefrescarTodasLineasDesdePosExtraDet;

    GlbCalculado := True;
    procCalc := False;
    FRecalculoPendiente := False;

    LogProcedureCalc('TdmCalculos.ProcesaCalculosVentaCompleta FIN OK');

  finally
    if Bmk <> nil then
    begin
      try
        if frmProcVentaRapida.rxVenta.Active then
          frmProcVentaRapida.rxVenta.FreeBookmark(Bmk);
      except
      end;
    end;

    frmProcVentaRapida.EnProcesoCalculo := False;
    FProcesandoCalculos := False;
  end;
end;


procedure TdmCalculos.ProcesarSumaTotal;
var
  monto:Extended;
  itbis, descuento, neto: Extended;
  puerto, linea1, linea2 : String;
  montoRecItbis, precioSum, MontoDescItem : Currency;
  montoRecItbisConDesc,MontoDescGlbDist : Currency;

begin

end;
   
procedure TdmCalculos.SetDataVenta(var rxVentaTarget: TRxMemoryData);
var
  x : Integer;

begin

end;

procedure TdmCalculos.SetMontoNotaCredito;
begin
  if (xCodigoPropietario > 0)  and (not frmProcVentaRapida.TotalesMoneda.IsNull) then
  begin
    dmDatos.tblDevolucionAbierta.Close;
    dmDatos.tblDevolucionAbierta.Params[0].Value := frmProcVentaRapida.TotalesMoneda.Value;//moneda
    dmDatos.tblDevolucionAbierta.Params[1].Value := xCodigoPropietario; //codigocte
    dmDatos.tblDevolucionAbierta.Open;
    dmDatos.tblDevolucionAbierta.First;
    if frmProcVentaRapida.Totales.State = dsBrowse then
    frmProcVentaRapida.Totales.Edit;
    frmProcVentaRapida.TotalesMontoNotaCredito.Value := 0;
    While Not dmDatos.tblDevolucionAbierta.Eof Do
    begin
      frmProcVentaRapida.TotalesMontoNotaCredito.Value :=
      frmProcVentaRapida.TotalesMontoNotaCredito.Value +
      dmDatos.tblDevolucionAbiertaMONTO_PENDIENTE.Value;
     dmDatos.tblDevolucionAbierta.Next;
    end;
  end;
end;

procedure TdmCalculos.SetTotalVenta(var rxTotalTarget: TRxMemoryData);
var
  x : Integer;
begin

end;

procedure TdmCalculos.DataModuleCreate(Sender: TObject);
begin
  esFeedbackExtra:=False;
  rxError.Close;
  rxError.Open;
  EsBorrandoRecord:=False;
  tmpValorTotal:=0;
  tmpValorItbis:=0;
end;

procedure TdmCalculos.Totales_xxxAfterPost(DataSet: TDataSet);
begin
  //dmCalculos.SetTotalVenta(Totales);
end;

function TdmCalculos.GettotalMontoDescuentoItem: Currency;
var
    resultado : Currency;
begin
  result:=0;
end;

procedure TdmCalculos.NotificaErrorByEmail(sms:string);
begin
  dmCompania.qryEmailProceso.Close;
  dmCompania.qryEmailProceso.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblcompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  GlbNombreCia := UpperCase(dmCompania.tblCompaniaNOMBRE.Value);
  
  if dmCompania.qryEmailProceso.Locate('IDTIPO',900,[]) then
  begin
    ProcLogTrackingEmailAvisoDir('smtp.idesisa.com.netsolmail.net',
    '587','soporte@idesisa.com',
    'A$2019Cero9nom',
    Now,'divison@gmail.com','soporte@idesisa.com',
    'Aviso uso PointSaleSoft '+' -CIA:'+
    dmCompania.tblCompaniaNOMBRE.Value+
    ''#13#10'Sucursal : '+dmCompania.tblCompaniaCIUDAD.AsString+' '+FormatDateTime('dd/mm/yyyy hh:mm a/p',now),
    ''#13#10''+sms+
    ''#13#10'Telef:'+dmCompania.tblCompaniaTELEFONO.Value+
    ''#13#10'RNC:'+dmCompania.tblCompaniaRNC_NUMERO.Value+
    'Email: '+dmCompania.tblCompaniaEMAIL.Value + ''#13#10''+
    sms+ ''#13#10'',
    //xVersion + ''#13'Cantidad de veces de uso disponible: '+IntToStr(qtyCorr),
    VarUsuarioGlb,'A','', Now, StrUserName, FormatDateTime('dd/mm/yyyy hh:mm a/p', Now),StrUserName,'');
  end;
end;

procedure TdmCalculos.ProcInsertUpdatePosExtraDet(numstr: integer);
var
  Existe: Boolean;
  ATasaItbis: Currency;
begin
  LogProcedureCalc('TdmCalculos.ProcInsertUpdatePosExtraDet INICIO');

  if not Assigned(frmProcVentaRapida) then Exit;
  if not frmProcVentaRapida.rxVenta.Active then Exit;
  if frmProcVentaRapida.rxVenta.IsEmpty then Exit;

  if frmProcVentaRapida.rxVentaCodArticulo.IsNull then Exit;
  if frmProcVentaRapida.rxVentaCodArticulo.Value <= 0 then Exit;

  if frmProcVentaRapida.rxVentaStatus.IsNull then
  begin
    frmProcVentaRapida.rxVenta.Edit;
    frmProcVentaRapida.rxVentaStatus.Value := 'A';
  end;

  if frmProcVentaRapida.rxVentaStatus.Value = 'C' then
    Exit;

  if numstr <= 0 then
  begin
    numstr := GetRandomNumber(VarUsuarioGlb);
    GlbNumVtaPOS := numstr;
  end
  else
    GlbNumVtaPOS := numstr;

  qryPosExtraDet.Close;
  qryPosExtraDet.Params[0].Value := GlbNumVtaPOS;
  qryPosExtraDet.Open;

  Existe := False;

  if qryPosExtraDet.State = dsBrowse then
  begin
    Existe := qryPosExtraDet.Locate(
      'NUMERO;SERIE;COD_USUARIO',
      VarArrayOf([
        GlbNumVtaPOS,
        frmProcVentaRapida.rxVentaSerie.Value,
        VarUsuarioGlb
      ]),
      []
    );
  end;

  if not Existe then
    Existe := VtaExisteExtra(
      GlbNumVtaPOS,
      frmProcVentaRapida.rxVentaSerie.Value,
      VarUsuarioGlb
    );

  if Existe then
  begin
    if not qryPosExtraDet.Locate(
      'NUMERO;SERIE;COD_USUARIO',
      VarArrayOf([
        GlbNumVtaPOS,
        frmProcVentaRapida.rxVentaSerie.Value,
        VarUsuarioGlb
      ]),
      []
    ) then
    begin
      qryPosExtraDet.Close;
      qryPosExtraDet.Params[0].Value := GlbNumVtaPOS;
      qryPosExtraDet.Open;

      qryPosExtraDet.Locate(
        'NUMERO;SERIE;COD_USUARIO',
        VarArrayOf([
          GlbNumVtaPOS,
          frmProcVentaRapida.rxVentaSerie.Value,
          VarUsuarioGlb
        ]),
        []
      );
    end;

    qryPosExtraDet.Edit;
  end
  else
  begin
    qryPosExtraDet.Append;
    qryPosExtraDetSERIE.Value := frmProcVentaRapida.rxVentaSerie.Value;
    qryPosExtraDetNUMERO.Value := GlbNumVtaPOS;
    qryPosExtraDetCOD_USUARIO.Value := VarUsuarioGlb;
    qryPosExtraDetFECHA.Value := ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value);
  end;

  qryPosExtraDetFECHA_COTIZA.Value :=
    ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value);

  if not frmProcVentaRapida.rxVentaNumeroCotiza.IsNull then
    qryPosExtraDetNUMERO_COTIZA.Value := frmProcVentaRapida.rxVentaNumeroCotiza.Value
  else
    qryPosExtraDetNUMERO_COTIZA.Value := 0;

  if frmProcVentaRapida.rxVentaMoneda.IsNull then
  begin
    if (GlbMonedaBase > 0) then
    frmProcVentaRapida.rxVentaMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    frmProcVentaRapida.rxVentaMoneda.Value   := '1';
  end;

  qryPosExtraDetD_MONEDA.Value := frmProcVentaRapida.rxVentaMoneda.Value;
  qryPosExtraDetD_TIPO_VENTA.Value := frmProcVentaRapida.rxVentaTipoVenta.Value;
  qryPosExtraDetD_CODIGO_PROD.Value := frmProcVentaRapida.rxVentaCodArticulo.Value;
  qryPosExtraDetD_CANT.Value := frmProcVentaRapida.rxVentaCant.Value;
  qryPosExtraDetD_TIPO_UNIDAD.Value := frmProcVentaRapida.rxVentaTipoUnidad.Value;
  qryPosExtraDetCODTEXTO.Value := frmProcVentaRapida.rxVentaCodTexto.Value;

  if not frmProcVentaRapida.rxVentaLevelPrecio.IsNull then
    qryPosExtraDetLEVEL_PRECIO_VENT.Value := frmProcVentaRapida.rxVentaLevelPrecio.Value
  else
    qryPosExtraDetLEVEL_PRECIO_VENT.Value := 0;

  {
    Mantengo tu regla actual de precio en moneda base.
    No es cálculo fiscal; es preparar el insumo que la BD ya espera.
  }
  if GlbMonedaBase = 1 then
    qryPosExtraDetD_PRECIO.Value :=
      frmProcVentaRapida.rxVentaPrecio.Value *
      frmProcVentaRapida.rxVentaMonto_Tasa.Value
  else
    qryPosExtraDetD_PRECIO.Value :=
      frmProcVentaRapida.rxVentaPrecio.Value;

  {
    Tasa como insumo. Los montos fiscales los calcula Firebird.
  }
  if (GlbIgI = 0) and (GlbCalcItbis = 0) then
    ATasaItbis := 0
  else
    ATasaItbis := FGlbPorcItbi(
      ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value),
      frmProcVentaRapida.rxVentaCodArticulo.Value
    );

  qryPosExtraDetD_TASA_ITBIS.Value := ATasaItbis;
  qryPosExtraDetD_PORCDESCITEM.Value :=
    frmProcVentaRapida.rxVentaPorcDescItem.Value;

  if GLBEsFastFood then
    qryPosExtraDetD_TRANSPITBIS.Value := 0
  else
    qryPosExtraDetD_TRANSPITBIS.Value := 1;

  if GlbTransparentaITBI = 0 then
    qryPosExtraDetD_TRANSPITBIS.Value := 0;

  qryPosExtraDetT_PORCDESADICIONAL.Value :=
    frmProcVentaRapida.TotalesPorcDesAdicional.Value;

  qryPosExtraDetT_RECARGO.Value :=
    frmProcVentaRapida.TotalesRecargo.Value;

  qryPosExtraDetT_PROPINA.Value :=
    frmProcVentaRapida.TotalesPropina.Value;

  qryPosExtraDetT_MONTOINTERES.Value :=
    frmProcVentaRapida.TotalesMontoInteres.Value;

  qryPosExtraDetT_MONTONCRAPLICADO.Value :=
    frmProcVentaRapida.TotalesMontoNCRAplicado.Value;

  {
    IMPORTANTE:
    No escribir aquí campos calculados como:
      DC_MONTOBRUTO
      DC_MONTODESCITEM
      DC_ITBIS
      TC_TOTALNETO
      TC_ITBIS
      TC_SUBTOTAL
      TC_MONTOITBISRECARGO_GLB
      TC_MONTOITBISRECARGO_ITM

    Esos valores los debe producir Firebird.
  }

  try
    GlbSalvarQuery(qryPosExtraDet);
  except
    on E: Exception do
    begin
      frmLogError.LogSteps(
        GlbNumVtaPOS,
        frmProcVentaRapida.rxVentaSerie.Value,
        Now,
        Now,
        E.ClassName + ': ' + E.Message + #13#10 +
        'Error insertando/actualizando POS_EXTRA_DET',
        'UDatModCalculos'
      );

      NotificaErrorByEmail(
        E.ClassName + ': ' + E.Message + #13#10 +
        'Error insertando/actualizando POS_EXTRA_DET'
      );

      raise;
    end;
  end;

  GlbExtraUpdate := True;

  LogProcedureCalc('TdmCalculos.ProcInsertUpdatePosExtraDet FIN');
end;


procedure TdmCalculos.ProcDelRecPosExtraDet(serietrn: integer);
begin
  ibSqlDelCurrrentRPosExtraDET.Params[0].Value:= VarUsuarioGlb;
  ibSqlDelCurrrentRPosExtraDET.Params[1].Value:= serietrn;
  ibSqlDelCurrrentRPosExtraDET.Params[2].Value:= GlbNumVtaPOS;

  try
  if not ibSqlDelCurrrentRPosExtraDET.Transaction.InTransaction then
    ibSqlDelCurrrentRPosExtraDET.Transaction.StartTransaction;

  ibSqlDelCurrrentRPosExtraDET.ExecQuery;
  ibSqlDelCurrrentRPosExtraDET.Transaction.CommitRetaining;
  except
    on E: Exception do
    begin
      if ibSqlDelCurrrentRPosExtraDET.Transaction.InTransaction then
        ibSqlDelCurrrentRPosExtraDET.Transaction.RollbackRetaining;
      raise;
    end;
  end;

  dmcalculos.EsBorrandoRecord:=False;
end;

procedure TdmCalculos.RecalcularDespuesDeEliminar(ANumero: Integer);
begin
  if ANumero <= 0 then
    Exit;

  Pos_UpdateTotales(ANumero);

  if TieneDistribucionGlobalActiva then
    RefrescarTodasLineasDesdePosExtraDet
  else
    RefrescarLineaActualDesdePosExtraDet;
end;

procedure TdmCalculos.ProcDeletePosExtraDet(numstr: Integer);
var
  LTransaccionIniciadaAqui: Boolean;
begin
  if numstr <= 0 then
    Exit;

  {
    Este procedimiento libera un POS temporal completo.
    No recalcula Totales ni intenta reconstruir rxVenta.
    Para borrar una sola línea usar ProcDelRecPosExtraDet +
    RecalcularDespuesDeEliminar.
  }
  EsBorrandoRecord := True;

  try
    {
      Evita que datasets abiertos mantengan registros obsoletos
      después del DELETE físico.
    }
    qryPosExtraDet.Close;
    qryConsultaPosExtraDet.Close;
    qryGetSumVtaExtra.Close;
    qryPosExtraSum.Close;

    LTransaccionIniciadaAqui :=
      not ibSqlDeletePosExtraDET.Transaction.InTransaction;

    if LTransaccionIniciadaAqui then
      ibSqlDeletePosExtraDET.Transaction.StartTransaction;

    try
      ibSqlDeletePosExtraDET.Close;
      ibSqlDeletePosExtraDET.Params[0].Value := VarUsuarioGlb;
      ibSqlDeletePosExtraDET.Params[1].Value := numstr;
      ibSqlDeletePosExtraDET.ExecQuery;

      if LTransaccionIniciadaAqui then
        ibSqlDeletePosExtraDET.Transaction.CommitRetaining;

    except
      on E: Exception do
      begin
        if LTransaccionIniciadaAqui and
           ibSqlDeletePosExtraDET.Transaction.InTransaction then
          ibSqlDeletePosExtraDET.Transaction.RollbackRetaining;

        LogProcedureCalc(
          'ERROR ProcDeletePosExtraDet. Numero=' +
          IntToStr(numstr) +
          ' Usuario=' +
          IntToStr(VarUsuarioGlb) +
          ' Error=' +
          E.Message
        );

        raise;
      end;
    end;

  finally
    EsBorrandoRecord := False;
  end;
end;


procedure TdmCalculos.qryPosExtraDetBeforePost(DataSet: TDataSet);
begin
  if qryPosExtraDetNUMERO.Value <= 0 then
  Raise Exception.Create('Verificar numero trans en Pos Extra DET');
end;

procedure TdmCalculos.Pos_UpdateTotales(numstr: Integer);
var
  QSum: TDataSet;
  VItbis: Currency;
  VNeto: Currency;
  VNetoMostrar: Currency;
  TipoNCF: string;
  EsNCFEspecial: Boolean;
  AplicaExoneracion: Boolean;
begin
  LogProcedureCalc('TdmCalculos.Pos_UpdateTotales INICIO');

  if numstr <= 0 then
    Exit;

  if not Assigned(frmProcVentaRapida) then
    Exit;

  {
    Firebird actualiza POS_EXTRA_SUM.
    Delphi solamente lee y presenta los valores calculados.
  }
  ActualizarPosExtraSum(numstr);

  qryPosExtraSum.Close;

  if qryPosExtraSum.Params.Count > 0 then
    qryPosExtraSum.Params[0].Value := numstr;

  qryPosExtraSum.Open;

  if qryPosExtraSum.IsEmpty then
    raise Exception.Create(
      'POS_EXTRA_SUM no devolvio datos luego de ejecutar PROC_INSUPDVTASUM. ' +
      'NumPOS=' + IntToStr(numstr)
    );

  qryPosExtraSum.First;
  QSum := qryPosExtraSum;

  {
    TOTAL_ITBIS debe representar:
      DC_ITBIS_CLD +
      TC_MONTOITBISRECARGO_GLB +
      TC_MONTOITBISRECARGO_ITM
  }
  VItbis := GetFieldCurr(QSum, 'TOTAL_ITBIS', 0);

  if Abs(VItbis) = 0 then
    VItbis := GetFieldCurr(QSum, 'TC_ITBIS', 0);

  {
    TC_TOTALNETO llega terminado desde Firebird.
    No se reconstruye ni se le suma ITBIS en Delphi.
  }
  VNeto := GetFieldCurr(QSum, 'TC_TOTALNETO', 0);
  VNetoMostrar := VNeto;

  if frmProcVentaRapida.Totales.State = dsInactive then
    frmProcVentaRapida.Totales.Open;

  if frmProcVentaRapida.Totales.IsEmpty then
    frmProcVentaRapida.Totales.Append
  else
  if frmProcVentaRapida.Totales.State = dsBrowse then
    frmProcVentaRapida.Totales.Edit;

  with frmProcVentaRapida do
  begin
    TipoNCF := '';

    if not TotalesTipoNCF.IsNull then
      TipoNCF := UpperCase(Trim(TotalesTipoNCF.AsString));

    {
      E44 = Regimenes Especiales electronico.
      B14 = Regimenes Especiales convencional.

      Se soportan versiones con y sin prefijo por compatibilidad
      con rutas antiguas del POS.
    }
    EsNCFEspecial :=
      (TipoNCF = '44') or
      (TipoNCF = 'E44') or
      (TipoNCF = '14') or
      (TipoNCF = 'B14');

    {
      Solo se retira ITBIS cuando el precio esta configurado
      como ITBIS incluido.
    }
    AplicaExoneracion :=
      CheckBox1.Checked and
      EsNCFEspecial and
      (GlbIgI = 1);

    {
      Valores globales de POS_EXTRA_SUM.
    }
    TotalesPorcDesAdicional.Value :=
      GetFieldCurr(QSum, 'T_PORCDESADICIONAL', 0);

    TotalesRecargo.Value :=
      GetFieldCurr(QSum, 'T_RECARGO', 0);

    TotalesPropina.Value :=
      GetFieldCurr(QSum, 'T_PROPINA', 0);

    TotalesMontoInteres.Value :=
      GetFieldCurr(QSum, 'T_MONTOINTERES', 0);

    TotalesMontoNCRAplicado.Value :=
      GetFieldCurr(QSum, 'T_MONTONCRAPLICADO', 0);

    TotalesDevolucion.Value :=
      GetFieldCurr(QSum, 'T_DEVOLUCION', 0);

    {
      Valores fiscales calculados exclusivamente por Firebird.
    }
    TotalesSubTotal.Value :=
      GetFieldCurr(QSum, 'TC_SUBTOTAL', 0);

    TotalesSubTotalScreen.Value :=
      GetFieldCurr(QSum, 'TC_SUBTOTAL', 0);

    TotalesMontoDescItems.Value :=
      GetFieldCurr(QSum, 'TC_MONTODESCITEMS', 0);

    TotalesMontoDescAdicional.Value :=
      GetFieldCurr(QSum, 'TC_MONTODESCADICIONAL', 0);

    TotalesMontoITBISRecargo.Value :=
      GetFieldCurr(QSum, 'TC_MONTOITBISRECARGO_GLB', 0);

    TotalesMontoItbRecItmConDesc.Value :=
      GetFieldCurr(QSum, 'TC_MONTOITBISRECARGO_ITM', 0);

    TotalesMontoDescGlbItbis.Value :=
      GetFieldCurr(QSum, 'TC_MONTODESCGLOBAL', 0);

    TotalesPropinaLegal.Value :=
      GetFieldCurr(QSum, 'DC_PROPINALEGAL', 0);

    TotalesItbis.Value := VItbis;

    if AplicaExoneracion then
    begin
      TotalesMontoExoneraITBIS.Value := VItbis;
      VNetoMostrar := VNeto - VItbis;
    end
    else
    begin
      {
        Evita que E44/B14 deje un residuo al cambiar de NCF.
      }
      TotalesMontoExoneraITBIS.Value := 0;
      VNetoMostrar := VNeto;
    end;

    Totalestotalneto.Value := VNetoMostrar;

    if (not LlenandoDatos) and
       (Totales.State in [dsInsert, dsEdit]) then
      Totales.Post;
  end;

  LogProcedureCalc(
    'TdmCalculos.Pos_UpdateTotales FIN ' +
    'Num=' + IntToStr(numstr) +
    ' TipoNCF=' + TipoNCF +
    ' SubTotal=' + CurrToStr(GetFieldCurr(QSum, 'TC_SUBTOTAL', 0)) +
    ' ITBIS=' + CurrToStr(VItbis) +
    ' NetoFirebird=' + CurrToStr(VNeto) +
    ' NetoMostrar=' + CurrToStr(VNetoMostrar)
  );
end;

function TdmCalculos.VtaExiste(num, serie, coduser: integer): Boolean;
begin
  qryCheckVtaExtExiste.Close;
  qryCheckVtaExtExiste.Params[0].Value:= num;
  qryCheckVtaExtExiste.Params[1].Value:= serie;
  qryCheckVtaExtExiste.Params[2].Value:= coduser;
  qryCheckVtaExtExiste.Open;
  qryCheckVtaExtExiste.Last;
  if qryCheckVtaExtExiste.RecordCount = 0 then
  result:= False
  else result:=True;
end;

function TdmCalculos.VtaExisteExtra(num, serie, coduser: integer): Boolean;
begin
  qryCheckVtaExtExiste.Close;
  qryCheckVtaExtExiste.Params[0].Value:= num;
  qryCheckVtaExtExiste.Params[1].Value:= serie;
  qryCheckVtaExtExiste.Params[2].Value:= coduser;
  qryCheckVtaExtExiste.Open;
  qryCheckVtaExtExiste.Last;
  if qryCheckVtaExtExiste.RecordCount = 0 then
  result:= False
  else result:=True;
end;

procedure TdmCalculos.ProcSetPorcDescValor(numstr: integer);
var
  guardarRec : TBookMark;
begin
  qryPosExtRrdDesc.Close;
  qryPosExtRrdDesc.Params[0].Value:=numstr;
  qryPosExtRrdDesc.Open;
  qryPosExtRrdDesc.Last;
  if frmProcVentaRapida.rxVenta.RecordCount > 1 then
  guardarRec:= frmProcVentaRapida.rxVenta.GetBookmark;
  try
  qryPosExtRrdDesc.First;
  While not qryPosExtRrdDesc.Eof do
  begin
    if frmProcVentaRapida.rxVenta.Locate('serie', qryPosExtRrdDescSerie.Value,[]) then
    begin
      frmProcVentaRapida.rxVenta.Tag := 27;
      frmProcVentaRapida.rxVenta.Edit;
      frmProcVentaRapida.rxVentaPorcDescItem.Value:=0;
      frmProcVentaRapida.rxVenta.Post;
    end;
    qryPosExtRrdDesc.Next;
  end;

  GlbCalculado := False;
DatosModificados := True;
CalculoPendiente := True;

dmCalculos.ProcesaCalculosVentaCompleta;

DatosModificados := False;
CalculoPendiente := False;
CalculoMsgPendiente := False;
GlbCalculado := True;
procCalc := False;

  finally
    if Assigned(guardarRec) then
    begin
      frmProcVentaRapida.rxVenta.GotoBookmark(guardarRec);
      frmProcVentaRapida.rxVenta.FreeBookmark(guardarRec);
    end;
  end;
end;

procedure TdmCalculos.qryConsultaPosExtraDetAfterOpen(DataSet: TDataSet);
begin
  qryValorVta.close;
  qryValorVta.params[0].value:=qryConsultaPosExtraDetNumero.Value;
  qryValorVta.params[1].value:=qryConsultaPosExtraDetCOD_USUARIO.Value;
  qryValorVta.open;
end;

function TdmCalculos.GlbNumPosExiste(num: integer): Boolean;
begin
  qryCheckGlbNumPos.Close;
  qryCheckGlbNumPos.Params[0].Value:= num;
  qryCheckGlbNumPos.Open;
  if qryCheckGlbNumPos.RecordCount = 0 then
  result:= False
  else result:=True;
end;

procedure TdmCalculos.qryGetSumVtaExtraAfterOpen(DataSet: TDataSet);
begin
  qryValorVta.close;
  qryValorVta.params[0].value:=qryGetSumVtaExtraNumero.Value;
  qryValorVta.params[1].value:=VarUsuarioGlb;
  qryValorVta.open;
end;

procedure TdmCalculos.qryGetSumVtaExtraBeforeOpen(DataSet: TDataSet);
begin
  stpproc_InsUpdVtaSum.Params[0].Value:=GlbNumVtaPOS;
  stpproc_InsUpdVtaSum.ExecProc;
end;

procedure TdmCalculos.qryVentasAfterScroll(DataSet: TDataSet);
begin
  qryVentasDEt.Close;
  qryVentasDEt.Params[0].Value:= qryVentasNUMERO.Value;
  qryVentasDEt.Open;
end;

procedure TdmCalculos.RefrescarLineaActualDesdePosExtraDet;
var
  LSerie: Integer;
  LOldLlenandoDatos: Boolean;
  LAfterOpen: TDataSetNotifyEvent;
begin
  if not Assigned(frmProcVentaRapida) then
    Exit;

  if not frmProcVentaRapida.rxVenta.Active then
    Exit;

  if frmProcVentaRapida.rxVenta.IsEmpty then
    Exit;

  if frmProcVentaRapida.rxVentaSerie.IsNull then
    Exit;

  if GlbNumVtaPOS <= 0 then
    Exit;

  {
    Una línea cancelada no debe reconstruirse en POS_EXTRA_DET.
  }
  if (not frmProcVentaRapida.rxVentaStatus.IsNull) and
     (frmProcVentaRapida.rxVentaStatus.Value = 'C') then
    Exit;

  {
    Una línea sin artículo no representa detalle fiscal.
  }
  if frmProcVentaRapida.rxVentaCodArticulo.IsNull or
     (frmProcVentaRapida.rxVentaCodArticulo.Value <= 0) then
    Exit;

  LSerie := frmProcVentaRapida.rxVentaSerie.Value;
  LAfterOpen := qryConsultaPosExtraDet.AfterOpen;

  {
    qryConsultaPosExtraDetAfterOpen asume que existe un registro actual.
    Durante la recuperación puede abrirse vacío, por eso se desactiva.
  }
  qryConsultaPosExtraDet.AfterOpen := nil;

  try
    qryConsultaPosExtraDet.Close;
    qryConsultaPosExtraDet.ParamByName('NUMEROSTR').AsInteger :=
      GlbNumVtaPOS;
    qryConsultaPosExtraDet.ParamByName('CODUSER').AsInteger :=
      VarUsuarioGlb;
    qryConsultaPosExtraDet.ParamByName('NUMCOTIZA').AsInteger := -1;
    qryConsultaPosExtraDet.Open;

    if not qryConsultaPosExtraDet.Locate(
      'NUMERO;SERIE;COD_USUARIO',
      VarArrayOf([
        GlbNumVtaPOS,
        LSerie,
        VarUsuarioGlb
      ]),
      []
    ) then
    begin
      {
        rxVenta tiene la línea, pero POS_EXTRA_DET no.
        Se reconstruye el espejo desde los datos actualmente confirmados
        en rxVenta y luego Firebird recalcula detalle y sumatoria.
      }
      ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);
      Pos_UpdateTotales(GlbNumVtaPOS);

      qryConsultaPosExtraDet.Close;
      qryConsultaPosExtraDet.ParamByName('NUMEROSTR').AsInteger :=
        GlbNumVtaPOS;
      qryConsultaPosExtraDet.ParamByName('CODUSER').AsInteger :=
        VarUsuarioGlb;
      qryConsultaPosExtraDet.ParamByName('NUMCOTIZA').AsInteger := -1;
      qryConsultaPosExtraDet.Open;

      if not qryConsultaPosExtraDet.Locate(
        'NUMERO;SERIE;COD_USUARIO',
        VarArrayOf([
          GlbNumVtaPOS,
          LSerie,
          VarUsuarioGlb
        ]),
        []
      ) then
      begin
        LogProcedureCalc(
          'No se pudo reconstruir POS_EXTRA_DET. Numero=' +
          IntToStr(GlbNumVtaPOS) +
          ' Serie=' + IntToStr(LSerie) +
          ' Usuario=' + IntToStr(VarUsuarioGlb)
        );

        raise Exception.Create(
          'No se pudo sincronizar el detalle temporal de la venta.'
        );
      end;
    end;

    LOldLlenandoDatos := frmProcVentaRapida.LlenandoDatos;
    frmProcVentaRapida.LlenandoDatos := True;

    try
      with frmProcVentaRapida do
      begin
        if rxVenta.State = dsBrowse then
          rxVenta.Edit;

        if Assigned(qryConsultaPosExtraDet.FindField('DC_MONTOBRUTO')) then
          rxVentaMontoBruto.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'DC_MONTOBRUTO',
              rxVentaMontoBruto.Value
            );

        if Assigned(qryConsultaPosExtraDet.FindField('DC_MONTODESCITEM')) then
          rxVentaMontoDescItem.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'DC_MONTODESCITEM',
              rxVentaMontoDescItem.Value
            );

        if Assigned(qryConsultaPosExtraDet.FindField('TC_MONTODESCGLOBAL')) then
        begin
          rxVentaMontoDesGlobal.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'TC_MONTODESCGLOBAL',
              rxVentaMontoDesGlobal.Value
            );

          rxVentaMontoDescGlbDist.Value :=
            rxVentaMontoDesGlobal.Value;
        end;

        if Assigned(qryConsultaPosExtraDet.FindField('DC_ITBIS')) then
          rxVentaItbi.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'DC_ITBIS',
              rxVentaItbi.Value
            );

        if Assigned(qryConsultaPosExtraDet.FindField('DC_ITBIS_CLD')) then
          rxVentaDC_ITBIS_CLD.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'DC_ITBIS_CLD',
              rxVentaDC_ITBIS_CLD.Value
            );

        if Assigned(
          qryConsultaPosExtraDet.FindField(
            'TC_MONTOITBISRECARGO_GLB'
          )
        ) then
        begin
          rxVentaTC_MONTOITBISRECARGO_GLB.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'TC_MONTOITBISRECARGO_GLB',
              0
            );

          rxVentaMontoItbisRecargo.Value :=
            rxVentaTC_MONTOITBISRECARGO_GLB.Value;
        end;

        if Assigned(
          qryConsultaPosExtraDet.FindField(
            'TC_MONTOITBISRECARGO_ITM'
          )
        ) then
        begin
          rxVentaTC_MONTOITBISRECARGO_ITM.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'TC_MONTOITBISRECARGO_ITM',
              0
            );

          rxVentaMontoItbRecItmConDesc.Value :=
            rxVentaTC_MONTOITBISRECARGO_ITM.Value;
        end;

        {
          DC_MONTONETO es el importe final de ESTA línea.
          Nunca usar TC_TOTALNETO, porque representa la venta completa.
        }
        if Assigned(qryConsultaPosExtraDet.FindField('DC_MONTONETO')) then
          rxVentaMontoNeto.Value :=
            DsFieldCurr(
              qryConsultaPosExtraDet,
              'DC_MONTONETO',
              rxVentaMontoNeto.Value
            );

        if rxVenta.State in [dsInsert, dsEdit] then
          rxVenta.Post;
      end;
    finally
      frmProcVentaRapida.LlenandoDatos := LOldLlenandoDatos;
    end;

  finally
    qryConsultaPosExtraDet.AfterOpen := LAfterOpen;
  end;
end;
    
procedure TdmCalculos.RefrescarTodasLineasDesdePosExtraDet;
var
  LSerieActiva: Integer;
  LOldLlenandoDatos: Boolean;
  LAfterOpen: TDataSetNotifyEvent;
  VDescGlobal: Currency;
  VItbisRecargoGlb: Currency;
  VItbisRecargoItm: Currency;
begin
  if not Assigned(frmProcVentaRapida) then
    Exit;

  if not frmProcVentaRapida.rxVenta.Active then
    Exit;

  if frmProcVentaRapida.rxVenta.IsEmpty then
    Exit;

  if GlbNumVtaPOS <= 0 then
    Exit;

  LSerieActiva := frmProcVentaRapida.SerieLineaActiva;

  if (LSerieActiva <= 0) and
     (not frmProcVentaRapida.rxVentaSerie.IsNull) then
  begin
    LSerieActiva := frmProcVentaRapida.rxVentaSerie.Value;
  end;

  LAfterOpen := qryConsultaPosExtraDet.AfterOpen;
  LOldLlenandoDatos := frmProcVentaRapida.LlenandoDatos;

  qryConsultaPosExtraDet.AfterOpen := nil;
  qryConsultaPosExtraDet.Close;

  qryConsultaPosExtraDet.ParamByName('NUMEROSTR').AsInteger :=
    GlbNumVtaPOS;

  qryConsultaPosExtraDet.ParamByName('CODUSER').AsInteger :=
    VarUsuarioGlb;

  qryConsultaPosExtraDet.ParamByName('NUMCOTIZA').AsInteger := -1;

  qryConsultaPosExtraDet.Open;

  if qryConsultaPosExtraDet.IsEmpty then
  begin
    qryConsultaPosExtraDet.AfterOpen := LAfterOpen;
    Exit;
  end;

  frmProcVentaRapida.rxVenta.DisableControls;
  frmProcVentaRapida.LlenandoDatos := True;

  try
    qryConsultaPosExtraDet.First;

    while not qryConsultaPosExtraDet.Eof do
    begin
      if frmProcVentaRapida.rxVenta.Locate(
        'SERIE',
        qryConsultaPosExtraDetSERIE.Value,
        []
      ) then
      begin
        if frmProcVentaRapida.rxVenta.State = dsBrowse then
          frmProcVentaRapida.rxVenta.Edit;

        VDescGlobal :=
          FieldCurrValue(
            qryConsultaPosExtraDetTC_MONTODESCGLOBAL
          );

        VItbisRecargoGlb :=
          FieldCurrValue(
            qryConsultaPosExtraDetTC_MONTOITBISRECARGO_GLB
          );

        VItbisRecargoItm :=
          FieldCurrValue(
            qryConsultaPosExtraDetTC_MONTOITBISRECARGO_ITM
          );

        frmProcVentaRapida.rxVentaMontoBruto.Value :=
          FieldCurrValue(qryConsultaPosExtraDetDC_MONTOBRUTO);

        frmProcVentaRapida.rxVentaMontoDescItem.Value :=
          FieldCurrValue(qryConsultaPosExtraDetDC_MONTODESCITEM);

        frmProcVentaRapida.rxVentaMontoDesGlobal.Value :=
          VDescGlobal;

        frmProcVentaRapida.rxVentaMontoDescGlbDist.Value :=
          VDescGlobal;

        frmProcVentaRapida.rxVentaItbi.Value :=
          FieldCurrValue(qryConsultaPosExtraDetDC_ITBIS);

        frmProcVentaRapida.rxVentaDC_ITBIS_CLD.Value :=
          FieldCurrValue(qryConsultaPosExtraDetDC_ITBIS_CLD);

        frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_GLB.Value :=
          VItbisRecargoGlb;

        frmProcVentaRapida.rxVentaMontoItbisRecargo.Value :=
          VItbisRecargoGlb;

        frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_ITM.Value :=
          VItbisRecargoItm;

        frmProcVentaRapida.rxVentaMontoItbRecItmConDesc.Value :=
          VItbisRecargoItm;

        frmProcVentaRapida.rxVentaMontoNeto.Value :=
          FieldCurrValue(qryConsultaPosExtraDetDC_MONTONETO);

        frmProcVentaRapida.rxVenta.Post;
      end;

      qryConsultaPosExtraDet.Next;
    end;

  finally
    frmProcVentaRapida.LlenandoDatos := LOldLlenandoDatos;
    frmProcVentaRapida.rxVenta.EnableControls;
    qryConsultaPosExtraDet.AfterOpen := LAfterOpen;
  end;

  if LSerieActiva > 0 then
  begin
    frmProcVentaRapida.SerieLineaActiva := LSerieActiva;
    frmProcVentaRapida.rxVenta.Locate('SERIE', LSerieActiva, []);
  end;
end;

procedure TdmCalculos.ActualizarValoresGlobalesPosExtraDet(
  numstr: Integer
);
var
  Qry: TIBSQL;
begin
  if numstr <= 0 then
    Exit;

  if not Assigned(frmProcVentaRapida) then
    Exit;

  Qry := TIBSQL.Create(nil);
  try
    Qry.Database := ibSqlDeletePosExtraDET.Database;
    Qry.Transaction := ibSqlDeletePosExtraDET.Transaction;

    if not Qry.Transaction.InTransaction then
      Qry.Transaction.StartTransaction;

    Qry.SQL.Text :=
      'UPDATE POS_EXTRA_DET ' +
      'SET T_RECARGO = :T_RECARGO, ' +
      '    T_PORCDESADICIONAL = :T_PORCDESADICIONAL, ' +
      '    T_PROPINA = :T_PROPINA, ' +
      '    T_MONTOINTERES = :T_MONTOINTERES, ' +
      '    T_MONTONCRAPLICADO = :T_MONTONCRAPLICADO, ' +
      '    T_DEVOLUCION = :T_DEVOLUCION ' +
      'WHERE NUMERO = :NUMERO ' +
      '  AND COD_USUARIO = :COD_USUARIO';

    Qry.ParamByName('NUMERO').AsInteger := numstr;
    Qry.ParamByName('COD_USUARIO').AsInteger := VarUsuarioGlb;

    Qry.ParamByName('T_RECARGO').AsCurrency :=
      FieldCurrValue(frmProcVentaRapida.TotalesRecargo);

    Qry.ParamByName('T_PORCDESADICIONAL').AsCurrency :=
      FieldCurrValue(frmProcVentaRapida.TotalesPorcDesAdicional);

    Qry.ParamByName('T_PROPINA').AsCurrency :=
      FieldCurrValue(frmProcVentaRapida.TotalesPropina);

    Qry.ParamByName('T_MONTOINTERES').AsCurrency :=
      FieldCurrValue(frmProcVentaRapida.TotalesMontoInteres);

    Qry.ParamByName('T_MONTONCRAPLICADO').AsCurrency :=
      FieldCurrValue(frmProcVentaRapida.TotalesMontoNCRAplicado);

    Qry.ParamByName('T_DEVOLUCION').AsCurrency :=
      FieldCurrValue(frmProcVentaRapida.TotalesDevolucion);

    Qry.ExecQuery;
    Qry.Transaction.CommitRetaining;

  except
    on E: Exception do
    begin
      if Qry.Transaction.InTransaction then
        Qry.Transaction.RollbackRetaining;

      raise;
    end;
  end;

  Qry.Free;
end;

function TdmCalculos.TieneDistribucionGlobalActiva: Boolean;
var
  VRecargo: Currency;
  VPorcDescGlobal: Currency;
begin
  Result := False;

  if not Assigned(frmProcVentaRapida) then
    Exit;

  VRecargo :=
    FieldCurrValue(frmProcVentaRapida.TotalesRecargo);

  VPorcDescGlobal :=
    FieldCurrValue(frmProcVentaRapida.TotalesPorcDesAdicional);

  Result :=
    (Abs(VRecargo) > 0) or
    (Abs(VPorcDescGlobal) > 0);
end;

procedure TdmCalculos.MarcarCambioGlobal;
begin
  FCambioGlobalPendiente := True;
end;

end.
