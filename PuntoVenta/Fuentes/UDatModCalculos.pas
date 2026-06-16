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

    procedure Pos_UpdateTotales(numstr:integer);
    function VtaExiste(num:integer;serie:integer;coduser:integer) : Boolean;
    function VtaExisteExtra(num:integer;serie:integer;coduser:integer) : Boolean;
    function GlbNumPosExiste(num:integer):Boolean;
    procedure ProcSetPorcDescValor(numstr:integer);
    procedure NotificaErrorByEmail(sms:string);
    procedure LogProcedureCalc(const ProcName: string);
  end;

var
  dmCalculos: TdmCalculos;

implementation
    uses uglobal, UDatModFactura, UDatmodDatosGenerales, UProcVentaRapida,
  UFormDatosCotiza, UDatModConectar, UDatModInventario, UFormLog,
  UDatModCompania;
{$R *.dfm}

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
  x, porItbi: Real;
  TC_MONTOITBISRECARGO_GLB : Real;

  Intentos: Integer;
begin
  FProcesandoCalculos:=frmProcVentaRapida.EnProcesoCalculo;
  if FProcesandoCalculos then
  Exit;
     FProcesandoCalculos := True;

  frmProcVentaRapida.EnProcesoCalculo := True;
  if (GlbNumVtaPOS < 0) then
  begin
    FProcesandoCalculos := False;
    exit;
  end;
  try
  LogProcedureCalc(
  Format(
    'Articulo=%d Cant=%.2f Precio=%.2f PorcDesc=%.2f MontoDesc=%.2f',
    [
      frmProcVentaRapida.rxVentaCodArticulo.Value,
      frmProcVentaRapida.rxVentaCant.Value,
      frmProcVentaRapida.rxVentaPrecio.Value,
      frmProcVentaRapida.rxVentaPorcDescItem.Value,
      frmProcVentaRapida.rxVentaMontoDescItem.Value
    ]
  )
);
  LogProcedureCalc('TdmCalculos.ProcesaCalculos INICIO');

  FProcesandoCalculos := True;
  frmProcVentaRapida.EnProcesoCalculo:= True;
  Intentos := 0;


    //repeat
      Inc(Intentos);
      FRecalculoPendiente := False;

      LogProcedureCalc('TdmCalculos.ProcesaCalculos INICIO PASADA ' + IntToStr(Intentos));


  if frmProcVentaRapida.ExistePosextraDetParaVenta(GlbNumVtaPOS) then
  begin
    dmcalculos.qryDatosItbPosExtra.Close;
    dmcalculos.qryDatosItbPosExtra.Params[0].Value := GlbNumVtaPOS;
    dmcalculos.qryDatosItbPosExtra.Open;dmcalculos.qryDatosItbPosExtra.sql.text
  end else
  begin
    FProcesandoCalculos := False;
    exit;
  end;

  rxError.Append;
  rxErrorNota.Value:= 'ProcesaCalculos;';
  rxError.Post;
  if rxErrorCont.Value = 11 then
  x:=0;

  if frmProcVentaRapida.qryInventario.state =dsInactive then
  frmProcVentaRapida.qryInventario.Open;

  begin
  with frmProcVentaRapida do
  begin
     if (rxVentaStatus.Value = 'C') then
     begin
       FProcesandoCalculos := False;
       Exit;
     end;
     if dmcalculos.qryDatosItbPosExtra.Locate('serie',frmProcVentaRapida.rxVentaSerie.value,[]) then
     TC_MONTOITBISRECARGO_GLB:=dmcalculos.qryDatosItbPosExtraTC_MONTOITBISRECARGO_GLB.Value
     else
     TC_MONTOITBISRECARGO_GLB:=0;
    //if (rxVentaStatus.Value = 'C') then Exit;
    rxVenta.AutoCalcFields:=False;

    if (frmProcVentaRapida.rxVentaCodArticulo.Value <> frmProcVentaRapida.qryInventarioCodigo.Value) then
    frmProcVentaRapida.qryInventario.Locate('CODIGO', frmProcVentaRapida.rxVentaCodArticulo.Value,[loCaseInsensitive]);

    if (frmProcVentaRapida.qryInventarioPAGA_ITBI.Value = 1) then
    GlbPagaITbis := True
    else
    GlbPagaITbis := False;

    if frmProcVentaRapida.chkNoLeyPropina.Checked then
    dmCalculos.CalcPropinaLegal := False
    else
    dmCalculos.CalcPropinaLegal:=True;

    if rxVenta.State In [dsBrowse] Then
    rxVenta.Edit;

  if rxVenta.State In [dsEdit, dsInsert] then
  begin
    if not TotalesMoneda.IsNull then
    frmProcVentaRapida.rxVentaMoneda.Value:= TotalesMoneda.Value;
    if frmProcVentaRapida.rxVentaCantPax.Value > 0 then
    rxVentaMontoBruto.Value:= (rxVentaCant.Value * frmProcVentaRapida.rxVentaPrecio.Value) *
    rxVentaCantPax.Value
    else
    frmProcVentaRapida.rxVentaMontoBruto.Value:= (rxVentaCant.Value * rxVentaPrecio.Value);
    frmProcVentaRapida.lblTasa.Visible := False;
    if not rxVentaMoneda.IsNull then
    begin
      if (rxVentaMonedaBase.Value <> rxVentaMoneda.Value) then
      if (not rxVentaMonedaBase.IsNull and (rxVentaMonedaBase.Value <> '')) then
      begin
        rxVentamonto_tasa.Value:= GlbMontoTasa(rxVentaMonedaBase.Value);
        frmProcVentaRapida.rxVentaMontoBruto.Value:= frmProcVentaRapida.rxVentaMontoBruto.Value * frmProcVentaRapida.rxVentamonto_tasa.Value;

        GlbMontoTasa(rxVentaMonedaBase.Value);
        frmProcVentaRapida.lblTasa.Caption:=Concat('1 = ',InsertarComa(FloatToStr(GlbMontoTasa(rxVentaMonedaBase.Value))));
        Totalestotalneto.DisplayFormat:=Concat(SimboloMoneda(TotalesMoneda.Value),',0.00');
        frmProcVentaRapida.lblTasa.Visible:=True;
      end;
    end;
    if EsDevolucion then
    frmProcVentaRapida.rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * -1;

    frmProcVentaRapida.rxVentaMontoDescItem.Value:= frmProcVentaRapida.rxVentaMontoBruto.Value * frmProcVentaRapida.rxVentaPorcDescItem.Value / 100;

    porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);
    rxVentaIDTasaITBIS.Value := GlbIDTasa;

    if GlbIgI = 0 then
    begin
      porItbi := 0;
      PORC_TRANSP_ITBIS := 0;

      rxVentaitbi.Value := 0;
      rxVentaMontoItbisRecargo.Value := 0;
      rxVentaMontoItbRecItmConDesc.Value := 0;
      rxVentaDC_ITBIS_CLD.Value := 0;
      rxVentaTC_MONTOITBISRECARGO_GLB.Value := 0;
      rxVentaTC_MONTOITBISRECARGO_ITM.Value := 0;
    end else
    begin
      //se calcula en otro lugar?
      //t frmProcVentaRapida.rxVentaitbi.Value := frmProcVentaRapida.rxVentaMontoNeto.Value * porItbi / 100;
    end;

    if (GlbIgI = 1) and ((UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') //or (CheckBox1.Checked = false)
    )
    and (GlbCalcItbis = 0) then
    rxVentaIDTasaITBIS.Value := 1;

    if chkExentoChecked  then
    begin
      porItbi := 0;
      rxVentaItbisExento.Value := 1;
    end else
    rxVentaItbisExento.Value:=0;

    if Not EsDevolucion then
    rxVentaPorc_Desc.Value := frmProcVentaRapida.qryInventarioPORC_DESCUENTO.Value;
    
    if not GLBEsFastFood and (GlbTransparentaITBI = 1) then
    PORC_TRANSP_ITBIS := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value)/
                       (1+FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value)/100)
    else
    PORC_TRANSP_ITBIS := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value);

    rxVentaIDTasaITBIS.Value := GlbIDTasa;
    if (GlbIgI = 1) and ((UpperCase(GLBFormatoFactura) = 'FORMAFACOCO') //or (CheckBox1.Checked = false)
    )
    and (GlbCalcItbis = 0) then
    rxVentaIDTasaITBIS.Value := 1;

    //if (GlbTransparentaITBI = 1) then
    porItbi := PORC_TRANSP_ITBIS;

    if (rxVentaItbisExento.Value = 1) and (GlbActivaIFiscal = 0) then
    begin
      porItbi:=0;
      PORC_TRANSP_ITBIS:=0;
    end;
    
    //Transparentar el ITBIS
    if (frmProcVentaRapida.qryInventarioPAGA_ITBI.Value = 1) And
       ((rxVentaPorc_Desc.Value = 0) Or rxVentaPorc_Desc.IsNull ) And
       (GlbTransparentaITBI = 1) And
       (Not chkExentoChecked) Then
    rxVentaPorc_Desc.Value := PORC_TRANSP_ITBIS;
    //End transparentar itbis

    if frmProcVentaRapida.rxVentaPorcDescItem.Value > 0 then
    rxVentaMontoDescuento.Value := ((rxVentaMontoBruto.Value
    -(frmProcVentaRapida.rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value/100)) * rxVentaporc_desc.Value/100)
    else rxVentaMontoDescuento.Value := 0;

    frmProcVentaRapida.rxVentaMontoNeto.Value := frmProcVentaRapida.rxVentaMontoBruto.Value -
    (rxVentaMontoBruto.Value * (TotalesPorcDesAdicional.Value/100)) -
    (rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value/100);

    if not GlbPagaITbis then
    porItbi:=0;

    frmProcVentaRapida.rxVentaitbi.Value := (frmProcVentaRapida.rxVentaMontoNeto.Value * porItbi / 100);

    rxVentaMontoDesGlobal.Value := frmProcVentaRapida.rxVentaMontoBruto.Value * (frmProcVentaRapida.TotalesPorcDesAdicional.Value / 100);

    if chkExentoChecked then
    begin
      porItbi := 0;
      rxVentaItbisExento.Value := 1;
      rxVentaitbi.Value := 0;
    end;

    if not GlbUsandoCotiza And not GlbPagaITbis then
    rxVentaitbi.Value:=0;

    if (frmProcVentaRapida.qryInventarioPAGA_ITBI.Value = 1) And (Not chkExentoChecked) and
      (not GlbUsandoCotiza or ( rxVentaStatus.Value = 'I') or (rxVentaitbi.Value = 0) )  then
    begin
      frmProcVentaRapida.rxVentaitbi.Value := (frmProcVentaRapida.rxVentaMontoNeto.Value * porItbi / 100)
    end else
    if PrecioCambio then
    begin
      frmProcVentaRapida.rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);
    end;

    //Refactorizando calculo de ITBIS
    //t if (GlbIgI = 1) and ((UpperCase(GLBFormatoFactura) = 'FORMAFACOCO')
    //t or (CheckBox1.Checked = false))
    //t and (GlbCalcItbis = 0) then
    //t rxVentaitbi.Value := 0;

    rxVentaMontoItbisRecargo.Value:= 0;
    precioSum := frmProcVentaRapida.TotalesSubTotal.Value - FMontoDescNivelItem;

   rxVentaMontoDescGlbDist.Value:= 0;
   if (TotalesPorcDesAdicional.Value > 0) And (Abs(TotalesMontoDescAdicional.Value) > 0) and (Abs(precioSum) > 0) then
   begin
     rxVentaMontoDescGlbDist.Value:= ((rxVentaMontoBruto.Value / precioSum) * (TotalesMontoDescAdicional.Value)) * porItbi / 100;
     if (rxVentaTipoVenta.Value = 2 ) then
     rxVentaMontoDescGlbDist.Value := rxVentaMontoDescGlbDist.Value * -1;
   end;
    if (frmProcVentaRapida.TotalesRecargo.Value > 0) And (Abs(precioSum) > 0) then
    begin
      if (frmProcVentaRapida.rxVentaTipoVenta.Value = 2) Or  (frmProcVentaRapida.rxVentaPorcDescItem.Value > 0 ) then
      begin
        if TC_MONTOITBISRECARGO_GLB  > 0 then
        rxVentaMontoItbisRecargo.Value:=TC_MONTOITBISRECARGO_GLB
        else
        begin
          if (rxVentaPorcDescItem.Value > 0) then
            rxVentaMontoItbisRecargo.Value:= (((rxVentaMontoBruto.Value)/ precioSum) * (TotalesRecargo.Value)) * porItbi / 100
          else
          rxVentaMontoItbisRecargo.Value:= ((rxVentaMontoBruto.Value / precioSum) * (TotalesRecargo.Value*-1)) * porItbi / 100;
        end;
        
        if (rxVentaTipoVenta.Value = 2) then
        rxVentaRecargo.Value := (rxVentaMontoBruto.Value / precioSum) * TotalesRecargo.Value*-1
        else
        rxVentaRecargo.Value := (rxVentaMontoBruto.Value / precioSum) * TotalesRecargo.Value;

        if (rxVentaPorcDescItem.Value > 0 ) then
        rxVentaMontoItbRecItmConDesc.Value:=
        (((rxVentaMontoBruto.Value * rxVentaPorcDescItem.Value/100)/ precioSum) * frmProcVentaRapida.TotalesRecargo.Value*-1)* porItbi / 100;

      end else
      begin
        if TC_MONTOITBISRECARGO_GLB  > 0 then
        rxVentaMontoItbisRecargo.Value:=TC_MONTOITBISRECARGO_GLB
        else
        frmProcVentaRapida.rxVentaMontoItbisRecargo.Value:= ((frmProcVentaRapida.rxVentaMontoBruto.Value / precioSum) * (frmProcVentaRapida.TotalesRecargo.Value)) * porItbi / 100;
        frmProcVentaRapida.rxVentaRecargo.Value := (frmProcVentaRapida.rxVentaPrecio.Value / precioSum) * frmProcVentaRapida.TotalesRecargo.Value;

      end;
    end;

    //J60 = Porciento ITBIS =  18%
    //L60 = Precio          = 100
    //N60 = Monto Descuento =  10  = =+((L60)*$N$58)/100
    //O60 = Monto Recargo   =  =+(L60/L$66)*$O$67
    
    //Monto ITBIS =(J60/(1+J60/100)*(L60+O60-N60))/100
    if (EsDevolucion) then
    begin
      rxVentaMontoItbisRecargo.Value:=rxVentaMontoItbisRecargo.Value * -1;
      if rxVentaRecargo.Value > 0 then
      rxVentaRecargo.Value:=rxVentaRecargo.Value * -1
    end;
    if GlbTransparentaITBI = 0 then
    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value + rxVentaMontoItbisRecargo.Value;
    //rxVenta.Post;

    //rxVenta.Next;
    end;
    //if rxVenta.State in [dsedit, dsInsert] then
    //rxVenta.Post;

  if (EsModificandoCotiza) and (Assigned(frmCotizaciones))
  and (frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value  > 0) then
  begin
    frmProcVentaRapida.Totales.edit;
    frmProcVentaRapida.TotalesPorcDesAdicional.Value :=
    frmCotizaciones.ibqryCotizacionMasterPORC_DESCUENTO.Value;
    if frmProcVentaRapida.Totales.State = dsEdit then
    frmProcVentaRapida.Totales.Post;
    if frmProcVentaRapida.TotalesPorcDesAdicional.Value > 0 then
    chKDescuentoGlobalChecked := True else
    chKDescuentoGlobalChecked := False;
  end;
  if frmProcVentaRapida.Totales.State = dsBrowse then
  frmProcVentaRapida.Totales.edit;

  if frmProcVentaRapida.TotalesMoneda.IsNull then
  frmProcVentaRapida.TotalesMoneda.Value   := '1';


  if not TotalesTipoNCFIFiscal.IsNull then
  if Pos('EXONERA',UpperCase(dmFactura.ibQryViewNCFDESCRIPCION.Value)) > 0 then
  begin
      frmProcVentaRapida.label29.Caption := 'ITBIS Exonerado';
      frmProcVentaRapida.label29.Visible := True;
      frmProcVentaRapida.dbTextMontoExoneraITBIS.Visible := True;
      frmProcVentaRapida.dbTextMontoExoneraITBIs.BringToFront;
      frmProcVentaRapida.TotalesMontoExoneraITBIS.Value:= Totalesitbis.Value;
  end;

  frmProcVentaRapida.TotalesMontoDescAdicional.Value:= (frmProcVentaRapida.TotalesSubTotal.Value * frmProcVentaRapida.TotalesPorcDesAdicional.Value / 100);
  if (frmProcVentaRapida.TotalesPorcDesAdicional.Value > 0) then
  begin
    frmProcVentaRapida.Totales.Edit;
    frmProcVentaRapida.TotalesMontoDescAdicional.Value:=
    (frmProcVentaRapida.TotalesSubTotal.Value * frmProcVentaRapida.TotalesPorcDesAdicional.Value / 100);
    frmProcVentaRapida.Totales.Post;
    if frmProcVentaRapida.rxVenta.State = dsBrowse then
    frmProcVentaRapida.rxVenta.Edit;

    if chkExentoChecked then
    begin
      porItbi := 0;
      frmProcVentaRapida.rxVentaItbisExento.Value := 1;
    end;
    //rxVenta.Post;
  end;

  if EsModificandoCotiza And (Assigned(frmCotizaciones)) then
  begin
    frmProcVentaRapida.Totales.Edit;
    frmProcVentaRapida.TotalesComentario.Value:= frmCotizaciones.ibqryCotizacionMasterCOMENTARIO.Value;
    frmProcVentaRapida.TotalesFechaCotizacion.Value:= frmCotizaciones.ibqryCotizacionMasterFECHA.Value;
    frmProcVentaRapida.TotalesReferenciaCte.Value  :=frmCotizaciones.ibqryCotizacionMasterREFERENCIACTE.Value;
    frmProcVentaRapida.Totales.Post;
  end;

  frmProcVentaRapida.Enabled:=True;
  rxVenta.AutoCalcFields := False;
  procCalc:=False;
  GlbCalculado:=True;
  end;
  avoidLoop:=True;
  procCalc:=False;
  GlbCalculado:=True;  
  frmProcVentaRapida.rxVenta.EnableControls;
  frmProcVentaRapida.RxDBGrid1.EnableScroll;
  frmProcVentaRapida.RxDBGrid2.EnableScroll;
  end;
  LogProcedureCalc('TdmCalculos.ProcesaCalculos FIN PASADA ' + IntToStr(Intentos));

      {
        Protección anti-loop.
        Si durante el cálculo se dispararon 20 eventos, no corremos 20 veces.
        Solo hacemos una pasada adicional.
      }

    //until (not FRecalculoPendiente) or (Intentos >= 2);

    if FRecalculoPendiente then
    begin
      LogProcedureCalc('TdmCalculos.ProcesaCalculos QUEDO PENDIENTE PERO SE CORTA POR SEGURIDAD');
      FRecalculoPendiente := False;
    end;
    //Persistir espejo de detalle.
    ProcInsertUpdatePosExtraDet(GlbNumVtaPOS);

    //Actualizar totales.
    Pos_UpdateTotales(GlbNumVtaPOS);

  finally
    FProcesandoCalculos := False;
    frmProcVentaRapida.EnProcesoCalculo:=False;
    LogProcedureCalc('TdmCalculos.ProcesaCalculos FIN');
    if frmProcVentaRapida.rxVenta.State in [dsEdit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;
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
  procedure procDatosExtra;
  var
    existe : boolean;
  begin
    if numstr > 0 then
    begin
      qryPosExtraDet.Close;
      qryPosExtraDet.Params[0].Value:=numstr;
      qryPosExtraDet.Open;
      qryPosExtraDet.first;
    end else
    begin
      numstr:=GetRandomNumber(VarUsuarioGlb);
      GlbNumVtaPOS:=numstr;
      qryPosExtraDet.Close;
      qryPosExtraDet.Params[0].Value:=numstr;
      qryPosExtraDet.Open;
      qryPosExtraDet.first;
    end;
    if qryPosExtraDet.State = dsBrowse then
    begin
      if qryPosExtraDet.Locate('numero;Serie;cod_usuario',
      VarArrayOf([GlbNumVtaPOS,frmProcVentaRapida.rxVentaSerie.Value,VarUsuarioGlb]),[]) then
      Existe:=True
      else Existe:=False;
    end else Existe:=True;

    if not Existe then
    Existe:= VtaExisteExtra(GlbNumVtaPOS,frmProcVentaRapida.rxVentaSerie.Value,VarUsuarioGlb);

    if Existe then
      begin
      qryPosExtraDet.Edit;
      qryPosExtraDetD_MONEDA.Value      := frmProcVentaRapida.rxVentaMoneda.Value;
      qryPosExtraDetFECHA_COTIZA.Value :=  ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value);
      qryPosExtraDetNUMERO_COTIZA.Value :=  frmProcVentaRapida.rxVentaNumeroCotiza.Value;
      qryPosExtraDetD_CODIGO_PROD.Value := frmProcVentaRapida.rxVentaCodArticulo.Value;
      qryPosExtraDetD_CANT.Value   := frmProcVentaRapida.rxVentaCant.Value;
      qryPosExtraDetCODTEXTO.Value   := frmProcVentaRapida.rxVentacodtexto.Value;
      qryPosExtraDetD_MONEDA.Value :=frmProcVentaRapida.rxVentaMoneda.Value;
      qryPosExtraDetD_TIPO_UNIDAD.value :=frmProcVentaRapida.rxVentaTipoUnidad.Value;
      qryPosExtraDetD_Tipo_venta.value  :=frmProcVentaRapida.rxVentaTipoVenta.Value;
      qryPosExtraDetLEVEL_PRECIO_VENT.Value:=frmProcVentaRapida.rxVentaLevelPrecio.Value;
      //if (frmProcVentaRapida.TotalesMoneda.Value = '1') then
      if (GlbMonedaBase = 1) then //RD$, DOM
      qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value * frmProcVentaRapida.rxVentamonto_tasa.Value
      else
      qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value;

      if (GlbIgI = 1) and (GlbCalcItbis = 0) then
      qryPosExtraDetD_TASA_ITBIS.Value  := 0
      else
      qryPosExtraDetD_TASA_ITBIS.Value  := GlbPorcItbis;//frmProcVentaRapida.rxVentaporc_desc.Value;

      //qryPosExtraDetD_TASA_ITBIS.Value  := GlbPorcItbis;// frmProcVentaRapida.rxVentaporc_desc.Value;
      qryPosExtraDetD_PORCDESCITEM.Value:= frmProcVentaRapida.rxVentaPorcDescItem.Value;

      if GLBEsFastFood then
      qryPosExtraDetD_TRANSPITBIS.Value  := 0
      else
      qryPosExtraDetD_TRANSPITBIS.Value  := 1;
      if (GlbTransparentaITBI = 0) then
      qryPosExtraDetD_TRANSPITBIS.Value:=0;

      qryPosExtraDetT_PORCDESADICIONAL.Value := frmProcVentaRapida.TotalesPorcDesAdicional.Value;
      qryPosExtraDetT_RECARGO.Value := frmProcVentaRapida.TotalesRecargo.Value;
      qryPosExtraDetT_PROPINA.Value := frmProcVentaRapida.TotalesPropina.Value;
      qryPosExtraDetT_MONTOINTERES.Value     := frmProcVentaRapida.TotalesMontoInteres.Value;
      qryPosExtraDetT_MONTONCRAPLICADO.Value := frmProcVentaRapida.TotalesMontoNCRAplicado.Value;
      //qryPosExtraDetT_DEVOLUCION
      qryPosExtraDetTC_TOTALNETO.Value := frmProcVentaRapida.Totalestotalneto.Value;
      //qryPosExtraDetTC_ITBIS.Value := Totales
      end else
      begin
      if (frmProcVentaRapida.rxVentaStatus.Value <> 'C') then
      begin
      qryPosExtraDet.Append;
      qryPosExtraDetSERIE.Value :=  frmProcVentaRapida.rxVentaSerie.Value;
      qryPosExtraDetNUMERO.Value:= numstr;
      qryPosExtraDetCOD_USUARIO.Value:= VarUsuarioGlb;
      GlbNumVtaPOS:= qryPosExtraDetNUMERO.Value;
      qryPosExtraDet.Params[0].Value:=GlbNumVtaPOS;
      qryPosExtraDetFECHA.Value :=  ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value);
      qryPosExtraDetFECHA_COTIZA.Value :=  ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value);
      qryPosExtraDetNUMERO_COTIZA.Value :=  frmProcVentaRapida.rxVentaNumeroCotiza.Value;
      qryPosExtraDetCODTEXTO.Value      := frmProcVentaRapida.rxVentacodtexto.Value;
      qryPosExtraDetD_MONEDA.Value      := frmProcVentaRapida.rxVentaMoneda.Value;
      qryPosExtraDetD_Tipo_venta.value  :=frmProcVentaRapida.rxVentaTipoVenta.Value;
      qryPosExtraDetD_TIPO_UNIDAD.value :=frmProcVentaRapida.rxVentaTipoUnidad.Value;
      qryPosExtraDetD_CODIGO_PROD.Value := frmProcVentaRapida.rxVentaCodArticulo.Value;
      qryPosExtraDetD_CANT.Value   := frmProcVentaRapida.rxVentaCant.Value;

      //qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value * frmProcVentaRapida.rxVentamonto_tasa.Value;
      if (GlbMonedaBase = 1) then //RD$, DOM
      qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value * frmProcVentaRapida.rxVentamonto_tasa.Value
      else
      qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value;

      if GLBEsFastFood then
      qryPosExtraDetD_TRANSPITBIS.Value  := 0
      else
      qryPosExtraDetD_TRANSPITBIS.Value  := 1;

      if (GlbIgI = 1) and (GlbCalcItbis = 0) then
      qryPosExtraDetD_TASA_ITBIS.Value  := 0
      else
      qryPosExtraDetD_TASA_ITBIS.Value  := GlbPorcItbis;//frmProcVentaRapida.rxVentaporc_desc.Value;

      qryPosExtraDetD_PORCDESCITEM.Value:= frmProcVentaRapida.rxVentaPorcDescItem.Value;
      qryPosExtraDetT_PORCDESADICIONAL.Value := frmProcVentaRapida.TotalesPorcDesAdicional.Value;
      qryPosExtraDetT_RECARGO.Value := frmProcVentaRapida.TotalesRecargo.Value;
      qryPosExtraDetT_PROPINA.Value := frmProcVentaRapida.TotalesPropina.Value;
      qryPosExtraDetT_MONTOINTERES.Value     := frmProcVentaRapida.TotalesMontoInteres.Value;
      qryPosExtraDetT_MONTONCRAPLICADO.Value := frmProcVentaRapida.TotalesMontoNCRAplicado.Value;

      //qryPosExtraDet
      //qryPosExtraDetT_DEVOLUCION

      if (GlbTransparentaITBI = 0) then
      qryPosExtraDetD_TRANSPITBIS.Value:=0;

      qryPosExtraDetTC_TOTALNETO.Value := frmProcVentaRapida.Totalestotalneto.Value;

      end;
      try
        GlbSalvarQuery(qryPosExtraDet);
      except
       on E : Exception do
       begin
       frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,
       E.ClassName+' : '+E.Message + ''#13#10''+
        'Error insertando record en Pos_extra_Det','UDatModCalculos');

      NotificaErrorByEmail(
      E.ClassName+' : '+E.Message + ''#13#10''+
        'Error insertando record en Pos_extra_Det UDatModCalculos');
      end;
      end;
      if GlbNumPosExiste(GlbNumVtaPOS) then
      begin
        frmLogError.CurrenLN:=706;
        frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,
        'Record Agregado a pos_extra_det','UDatModCalculos');
      end;
      end;
      try
        GlbSalvarQuery(qryPosExtraDet);
      except
      end;
  GlbExtraUpdate:=True;
  end;

