unit UDatmodDatosGenerales;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, RxMemDS, IBStoredProc,
  Variants, IBTable, IBSQL, IBUpdateSQL;

type
  TdmDatos = class(TDataModule)
    qryTasa: TIBQuery;
    dsqryTasa: TDataSource;
    qryTasaSERIE: TIntegerField;
    qryTasaVALORMONEDA: TFloatField;
    qryTasaSIMBOLO: TIBStringField;
    qryOrdenMaster: TIBDataSet;
    qryOrdenDet: TIBDataSet;
    qryOrdenMasterNUMERO: TIntegerField;
    qryOrdenMasterCODIGO_PROVEE: TIntegerField;
    qryOrdenMasterFECHA: TDateTimeField;
    qryOrdenMasterFPAGO: TSmallintField;
    qryOrdenMasterCOD_CAJA_CHICA: TIntegerField;
    qryOrdenMasterCODIGO_BANCO: TIntegerField;
    qryOrdenMasterCUENTABANCO: TIBStringField;
    qryOrdenMasterOBSERVACION: TIBStringField;
    qryOrdenMasterMONTO: TFloatField;
    qryOrdenMasterSTATUS: TIBStringField;
    qryOrdenMasterIN_POR: TIBStringField;
    qryOrdenMasterFECHA_IN: TDateTimeField;
    qryOrdenMasterMOD_POR: TIBStringField;
    qryOrdenMasterFECHA_MOD: TDateTimeField;
    qryOrdenMasterTIPO_INV: TSmallintField;
    qryOrdenMasterSTATUS_CNT: TIBStringField;
    qryOrdenMasterNUM_ORDEN: TIntegerField;
    qryOrdenMasterSTATUS_ORD: TIBStringField;
    qryOrdenMasterAREA_ORDEN: TIntegerField;
    qryOrdenDetSERIE: TFloatField;
    qryOrdenDetNUMERO: TIntegerField;
    qryOrdenDetCOD_SERV_PROD: TIntegerField;
    qryOrdenDetDEPARTAMENTO: TIntegerField;
    qryOrdenDetCANTIDAD: TFloatField;
    qryOrdenDetVALOR: TFloatField;
    qryOrdenDetSTATUS: TIBStringField;
    qryOrdenDetIN_POR: TIBStringField;
    qryOrdenDetFECHA_IN: TDateTimeField;
    qryOrdenDetMOD_POR: TIBStringField;
    qryOrdenDetFECHA_MOD: TDateTimeField;
    qryOrdenDetNUMERO_DOCUMENTO: TIntegerField;
    qryOrdenDetNUMERO_FACTURA: TIntegerField;
    qryOrdenDetCOD_CTA_CONCEPTO: TIntegerField;
    qryOrdenDetTIPOSERVICIO: TIntegerField;
    qryOrdenDetSUBTIPOSERV: TIntegerField;
    qryOrdenDetNO_SERIE_RES: TIntegerField;
    qryOrdenDetCODIGO_CONDUCTOR: TIntegerField;
    qryOrdenDetSERIE_CDC: TIntegerField;
    qryOrdenDetCODIGO_SERVCOSTO: TIntegerField;
    qryOrdenDetNUMEROOLD: TIntegerField;
    qryOrdenDetPRECIO: TFloatField;
    qryOrdenDetAREA_ORDEN: TIntegerField;
    dsqryOrdenMaster: TDataSource;
    dsqryOrdenDet: TDataSource;
    qryInv: TIBQuery;
    qryInvCODIGO: TIntegerField;
    qryInvCODIGO_TEXTO: TIBStringField;
    rxqryInv: TRxMemoryData;
    rxqryInvCODIGO: TIntegerField;
    rxqryInvCODIGO_TEXTO: TStringField;
    rxqryInvDESCRIPCION: TStringField;
    rxqryInvPRECIO_COMPRA: TCurrencyField;
    dsrxqryInv: TDataSource;
    qryInvREFERENCIA: TIBStringField;
    rxqryInvREFERENCIA: TStringField;
    qryInvPRECIO_COMPRA: TFloatField;
    qryInvPAGA_ITBI: TSmallintField;
    rxqryInvPAGA_ITBI: TSmallintField;
    qryDatosOrdenImp: TIBQuery;
    qryDatosOrdenImpDet: TIBQuery;
    qryDatosOrdenImpDetSERIE: TFloatField;
    qryDatosOrdenImpDetNUMERO: TIntegerField;
    qryDatosOrdenImpDetCOD_SERV_PROD: TIntegerField;
    qryDatosOrdenImpDetDEPARTAMENTO: TIntegerField;
    qryDatosOrdenImpDetCANTIDAD: TFloatField;
    qryDatosOrdenImpDetVALOR: TFloatField;
    qryDatosOrdenImpDetSTATUS: TIBStringField;
    qryDatosOrdenImpDetIN_POR: TIBStringField;
    qryDatosOrdenImpDetFECHA_IN: TDateTimeField;
    qryDatosOrdenImpDetMOD_POR: TIBStringField;
    qryDatosOrdenImpDetFECHA_MOD: TDateTimeField;
    qryDatosOrdenImpDetNUMERO_DOCUMENTO: TIntegerField;
    qryDatosOrdenImpDetNUMERO_FACTURA: TIntegerField;
    qryDatosOrdenImpDetCOD_CTA_CONCEPTO: TIntegerField;
    qryDatosOrdenImpDetTIPOSERVICIO: TIntegerField;
    qryDatosOrdenImpDetSUBTIPOSERV: TIntegerField;
    qryDatosOrdenImpDetNO_SERIE_RES: TIntegerField;
    qryDatosOrdenImpDetCODIGO_CONDUCTOR: TIntegerField;
    qryDatosOrdenImpDetSERIE_CDC: TIntegerField;
    qryDatosOrdenImpDetCODIGO_SERVCOSTO: TIntegerField;
    qryDatosOrdenImpDetPRECIO: TFloatField;
    qryDatosOrdenImpDetAREA_ORDEN: TIntegerField;
    qryDatosOrdenImpDetITBI_DET: TFloatField;
    qryDatosOrdenImpDetPORC_DESC_DET: TFloatField;
    qryDatosOrdenImpDetMONTO_DESCUENTO: TFloatField;
    stpInsOrdenMast: TIBStoredProc;
    qryDatosOrdenImpNUMERO: TIntegerField;
    qryDatosOrdenImpCODIGO_PROVEE: TIntegerField;
    qryDatosOrdenImpFECHA: TDateTimeField;
    qryDatosOrdenImpFPAGO: TSmallintField;
    qryDatosOrdenImpCOD_CAJA_CHICA: TIntegerField;
    qryDatosOrdenImpCODIGO_BANCO: TIntegerField;
    qryDatosOrdenImpCUENTABANCO: TIBStringField;
    qryDatosOrdenImpOBSERVACION: TIBStringField;
    qryDatosOrdenImpMONTO: TFloatField;
    qryDatosOrdenImpSTATUS: TIBStringField;
    qryDatosOrdenImpIN_POR: TIBStringField;
    qryDatosOrdenImpFECHA_IN: TDateTimeField;
    qryDatosOrdenImpMOD_POR: TIBStringField;
    qryDatosOrdenImpFECHA_MOD: TDateTimeField;
    qryDatosOrdenImpTIPO_INV: TSmallintField;
    qryDatosOrdenImpSTATUS_CNT: TIBStringField;
    qryDatosOrdenImpNUM_ORDEN: TIntegerField;
    qryDatosOrdenImpSTATUS_ORD: TIBStringField;
    qryDatosOrdenImpAREA_ORDEN: TIntegerField;
    qryPrecioXUnidad: TIBDataSet;
    qryPrecioXUnidadID_PROD: TIntegerField;
    qryPrecioXUnidadID_UNIDAD: TIntegerField;
    qryPrecioXUnidadPRECIO: TFloatField;
    qryPrecioXUnidadCOD_USUARIO: TIntegerField;
    qryPrecioXUnidadFECHA_IN: TDateTimeField;
    qryPrecioXUnidadFECHA_UPDATE: TDateTimeField;
    dsqryPrecioXUnidad: TDataSource;
    tblTipoUnidad: TIBTable;
    dstblTipoUnidad: TDataSource;
    qryInvTIPO_UNIDAD: TIntegerField;
    qryInvPRECIO: TFloatField;
    qryInvCANTIDAD: TFloatField;
    qryOrdenMasterCIA_KEY: TIntegerField;
    qryInvDESCRIPCION: TIBStringField;
    stpInsOrdenDet: TIBStoredProc;
    qryDatosOrdenImpDetOBSERVACION: TIBStringField;
    qryOrdenDetMONTO_DESCUENTO: TFloatField;
    qryOrdenDetITBI_DET: TFloatField;
    qryOrdenDetPORC_DESC_DET: TFloatField;
    qryOrdenDetOBSERVACION: TIBStringField;
    qryDatosOrdenImpCIA_KEY: TIntegerField;
    qryDatosOrdenImpNUMERO_NCF: TIBStringField;
    qryDatosOrdenImpDESCRIPCION: TIBStringField;
    qryDatosOrdenImpCIUDAD: TIBStringField;
    qryDatosOrdenImpCALYYNUM: TIBStringField;
    qryDatosOrdenImpTELEFONO: TIBStringField;
    qryDatosOrdenImpFAX: TIBStringField;
    qryDatosOrdenImpEMAIL: TIBStringField;
    qryDatosOrdenImpMOVIL1: TIBStringField;
    qryDatosOrdenImpMOVIL2: TIBStringField;
    qryDatosOrdenImpTELEFONO2: TIBStringField;
    qryDatosOrdenImpTELEFONO3: TIBStringField;
    qryDatosOrdenImpEXTENSIONES: TIBStringField;
    qryDatosOrdenImpCIA_KEY1: TIntegerField;
    qryDatosOrdenImpNOMBRE_ABR: TIBStringField;
    qryDatosOrdenImpCONTACTO: TIBStringField;
    qryDatosOrdenImpPAIS: TIBStringField;
    qryDatosOrdenImpRNC_PROVEEDOR: TIBStringField;
    stpInsSolOrdenMast: TIBStoredProc;
    stpInsSolOrdenDet: TIBStoredProc;
    qryDatosSolOrdenImpDet: TIBQuery;
    qryDatosSolOrdenImp: TIBQuery;
    qryDatosSolOrdenImpNUMERO: TIntegerField;
    qryDatosSolOrdenImpCODIGO_PROVEE: TIntegerField;
    qryDatosSolOrdenImpFECHA: TDateTimeField;
    qryDatosSolOrdenImpFPAGO: TSmallintField;
    qryDatosSolOrdenImpCOD_CAJA_CHICA: TIntegerField;
    qryDatosSolOrdenImpCODIGO_BANCO: TIntegerField;
    qryDatosSolOrdenImpCUENTABANCO: TIBStringField;
    qryDatosSolOrdenImpOBSERVACION: TIBStringField;
    qryDatosSolOrdenImpMONTO: TFloatField;
    qryDatosSolOrdenImpSTATUS: TIBStringField;
    qryDatosSolOrdenImpIN_POR: TIBStringField;
    qryDatosSolOrdenImpFECHA_IN: TDateTimeField;
    qryDatosSolOrdenImpMOD_POR: TIBStringField;
    qryDatosSolOrdenImpFECHA_MOD: TDateTimeField;
    qryDatosSolOrdenImpTIPO_INV: TSmallintField;
    qryDatosSolOrdenImpSTATUS_CNT: TIBStringField;
    qryDatosSolOrdenImpNUM_ORDEN: TIntegerField;
    qryDatosSolOrdenImpSTATUS_ORD: TIBStringField;
    qryDatosSolOrdenImpAREA_ORDEN: TIntegerField;
    qryDatosSolOrdenImpCIA_KEY: TIntegerField;
    qryDatosSolOrdenImpNUMERO_NCF: TIBStringField;
    qryDatosSolOrdenImpDESCRIPCION: TIBStringField;
    qryDatosSolOrdenImpCIUDAD: TIBStringField;
    qryDatosSolOrdenImpCALYYNUM: TIBStringField;
    qryDatosSolOrdenImpTELEFONO: TIBStringField;
    qryDatosSolOrdenImpFAX: TIBStringField;
    qryDatosSolOrdenImpEMAIL: TIBStringField;
    qryDatosSolOrdenImpMOVIL1: TIBStringField;
    qryDatosSolOrdenImpMOVIL2: TIBStringField;
    qryDatosSolOrdenImpTELEFONO2: TIBStringField;
    qryDatosSolOrdenImpTELEFONO3: TIBStringField;
    qryDatosSolOrdenImpEXTENSIONES: TIBStringField;
    qryDatosSolOrdenImpCIA_KEY1: TIntegerField;
    qryDatosSolOrdenImpNOMBRE_ABR: TIBStringField;
    qryDatosSolOrdenImpCONTACTO: TIBStringField;
    qryDatosSolOrdenImpPAIS: TIBStringField;
    qryDatosSolOrdenImpRNC_PROVEEDOR: TIBStringField;
    qryDatosSolOrdenImpDetSERIE: TFloatField;
    qryDatosSolOrdenImpDetNUMERO: TIntegerField;
    qryDatosSolOrdenImpDetCOD_SERV_PROD: TIntegerField;
    qryDatosSolOrdenImpDetDEPARTAMENTO: TIntegerField;
    qryDatosSolOrdenImpDetOBSERVACION: TIBStringField;
    qryDatosSolOrdenImpDetCANTIDAD: TFloatField;
    qryDatosSolOrdenImpDetVALOR: TFloatField;
    qryDatosSolOrdenImpDetSTATUS: TIBStringField;
    qryDatosSolOrdenImpDetIN_POR: TIBStringField;
    qryDatosSolOrdenImpDetFECHA_IN: TDateTimeField;
    qryDatosSolOrdenImpDetMOD_POR: TIBStringField;
    qryDatosSolOrdenImpDetFECHA_MOD: TDateTimeField;
    qryDatosSolOrdenImpDetNUMERO_DOCUMENTO: TIntegerField;
    qryDatosSolOrdenImpDetNUMERO_FACTURA: TIntegerField;
    qryDatosSolOrdenImpDetCOD_CTA_CONCEPTO: TIntegerField;
    qryDatosSolOrdenImpDetTIPOSERVICIO: TIntegerField;
    qryDatosSolOrdenImpDetSUBTIPOSERV: TIntegerField;
    qryDatosSolOrdenImpDetNO_SERIE_RES: TIntegerField;
    qryDatosSolOrdenImpDetCODIGO_CONDUCTOR: TIntegerField;
    qryDatosSolOrdenImpDetSERIE_CDC: TIntegerField;
    qryDatosSolOrdenImpDetCODIGO_SERVCOSTO: TIntegerField;
    qryDatosSolOrdenImpDetNUMEROOLD: TIntegerField;
    qryDatosSolOrdenImpDetPRECIO: TFloatField;
    qryDatosSolOrdenImpDetAREA_ORDEN: TIntegerField;
    qryDatosSolOrdenImpDetITBI_DET: TFloatField;
    qryDatosSolOrdenImpDetPORC_DESC_DET: TFloatField;
    qryDatosSolOrdenImpDetMONTO_DESCUENTO: TFloatField;
    qrySolOrdenMaster: TIBDataSet;
    QrySolOrdenDet: TIBDataSet;
    qrySolOrdenMasterNUMERO: TIntegerField;
    qrySolOrdenMasterCODIGO_PROVEE: TIntegerField;
    qrySolOrdenMasterFECHA: TDateTimeField;
    qrySolOrdenMasterFPAGO: TSmallintField;
    qrySolOrdenMasterCOD_CAJA_CHICA: TIntegerField;
    qrySolOrdenMasterCODIGO_BANCO: TIntegerField;
    qrySolOrdenMasterCUENTABANCO: TIBStringField;
    qrySolOrdenMasterOBSERVACION: TIBStringField;
    qrySolOrdenMasterMONTO: TFloatField;
    qrySolOrdenMasterSTATUS: TIBStringField;
    qrySolOrdenMasterIN_POR: TIBStringField;
    qrySolOrdenMasterFECHA_IN: TDateTimeField;
    qrySolOrdenMasterMOD_POR: TIBStringField;
    qrySolOrdenMasterFECHA_MOD: TDateTimeField;
    qrySolOrdenMasterTIPO_INV: TSmallintField;
    qrySolOrdenMasterSTATUS_CNT: TIBStringField;
    qrySolOrdenMasterNUM_ORDEN: TIntegerField;
    qrySolOrdenMasterSTATUS_ORD: TIBStringField;
    qrySolOrdenMasterAREA_ORDEN: TIntegerField;
    qrySolOrdenMasterCIA_KEY: TIntegerField;
    qrySolOrdenMasterNUMERO_NCF: TIBStringField;
    QrySolOrdenDetSERIE: TFloatField;
    QrySolOrdenDetNUMERO: TIntegerField;
    QrySolOrdenDetCOD_SERV_PROD: TIntegerField;
    QrySolOrdenDetDEPARTAMENTO: TIntegerField;
    QrySolOrdenDetOBSERVACION: TIBStringField;
    QrySolOrdenDetCANTIDAD: TFloatField;
    QrySolOrdenDetVALOR: TFloatField;
    QrySolOrdenDetSTATUS: TIBStringField;
    QrySolOrdenDetIN_POR: TIBStringField;
    QrySolOrdenDetFECHA_IN: TDateTimeField;
    QrySolOrdenDetMOD_POR: TIBStringField;
    QrySolOrdenDetFECHA_MOD: TDateTimeField;
    QrySolOrdenDetNUMERO_DOCUMENTO: TIntegerField;
    QrySolOrdenDetNUMERO_FACTURA: TIntegerField;
    QrySolOrdenDetCOD_CTA_CONCEPTO: TIntegerField;
    QrySolOrdenDetTIPOSERVICIO: TIntegerField;
    QrySolOrdenDetSUBTIPOSERV: TIntegerField;
    QrySolOrdenDetNO_SERIE_RES: TIntegerField;
    QrySolOrdenDetCODIGO_CONDUCTOR: TIntegerField;
    QrySolOrdenDetSERIE_CDC: TIntegerField;
    QrySolOrdenDetCODIGO_SERVCOSTO: TIntegerField;
    QrySolOrdenDetNUMEROOLD: TIntegerField;
    QrySolOrdenDetPRECIO: TFloatField;
    QrySolOrdenDetAREA_ORDEN: TIntegerField;
    QrySolOrdenDetITBI_DET: TFloatField;
    QrySolOrdenDetPORC_DESC_DET: TFloatField;
    QrySolOrdenDetMONTO_DESCUENTO: TFloatField;
    tblMarcaVehiculo: TIBTable;
    tblMarcaVehiculoIDMARCA: TSmallintField;
    tblMarcaVehiculoDESCRIPCION: TIBStringField;
    dstblMarcaVehiculo: TDataSource;
    dstblTipoVehiculo: TDataSource;
    tblTipoVehiculo: TIBTable;
    tblTipoVehiculoIDTIPOVEH: TSmallintField;
    tblTipoVehiculoDESCRIPCION: TIBStringField;
    tblPolizaMaster: TIBDataSet;
    tblPolizaDet: TIBDataSet;
    tblPolizaMasterNUMERO: TIntegerField;
    tblPolizaMasterCOD_PROVEEDOR: TIntegerField;
    tblPolizaMasterPOLIZA: TIBStringField;
    tblPolizaMasterFECHA: TDateTimeField;
    tblPolizaMasterSTATUS: TIBStringField;
    tblPolizaMasterCOD_USUARIO: TIntegerField;
    tblPolizaMasterFECHA_IN: TDateTimeField;
    tblPolizaMasterIN_POR: TIBStringField;
    tblPolizaMasterFECHA_MOD: TDateTimeField;
    tblPolizaMasterMOD_POR: TIBStringField;
    tblPolizaDetSERIE: TIntegerField;
    tblPolizaDetNUMERO: TIntegerField;
    tblPolizaDetINICIOVIGENCIA: TDateTimeField;
    tblPolizaDetFINVIGENCIA: TDateTimeField;
    tblPolizaDetIDMARCA: TSmallintField;
    tblPolizaDetIDTIPOVEH: TSmallintField;
    tblPolizaDetNOMBREASEGURADO: TIBStringField;
    tblPolizaDetAPELLIDOASEGURADO: TIBStringField;
    tblPolizaDetREGISTRO: TIBStringField;
    tblPolizaDetCHASSIS: TIBStringField;
    tblPolizaDetFIANZAJUDICIAL: TFloatField;
    tblPolizaDetANO_VEHICULO: TIntegerField;
    tblPolizaDetSTATUS: TIBStringField;
    tblPolizaDetCOD_USUARIO: TIntegerField;
    tblPolizaDetFECHA_IN: TDateTimeField;
    tblPolizaDetIN_POR: TIBStringField;
    tblPolizaDetFECHA_MOD: TDateTimeField;
    tblPolizaDetMOD_POR: TIBStringField;
    dstblPolizaMaster: TDataSource;
    dstblPolizaDet: TDataSource;
    tblPolizaDetNO_VEHICULO: TIntegerField;
    qryRepPoliza: TIBQuery;
    qryRepPolizaNUMERO: TIntegerField;
    qryRepPolizaCOD_PROVEEDOR: TIntegerField;
    qryRepPolizaPOLIZA: TIBStringField;
    qryRepPolizaFECHA: TDateTimeField;
    qryRepPolizaSTATUS: TIBStringField;
    qryRepPolizaCOD_USUARIO: TIntegerField;
    qryRepPolizaFECHA_IN: TDateTimeField;
    qryRepPolizaIN_POR: TIBStringField;
    qryRepPolizaFECHA_MOD: TDateTimeField;
    qryRepPolizaMOD_POR: TIBStringField;
    qryRepPolizaNOMBREPROVEEDOR: TIBStringField;
    qryRepPolizaDEt: TIBQuery;
    qryRepPolizaDEtSERIE: TIntegerField;
    qryRepPolizaDEtNUMERO: TIntegerField;
    qryRepPolizaDEtINICIOVIGENCIA: TDateTimeField;
    qryRepPolizaDEtFINVIGENCIA: TDateTimeField;
    qryRepPolizaDEtIDMARCA: TSmallintField;
    qryRepPolizaDEtIDTIPOVEH: TSmallintField;
    qryRepPolizaDEtNOMBREASEGURADO: TIBStringField;
    qryRepPolizaDEtAPELLIDOASEGURADO: TIBStringField;
    qryRepPolizaDEtREGISTRO: TIBStringField;
    qryRepPolizaDEtCHASSIS: TIBStringField;
    qryRepPolizaDEtFIANZAJUDICIAL: TFloatField;
    qryRepPolizaDEtANO_VEHICULO: TIntegerField;
    qryRepPolizaDEtSTATUS: TIBStringField;
    qryRepPolizaDEtCOD_USUARIO: TIntegerField;
    qryRepPolizaDEtFECHA_IN: TDateTimeField;
    qryRepPolizaDEtIN_POR: TIBStringField;
    qryRepPolizaDEtFECHA_MOD: TDateTimeField;
    qryRepPolizaDEtMOD_POR: TIBStringField;
    qryRepPolizaDEtNO_VEHICULO: TIntegerField;
    qryRepPolizaDEtTIPOVEHDESC: TIBStringField;
    qryRepPolizaDEtMARCA: TIBStringField;
    qryViewOrdenCompMast: TIBQuery;
    qryViewOrdenCompDet: TIBQuery;
    qryViewOrdenCompMastBase: TIBQuery;
    qryViewOrdenCompMastBaseNUMERO: TIntegerField;
    qryViewOrdenCompMastBaseCODIGO_PROVEE: TIntegerField;
    qryViewOrdenCompMastBaseFECHA: TDateTimeField;
    qryViewOrdenCompMastBaseFPAGO: TSmallintField;
    qryViewOrdenCompMastBaseCOD_CAJA_CHICA: TIntegerField;
    qryViewOrdenCompMastBaseCODIGO_BANCO: TIntegerField;
    qryViewOrdenCompMastBaseCUENTABANCO: TIBStringField;
    qryViewOrdenCompMastBaseOBSERVACION: TIBStringField;
    qryViewOrdenCompMastBaseMONTO: TFloatField;
    qryViewOrdenCompMastBaseSTATUS: TIBStringField;
    qryViewOrdenCompMastBaseTIPO_INV: TSmallintField;
    qryViewOrdenCompMastBaseSTATUS_CNT: TIBStringField;
    qryViewOrdenCompMastBaseNUM_ORDEN: TIntegerField;
    qryViewOrdenCompMastBaseSTATUS_ORD: TIBStringField;
    qryViewOrdenCompMastBaseAREA_ORDEN: TIntegerField;
    qryViewOrdenCompMastBaseCIA_KEY: TIntegerField;
    qryViewOrdenCompMastBaseNUMERO_NCF: TIBStringField;
    qryViewOrdenCompDetSERIE: TFloatField;
    qryViewOrdenCompDetNUMERO: TIntegerField;
    qryViewOrdenCompDetCOD_SERV_PROD: TIntegerField;
    qryViewOrdenCompDetDEPARTAMENTO: TIntegerField;
    qryViewOrdenCompDetOBSERVACION: TIBStringField;
    qryViewOrdenCompDetCANTIDAD: TFloatField;
    qryViewOrdenCompDetVALOR: TFloatField;
    qryViewOrdenCompDetSTATUS: TIBStringField;
    qryViewOrdenCompDetIN_POR: TIBStringField;
    qryViewOrdenCompDetFECHA_IN: TDateTimeField;
    qryViewOrdenCompDetMOD_POR: TIBStringField;
    qryViewOrdenCompDetFECHA_MOD: TDateTimeField;
    qryViewOrdenCompDetNUMERO_DOCUMENTO: TIntegerField;
    qryViewOrdenCompDetNUMERO_FACTURA: TIntegerField;
    qryViewOrdenCompDetCOD_CTA_CONCEPTO: TIntegerField;
    qryViewOrdenCompDetTIPOSERVICIO: TIntegerField;
    qryViewOrdenCompDetSUBTIPOSERV: TIntegerField;
    qryViewOrdenCompDetNO_SERIE_RES: TIntegerField;
    qryViewOrdenCompDetCODIGO_CONDUCTOR: TIntegerField;
    qryViewOrdenCompDetSERIE_CDC: TIntegerField;
    qryViewOrdenCompDetCODIGO_SERVCOSTO: TIntegerField;
    qryViewOrdenCompDetNUMEROOLD: TIntegerField;
    qryViewOrdenCompDetPRECIO: TFloatField;
    qryViewOrdenCompDetAREA_ORDEN: TIntegerField;
    qryViewOrdenCompDetITBI_DET: TFloatField;
    qryViewOrdenCompDetPORC_DESC_DET: TFloatField;
    qryViewOrdenCompDetMONTO_DESCUENTO: TFloatField;
    dsqryViewOrdenCompMast: TDataSource;
    dsqryViewOrdenCompDet: TDataSource;
    qryViewOrdenCompMastNUMERO: TIntegerField;
    qryViewOrdenCompMastCODIGO_PROVEE: TIntegerField;
    qryViewOrdenCompMastFECHA: TDateTimeField;
    qryViewOrdenCompMastFPAGO: TSmallintField;
    qryViewOrdenCompMastCOD_CAJA_CHICA: TIntegerField;
    qryViewOrdenCompMastCODIGO_BANCO: TIntegerField;
    qryViewOrdenCompMastCUENTABANCO: TIBStringField;
    qryViewOrdenCompMastOBSERVACION: TIBStringField;
    qryViewOrdenCompMastMONTO: TFloatField;
    qryViewOrdenCompMastSTATUS: TIBStringField;
    qryViewOrdenCompMastTIPO_INV: TSmallintField;
    qryViewOrdenCompMastSTATUS_CNT: TIBStringField;
    qryViewOrdenCompMastNUM_ORDEN: TIntegerField;
    qryViewOrdenCompMastSTATUS_ORD: TIBStringField;
    qryViewOrdenCompMastAREA_ORDEN: TIntegerField;
    qryViewOrdenCompMastCIA_KEY: TIntegerField;
    qryViewOrdenCompMastNUMERO_NCF: TIBStringField;
    qryViewOrdenCompMastNOMBREPROVEEDOR: TIBStringField;
    qryOrdenMasterNUMERO_NCF: TIBStringField;
    qryOrdenMasterCODIGO_VENDEDOR: TIntegerField;
    qryDatosOrdenImpCONDICION: TIntegerField;
    qryDatosOrdenImpLIMITE_CREDITO: TFloatField;
    qryDatosOrdenImpFECHA_VENCE: TDateTimeField;
    tblDevolucionAbierta: TIBDataSet;
    tblDevolucionAbiertaNUMERO_DEVOLUCION: TIntegerField;
    tblDevolucionAbiertaMONEDA: TIBStringField;
    tblDevolucionAbiertaCODIGO_CTE: TIntegerField;
    tblDevolucionAbiertaMONTO_PENDIENTE: TFloatField;
    tblDevolucionAbiertaSTATUS: TIBStringField;
    tblDevolucionAbiertaFECHA_IN: TDateTimeField;
    tblDevolucionAbiertaIN_POR: TIBStringField;
    tblDevolucionAbiertaFECHA_MOD: TDateTimeField;
    tblDevolucionAbiertaMOD_POR: TIBStringField;
    tblDevolucionAbiertaNUMERO_TRN_VTA: TIntegerField;
    tblDevolucionAbiertaSERIE_TRNXCX: TIntegerField;
    tblPolizaMasterCODIGO_CTE: TIntegerField;
    qryDatosOrdenImpCONDICIONCREDITO: TIBStringField;
    tblPolizaDetCOLOR: TIBStringField;
    tblPolizaDetCASACONDUCTOR: TSmallintField;
    tblPolizaDetAUTOASISTENCIA: TSmallintField;
    qryRepPolizaCODIGO_CTE: TIntegerField;
    qryRepPolizaDEtCOLOR: TIBStringField;
    qryRepPolizaDEtCASACONDUCTOR: TSmallintField;
    qryRepPolizaDEtAUTOASISTENCIA: TSmallintField;
    qryConfCajaXusuario: TIBDataSet;
    qryConfCajaXusuarioCOD_EMPLEADO: TIntegerField;
    qryConfCajaXusuarioFECHAOPEN: TDateTimeField;
    qryConfCajaXusuarioFECHACLOSE: TDateTimeField;
    qryConfCajaXusuarioCOD_CAJA: TIntegerField;
    qryConfCajaXusuarioSTATUS: TIBStringField;
    qryConfCajaXusuarioID_FISCALPRINTER: TIntegerField;
    dsqryConfCajaXusuario: TDataSource;
    tblImpresoraFiscal: TIBTable;
    tblImpresoraFiscalID_FISCALPRINTER: TIntegerField;
    tblImpresoraFiscalFECHA_ENTRADA: TDateTimeField;
    tblImpresoraFiscalSERIE: TIBStringField;
    tblImpresoraFiscalMARCA: TIBStringField;
    tblImpresoraFiscalMODELO: TIBStringField;
    tblImpresoraFiscalVERSIONAPI: TIBStringField;
    tblImpresoraFiscalSTATUS: TIBStringField;
    tblImpresoraFiscalFECHA_SALIDA: TDateTimeField;
    tblImpresoraFiscalNUM_LOGO: TIntegerField;
    tblImpresoraFiscalPUERTO: TIBStringField;
    tblImpresoraFiscalBAUDRATE: TIntegerField;
    dstblImpresoraFiscal: TDataSource;
    tblTipoDocFiscal_L: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    dstblTipoDocFiscal_L: TDataSource;
    tblTipoDocFiscal: TIBTable;
    dstblTipoDocFiscal: TDataSource;
    qryImpresoraFiscalActiva: TIBQuery;
    qryImpresoraFiscalActivaMODELO: TIBStringField;
    tblTipoCF: TIBTable;
    dstblTipoCF: TDataSource;
    tblCaja: TIBTable;
    tblCajaCOD_CAJA: TIntegerField;
    tblCajaFECHA: TDateTimeField;
    tblCajaDESCRIPCION: TIBStringField;
    tblCajaBALANCE_ANT: TFloatField;
    tblCajaBALANCE_ACTUAL: TFloatField;
    tblCajaMONTO_ENTRADA_ACUM: TFloatField;
    tblCajaMONTO_RETIRADO_ACUM: TFloatField;
    tblCajaCOD_USUARIO: TIntegerField;
    tblCajaSTATUS: TIBStringField;
    dstblCaja: TDataSource;
    tblLineaDescDocF: TIBDataSet;
    tblLineaDescDocFIDLINEA: TIntegerField;
    tblLineaDescDocFITEM: TIntegerField;
    tblLineaDescDocFDESCRIPCION: TIBStringField;
    dstblLineaDescDocF: TDataSource;
    sqlLineaDescDocFGenMax: TIBSQL;
    tblNcftipoIFiscal: TIBTable;
    dstblNcftipoIFiscal: TDataSource;
    tblEmpleados: TIBTable;
    tblEmpleadosCODIGO: TIntegerField;
    tblEmpleadosCODIGO_CIA: TIntegerField;
    tblEmpleadosNOMBRE: TIBStringField;
    tblEmpleadosAPELLIDO: TIBStringField;
    tblEmpleadosCEDULA: TIBStringField;
    tblEmpleadosFOTO: TBlobField;
    tblEmpleadosPASSPORT: TIBStringField;
    tblEmpleadosCALLE: TIBStringField;
    tblEmpleadosNUM_CASA: TSmallintField;
    tblEmpleadosCIUDAD: TIBStringField;
    tblEmpleadosPAIS: TIBStringField;
    tblEmpleadosTELEF_CASA: TIBStringField;
    tblEmpleadosTELEF_OFICINA: TIBStringField;
    tblEmpleadosCELULAR: TIBStringField;
    tblEmpleadosEMAIL: TIBStringField;
    tblEmpleadosSEXO: TIBStringField;
    tblEmpleadosESTADO_CIVIL: TIBStringField;
    tblEmpleadosTELEF_REFERENCIA: TIBStringField;
    tblEmpleadosNOMBRE_REFERENCIA: TIBStringField;
    tblEmpleadosFECHA_NAC: TDateTimeField;
    tblEmpleadosNACIONALIDAD: TIBStringField;
    tblEmpleadosFECHA_ENTRADA: TDateTimeField;
    tblEmpleadosFECHA_SALIDA: TDateTimeField;
    tblEmpleadosSALARIO: TFloatField;
    tblEmpleadosTIPO_NOMINA: TSmallintField;
    tblEmpleadosTIPO_EMPLEADO: TSmallintField;
    tblEmpleadosDEPTO_EMP: TSmallintField;
    tblEmpleadosSECCION: TSmallintField;
    tblEmpleadosCARGO: TSmallintField;
    tblEmpleadosPAGA_AFP: TSmallintField;
    tblEmpleadosPAGA_TSS: TSmallintField;
    tblEmpleadosSTATUS: TIBStringField;
    tblEmpleadosFECHA_IN: TDateTimeField;
    tblEmpleadosIN_POR: TIBStringField;
    tblEmpleadosFECHA_MOD: TDateTimeField;
    tblEmpleadosMOD_POR: TIBStringField;
    tblEmpleadosLICENCIA: TIBStringField;
    tblEmpleadosFECHA_VENCE_LICENCIA: TDateTimeField;
    dstblEmpleados: TDataSource;
    tblTipoCFTIPO_CF: TIBStringField;
    tblTipoCFDESCRIPCION: TIBStringField;
    tblTipoDocFiscalTIPO: TIntegerField;
    tblTipoDocFiscalDESCRIPCION: TIBStringField;
    qryConfCajaXusuarioRUTA_TICKET: TIBStringField;
    qryRepPolizaDEtNOMBREASEGURADOCTE: TIBStringField;
    tblImpresoraFiscalRUTA_EXELIBROVENTA: TIBStringField;
    qryImpresoraFiscal: TIBQuery;
    qryImpresoraFiscalID_FISCALPRINTER: TIntegerField;
    qryImpresoraFiscalFECHA_ENTRADA: TDateTimeField;
    qryImpresoraFiscalSERIE: TIBStringField;
    qryImpresoraFiscalMARCA: TIBStringField;
    qryImpresoraFiscalMODELO: TIBStringField;
    qryImpresoraFiscalVERSIONAPI: TIBStringField;
    qryImpresoraFiscalSTATUS: TIBStringField;
    qryImpresoraFiscalFECHA_SALIDA: TDateTimeField;
    qryImpresoraFiscalNUM_LOGO: TIntegerField;
    qryImpresoraFiscalPUERTO: TIBStringField;
    qryImpresoraFiscalBAUDRATE: TIntegerField;
    qryImpresoraFiscalRUTA_EXELIBROVENTA: TIBStringField;
    tblNcftipoIFiscalTIPO_NCF: TIBStringField;
    tblNcftipoIFiscalTIPO_NCF_IFISCAL: TIntegerField;
    tblNcftipoIFiscalDESCRIPCION: TIBStringField;
    tblNcftipoIFiscalDescDocIFiscal: TStringField;
    tblNcftipoIFiscalDescDocFiscal: TStringField;
    tblNcftipoIFiscalTIPO_NCFNCR: TSmallintField;
    tblDescCotizacion: TIBDataSet;
    tblDescCotizacionIDLINEA: TIntegerField;
    tblDescCotizacionITEM: TIntegerField;
    tblDescCotizacionDESCRIPCION: TIBStringField;
    dstblDescCotizacion: TDataSource;
    tblTipoTrnCnt: TIBDataSet;
    tblTipoTrnCntSERIE: TIntegerField;
    tblTipoTrnCntTIPO_PERS: TSmallintField;
    tblTipoTrnCntTIPO_DOC: TSmallintField;
    tblTipoTrnCntIDCRITERIO: TSmallintField;
    tblTipoTrnCntDESCRIPCION: TIBStringField;
    tblTipoTrnCntEJEMPLO: TIBStringField;
    tblTipoTrnCntRETENCION_ISR: TSmallintField;
    tblTipoTrnCntRETENCION_ITBIS: TSmallintField;
    tblTipoTrnCntTASA_ITBIS: TFloatField;
    tblTipoTrnCntTASA_ISR: TFloatField;
    dstblTipoTrnCnt: TDataSource;
    tblCriterioTipodoc: TIBTable;
    tblCriterioTipodocIDCRITERIO: TSmallintField;
    tblCriterioTipodocDESCRIPCION: TIBStringField;
    dstblCriterioTipodoc: TDataSource;
    tblTipoTrnCntFECHA_INICIAL: TDateTimeField;
    tblTipoTrnCntFECHA_FINAL: TDateTimeField;
    qryOrdenMasterSERIE_TIPOTRNCNT: TIntegerField;
    qryOrdenMasterTASA_ITBIS: TFloatField;
    qryOrdenMasterTASA_ISR: TFloatField;
    qryOrdenMasterMONTO_RETENER_ISR: TFloatField;
    qryOrdenMasterMONTO_RETENER_ITBIS: TFloatField;
    tblEmail: TIBDataSet;
    tblEmailIDTIPO: TIntegerField;
    tblEmailSUBJECT: TIBStringField;
    tblEmailPORT: TIntegerField;
    tblEmailUSER_EMAIL: TIBStringField;
    tblEmailUSER_PASSWORD: TIBStringField;
    tblEmailFROMEMAIL: TIBStringField;
    tblEmailTOEMAIL: TIBStringField;
    tblEmailCCEMAIL: TIBStringField;
    tblEmailFECHAIN: TDateTimeField;
    tblEmailIN_POR: TIBStringField;
    tblEmailFECHA_UPDATE: TDateTimeField;
    tblEmailUPD_POR: TIBStringField;
    tblEmailSTATUS: TIBStringField;
    dstblEmail: TDataSource;
    stpInsEmailTracking: TIBStoredProc;
    qryEmailProceso: TIBQuery;
    qryEmailProcesoIDTIPO: TIntegerField;
    qryEmailProcesoSUBJECT: TIBStringField;
    qryEmailProcesoPORT: TIntegerField;
    qryEmailProcesoUSER_EMAIL: TIBStringField;
    qryEmailProcesoUSER_PASSWORD: TIBStringField;
    qryEmailProcesoFROMEMAIL: TIBStringField;
    qryEmailProcesoTOEMAIL: TIBStringField;
    qryEmailProcesoCCEMAIL: TIBStringField;
    qryEmailProcesoFECHAIN: TDateTimeField;
    qryEmailProcesoIN_POR: TIBStringField;
    qryEmailProcesoFECHA_UPDATE: TDateTimeField;
    qryEmailProcesoUPD_POR: TIBStringField;
    qryEmailProcesoSTATUS: TIBStringField;
    qryEmailProcesoEXEMAILTOOL: TIBStringField;
    tblImpresoraFiscalRUTALIBROVENTAS: TIBStringField;
    qryImpresoraFiscalRUTALIBROVENTAS: TIBStringField;
    qryMembrete: TIBQuery;
    qryMembreteCODIGO_CIA: TIntegerField;
    qryMembreteLINE_NO: TIntegerField;
    qryMembreteLINEA1: TIBStringField;
    qryMembreteLINEA2: TIBStringField;
    qryMembreteLINEA3: TIBStringField;
    qryMembreteLINEA4: TIBStringField;
    qryMembreteLINEA5: TIBStringField;
    qryImpresoraFiscalENCABEZADO: TIBStringField;
    tblImpresoraFiscalENCABEZADO: TIBStringField;
    qryDatosOrdenImpDetIDUNIDAD: TIntegerField;
    tblLineaDescDocFDetNotInUse: TIBDataSet;
    tblLineaDescDocFSTATUS: TIBStringField;
    qryImpresoras: TIBQuery;
    tblImpresora: TIBDataSet;
    tblImpresoraIDMODULO: TSmallintField;
    tblImpresoraIDREPORTE: TIntegerField;
    tblImpresoraNOMBRE_IMPRESORA: TIBStringField;
    tblImpresoraIN_POR: TIBStringField;
    tblImpresoraFECHA_IN: TDateTimeField;
    dstblImpresora: TDataSource;
    qryImpresorasIDMODULO: TSmallintField;
    qryImpresorasIDREPORTE: TIntegerField;
    qryImpresorasNOMBRE_IMPRESORA: TIBStringField;
    qryImpresorasIN_POR: TIBStringField;
    qryImpresorasFECHA_IN: TDateTimeField;
    tblDealer: TIBDataSet;
    tblDealerCODIGO_DEALER: TIntegerField;
    tblDealerDESCRIPCION: TIBStringField;
    dstblDealer: TDataSource;
    dstblAgencia: TDataSource;
    tblAgencia: TIBDataSet;
    tblAgenciaCODIGO_AGENCIA: TIntegerField;
    tblAgenciaDESCRIPCION: TIBStringField;
    tblConfComEmp: TIBDataSet;
    tblConfComEmpCODIGO_EMP: TIntegerField;
    tblConfComEmpCODIGO_COMISION: TIntegerField;
    dstblConfComEmp: TDataSource;
    tblConfComEmpNOMBREEMPLEADO: TIBStringField;
    tblConfComEmpIDCATEGORIA: TIntegerField;
    qryEmailProcesoEMAIL_SERVER: TIBStringField;
    tblEmailEMAIL_SERVER: TIBStringField;
    qryCantCambiosStatus: TIBQuery;
    qryCantCambiosStatusCANT_ACCION: TIntegerField;
    qryOrdenDetCANT_OFERTA: TIntegerField;
    qryOrdenDetIDUNIDAD: TIntegerField;
    qryOrdenDetCOD_USUARIO_RECIBE: TIntegerField;
    qryOrdenDetCOD_USUARIO_CREA: TIntegerField;
    tblDatosNotifyGEmail: TIBDataSet;
    tblDatosNotifyGEmailCHASSIS: TIBStringField;
    tblDatosNotifyGEmailCODIGO_CTE: TIntegerField;
    tblDatosNotifyGEmailNUMERO: TIntegerField;
    tblDatosNotifyGEmailNUM_CERTIFICADO: TIntegerField;
    tblDatosNotifyGEmailNUMPOL: TIntegerField;
    tblDatosNotifyGEmailNOTIFY_EMAIL: TSmallintField;
    qryEmailTemplate: TIBQuery;
    qryEmailTemplateID: TIntegerField;
    qryEmailTemplateCIA_KEY: TIntegerField;
    qryEmailTemplateIDTIPO: TIntegerField;
    qryEmailTemplateACCOUNT_ID: TIntegerField;
    qryEmailTemplateBODY: TMemoField;
    qryEmailTemplateSUBJECT: TIBStringField;
    tblTipoAfiliado: TIBTable;
    tblTipoAfiliadoIDTIPO: TIntegerField;
    tblTipoAfiliadoDESCRIPCION: TIBStringField;
    tblTipoAfiliadoRUTACARTABIENVENIDA: TIBStringField;
    tblEmailTemplate: TIBDataSet;
    tblEmailTemplateID: TIntegerField;
    tblEmailTemplateCIA_KEY: TIntegerField;
    tblEmailTemplateIDTIPO: TIntegerField;
    tblEmailTemplateACCOUNT_ID: TIntegerField;
    tblEmailTemplateBODY: TMemoField;
    tblEmailTemplateTIPOEMAIL: TIBStringField;
    tblEmailTemplateSUBJECT: TIBStringField;
    qryBuscarEmailTemplate: TIBQuery;
    qryEmailProcesoLookup: TIBQuery;
    qryEmailProcesoLookupIDTIPO: TIntegerField;
    qryEmailProcesoLookupSUBJECT: TIBStringField;
    tblEmailEXEMAILTOOL: TIBStringField;
    qryDatosOrdenImpDetCANT_OFERTA: TIntegerField;
    qryDatosOrdenImpDetCOD_USUARIO_RECIBE: TIntegerField;
    qryDatosOrdenImpDetCOD_USUARIO_CREA: TIntegerField;
    qryDatosOrdenImpDetCANTORDEN: TFloatField;
    qryOrdenMasterIDTIPO_COMPRA: TIntegerField;
    qryOrdenMasterFECHA_RECIBIDA: TDateTimeField;
    qryOrdenMasterFECHA_DEBERECIBIR: TDateTimeField;
    qryDatosOrdenImpFECHA_DEBERECIBIR: TDateTimeField;
    tblEcfCiudades: TIBDataSet;
    tblEcfCiudadesCODIGO: TIntegerField;
    tblEcfCiudadesNOMBRE: TIBStringField;
    dstblEcfCiudades: TDataSource;
    qryProvinciaseCF: TIBQuery;
    qryMunicipioseCF: TIBQuery;
    qryProvinciaseCFCODIGO: TIntegerField;
    qryProvinciaseCFNOMBRE: TIBStringField;
    qryMunicipioseCFCODIGO: TIntegerField;
    qryMunicipioseCFNOMBRE: TIBStringField;
    qryEscalaISR: TIBQuery;
    qryEscalaISRCODIGO_RETENCION: TIntegerField;
    qryEscalaISRCODIGO_ESCALA: TIntegerField;
    qryEscalaISRESCALA_RETENCION: TFloatField;
    qryEscalaISRTASA_EXENTO: TFloatField;
    qryEscalaISREXCEDENTE: TFloatField;
    qryEscalaISROBSERVACIONES: TIBStringField;
    qryEscalaISRSTATUS_RETEN: TIBStringField;
    qryEscalaISRFECHA_INI: TDateTimeField;
    qryEscalaISRFECHA_FIN: TDateTimeField;
    qryRegAdicional: TIBQuery;
    qryRegAdicionalANIO_REGALIA: TIntegerField;
    qryRegAdicionalCODIGO_CIA: TIntegerField;
    qryRegAdicionalCODIGO_EMP: TIntegerField;
    qryRegAdicionalMONTO: TFloatField;
    qryRegAdicionalSTATUS: TIBStringField;
    qryRegAdicionalINSERTADO_POR: TIBStringField;
    qryRegAdicionalFECHA_IN: TDateTimeField;
    qryRegAdicionalMODIFICADO_POR: TIBStringField;
    qryRegAdicionalFECHA_MOD: TDateTimeField;
    updqryRegAdicional: TIBUpdateSQL;
    dtqryRegAdicional: TDataSource;
    QryProyRegalia: TIBQuery;
    QryProyRegaliaCIA_KEY: TSmallintField;
    QryProyRegaliaCODIGO: TIntegerField;
    QryProyRegaliaNOMBRE: TIBStringField;
    QryProyRegaliaAPELLIDO: TIBStringField;
    QryProyRegaliaSALARIOMENSUAL: TFloatField;
    QryProyRegaliaSTATUS_EMP: TIBStringField;
    QryProyRegaliaSALARIOACUMULADO: TFloatField;
    QryProyRegaliaTIPOSERVICIO: TIntegerField;
    QryProyRegaliaSUBTIPOSERV: TIntegerField;
    QryProyRegaliaSTATUS_REGALIA: TIBStringField;
    QryProyRegaliaSALARIOPROY: TFloatField;
    QryProyRegaliaTOTALACUM: TFloatField;
    QryProyRegaliaREG_PROY: TFloatField;
    dtQryProyRegalia: TDataSource;
    updqryFirmCredCoop: TIBUpdateSQL;
    qryFirmCredCoop: TIBQuery;
    qryFirmCredCoopCODIGO: TSmallintField;
    qryFirmCredCoopNOMBRE: TIBStringField;
    qryFirmCredCoopFECHA_IN: TDateTimeField;
    qryFirmCredCoopFECHA_MOD: TDateTimeField;
    qryFirmCredCoopSTATUS: TIBStringField;
    qryFirmCredCoopMOD_POR: TIBStringField;
    qryFirmCredCoopIN_POR: TIBStringField;
    qryBoni: TIBQuery;
    qryBoniCIA_KEY: TSmallintField;
    qryBoniCODIGO: TIntegerField;
    qryBoniFECHA: TDateTimeField;
    qryBoniMONTO_BONIFIACION: TFloatField;
    qryBoniISR: TFloatField;
    qryBoniSTATUS: TIBStringField;
    qryStatusRegalia: TIBQuery;
    qryStatusRegaliaCIA_KEY: TIntegerField;
    qryStatusRegaliaANO_REGALIA: TDateTimeField;
    qryStatusRegaliaSTATUS: TIBStringField;
    qryDatosBoni: TIBQuery;
    qryDatosBoniCIA_KEY: TSmallintField;
    qryDatosBoniCODIGO: TIntegerField;
    qryDatosBoniFECHA: TDateTimeField;
    qryDatosBoniMONTO_BONIFIACION: TFloatField;
    qryDatosBoniISR: TFloatField;
    qryDatosBoniBONONETO: TFloatField;
    qryDatosBoniNUMERO_CKS: TIntegerField;
    qryDatosBoniSTATUS: TIBStringField;
    qryDatosBoniDEPTO_EMP: TIntegerField;
    qryDatosBoniSECCION_EMP: TIntegerField;
    dtTipoOrdenEmpCoop: TDataSource;
    dtqryEmpRegalia: TDataSource;
    dtqryBoni: TDataSource;
    qryChequesPTipo: TIBQuery;
    qryChequesPTipoDESCRIPCION: TIBStringField;
    qryChequesPTipoTIPO_CKS: TSmallintField;
    qryChequesPTipoTIPOSERVICIO: TIntegerField;
    qryChequesPTipoCUENTA1_CAT: TIBStringField;
    qryChequesPTipoCUENTA2_CAT: TIBStringField;
    qryChequesPTipoCUENTA3_CAT: TIBStringField;
    qryChequesPTipoCTA_CONCEPTO: TIntegerField;
    qryChequesPTipoCOD_SUBTIPO: TSmallintField;
    dtqryChequesPTipo: TDataSource;
    qryOrdenEmp: TIBQuery;
    qryOrdenEmpTipoOrdenDesc: TStringField;
    qryOrdenEmpNombreCompleto: TStringField;
    qryOrdenEmpNOMBREPROVEE: TStringField;
    qryOrdenEmpAPELLIDO: TStringField;
    qryOrdenEmpNOMB_EMPLEADO: TStringField;
    qryOrdenEmpCEDULA: TStringField;
    qryOrdenEmpCODIGO: TIntegerField;
    qryOrdenEmpFECHA: TDateTimeField;
    qryOrdenEmpNUMERO: TIntegerField;
    qryOrdenEmpCOD_PROVEEDOR: TIntegerField;
    qryOrdenEmpMONTO: TFloatField;
    qryOrdenEmpSTATUS: TIBStringField;
    qryOrdenEmpIN_POR: TIBStringField;
    qryOrdenEmpFECHA_IN: TDateTimeField;
    qryOrdenEmpMOD_POR: TIBStringField;
    qryOrdenEmpFECHA_MOD: TDateTimeField;
    qryOrdenEmpFORMA_PAGO: TSmallintField;
    qryOrdenEmpTIPO_ORDEN: TIntegerField;
    qryRepOrdCFirm: TIBQuery;
    qryRepOrdCFirmNOMBRE: TIBStringField;
    tTipoOrdenEmpCoop: TIBDataSet;
    tTipoOrdenEmpCoopCODIGO: TIntegerField;
    tTipoOrdenEmpCoopDESCRIPCION: TIBStringField;
    DataSource1: TDataSource;
    tProveedores: TIBDataSet;
    tProveedoresCODIGO_CTE: TIntegerField;
    tProveedoresTIPO_CLIENTE: TIntegerField;
    tProveedoresNOMBRE_ABR: TIBStringField;
    tProveedoresDESCRIPCION: TIBStringField;
    tProveedoresCONTACTO: TIBStringField;
    tProveedoresPAIS: TIBStringField;
    tProveedoresESTADO: TIBStringField;
    tProveedoresCIUDAD: TIBStringField;
    tProveedoresCALYYNUM: TIBStringField;
    tProveedoresTELEFONO: TIBStringField;
    tProveedoresFAX: TIBStringField;
    tProveedoresCODIGOPOSTAL: TIBStringField;
    tProveedoresEMAIL: TIBStringField;
    tProveedoresDIRECCIONWEB: TIBStringField;
    tProveedoresSTATUS: TIBStringField;
    tProveedoresFECHA_IN: TDateTimeField;
    tProveedoresIN_POR: TIBStringField;
    tProveedoresFECHA_MOD: TDateTimeField;
    tProveedoresMOD_POR: TIBStringField;
    tProveedoresRNC_PROVEEDOR: TIBStringField;
    tProveedoresMOVIL1: TIBStringField;
    tProveedoresMOVIL2: TIBStringField;
    tProveedoresTELEFONO2: TIBStringField;
    tProveedoresTELEFONO3: TIBStringField;
    tProveedoresEXTENSIONES: TIBStringField;
    tProveedoresCIA_KEY: TIntegerField;
    tProveedoresLIMITE_CREDITO: TFloatField;
    tProveedoresCOD_VENDEDOR: TIntegerField;
    tProveedoresCONDICION: TIntegerField;
    tProveedoresCANT_DIAS_CREDITO: TSmallintField;
    tProveedoresIDTIPO_PROV: TIntegerField;
    tProveedoresTIPODOC: TSmallintField;
    tProveedoresID_PROVINCIA: TIntegerField;
    tProveedoresID_MUNICIPIO: TIntegerField;
    dtqryOrdenEmp: TDataSource;
    dtqryFirmCredCoop: TDataSource;
    updqryOrdenEmp: TIBUpdateSQL;
    qryRepIR13: TIBQuery;
    qryRepIR13CODIGO: TIntegerField;
    qryRepIR13NOMBRE: TIBStringField;
    qryRepIR13APELLIDO: TIBStringField;
    qryRepIR13CEDULA: TIBStringField;
    qryRepIR13STATUS: TIBStringField;
    qryRepIR13DEPTO_EMP: TSmallintField;
    qryRepIR13SALARIO_BRUTO: TFloatField;
    qryRepIR13OTROS_INGRESOS: TFloatField;
    qryRepIR13ISR_RETENIDO: TFloatField;
    qryRepIR13AFP: TFloatField;
    qryRepIR13SalarioProy: TFloatField;
    qryRepIR13SalarioExcAfp: TCurrencyField;
    qryRepIR13MontoBoni: TFloatField;
    qryRepIR13MONTO_VAC: TFloatField;
    qryRepIR13MONTO_REGALIA: TFloatField;
    qryRepIR13ISR_CALCULADO: TFloatField;
    QryVaca: TIBDataSet;
    QryVacaCODIGO_TRANS: TIntegerField;
    QryVacaCODIGO_TIPO_TRANS: TSmallintField;
    QryVacaCODIGO_TIPO_NOMINA: TSmallintField;
    QryVacaCODIGO: TIntegerField;
    QryVacaVALOR_TRANS: TFloatField;
    QryVacaFECHA_ENT: TDateTimeField;
    QryVacaFECHA_SAL: TDateTimeField;
    QryVacaOBSERVACIONES: TIBStringField;
    QryVacaSTATUS_TRANS: TIBStringField;
    QryVacaTIPO_CTA: TSmallintField;
    QryVacaCANT_DIAS: TIntegerField;
    QryVacaFECHA_EFECTIVA: TDateTimeField;
    qryTotalNom: TIBQuery;
    qryTotalNomSBRUTO: TFloatField;
    qryTotalNomIDSS: TFloatField;
    qryTotalNomCOOP: TFloatField;
    qryTotalNomSEGMED: TFloatField;
    qryTotalNomISR: TFloatField;
    qryTotalNomOING: TFloatField;
    qryTotalNomODED: TFloatField;
    qryTotalNomSNETO: TFloatField;
    qryLey8701: TIBQuery;
    qryLey8701PORC_EMPLEADO: TFloatField;
    qryLey8701PORC_PATRONO: TFloatField;
    tTablaRetIsr: TIBTable;
    qryEmpRegalia: TIBDataSet;
    qryEmpRegaliaCIA_KEY: TSmallintField;
    qryEmpRegaliaCODIGO: TIntegerField;
    qryEmpRegaliaSTATUS: TIBStringField;
    procedure qryInvAfterOpen(DataSet: TDataSet);
    procedure qryDatosOrdenImpAfterScroll(DataSet: TDataSet);
    procedure qryDatosSolOrdenImpAfterScroll(DataSet: TDataSet);
    procedure tblPolizaMasterAfterScroll(DataSet: TDataSet);
    procedure qryRepPolizaAfterScroll(DataSet: TDataSet);
    procedure qryViewOrdenCompMastAfterScroll(DataSet: TDataSet);
    procedure qryOrdenMasterAfterScroll(DataSet: TDataSet);
    procedure tblLineaDescDocFAfterScroll(DataSet: TDataSet);
    procedure tblConfComEmpFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure QryProyRegaliaCalcFields(DataSet: TDataSet);
    procedure qryOrdenEmpCalcFields(DataSet: TDataSet);
    procedure qryOrdenEmpBeforeOpen(DataSet: TDataSet);
    procedure QryProyRegaliaFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryRepIR13CalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);

  private
    { Private declarations }
    procedure ClearLookupFieldLinks(ADataSet: TDataSet);
    procedure PrepareForDestroy;
  public
    { Public declarations }

    codCatSel : Integer;
    mesesProy : Real;
    SumaDet : Boolean;
    statusEmpReg:string;
    destructor Destroy; override;
  end;

