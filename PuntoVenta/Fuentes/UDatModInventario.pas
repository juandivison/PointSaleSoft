unit UDatModInventario;
 
interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBUpdateSQL, IBTable, IBQuery,
  Variants, Dialogs, IBSQL, IBStoredProc;

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
    dsqryTipoUnidad: TDataSource;
    tblInventarioProdTIPO_UNIDAD: TIntegerField;
    tblInventarioProdORIGEN: TIntegerField;
    tblInventarioProdUBICACION: TIBStringField;
    tblInventarioProdREFERENCIA_ALTERNA: TIBStringField;
    tblInventarioProdMARCA: TIBStringField;
    tblInventarioProdMODELO: TIBStringField;
    tblTranInvFisicoPan: TIBDataSet;
    tblTranInvFisicoPanID_TRAN: TIntegerField;
    tblTranInvFisicoPanFECHA: TDateTimeField;
    tblTranInvFisicoPanCODIGO_PROD: TIntegerField;
    tblTranInvFisicoPanCANT: TFloatField;
    tblTranInvFisicoPanPRECIO_COMPRA: TFloatField;
    tblTranInvFisicoPanPRECIO: TFloatField;
    tblTranInvFisicoPanCOD_EMPLEADO: TIntegerField;
    tblTranInvFisicoPanIN_POR: TIBStringField;
    tblTranInvFisicoPanFECHA_IN: TDateTimeField;
    dstblTranInvFisicoPan: TDataSource;
    tblTranInvFisicoPanSTATUS: TIBStringField;
    qryInvLookup: TIBQuery;
    dsqryInvLookup: TDataSource;
    qryInvLookupBLCE_CANT_ENTRADA: TFloatField;
    qryInvLookupBLCE_CANT_SALIDA: TFloatField;
    qryInvLookupCANTIDAD: TFloatField;
    qryInvLookupCODIGO: TIntegerField;
    qryInvLookupFECHA_ULTIMA_TRN: TDateTimeField;
    qryInvLookupPRECIO: TFloatField;
    qryInvLookupPRECIO_ANT: TFloatField;
    qryProveedoresRNC_PROVEEDOR: TIBStringField;
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
    tblInvCategoria: TIBTable;
    tblInvSubCategoria: TIBTable;
    tblInvSubCategoriaCODSUBCATEGORIA: TIntegerField;
    tblInvSubCategoriaDESCRIPCION: TIBStringField;
    tblInvCategoriaCODCATEGORIA: TIntegerField;
    tblInvCategoriaDESCRIPCION: TIBStringField;
    tblInventarioProdSITUACIONPROD: TSmallintField;
    tblInventarioProdAPLICAIMPTOCOMPRA: TSmallintField;
    tblInventarioProdCODFABRICANTE: TIntegerField;
    tblInventarioProdCTAINVENTARIO: TIBStringField;
    tblInventarioProdCTAVENTA: TIBStringField;
    tblInventarioProdCTACOMPRA: TIBStringField;
    tblInventarioProdCODSUBCATEGORIA: TIntegerField;
    tblInventarioProdCODCATEGORIA: TIntegerField;
    dstblInvCategoria: TDataSource;
    dstblInvSubCategoria: TDataSource;
    tblConsignacion_Det: TIBDataSet;
    tblConsignacion_Mast: TIBDataSet;
    tblConsignacion_MastNUMERO: TIntegerField;
    tblConsignacion_MastTIPO_TRN: TIntegerField;
    tblConsignacion_MastCOD_CLIENTE: TIntegerField;
    tblConsignacion_MastFECHA: TDateTimeField;
    tblConsignacion_MastOBSERVACION: TIBStringField;
    tblConsignacion_MastSTATUS: TIBStringField;
    tblConsignacion_DetSERIE: TIntegerField;
    tblConsignacion_DetNUMERO: TIntegerField;
    tblConsignacion_DetCOD_PRODUCTO: TIntegerField;
    tblConsignacion_DetCOD_USUARIO: TIntegerField;
    tblConsignacion_DetMONTO_SERVICIO: TFloatField;
    tblConsignacion_DetINSERTADO_POR: TIBStringField;
    tblConsignacion_DetFECHA_IN: TDateTimeField;
    tblConsignacion_DetSTATUS: TIBStringField;
    tblConsignacion_DetOBSERVACION: TMemoField;
    tblInventarioProdPORCITBIS: TFloatField;
    tblInventarioProdCOD_MONEDA: TIBStringField;
    tblInventarioProdKILOMETROS: TFloatField;
    qryTasa: TIBQuery;
    qryTasaSERIE: TIntegerField;
    qryTasaCODIGO: TIBStringField;
    qryTasaFECHA_INICIAL: TDateTimeField;
    qryTasaFECHA_FINAL: TDateTimeField;
    qryTasaVALOR: TFloatField;
    tblInventarioProdDESCRIPCIONADICIONAL: TMemoField;
    tblInventarioProdRUTAIMAGEN: TIBStringField;
    tblTasaITBIS: TIBDataSet;
    tblTasaITBISIDTASAITBIS: TSmallintField;
    tblTasaITBISFECHAINI: TDateTimeField;
    tblTasaITBISFECHAFIN: TDateTimeField;
    tblTasaITBISPORCIENTO: TFloatField;
    tblTasaITBISUSER_IN: TIntegerField;
    tblTasaITBISUSER_MOD: TIntegerField;
    tblTasaITBISIN_POR: TIBStringField;
    tblTasaITBISFECHA_IN: TDateTimeField;
    tblTasaITBISMOD_POR: TIBStringField;
    tblTasaITBISSTATUS: TIBStringField;
    tblTasaITBISFECHA_UPDATE: TDateTimeField;
    tblInventarioProdIDTASAITBIS: TSmallintField;
    tblTasaItbisLookup: TIBTable;
    tblTasaItbisLookupIDTASAITBIS: TSmallintField;
    tblTasaItbisLookupFECHAINI: TDateTimeField;
    tblTasaItbisLookupFECHAFIN: TDateTimeField;
    tblTasaItbisLookupPORCIENTO: TFloatField;
    tblTasaItbisLookupUSER_IN: TIntegerField;
    tblTasaItbisLookupUSER_MOD: TIntegerField;
    tblTasaItbisLookupIN_POR: TIBStringField;
    tblTasaItbisLookupFECHA_IN: TDateTimeField;
    tblTasaItbisLookupMOD_POR: TIBStringField;
    tblTasaItbisLookupSTATUS: TIBStringField;
    tblTasaItbisLookupFECHA_UPDATE: TDateTimeField;
    tblTasaItbisLookupDESCRIPCION: TIBStringField;
    tblTasaITBISDESCRIPCION: TIBStringField;
    tblTasaITBISSIMBOLO_TASA: TIBStringField;
    tblAlquilerMaster: TIBDataSet;
    tblAlquilerDet: TIBDataSet;
    tblAlquilerMasterIDSERIE: TIntegerField;
    tblAlquilerMasterFECHA: TDateTimeField;
    tblAlquilerMasterCOD_CLIENTE: TIntegerField;
    tblAlquilerMasterNUMERO_FACTURA: TIntegerField;
    tblAlquilerMasterSTATUS: TIBStringField;
    tblAlquilerMasterFECHA_IN: TDateTimeField;
    tblAlquilerMasterIN_POR: TIBStringField;
    tblAlquilerMasterFECHA_MOD: TDateTimeField;
    tblAlquilerMasterMOD_POR: TIBStringField;
    tblAlquilerMasterCODIGO_USUARIO: TIntegerField;
    tblAlquilerDetSERIE: TIntegerField;
    tblAlquilerDetIDSERIE: TIntegerField;
    tblAlquilerDetCOD_PRODUCTO: TIntegerField;
    tblAlquilerDetSERIE_TRN: TIntegerField;
    tblAlquilerDetSTATUS: TIBStringField;
    tblAlquilerDetFECHA_IN: TDateTimeField;
    tblAlquilerDetIN_POR: TIBStringField;
    tblAlquilerDetFECHA_MOD: TDateTimeField;
    tblAlquilerDetMOD_POR: TIBStringField;
    tblAlquilerDetCODIGO_USUARIO: TIntegerField;
    tblAlquilerDetCANT_DIAS: TFloatField;
    tblAlquilerDetMONTO: TFloatField;
    dstblAlquilerDet: TDataSource;
    dstblAlquilerMaster: TDataSource;
    tblAlquilerDetDESCRIPCIONSERVICIO: TMemoField;
    tblAlquilerMasterTIPOTRN: TSmallintField;
    qryRepAlquilerMaster: TIBQuery;
    qryRepAlquilerDet: TIBQuery;
    qryRepAlquilerDetSERIE: TIntegerField;
    qryRepAlquilerDetIDSERIE: TIntegerField;
    qryRepAlquilerDetCOD_PRODUCTO: TIntegerField;
    qryRepAlquilerDetSERIE_TRN: TIntegerField;
    qryRepAlquilerDetSTATUS: TIBStringField;
    qryRepAlquilerDetFECHA_IN: TDateTimeField;
    qryRepAlquilerDetIN_POR: TIBStringField;
    qryRepAlquilerDetFECHA_MOD: TDateTimeField;
    qryRepAlquilerDetMOD_POR: TIBStringField;
    qryRepAlquilerDetCODIGO_USUARIO: TIntegerField;
    qryRepAlquilerDetCANT_DIAS: TFloatField;
    qryRepAlquilerDetMONTO: TFloatField;
    qryRepAlquilerDetMONTO_SEGURO: TFloatField;
    qryRepAlquilerDetDESCRIPCIONSERVICIO: TMemoField;
    tblAlquilerMasterOBSERVACION: TMemoField;
    tblAlquilerDetPRECIO_XDIA: TFloatField;
    tblAlquilerDetPORC_SEGURO: TFloatField;
    tblAlquilerMasterMONTO_TOTAL: TFloatField;
    tblAlquilerDetMONTO_SEGURO: TFloatField;
    qryRepAlquilerMasterTELEF_CONTACTO: TIBStringField;
    qryRepAlquilerMasterDIRECCION_CONT: TIBStringField;
    qryRepAlquilerMasterCIUDAD: TIBStringField;
    qryRepAlquilerMasterPAIS: TIBStringField;
    qryRepAlquilerMasterCONTACTO: TIBStringField;
    qryRepAlquilerMasterTIPO_TRNDESC: TIBStringField;
    qryRepAlquilerMasterIDSERIE: TIntegerField;
    qryRepAlquilerMasterFECHA: TDateTimeField;
    qryRepAlquilerMasterTIPOTRN: TSmallintField;
    qryRepAlquilerMasterCOD_CLIENTE: TIntegerField;
    qryRepAlquilerMasterNUMERO_FACTURA: TIntegerField;
    qryRepAlquilerMasterSTATUS: TIBStringField;
    qryRepAlquilerMasterCODIGO_USUARIO: TIntegerField;
    qryRepAlquilerDetPRECIO_XDIA: TFloatField;
    qryRepAlquilerDetPORC_SEGURO: TFloatField;
    qryRepAlquilerMasterMONTO_TOTAL: TFloatField;
    qryRepAlquilerDetDESC_PRODUCTO: TIBStringField;
    tblAlquilerMasterFECHA_ENTRADA: TDateTimeField;
    tblAlquilerMasterFECHA_ENT_ESTIMADA: TDateTimeField;
    tblAlquilerMasterNUM_TRNVENTA: TIntegerField;
    qryInvLookupCOD_MONEDA: TIBStringField;
    qryInvLookupPRECIO_COMPRA: TFloatField;
    tblAlquilerMasterTIPO_OPE: TSmallintField;
    tblReparacionesMasterTIPO_OPE: TSmallintField;
    tblReparacionesMasterINV_UPD: TIBStringField;
    tblAlquilerMasterINV_UPD: TIBStringField;
    tblAlquilerDetCANTIDAD: TIntegerField;
    tblInventarioProdPRECIO_ALQUILER: TFloatField;
    tblAlquilerMasterCOD_PROD_ALQ: TIntegerField;
    qryRepRepMasterTIPO_OPE: TSmallintField;
    tblReparacionesMasterFECHA_ENTRADA: TDateTimeField;
    tblReparacionesDetCANTIDAD: TIntegerField;
    qryInventario: TIBQuery;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioFECHA: TDateTimeField;
    qryInventarioCODIGO_BARRA: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioDESCRIPCIONADICIONAL: TMemoField;
    qryInventarioCANTIDAD_REORDEN: TIntegerField;
    qryInventarioPRECIO_ANT: TFloatField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioBLCE_CANT_ENTRADA: TFloatField;
    qryInventarioBLCE_CANT_SALIDA: TFloatField;
    qryInventarioFECHA_ULTIMA_TRN: TDateTimeField;
    qryInventarioSTATUS: TIBStringField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioFOTO: TBlobField;
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
    qryInventarioPRECIOVENTA1: TFloatField;
    qryInventarioPRECIOVENTA2: TFloatField;
    qryInventarioPRECIOVENTA3: TFloatField;
    qryInventarioPRECIOVENTA4: TFloatField;
    qryInventarioPORCUTILIDAD1: TFloatField;
    qryInventarioPORCUTILIDAD2: TFloatField;
    qryInventarioPORCUTILIDAD3: TFloatField;
    qryInventarioPORCUTILIDAD4: TFloatField;
    qryInventarioUSARLEVELPRECIO: TSmallintField;
    qryInventarioCIA_KEY: TIntegerField;
    qryInventarioSITUACIONPROD: TSmallintField;
    qryInventarioAPLICAIMPTOCOMPRA: TSmallintField;
    qryInventarioCODFABRICANTE: TIntegerField;
    qryInventarioCTAINVENTARIO: TIBStringField;
    qryInventarioCTAVENTA: TIBStringField;
    qryInventarioCTACOMPRA: TIBStringField;
    qryInventarioCODSUBCATEGORIA: TIntegerField;
    qryInventarioCODCATEGORIA: TIntegerField;
    qryInventarioPORCITBIS: TFloatField;
    qryInventarioCOD_MONEDA: TIBStringField;
    qryInventarioKILOMETROS: TFloatField;
    qryInventarioRUTAIMAGEN: TIBStringField;
    qryInventarioIDTASAITBIS: TSmallintField;
    qryInventarioPRECIO_ALQUILER: TFloatField;
    tblAlquilerDetVALOR_TASA: TFloatField;
    tblAlquilerDetMONEDA: TIBStringField;
    tblAlquilerDetMONTO_DEPOSITO: TFloatField;
    tblAlquilerMasterMONEDA: TIBStringField;
    qryInvLookupDESCRIPCION: TIBStringField;
    qryRepAlquilerMasterDESCRIPCION: TIBStringField;
    qryRepInvVencimientoDESCRIPCION: TIBStringField;
    qryInvAlquiler: TIBQuery;
    dsqryInvAlquiler: TDataSource;
    qryInvAlquilerCODIGO: TIntegerField;
    qryInvAlquilerCODIGO_TEXTO: TIBStringField;
    qryInvAlquilerFECHA: TDateTimeField;
    qryInvAlquilerCODIGO_BARRA: TIBStringField;
    qryInvAlquilerTIPO: TIntegerField;
    qryInvAlquilerDESCRIPCION: TIBStringField;
    qryInvAlquilerDESCRIPCIONADICIONAL: TMemoField;
    qryInvAlquilerCANTIDAD_REORDEN: TIntegerField;
    qryInvAlquilerPRECIO_ANT: TFloatField;
    qryInvAlquilerCANTIDAD: TFloatField;
    qryInvAlquilerPRECIO: TFloatField;
    qryInvAlquilerBLCE_CANT_ENTRADA: TFloatField;
    qryInvAlquilerBLCE_CANT_SALIDA: TFloatField;
    qryInvAlquilerFECHA_ULTIMA_TRN: TDateTimeField;
    qryInvAlquilerSTATUS: TIBStringField;
    qryInvAlquilerPORC_DESCUENTO: TFloatField;
    qryInvAlquilerFOTO: TBlobField;
    qryInvAlquilerPAGA_ITBI: TSmallintField;
    qryInvAlquilerCODIGO_PRECIO: TIBStringField;
    qryInvAlquilerUNIDAD: TFloatField;
    qryInvAlquilerPRECIO_COMPRA: TFloatField;
    qryInvAlquilerPRECIO_MINIMO: TFloatField;
    qryInvAlquilerREFERENCIA: TIBStringField;
    qryInvAlquilerFECHA_VENCIMIENTO: TDateTimeField;
    qryInvAlquilerINVENTARIAR: TSmallintField;
    qryInvAlquilerPRECIO_TIPO_UNIDAD: TFloatField;
    qryInvAlquilerTIPO_UNIDAD: TIntegerField;
    qryInvAlquilerORIGEN: TIntegerField;
    qryInvAlquilerUBICACION: TIBStringField;
    qryInvAlquilerREFERENCIA_ALTERNA: TIBStringField;
    qryInvAlquilerMARCA: TIBStringField;
    qryInvAlquilerMODELO: TIBStringField;
    qryInvAlquilerPRECIOVENTA1: TFloatField;
    qryInvAlquilerPRECIOVENTA2: TFloatField;
    qryInvAlquilerPRECIOVENTA3: TFloatField;
    qryInvAlquilerPRECIOVENTA4: TFloatField;
    qryInvAlquilerPORCUTILIDAD1: TFloatField;
    qryInvAlquilerPORCUTILIDAD2: TFloatField;
    qryInvAlquilerPORCUTILIDAD3: TFloatField;
    qryInvAlquilerPORCUTILIDAD4: TFloatField;
    qryInvAlquilerUSARLEVELPRECIO: TSmallintField;
    qryInvAlquilerCIA_KEY: TIntegerField;
    qryInvAlquilerSITUACIONPROD: TSmallintField;
    qryInvAlquilerAPLICAIMPTOCOMPRA: TSmallintField;
    qryInvAlquilerCODFABRICANTE: TIntegerField;
    qryInvAlquilerCTAINVENTARIO: TIBStringField;
    qryInvAlquilerCTAVENTA: TIBStringField;
    qryInvAlquilerCTACOMPRA: TIBStringField;
    qryInvAlquilerCODSUBCATEGORIA: TIntegerField;
    qryInvAlquilerCODCATEGORIA: TIntegerField;
    qryInvAlquilerPORCITBIS: TFloatField;
    qryInvAlquilerCOD_MONEDA: TIBStringField;
    qryInvAlquilerKILOMETROS: TFloatField;
    qryInvAlquilerRUTAIMAGEN: TIBStringField;
    qryInvAlquilerIDTASAITBIS: TSmallintField;
    qryInvAlquilerPRECIO_ALQUILER: TFloatField;
    qryRepAlquilerDetCANTIDAD: TIntegerField;
    qryRepAlquilerDetVALOR_TASA: TFloatField;
    qryRepAlquilerDetMONEDA: TIBStringField;
    qryRepAlquilerDetMONTO_DEPOSITO: TFloatField;
    qryRepRepMasterDESCTIPOPOPE: TIBStringField;
    qryRepRepMasterDetCANTIDAD: TIntegerField;
    qryRepRepMasterDetDESC_PRODUCTO: TIBStringField;
    tblPrecioUnidadXNivel: TIBDataSet;
    tblPrecioUnidadXNivelIDUNIDAD: TIntegerField;
    tblPrecioUnidadXNivelDESCRIPCION: TIBStringField;
    tblPrecioUnidadXNivelCOD_PRODUCTO: TIntegerField;
    tblPrecioUnidadXNivelCANTIDAD: TFloatField;
    tblPrecioUnidadXNivelPRECIOVENTA1: TFloatField;
    tblPrecioUnidadXNivelPRECIOVENTA2: TFloatField;
    tblPrecioUnidadXNivelPRECIOVENTA3: TFloatField;
    tblPrecioUnidadXNivelPRECIOVENTA4: TFloatField;
    tblPrecioUnidadXNivelPORCUTILIDAD1: TFloatField;
    tblPrecioUnidadXNivelPORCUTILIDAD2: TFloatField;
    tblPrecioUnidadXNivelPORCUTILIDAD3: TFloatField;
    tblPrecioUnidadXNivelPORCUTILIDAD4: TFloatField;
    tblPrecioUnidadXNivelCOD_USUARIO_IN: TIntegerField;
    tblPrecioUnidadXNivelCOD_USUARIO_UPD: TIntegerField;
    tblPrecioUnidadXNivelFECHA_IN: TDateTimeField;
    tblPrecioUnidadXNivelIN_POR: TIBStringField;
    tblPrecioUnidadXNivelFECHA_MOD: TDateTimeField;
    tblPrecioUnidadXNivelMOD_POR: TIBStringField;
    dstblPrecioUnidadXNivel: TDataSource;
    tblLookupUnidad: TIBTable;
    tblLookupUnidadIDUNIDAD: TIntegerField;
    tblLookupUnidadCANTIDAD: TIntegerField;
    tblLookupUnidadDESCRIPCION: TIBStringField;
    dstblLookupUnidad: TDataSource;
    tblPrecioUnidadXNivelDESC_UNIDAD: TIBStringField;
    qryTipoUnidadIDUNIDAD: TIntegerField;
    qryTipoUnidadCOD_PRODUCTO: TIntegerField;
    qryTipoUnidadDESCRIPCION: TIBStringField;
    qryTipoUnidadCANTIDAD: TFloatField;
    qryLookupUnidad: TIBQuery;
    qryLookupUnidadIDUNIDAD: TIntegerField;
    qryLookupUnidadCANTIDAD: TIntegerField;
    qryLookupUnidadDESCRIPCION: TIBStringField;
    QryViewInvSinPrecXUni: TIBQuery;
    QryViewInvSinPrecXUniCODIGO: TIntegerField;
    QryViewInvSinPrecXUniCODIGO_TEXTO: TIBStringField;
    QryViewInvSinPrecXUniFECHA: TDateTimeField;
    QryViewInvSinPrecXUniCODIGO_BARRA: TIBStringField;
    QryViewInvSinPrecXUniTIPO: TIntegerField;
    QryViewInvSinPrecXUniDESCRIPCION: TIBStringField;
    QryViewInvSinPrecXUniDESCRIPCIONADICIONAL: TMemoField;
    QryViewInvSinPrecXUniCANTIDAD_REORDEN: TIntegerField;
    QryViewInvSinPrecXUniPRECIO_ANT: TFloatField;
    QryViewInvSinPrecXUniCANTIDAD: TFloatField;
    QryViewInvSinPrecXUniPRECIO: TFloatField;
    QryViewInvSinPrecXUniBLCE_CANT_ENTRADA: TFloatField;
    QryViewInvSinPrecXUniBLCE_CANT_SALIDA: TFloatField;
    QryViewInvSinPrecXUniFECHA_ULTIMA_TRN: TDateTimeField;
    QryViewInvSinPrecXUniSTATUS: TIBStringField;
    QryViewInvSinPrecXUniPORC_DESCUENTO: TFloatField;
    QryViewInvSinPrecXUniFOTO: TBlobField;
    QryViewInvSinPrecXUniPAGA_ITBI: TSmallintField;
    QryViewInvSinPrecXUniCODIGO_PRECIO: TIBStringField;
    QryViewInvSinPrecXUniUNIDAD: TFloatField;
    QryViewInvSinPrecXUniPRECIO_COMPRA: TFloatField;
    QryViewInvSinPrecXUniPRECIO_MINIMO: TFloatField;
    QryViewInvSinPrecXUniREFERENCIA: TIBStringField;
    QryViewInvSinPrecXUniFECHA_VENCIMIENTO: TDateTimeField;
    QryViewInvSinPrecXUniINVENTARIAR: TSmallintField;
    QryViewInvSinPrecXUniPRECIO_TIPO_UNIDAD: TFloatField;
    QryViewInvSinPrecXUniTIPO_UNIDAD: TIntegerField;
    QryViewInvSinPrecXUniORIGEN: TIntegerField;
    QryViewInvSinPrecXUniUBICACION: TIBStringField;
    QryViewInvSinPrecXUniREFERENCIA_ALTERNA: TIBStringField;
    QryViewInvSinPrecXUniMARCA: TIBStringField;
    QryViewInvSinPrecXUniMODELO: TIBStringField;
    QryViewInvSinPrecXUniPRECIOVENTA1: TFloatField;
    QryViewInvSinPrecXUniPRECIOVENTA2: TFloatField;
    QryViewInvSinPrecXUniPRECIOVENTA3: TFloatField;
    QryViewInvSinPrecXUniPRECIOVENTA4: TFloatField;
    QryViewInvSinPrecXUniPORCUTILIDAD1: TFloatField;
    QryViewInvSinPrecXUniPORCUTILIDAD2: TFloatField;
    QryViewInvSinPrecXUniPORCUTILIDAD3: TFloatField;
    QryViewInvSinPrecXUniPORCUTILIDAD4: TFloatField;
    QryViewInvSinPrecXUniUSARLEVELPRECIO: TSmallintField;
    QryViewInvSinPrecXUniCIA_KEY: TIntegerField;
    QryViewInvSinPrecXUniSITUACIONPROD: TSmallintField;
    QryViewInvSinPrecXUniAPLICAIMPTOCOMPRA: TSmallintField;
    QryViewInvSinPrecXUniCODFABRICANTE: TIntegerField;
    QryViewInvSinPrecXUniCTAINVENTARIO: TIBStringField;
    QryViewInvSinPrecXUniCTAVENTA: TIBStringField;
    QryViewInvSinPrecXUniCTACOMPRA: TIBStringField;
    QryViewInvSinPrecXUniCODSUBCATEGORIA: TIntegerField;
    QryViewInvSinPrecXUniCODCATEGORIA: TIntegerField;
    QryViewInvSinPrecXUniPORCITBIS: TFloatField;
    QryViewInvSinPrecXUniCOD_MONEDA: TIBStringField;
    QryViewInvSinPrecXUniKILOMETROS: TFloatField;
    QryViewInvSinPrecXUniRUTAIMAGEN: TIBStringField;
    QryViewInvSinPrecXUniIDTASAITBIS: TSmallintField;
    QryViewInvSinPrecXUniPRECIO_ALQUILER: TFloatField;
    tblOfertas: TIBDataSet;
    dstblOfertas: TDataSource;
    qryInvOfertaLookup: TIBQuery;
    qryTipoUnidadOferta: TIBQuery;
    qryTipoUnidadVta: TIBQuery;
    qryTipoUnidadVtaIDUNIDAD: TIntegerField;
    qryTipoUnidadVtaDESCRIPCION: TIBStringField;
    qryTipoUnidadVtaCOD_PRODUCTO: TIntegerField;
    qryTipoUnidadVtaCANTIDAD: TFloatField;
    qryTipoUnidadVtaPRECIOVENTA1: TFloatField;
    qryTipoUnidadVtaPRECIOVENTA2: TFloatField;
    qryTipoUnidadVtaPRECIOVENTA3: TFloatField;
    qryTipoUnidadVtaPRECIOVENTA4: TFloatField;
    qryTipoUnidadVtaPORCUTILIDAD1: TFloatField;
    qryTipoUnidadVtaPORCUTILIDAD2: TFloatField;
    qryTipoUnidadVtaPORCUTILIDAD3: TFloatField;
    qryTipoUnidadVtaPORCUTILIDAD4: TFloatField;
    qryTipoUnidadVtaCOD_USUARIO_IN: TIntegerField;
    qryTipoUnidadVtaCOD_USUARIO_UPD: TIntegerField;
    qryTipoUnidadVtaFECHA_IN: TDateTimeField;
    qryTipoUnidadVtaIN_POR: TIBStringField;
    qryTipoUnidadVtaFECHA_MOD: TDateTimeField;
    qryTipoUnidadVtaMOD_POR: TIBStringField;
    qryTipoUnidadVtaDESC_UNIDAD: TIBStringField;
    qryTipoUnidadOfertaIDUNIDAD: TIntegerField;
    qryTipoUnidadOfertaDESCRIPCION: TIBStringField;
    qryTipoUnidadOfertaCOD_PRODUCTO: TIntegerField;
    qryTipoUnidadOfertaCANTIDAD: TFloatField;
    qryTipoUnidadOfertaPRECIOVENTA1: TFloatField;
    qryTipoUnidadOfertaPRECIOVENTA2: TFloatField;
    qryTipoUnidadOfertaPRECIOVENTA3: TFloatField;
    qryTipoUnidadOfertaPRECIOVENTA4: TFloatField;
    qryTipoUnidadOfertaPORCUTILIDAD1: TFloatField;
    qryTipoUnidadOfertaPORCUTILIDAD2: TFloatField;
    qryTipoUnidadOfertaPORCUTILIDAD3: TFloatField;
    qryTipoUnidadOfertaPORCUTILIDAD4: TFloatField;
    qryTipoUnidadOfertaCOD_USUARIO_IN: TIntegerField;
    qryTipoUnidadOfertaCOD_USUARIO_UPD: TIntegerField;
    qryTipoUnidadOfertaFECHA_IN: TDateTimeField;
    qryTipoUnidadOfertaIN_POR: TIBStringField;
    qryTipoUnidadOfertaFECHA_MOD: TDateTimeField;
    qryTipoUnidadOfertaMOD_POR: TIBStringField;
    qryTipoUnidadOfertaDESC_UNIDAD: TIBStringField;
    tblOfertasCODIGO_PROD: TIntegerField;
    tblOfertasFECHA_INICIAL: TDateTimeField;
    tblOfertasFECHA_FINAL: TDateTimeField;
    tblOfertasTIPO_UNIDADVTA: TIntegerField;
    tblOfertasTIPO_UNIDADOFTA: TIntegerField;
    tblOfertasCANTIDAD: TFloatField;
    tblOfertasFECHA_ULT_TRN: TDateTimeField;
    tblOfertasCANT_ACUM_SALIDA: TFloatField;
    tblOfertasSTATUS: TIBStringField;
    qryInvOfertaLookupCANTIDAD: TFloatField;
    qryInvOfertaLookupCODIGO: TIntegerField;
    qryInvOfertaLookupDESCRIPCION: TIBStringField;
    qryInvOfertaLookupFECHA_ULTIMA_TRN: TDateTimeField;
    qryInvOfertaLookupPRECIO: TFloatField;
    qryInvOfertaLookupCOD_MONEDA: TIBStringField;
    qryInvOfertaLookupPRECIO_COMPRA: TFloatField;
    qryoferta_base: TIBQuery;
    tblUnidadesMONTO_COMISION: TFloatField;
    qryPrecioXUnidadLevel: TIBQuery;
    qryPrecioXUnidadLevelIDUNIDAD: TIntegerField;
    qryPrecioXUnidadLevelDESC_UNIDAD: TIBStringField;
    qryPrecioXUnidadLevelCOD_PRODUCTO: TIntegerField;
    qryPrecioXUnidadLevelCATEGORIA: TIBStringField;
    qryPrecioXUnidadLevelSUBCATEGORIA: TIBStringField;
    qryPrecioXUnidadLevelPRODUCTO: TIBStringField;
    qryPrecioXUnidadLevelTASAITBIS: TIBStringField;
    qryPrecioXUnidadLevelCANT: TFloatField;
    qryPrecioXUnidadLevelPRECIO1: TFloatField;
    qryPrecioXUnidadLevelPRECIO2: TFloatField;
    qryPrecioXUnidadLevelPRECIO3: TFloatField;
    qryPrecioXUnidadLevelPRECIO4: TFloatField;
    qryPrecioXUnidadLevelTIPO: TIBStringField;
    qryPrecioXUnidadLevelTIPO_INVENTARIO: TIntegerField;
    qryPrecioXUnidadLevelUBICACION: TIBStringField;
    qryPrecioXUnidadLevelCANTENRUTA: TFloatField;
    qryInvProd_Base: TIBQuery;
    qryPrecioXUnidadLevelPRECIO_COMPRA: TFloatField;
    qryPrecioXUnidadLevel_Base0: TIBQuery;
    tblInventarioProdPAGACOMISION: TSmallintField;
    dstblEquipoMaster: TDataSource;
    dstblEquipoDet: TDataSource;
    tblEquipoMaster: TIBDataSet;
    tblEquipoDet: TIBDataSet;
    tblEquipoDetSERIE: TIntegerField;
    tblEquipoDetNUMERO: TIntegerField;
    tblEquipoDetCOD_PRODUCTO: TIntegerField;
    tblEquipoDetCOD_USUARIO: TIntegerField;
    tblEquipoDetMONTO_SERVICIO: TFloatField;
    tblEquipoDetINSERTADO_POR: TIBStringField;
    tblEquipoDetFECHA_IN: TDateTimeField;
    tblEquipoDetSTATUS: TIBStringField;
    tblEquipoDetDESCRIPCIONPROBLEMA: TMemoField;
    tblEquipoDetCANTIDAD: TIntegerField;
    tblEquipoMasterNUMERO: TIntegerField;
    tblEquipoMasterTIPO_TRN: TIntegerField;
    tblEquipoMasterCOD_PROVEEDOR: TIntegerField;
    tblEquipoMasterFECHA: TDateTimeField;
    tblEquipoMasterOBSERVACION: TIBStringField;
    tblEquipoMasterSTATUS: TIBStringField;
    tblEquipoMasterTIPO_OPE: TSmallintField;
    tblEquipoMasterINV_UPD: TIBStringField;
    tblEquipoMasterFECHA_ENTRADA: TDateTimeField;
    qryEquiposEnRMA: TIBQuery;
    qryEquiposEnRMANUMERO: TIntegerField;
    qryEquiposEnRMATIPO_TRN: TIntegerField;
    qryEquiposEnRMATIPO_OPE: TSmallintField;
    qryEquiposEnRMADESCTIPOPOPE: TIBStringField;
    qryEquiposEnRMACOD_PROVEEDOR: TIntegerField;
    qryEquiposEnRMAFECHA: TDateTimeField;
    qryEquiposEnRMAOBSERVACION: TIBStringField;
    qryEquiposEnRMASTATUS: TIBStringField;
    qryEquiposEnRMADESCRIPCION: TIBStringField;
    qryEquiposEnRMATELEFONO: TIBStringField;
    qryEquiposEnRMACALYYNUM: TIBStringField;
    qryEquiposEnRMACIUDAD: TIBStringField;
    qryEquiposEnRMAPAIS: TIBStringField;
    qryEquiposEnRMACONTACTO: TIBStringField;
    qryEquiposEnRMATIPO_TRNDESC: TIBStringField;
    qryEquiposEnRMACOD_PRODUCTO: TIntegerField;
    qryEquiposEnRMADESCRIPCIONPROBLEMA: TMemoField;
    qryEquiposEnRMAMONTO_SERVICIO: TFloatField;
    qryEquiposEnRMACANTIDAD: TIntegerField;
    qryEquiposEnRMADESCRIPCIONPRODUCTO: TIBStringField;
    qryEquiposEnRMASERIEQUIPO: TIBStringField;
    tblInventarioSERIECODIGO_CTE: TIntegerField;
    tblInventarioSERIESTATUS_EQUIPO: TSmallintField;
    tblInventarioSERIENOMBRECLIENTE: TIBStringField;
    tblEquipoDetSERIE_EQUIPO: TIBStringField;
    tblEquipoMasterFECHA_ENT_ESTIMADA: TDateTimeField;
    tblEquipoMasterCODIGO_TECNICO: TIntegerField;
    qryEquiposEnRMACODIGO_TECNICO: TIntegerField;
    qryEquiposEnRMANOMBRETECNICO: TIBStringField;
    ibstpProcInsertKardexBlc: TIBStoredProc;
    tblInventarioProdMargen: TCurrencyField;
    tblReparacionesDetPRECIO: TFloatField;
    qryVenceEn: TIBQuery;
    qryMaxMinProv: TIBQuery;
    qryMaxMinProvCODMAX: TIntegerField;
    qryMaxMinProvCODMIN: TIntegerField;
    qryProveedoresCIA_KEY: TIntegerField;
    qryInvProd_AuditarPrecioBase: TIBQuery;
    qryInvOtro: TIBQuery;
    qryInvOtroQTYOTRO: TFloatField;
    tblTasaITBISIDITBISECF: TSmallintField;
    tblTipoInventarioIDINDICADORBOSERV: TSmallintField;
    tblInventarioProdAUD_COD_USUARIO: TIntegerField;
    tblInventarioProdAUD_APP_USER: TIBStringField;
    tblInventarioProdAUD_PC_NAME: TIBStringField;
    procedure qryConsultaInvActualAfterScroll(DataSet: TDataSet);
    procedure qryPrecioCompraArtiCalcFields(DataSet: TDataSet);
    procedure qryRepProdVenceFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblReparacionesMasterAfterScroll(DataSet: TDataSet);
    procedure qryRepRepMasterAfterScroll(DataSet: TDataSet);
    procedure qryRepAlquilerMasterAfterScroll(DataSet: TDataSet);
    procedure tblAlquilerMasterAfterScroll(DataSet: TDataSet);
    procedure tblInventarioProdFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblAlquilerDetBeforePost(DataSet: TDataSet);
    procedure qryTipoUnidadFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblEquipoMasterAfterScroll(DataSet: TDataSet);
    procedure tblInventarioProdBeforePost(DataSet: TDataSet);
    procedure tblInventarioProdCalcFields(DataSet: TDataSet);
    procedure tblInventarioProdPRECIO_COMPRAValidate(Sender: TField);
    procedure qryProveedoresFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    DiasxVencidos : Integer;
    DiasxVencer   : Integer;
    filterTipoInv : integer;
    filterTipoUnidadNull: boolean;
    xcodProducto : integer;
    _idtasa : integer;
    _conVtas : boolean;
    filterLoteNum : string;
    filterNoPagaItbis, filterPagaItbis:boolean;
    Function Proc_ViewInvSinPrecioXUnidad:Boolean;
    Procedure ProcInsertKardexBlc(FechaInv:TDateTime);
  end;

