unit UDatModIngresos;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBStoredProc;

type
  TdmIngresos = class(TDataModule)
    tblIngresoMaster: TIBDataSet;
    dstblIngresoMaster: TDataSource;
    tblIngresoMasterSERIE: TFloatField;
    tblIngresoMasterTIPO: TSmallintField;
    tblIngresoMasterNUMERO: TFloatField;
    tblIngresoMasterMONEDA: TIBStringField;
    tblIngresoMasterFECHA: TDateTimeField;
    tblIngresoMasterVALOR_ING: TFloatField;
    tblIngresoMasterTIPO_ING: TSmallintField;
    tblIngresoMasterNOMBRE_CTE: TIBStringField;
    tblIngresoMasterCODIGO_CTE: TIntegerField;
    tblIngresoMasterCOD_SERVICIO: TIntegerField;
    tblIngresoMasterDOCUMENTO: TIBStringField;
    tblIngresoMasterTIPO_TARGETA: TSmallintField;
    tblIngresoMasterSTATUS_TARGETA: TIBStringField;
    tblIngresoMasterCONCEPTO: TIBStringField;
    tblIngresoMasterSTATUS: TIBStringField;
    tblIngresoMasterOBSERVACION: TIBStringField;
    tblIngresoMasterCOD_LINEA: TIBStringField;
    tblIngresoMasterFECHA_IN: TDateTimeField;
    tblIngresoMasterIN_POR: TIBStringField;
    tblIngresoMasterFECHA_MOD: TDateTimeField;
    tblIngresoMasterMOD_POR: TIBStringField;
    tblIngresoDet: TIBDataSet;
    dstblIngresoDet: TDataSource;
    IBTableTipoIng: TIBTable;
    IBTableTipoIngCODIGO: TIntegerField;
    IBTableTipoIngDESCRIPCION: TIBStringField;
    dtIBTableTipoIng: TDataSource;
    dtIBTableCliente: TDataSource;
    IBQryCliente: TIBQuery;
    IBTableServicio: TIBTable;
    IBTableServicioCODIGO: TIntegerField;
    IBTableServicioFECHA: TDateTimeField;
    IBTableServicioDESCRIPCION: TIBStringField;
    IBTableServicioAFECTA_INVENTARIO: TSmallintField;
    IBTableServicioSTATUS: TIBStringField;
    dtIBTableServicio: TDataSource;
    tblIngresoMasterFORMA_PAGO: TSmallintField;
    tblFormaPago: TIBTable;
    tblFormaPagoCODIGO: TSmallintField;
    tblFormaPagoDESCRIPCION: TIBStringField;
    tblFormaPagoORIGEN: TSmallintField;
    stpFactPendiente: TIBStoredProc;
    stpInsertarReciboIngreso: TIBStoredProc;
    qryfctingresos: TIBQuery;
    qryfctingresosSERIE: TFloatField;
    qryfctingresosNUMERO: TFloatField;
    qryfctingresosNUMERO_FACT: TFloatField;
    qryfctingresosMONTO_FACT: TFloatField;
    qryfctingresosMONEDA: TIBStringField;
    qryfctingresosSTATUS: TIBStringField;
    qryfctingresosCODIGO_SERVICIO: TIntegerField;
    stpFactPagoIng: TIBStoredProc;
    IBTable1: TIBTable;
    SmallintField1: TSmallintField;
    IBStringField1: TIBStringField;
    qryRepIngDetalle: TIBQuery;
    qryRepIngDetalleNUMERO_ING: TIntegerField;
    qryRepIngDetalleDETALLE: TIBStringField;
    qryRepIngDetalleVALOR_IMPUESTO: TFloatField;
    qryRepIngDetallePORC_DESCUENTO: TFloatField;
    qryRepIngDetalleTIPO_TARJETA: TSmallintField;
    qryRepIngDetalleNUMERO_TARJETA_CRED: TIBStringField;
    qryRepIngDetalleANO_VENCE: TIntegerField;
    qryRepIngDetalleMES_VENCE: TSmallintField;
    qryRepIngDetalleMONTOAUTORIZADO: TFloatField;
    qryRepIngDetalleNUMERO_APROBACION: TIBStringField;
    qryRepIngDetalleDESCTIPOPAGOTARJETA: TSmallintField;
    qryRepIngDetalleCODIGO_PROVEEDOR: TSmallintField;
    qryRepIngDetalleDESCTARJETA: TIBStringField;
    qryRepIngDetalleDESCPROVEEDORTARJETA: TIBStringField;
    qryRepIngDetalleMontoCldo: TFloatField;
    qryRepIngDetalleNUMERO: TFloatField;
    qryRepIngDetalleNUMERO_FACT: TFloatField;
    qryRepIngDetalleMONTO_FACT: TFloatField;
    qryRepIngMaster: TIBQuery;
    qryRepIngMasterNUMERO: TFloatField;
    qryRepIngMasterNOMBRE_CTE: TIBStringField;
    qryRepIngMasterCODIGO_CTE: TIntegerField;
    qryRepIngMasterDESC_MONEDA: TIBStringField;
    qryRepIngMasterFORMA_DE_PAGO: TIBStringField;
    qryRepIngMasterFORMA_PAGO: TSmallintField;
    qryRepIngMasterNOMBRE_EMPRESA: TIBStringField;
    qryRepIngMasterFECHA: TDateTimeField;
    qryRepIngMasterSIMBOLO_MONEDA: TIBStringField;
    qryRepIngMasterNOMBRECLIENTECLD: TIBStringField;
    qryRepIngMasterDIRECCION_LOCAL: TIBStringField;
    qryRepIngMasterTELEF_CONTACTO: TIBStringField;
    DataSource1: TDataSource;
    IBTable2: TIBTable;
    IntegerField1: TIntegerField;
    IBTableServicioMONEDA: TIBStringField;
    IBTableServicioFECHA_INI: TDateTimeField;
    IBTableServicioFECHA_FIN: TDateTimeField;
    IBStringField2: TIBStringField;
    IBTableServicioPRECIO: TFloatField;
    SmallintField2: TSmallintField;
    IBStringField3: TIBStringField;
    dstblFormaPago: TDataSource;
    IBTable3: TIBTable;
    IntegerField2: TIntegerField;
    IBStringField4: TIBStringField;
    DataSource2: TDataSource;
    qryRepIngDetalleVALOR_DET: TFloatField;
    tblIngresoMasterCOD_EMPLEADO: TIntegerField;
    qryRepIngMasterNOTA_CREDITO: TFloatField;
    qryRepIngMasterNOTA_DEBITO: TFloatField;
    tblIngresoMasterNOTA_DEBITO: TFloatField;
    tblIngresoMasterNOTA_CREDITO: TFloatField;
    tblIngresoDetSERIE: TFloatField;
    tblIngresoDetSERIE_MASTER: TIntegerField;
    tblIngresoDetNUMERO_ING: TIntegerField;
    tblIngresoDetCOD_SERVICIO: TIntegerField;
    tblIngresoDetCOD_DEPARTAMENTO: TIBStringField;
    tblIngresoDetDETALLE: TIBStringField;
    tblIngresoDetVALOR_DET: TFloatField;
    tblIngresoDetSTATUS: TIBStringField;
    tblIngresoDetVALOR_IMPUESTO: TFloatField;
    tblIngresoDetPORC_DESCUENTO: TFloatField;
    tblIngresoDetFECHA_IN: TDateTimeField;
    tblIngresoDetIN_POR: TIBStringField;
    tblIngresoDetFECHA_MOD: TDateTimeField;
    tblIngresoDetMOD_POR: TIBStringField;
    tblIngresoDetTIPO_TARJETA: TSmallintField;
    tblIngresoDetNUMERO_TARJETA_CRED: TIBStringField;
    tblIngresoDetANO_VENCE: TIntegerField;
    tblIngresoDetMES_VENCE: TSmallintField;
    tblIngresoDetMONTOAUTORIZADO: TFloatField;
    tblIngresoDetNUMERO_APROBACION: TIBStringField;
    tblIngresoDetTIPO: TSmallintField;
    tblIngresoDetCODIGO_PROVEEDOR: TSmallintField;
    tblIngresoDetFCTING_SERIE: TIntegerField;
    tblIngresoDetCOD_PRODUCTO: TIntegerField;
    qryRepIngMasterOBSERVACION: TIBStringField;
    qryRepIngMasterCONCEPTO: TIBStringField;
    tblIngresoDetMES_PAGADO: TDateTimeField;
    qryRepIngDetalleMES_PAGADO: TDateTimeField;
    ibstpProcReversarCobroEst: TIBStoredProc;
    qryReciboAReversar: TIBQuery;
    dsqryReciboAReversar: TDataSource;
    qryReciboAReversarCODIGO_CTE: TIntegerField;
    qryReciboAReversarFECHA_PAGO: TDateTimeField;
    qryReciboAReversarIDANOESCOLAR: TIntegerField;
    qryReciboAReversarNUMERO_RECIBO: TIntegerField;
    qryReciboAReversarSTATUS: TIBStringField;
    qryReciboAReversarNOMBREESTUDIANTE: TIBStringField;
    tblRetencionesDgii: TIBDataSet;
    tblRetencioensDgiiMaster: TIBDataSet;
    tblRetencionesDgiiDet: TIBDataSet;
    tblRetencionesDgiiIDRETENCION: TIntegerField;
    tblRetencionesDgiiFECHAINI: TDateTimeField;
    tblRetencionesDgiiFECHAFINAL: TDateTimeField;
    tblRetencionesDgiiPORCIENTO: TFloatField;
    tblRetencionesDgiiDESCRIPCION: TIBStringField;
    tblRetencionesDgiiSTATUS: TIBStringField;
    tblRetencioensDgiiMasterNUMERO: TIntegerField;
    tblRetencioensDgiiMasterCODIGO_CTE: TIntegerField;
    tblRetencionesDgiiDetIDSERIE: TIntegerField;
    tblRetencionesDgiiDetNUMERO: TIntegerField;
    tblRetencionesDgiiDetIDRETENCION: TIntegerField;
    dstblRetencionesDgii: TDataSource;
    dstblRetencioensDgiiMaster: TDataSource;
    dstblRetencionesDgiiDet: TDataSource;
    tblRetencioensDgiiMasterNombreCliente: TStringField;
    IBQryClienteCODIGO_CTE: TIntegerField;
    IBQryClienteNOMBRE_FACTURAR: TIBStringField;
    qryRetencionesDgii: TIBQuery;
    dsqryRetencionesDgii: TDataSource;
    qryRetencionesDgiiIDRETENCION: TIntegerField;
    qryRetencionesDgiiFECHAINI: TDateTimeField;
    qryRetencionesDgiiFECHAFINAL: TDateTimeField;
    qryRetencionesDgiiPORCIENTO: TFloatField;
    qryRetencionesDgiiDESCRIPCION: TIBStringField;
    qryRetencionesDgiiSTATUS: TIBStringField;
    tblIngresoMasterMONTO_INTERES: TFloatField;
    tblIngresoMasterMONTO_MORA: TFloatField;
    tblIngresoMasterMONTO_CAPITAL: TFloatField;
    tblIngresoMasterCIA_KEY: TIntegerField;
    qryRepIngMasterNOMBRE_ABREV: TIBStringField;
    qryRepIngDetalleMONTOABONO: TFloatField;
    qryRepIngDetalleMONTOSALDO: TFloatField;
    qryRepIngDetalleAdicional: TIBQuery;
    qryRepIngDetalleAdicionalNOMBRE_FACTURAR: TIBStringField;
    qryRepIngDetalleAdicionalFECHA: TDateTimeField;
    qryRepIngDetalleAdicionalNUMERO: TFloatField;
    qryRepIngDetalleAdicionalCANT_DIAS_CREDITO: TSmallintField;
    qryRepIngDetalleAdicionalBALANCE_ACT: TFloatField;
    qryRepIngDetalleAdicionalSERIE: TFloatField;
    qryRepIngDetalleAdicionalNUMERO_TRN_VENTA: TIntegerField;
    qryRepIngDetalleAdicionalNUMERO_RECIBO: TIntegerField;
    qryRepIngDetalleAdicionalFechaVence: TDateTimeField;
    qryRepIngMasterMONTO_CHEQUE: TFloatField;
    qryRepIngMasterNUMERO_CHEQUE: TIntegerField;
    qryRepIngMasterTELEF_CONTACTO1: TIBStringField;
    qryRepIngMasterVALOR_ING: TFloatField;
    qryFactura: TIBQuery;
    qryRepIngMasterCODIGOMONEDA: TIBStringField;
    qryFacturaMONEDA: TIBStringField;
    qryFacturaMONTO_FACT: TFloatField;
    tblIngresoDetMONTO_FACT_PENDTE: TFloatField;
    qryRepIngDetalleMONTO_FACT_PENDTE: TFloatField;
    tblTransferencias: TIBDataSet;
    tblTransferenciasNUMERO_TRANSF: TIntegerField;
    tblTransferenciasCODIGO_CTE: TIntegerField;
    tblTransferenciasCODIGO_BANCO: TIntegerField;
    tblTransferenciasMONTO: TFloatField;
    tblTransferenciasNUMERO_RECIBO: TIntegerField;
    tblTransferenciasNUMERO_TRN_VTA: TIntegerField;
    qryRepIngMasterNUMERO_TRANSF: TIntegerField;
    tblTransf: TIBDataSet;
    tblTransfNUMERO_TRANSF: TIntegerField;
    tblTransfCODIGO_CTE: TIntegerField;
    tblTransfCODIGO_BANCO: TIntegerField;
    tblTransfMONTO: TFloatField;
    tblTransfNUMERO_RECIBO: TIntegerField;
    tblTransfNUMERO_TRN_VTA: TIntegerField;
    qryRepIngMasterDESCUSUARIO: TIBStringField;
    procedure qryRepIngMasterCalcFields(DataSet: TDataSet);
    procedure qryRepIngMasterAfterScroll(DataSet: TDataSet);
    procedure tblIngresoMasterAfterScroll(DataSet: TDataSet);
    procedure tblRetencioensDgiiMasterAfterScroll(DataSet: TDataSet);
    procedure qryRepIngDetalleAfterScroll(DataSet: TDataSet);
    procedure qryRepIngDetalleAdicionalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmIngresos: TdmIngresos;