var
  dmDatos: TdmDatos;

implementation

uses UDatModConectar,uglobal;//UDatModCon;

{$R *.dfm}

destructor TdmDatos.Destroy;
begin
  { 
    Cierre defensivo:
    Este DataModule contiene campos lookup y consultas cached-updates que apuntan
    a otros componentes del mismo DataModule. Durante la destruccion en orden
    inverso, esos componentes pueden liberarse antes que el dataset que los
    referencia, provocando Access Violation al cerrar la aplicacion.
  }
  try
    PrepareForDestroy;
  except
    { Nunca levantar excepcion desde el destructor }
  end;

  inherited Destroy;
end;

procedure TdmDatos.ClearLookupFieldLinks(ADataSet: TDataSet);
var
  I: Integer;
  F: TField;
begin
  if ADataSet = nil then
    Exit;

  for I := 0 to ADataSet.FieldCount - 1 do
  begin
    F := ADataSet.Fields[I];

    if (F <> nil) and (F.FieldKind = fkLookup) then
    begin
      { 
        Importante: algunos lookup fields apuntan a datasets internos como
        tblTipoDocFiscal, tblTipoCF, tTipoOrdenEmpCoop y tProveedores.
        Si esos datasets se destruyen antes que el owner del campo lookup,
        queda un puntero colgante.
      }
      try
        F.LookupDataSet := nil;
        F.LookupKeyFields := '';
        F.LookupResultField := '';
        F.KeyFields := '';
      except
      end;
    end;
  end;