var
  dmInventario: TdmInventario;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmInventario.qryConsultaInvActualAfterScroll(DataSet: TDataSet);
begin
  qryConsultaInvhist.Close;
  qryConsultaInvhist.Params[0].Value:= qryConsultaInvActualCODIGO.Value;
  qryConsultaInvhist.Open;  
end;

procedure TdmInventario.qryPrecioCompraArtiCalcFields(DataSet: TDataSet);
var
  tmp : Currency;
begin
  if (dmInventario.qryPrecioCompraArti.Params[0].Value <> dmInventario.tblInventarioProdcodigo.Value) then
  begin
    dmInventario.qryPrecioCompraArti.Close;
    dmInventario.qryPrecioCompraArti.Params[0].Value:= dmInventario.tblInventarioProdcodigo.Value;//tblInventarioProdCODIGO_TEXTO.Value;
    dmInventario.qryPrecioCompraArti.Open;
  end;
  if dmInventario.tblInventarioProdPRECIO_COMPRA.Value > 0 then
  qryPrecioCompraArtiMargen.Value:=((tblInventarioProdPRECIO.Value - dmInventario.tblInventarioProdPRECIO_COMPRA.Value)
                                     / tblInventarioProdPRECIO.Value) * 100
  else
  if qryPrecioCompraArtiPrecio.Value > 0 then
  qryPrecioCompraArtiMargen.Value:=((tblInventarioProdPRECIO.Value - qryPrecioCompraArtiPrecio.Value )
                                     / qryPrecioCompraArtiPrecio.Value) * 100;
  tmp:=qryPrecioCompraArtiMargen.Value;
