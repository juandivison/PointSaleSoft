unit UDatModPanaderia;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBSQL,
  IBStoredProc, RxMemDS;

type
  TdmPanaderia = class(TDataModule)
    tblPanReceta: TIBDataSet;
    tblPanRendimiento: TIBDataSet;
    tblPanReqMateriaPMast: TIBDataSet;
    tblPanReqMateriaPDet: TIBDataSet;
    tblPanReqMateriaPMastID_REQUISICION: TIntegerField;
    tblPanReqMateriaPMastFECHA: TDateTimeField;
    tblPanReqMateriaPMastID_RECETA: TIntegerField;
    tblPanReqMateriaPMastCANTIDAD: TFloatField;
    tblPanReqMateriaPMastCOD_OPERADOR: TIntegerField;
    tblPanReqMateriaPMastCOD_USUARIO: TIntegerField;
    tblPanReqMateriaPMastSTATUS: TIBStringField;
    tblPanReqMateriaPMastFECHA_IN: TDateTimeField;
    tblPanReqMateriaPMastIN_POR: TIBStringField;
    tblPanReqMateriaPDetSERIE: TIntegerField;
    tblPanReqMateriaPDetID_REQUISICION: TIntegerField;
    tblPanReqMateriaPDetCANTIDAD: TFloatField;
    tblPanReqMateriaPDetPRECIO: TFloatField;
    tblPanReqMateriaPDetVALOR: TFloatField;
    tblPanReqMateriaPDetSTATUS: TIBStringField;
    tblPanReqMateriaPDetFECHA_IN: TDateTimeField;
    tblPanReqMateriaPDetIN_POR: TIBStringField;
    tblPanRendimientoID_RENDIMIENTO: TIntegerField;
    tblPanRendimientoID_REQUISICION: TIntegerField;
    tblPanRendimientoCANTIDAD: TFloatField;
    tblPanRendimientoTIPO_UNIDAD: TIntegerField;
    tblPanRendimientoSTATUS: TIBStringField;
    dstblPanReceta: TDataSource;
    dstblPanReqMateriaPMast: TDataSource;
    dstblPanRendimiento: TDataSource;
    dstblPanReqMateriaPDet: TDataSource;
    tblTipoUnidades: TIBTable;
    tblTipoUnidadesIDUNIDAD: TIntegerField;
    tblTipoUnidadesCANTIDAD: TIntegerField;
    tblTipoUnidadesDESCRIPCION: TIBStringField;
    dstblTipoUnidades: TDataSource;
    qryInventario: TIBQuery;
    dsqryInventario: TDataSource;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioFECHA: TDateTimeField;
    qryInventarioCODIGO_BARRA: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioCANTIDAD_REORDEN: TIntegerField;
    qryInventarioPRECIO_ANT: TFloatField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioSTATUS: TIBStringField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioCODIGO_PRECIO: TIBStringField;
    qryInventarioUNIDAD: TFloatField;
    qryInventarioPRECIO_COMPRA: TFloatField;
    qryInventarioPRECIO_MINIMO: TFloatField;
    qryInventarioREFERENCIA: TIBStringField;
    qryInventarioFECHA_VENCIMIENTO: TDateTimeField;
    qryInventarioINVENTARIAR: TSmallintField;
    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    qryInventarioORIGEN: TIntegerField;
    qryInventarioUBICACION: TIBStringField;
    qryInventarioREFERENCIA_ALTERNA: TIBStringField;
    qryInventarioMARCA: TIBStringField;
    qryInventarioMODELO: TIBStringField;
    tblPanRecetaID_RECETA: TIntegerField;
    tblPanRecetaFECHA: TDateTimeField;
    tblPanRecetaDESC_PRODUCTO: TIBStringField;
    tblPanRecetaSTATUS: TIBStringField;
    tblPanRecetaFECHA_IN: TDateTimeField;
    tblPanRecetaIN_POR: TIBStringField;
    tblPanRecetaCOD_USUARIO: TIntegerField;
    tblPanRecetaDet: TIBDataSet;
    tblPanRecetaDetSERIE: TIntegerField;
    tblPanRecetaDetID_RECETA: TIntegerField;
    tblPanRecetaDetCODIGO_PROD: TIntegerField;
    tblPanRecetaDetPORCENTAJE: TFloatField;
    tblPanRecetaDetTIPO_UNIDAD: TIntegerField;
    tblPanRecetaDetSTATUS: TIBStringField;
    tblPanRecetaDetFECHA_IN: TDateTimeField;
    tblPanRecetaDetIN_POR: TIBStringField;
    tblPanRecetaDetCOD_USUARIO: TIntegerField;
    dstblPanRecetaDet: TDataSource;
    qryDatosCalcReceta: TIBQuery;
    dsqryRecetas: TDataSource;
    qryDatosCalcRecetaID_RECETA: TIntegerField;
    qryDatosCalcRecetaCODIGO_PROD: TSmallintField;
    qryDatosCalcRecetaPORCENTAJE: TFloatField;
    qryDatosCalcRecetaTIPO_UNIDAD: TSmallintField;
    qryDatosCalcRecetaDESCTIPOUNIDAD: TIBStringField;
    qryDatosCalcRecetaCANTIDAD: TFloatField;
    qryDatosCalcRecetaPRECIO: TFloatField;
    qryDatosCalcRecetaDESCPRODUCTO: TIBStringField;
    qryDatosCalcRecetaSTATUS: TIBStringField;
    qryRecetas: TIBQuery;
    dsqryDatosCalcReceta: TDataSource;
    qryRecetasID_RECETA: TIntegerField;
    qryRecetasFECHA: TDateTimeField;
    qryRecetasDESC_PRODUCTO: TIBStringField;
    qryRecetasSTATUS: TIBStringField;
    qryRecetasFECHA_IN: TDateTimeField;
    qryRecetasIN_POR: TIBStringField;
    qryRecetasCOD_USUARIO: TIntegerField;
    ibSqlCheckIdReq: TIBSQL;
    ibSql: TIBSQL;
    stpMantInvAlmacen: TIBStoredProc;
    tblPanReqMateriaPDetCODIGO_PROD: TIntegerField;
    tblPanReqMateriaPDetTIPO_UNIDAD: TIntegerField;
    tblPanRendimientoCODIGO_PROD: TIntegerField;
    tblPanRendimientoOBSERVACION: TIBStringField;
    stpProcActInvPan: TIBStoredProc;
    tblPanProduccionMast: TIBDataSet;
    tblPanProduccionDet: TIBDataSet;
    dstblPanProduccionMast: TDataSource;
    dstblPanProduccionDet: TDataSource;
    tblPanProduccionDetSERIE: TIntegerField;
    tblPanProduccionDetID_PRODUCCION: TIntegerField;
    tblPanProduccionDetFECHA: TDateTimeField;
    tblPanProduccionDetCANTIDAD: TFloatField;
    tblPanProduccionDetDESCRIPCION: TIBStringField;
    tblPanProduccionDetSTATUS: TIBStringField;
    tblPanProduccionDetFECHA_IN: TDateTimeField;
    tblPanProduccionDetIN_POR: TIBStringField;
    tblPanProduccionMastID_PRODUCCION: TIntegerField;
    tblPanProduccionMastCIA_KEY: TSmallintField;
    tblPanProduccionMastTIPO_NOMINA: TSmallintField;
    tblPanProduccionMastFECHA_PRODUCCION: TDateTimeField;
    tblPanProduccionMastCOD_EMPLEADO: TIntegerField;
    tblPanProduccionMastSTATUS: TIBStringField;
    tblPanProduccionMastFECHA_IN: TDateTimeField;
    tblPanProduccionMastIN_POR: TIBStringField;
    tblPanProduccionDetPRECIO: TFloatField;
    stpProcIntegrarPanProd: TIBStoredProc;
    QryProcIntegrarPanProd: TIBQuery;
    QryProcIntegrarPanProdCOD_EMPLEADO: TSmallintField;
    QryProcIntegrarPanProdMONTOPAGAR: TFloatField;
    qryRepPanProdEmpMaster: TIBQuery;
    qryRepPanProdEmpDet: TIBQuery;
    tblPanProduccionDetCOD_EMPLEADO: TIntegerField;
    tblCafeteriaMaster: TIBDataSet;
    tblCafeteriaDetalle: TIBDataSet;
    tblCafeteriaDetalleSERIE: TIntegerField;
    tblCafeteriaDetalleNUMERO: TIntegerField;
    tblCafeteriaDetalleCODIGO_PROD: TIntegerField;
    tblCafeteriaDetalleCANT: TIntegerField;
    tblCafeteriaDetalleSTATUS: TIBStringField;
    dstblCafeteriaMaster: TDataSource;
    dstblCafeteriaDetalle: TDataSource;
    tblCafeteriaMasterNUMERO: TIntegerField;
    tblCafeteriaMasterFECHA: TDateTimeField;
    tblCafeteriaMasterCODIGO_PROD: TIntegerField;
    tblCafeteriaMasterPORC_DELEY: TFloatField;
    tblCafeteriaMasterSTATUS: TIBStringField;
    qryInvLookup: TIBQuery;
    dsqryInvLookup: TDataSource;
    qryInvLookupCODIGO: TIntegerField;
    qryInvLookupCODIGO_TEXTO: TIBStringField;
    qryInvLookupTIPO: TIntegerField;
    qryInvLookupDESCRIPCION: TIBStringField;
    qryListIngVtaCafeteria: TIBQuery;
    qryListIngVtaCafeteriaDESCRIPCION: TIBStringField;
    qryListIngVtaCafeteriaCODIGO_PROD: TIntegerField;
    qryListIngVtaCafeteriaSERIE: TIntegerField;
    qryListIngVtaCafeteriaNUMERO: TIntegerField;
    qryListIngVtaCafeteriaCANT: TFloatField;
    qryListIngVtaCafeteriaSTATUS: TIBStringField;
    qryListIngVtaCafeteriaNOMBRECOMPLETO: TIBStringField;
    qryListIngVtaCafeteriaCOD_USUARIO: TIntegerField;
    qryListIngVtaCafeteriaFECHA: TDateTimeField;
    qryInvLookupIngrediente: TIBQuery;
    qryInvLookupIngredienteCODIGO: TIntegerField;
    qryInvLookupIngredienteCODIGO_TEXTO: TIBStringField;
    qryInvLookupIngredienteDESCRIPCION: TIBStringField;
    qryInvLookupIngredienteCANTIDAD: TFloatField;
    qryInvLookupIngredientePRECIO: TFloatField;
    dsqryInvLookupIngrediente: TDataSource;
    qryInvLookup_Cafbase: TIBQuery;
    qryInvLookup_Prodbase: TIBQuery;
    tblPrecioCuadros: TIBDataSet;
    dstblPrecioCuadros: TDataSource;
    tblIngredienteTrabCuadros: TIBDataSet;
    tblIngredienteTrabCuadrosID: TIntegerField;
    tblIngredienteTrabCuadrosCOD_PRODUCTO: TIntegerField;
    tblIngredienteTrabCuadrosPRECIO: TFloatField;
    dstblIngredienteTrabCuadros: TDataSource;
    tblIngredienteTrabCuadrosCODIGO_PROD_BASE: TIntegerField;
    tblIngredienteTrabCuadrosDESCRIPCION: TIBStringField;
    qryInvIngrediente: TIBQuery;
    dsqryInvIngrediente: TDataSource;
    tblIngredienteTrabCuadrosDescIngrediente: TStringField;
    qryBuscarProd: TIBQuery;
    qryBuscarProdCODIGO: TIntegerField;
    qryBuscarProdCODIGO_BARRA: TIBStringField;
    qryBuscarProdDESCRIPCION: TIBStringField;
    qryBuscarProdPRECIO: TFloatField;
    qryBuscarProdCANTIDAD: TFloatField;
    qryDimensionProd: TIBQuery;
    tblDimensionProd: TIBDataSet;
    tblDimensionProdCODIGO_PROD: TIntegerField;
    tblDimensionProdLARGO: TFloatField;
    tblDimensionProdANCHO: TFloatField;
    qryDimensionProdCODIGO_PROD: TIntegerField;
    qryDimensionProdLARGO: TFloatField;
    qryDimensionProdANCHO: TFloatField;
    tblPrecioCuadrosCOD_PRODUCTO: TIntegerField;
    tblPrecioCuadrosALTO: TFloatField;
    tblPrecioCuadrosANCHO: TFloatField;
    tblPrecioCuadrosPERDIDA: TFloatField;
    tblPrecioCuadrosPORC_BENEFICIO: TFloatField;
    tblIngredienteTrabCuadrosALTO: TFloatField;
    tblIngredienteTrabCuadrosANCHO: TFloatField;
    tblPrecioCuadrosPRECIOVENTA: TFloatField;
    tblIngredienteTrabCuadrosESCANUELA: TSmallintField;
    tblPrecioCuadrosNIVELPRECIO: TSmallintField;
    qryIngredienteTrabCuadros: TIBQuery;
    qryIngredienteTrabCuadrosDESCRIPCION: TIBStringField;
    qryIngredienteTrabCuadrosID: TIntegerField;
    qryIngredienteTrabCuadrosCODIGO_PROD_BASE: TIntegerField;
    qryIngredienteTrabCuadrosCOD_PRODUCTO: TIntegerField;
    qryIngredienteTrabCuadrosPRECIO: TFloatField;
    qryIngredienteTrabCuadrosALTO: TFloatField;
    qryIngredienteTrabCuadrosANCHO: TFloatField;
    qryIngredienteTrabCuadrosESCANUELA: TSmallintField;
    tblIngredienteTrabCuadrosESPASTATU: TSmallintField;
    qryIngredienteTrabCuadrosESPASTATU: TSmallintField;
    tblDimensionProdDESC_UNIDAD: TIBStringField;
    tblPrecioCuadrosCODIGO_CTE: TIntegerField;
    tblPrecioCuadrosFECHA: TDateTimeField;
    tblPrecioCuadrosNUMERO: TIntegerField;
    tblIngredienteTrabCuadrosNUMERO: TIntegerField;
    tblPrecioCuadrosNOMBRECLIENTE: TIBStringField;
    tblPrecioCuadrosCELULAR: TIBStringField;
    tblPrecioCuadrosSTATUS: TIBStringField;
    qryRepOrdenTrab: TIBQuery;
    qryRepOrdenTrabDet: TIBQuery;
    qryRepOrdenTrabDetID: TIntegerField;
    qryRepOrdenTrabDetNUMERO: TIntegerField;
    qryRepOrdenTrabDetCODIGO_PROD_BASE: TIntegerField;
    qryRepOrdenTrabDetCOD_PRODUCTO: TIntegerField;
    qryRepOrdenTrabDetPRECIO: TFloatField;
    qryRepOrdenTrabDetALTO: TFloatField;
    qryRepOrdenTrabDetANCHO: TFloatField;
    qryRepOrdenTrabDetESCANUELA: TSmallintField;
    qryRepOrdenTrabDetESPASTATU: TSmallintField;
    qryRepOrdenTrabDetDESC_MATERIAL: TIBStringField;
    qryRepOrdenTrabDetDESC_UNIDAD: TIBStringField;
    qryRepOrdenTrabDESC_PRODUCTO: TIBStringField;
    qryRepOrdenTrabNOMBRECTEREGISTRADO: TIBStringField;
    qryRepOrdenTrabNUMERO: TIntegerField;
    qryRepOrdenTrabFECHA: TDateTimeField;
    qryRepOrdenTrabCODIGO_CTE: TIntegerField;
    qryRepOrdenTrabCOD_PRODUCTO: TIntegerField;
    qryRepOrdenTrabALTO: TFloatField;
    qryRepOrdenTrabANCHO: TFloatField;
    qryRepOrdenTrabPERDIDA: TFloatField;
    qryRepOrdenTrabPORC_BENEFICIO: TFloatField;
    qryRepOrdenTrabPRECIOVENTA: TFloatField;
    qryRepOrdenTrabNIVELPRECIO: TSmallintField;
    qryRepOrdenTrabNOMBRECLIENTE: TIBStringField;
    qryRepOrdenTrabCELULAR: TIBStringField;
    qryRepOrdenTrabSTATUS: TIBStringField;
    qryRepOrdenTrabNUMERO_TRN_VTA: TIntegerField;
    tblPrecioCuadrosNUMERO_TRN_VTA: TIntegerField;
    tblPrecioCuadrosCODIGO_OPERADOR: TIntegerField;
    tblPrecioCuadrosCOMENTARIO: TMemoField;
    qryRepOrdenTrabCODIGO_OPERADOR: TIntegerField;
    qryRepOrdenTrabCOMENTARIO: TMemoField;
    tblPrecioCuadrosMONTO_ABONADO: TFloatField;
    qryRepOrdenTrabMONTO_ABONADO: TFloatField;
    tblPrecioCuadrosMontoRestante: TCurrencyField;
    qryRepOrdenTrabNOMBREOPERADOR: TIBStringField;
    qryRepOrdenTrabFECHAENTREGA: TDateTimeField;
    tblDimensionProdDESPERDICIO: TFloatField;
    tblDimensionProdDESCUNIABREV: TIBStringField;
    qryDimensionProdDESC_UNIDAD: TIBStringField;
    qryDimensionProdDESPERDICIO: TFloatField;
    qryDimensionProdDESCUNIABREV: TIBStringField;
    qryRepOrdenTrabDetDESPERDICIO: TFloatField;
    qryRepOrdenTrabDetDESCUNIABREV: TIBStringField;
    qryRepOrdenTrabCOD_USR: TIntegerField;
    qryRepOrdenTrabNOMBREUSUARIOREG: TIBStringField;
    tblPrecioCuadrosFECHAENTREGA: TDateTimeField;
    tblPrecioCuadrosCOD_USR: TIntegerField;
    qryRepOrdenTrabDetNUM_CANUELA: TSmallintField;
    tblIngredienteTrabCuadrosNUM_CANUELA: TSmallintField;
    tblPrecioCuadrosDOBLEPASTATU: TSmallintField;
    qryRepOrdenTrabDOBLEPASTATU: TSmallintField;
    tblIngredienteTrabCuadrosCANT_MERMA: TFloatField;
    qryIngredienteTrabCuadrosNUMERO: TIntegerField;
    qryIngredienteTrabCuadrosNUM_CANUELA: TSmallintField;
    qryIngredienteTrabCuadrosCANT_MERMA: TFloatField;
    tblPrecioCuadrosPORC_DESCUENTO: TFloatField;
    tblPrecioCuadrosMONTODESCUENTO: TFloatField;
    qryRepOrdenTrabPORC_DESCUENTO: TFloatField;
    qryRepOrdenTrabMONTODESCUENTO: TFloatField;
    rxMaterialUsado: TRxMemoryData;
    rxMaterialUsadoCanuela: TCurrencyField;
    rxMaterialUsadoPaspatu: TCurrencyField;
    rxMaterialUsadoCodigo_prod: TIntegerField;
    rxMaterialUsadoEsCanuela: TIntegerField;
    rxMaterialUsadoEsPaspatu: TSmallintField;
    ibsqlUpdatePrecioCuadro: TIBSQL;
    tblPrecioCuadrosDOBLE_CANUELA: TSmallintField;
    tblIngredienteTrabCuadrosCODIGO_BARRA: TIBStringField;
    tblPrecioCuadrosCON_DOBLE_CRISTAL: TSmallintField;
    qryInvLookupIngredienteLARGO: TFloatField;
    qryInvLookupIngredienteANCHO: TFloatField;
    qryInvLookupIngredienteDESPERDICIO: TFloatField;
    tblPrecioCuadrosFORMAPAGO_ABONO: TSmallintField;
    tblPrecioCuadrosCON_CANVAS: TSmallintField;
    qryInvMatDesc: TIBQuery;
    qryInvMatDescCODIGO: TIntegerField;
    qryInvMatDescFECHA: TDateTimeField;
    qryInvMatDescCODIGO_BARRA: TIBStringField;
    qryInvMatDescDESCRIPCION: TIBStringField;
    qryInvMatDescCANTIDAD: TFloatField;
    qryInvMatDescPRECIO: TFloatField;
    tblIngredienteTrabCuadrosDescMaterialLookup: TStringField;
    tblIngredienteTrabCuadrosLEVEL_PRECIO: TSmallintField;
    qryInvLookupIngredienteCODIGO_BARRA: TIBStringField;
    dstblPrecioCuadrosMast: TDataSource;
    tblPrecioCuadrosNUMERO_MAST: TIntegerField;
    tblPrecioCuadrosMast: TIBDataSet;
    tblPrecioCuadrosMastNUMERO: TIntegerField;
    tblPrecioCuadrosMastCODIGO_CTE: TIntegerField;
    tblPrecioCuadrosMastSTATUS: TIBStringField;
    tblPrecioCuadrosMastFECHA: TDateTimeField;
    qryTotalPrecioCuadros: TIBQuery;
    qryTotalPrecioCuadrosMONTOTOTAL: TFloatField;
    dsqryTotalPrecioCuadros: TDataSource;
    ibsqlUpdateCodCte: TIBSQL;
    tblPrecioCuadrosMONTO_BRUTO: TFloatField;
    procedure tblPanRecetaAfterScroll(DataSet: TDataSet);
    procedure tblPanReqMateriaPMastAfterScroll(DataSet: TDataSet);
    procedure tblPanProduccionMastAfterScroll(DataSet: TDataSet);
    procedure qryRepPanProdEmpMasterAfterScroll(DataSet: TDataSet);
    procedure tblCafeteriaMasterAfterScroll(DataSet: TDataSet);
    procedure tblPrecioCuadrosAfterScroll(DataSet: TDataSet);
    procedure qryRepOrdenTrabAfterScroll(DataSet: TDataSet);
    procedure tblPrecioCuadrosCalcFields(DataSet: TDataSet);
    procedure tblPrecioCuadrosBeforePost(DataSet: TDataSet);
    procedure tblIngredienteTrabCuadrosBeforePost(DataSet: TDataSet);
    procedure tblIngredienteTrabCuadrosBeforeOpen(DataSet: TDataSet);
    procedure tblPrecioCuadrosMastBeforePost(DataSet: TDataSet);
    procedure tblPrecioCuadrosMastAfterScroll(DataSet: TDataSet);
    procedure tblPrecioCuadrosMastAfterInsert(DataSet: TDataSet);
    procedure tblPrecioCuadrosAfterPost(DataSet: TDataSet);
  private
    procedure ActualizaMerma(cantM: currency; codprod, numtrn: integer);
    { Private declarations }
  public
    { Public declarations }
    procedure CalcularPrecio;

    procedure CalcularPrecioDobleC;
    procedure CalcularPrecioDobleP;
    procedure CalcularPrecioCanvas;
  end;