end;

procedure TdmDatos.PrepareForDestroy;
var
  I: Integer;
  C: TComponent;
  DS: TDataSet;
  SRC: TDataSource;
begin
  { Primero desconectar DataSources para cortar enlaces visuales/dataset }
  for I := ComponentCount - 1 downto 0 do
  begin
    C := Components[I];

    if C is TDataSource then
    begin
      SRC := TDataSource(C);
      SRC.OnDataChange := nil;
      SRC.OnStateChange := nil;
      SRC.OnUpdateData := nil;
      SRC.DataSet := nil;
    end;
  end;

  { Luego preparar datasets/queries antes de que el inherited Destroy libere hijos }
  for I := ComponentCount - 1 downto 0 do
  begin
    C := Components[I];

    if C is TDataSet then
    begin
      DS := TDataSet(C);

      DS.BeforeOpen := nil;
      DS.AfterOpen := nil;
      DS.BeforeClose := nil;
      DS.AfterClose := nil;
      DS.BeforeInsert := nil;
      DS.AfterInsert := nil;
      DS.BeforeEdit := nil;
      DS.AfterEdit := nil;
      DS.BeforePost := nil;
      DS.AfterPost := nil;
      DS.BeforeCancel := nil;
      DS.AfterCancel := nil;
      DS.BeforeDelete := nil;
      DS.AfterDelete := nil;
      DS.BeforeScroll := nil;
      DS.AfterScroll := nil;
      DS.OnCalcFields := nil;
      DS.OnDeleteError := nil;
      DS.OnEditError := nil;
      DS.OnFilterRecord := nil;
      DS.OnNewRecord := nil;
      DS.OnPostError := nil;

      ClearLookupFieldLinks(DS);

      if DS.Active then
      begin
        DS.DisableControls;
        try
          DS.Close;
        finally
          DS.EnableControls;
        end;
      end;
    end;

    { 
      TIBQuery con CachedUpdates puede mantener referencia a TIBUpdateSQL.
      En este DataModule hay casos peligrosos:
      - qryRegAdicional.UpdateObject = updqryRegAdicional
      - qryOrdenEmp.UpdateObject = updqryOrdenEmp

      Como los UpdateSQL estan creados despues que algunos queries, pueden
      destruirse antes y dejar puntero colgante si no se limpia la referencia.
    }
    if C is TIBQuery then
    begin
      try
        TIBQuery(C).UpdateObject := nil;
      except
      end;
    end;
  end;