end;

procedure TdmInventario.qryRepProdVenceFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (filterLoteNum <> '') then
  Accept := ( uppercase(DataSet['LOTE_NUM']) = uppercase(filterLoteNum) )
  else
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
    tblReparacionesDet.Params[0].value:= tblReparacionesMasterNUMERO.Value;
    tblReparacionesDet.Open;
  end;
end;

procedure TdmInventario.qryRepRepMasterAfterScroll(DataSet: TDataSet);
begin
  qryRepRepMasterDet.Close;
  qryRepRepMasterDet.Params[0].Value := qryRepRepMasterNUMERO.Value;
  qryRepRepMasterDet.Open;
end;

procedure TdmInventario.qryRepAlquilerMasterAfterScroll(DataSet: TDataSet);
begin
  qryRepAlquilerDet.Close;
  qryRepAlquilerDet.Params[0].Value := qryRepAlquilerMasterIDSerie.Value;
  qryRepAlquilerDet.Open;
end;

procedure TdmInventario.tblAlquilerMasterAfterScroll(DataSet: TDataSet);
begin
  if tblAlquilerDet.State in [dsInactive, dsbrowse] then
  begin
    tblAlquilerDet.Close;
    tblAlquilerDet.Params[0].Value := tblAlquilerMasterIDSERIE.Value;
    tblAlquilerDet.Open;
  end;