var
  dmPanaderia: TdmPanaderia;
  //guardarRec : TBookMark;
  CantMerma : Currency;

implementation

uses UDatModConectar, uglobal, Math, StrUtils;

{$R *.dfm}

procedure TdmPanaderia.tblPanRecetaAfterScroll(DataSet: TDataSet);
begin
  if tblPanRecetaDet.State In [dsInactive, dsBrowse] then
  begin
    tblPanRecetaDet.Close;
    tblPanRecetaDet.Params[0].Value:= tblPanRecetaid_Receta.Value;
    tblPanRecetaDet.Open;
  end;
end;

procedure TdmPanaderia.tblPanReqMateriaPMastAfterScroll(DataSet: TDataSet);
begin
  if tblPanReqMateriaPDet.State in [dsInactive, dsBrowse] then
  begin
    tblPanReqMateriaPDet.Close;
    tblPanReqMateriaPDet.Params[0].Value:=tblPanReqMateriaPMastID_REQUISICION.Value;
    tblPanReqMateriaPDet.Open;
  end;
end;

procedure TdmPanaderia.tblPanProduccionMastAfterScroll(DataSet: TDataSet);
begin
  if tblPanProduccionDet.state in [dsInactive, dsBrowse] then
  begin
    tblPanProduccionDet.Close;
    tblPanProduccionDet.Params[0].Value:=tblPanProduccionMastCOD_EMPLEADO.Value;
    tblPanProduccionDet.Params[1].Value:=ExtraerFecha(tblPanProduccionMast.Params[0].Value);
    tblPanProduccionDet.Params[2].Value:=ExtraerFecha(tblPanProduccionMast.Params[1].Value);
    tblPanProduccionDet.Open;
  end;