end;

procedure TdmDatos.qryInvAfterOpen(DataSet: TDataSet);
begin
  //rxqryInv.Close;
  //rxqryInv.Open;
  //qryInv.First;
  //While Not qryInv.Eof do
  //begin
  //  rxqryInv.InsertRecord([qryInvCODIGO.Value,qryInvCODIGO_TEXTO.Value,
  //  qryInvDESCRIPCION.Value, qryInvPRECIO_COMPRA.Value, qryInvREFERENCIA.Value,
  //  qryInvPAGA_ITBI.Value]);
  //  qryInv.Next;
  //end;
  //rxqryInv.SortOnFields('descripcion', true, false);
end;

procedure TdmDatos.qryDatosOrdenImpAfterScroll(DataSet: TDataSet);
begin
  qryDatosOrdenImpDet.Close;
  qryDatosOrdenImpDet.Params[0].Value:=qryDatosOrdenImpNUMERO.Value;
  qryDatosOrdenImpDet.Open;
end;

procedure TdmDatos.qryDatosSolOrdenImpAfterScroll(DataSet: TDataSet);
begin
  qryDatosSolOrdenImpDet.Close;
  qryDatosSolOrdenImpDet.Params[0].Value:=qryDatosSolOrdenImpNUMERO.Value;
  qryDatosSolOrdenImpDet.Open;