end;

procedure TdmInventario.tblInventarioProdFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (filterPagaItbis) then
  begin
    Accept:=Dataset['PAGA_ITBI'] = 1;
  end else
  if (filterNoPagaItbis) then
  begin
    Accept:=( (Dataset['PAGA_ITBI'] = 0) or
              (Dataset['PAGA_ITBI'] = null)
            );
  end else
  if (_idtasa > 0) then
  begin
    Accept:=Dataset['IDTASAITBIS'] = _idtasa;
  end
  else
  if filterTipoUnidadNull then
  Accept:=Dataset['TIPO_UNIDAD'] = null;
end;

procedure TdmInventario.tblAlquilerDetBeforePost(DataSet: TDataSet);
begin
  if (dmInventario.tblAlquilerDetIDSERIE.Value = 0) or  dmInventario.tblAlquilerDetIDSERIE.IsNull then
  dmInventario.tblAlquilerDetIDSERIE.Value:=
  dmInventario.tblAlquilerMasteridserie.Value;
end;

procedure TdmInventario.qryTipoUnidadFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:= Dataset['COD_PRODUCTO'] = xcodProducto;
end;

Function TdmInventario.Proc_ViewInvSinPrecioXUnidad:Boolean;
begin
  QryViewInvSinPrecXUni.Close;
  QryViewInvSinPrecXUni.Open;
  QryViewInvSinPrecXUni.Last;
  result := QryViewInvSinPrecXUni.RecordCount > 0;
