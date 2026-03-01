unit UDatModInventario;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBUpdateSQL, IBTable, IBQuery,
  IBSQL, IBStoredProc;

type
  TdmInventario = class(TDataModule)
    tblInventarioProd: TIBDataSet;
    dsInventarioProd: TDataSource;
    dstblTipoInventario: TDataSource;
    tblInventarioHistorico: TIBDataSet;
    tblInventarioHistoricoSERIE: TIntegerField;
    tblInventarioHistoricoPRECIO: TFloatField;
    tblInventarioHistoricoFECHA_INICIO: TDateTimeField;
    tblInventarioHistoricoFECHA_FINAL: TDateTimeField;
    tblInventarioHistoricoSTATUS: TIBStringField;
    dstblInventarioHistorico: TDataSource;
    tblInventarioHistoricoDESCRIPCION: TIBStringField;
    qryConsultaInvActual: TIBQuery;
    dsqryConsultaInvActual: TDataSource;
    qryConsultaInvhist: TIBQuery;
    dsqryConsultaInvhist: TDataSource;
    qryConsultaInvhistSERIE: TIntegerField;
    qryConsultaInvhistCODIGO: TIBStringField;
    qryConsultaInvhistPRECIO: TFloatField;
    qryConsultaInvhistFECHA_INICIO: TDateTimeField;
    qryConsultaInvhistFECHA_FINAL: TDateTimeField;
    qryValorEnInventario: TIBSQL;
    tblInventarioProdCODIGO: TIntegerField;
    tblInventarioProdFECHA: TDateTimeField;
    tblInventarioProdCODIGO_BARRA: TIBStringField;
    tblInventarioProdTIPO: TIntegerField;
    tblInventarioProdDESCRIPCION: TIBStringField;
    tblInventarioProdCANTIDAD_REORDEN: TIntegerField;
    tblInventarioProdPRECIO_ANT: TFloatField;
    tblInventarioProdCANTIDAD: TFloatField;
    tblInventarioProdPRECIO: TFloatField;
    tblInventarioProdBLCE_CANT_ENTRADA: TFloatField;
    tblInventarioProdBLCE_CANT_SALIDA: TFloatField;
    tblInventarioProdFECHA_ULTIMA_TRN: TDateTimeField;
    tblInventarioProdSTATUS: TIBStringField;
    tblInventarioProdPORC_DESCUENTO: TFloatField;
    tblInventarioProdFOTO: TBlobField;
    tblInventarioProdPAGA_ITBI: TSmallintField;
    qryValorLetras: TIBQuery;
    qryValorLetrasCODIGO: TIBStringField;
    qryValorLetrasVALOR: TFloatField;
    tblInventarioProdCODIGO_PRECIO: TIBStringField;
    tblTipoInventario: TIBQuery;
    tblTipoInventarioCODIGO: TSmallintField;
    tblTipoInventarioDESCRIPCION: TIBStringField;
    IBUpdateSQL2: TIBUpdateSQL;
    tblInventarioProdUNIDAD: TFloatField;
    tblPrecioInventario: TIBDataSet;
    tblPrecioInventarioCODIGO_TEXTO: TIBStringField;
    tblPrecioInventarioFECHA_INICIAL: TDateTimeField;
    tblPrecioInventarioFECHA_FINAL: TDateTimeField;
    tblPrecioInventarioOBSERVACION: TIBStringField;
    tblPrecioInventarioPRECIO_DISTRIBUIDOR: TFloatField;
    tblPrecioInventarioPRECIO_UNITARIO: TFloatField;
    tblPrecioInventarioMARGENES: TFloatField;
    tblPrecioInventarioPRECIOS_EN_GENERAL: TFloatField;
    tblPrecioInventarioSTATUS: TIBStringField;
    tblPrecioInventarioIN_POR: TIBStringField;
    tblPrecioInventarioMOD_POR: TIBStringField;
    tblPrecioInventarioFECHA_IN: TDateTimeField;
    tblPrecioInventarioFECHA_MOD: TDateTimeField;
    qryPrecioInventario: TIBQuery;
    qryPrecioInventarioFECHA_FINAL: TDateTimeField;
    qryPrecioInventarioFECHA_INICIAL: TDateTimeField;
    qryPrecioInventarioPRECIO_DISTRIBUIDOR: TFloatField;
    tblInventarioProdPRECIO_COMPRA: TFloatField;
    stpProcInsCostoProd: TIBStoredProc;
    qryProveedores: TIBQuery;
    qryProveedoresCODIGO_CTE: TIntegerField;
    qryProveedoresTIPO_CLIENTE: TIntegerField;
    qryProveedoresDESCRIPCION: TIBStringField;
    qryProveedoresCONTACTO: TIBStringField;
    qryProveedoresPAIS: TIBStringField;
    qryProveedoresESTADO: TIBStringField;
    qryProveedoresCIUDAD: TIBStringField;
    qryProveedoresCALYYNUM: TIBStringField;
    qryProveedoresTELEFONO: TIBStringField;
    qryProveedoresFAX: TIBStringField;
    qryProveedoresCODIGOPOSTAL: TIBStringField;
    qryProveedoresEMAIL: TIBStringField;
    qryProveedoresDIRECCIONWEB: TIBStringField;
    qryProveedoresSTATUS: TIBStringField;
    qryProveedoresFECHA_IN: TDateTimeField;
    qryProveedoresIN_POR: TIBStringField;
    qryProveedoresFECHA_MOD: TDateTimeField;
    qryProveedoresMOD_POR: TIBStringField;
    dsqryProveedores: TDataSource;
    qryPrecioCompraArti: TIBQuery;
    dsqryPrecioCompraArti: TDataSource;
    qryPrecioCompraArtiPRECIO: TFloatField;
    qryPrecioCompraArtiMargen: TFloatField;
    stpProcActBlcProvCxp: TIBStoredProc;
    tblInventarioProdPRECIO_MINIMO: TFloatField;
    tblInventarioProdREFERENCIA: TIBStringField;
    tblInventarioSERIE: TIBDataSet;
    dstblInventarioSERIE: TDataSource;
    tblInventarioSERIECODIGO: TIntegerField;
    tblInventarioSERIESERIE: TIBStringField;
    tblInventarioSERIESTATUS: TIBStringField;
    qryConsultaInvActualBLCE_CANT_ENTRADA: TFloatField;
    qryConsultaInvActualBLCE_CANT_SALIDA: TFloatField;
    qryConsultaInvActualCANTIDAD: TFloatField;
    qryConsultaInvActualCODIGO: TIntegerField;
    qryConsultaInvActualDESCRIPCION: TIBStringField;
    qryConsultaInvActualFECHA_ULTIMA_TRN: TDateTimeField;
    qryConsultaInvActualPRECIO: TFloatField;
    qryConsultaInvActualPRECIO_ANT: TFloatField;
    IBDataSet1: TIBDataSet;
    tblInventarioProdFECHA_VENCIMIENTO: TDateTimeField;
    tblInventarioProdCODIGO_TEXTO: TIBStringField;
    tblInventarioHistoricoCODIGO: TIBStringField;
    qryPrecioInventarioCODIGO_TEXTO: TIBStringField;
    qryRepInvVencimiento: TIBQuery;
    qryRepInvVencimientoCODIGO: TIntegerField;
    qryRepInvVencimientoCODIGO_TEXTO: TIBStringField;
    qryRepInvVencimientoFECHA: TDateTimeField;
    qryRepInvVencimientoCODIGO_BARRA: TIBStringField;
    qryRepInvVencimientoTIPO: TIntegerField;
    qryRepInvVencimientoDESCRIPCION: TIBStringField;
    qryRepInvVencimientoCANTIDAD_REORDEN: TIntegerField;
    qryRepInvVencimientoPRECIO_ANT: TFloatField;
    qryRepInvVencimientoCANTIDAD: TFloatField;
    qryRepInvVencimientoPRECIO: TFloatField;
    qryRepInvVencimientoBLCE_CANT_ENTRADA: TFloatField;
    qryRepInvVencimientoBLCE_CANT_SALIDA: TFloatField;
    qryRepInvVencimientoFECHA_ULTIMA_TRN: TDateTimeField;
    qryRepInvVencimientoSTATUS: TIBStringField;
    qryRepInvVencimientoPORC_DESCUENTO: TFloatField;
    qryRepInvVencimientoFOTO: TBlobField;
    qryRepInvVencimientoPAGA_ITBI: TSmallintField;
    qryRepInvVencimientoCODIGO_PRECIO: TIBStringField;
    qryRepInvVencimientoUNIDAD: TFloatField;
    qryRepInvVencimientoPRECIO_COMPRA: TFloatField;
    qryRepInvVencimientoPRECIO_MINIMO: TFloatField;
    qryRepInvVencimientoREFERENCIA: TIBStringField;
    qryRepInvVencimientoFECHA_VENCIMIENTO: TDateTimeField;
    tblInventarioProdINVENTARIAR: TSmallintField;
    qryLote: TIBQuery;
    qryLoteFECHA_VENCIMIENTO: TDateTimeField;
    qryLoteCANT: TIntegerField;
    qryLoteLOTE_NUM: TIBStringField;
    qryRepProdVence: TIBQuery;
    qryRepProdVenceCODIGO: TIntegerField;
    qryRepProdVenceLOTE_NUM: TIBStringField;
    qryRepProdVenceCODIGO_PROV: TIntegerField;
    qryRepProdVenceCANT_IN: TIntegerField;
    qryRepProdVenceCANT_OUT: TIntegerField;
    qryRepProdVenceFECHA_VENCIMIENTO: TDateTimeField;
    qryRepProdVenceNOMBRE_PROVEEDOR: TIBStringField;
    qryRepProdVenceDESCRIPCION_PRODUCTO: TIBStringField;
    qryRepProdVenceCODIGO_TEXTO: TIBStringField;
    qryRepProdVenceDIASPORVENCER: TIntegerField;
    qryRepProdVenceDIASVENCIDOS: TIntegerField;
    qryRepProdVencePRECIO: TFloatField;
    qryXVencer: TIBQuery;
    qryVencido: TIBQuery;
    qryTodo: TIBQuery;
    tblClasifPrecio: TIBDataSet;
    tblClasifPrecioCOD_PRODUCTO: TIntegerField;
    tblClasifPrecioPRECIO_ID: TIntegerField;
    tblClasifPrecioPRECIO_VENTA: TFloatField;
    tblClasifPrecioCOD_USUARIO: TIntegerField;
    tblClasifPrecioSTATUS: TIBStringField;
    tblClasifPrecioIN_POR: TIBStringField;
    tblClasifPrecioFECHA_IN: TDateTimeField;
    tblClasifPrecioMOD_POR: TIBStringField;
    tblClasifPrecioFECHA_MOD: TDateTimeField;
    tblUnidades: TIBTable;
    tblUnidadesIDUNIDAD: TIntegerField;
    tblUnidadesCANTIDAD: TIntegerField;
    tblUnidadesDESCRIPCION: TIBStringField;
    dstblUnidades: TDataSource;
    tblReparacionesMaster: TIBDataSet;
    tblReparacionesDet: TIBDataSet;
    tblReparacionesDetSERIE: TIntegerField;
    tblReparacionesDetNUMERO: TIntegerField;
    tblReparacionesDetCOD_PRODUCTO: TIntegerField;
    tblReparacionesDetCOD_USUARIO: TIntegerField;
    tblReparacionesDetMONTO_SERVICIO: TFloatField;
    tblReparacionesDetINSERTADO_POR: TIBStringField;
    tblReparacionesDetFECHA_IN: TDateTimeField;
    tblReparacionesDetSTATUS: TIBStringField;
    tblReparacionesMasterNUMERO: TIntegerField;
    tblReparacionesMasterTIPO_TRN: TIntegerField;
    tblReparacionesMasterCOD_PROVEEDOR: TIntegerField;
    tblReparacionesMasterFECHA: TDateTimeField;
    tblReparacionesMasterOBSERVACION: TIBStringField;
    tblReparacionesMasterSTATUS: TIBStringField;
    dstblReparacionesMaster: TDataSource;
    dstblReparacionesDet: TDataSource;
    tblTipoTrn: TIBTable;
    dstblTipoTrn: TDataSource;
    tblReparacionesDetDESCRIPCIONPROBLEMA: TMemoField;
    qryRepRepMaster: TIBQuery;
    qryRepRepMasterNUMERO: TIntegerField;
    qryRepRepMasterTIPO_TRN: TIntegerField;
    qryRepRepMasterCOD_PROVEEDOR: TIntegerField;
    qryRepRepMasterFECHA: TDateTimeField;
    qryRepRepMasterOBSERVACION: TIBStringField;
    qryRepRepMasterSTATUS: TIBStringField;
    qryRepRepMasterDESCRIPCION: TIBStringField;
    qryRepRepMasterTELEFONO: TIBStringField;
    qryRepRepMasterCALYYNUM: TIBStringField;
    qryRepRepMasterCIUDAD: TIBStringField;
    qryRepRepMasterPAIS: TIBStringField;
    qryRepRepMasterCONTACTO: TIBStringField;
    qryRepRepMasterDet: TIBQuery;
    qryRepRepMasterDetSERIE: TIntegerField;
    qryRepRepMasterDetNUMERO: TIntegerField;
    qryRepRepMasterDetCOD_PRODUCTO: TIntegerField;
    qryRepRepMasterDetCOD_USUARIO: TIntegerField;
    qryRepRepMasterDetMONTO_SERVICIO: TFloatField;
    qryRepRepMasterDetINSERTADO_POR: TIBStringField;
    qryRepRepMasterDetFECHA_IN: TDateTimeField;
    qryRepRepMasterDetSTATUS: TIBStringField;
    qryRepRepMasterDetDESCRIPCIONPROBLEMA: TMemoField;
    qryRepRepMasterTIPO_TRNDESC: TIBStringField;
    tblInventarioProdPRECIO_TIPO_UNIDAD: TFloatField;
    qryTipoUnidad: TIBQuery;
    qryTipoUnidadIDUNIDAD: TIntegerField;
    qryTipoUnidadCANTIDAD: TIntegerField;
    qryTipoUnidadDESCRIPCION: TIBStringField;
    dsqryTipoUnidad: TDataSource;
    tblInventarioProdTIPO_UNIDAD: TIntegerField;
    tblInventarioProdDESCRIPCIONADICIONAL: TMemoField;
    tblInventarioProdORIGEN: TIntegerField;
    tblInventarioProdUBICACION: TIBStringField;
    tblInventarioProdREFERENCIA_ALTERNA: TIBStringField;
    tblInventarioProdMARCA: TIBStringField;
    tblInventarioProdMODELO: TIBStringField;
    tblInventarioProdPRECIOVENTA1: TFloatField;
    tblInventarioProdPRECIOVENTA2: TFloatField;
    tblInventarioProdPRECIOVENTA3: TFloatField;
    tblInventarioProdPRECIOVENTA4: TFloatField;
    tblInventarioProdPORCUTILIDAD1: TFloatField;
    tblInventarioProdPORCUTILIDAD2: TFloatField;
    tblInventarioProdPORCUTILIDAD3: TFloatField;
    tblInventarioProdPORCUTILIDAD4: TFloatField;
    tblInventarioProdUSARLEVELPRECIO: TSmallintField;
    tblInventarioProdCIA_KEY: TIntegerField;
    tblInventarioProdSITUACIONPROD: TSmallintField;
    tblInventarioProdAPLICAIMPTOCOMPRA: TSmallintField;
    tblInventarioProdCODFABRICANTE: TIntegerField;
    tblInventarioProdCTAINVENTARIO: TIBStringField;
    tblInventarioProdCTAVENTA: TIBStringField;
    tblInventarioProdCTACOMPRA: TIBStringField;
    tblInventarioProdCODSUBCATEGORIA: TIntegerField;
    tblInventarioProdCODCATEGORIA: TIntegerField;
    tblInventarioProdPORCITBIS: TFloatField;
    tblInventarioProdCOD_MONEDA: TIBStringField;
    tblInventarioProdKILOMETROS: TFloatField;
    tblInventarioProdRUTAIMAGEN: TIBStringField;
    tblInventarioProdIDTASAITBIS: TSmallintField;
    tblInventarioProdPRECIO_ALQUILER: TFloatField;
    qryInvProd_Base: TIBQuery;
    procedure qryConsultaInvActualAfterScroll(DataSet: TDataSet);
    procedure qryPrecioCompraArtiCalcFields(DataSet: TDataSet);
    procedure qryRepProdVenceFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblReparacionesMasterAfterScroll(DataSet: TDataSet);
    procedure qryRepRepMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    DiasxVencidos : Integer;
    DiasxVencer   : Integer;
  end;