end;

procedure TdmDatos.tblPolizaMasterAfterScroll(DataSet: TDataSet);
begin
  tblPolizaDet.Close;
  tblPolizaDet.Params[0].Value:= tblPolizaMasterNUMERO.Value;
  tblPolizaDet.Open;
end;

procedure TdmDatos.qryRepPolizaAfterScroll(DataSet: TDataSet);
begin
  qryRepPolizaDet.Close;
  qryRepPolizaDet.params[0].value:= qryRepPolizanumero.Value;
  qryRepPolizaDet.Open;
end;

procedure TdmDatos.qryViewOrdenCompMastAfterScroll(DataSet: TDataSet);
begin
  qryViewOrdenCompDet.Close;
  qryViewOrdenCompDet.Params[0].Value := qryViewOrdenCompMastNUMERO.Value;
  qryViewOrdenCompDet.Open;
end;

procedure TdmDatos.qryOrdenMasterAfterScroll(DataSet: TDataSet);
begin
  dmdatos.qryOrdenDet.Close;
  dmdatos.qryOrdenDet.Params[0].Value := qryOrdenMasterNUMERO.Value;
  dmdatos.qryOrdenDet.Open;
end;

procedure TdmDatos.tblLineaDescDocFAfterScroll(DataSet: TDataSet);
begin
{  tblLineaDescDocFDet.Close;
  tblLineaDescDocFDet.params[0].Value:= tblLineaDescDocFIDLINEA.Value;
  tblLineaDescDocFDet.Open;}