end;

procedure TdmPanaderia.qryRepPanProdEmpMasterAfterScroll(
  DataSet: TDataSet);
begin
  if qryRepPanProdEmpDet.state in [dsInactive, dsBrowse] then
  begin
    qryRepPanProdEmpDet.Close;
    qryRepPanProdEmpDet.Params[0].Value:=qryRepPanProdEmpMaster.fieldbyname('cod_empleado').Value;
    qryRepPanProdEmpDet.Params[1].Value:=qryRepPanProdEmpMaster.Params[0].Value;
    qryRepPanProdEmpDet.Params[2].Value:=qryRepPanProdEmpMaster.Params[1].Value;
    qryRepPanProdEmpDet.Open;
  end;
end;

procedure TdmPanaderia.tblCafeteriaMasterAfterScroll(DataSet: TDataSet);
begin
  dmPanaderia.tblCafeteriaDetalle.Close;
  dmPanaderia.tblCafeteriaDetalle.params[0].Value:= dmPanaderia.tblCafeteriaMasterNUMERO.Value;
  dmPanaderia.tblCafeteriaDetalle.Open;
end;

procedure TdmPanaderia.tblPrecioCuadrosAfterScroll(DataSet: TDataSet);
begin
  if tblPrecioCuadrosNumero.IsNull then
  begin
    tblIngredienteTrabCuadros.Close;
    exit;
  end;
  tblIngredienteTrabCuadros.Close;
  tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNumero.Value;
  tblIngredienteTrabCuadros.Open;

end;

procedure TdmPanaderia.CalcularPrecio;
var
   PrecioIngredientes: Currency;
   Dimen,PrecioCanuela,PrecioPastatu : Currency;
   PrecioCanvas,MontoCanvas, CantMermaCanuela : Currency;
   CantMermaPaspatu : Currency;
begin
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit; 

  if rxMaterialUsado.State = dsInactive then
  rxMaterialUsado.Open;
  
  if tblPrecioCuadrosNUMERO.IsNull then Exit;

  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;

  if tblPrecioCuadrosCON_CANVAS.Value = 1 then
  begin
    if tblPrecioCuadrosDOBLE_CANUELA.Value = 1 then
    CalcularPrecioDobleC
    else
    CalcularPrecioCanvas;
    exit;
  end else
  if tblPrecioCuadrosDOBLEPASTATU.Value = 1 then
  begin
    CalcularPrecioDobleP;
    Exit;
  end else
  if tblPrecioCuadrosDOBLE_CANUELA.Value = 1 then
  begin
    CalcularPrecioDobleC;
    Exit;
  end;
  {
  16+8=24 y 20+8=28 se suman 24+28=52x2=104+ 12 de desperdicios=116÷12=9.66x
  el precio de la cañuela en este caso será 90=$869.99+ el paspatu 150=1019.99+
  el cristal 300 =1319.99 más el 10%=1451.98
  }
  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    //if not tblPrecioCuadrosNumero.IsNull then
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  CantMerma :=0;

  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;

  qryIngredienteTrabCuadros.Close;
  qryIngredienteTrabCuadros.Params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.Params[1].Value:= tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.Open;


  if tblPrecioCuadros.State = dsBrowse then
  tblPrecioCuadros.Edit;

  while not qryIngredienteTrabCuadros.Eof do
  begin
    if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
    and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;
      
    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      Dimen:=Dimen +
      qryIngredienteTrabCuadrosANCHO.Value;
    end else
    Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;

    if rxMaterialUsado.State = dsInactive then
    rxMaterialUsado.Open;
    
    if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
    rxMaterialUsado.Append else rxMaterialUsado.edit;

    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      rxMaterialUsadoEsCanuela.Value:=1;
      PrecioCanuela:=PrecioCanuela + qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;

      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoCanuela.Value := rxMaterialUsadoCanuela.Value + CantMermaCanuela+
      qryIngredienteTrabCuadrosALTO.Value;

    end else
    if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
    begin
      rxMaterialUsadoEsCanuela.Value:=1;
      PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu +
      qryIngredienteTrabCuadrosALTO.Value;
    end else
    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      PrecioIngredientes:=PrecioIngredientes + (qryIngredienteTrabCuadrosPRECIO.Value * 1)
      else
      PrecioIngredientes:=PrecioIngredientes + qryIngredienteTrabCuadrosPRECIO.Value;
    end else
    PrecioIngredientes:=PrecioIngredientes + qryIngredienteTrabCuadrosPRECIO.Value;

    if Not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
    CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;

    if rxMaterialUsado.State In [dsEdit, dsInsert] then
    rxMaterialUsado.Post;

    qryIngredienteTrabCuadros.Next;
  end;
  WriteToLog('Dimesión A: '+FloatToStr(Dimen));

  if tblPrecioCuadros.State = dsBrowse then
  tblPrecioCuadros.Edit;

  tblPrecioCuadrosPrecioVenta.Value:=
  (tblPrecioCuadrosALTO.Value +
   tblPrecioCuadrosANCHO.Value + (Dimen * 4)) * 2 ;

  WriteToLog('Dimensión Total: ' + tblPrecioCuadrosPrecioVenta.AsString);

  tblPrecioCuadrosPERDIDA.Value :=CantMerma;

  tblPrecioCuadrosPrecioVenta.Value:=
  ((tblPrecioCuadrosPrecioVenta.Value + CantMerma) / 12) *  //12Pulgadas para llevarlo a Pies
  PrecioCanuela;

  //tblPrecioCuadrosMontoDescuento.Value:=
  //(tblPrecioCuadrosPrecioVenta.Value * (tblPrecioCuadrosPORC_DESCUENTO.Value /100));

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);


  tblPrecioCuadrosPrecioVenta.Value:=
  (tblPrecioCuadrosPrecioVenta.Value
  + PrecioIngredientes + PrecioPastatu )
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  tblPrecioCuadrosMONTODESCUENTO.Value:=
  (tblPrecioCuadrosPrecioVenta.Value *
                                      (tblPrecioCuadrosPORC_DESCUENTO.Value /100));

  tblPrecioCuadrosMONTO_BRUTO.Value:= tblPrecioCuadrosPrecioVenta.Value;
                                        
  tblPrecioCuadrosPrecioVenta.Value:=
  tblPrecioCuadrosPrecioVenta.Value - tblPrecioCuadrosMONTODESCUENTO.Value;


  tblPrecioCuadrosPrecioVenta.Value:=RoundTo(tblPrecioCuadrosPrecioVenta.Value,0);
  WriteToLog('Precio Total: '+tblPrecioCuadrosPrecioVenta.AsSTring);
{
  qryTotalPrecioCuadros.Close;
  qryTotalPrecioCuadros.Params[0].Value:= tblPrecioCuadrosNUMERO_MAST.Value;
  qryTotalPrecioCuadros.Open;}

end;
procedure TdmPanaderia.ActualizaMerma(cantM:currency;codprod:integer;numtrn:integer);
begin
  ibsqlUpdatePrecioCuadro.Params[0].Value:= cantM;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= codprod;
  ibsqlUpdatePrecioCuadro.Params[2].Value:= numtrn;
  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;
end;
procedure TdmPanaderia.qryRepOrdenTrabAfterScroll(DataSet: TDataSet);
begin
  qryRepOrdenTrabDet.Close;
  qryRepOrdenTrabDet.Params[0].Value:= qryRepOrdenTrabnumero.value;
  qryRepOrdenTrabDet.Open;
end;

procedure TdmPanaderia.tblPrecioCuadrosCalcFields(DataSet: TDataSet);
begin
  if not tblPrecioCuadrosMONTO_ABONADO.IsNull then
  tblPrecioCuadrosMontoRestante.Value:=
  tblPrecioCuadrosPRECIOVENTA.Value -
  tblPrecioCuadrosMONTO_ABONADO.Value
  else   tblPrecioCuadrosMontoRestante.Value:=
  tblPrecioCuadrosPRECIOVENTA.Value;
end;

procedure TdmPanaderia.CalcularPrecioDobleP;
var
   PrecioIngredientes : Currency;
   DimenTotal,Dimen,PrecioCanuela,PrecioPastatu : Currency;
   MontoCanvas,CantMerma,PrecioCanvas : Currency;

   SumAlto, SumAncho : Currency;
   CantMermaCanuela, CantMermaPaspatu : Currency;