implementation

uses UDatModConectar, uglobal;

{$R *.dfm}

procedure TdmIngresos.qryRepIngMasterCalcFields(DataSet: TDataSet);
begin
  if qryRepIngMasterNOMBRE_EMPRESA.IsNull then
  qryRepIngMasterNOMBRECLIENTECLD.Value := qryRepIngMasterNOMBRE_CTE.Value
  else
  qryRepIngMasterNOMBRECLIENTECLD.Value:= qryRepIngMasterNOMBRE_EMPRESA.Value;
end;

procedure TdmIngresos.qryRepIngMasterAfterScroll(DataSet: TDataSet);
begin
  qryRepIngDetalle.Close;
  qryRepIngDetalle.Params[0].Value := qryRepIngMasterNUMERO.Value;
  qryRepIngDetalle.Open;
end;

procedure TdmIngresos.tblIngresoMasterAfterScroll(DataSet: TDataSet);
begin
  if tblIngresoDet.State In [dsEdit, dsInsert] then exit;
  tblIngresoDet.Close;
  tblIngresoDet.Params[0].Value:=tblIngresoMasterNUMERO.Value;
  tblIngresoDet.Open;
end;

procedure TdmIngresos.tblRetencioensDgiiMasterAfterScroll(
  DataSet: TDataSet);
begin
  tblRetencionesDgiiDet.Close;
  tblRetencionesDgiiDet.Params[0].Value := tblRetencioensDgiiMasterNUMERO.Value;
  tblRetencionesDgiiDet.Open;
end;

procedure TdmIngresos.qryRepIngDetalleAfterScroll(DataSet: TDataSet);
begin
  qryRepIngDetalleAdicional.Close;
  qryRepIngDetalleAdicional.Params[0].Value:= qryRepIngDetalleNUMERO_FACT.Value;
  qryRepIngDetalleAdicional.Open;

  qryFactura.Close;
  qryFactura.Params[0].Value:= 2;
  qryFactura.Params[1].Value:= qryRepIngMasterCODIGOMONEDA.Value;
  qryFactura.Params[2].Value:= qryRepIngDetalleNUMERO_FACT.Value;
  qryFactura.Open;
end;

procedure TdmIngresos.qryRepIngDetalleAdicionalCalcFields(
  DataSet: TDataSet);
begin
  qryRepIngDetalleAdicionalFechaVence.Value:=
  qryRepIngDetalleAdicionalFECHA.Value + qryRepIngDetalleAdicionalCANT_DIAS_CREDITO.Value;
end;

end.