end;

procedure TdmDatos.tblConfComEmpFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (codCatSel > 0) then
  Accept:= DataSet['IDCATEGORIA'] = codCatSel;
end;

procedure TdmDatos.QryProyRegaliaCalcFields(DataSet: TDataSet);
var
  MesProy : Real;
begin
  QryProyRegaliaTOTALACUM.Value:=0;
  if dmdatos.mesesProy > 0 then
  MesProy := dmdatos.MesesProy
  else MesProy := 12 - StrToInt(FormatDateTime('mm',GlbFechaFinal));
  if qryProyRegaliaStatus_emp.Value = 'A' then
  QryProyRegaliaSALARIOPROY.Value:=QryProyRegaliaSALARIOMENSUAL.Value * MesProy
  else QryProyRegaliaSALARIOPROY.Value:=0; 
  QryProyRegaliaTOTALACUM.Value := QryProyRegaliaSALARIOACUMULADO.Value +
  QryProyRegaliaSALARIOPROY.Value;
  if (QryProyRegaliaSTATUS_REGALIA.Value = 'A') or (qryProyRegaliaStatus_emp.Value = 'A') then
  QryProyRegaliaREG_PROY.Value := QryProyRegaliaTOTALACUM.Value / 12;

  if dmdatos.qryRegAdicional.Locate('CODIGO_CIA;CODIGO_EMP',
     VarArrayOf([QryProyRegaliaCIA_KEY.value,QryProyRegaliaCODIGO.Value]),[]) then
  begin
    QryProyRegaliaREG_PROY.Value:=QryProyRegaliaREG_PROY.Value + qryRegAdicionalMONTO.Value/12;
    QryProyRegaliaTOTALACUM.Value := QryProyRegaliaTOTALACUM.Value + (qryRegAdicionalMONTO.Value);
  end;