begin
  {
  16+8=24 y 20+8=28 se suman 24+28=52x2=104+ 12 de desperdicios=116÷12=9.66x
  el precio de la cañuela en este caso será 90=$869.99+ el paspatu 150=1019.99+
  el cristal 300 =1319.99 más el 10%=1451.98
  }
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit;

  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  DimenTotal:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  SumAlto:=0;
  SumAncho:=0;
  qryIngredienteTrabCuadros.close;
  qryIngredienteTrabCuadros.params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.params[1].Value:=tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.open;
  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMerma:=0;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;
  PrecioCanvas:=0;
  rxMaterialUsado.Close;
  rxMaterialUsado.Open;
  while not qryIngredienteTrabCuadros.Eof do
  begin
      if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
         and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;

    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      Dimen:=Dimen +
      qryIngredienteTrabCuadrosANCHO.Value;
    end else
    Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;
    if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
    rxMaterialUsado.Append else rxMaterialUsado.edit;
    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      PrecioCanuela:=PrecioCanuela +qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoCanuela.Value :=rxMaterialUsadoCanuela.Value + CantMermaCanuela;
    end else
    if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
    begin
      PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu;
    end else
    PrecioIngredientes:=PrecioIngredientes +
    qryIngredienteTrabCuadrosPRECIO.Value;

    if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
    CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;
    if rxMaterialUsado.State in [dsEdit, dsInsert] then
    rxMaterialUsado.Post;
    qryIngredienteTrabCuadros.Next;
  end;
  SumAlto :=tblPrecioCuadrosALTO.Value + (Dimen * 2);
  SumAncho:=tblPrecioCuadrosANCHO.Value + (Dimen * 2);

  DimenTotal:= (SumAlto + SumAncho) * 2;

  //if CantMerma > 0 then
  DimenTotal:=((DimenTotal + CantMerma) / 12) * PrecioCanuela;

  if (tblPrecioCuadros.State = dsBrowse) then
  tblPrecioCuadros.Edit;
    tblPrecioCuadrosPrecioVenta.Value:=0;
  tblPrecioCuadrosMontoDescuento.Value:=0;
  //tblPrecioCuadrosMontoDescuento.Value:=
  //(DimenTotal * (100 /100));

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);

  
  tblPrecioCuadrosPrecioVenta.Value:=(DimenTotal +
  PrecioIngredientes + PrecioPastatu) *
  (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  tblPrecioCuadrosMONTODESCUENTO.Value:=
  (tblPrecioCuadrosPrecioVenta.Value * (tblPrecioCuadrosPORC_DESCUENTO.Value /100));
                                       
  tblPrecioCuadrosMONTO_BRUTO.Value:= tblPrecioCuadrosPrecioVenta.Value;

  tblPrecioCuadrosPrecioVenta.Value:=
  tblPrecioCuadrosPrecioVenta.Value - tblPrecioCuadrosMONTODESCUENTO.Value;

  ibsqlUpdatePrecioCuadro.Params[0].Value:= CantMerma;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= tblPrecioCuadrosCOD_PRODUCTO.Value;

  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;

end;

procedure TdmPanaderia.tblPrecioCuadrosBeforePost(DataSet: TDataSet);
begin
  if tblPrecioCuadrosNUMERO_MAST.IsNull then
  begin
    if tblPrecioCuadrosMastNUMERO.IsNull then
    GlbSalvarQuery(tblPrecioCuadros);
    tblPrecioCuadrosNUMERO_MAST.Value:=tblPrecioCuadrosMastNUMERO.Value;
  end;
  if dmPanaderia.tblPrecioCuadrosCODIGO_CTE.IsNull or (dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value = 0)
  and (dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value > 0) then
    dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value:=dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value;

  dmPanaderia.CalcularPrecio;
end;

procedure TdmPanaderia.CalcularPrecioDobleC;
var
   PrecioIngredientes : Currency;
   DimenTotal,Dimen,PrecioCanuela,PrecioPastatu : Currency;
   CantMerma,PrecioCanvas,MontoCanvas : Currency;

   SumAlto, SumAncho : Currency;
   CantMermaCanuela, CantMermaPaspatu : Currency;
begin
  {
  16+8=24 y 20+8=28 se suman 24+28=52x2=104+ 12 de desperdicios=116÷12=9.66x
  el precio de la cañuela en este caso será 90=$869.99+ el paspatu 150=1019.99+
  el cristal 300 =1319.99 más el 10%=1451.98
  }
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit;

  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  DimenTotal:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  SumAlto:=0;
  SumAncho:=0;
  qryIngredienteTrabCuadros.close;
  qryIngredienteTrabCuadros.params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.params[1].Value:=tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.open;
  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMerma:=0;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;
  rxMaterialUsado.Close;
  rxMaterialUsado.Open;
  while not qryIngredienteTrabCuadros.Eof do
  begin
    if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
    and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;

    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      Dimen:=Dimen +
      qryIngredienteTrabCuadrosANCHO.Value;
    end else  
    Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;
    
    if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
    rxMaterialUsado.Append else rxMaterialUsado.edit;
    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      PrecioCanuela:=PrecioCanuela + qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoCanuela.Value :=rxMaterialUsadoCanuela.Value + CantMermaCanuela;
    end else
    if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
    begin
      PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu;
    end else
    PrecioIngredientes:=PrecioIngredientes +
    qryIngredienteTrabCuadrosPRECIO.Value;

    if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
    CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;
    if rxMaterialUsado.State in [dsEdit, dsInsert] then
    rxMaterialUsado.Post;
    qryIngredienteTrabCuadros.Next;
  end;
  SumAlto :=tblPrecioCuadrosALTO.Value + (Dimen * 2);
  SumAncho:=tblPrecioCuadrosANCHO.Value + (Dimen * 2);

  DimenTotal:= (SumAlto + SumAncho) * 2;

  //if CantMerma > 0 then
  DimenTotal:=((DimenTotal + CantMerma) / 12) * PrecioCanuela;

  if (tblPrecioCuadros.State = dsBrowse) then
  tblPrecioCuadros.Edit;
  tblPrecioCuadrosPrecioVenta.Value:=0;
  tblPrecioCuadrosMontoDescuento.Value:=0;
  //tblPrecioCuadrosMontoDescuento.Value:=
  //(DimenTotal * (100 /100));

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);


  tblPrecioCuadrosPrecioVenta.Value:=(DimenTotal  +
  PrecioIngredientes + PrecioPastatu) *
  (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  tblPrecioCuadrosMONTODESCUENTO.Value:=(tblPrecioCuadrosPrecioVenta.Value *
                                      (tblPrecioCuadrosPORC_DESCUENTO.Value /100));

  tblPrecioCuadrosMONTO_BRUTO.Value:= tblPrecioCuadrosPrecioVenta.Value;

  tblPrecioCuadrosPrecioVenta.Value:=
  tblPrecioCuadrosPrecioVenta.Value - tblPrecioCuadrosMONTODESCUENTO.Value;

  ibsqlUpdatePrecioCuadro.Params[0].Value:= CantMerma;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= tblPrecioCuadrosCOD_PRODUCTO.Value;

  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;  
end;

procedure TdmPanaderia.tblIngredienteTrabCuadrosBeforePost(
  DataSet: TDataSet);
begin
  if (dmPanaderia.tblPrecioCuadrosNUMERO.IsNull) then
  begin
    exit;
  end;
  if dmPanaderia.tblIngredienteTrabCuadros.State in [dsInsert] then
  begin
    if dmPanaderia.tblIngredienteTrabCuadrosNumero.IsNull then
    dmPanaderia.tblIngredienteTrabCuadrosNumero.Value:=
    dmPanaderia.tblPrecioCuadrosNUMERO.Value;
    
    if dmPanaderia.tblIngredienteTrabCuadrosId.IsNull then
    dmPanaderia.tblIngredienteTrabCuadrosid.Value := FsqlMaxNumero('Precio_Cuadros_det','id');
  end;
end;

//not en uso
procedure TdmPanaderia.CalcularPrecioCanvas;
var
   PrecioCanvas, PrecioIngredientes : Currency;
   DimenTotal,Dimen,PrecioCanuela,PrecioPastatu : Currency;
   CantMerma : Currency;

   SumAlto, SumAncho : Currency;
   CantMermaCanuela, CantMermaPaspatu : Currency;
   MontoCanvas: Currency;

begin
  {
   FORMULA CANVAS
   =============
   2+2 = 4+16 =20; 4+20 =24; Se multiplica ambos lados 20 * 24 = 480; 480 / 144 = 3.333333 x 350 = 1,166.66
  }
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit;

  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  DimenTotal:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  SumAlto:=0;
  SumAncho:=0;
  qryIngredienteTrabCuadros.close;
  qryIngredienteTrabCuadros.params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.params[1].Value:=tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.open;
  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMerma:=0;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;
  rxMaterialUsado.Close;
  rxMaterialUsado.Open;
  while not qryIngredienteTrabCuadros.Eof do
  begin                          
    if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
         and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;
       
    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;

      if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
      rxMaterialUsado.Append else rxMaterialUsado.edit;

      if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
      begin
        PrecioCanuela:=PrecioCanuela +qryIngredienteTrabCuadrosPRECIO.Value;
        if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
        CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;
        rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
        rxMaterialUsadoCanuela.Value :=rxMaterialUsadoCanuela.Value + CantMermaCanuela;
      end else
      if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
      begin
        PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
        if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
        CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
        rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
        rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu;
      end else
      PrecioIngredientes:=PrecioIngredientes +
      qryIngredienteTrabCuadrosPRECIO.Value;

      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      if rxMaterialUsado.State in [dsEdit, dsInsert] then
      rxMaterialUsado.Post;
    end;
    qryIngredienteTrabCuadros.Next;
  end;
  if Dimen > 0 then
  begin
    SumAlto :=tblPrecioCuadrosALTO.Value + (Dimen * 2);
    SumAncho:=tblPrecioCuadrosANCHO.Value + (Dimen * 2);

    DimenTotal:= (SumAlto + SumAncho) * 2;

    //if CantMerma > 0 then
    DimenTotal:=((DimenTotal + CantMerma) / 12) * PrecioCanuela;

    if (tblPrecioCuadros.State = dsBrowse) then
    tblPrecioCuadros.Edit;
  tblPrecioCuadrosPrecioVenta.Value:=0;
  tblPrecioCuadrosMontoDescuento.Value:=0;    
    //tblPrecioCuadrosMontoDescuento.Value:=
    //(DimenTotal * (tblPrecioCuadrosPORC_DESCUENTO.Value /100));
  end else
  tblPrecioCuadrosPrecioVenta.Value:=0;

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);


  tblPrecioCuadrosPrecioVenta.Value:=(DimenTotal +
  PrecioIngredientes + PrecioPastatu) *
  (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  tblPrecioCuadrosMONTODESCUENTO.Value:=
  (tblPrecioCuadrosPrecioVenta.Value * (tblPrecioCuadrosPORC_DESCUENTO.Value /100));

  tblPrecioCuadrosMONTO_BRUTO.Value:= tblPrecioCuadrosPrecioVenta.Value;

  tblPrecioCuadrosPrecioVenta.Value:=
  tblPrecioCuadrosPrecioVenta.Value - tblPrecioCuadrosMONTODESCUENTO.Value;

  ibsqlUpdatePrecioCuadro.Params[0].Value:= CantMerma;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= tblPrecioCuadrosCOD_PRODUCTO.Value;

  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;
end;

procedure TdmPanaderia.tblIngredienteTrabCuadrosBeforeOpen(
  DataSet: TDataSet);
begin
  qryInvMatDesc.close;
  qryInvMatDesc.open;
end;

procedure TdmPanaderia.tblPrecioCuadrosMastBeforePost(DataSet: TDataSet);
begin
  if dmPanaderia.tblPrecioCuadrosMastFecha.IsNull then
  dmPanaderia.tblPrecioCuadrosMastFecha.Value:= ExtraerFecha(GlbFechaTrnDiaria);

  if dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.IsNull or (dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value = 0) then
  begin
    if not tblPrecioCuadrosCODIGO_CTE.IsNull then
    dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value:=tblPrecioCuadrosCODIGO_CTE.Value;
  end;
end;

procedure TdmPanaderia.tblPrecioCuadrosMastAfterScroll(DataSet: TDataSet);
begin
  if tblPrecioCuadros.State = dsBrowse then
  begin
    if not tblPrecioCuadros.Locate('NUMERO_MAST',tblPrecioCuadrosMastNUMERO.Value,[]) then
    begin
      dmPanaderia.tblPrecioCuadros.Close;
      dmPanaderia.tblPrecioCuadros.Params[0].Value:=ExtraerFecha(tblPrecioCuadrosMastFECHA.Value);
      dmPanaderia.tblPrecioCuadros.Params[1].Value:=ExtraerFecha(tblPrecioCuadrosMastFECHA.Value);
      dmPanaderia.tblPrecioCuadros.Params[2].Value:='A';
      dmPanaderia.tblPrecioCuadros.Params[3].Value:='A';
      dmPanaderia.tblPrecioCuadros.Params[4].Value:=tblPrecioCuadrosMastNUMERO.Value;
      dmPanaderia.tblPrecioCuadros.Open;
    end;
  end;
  qryTotalPrecioCuadros.close;
  qryTotalPrecioCuadros.Params[0].Value:= tblPrecioCuadrosMastNUMERO.Value;
  qryTotalPrecioCuadros.open;
end;

procedure TdmPanaderia.tblPrecioCuadrosMastAfterInsert(DataSet: TDataSet);
begin
 rxMaterialUsado.Close;
 rxMaterialUsado.Open;
end;

procedure TdmPanaderia.tblPrecioCuadrosAfterPost(DataSet: TDataSet);
begin
  qryTotalPrecioCuadros.Close;
  qryTotalPrecioCuadros.Params[0].Value:= tblPrecioCuadrosNUMERO_MAST.Value;
  qryTotalPrecioCuadros.Open;
  ibsqlUpdateCodCte.Params[0].Value:=tblPrecioCuadrosCODIGO_CTE.Value;
  ibsqlUpdateCodCte.Params[1].Value:=tblPrecioCuadrosNUMERO_MAST.Value;
  ibsqlUpdateCodCte.ExecQuery;
  try
    if not ibsqlUpdateCodCte.Transaction.InTransaction then
    ibsqlUpdateCodCte.Transaction.StartTransaction;
    ibsqlUpdateCodCte.Transaction.CommitRetaining;
  except
  ibsqlUpdateCodCte.Transaction.RollbackRetaining;
  end;
end;

end.


interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBSQL,
  IBStoredProc, RxMemDS;

type
  TdmPanaderia = class(TDataModule)
    tblPanReceta: TIBDataSet;
    tblPanRendimiento: TIBDataSet;
    tblPanReqMateriaPMast: TIBDataSet;
    tblPanReqMateriaPDet: TIBDataSet;
    tblPanReqMateriaPMastID_REQUISICION: TIntegerField;
    tblPanReqMateriaPMastFECHA: TDateTimeField;
    tblPanReqMateriaPMastID_RECETA: TIntegerField;
    tblPanReqMateriaPMastCANTIDAD: TFloatField;
    tblPanReqMateriaPMastCOD_OPERADOR: TIntegerField;
    tblPanReqMateriaPMastCOD_USUARIO: TIntegerField;
    tblPanReqMateriaPMastSTATUS: TIBStringField;
    tblPanReqMateriaPMastFECHA_IN: TDateTimeField;
    tblPanReqMateriaPMastIN_POR: TIBStringField;
    tblPanReqMateriaPDetSERIE: TIntegerField;
    tblPanReqMateriaPDetID_REQUISICION: TIntegerField;
    tblPanReqMateriaPDetCANTIDAD: TFloatField;
    tblPanReqMateriaPDetPRECIO: TFloatField;
    tblPanReqMateriaPDetVALOR: TFloatField;
    tblPanReqMateriaPDetSTATUS: TIBStringField;
    tblPanReqMateriaPDetFECHA_IN: TDateTimeField;
    tblPanReqMateriaPDetIN_POR: TIBStringField;
    tblPanRendimientoID_RENDIMIENTO: TIntegerField;
    tblPanRendimientoID_REQUISICION: TIntegerField;
    tblPanRendimientoCANTIDAD: TFloatField;
    tblPanRendimientoTIPO_UNIDAD: TIntegerField;
    tblPanRendimientoSTATUS: TIBStringField;
    dstblPanReceta: TDataSource;
    dstblPanReqMateriaPMast: TDataSource;
    dstblPanRendimiento: TDataSource;
    dstblPanReqMateriaPDet: TDataSource;
    tblTipoUnidades: TIBTable;
    tblTipoUnidadesIDUNIDAD: TIntegerField;
    tblTipoUnidadesCANTIDAD: TIntegerField;
    tblTipoUnidadesDESCRIPCION: TIBStringField;
    dstblTipoUnidades: TDataSource;
    qryInventario: TIBQuery;
    dsqryInventario: TDataSource;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioFECHA: TDateTimeField;
    qryInventarioCODIGO_BARRA: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioCANTIDAD_REORDEN: TIntegerField;
    qryInventarioPRECIO_ANT: TFloatField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioSTATUS: TIBStringField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioCODIGO_PRECIO: TIBStringField;
    qryInventarioUNIDAD: TFloatField;
    qryInventarioPRECIO_COMPRA: TFloatField;
    qryInventarioPRECIO_MINIMO: TFloatField;
    qryInventarioREFERENCIA: TIBStringField;
    qryInventarioFECHA_VENCIMIENTO: TDateTimeField;
    qryInventarioINVENTARIAR: TSmallintField;
    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    qryInventarioORIGEN: TIntegerField;
    qryInventarioUBICACION: TIBStringField;
    qryInventarioREFERENCIA_ALTERNA: TIBStringField;
    qryInventarioMARCA: TIBStringField;
    qryInventarioMODELO: TIBStringField;
    tblPanRecetaID_RECETA: TIntegerField;
    tblPanRecetaFECHA: TDateTimeField;
    tblPanRecetaDESC_PRODUCTO: TIBStringField;
    tblPanRecetaSTATUS: TIBStringField;
    tblPanRecetaFECHA_IN: TDateTimeField;
    tblPanRecetaIN_POR: TIBStringField;
    tblPanRecetaCOD_USUARIO: TIntegerField;
    tblPanRecetaDet: TIBDataSet;
    tblPanRecetaDetSERIE: TIntegerField;
    tblPanRecetaDetID_RECETA: TIntegerField;
    tblPanRecetaDetCODIGO_PROD: TIntegerField;
    tblPanRecetaDetPORCENTAJE: TFloatField;
    tblPanRecetaDetTIPO_UNIDAD: TIntegerField;
    tblPanRecetaDetSTATUS: TIBStringField;
    tblPanRecetaDetFECHA_IN: TDateTimeField;
    tblPanRecetaDetIN_POR: TIBStringField;
    tblPanRecetaDetCOD_USUARIO: TIntegerField;
    dstblPanRecetaDet: TDataSource;
    qryDatosCalcReceta: TIBQuery;
    dsqryRecetas: TDataSource;
    qryDatosCalcRecetaID_RECETA: TIntegerField;
    qryDatosCalcRecetaCODIGO_PROD: TSmallintField;
    qryDatosCalcRecetaPORCENTAJE: TFloatField;
    qryDatosCalcRecetaTIPO_UNIDAD: TSmallintField;
    qryDatosCalcRecetaDESCTIPOUNIDAD: TIBStringField;
    qryDatosCalcRecetaCANTIDAD: TFloatField;
    qryDatosCalcRecetaPRECIO: TFloatField;
    qryDatosCalcRecetaDESCPRODUCTO: TIBStringField;
    qryDatosCalcRecetaSTATUS: TIBStringField;
    qryRecetas: TIBQuery;
    dsqryDatosCalcReceta: TDataSource;
    qryRecetasID_RECETA: TIntegerField;
    qryRecetasFECHA: TDateTimeField;
    qryRecetasDESC_PRODUCTO: TIBStringField;
    qryRecetasSTATUS: TIBStringField;
    qryRecetasFECHA_IN: TDateTimeField;
    qryRecetasIN_POR: TIBStringField;
    qryRecetasCOD_USUARIO: TIntegerField;
    ibSqlCheckIdReq: TIBSQL;
    ibSql: TIBSQL;
    stpMantInvAlmacen: TIBStoredProc;
    tblPanReqMateriaPDetCODIGO_PROD: TIntegerField;
    tblPanReqMateriaPDetTIPO_UNIDAD: TIntegerField;
    tblPanRendimientoCODIGO_PROD: TIntegerField;
    tblPanRendimientoOBSERVACION: TIBStringField;
    stpProcActInvPan: TIBStoredProc;
    tblPanProduccionMast: TIBDataSet;
    tblPanProduccionDet: TIBDataSet;
    dstblPanProduccionMast: TDataSource;
    dstblPanProduccionDet: TDataSource;
    tblPanProduccionDetSERIE: TIntegerField;
    tblPanProduccionDetID_PRODUCCION: TIntegerField;
    tblPanProduccionDetFECHA: TDateTimeField;
    tblPanProduccionDetCANTIDAD: TFloatField;
    tblPanProduccionDetDESCRIPCION: TIBStringField;
    tblPanProduccionDetSTATUS: TIBStringField;
    tblPanProduccionDetFECHA_IN: TDateTimeField;
    tblPanProduccionDetIN_POR: TIBStringField;
    tblPanProduccionMastID_PRODUCCION: TIntegerField;
    tblPanProduccionMastCIA_KEY: TSmallintField;
    tblPanProduccionMastTIPO_NOMINA: TSmallintField;
    tblPanProduccionMastFECHA_PRODUCCION: TDateTimeField;
    tblPanProduccionMastCOD_EMPLEADO: TIntegerField;
    tblPanProduccionMastSTATUS: TIBStringField;
    tblPanProduccionMastFECHA_IN: TDateTimeField;
    tblPanProduccionMastIN_POR: TIBStringField;
    tblPanProduccionDetPRECIO: TFloatField;
    stpProcIntegrarPanProd: TIBStoredProc;
    QryProcIntegrarPanProd: TIBQuery;
    QryProcIntegrarPanProdCOD_EMPLEADO: TSmallintField;
    QryProcIntegrarPanProdMONTOPAGAR: TFloatField;
    qryRepPanProdEmpMaster: TIBQuery;
    qryRepPanProdEmpDet: TIBQuery;
    tblPanProduccionDetCOD_EMPLEADO: TIntegerField;
    tblCafeteriaMaster: TIBDataSet;
    tblCafeteriaDetalle: TIBDataSet;
    tblCafeteriaDetalleSERIE: TIntegerField;
    tblCafeteriaDetalleNUMERO: TIntegerField;
    tblCafeteriaDetalleCODIGO_PROD: TIntegerField;
    tblCafeteriaDetalleCANT: TIntegerField;
    tblCafeteriaDetalleSTATUS: TIBStringField;
    dstblCafeteriaMaster: TDataSource;
    dstblCafeteriaDetalle: TDataSource;
    tblCafeteriaMasterNUMERO: TIntegerField;
    tblCafeteriaMasterFECHA: TDateTimeField;
    tblCafeteriaMasterCODIGO_PROD: TIntegerField;
    tblCafeteriaMasterPORC_DELEY: TFloatField;
    tblCafeteriaMasterSTATUS: TIBStringField;
    qryInvLookup: TIBQuery;
    dsqryInvLookup: TDataSource;
    qryInvLookupCODIGO: TIntegerField;
    qryInvLookupCODIGO_TEXTO: TIBStringField;
    qryInvLookupTIPO: TIntegerField;
    qryInvLookupDESCRIPCION: TIBStringField;
    qryListIngVtaCafeteria: TIBQuery;
    qryListIngVtaCafeteriaDESCRIPCION: TIBStringField;
    qryListIngVtaCafeteriaCODIGO_PROD: TIntegerField;
    qryListIngVtaCafeteriaSERIE: TIntegerField;
    qryListIngVtaCafeteriaNUMERO: TIntegerField;
    qryListIngVtaCafeteriaCANT: TFloatField;
    qryListIngVtaCafeteriaSTATUS: TIBStringField;
    qryListIngVtaCafeteriaNOMBRECOMPLETO: TIBStringField;
    qryListIngVtaCafeteriaCOD_USUARIO: TIntegerField;
    qryListIngVtaCafeteriaFECHA: TDateTimeField;
    qryInvLookupIngrediente: TIBQuery;
    qryInvLookupIngredienteCODIGO: TIntegerField;
    qryInvLookupIngredienteCODIGO_TEXTO: TIBStringField;
    qryInvLookupIngredienteDESCRIPCION: TIBStringField;
    qryInvLookupIngredienteCANTIDAD: TFloatField;
    qryInvLookupIngredientePRECIO: TFloatField;
    dsqryInvLookupIngrediente: TDataSource;
    qryInvLookup_Cafbase: TIBQuery;
    qryInvLookup_Prodbase: TIBQuery;
    tblPrecioCuadros: TIBDataSet;
    dstblPrecioCuadros: TDataSource;
    tblIngredienteTrabCuadros: TIBDataSet;
    tblIngredienteTrabCuadrosID: TIntegerField;
    tblIngredienteTrabCuadrosCOD_PRODUCTO: TIntegerField;
    tblIngredienteTrabCuadrosPRECIO: TFloatField;
    dstblIngredienteTrabCuadros: TDataSource;
    tblIngredienteTrabCuadrosCODIGO_PROD_BASE: TIntegerField;
    tblIngredienteTrabCuadrosDESCRIPCION: TIBStringField;
    qryInvIngrediente: TIBQuery;
    dsqryInvIngrediente: TDataSource;
    tblIngredienteTrabCuadrosDescIngrediente: TStringField;
    qryBuscarProd: TIBQuery;
    qryBuscarProdCODIGO: TIntegerField;
    qryBuscarProdCODIGO_BARRA: TIBStringField;
    qryBuscarProdDESCRIPCION: TIBStringField;
    qryBuscarProdPRECIO: TFloatField;
    qryBuscarProdCANTIDAD: TFloatField;
    qryDimensionProd: TIBQuery;
    tblDimensionProd: TIBDataSet;
    tblDimensionProdCODIGO_PROD: TIntegerField;
    tblDimensionProdLARGO: TFloatField;
    tblDimensionProdANCHO: TFloatField;
    qryDimensionProdCODIGO_PROD: TIntegerField;
    qryDimensionProdLARGO: TFloatField;
    qryDimensionProdANCHO: TFloatField;
    tblPrecioCuadrosCOD_PRODUCTO: TIntegerField;
    tblPrecioCuadrosALTO: TFloatField;
    tblPrecioCuadrosANCHO: TFloatField;
    tblPrecioCuadrosPERDIDA: TFloatField;
    tblPrecioCuadrosPORC_BENEFICIO: TFloatField;
    tblIngredienteTrabCuadrosALTO: TFloatField;
    tblIngredienteTrabCuadrosANCHO: TFloatField;
    tblPrecioCuadrosPRECIOVENTA: TFloatField;
    tblIngredienteTrabCuadrosESCANUELA: TSmallintField;
    tblPrecioCuadrosNIVELPRECIO: TSmallintField;
    qryIngredienteTrabCuadros: TIBQuery;
    qryIngredienteTrabCuadrosDESCRIPCION: TIBStringField;
    qryIngredienteTrabCuadrosID: TIntegerField;
    qryIngredienteTrabCuadrosCODIGO_PROD_BASE: TIntegerField;
    qryIngredienteTrabCuadrosCOD_PRODUCTO: TIntegerField;
    qryIngredienteTrabCuadrosPRECIO: TFloatField;
    qryIngredienteTrabCuadrosALTO: TFloatField;
    qryIngredienteTrabCuadrosANCHO: TFloatField;
    qryIngredienteTrabCuadrosESCANUELA: TSmallintField;
    tblIngredienteTrabCuadrosESPASTATU: TSmallintField;
    qryIngredienteTrabCuadrosESPASTATU: TSmallintField;
    tblDimensionProdDESC_UNIDAD: TIBStringField;
    tblPrecioCuadrosCODIGO_CTE: TIntegerField;
    tblPrecioCuadrosFECHA: TDateTimeField;
    tblPrecioCuadrosNUMERO: TIntegerField;
    tblIngredienteTrabCuadrosNUMERO: TIntegerField;
    tblPrecioCuadrosNOMBRECLIENTE: TIBStringField;
    tblPrecioCuadrosCELULAR: TIBStringField;
    tblPrecioCuadrosSTATUS: TIBStringField;
    qryRepOrdenTrab: TIBQuery;
    qryRepOrdenTrabDet: TIBQuery;
    qryRepOrdenTrabDetID: TIntegerField;
    qryRepOrdenTrabDetNUMERO: TIntegerField;
    qryRepOrdenTrabDetCODIGO_PROD_BASE: TIntegerField;
    qryRepOrdenTrabDetCOD_PRODUCTO: TIntegerField;
    qryRepOrdenTrabDetPRECIO: TFloatField;
    qryRepOrdenTrabDetALTO: TFloatField;
    qryRepOrdenTrabDetANCHO: TFloatField;
    qryRepOrdenTrabDetESCANUELA: TSmallintField;
    qryRepOrdenTrabDetESPASTATU: TSmallintField;
    qryRepOrdenTrabDetDESC_MATERIAL: TIBStringField;
    qryRepOrdenTrabDetDESC_UNIDAD: TIBStringField;
    qryRepOrdenTrabDESC_PRODUCTO: TIBStringField;
    qryRepOrdenTrabNOMBRECTEREGISTRADO: TIBStringField;
    qryRepOrdenTrabNUMERO: TIntegerField;
    qryRepOrdenTrabFECHA: TDateTimeField;
    qryRepOrdenTrabCODIGO_CTE: TIntegerField;
    qryRepOrdenTrabCOD_PRODUCTO: TIntegerField;
    qryRepOrdenTrabALTO: TFloatField;
    qryRepOrdenTrabANCHO: TFloatField;
    qryRepOrdenTrabPERDIDA: TFloatField;
    qryRepOrdenTrabPORC_BENEFICIO: TFloatField;
    qryRepOrdenTrabPRECIOVENTA: TFloatField;
    qryRepOrdenTrabNIVELPRECIO: TSmallintField;
    qryRepOrdenTrabNOMBRECLIENTE: TIBStringField;
    qryRepOrdenTrabCELULAR: TIBStringField;
    qryRepOrdenTrabSTATUS: TIBStringField;
    qryRepOrdenTrabNUMERO_TRN_VTA: TIntegerField;
    tblPrecioCuadrosNUMERO_TRN_VTA: TIntegerField;
    tblPrecioCuadrosCODIGO_OPERADOR: TIntegerField;
    tblPrecioCuadrosCOMENTARIO: TMemoField;
    qryRepOrdenTrabCODIGO_OPERADOR: TIntegerField;
    qryRepOrdenTrabCOMENTARIO: TMemoField;
    tblPrecioCuadrosMONTO_ABONADO: TFloatField;
    qryRepOrdenTrabMONTO_ABONADO: TFloatField;
    tblPrecioCuadrosMontoRestante: TCurrencyField;
    qryRepOrdenTrabNOMBREOPERADOR: TIBStringField;
    qryRepOrdenTrabFECHAENTREGA: TDateTimeField;
    tblDimensionProdDESPERDICIO: TFloatField;
    tblDimensionProdDESCUNIABREV: TIBStringField;
    qryDimensionProdDESC_UNIDAD: TIBStringField;
    qryDimensionProdDESPERDICIO: TFloatField;
    qryDimensionProdDESCUNIABREV: TIBStringField;
    qryRepOrdenTrabDetDESPERDICIO: TFloatField;
    qryRepOrdenTrabDetDESCUNIABREV: TIBStringField;
    qryRepOrdenTrabCOD_USR: TIntegerField;
    qryRepOrdenTrabNOMBREUSUARIOREG: TIBStringField;
    tblPrecioCuadrosFECHAENTREGA: TDateTimeField;
    tblPrecioCuadrosCOD_USR: TIntegerField;
    qryRepOrdenTrabDetNUM_CANUELA: TSmallintField;
    tblIngredienteTrabCuadrosNUM_CANUELA: TSmallintField;
    tblPrecioCuadrosDOBLEPASTATU: TSmallintField;
    qryRepOrdenTrabDOBLEPASTATU: TSmallintField;
    tblIngredienteTrabCuadrosCANT_MERMA: TFloatField;
    qryIngredienteTrabCuadrosNUMERO: TIntegerField;
    qryIngredienteTrabCuadrosNUM_CANUELA: TSmallintField;
    qryIngredienteTrabCuadrosCANT_MERMA: TFloatField;
    tblPrecioCuadrosPORC_DESCUENTO: TFloatField;
    tblPrecioCuadrosMONTODESCUENTO: TFloatField;
    qryRepOrdenTrabPORC_DESCUENTO: TFloatField;
    qryRepOrdenTrabMONTODESCUENTO: TFloatField;
    rxMaterialUsado: TRxMemoryData;
    rxMaterialUsadoCanuela: TCurrencyField;
    rxMaterialUsadoPaspatu: TCurrencyField;
    rxMaterialUsadoCodigo_prod: TIntegerField;
    rxMaterialUsadoEsCanuela: TIntegerField;
    rxMaterialUsadoEsPaspatu: TSmallintField;
    ibsqlUpdatePrecioCuadro: TIBSQL;
    tblPrecioCuadrosDOBLE_CANUELA: TSmallintField;
    tblIngredienteTrabCuadrosCODIGO_BARRA: TIBStringField;
    tblPrecioCuadrosCON_DOBLE_CRISTAL: TSmallintField;
    qryInvLookupIngredienteLARGO: TFloatField;
    qryInvLookupIngredienteANCHO: TFloatField;
    qryInvLookupIngredienteDESPERDICIO: TFloatField;
    tblPrecioCuadrosFORMAPAGO_ABONO: TSmallintField;
    tblPrecioCuadrosCON_CANVAS: TSmallintField;
    qryInvMatDesc: TIBQuery;
    qryInvMatDescCODIGO: TIntegerField;
    qryInvMatDescFECHA: TDateTimeField;
    qryInvMatDescCODIGO_BARRA: TIBStringField;
    qryInvMatDescDESCRIPCION: TIBStringField;
    qryInvMatDescCANTIDAD: TFloatField;
    qryInvMatDescPRECIO: TFloatField;
    tblIngredienteTrabCuadrosDescMaterialLookup: TStringField;
    tblIngredienteTrabCuadrosLEVEL_PRECIO: TSmallintField;
    qryInvLookupIngredienteCODIGO_BARRA: TIBStringField;
    dstblPrecioCuadrosMast: TDataSource;
    tblPrecioCuadrosNUMERO_MAST: TIntegerField;
    tblPrecioCuadrosMast: TIBDataSet;
    tblPrecioCuadrosMastNUMERO: TIntegerField;
    tblPrecioCuadrosMastCODIGO_CTE: TIntegerField;
    tblPrecioCuadrosMastSTATUS: TIBStringField;
    tblPrecioCuadrosMastFECHA: TDateTimeField;
    qryTotalPrecioCuadros: TIBQuery;
    qryTotalPrecioCuadrosMONTOTOTAL: TFloatField;
    dsqryTotalPrecioCuadros: TDataSource;
    ibsqlUpdateCodCte: TIBSQL;
    procedure tblPanRecetaAfterScroll(DataSet: TDataSet);
    procedure tblPanReqMateriaPMastAfterScroll(DataSet: TDataSet);
    procedure tblPanProduccionMastAfterScroll(DataSet: TDataSet);
    procedure qryRepPanProdEmpMasterAfterScroll(DataSet: TDataSet);
    procedure tblCafeteriaMasterAfterScroll(DataSet: TDataSet);
    procedure tblPrecioCuadrosAfterScroll(DataSet: TDataSet);
    procedure qryRepOrdenTrabAfterScroll(DataSet: TDataSet);
    procedure tblPrecioCuadrosCalcFields(DataSet: TDataSet);
    procedure tblPrecioCuadrosBeforePost(DataSet: TDataSet);
    procedure tblIngredienteTrabCuadrosBeforePost(DataSet: TDataSet);
    procedure tblIngredienteTrabCuadrosBeforeOpen(DataSet: TDataSet);
    procedure tblPrecioCuadrosMastBeforePost(DataSet: TDataSet);
    procedure tblPrecioCuadrosMastAfterScroll(DataSet: TDataSet);
    procedure tblPrecioCuadrosMastAfterInsert(DataSet: TDataSet);
    procedure tblPrecioCuadrosAfterPost(DataSet: TDataSet);
  private
    procedure ActualizaMerma(cantM: currency; codprod, numtrn: integer);
    { Private declarations }
  public
    { Public declarations }
    procedure CalcularPrecio;

    procedure CalcularPrecioDobleC;
    procedure CalcularPrecioDobleP;
    procedure CalcularPrecioCanvas;
  end;

var
  dmPanaderia: TdmPanaderia;
  //guardarRec : TBookMark;
  CantMerma : Currency;

implementation

uses UDatModConectar, uglobal, Math, StrUtils;

{$R *.dfm}

procedure TdmPanaderia.tblPanRecetaAfterScroll(DataSet: TDataSet);
begin
  if tblPanRecetaDet.State In [dsInactive, dsBrowse] then
  begin
    tblPanRecetaDet.Close;
    tblPanRecetaDet.Params[0].Value:= tblPanRecetaid_Receta.Value;
    tblPanRecetaDet.Open;
  end;
end;

procedure TdmPanaderia.tblPanReqMateriaPMastAfterScroll(DataSet: TDataSet);
begin
  if tblPanReqMateriaPDet.State in [dsInactive, dsBrowse] then
  begin
    tblPanReqMateriaPDet.Close;
    tblPanReqMateriaPDet.Params[0].Value:=tblPanReqMateriaPMastID_REQUISICION.Value;
    tblPanReqMateriaPDet.Open;
  end;
end;

procedure TdmPanaderia.tblPanProduccionMastAfterScroll(DataSet: TDataSet);
begin
  if tblPanProduccionDet.state in [dsInactive, dsBrowse] then
  begin
    tblPanProduccionDet.Close;
    tblPanProduccionDet.Params[0].Value:=tblPanProduccionMastCOD_EMPLEADO.Value;
    tblPanProduccionDet.Params[1].Value:=ExtraerFecha(tblPanProduccionMast.Params[0].Value);
    tblPanProduccionDet.Params[2].Value:=ExtraerFecha(tblPanProduccionMast.Params[1].Value);
    tblPanProduccionDet.Open;
  end;
end;

procedure TdmPanaderia.qryRepPanProdEmpMasterAfterScroll(
  DataSet: TDataSet);
begin
  if qryRepPanProdEmpDet.state in [dsInactive, dsBrowse] then
  begin
    qryRepPanProdEmpDet.Close;
    qryRepPanProdEmpDet.Params[0].Value:=qryRepPanProdEmpMaster.fieldbyname('cod_empleado').Value;
    qryRepPanProdEmpDet.Params[1].Value:=qryRepPanProdEmpMaster.Params[0].Value;
    qryRepPanProdEmpDet.Params[2].Value:=qryRepPanProdEmpMaster.Params[1].Value;
    qryRepPanProdEmpDet.Open;
  end;
end;

procedure TdmPanaderia.tblCafeteriaMasterAfterScroll(DataSet: TDataSet);
begin
  dmPanaderia.tblCafeteriaDetalle.Close;
  dmPanaderia.tblCafeteriaDetalle.params[0].Value:= dmPanaderia.tblCafeteriaMasterNUMERO.Value;
  dmPanaderia.tblCafeteriaDetalle.Open;
end;

procedure TdmPanaderia.tblPrecioCuadrosAfterScroll(DataSet: TDataSet);
begin
  if tblPrecioCuadrosNumero.IsNull then
  begin
    tblIngredienteTrabCuadros.Close;
    exit;
  end;
  tblIngredienteTrabCuadros.Close;
  tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNumero.Value;
  tblIngredienteTrabCuadros.Open;

end;

procedure TdmPanaderia.CalcularPrecio;
var
   PrecioIngredientes: Currency;
   Dimen,PrecioCanuela,PrecioPastatu : Currency;
   PrecioCanvas,MontoCanvas, CantMermaCanuela : Currency;
   CantMermaPaspatu : Currency;
begin
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit; 

  if rxMaterialUsado.State = dsInactive then
  rxMaterialUsado.Open;
  
  if tblPrecioCuadrosNUMERO.IsNull then Exit;

  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;

  if tblPrecioCuadrosCON_CANVAS.Value = 1 then
  begin
    if tblPrecioCuadrosDOBLE_CANUELA.Value = 1 then
    CalcularPrecioDobleC
    else
    CalcularPrecioCanvas;
    exit;
  end else
  if tblPrecioCuadrosDOBLEPASTATU.Value = 1 then
  begin
    CalcularPrecioDobleP;
    Exit;
  end else
  if tblPrecioCuadrosDOBLE_CANUELA.Value = 1 then
  begin
    CalcularPrecioDobleC;
    Exit;
  end;
  {
  16+8=24 y 20+8=28 se suman 24+28=52x2=104+ 12 de desperdicios=116÷12=9.66x
  el precio de la cañuela en este caso será 90=$869.99+ el paspatu 150=1019.99+
  el cristal 300 =1319.99 más el 10%=1451.98
  }
  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    //if not tblPrecioCuadrosNumero.IsNull then
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  CantMerma :=0;

  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;

  qryIngredienteTrabCuadros.Close;
  qryIngredienteTrabCuadros.Params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.Params[1].Value:= tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.Open;


  if tblPrecioCuadros.State = dsBrowse then
  tblPrecioCuadros.Edit;

  while not qryIngredienteTrabCuadros.Eof do
  begin
    if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
    and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;
      
    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      Dimen:=Dimen +
      qryIngredienteTrabCuadrosANCHO.Value;
    end else
    Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;

    if rxMaterialUsado.State = dsInactive then
    rxMaterialUsado.Open;
    
    if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
    rxMaterialUsado.Append else rxMaterialUsado.edit;

    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      rxMaterialUsadoEsCanuela.Value:=1;
      PrecioCanuela:=PrecioCanuela + qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;

      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoCanuela.Value := rxMaterialUsadoCanuela.Value + CantMermaCanuela+
      qryIngredienteTrabCuadrosALTO.Value;

    end else
    if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
    begin
      rxMaterialUsadoEsCanuela.Value:=1;
      PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu +
      qryIngredienteTrabCuadrosALTO.Value;
    end else
    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      PrecioIngredientes:=PrecioIngredientes + (qryIngredienteTrabCuadrosPRECIO.Value * 1)
      else
      PrecioIngredientes:=PrecioIngredientes + qryIngredienteTrabCuadrosPRECIO.Value;
    end else
    PrecioIngredientes:=PrecioIngredientes + qryIngredienteTrabCuadrosPRECIO.Value;

    if Not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
    CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;

    if rxMaterialUsado.State In [dsEdit, dsInsert] then
    rxMaterialUsado.Post;

    qryIngredienteTrabCuadros.Next;
  end;
  WriteToLog('Dimesión A: '+FloatToStr(Dimen));

  if tblPrecioCuadros.State = dsBrowse then
  tblPrecioCuadros.Edit;

  tblPrecioCuadrosPrecioVenta.Value:=
  (tblPrecioCuadrosALTO.Value +
   tblPrecioCuadrosANCHO.Value + (Dimen * 4)) * 2 ;

  WriteToLog('Dimensión Total: ' + tblPrecioCuadrosPrecioVenta.AsString);

  tblPrecioCuadrosPERDIDA.Value :=CantMerma;

  tblPrecioCuadrosPrecioVenta.Value:=
  ((tblPrecioCuadrosPrecioVenta.Value + CantMerma) / 12) *  //12Pulgadas para llevarlo a Pies
  PrecioCanuela;

  //tblPrecioCuadrosMontoDescuento.Value:=
  //(tblPrecioCuadrosPrecioVenta.Value * (tblPrecioCuadrosPORC_DESCUENTO.Value /100));

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);

  tblPrecioCuadrosPrecioVenta.Value:=
  ((tblPrecioCuadrosPrecioVenta.Value - tblPrecioCuadrosMontoDescuento.Value)
  + PrecioIngredientes + PrecioPastatu )
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  tblPrecioCuadrosPrecioVenta.Value:=RoundTo(tblPrecioCuadrosPrecioVenta.Value,0);
  WriteToLog('Precio Total: '+tblPrecioCuadrosPrecioVenta.AsSTring);
{
  qryTotalPrecioCuadros.Close;
  qryTotalPrecioCuadros.Params[0].Value:= tblPrecioCuadrosNUMERO_MAST.Value;
  qryTotalPrecioCuadros.Open;}