begin
  frmLogError.Marca:=11; frmLogError.CurrenLN:=713;
  frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Antes dmCalculos.ProcesaCalculos;','UDatModCalculos');
  if not GlbCalculado then
  begin
    LogProcedureCalc('CALL ProcesaCalculos TdmCalculos.ProcInsertUpdatePosExtraDet(numstr: integer);');
    frmProcVentaRapida.EnProcesoCalculo:=False;
    dmCalculos.ProcesaCalculos;
  end;
  frmLogError.Marca:=22; frmLogError.CurrenLN:=713;
  frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Despues dmCalculos.ProcesaCalculos;','UDatModCalculos');


  if (frmProcVentaRapida.rxVentaStatus.Value = 'C') and
  (frmProcVentaRapida.rxVenta.RecordCount = 1) then
  begin
    //frmProcVentaRapida.totales.Close;
    frmProcVentaRapida.totales.EmptyTable;
    frmProcVentaRapida.totales.Append;

    if (GlbMonedaBase > 0) then
    frmProcVentaRapida.TotalesMoneda.Value   := IntToStr(GlbMonedaBase)
    else
    frmProcVentaRapida.TotalesMoneda.Value   := '1';

    frmProcVentaRapida.TotalesSubTotal.Value := 0;
    frmProcVentaRapida.Totalesitbis.Value    := 0;
    frmProcVentaRapida.Totalesmontodesc.Value:= 0;
    frmProcVentaRapida.Totalestotalneto.Value:= 0;
    frmProcVentaRapida.Totalesmontorecibido.Value:=0;
    frmProcVentaRapida.Totalesdevolucion.Value   :=0;
    frmProcVentaRapida.Totales.Post;
    Exit;
  end;
  if frmProcVentaRapida.rxVentaCodArticulo.IsNull then exit;
  if frmProcVentaRapida.rxVentaPrecio.IsNull then exit;
  if frmProcVentaRapida.rxVentaMoneda.IsNull then exit;

  if qryPosExtraDet.State = dsInactive then
  begin
    //with frmProcVentaRapida do
    begin
    if numstr > 0 then
    begin
      qryPosExtraDet.Close;
      qryPosExtraDet.Params[0].Value:=numstr;
      qryPosExtraDet.Open;
    end else
    begin
      numstr:=GetRandomNumber(VarUsuarioGlb);
      qryPosExtraDet.Close;
      qryPosExtraDet.Params[0].Value:=numstr;
      qryPosExtraDet.Open;
    end;
    //qryPosExtraDet.Open;
    qryPosExtraDet.First;
    if qryPosExtraDet.RecordCount = 0 then
    begin
      if (frmProcVentaRapida.rxVentaStatus.Value = 'C') then
      begin
      qryPosExtraDet.Append;
      qryPosExtraDetSERIE.Value :=  frmProcVentaRapida.rxVentaSerie.Value;
      qryPosExtraDetCOD_USUARIO.Value:= VarUsuarioGlb;
      qryPosExtraDetNUMERO.Value:= numstr;
      GlbNumVtaPOS:= qryPosExtraDetNUMERO.Value;
      qryPosExtraDet.Params[0].Value:=GlbNumVtaPOS;
      qryPosExtraDetFECHA.Value :=  ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value);
      qryPosExtraDetFECHA_COTIZA.Value :=  ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value);
      qryPosExtraDetNUMERO_COTIZA.Value:= frmProcVentaRapida.rxVentaNumeroCotiza.Value;
      qryPosExtraDetD_Tipo_venta.value :=frmProcVentaRapida.rxVentaTipoVenta.Value;
      qryPosExtraDetD_MONEDA.Value     :=frmProcVentaRapida.rxVentaMoneda.Value;
      qryPosExtraDetD_CODIGO_PROD.Value:= frmProcVentaRapida.rxVentaCodArticulo.Value;
      qryPosExtraDetD_TIPO_UNIDAD.value:=frmProcVentaRapida.rxVentaTipoUnidad.Value;
      qryPosExtraDetCODTEXTO.Value     := frmProcVentaRapida.rxVentacodtexto.Value;
      qryPosExtraDetD_CANT.Value       := frmProcVentaRapida.rxVentaCant.Value;
      qryPosExtraDetLEVEL_PRECIO_VENT.Value:=frmProcVentaRapida.rxVentaLevelPrecio.Value;      
      //qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value * frmProcVentaRapida.rxVentamonto_tasa.Value;
      if (GlbMonedaBase = 1) then //RD$, DOM
      qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value * frmProcVentaRapida.rxVentamonto_tasa.Value
      else
      qryPosExtraDetD_PRECIO.Value := frmProcVentaRapida.rxVentaPrecio.Value;

      if GLBEsFastFood then
      qryPosExtraDetD_TRANSPITBIS.Value := 0
      else
      qryPosExtraDetD_TRANSPITBIS.Value := 1;

      if (GlbTransparentaITBI = 0) then
      qryPosExtraDetD_TRANSPITBIS.Value:=0;


      if (GlbIgI = 1) and (GlbCalcItbis = 0) then
      qryPosExtraDetD_TASA_ITBIS.Value  := 0 //no cobrar itbis
      else
      qryPosExtraDetD_TASA_ITBIS.Value  := GlbPorcItbis;//frmProcVentaRapida.rxVentaporc_desc.Value;

      //qryPosExtraDetD_TASA_ITBIS.Value  := GlbPorcItbis;//frmProcVentaRapida.rxVentaporc_desc.Value;
      qryPosExtraDetD_PORCDESCITEM.Value:= frmProcVentaRapida.rxVentaPorcDescItem.Value;
      qryPosExtraDetT_PORCDESADICIONAL.Value := frmProcVentaRapida.TotalesPorcDesAdicional.Value;
      qryPosExtraDetT_RECARGO.Value := frmProcVentaRapida.TotalesRecargo.Value;
      qryPosExtraDetT_PROPINA.Value := frmProcVentaRapida.TotalesPropina.Value;
      qryPosExtraDetT_MONTOINTERES.Value := frmProcVentaRapida.TotalesMontoInteres.Value;
      qryPosExtraDetT_MONTONCRAPLICADO.Value := frmProcVentaRapida.TotalesMontoNCRAplicado.Value;
      //qryPosExtraDetT_DEVOLUCION
      qryPosExtraDetTC_TOTALNETO.Value  := frmProcVentaRapida.Totalestotalneto.Value;

      //qryPosExtraDetTC_ITBIS.Value := Totales
      try
        GlbSalvarQuery(qryPosExtraDet);
      except
      end;
      GlbExtraUpdate:=True;
      if GlbNumPosExiste(GlbNumVtaPOS) then
      begin
        frmLogError.CurrenLN:=781;
        frmLogError.LogSteps(GlbNumVtaPOS,0,Now,Now,
        'Record Agregado a pos_extra_det','UDatModCalculos');
      end;
      frmProcVentaRapida.Totales.Tag := 601;//no permitas guardar
      end;
    end else
    begin
      procDatosExtra; 
      GlbExtraUpdate:=True;
    end;
    end;
  end else
  procDatosExtra;
  if frmProcVentaRapida.LlenandoDatos or (EsModificandoCotiza  and glbCalculado and GlbAlreadyCld) then Exit;
  qryConsultaPosExtraDet.Close;
  qryConsultaPosExtraDet.SQL.Clear;
  qryConsultaPosExtraDet.SQL.Add('SELECT * from proc_posConsExtraDet(:numerostr, :coduser,:numcotiza)');
  if not qryConsultaPosExtraDet.Prepared then
  qryConsultaPosExtraDet.Prepare;


  if (numstr > 0) then
  qryConsultaPosExtraDet.Params[0].Value := numstr
  else
  begin
    qryConsultaPosExtraDet.Params[0].Value:=0;
    qryConsultaPosExtraDet.Params[1].Value := GlbNumVtaPOS;
  end;
  qryConsultaPosExtraDet.Params[2].Value := VarUsuarioGlb;//qryConsultaPosExtraDet.sql.text

  qryGetSumVtaExtra.Close;
  qryGetSumVtaExtra.Params[0].Value := GlbNumVtaPOS;
  qryGetSumVtaExtra.Open;
  if not qryGetSumVtaExtra.Transaction.InTransaction then
  qryGetSumVtaExtra.Transaction.StartTransaction;
  try
    qryGetSumVtaExtra.Transaction.CommitRetaining;
  except
  qryGetSumVtaExtra.Transaction.Rollback;
  end;
  //inicio nuevo
  frmProcVentaRapida.Totales.Tag := 601;//no permitas guardar
  frmProcVentaRapida.Totales.Edit; //qryGetSumVtaExtra.sql.text
  frmProcVentaRapida.TotalesRecargo.Value           := qryGetSumVtaExtraT_RECARGO.Value;
  //t chequea a ver frmProcVentaRapida.TotalesPorcDesAdicional.Value  := qryGetSumVtaExtraT_PORCDESADICIONAL.Value;
  if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoDescAdicional.Value:=qryGetSumVtaExtraTC_MONTODESCGLOBAL.Value;
    if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesPropina.Value := qryGetSumVtaExtraT_PROPINA.Value;
    if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoInteres.Value  := qryGetSumVtaExtraT_MONTOINTERES.Value;
    if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoDescItems.Value:= qryGetSumVtaExtraTC_MONTODESCITEMS.Value;
  if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
   frmProcVentaRapida.TotalesPropinaLegal.Value     :=qryGetSumVtaExtraDC_PROPINALEGAL.Value;
     if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoDescAdicional.Value:=qryGetSumVtaExtraTC_MONTODESCADICIONAL.Value;

    if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.TotalesMontoDescItems.Value    :=qryGetSumVtaExtraTC_FMONTODESCNIVELITEM.Value;

  if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;
  frmProcVentaRapida.Totalesitbis.Value := qryGetSumVtaExtraTOTAL_ITBIS.Value;

  if (GlbIgI = 1) and (GlbCalcItbis = 0) then
  frmProcVentaRapida.Totalesitbis.Value:=0;//qryGetSumVtaExtra.params[2].value

  if frmProcVentaRapida.Totales.state = dsBrowse then frmProcVentaRapida.Totales.Edit;

  frmProcVentaRapida.TotalesSubTotal.Value:=qryGetSumVtaExtraTC_SUBTOTAL.Value;

  if (GlbMSubTotalSinITBIS = 1) and (GlbActivaIFiscal = 0) and (Not GLBEsFastFood) then
  frmProcVentaRapida.TotalesSubTotal.Value:=
  frmProcVentaRapida.TotalesSubTotal.Value - frmProcVentaRapida.Totalesitbis.Value;

  if (GlbActivaIFiscal = 1) or (GlbActivaECF = 1) or (GlbMSubTotalSinITBIS = 1) then
  frmProcVentaRapida.TotalesSubTotalScreen.Value:=qryGetSumVtaExtraTC_SUBTOTAL.Value
  else
  if (GlbMSubTotalSinITBIS = 0) then
  frmProcVentaRapida.TotalesSubTotalScreen.Value:=Abs(qryValorVtaMONTOBRUTO.Value);
  //Fin nuevo

  frmProcVentaRapida.Totales.Post;
  frmProcVentaRapida.Totales.Tag := 0;
  frmProcVentaRapida.Totales.First;
  dmCalculos.tmpValorTotal := frmProcVentaRapida.Totalestotalneto.Value;
  dmCalculos.tmpValorItbis := frmProcVentaRapida.Totalesitbis.Value;

  GlbCalculado  :=True;
  avoidLoopExtra:=True;
  GlbExtraUpdate:=True;