end;

procedure TdmDatos.qryOrdenEmpCalcFields(DataSet: TDataSet);
begin
  qryOrdenEmpNombreCompleto.Value := TrimRight(qryOrdenEmpNOMB_EMPLEADO.Value) +
  ' '+TrimRight(qryOrdenEmpAPELLIDO.Value);
end;

procedure TdmDatos.qryOrdenEmpBeforeOpen(DataSet: TDataSet);
begin
  tProveedores.close;
  tProveedores.Open;
  tTipoOrdenEmpCoop.Close;
  tTipoOrdenEmpCoop.Open;
end;

procedure TdmDatos.QryProyRegaliaFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  VStatusFiltro: string;
  VStatusEmp: string;
begin
  Accept := True;

  VStatusFiltro := UpperCase(Trim(statusEmpReg));

  if VStatusFiltro = '' then
    Exit;

  VStatusEmp := '';

  if DataSet.FindField('STATUS_EMP') <> nil then
    VStatusEmp := UpperCase(Trim(DataSet.FieldByName('STATUS_EMP').AsString));

  if VStatusFiltro = 'I' then
    Accept := (VStatusEmp = 'I') or (VStatusEmp = 'D')
  else
    Accept := (VStatusEmp = VStatusFiltro);
end;

procedure TdmDatos.qryRepIR13CalcFields(DataSet: TDataSet);
var
  TotalGanado, DeducibleAfp:Real;