end;

procedure TdmInventario.tblEquipoMasterAfterScroll(DataSet: TDataSet);
begin
  if tblEquipoDet.state in [dsEdit, dsInsert] then exit;
  tblEquipoDet.Close;
  tblEquipoDet.Params[0].Value:=tblEquipoMasterNUMERO.Value;
  tblEquipoDet.Open;
end;

procedure TdmInventario.ProcInsertKardexBlc(FechaInv:TDateTime);
begin
  tblInventarioProd.Close;
  tblInventarioProd.Params[0].Value:=glbCia_Key;
  tblInventarioProd.Open;
  tblInventarioProd.First;
  while not tblInventarioProd.Eof do
  begin
    ibstpProcInsertKardexBlc.Params[0].Value:= tblInventarioProdCODIGO.Value;
    ibstpProcInsertKardexBlc.Params[1].Value:= tblInventarioProdCIA_KEY.Value;
    ibstpProcInsertKardexBlc.Params[2].Value:= GlbUltimoDiaMes(FechaInv);
    ibstpProcInsertKardexBlc.Params[3].Value:= tblInventarioProdCANTIDAD.Value;
    ibstpProcInsertKardexBlc.Params[4].Value:= StrUserName;
    ibstpProcInsertKardexBlc.ExecProc;
    tblInventarioProd.Next;
  end;
  if not ibstpProcInsertKardexBlc.Transaction.InTransaction then
  ibstpProcInsertKardexBlc.Transaction.StartTransaction;
  try
    ibstpProcInsertKardexBlc.Transaction.CommitRetaining;
  finally
  ibstpProcInsertKardexBlc.Transaction.RollbackRetaining;
  end;