end;


procedure TdmCalculos.ProcDelRecPosExtraDet(serietrn: integer);
begin
  ibSqlDelCurrrentRPosExtraDET.Params[0].Value:= VarUsuarioGlb;
  ibSqlDelCurrrentRPosExtraDET.Params[1].Value:= serietrn;
  ibSqlDelCurrrentRPosExtraDET.Params[2].Value:= GlbNumVtaPOS;
  ibSqlDelCurrrentRPosExtraDET.ExecQuery;//ibSqlDelCurrrentRPosExtraDET.sql.text
  if not ibSqlDelCurrrentRPosExtraDET.Transaction.InTransaction then
  ibSqlDelCurrrentRPosExtraDET.Transaction.StartTransaction;

  try
    ibSqlDelCurrrentRPosExtraDET.Transaction.CommitRetaining;
  except
  ibSqlDelCurrrentRPosExtraDET.Transaction.RollbackRetaining;
  end;
  dmcalculos.EsBorrandoRecord:=True;
  

  Pos_UpdateTotales(GlbNumVtaPOS);


  dmcalculos.EsBorrandoRecord:=False;
end;

procedure TdmCalculos.ProcDeletePosExtraDet(numstr: integer);
begin
  if not Assigned(frmProcVentaRapida) then exit;
  if dmCalculos.qryPosExtraDet.state = dsBrowse then
  begin
    dmCalculos.qryPosExtraDet.First;
    while not dmCalculos.qryPosExtraDet.eof do
    begin
      dmCalculos.qryPosExtraDet.Delete;
      GlbSalvarQuery(dmCalculos.qryPosExtraDet);
    end;
  end;
  ibSqlDeletePosExtraDET.Params[0].Value:= VarUsuarioGlb;
  ibSqlDeletePosExtraDET.Params[1].Value:= numstr;
  ibSqlDeletePosExtraDET.ExecQuery;
  if not ibSqlDeletePosExtraDET.Transaction.InTransaction then
  ibSqlDeletePosExtraDET.Transaction.StartTransaction;

  try
    ibSqlDeletePosExtraDET.Transaction.CommitRetaining;
  except
  ibSqlDeletePosExtraDET.Transaction.RollbackRetaining;
  end;
  dmcalculos.EsBorrandoRecord:=True;
  qryConsultaPosExtraDet.Close;
  if (qryConsultaPosExtraDet.SQL.Text = '') then
  begin
    qryConsultaPosExtraDet.SQL.Add('SELECT * from proc_posConsExtraDet(:numerostr, :coduser,:numcotiza)');
    if not qryConsultaPosExtraDet.Prepared then
    qryConsultaPosExtraDet.Prepare;
  end;
  if datCambio then
  //t experimento qryConsultaPosExtraDet.Open;
  if (qryConsultaPosExtraDetNumero.Value <> numstr) OR (frmProcVentaRapida.rxVentaStatus.value= 'C') then
  begin
    qryConsultaPosExtraDet.Close;//qryConsultaPosExtraDet.Sql.Text
    qryConsultaPosExtraDet.Params[0].Value := numstr;
    qryConsultaPosExtraDet.Params[1].Value := -1;
    qryConsultaPosExtraDet.Params[2].Value := -1;
    qryConsultaPosExtraDet.Open;

  end;
  if (frmProcVentaRapida.rxVenta.recordCount > 0) then
  begin
    qryGetSumVtaExtra.close;
    qryGetSumVtaExtra.Open;
  if not qryGetSumVtaExtra.Transaction.InTransaction then
  qryGetSumVtaExtra.Transaction.StartTransaction;
  try
    qryGetSumVtaExtra.Transaction.CommitRetaining;
  except
  qryGetSumVtaExtra.Transaction.Rollback;                    
  end;    
  if frmProcVentaRapida.Totales.State in [dsBrowse] then
  begin
    frmProcVentaRapida.Totales.Edit;
    frmProcVentaRapida.TotalesPropinaLegal.Value := Abs(qryGetSumVtaExtraDC_PROPINALEGAL.Value);
    frmProcVentaRapida.TotalesMontoDescAdicional.Value:=
    Abs(qryGetSumVtaExtraTC_MONTODESCADICIONAL.Value);
    frmProcVentaRapida.TotalesMontoDescItems.Value :=
    Abs(qryGetSumVtaExtraTC_FMONTODESCNIVELITEM.Value);
    if (GlbIgI = 0) then
    frmProcVentaRapida.Totalesitbis.Value :=
    Abs(qryGetSumVtaExtraTOTAL_ITBIS.Value); //qryConsultaPosExtraDet.PARAMS[0].VALUE
    //antes frmProcVentaRapida.TotalesSubTotal.Value:=Abs(qryConsultaPosExtraDetTC_SUBTOTAL.Value);

    frmProcVentaRapida.TotalesSubTotal.Value:=Abs(qryGetSumVtaExtraTC_SUBTOTAL.Value);
      if (GlbMSubTotalSinITBIS = 1) and (GlbActivaIFiscal = 0) and (Not GLBEsFastFood) then
  frmProcVentaRapida.TotalesSubTotal.Value:=
  frmProcVentaRapida.TotalesSubTotal.Value - frmProcVentaRapida.Totalesitbis.Value;

    if (GlbActivaIFiscal = 1) or (GlbActivaECF = 1) or (GlbMSubTotalSinITBIS = 1) then
    frmProcVentaRapida.TotalesSubTotalScreen.Value:=qryGetSumVtaExtraTC_SUBTOTAL.Value
    else
    if (GlbMSubTotalSinITBIS = 0) then
    frmProcVentaRapida.TotalesSubTotalScreen.Value:=Abs(qryValorVtaMONTOBRUTO.Value);

    //Calculo propina legal MontoDescItems
    if not CalcPropinaLegal then
    frmProcVentaRapida.TotalesPropinaLegal.Value:= 0;
    //procedure delete 
    frmProcVentaRapida.Totalestotalneto.Value := Abs(frmProcVentaRapida.TotalesSubTotal.Value) +
    abs(frmProcVentaRapida.TotalesRecargo.Value) -
    abs(frmProcVentaRapida.TotalesMontoDescAdicional.Value) +
    abs(frmProcVentaRapida.TotalesPropina.Value) + abs(frmProcVentaRapida.TotalesPropinaLegal.Value) -
    frmProcVentaRapida.TotalesPreAbono.Value;

    if (GlbTransparentaITBI = 0) or (GLBEsFastFood) then
    frmProcVentaRapida.Totalestotalneto.Value:= Abs(frmProcVentaRapida.Totalestotalneto.Value) +
    Abs(frmProcVentaRapida.Totalesitbis.Value) ;
  end;
  end;