begin
  if tblEmpleados.Locate('CODIGO_CIA;CODIGO',VarArrayOf([glbCia_Key,qryRepIR13CODIGO.Value]),[]) then
  qryRepIR13SalarioProy.Value :=tblEmpleadosSALARIO.Value * GlbCantMesProy
  else
  qryRepIR13SalarioProy.Value:=0;
  //else
  //MessageDlg('Codigo empleado no encontrado, Verifique',mtError,[mbOk],0);
  qryRepIR13MONTO_REGALIA.Value :=
         (qryRepIR13SalarioProy.Value   +
          qryRepIR13SALARIO_BRUTO.Value +
          qryRepIR13OTROS_INGRESOS.Value) / 12;
  if dmdatos.qryRegAdicional.Locate('Codigo_Emp',qryRepIR13CODIGO.Value,[]) then
  qryRepIR13MONTO_REGALIA.Value:=qryRepIR13MONTO_REGALIA.Value +
  qryRegAdicionalMONTO.Value/12;
  if QryVaca.Locate('CODIGO',qryRepIR13CODIGO.Value,[]) then
  qryRepIR13MONTO_VAC.Value := QryVacaVALOR_TRANS.Value
  else qryRepIR13MONTO_VAC.Value := 0;
  TotalGanado:= qryRepIR13SALARIO_BRUTO.Value +
                qryRepIR13SalarioProy.Value +
                qryRepIR13OTROS_INGRESOS.Value +
                qryRepIR13MONTO_VAC.Value;
  if qryBoni.Locate('CODIGO',qryRepIR13CODIGO.Value,[]) then
  begin
    TotalGanado:=TotalGanado + qryBoniMONTO_BONIFIACION.Value;
    qryRepIR13MontoBoni.Value := qryBoniMONTO_BONIFIACION.Value;
  end;
  qryTotalNom.Close; //preguntar si las vacaciones van completas
  qryTotalNom.Params[0].Value:= GlbFechaInicial;
  qryTotalNom.Params[1].Value:= EncodeDate(2003,5,31);//fecha en que inició AFP
  qryTotalNom.Params[2].Value:= qryRepIR13CODIGO.Value;
  qryTotalNom.Params[3].Value:= qryRepIR13CODIGO.Value;
  qryTotalNom.Open;
  DeducibleAfp:=TotalGanado - qryTotalNomSBRUTO.Value;
  qryRepIR13SalarioExcAfp.Value:= (DeducibleAfp * qryLey8701PORC_EMPLEADO.Value/100);
  TotalGanado :=TotalGanado  - qryRepIR13SalarioExcAfp.Value;
               //(DeducibleAfp * qryLey8701PORC_EMPLEADO.Value/100);
  qryRepIR13ISR_CALCULADO.Value := MontoIsrADeducir(TotalGanado);
  if qryBoni.RecordCount > 0 then
  if (qryRepIR13ISR_CALCULADO.Value > qryRepIR13ISR_RETENIDO.Value) then
  begin
    qryBoni.Edit;
    qryBoniISR.Value:= qryRepIR13ISR_CALCULADO.Value - qryRepIR13ISR_RETENIDO.Value;
    qryBoni.Post;
  end;
end;


procedure TdmDatos.DataModuleDestroy(Sender: TObject);
begin
  QryProyRegalia.close;
  qryOrdenEmp.close;
  qryDatosBoni.close;
  qryRepOrdCFirm.close;
  qryRepIR13.Close;
  qryTotalNom.close;
end;

End.