var
  dmInventario: TdmInventario;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmInventario.qryConsultaInvActualAfterScroll(DataSet: TDataSet);
begin
  qryConsultaInvhist.Close;
  qryConsultaInvhist.Params[0].Value:= qryConsultaInvActualCODIGO.Value;
  qryConsultaInvhist.Open;  
end;

procedure TdmInventario.qryPrecioCompraArtiCalcFields(DataSet: TDataSet);
begin
  if qryPrecioCompraArtiPrecio.Value > 0 then
  qryPrecioCompraArtiMargen.Value:=((tblInventarioProdPRECIO.Value - qryPrecioCompraArtiPrecio.Value )
                                     / qryPrecioCompraArtiPrecio.Value) * 100;
end;

procedure TdmInventario.qryRepProdVenceFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (DiasxVencer > 0 ) then
  Accept := ( DataSet['DIASPORVENCER'] >= DiasxVencer )
  else
  if (DiasxVencidos > 0 ) then
  Accept := ( DataSet['DIASVENCIDOS'] >= DiasxVencidos);
end;

procedure TdmInventario.tblReparacionesMasterAfterScroll(
  DataSet: TDataSet);
begin
  if tblReparacionesDet.State In [dsBrowse, dsInactive] then
  begin
    tblReparacionesDet.Close;
    tblReparacionesDet.params[0].value:= tblReparacionesMasterNUMERO.Value;
    tblReparacionesDet.Open;
  end;
end;

procedure TdmInventario.qryRepRepMasterAfterScroll(DataSet: TDataSet);
begin
  qryRepRepMasterDet.Close;
  qryRepRepMasterDet.Params[0].Value := qryRepRepMasterNUMERO.Value;
  qryRepRepMasterDet.Open;
end;

end.