end;

procedure TdmCalculos.qryPosExtraDetBeforePost(DataSet: TDataSet);
begin
  if qryPosExtraDetNUMERO.Value <= 0 then
  Raise Exception.Create('Verificar numero trans en Pos Extra DET');
end;

procedure TdmCalculos.Pos_UpdateTotales(numstr:integer);
var
  Neto : Currency;
begin
  qryGetSumVtaExtra.Close;
  qryGetSumVtaExtra.params[0].Value:= numstr;
  qryGetSumVtaExtra.Open;

  if not qryGetSumVtaExtra.Transaction.InTransaction then
  qryGetSumVtaExtra.Transaction.StartTransaction;
  try
    qryGetSumVtaExtra.Transaction.CommitRetaining;
  except
  qryGetSumVtaExtra.Transaction.Rollback;
  end;
  if frmProcVentaRapida.rxVentacodArticulo.isnull then exit;

  if frmProcVentaRapida.rxVentaSerie.IsNull or
  frmProcVentaRapida.rxVentaCodArticulo.IsNull or
  frmProcVentaRapida.rxVentaPrecio.IsNull or
  frmProcVentaRapida.rxVentaMoneda.IsNull then exit;

  if qryConsultaPosExtraDet.Params.Count = 0 then Exit;
  //Corrige Lentitud qryConsultaPosExtraDet.close;

  //Corrige Lentitud qryConsultaPosExtraDet.Open;

  frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
  'Despues qryConsultaPosExtraDet.Open;','UDatModulos');
  if (qryConsultaPosExtraDetNumero.Value <> numstr) OR (frmProcVentaRapida.rxVentaStatus.value= 'C') then
  begin
    qryConsultaPosExtraDet.Close;//qryConsultaPosExtraDet.Sql.Text
    qryConsultaPosExtraDet.Params[0].Value := numstr;
    qryConsultaPosExtraDet.Params[1].Value := -1;
    qryConsultaPosExtraDet.Params[2].Value := -1;
    qryConsultaPosExtraDet.Open;
      frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'Antes qryConsultaPosExtraDet.Open;',
    'UDatModulos');

    frmLogError.CurrenLN:= 980;
    //t Experimento qryConsultaPosExtraDet.Open;

    frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'Despues qryConsultaPosExtraDet.Open;',
    'UDatModulos');
  end;//E1 reactivar si los calculos se dañan
  //Corrige Lentitud  E1 qryConsultaPosExtraDet.First;//qryConsultaPosExtraDet.recordCount
  if (qryConsultaPosExtraDet.Recordcount = 0) and
     (frmProcVentaRapida.rxVenta.RecordCount > 0) and
     (not dmcalculos.EsBorrandoRecord) and (not procCalc) then
  begin
    //Inserta en PosExtraDet
    ProcInsertUpdatePosExtraDet(numstr);
    qryConsultaPosExtraDet.Close;
  end;
  if frmProcVentaRapida.Totales.State = dsInactive then
  frmProcVentaRapida.Totales.Open;
  frmProcVentaRapida.Totales.Edit;frmLogError.CurrenLN:=1013;
  frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,'Bloque ignorado if CalcPropinaLegal then','UDatModulos');

  frmProcVentaRapida.TotalesPropinaLegal.Value := Abs(qryGetSumVtaExtraDC_PROPINALEGAL.Value);
  frmProcVentaRapida.TotalesMontoDescAdicional.Value:=
  Abs(qryGetSumVtaExtraTC_MONTODESCADICIONAL.Value);
  frmProcVentaRapida.TotalesMontoDescItems.Value :=
  Abs(qryGetSumVtaExtraTC_FMONTODESCNIVELITEM.Value);
   if (GlbIgI = 1) then
  frmProcVentaRapida.Totalesitbis.Value :=
  Abs(qryGetSumVtaExtraTOTAL_ITBIS.Value);

  frmProcVentaRapida.TotalesSubTotal.Value:=Abs(qryGetSumVtaExtraTC_SUBTOTAL.Value);

  if (GlbActivaIFiscal = 1) or (GlbActivaECF = 1) or (GlbMSubTotalSinITBIS = 1) then
  frmProcVentaRapida.TotalesSubTotalScreen.Value:=qryGetSumVtaExtraTC_SUBTOTAL.Value
  else   
  frmProcVentaRapida.TotalesSubTotalScreen.Value:=Abs(qryValorVtaMONTOBRUTO.Value);

  //Calculo propina legal MontoDescItems
   if not CalcPropinaLegal then

  frmProcVentaRapida.TotalesPropinaLegal.Value:= 0;

  frmProcVentaRapida.Totalestotalneto.Value := Abs(frmProcVentaRapida.TotalesSubTotal.Value) +
  abs(frmProcVentaRapida.TotalesRecargo.Value) -
  abs(frmProcVentaRapida.TotalesMontoDescAdicional.Value) +
  abs(frmProcVentaRapida.TotalesPropina.Value) + abs(frmProcVentaRapida.TotalesPropinaLegal.Value)
  -frmProcVentaRapida.TotalesPreAbono.Value;

  if (GlbMSubTotalSinITBIS = 1) and (GlbActivaIFiscal = 0) and (Not GLBEsFastFood) then
  frmProcVentaRapida.TotalesSubTotal.Value:=
  frmProcVentaRapida.TotalesSubTotal.Value - frmProcVentaRapida.Totalesitbis.Value;

  if (GlbActivaIFiscal = 1) or (GlbActivaECF = 1) or (GlbMSubTotalSinITBIS = 1) then                  //antes qryConsultaPosExtraDet
  frmProcVentaRapida.TotalesSubTotalScreen.Value:=qryGetSumVtaExtraTC_SUBTOTAL.Value
  else
  if (GlbMSubTotalSinITBIS = 0) then
  frmProcVentaRapida.TotalesSubTotalScreen.Value:=Abs(qryValorVtaMONTOBRUTO.Value);

  if (GlbTransparentaITBI = 0) or (GLBEsFastFood) then
  frmProcVentaRapida.Totalestotalneto.Value:= Abs(frmProcVentaRapida.Totalestotalneto.Value) +
  Abs(frmProcVentaRapida.Totalesitbis.Value);

  Neto := Abs(frmProcVentaRapida.Totalestotalneto.Value);
  SetMontoNotaCredito;

  if EsFactura Or EsFinanciamiento then
  begin
    if (abs(frmProcVentaRapida.Totalesmontorecibido.Value) < abs(Neto)) then
    frmProcVentaRapida.Totalestotalneto.Value := abs(Neto) - abs(frmProcVentaRapida.Totalesmontorecibido.Value) -
    abs(frmProcVentaRapida.TotalesMontoInteres.Value) + abs(frmProcVentaRapida.TotalesMontoSubTotalIndirectos.Value) -
    abs(frmProcVentaRapida.TotalesMontoExoneraITBIS.Value)
    else frmProcVentaRapida.Totalestotalneto.Value := abs(frmProcVentaRapida.Totalesmontorecibido.Value) -
    abs(Neto) -
    abs(frmProcVentaRapida.TotalesMontoInteres.Value) + abs(frmProcVentaRapida.TotalesMontoSubTotalIndirectos.Value) -
    abs(frmProcVentaRapida.TotalesMontoExoneraITBIS.Value);
  end else
  begin
    if frmProcVentaRapida.Totales.State In [dsEdit, dsInsert] then
    frmProcVentaRapida.Totalestotalneto.Value :=
    abs(Neto) + abs(frmProcVentaRapida.TotalesMontoSubTotalIndirectos.Value) -
    abs(frmProcVentaRapida.TotalesMontoExoneraITBIS.Value);
  end;

  if (abs(frmProcVentaRapida.TotalesMontoNotaCredito.Value) > ABS(frmProcVentaRapida.Totalestotalneto.Value)) And (CheckBox4Checked) then
  begin
    frmProcVentaRapida.TotalesMontoNCRAplicado.Value:=abs(frmProcVentaRapida.Totalestotalneto.Value);
    frmProcVentaRapida.Totalestotalneto.Value:= 0;
  end else
  if (CheckBox4Checked) then
  begin
    if frmProcVentaRapida.Totales.State In [dsBrowse ] then
    frmProcVentaRapida.Totales.Edit;
    frmProcVentaRapida.TotalesTotalNeto.Value:=
    Abs(frmProcVentaRapida.TotalesTotalNeto.Value) - abs(frmProcVentaRapida.TotalesMontoNotaCredito.Value) -
    abs(frmProcVentaRapida.TotalesMontoExoneraITBIS.Value) -
    frmProcVentaRapida.TotalesPreAbono.Value;
    
    frmProcVentaRapida.TotalesMontoNCRAplicado.Value:=
    abs(frmProcVentaRapida.TotalesMontoNotaCredito.Value);
  end;

  if frmProcVentaRapida.Totales.State In [dsEdit, dsInsert] then
  frmProcVentaRapida.Totales.Post;
  DatCambio:=False;
  EsEditando:=False;
  CalculoPendiente:=False;//Es Valido?
  GlbCalculado:=True;
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
  //dmcalculos.qryDatosItbPosExtra.Close;
  //dmcalculos.qryDatosItbPosExtra.Params[0].Value:= qryConsultaPosExtraDetNUMERO.Value;
  //dmcalculos.qryDatosItbPosExtra.Open;
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
  //stpproc_InsUpdVtaSum.Close;
  stpproc_InsUpdVtaSum.Params[0].Value:=GlbNumVtaPOS;
  stpproc_InsUpdVtaSum.ExecProc;
end;

procedure TdmCalculos.qryVentasAfterScroll(DataSet: TDataSet);
begin
  qryVentasDEt.Close;
  qryVentasDEt.Params[0].Value:= qryVentasNUMERO.Value;
  qryVentasDEt.Open;
end;

end.