end;
procedure TdmPanaderia.ActualizaMerma(cantM:currency;codprod:integer;numtrn:integer);
begin
  ibsqlUpdatePrecioCuadro.Params[0].Value:= cantM;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= codprod;
  ibsqlUpdatePrecioCuadro.Params[2].Value:= numtrn;
  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;
end;
procedure TdmPanaderia.qryRepOrdenTrabAfterScroll(DataSet: TDataSet);
begin
  qryRepOrdenTrabDet.Close;
  qryRepOrdenTrabDet.Params[0].Value:= qryRepOrdenTrabnumero.value;
  qryRepOrdenTrabDet.Open;
end;

procedure TdmPanaderia.tblPrecioCuadrosCalcFields(DataSet: TDataSet);
begin
  if not tblPrecioCuadrosMONTO_ABONADO.IsNull then
  tblPrecioCuadrosMontoRestante.Value:=
  tblPrecioCuadrosPRECIOVENTA.Value -
  tblPrecioCuadrosMONTO_ABONADO.Value
  else   tblPrecioCuadrosMontoRestante.Value:=
  tblPrecioCuadrosPRECIOVENTA.Value;
end;

procedure TdmPanaderia.CalcularPrecioDobleP;
var
   PrecioIngredientes : Currency;
   DimenTotal,Dimen,PrecioCanuela,PrecioPastatu : Currency;
   MontoCanvas,CantMerma,PrecioCanvas : Currency;

   SumAlto, SumAncho : Currency;
   CantMermaCanuela, CantMermaPaspatu : Currency;