end;

procedure TdmInventario.tblInventarioProdBeforePost(DataSet: TDataSet);
begin
  if (dmInventario.tblInventarioProdDESCRIPCION.IsNull) or
     (dmInventario.tblInventarioProdDESCRIPCION.Value = '') then
  begin
    MessageDlg('Favor indicar descripción del producto.', mtError, [mbOK], 0);
    DataSet.Cancel;
  end;
end;

procedure TdmInventario.tblInventarioProdCalcFields(DataSet: TDataSet);
var
  tmp : currency;
begin
  tmp:=0;
  if tblInventarioProdPRECIO_COMPRA.IsNull then exit;
  if (tblInventarioProdPRECIO_COMPRA.Value > 0.01) then
  tmp:= ((tblInventarioProdPRECIO.Value - tblInventarioProdPRECIO_COMPRA.Value)/
        tblInventarioProdPRECIO_COMPRA.Value)*100;

  if (tmp =0) then
  tblInventarioProdMargen.AsVariant:=null
  else
  if (tblInventarioProdPRECIO.Value > 0) and (tmp > 0) then
  tblInventarioProdMargen.Value:=tmp;
end;

procedure TdmInventario.tblInventarioProdPRECIO_COMPRAValidate(
  Sender: TField);
begin
  if tblInventarioProdPRECIO_COMPRA.Value < 0 then
  tblInventarioProdPRECIO_COMPRA.Value:=0;
end;

procedure TdmInventario.qryProveedoresFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if qryProveedores.Tag > 0 then
  Accept:=Dataset['CIA_KEY'] = qryProveedores.Tag;
end;

end.