begin
  {
  16+8=24 y 20+8=28 se suman 24+28=52x2=104+ 12 de desperdicios=116÷12=9.66x
  el precio de la cañuela en este caso será 90=$869.99+ el paspatu 150=1019.99+
  el cristal 300 =1319.99 más el 10%=1451.98
  }
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit;

  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  DimenTotal:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  SumAlto:=0;
  SumAncho:=0;
  qryIngredienteTrabCuadros.close;
  qryIngredienteTrabCuadros.params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.params[1].Value:=tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.open;
  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMerma:=0;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;
  PrecioCanvas:=0;
  rxMaterialUsado.Close;
  rxMaterialUsado.Open;
  while not qryIngredienteTrabCuadros.Eof do
  begin
      if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
         and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;

    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      Dimen:=Dimen +
      qryIngredienteTrabCuadrosANCHO.Value;
    end else
    Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;
    if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
    rxMaterialUsado.Append else rxMaterialUsado.edit;
    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      PrecioCanuela:=PrecioCanuela +qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoCanuela.Value :=rxMaterialUsadoCanuela.Value + CantMermaCanuela;
    end else
    if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
    begin
      PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu;
    end else
    PrecioIngredientes:=PrecioIngredientes +
    qryIngredienteTrabCuadrosPRECIO.Value;

    if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
    CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;
    if rxMaterialUsado.State in [dsEdit, dsInsert] then
    rxMaterialUsado.Post;
    qryIngredienteTrabCuadros.Next;
  end;
  SumAlto :=tblPrecioCuadrosALTO.Value + (Dimen * 2);
  SumAncho:=tblPrecioCuadrosANCHO.Value + (Dimen * 2);

  DimenTotal:= (SumAlto + SumAncho) * 2;

  //if CantMerma > 0 then
  DimenTotal:=((DimenTotal + CantMerma) / 12) * PrecioCanuela;

  if (tblPrecioCuadros.State = dsBrowse) then
  tblPrecioCuadros.Edit;
  tblPrecioCuadrosPrecioVenta.Value:=0;
  tblPrecioCuadrosMontoDescuento.Value:=0;
  //tblPrecioCuadrosMontoDescuento.Value:=
  //(DimenTotal * (100 /100));

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);

  tblPrecioCuadrosPrecioVenta.Value:=((DimenTotal - tblPrecioCuadrosMontoDescuento.Value) +
  PrecioIngredientes + PrecioPastatu) *
  (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  ibsqlUpdatePrecioCuadro.Params[0].Value:= CantMerma;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= tblPrecioCuadrosCOD_PRODUCTO.Value;

  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;

end;

procedure TdmPanaderia.tblPrecioCuadrosBeforePost(DataSet: TDataSet);
begin
  if tblPrecioCuadrosNUMERO_MAST.IsNull then
  begin
    if tblPrecioCuadrosMastNUMERO.IsNull then
    GlbSalvarQuery(tblPrecioCuadros);
    tblPrecioCuadrosNUMERO_MAST.Value:=tblPrecioCuadrosMastNUMERO.Value;
  end;
  if dmPanaderia.tblPrecioCuadrosCODIGO_CTE.IsNull or (dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value = 0)
  and (dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value > 0) then
    dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value:=dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value;

  dmPanaderia.CalcularPrecio;
end;

procedure TdmPanaderia.CalcularPrecioDobleC;
var
   PrecioIngredientes : Currency;
   DimenTotal,Dimen,PrecioCanuela,PrecioPastatu : Currency;
   CantMerma,PrecioCanvas,MontoCanvas : Currency;

   SumAlto, SumAncho : Currency;
   CantMermaCanuela, CantMermaPaspatu : Currency;
begin
  {
  16+8=24 y 20+8=28 se suman 24+28=52x2=104+ 12 de desperdicios=116÷12=9.66x
  el precio de la cañuela en este caso será 90=$869.99+ el paspatu 150=1019.99+
  el cristal 300 =1319.99 más el 10%=1451.98
  }
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit;

  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  DimenTotal:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  SumAlto:=0;
  SumAncho:=0;
  qryIngredienteTrabCuadros.close;
  qryIngredienteTrabCuadros.params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.params[1].Value:=tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.open;
  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMerma:=0;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;
  rxMaterialUsado.Close;
  rxMaterialUsado.Open;
  while not qryIngredienteTrabCuadros.Eof do
  begin
    if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
    and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;

    if AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CRISTAL') then
    begin
      if tblPrecioCuadrosCON_DOBLE_CRISTAL.Value = 1 then
      Dimen:=Dimen +
      qryIngredienteTrabCuadrosANCHO.Value;
    end else  
    Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;
    
    if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
    rxMaterialUsado.Append else rxMaterialUsado.edit;
    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      PrecioCanuela:=PrecioCanuela + qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoCanuela.Value :=rxMaterialUsadoCanuela.Value + CantMermaCanuela;
    end else
    if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
    begin
      PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
      rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu;
    end else
    PrecioIngredientes:=PrecioIngredientes +
    qryIngredienteTrabCuadrosPRECIO.Value;

    if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
    CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;
    if rxMaterialUsado.State in [dsEdit, dsInsert] then
    rxMaterialUsado.Post;
    qryIngredienteTrabCuadros.Next;
  end;
  SumAlto :=tblPrecioCuadrosALTO.Value + (Dimen * 2);
  SumAncho:=tblPrecioCuadrosANCHO.Value + (Dimen * 2);

  DimenTotal:= (SumAlto + SumAncho) * 2;

  //if CantMerma > 0 then
  DimenTotal:=((DimenTotal + CantMerma) / 12) * PrecioCanuela;

  if (tblPrecioCuadros.State = dsBrowse) then
  tblPrecioCuadros.Edit;
  tblPrecioCuadrosPrecioVenta.Value:=0;
  tblPrecioCuadrosMontoDescuento.Value:=0;  
  //tblPrecioCuadrosMontoDescuento.Value:=
  //(DimenTotal * (100 /100));

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);

  tblPrecioCuadrosPrecioVenta.Value:=((DimenTotal - tblPrecioCuadrosMontoDescuento.Value) +
  PrecioIngredientes + PrecioPastatu) *
  (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  ibsqlUpdatePrecioCuadro.Params[0].Value:= CantMerma;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= tblPrecioCuadrosCOD_PRODUCTO.Value;

  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;  
end;

procedure TdmPanaderia.tblIngredienteTrabCuadrosBeforePost(
  DataSet: TDataSet);
begin
  if (dmPanaderia.tblPrecioCuadrosNUMERO.IsNull) then
  begin
    exit;
  end;
  if dmPanaderia.tblIngredienteTrabCuadros.State in [dsInsert] then
  begin
    if dmPanaderia.tblIngredienteTrabCuadrosNumero.IsNull then
    dmPanaderia.tblIngredienteTrabCuadrosNumero.Value:=
    dmPanaderia.tblPrecioCuadrosNUMERO.Value;
    
    if dmPanaderia.tblIngredienteTrabCuadrosId.IsNull then
    dmPanaderia.tblIngredienteTrabCuadrosid.Value := FsqlMaxNumero('Precio_Cuadros_det','id');
  end;
end;

//not en uso
procedure TdmPanaderia.CalcularPrecioCanvas;
var
   PrecioCanvas, PrecioIngredientes : Currency;
   DimenTotal,Dimen,PrecioCanuela,PrecioPastatu : Currency;
   CantMerma : Currency;

   SumAlto, SumAncho : Currency;
   CantMermaCanuela, CantMermaPaspatu : Currency;
   MontoCanvas: Currency;

begin
  {
   FORMULA CANVAS
   =============
   2+2 = 4+16 =20; 4+20 =24; Se multiplica ambos lados 20 * 24 = 480; 480 / 144 = 3.333333 x 350 = 1,166.66
  }
  if (tblPrecioCuadrosSTATUS.Value = 'R') then
  Exit;

  if tblPrecioCuadrosALTO.IsNull or
  tblPrecioCuadrosANCHO.IsNull then exit;

  if tblIngredienteTrabCuadros.state = dsInactive then
  begin
    tblIngredienteTrabCuadros.Close;
    tblIngredienteTrabCuadros.Params[0].value:= tblPrecioCuadrosNUMERO.Value;
    tblIngredienteTrabCuadros.Open;
  end;

  tblIngredienteTrabCuadros.First;
  PrecioIngredientes:= 0;
  Dimen:=0;
  DimenTotal:=0;
  PrecioCanuela:=0;
  PrecioPastatu:=0;
  SumAlto:=0;
  SumAncho:=0;
  qryIngredienteTrabCuadros.close;
  qryIngredienteTrabCuadros.params[0].Value:=tblPrecioCuadrosCOD_PRODUCTO.Value;
  qryIngredienteTrabCuadros.params[1].Value:=tblPrecioCuadrosNUMERO.Value;
  qryIngredienteTrabCuadros.open;
  if tblPrecioCuadros.state = dsBrowse then
  tblPrecioCuadros.Edit;
  CantMerma:=0;
  CantMermaCanuela:=0;
  CantMermaPaspatu:=0;
  rxMaterialUsado.Close;
  rxMaterialUsado.Open;
  while not qryIngredienteTrabCuadros.Eof do
  begin                          
    if (qryIngredienteTrabCuadrosCOD_PRODUCTO.Value = tblPrecioCuadrosCOD_PRODUCTO.Value)
         and (AnsiContainsStr(upperCase(qryIngredienteTrabCuadrosDESCRIPCION.Value),'CANVAS'))
    then
    PrecioCanvas:= qryIngredienteTrabCuadrosPRECIO.Value;
       
    if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
    begin
      Dimen:=Dimen + qryIngredienteTrabCuadrosANCHO.Value;

      if not rxMaterialUsado.Locate('Codigo_prod',qryIngredienteTrabCuadrosCOD_PRODUCTO.Value,[]) then
      rxMaterialUsado.Append else rxMaterialUsado.edit;

      if qryIngredienteTrabCuadrosEsCanuela.Value = 1 then
      begin
        PrecioCanuela:=PrecioCanuela +qryIngredienteTrabCuadrosPRECIO.Value;
        if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
        CantMermaCanuela:=CantMermaCanuela + qryIngredienteTrabCuadrosCANT_MERMA.Value;
        rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
        rxMaterialUsadoCanuela.Value :=rxMaterialUsadoCanuela.Value + CantMermaCanuela;
      end else
      if qryIngredienteTrabCuadrosESPASTATU.Value = 1 then
      begin
        PrecioPastatu:=qryIngredienteTrabCuadrosPRECIO.Value;
        if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
        CantMermaPaspatu:=CantMermaPaspatu + qryIngredienteTrabCuadrosCANT_MERMA.Value;
        rxMaterialUsadoCodigo_prod.Value:=qryIngredienteTrabCuadrosCOD_PRODUCTO.Value;
        rxMaterialUsadoPaspatu.Value :=rxMaterialUsadoPaspatu.Value + CantMermaPaspatu;
      end else
      PrecioIngredientes:=PrecioIngredientes +
      qryIngredienteTrabCuadrosPRECIO.Value;

      if not qryIngredienteTrabCuadrosCANT_MERMA.IsNull then
      CantMerma:=CantMerma + qryIngredienteTrabCuadrosCANT_MERMA.Value;
      if rxMaterialUsado.State in [dsEdit, dsInsert] then
      rxMaterialUsado.Post;
    end;
    qryIngredienteTrabCuadros.Next;
  end;
  if Dimen > 0 then
  begin
    SumAlto :=tblPrecioCuadrosALTO.Value + (Dimen * 2);
    SumAncho:=tblPrecioCuadrosANCHO.Value + (Dimen * 2);

    DimenTotal:= (SumAlto + SumAncho) * 2;

    //if CantMerma > 0 then
    DimenTotal:=((DimenTotal + CantMerma) / 12) * PrecioCanuela;

    if (tblPrecioCuadros.State = dsBrowse) then
    tblPrecioCuadros.Edit;
  tblPrecioCuadrosPrecioVenta.Value:=0;
  tblPrecioCuadrosMontoDescuento.Value:=0;    
    //tblPrecioCuadrosMontoDescuento.Value:=
    //(DimenTotal * (tblPrecioCuadrosPORC_DESCUENTO.Value /100));
  end else
  tblPrecioCuadrosPrecioVenta.Value:=0;

  MontoCanvas:= (((tblPrecioCuadrosALTO.Value + 4) *
                (tblPrecioCuadrosANCHO.Value + 4)) / 144) * PrecioCanvas;

  MontoCanvas:=(MontoCanvas - (0 * (100 /100)))
  * (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100);

  tblPrecioCuadrosPrecioVenta.Value:=((DimenTotal - tblPrecioCuadrosMontoDescuento.Value) +
  PrecioIngredientes + PrecioPastatu) *
  (1+tblPrecioCuadrosPORC_BENEFICIO.Value/100) + MontoCanvas;

  ibsqlUpdatePrecioCuadro.Params[0].Value:= CantMerma;
  ibsqlUpdatePrecioCuadro.Params[1].Value:= tblPrecioCuadrosCOD_PRODUCTO.Value;

  try
    ibsqlUpdatePrecioCuadro.ExecQuery;
    if not ibsqlUpdatePrecioCuadro.Transaction.InTransaction then
    ibsqlUpdatePrecioCuadro.Transaction.StartTransaction;
    ibsqlUpdatePrecioCuadro.Transaction.CommitRetaining;
  except
  ibsqlUpdatePrecioCuadro.Transaction.RollbackRetaining;
  end;
end;

procedure TdmPanaderia.tblIngredienteTrabCuadrosBeforeOpen(
  DataSet: TDataSet);
begin
  qryInvMatDesc.close;
  qryInvMatDesc.open;
end;

procedure TdmPanaderia.tblPrecioCuadrosMastBeforePost(DataSet: TDataSet);
begin
  if dmPanaderia.tblPrecioCuadrosMastFecha.IsNull then
  dmPanaderia.tblPrecioCuadrosMastFecha.Value:= ExtraerFecha(GlbFechaTrnDiaria);

  if dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.IsNull or (dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value = 0) then
  begin
    if not tblPrecioCuadrosCODIGO_CTE.IsNull then
    dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value:=tblPrecioCuadrosCODIGO_CTE.Value;
  end;
end;

procedure TdmPanaderia.tblPrecioCuadrosMastAfterScroll(DataSet: TDataSet);
begin
  if tblPrecioCuadros.State = dsBrowse then
  begin
    if not tblPrecioCuadros.Locate('NUMERO_MAST',tblPrecioCuadrosMastNUMERO.Value,[]) then
    begin
      dmPanaderia.tblPrecioCuadros.Close;
      dmPanaderia.tblPrecioCuadros.Params[0].Value:=ExtraerFecha(tblPrecioCuadrosMastFECHA.Value);
      dmPanaderia.tblPrecioCuadros.Params[1].Value:=ExtraerFecha(tblPrecioCuadrosMastFECHA.Value);
      dmPanaderia.tblPrecioCuadros.Params[2].Value:='A';
      dmPanaderia.tblPrecioCuadros.Params[3].Value:='A';
      dmPanaderia.tblPrecioCuadros.Params[4].Value:=tblPrecioCuadrosMastNUMERO.Value;
      dmPanaderia.tblPrecioCuadros.Open;
    end;
  end;
  qryTotalPrecioCuadros.close;
  qryTotalPrecioCuadros.Params[0].Value:= tblPrecioCuadrosMastNUMERO.Value;
  qryTotalPrecioCuadros.open;
end;

procedure TdmPanaderia.tblPrecioCuadrosMastAfterInsert(DataSet: TDataSet);
begin
 rxMaterialUsado.Close;
 rxMaterialUsado.Open;
end;

procedure TdmPanaderia.tblPrecioCuadrosAfterPost(DataSet: TDataSet);
begin
  qryTotalPrecioCuadros.Close;
  qryTotalPrecioCuadros.Params[0].Value:= tblPrecioCuadrosNUMERO_MAST.Value;
  qryTotalPrecioCuadros.Open;
  ibsqlUpdateCodCte.Params[0].Value:=tblPrecioCuadrosCODIGO_CTE.Value;
  ibsqlUpdateCodCte.Params[1].Value:=tblPrecioCuadrosNUMERO_MAST.Value;
  ibsqlUpdateCodCte.ExecQuery;
  try
    if not ibsqlUpdateCodCte.Transaction.InTransaction then
    ibsqlUpdateCodCte.Transaction.StartTransaction;
    ibsqlUpdateCodCte.Transaction.CommitRetaining;
  except
  ibsqlUpdateCodCte.Transaction.RollbackRetaining;
  end;
end;

end.

