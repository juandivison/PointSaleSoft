unit UDatModClientes;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBStoredProc,
  Dialogs, IBSQL;

type
  TdmClientes = class(TDataModule)
    dstblClientes: TDataSource;
    tblTipoCliente: TIBTable;
    tblMoneda: TIBTable;
    dstblTipoNCF: TDataSource;
    tblTipoNCF: TIBTable;
    tblTipoNCFTIPO_CF: TIBStringField;
    tblTipoNCFDESCRIPCION: TIBStringField;
    tblCondicionVenta: TIBTable;
    tblCondicionVentaCODIGO: TSmallintField;
    tblCondicionVentaDESCRIPCION: TIBStringField;
    tblTipoPrecio: TIBTable;
    tblTipoPrecioPRECIO_ID: TIntegerField;
    tblTipoPrecioDESCRIPCION: TIBStringField;
    dstblTipoPrecio: TDataSource;
    qryCteTiporeferencia: TIBQuery;
    qryCteTiporeferenciaTIPO_REFERENCIA: TIntegerField;
    qryCteTiporeferenciaDESCRIPCION: TIBStringField;
    tblCteTipoReferencia: TIBTable;
    tblCteTipoReferenciaTIPO_REFERENCIA: TIntegerField;
    tblCteTipoReferenciaDESCRIPCION: TIBStringField;
    dstblCteTipoReferencia: TDataSource;
    dsqryCteTiporeferencia: TDataSource;
    tblCteReferenciaDet: TIBDataSet;
    tblCteReferenciaDetSERIE: TIntegerField;
    tblCteReferenciaDetCODIGO_CTE: TIntegerField;
    tblCteReferenciaDetTIPO_REFERENCIA: TIntegerField;
    tblCteReferenciaDetNOMBREEMPRESA: TIBStringField;
    tblCteReferenciaDetCEDULA_RNC: TIBStringField;
    tblCteReferenciaDetPRIMERNOMBRE: TIBStringField;
    tblCteReferenciaDetSEGUNDONOMBRE: TIBStringField;
    tblCteReferenciaDetPRIMERAPELLIDO: TIBStringField;
    tblCteReferenciaDetSEGUNDOAPELLIDO: TIBStringField;
    tblCteReferenciaDetTELEFONO: TIBStringField;
    tblCteReferenciaDetCELULAR: TIBStringField;
    tblCteReferenciaDetTELEFONO_TRABAJO: TIBStringField;
    tblCteReferenciaDetEMAIL: TIBStringField;
    tblCteReferenciaDetCALLE: TIBStringField;
    tblCteReferenciaDetCASANUM: TIBStringField;
    tblCteReferenciaDetAPTONUM: TIBStringField;
    tblCteReferenciaDetSECTOR: TIBStringField;
    tblCteReferenciaDetPROVINCIA: TIBStringField;
    tblCteReferenciaDetCIUDAD: TIBStringField;
    tblCteReferenciaDetPAIS: TIBStringField;
    dstblCteReferenciaDet: TDataSource;
    tblCteReferenciaMaster: TIBDataSet;
    tblCteReferenciaMasterCODIGO_CTE: TIntegerField;
    tblCteReferenciaMasterTIPO_REFERENCIA: TIntegerField;
    tblCteReferenciaMasterRefDescripcion: TStringField;
    dstblCteReferenciaMaster: TDataSource;
    dsqryReferenciacliente: TDataSource;
    qryReferenciacliente: TIBQuery;
    qryReferenciaclienteNOMBRE_CTE: TIBStringField;
    qryReferenciaclienteNOMBRE_FACTURAR: TIBStringField;
    qryReferenciaclienteDESCRIPCION: TIBStringField;
    qryReferenciaclienteNOMBREEMPRESA: TIBStringField;
    qryReferenciaclienteCEDULA_RNC: TIBStringField;
    qryReferenciaclientePRIMERNOMBRE: TIBStringField;
    qryReferenciaclienteSEGUNDONOMBRE: TIBStringField;
    qryReferenciaclientePRIMERAPELLIDO: TIBStringField;
    qryReferenciaclienteSEGUNDOAPELLIDO: TIBStringField;
    qryReferenciaclienteTELEFONO: TIBStringField;
    qryReferenciaclienteCELULAR: TIBStringField;
    qryReferenciaclienteTELEFONO_TRABAJO: TIBStringField;
    qryReferenciaclienteEMAIL: TIBStringField;
    qryReferenciaclienteCALLE: TIBStringField;
    qryReferenciaclienteCASANUM: TIBStringField;
    qryReferenciaclienteAPTONUM: TIBStringField;
    qryReferenciaclienteSECTOR: TIBStringField;
    qryReferenciaclientePROVINCIA: TIBStringField;
    qryReferenciaclienteCIUDAD: TIBStringField;
    qryReferenciaclientePAIS: TIBStringField;
    qryReferenciaclienteCODIGO_CTE: TIntegerField;
    qryTipoContacto: TIBQuery;
    qryTipoContactoTIPO: TIntegerField;
    qryTipoContactoDESCRIPCION: TIBStringField;
    tblDatosContacto: TIBDataSet;
    tblDatosContactoCODIGO_CTE: TIntegerField;
    tblDatosContactoTIPO: TSmallintField;
    tblDatosContactoNOMBRE: TIBStringField;
    tblDatosContactoDIRECCION: TIBStringField;
    tblDatosContactoTELEFONO: TIBStringField;
    tblDatosContactoCELULAR: TIBStringField;
    tblDatosContactoLUGAR_DE_TRABAJO: TIBStringField;
    tblDatosContactoNOMBREJEFEINMEDIATO: TIBStringField;
    tblDatosContactoRANGO: TIBStringField;
    tblDatosContactoSUPERIOR: TIBStringField;
    dsqryTipoContacto: TDataSource;
    qryTipoContactoRep: TIBQuery;
    qryDatosContactoRep: TIBQuery;
    qryTipoContactoRepTIPO: TIntegerField;
    qryTipoContactoRepDESCRIPCION: TIBStringField;
    tblDatosContactoCEDULA: TIBStringField;
    tblDatosVehiculo: TIBDataSet;
    tblDatosVehiculoNUMERO: TIntegerField;
    tblDatosVehiculoCODIGO_CTE: TIntegerField;
    tblDatosVehiculoPLACA: TIBStringField;
    tblDatosVehiculoIDMARCA: TIntegerField;
    tblDatosVehiculoMODELO: TIBStringField;
    tblDatosVehiculoANO_VEH: TIntegerField;
    tblDatosVehiculoFECHA_VENCE_SEGURO: TDateTimeField;
    tblDatosVehiculoTIPO_SEGURO: TSmallintField;
    tblDatosVehiculoCIA_SEGURO: TIBStringField;
    tblDatosVehiculoEMPRESA_LABORA: TIBStringField;
    tblDatosVehiculoFECHA_IN: TDateTimeField;
    tblDatosVehiculoIN_POR: TIBStringField;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesCIA_KEY: TIntegerField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesINSERTADO_POR: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesMODI_POR: TIBStringField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesEMAIL: TIBStringField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCEDULA: TIBStringField;
    qryClientesRNC: TIBStringField;
    qryClientesREFERENCIA: TIBStringField;
    qryClientesTELEF_REFERENCIA: TIBStringField;
    qryClientesOTRO_TELEFONO: TIBStringField;
    qryClientesCANT_DIAS_CREDITO: TSmallintField;
    qryClientesTIPO_NCF: TIBStringField;
    qryClientesOBSERVACION: TMemoField;
    qryClientesLUGAR_DE_TRABAJO: TIBStringField;
    qryClientesAPODO: TIBStringField;
    qryClientesCODIGO_USUARIO: TIntegerField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryClientesCOMENTARIO: TMemoField;
    qryClientesCONDICION: TIntegerField;
    qryClientesPRECIO_ID: TIntegerField;
    qryClientesTIPO_CF: TIBStringField;
    qryClientesMOVIL1: TIBStringField;
    qryClientesMOVIL2: TIBStringField;
    qryClientesCODIGO_TEXTO: TIBStringField;
    qryClientesUSARLEVELPRECIO: TSmallintField;
    qryClientesCOD_VENDEDOR: TIntegerField;
    qryCteExp: TIBQuery;
    qryCteExpCODIGO_CTE: TIntegerField;
    qryCteExpRNC_NUMERO: TIBStringField;
    qryCteExpNOMBRE_CTE: TIBStringField;
    qryCteExpNOMBRE_FACTURAR: TIBStringField;
    qryCteExpCONTACTO: TIBStringField;
    qryCteExpDIRECCION_CONT: TIBStringField;
    qryCteExpTELEF_CONTACTO: TIBStringField;
    qryCteExpFAX_CONTACTO: TIBStringField;
    qryCteExpSTATUS_CLIENTE: TIBStringField;
    qryCteExpLIMITE_CREDITO: TFloatField;
    qryCteExpEMAIL: TIBStringField;
    qryCteExpPAIS: TIBStringField;
    qryCteExpCIUDAD: TIBStringField;
    qryCteExpOTRO_TELEFONO: TIBStringField;
    qryCteExpCANT_DIAS_CREDITO: TSmallintField;
    qryCteExpOBSERVACION: TMemoField;
    qryClientesRUTA_FOTO: TIBStringField;
    qryClientesFECHA_NACIMIENTO: TDateTimeField;
    qryClientesCODZONA: TIntegerField;
    tblRutaVta: TIBTable;
    tblRutaVtaCODIGO: TIntegerField;
    tblRutaVtaDESCRIPCION: TIBStringField;
    tblRutaVtaFECHA: TDateTimeField;
    tblRutaVtaSTATUS: TIBStringField;
    tblRutaVtaTIPO_COMISION: TIntegerField;
    tblRutaVtaMONTO_COMISION: TFloatField;
    dstblRutaVta: TDataSource;
    tblCiudades: TIBTable;
    tblCiudadesCODIGO: TIntegerField;
    tblCiudadesDESCRIPCION: TIBStringField;
    tblCiudadesVALOR: TFloatField;
    tblCiudadesSTATUS: TIBStringField;
    dstblCiudades: TDataSource;
    tblSectores: TIBTable;
    tblSectoresCODIGO: TIntegerField;
    tblSectoresDESCRIPCION: TIBStringField;
    dsTblSectores: TDataSource;
    qryRuta: TIBQuery;
    qryRutaCODIGO: TIntegerField;
    qryRutaDESCRIPCION: TIBStringField;
    qryRutaFECHA: TDateTimeField;
    qryRutaSTATUS: TIBStringField;
    qryRutaTIPO_COMISION: TIntegerField;
    qryRutaMONTO_COMISION: TFloatField;
    tblSectoresCOD_CIUDAD: TIntegerField;
    qrySectores: TIBQuery;
    qryCteFacturas: TIBQuery;
    qryCteFacturasSERIE: TFloatField;
    qryCteFacturasNUMERO: TFloatField;
    qryCteFacturasCIA_KEY: TIntegerField;
    qryCteFacturasMONEDA: TIBStringField;
    qryCteFacturasTIPO: TSmallintField;
    qryCteFacturasCODIGO_CTE: TIntegerField;
    qryCteFacturasFECHA: TDateTimeField;
    qryCteFacturasDESCRIPCION: TIBStringField;
    qryCteFacturasMONTO_FACT: TFloatField;
    qryCteFacturasSTATUS: TIBStringField;
    qryCteFacturasFECHA_VENCE: TDateTimeField;
    tblTipoClienteCODIGO: TSmallintField;
    tblTipoClienteCODIGO_ABR: TIBStringField;
    tblTipoClienteDESCRIPCION: TIBStringField;
    qryRepCertificadoSam: TIBQuery;
    tblDatosVehiculoCODIGO_DEALER: TIntegerField;
    tblDatosVehiculoCODIGO_AGENCIA: TIntegerField;
    tblDatosVehiculoCOLOR: TIBStringField;
    tblDatosVehiculoNUM_CERTIFICADO: TIntegerField;
    tblDatosVehiculoCHASSIS: TIBStringField;
    qryDearler: TIBQuery;
    qryAgencia: TIBQuery;
    qryRepCertificadoSamCODIGO_CTE: TIntegerField;
    qryRepCertificadoSamCIA_KEY: TIntegerField;
    qryRepCertificadoSamTIPO_CLIENTE: TSmallintField;
    qryRepCertificadoSamFOTO: TBlobField;
    qryRepCertificadoSamNOMBRE_CTE: TIBStringField;
    qryRepCertificadoSamNOMBRE_ABREV: TIBStringField;
    qryRepCertificadoSamMONEDA_FACT: TIBStringField;
    qryRepCertificadoSamNOMBRE_FACTURAR: TIBStringField;
    qryRepCertificadoSamCONTACTO: TIBStringField;
    qryRepCertificadoSamDIRECCION_CONT: TIBStringField;
    qryRepCertificadoSamTELEF_CONTACTO: TIBStringField;
    qryRepCertificadoSamFAX_CONTACTO: TIBStringField;
    qryRepCertificadoSamFORMA_PAGO: TSmallintField;
    qryRepCertificadoSamCODIGO_AGENCIA: TSmallintField;
    qryRepCertificadoSamSTATUS_CLIENTE: TIBStringField;
    qryRepCertificadoSamINSERTADO_POR: TIBStringField;
    qryRepCertificadoSamFECHA_INSERTADO: TDateTimeField;
    qryRepCertificadoSamFECHA_MOD: TDateTimeField;
    qryRepCertificadoSamMODI_POR: TIBStringField;
    qryRepCertificadoSamLIMITE_CREDITO: TFloatField;
    qryRepCertificadoSamEMAIL: TIBStringField;
    qryRepCertificadoSamWEBSITE: TIBStringField;
    qryRepCertificadoSamPAIS: TIBStringField;
    qryRepCertificadoSamCIUDAD: TIBStringField;
    qryRepCertificadoSamCEDULA: TIBStringField;
    qryRepCertificadoSamRNC: TIBStringField;
    qryRepCertificadoSamREFERENCIA: TIBStringField;
    qryRepCertificadoSamTELEF_REFERENCIA: TIBStringField;
    qryRepCertificadoSamOTRO_TELEFONO: TIBStringField;
    qryRepCertificadoSamCANT_DIAS_CREDITO: TSmallintField;
    qryRepCertificadoSamTIPO_NCF: TIBStringField;
    qryRepCertificadoSamOBSERVACION: TMemoField;
    qryRepCertificadoSamLUGAR_DE_TRABAJO: TIBStringField;
    qryRepCertificadoSamAPODO: TIBStringField;
    qryRepCertificadoSamCODIGO_USUARIO: TIntegerField;
    qryRepCertificadoSamRNC_NUMERO: TIBStringField;
    qryRepCertificadoSamCOMENTARIO: TMemoField;
    qryRepCertificadoSamCONDICION: TIntegerField;
    qryRepCertificadoSamPRECIO_ID: TIntegerField;
    qryRepCertificadoSamRUTA_FOTO: TIBStringField;
    qryRepCertificadoSamTIPO_CF: TIBStringField;
    qryRepCertificadoSamMOVIL1: TIBStringField;
    qryRepCertificadoSamMOVIL2: TIBStringField;
    qryRepCertificadoSamCODIGO_TEXTO: TIBStringField;
    qryRepCertificadoSamUSARLEVELPRECIO: TSmallintField;
    qryRepCertificadoSamCOD_VENDEDOR: TIntegerField;
    qryRepCertificadoSamFECHA_NACIMIENTO: TDateTimeField;
    qryRepCertificadoSamCODZONA: TIntegerField;
    qryRepCertificadoSamRUTA: TIntegerField;
    qryRepCertificadoSamCOD_CIUDAD: TIntegerField;
    qryRepCertificadoSamDIA_RUTA: TIBStringField;
    qryRepCertificadoSamCALLE: TIBStringField;
    qryRepCertificadoSamMANZANA: TIBStringField;
    qryRepCertificadoSamEDIFICIO: TIBStringField;
    qryRepCertificadoSamNSS: TIBStringField;
    qryRepCertificadoSamCHASSIS: TIBStringField;
    qryRepCertificadoSamMARCA: TIBStringField;
    qryRepCertificadoSamAGENCIA: TIBStringField;
    qryRepCertificadoSamDEALER: TIBStringField;
    qryRepCertificadoSamCOLOR: TIBStringField;
    qryRepCertificadoSamMODELO: TIBStringField;
    qryRepCertificadoSamPLACA: TIBStringField;
    qryRepCertificadoSamANO_VEH: TIntegerField;
    qryRepCertificadoSamFECHAINICIAL: TDateTimeField;
    qryRepCertificadoSamFECHAFIN: TDateTimeField;
    qryRepCertificadoSamNUM_CERTIFICADO: TIntegerField;
    qryRepCertificadoSamCODIGO_DEALER: TIntegerField;
    qryRepCertificadoSamNUMPOLIZA_CERT: TIntegerField;
    tblDatosVehiculoNUMPOL: TIntegerField;
    qryRepCertificadoSamSERIALMOTOR: TIBStringField;
    qryRepCertificadoSamCLASE: TIBStringField;
    qryRepCumpleanioCte: TIBQuery;
    qryRepCumpleanioCteCODIGO: TIntegerField;
    qryRepCumpleanioCteFECHA_NACIMIENTO: TDateTimeField;
    qryRepCumpleanioCteNOMBRECLIENTE: TIBStringField;
    qryRepCumpleanioCteDIRECCION_CONT: TIBStringField;
    qryRepCumpleanioCteEMAIL: TIBStringField;
    qryRepCumpleanioCteTELEF_CONTACTO: TIBStringField;
    tblDatosVehiculoSTATUSCXC: TIBStringField;
    qryTipoAfiliado: TIBQuery;
    qryTipoAfiliadoIDTIPO: TIntegerField;
    qryTipoAfiliadoDESCRIPCION: TIBStringField;
    qryTipoAfiliadoMONTOCOBERTURA: TFloatField;
    qryTipoAfiliadoDIASDECARENCIA: TIntegerField;
    qryTipoAfiliadoYEARANTIGUEDAD: TIntegerField;
    qryTipoAfiliadoSTATUS: TIBStringField;
    dsqryTipoAfiliado: TDataSource;
    tblDatosVehiculoTIPO_AFILIADO: TSmallintField;
    tblDatosVehiculoPOLIZA_ESPECIAL: TSmallintField;
    tblDatosVehiculoRUTA_FILEAUTH: TIBStringField;
    qryRepCertificadoSamPOLIZA_ESPECIAL: TSmallintField;
    qryPlanesWisPro: TIBQuery;
    qryPlanesWisProID: TIBStringField;
    qryPlanesWisProDESCRIPCION: TIBStringField;
    dsqryPlanesWisPro: TDataSource;
    stpProcInsertClientWP: TIBStoredProc;
    tblContractWisPro: TIBDataSet;
    tblContractWisProID: TIBStringField;
    tblContractWisProPUBLICID: TIBStringField;
    tblContractWisProPLANID: TIBStringField;
    tblContractWisProCLIENTID: TIBStringField;
    tblContractWisProSERVERCONFIGURATIONID: TIBStringField;
    tblContractWisProSTATE: TIBStringField;
    tblContractWisProIP: TIBStringField;
    tblContractWisProNETMASK: TIBStringField;
    tblContractWisProMACADDRESS: TIBStringField;
    tblContractWisProLATITUDE: TFloatField;
    tblContractWisProLONGITUDE: TFloatField;
    tblContractWisProCOVERAGEID: TIBStringField;
    tblContractWisProCREATEDAT: TDateTimeField;
    tblContractWisProUPDATEDAT: TDateTimeField;
    tblContractWisProNOMBRECLIENTE: TIBStringField;
    tblClientwisPro: TIBDataSet;
    tblClientwisProCODIGO_CTE: TIntegerField;
    tblClientwisProID: TIBStringField;
    tblClientwisProNOMBRECLIENTE: TIBStringField;
    tblContractWisProCODIGO_CTE: TIntegerField;
    tblContractWisProDETAILS: TIBStringField;
    qryClientWisPro: TIBQuery;
    qryClientWisProCODIGO_CTE: TIntegerField;
    qryClientWisProID: TIBStringField;
    qryClientWisProNOMBRECLIENTE: TIBStringField;
    tblDatosVehiculoFECHA_APERTURA: TDateTimeField;
    ibsqlDupCliente: TIBSQL;
    tblClientesDelivery: TIBDataSet;
    tblClientesDeliveryCODIGO: TIntegerField;
    tblClientesDeliveryNOMBRE: TIBStringField;
    tblClientesDeliveryTELEFONO: TIBStringField;
    tblClientesDeliveryDIRECCION: TIBStringField;
    tblClientesDeliveryFECHA_IN: TDateTimeField;
    tblClientesDeliveryINSERT_POR: TIBStringField;
    dstblClientesDelivery: TDataSource;
    qryRepCertificadoSamCANALDISTRIBUCION: TIBStringField;
    qryRepCertificadoSamKILOMETRAJE: TIBStringField;
    tblGarantiaMovil: TIBDataSet;
    tblGarantiaMovilSERIE_ID: TIntegerField;
    tblGarantiaMovilTIPO_AFILIACION: TIntegerField;
    tblGarantiaMovilFECHA: TDateTimeField;
    tblGarantiaMovilCODIGO_CLIENTE: TIntegerField;
    tblGarantiaMovilCODIGO_DEALER: TIntegerField;
    tblGarantiaMovilGARANTIANUM: TIBStringField;
    tblGarantiaMovilNOMBRES: TIBStringField;
    tblGarantiaMovilAPELLIDOS: TIBStringField;
    tblGarantiaMovilCEDULA_PASSPORT: TIBStringField;
    tblGarantiaMovilEMAIL: TIBStringField;
    tblGarantiaMovilTELEFONO: TIBStringField;
    tblGarantiaMovilMOVIL: TIBStringField;
    tblGarantiaMovilDIRECCION: TIBStringField;
    tblGarantiaMovilPAIS: TIBStringField;
    tblGarantiaMovilPROVINCIA: TIBStringField;
    tblGarantiaMovilMARCA: TIBStringField;
    tblGarantiaMovilMODELO: TIBStringField;
    tblGarantiaMovilNO_SERIEEMAI: TIBStringField;
    tblGarantiaMovilFECHADEVENTA: TDateTimeField;
    tblGarantiaMovilPRECIOVENTA: TFloatField;
    tblGarantiaMovilDESCRIPCIONDELPRODUCTO: TMemoField;
    tblGarantiaMovilTIEMPOGVENDEDOR: TIntegerField;
    tblGarantiaMovilFECHAINICIO: TDateTimeField;
    tblGarantiaMovilFECHAVENCE: TDateTimeField;
    tblGarantiaMovilVALORDELARTICULO: TFloatField;
    tblGarantiaMovilMONTOAPAGARPORMES: TFloatField;
    tblGarantiaMovilMONTOTOTALAPAGAR: TFloatField;
    tblGarantiaMovilPOLIZA_ESPECIAL: TSmallintField;
    tblGarantiaMovilSTATUSCXC: TIBStringField;
    tblGarantiaMovilSTATUS: TIBStringField;
    qryProc_DatosRepHistRenovPol: TIBQuery;
    qryProcDatosRepHistRenoGarantia: TIBQuery;
    qryRepCertificadoSamG: TIBQuery;
    qryRepCertificadoSamGCODIGO_CTE: TIntegerField;
    qryRepCertificadoSamGCIA_KEY: TIntegerField;
    qryRepCertificadoSamGTIPO_CLIENTE: TSmallintField;
    qryRepCertificadoSamGFOTO: TBlobField;
    qryRepCertificadoSamGNOMBRE_CTE: TIBStringField;
    qryRepCertificadoSamGNOMBRE_ABREV: TIBStringField;
    qryRepCertificadoSamGMONEDA_FACT: TIBStringField;
    qryRepCertificadoSamGNOMBRE_FACTURAR: TIBStringField;
    qryRepCertificadoSamGCONTACTO: TIBStringField;
    qryRepCertificadoSamGDIRECCION_CONT: TIBStringField;
    qryRepCertificadoSamGTELEF_CONTACTO: TIBStringField;
    qryRepCertificadoSamGFAX_CONTACTO: TIBStringField;
    qryRepCertificadoSamGFORMA_PAGO: TSmallintField;
    qryRepCertificadoSamGCODIGO_AGENCIA: TSmallintField;
    qryRepCertificadoSamGSTATUS_CLIENTE: TIBStringField;
    qryRepCertificadoSamGINSERTADO_POR: TIBStringField;
    qryRepCertificadoSamGFECHA_INSERTADO: TDateTimeField;
    qryRepCertificadoSamGFECHA_MOD: TDateTimeField;
    qryRepCertificadoSamGMODI_POR: TIBStringField;
    qryRepCertificadoSamGLIMITE_CREDITO: TFloatField;
    qryRepCertificadoSamGEMAIL: TIBStringField;
    qryRepCertificadoSamGWEBSITE: TIBStringField;
    qryRepCertificadoSamGPAIS: TIBStringField;
    qryRepCertificadoSamGCIUDAD: TIBStringField;
    qryRepCertificadoSamGCEDULA: TIBStringField;
    qryRepCertificadoSamGRNC: TIBStringField;
    qryRepCertificadoSamGREFERENCIA: TIBStringField;
    qryRepCertificadoSamGTELEF_REFERENCIA: TIBStringField;
    qryRepCertificadoSamGOTRO_TELEFONO: TIBStringField;
    qryRepCertificadoSamGCANT_DIAS_CREDITO: TSmallintField;
    qryRepCertificadoSamGTIPO_NCF: TIBStringField;
    qryRepCertificadoSamGOBSERVACION: TMemoField;
    qryRepCertificadoSamGLUGAR_DE_TRABAJO: TIBStringField;
    qryRepCertificadoSamGAPODO: TIBStringField;
    qryRepCertificadoSamGCODIGO_USUARIO: TIntegerField;
    qryRepCertificadoSamGRNC_NUMERO: TIBStringField;
    qryRepCertificadoSamGCOMENTARIO: TMemoField;
    qryRepCertificadoSamGCONDICION: TIntegerField;
    qryRepCertificadoSamGPRECIO_ID: TIntegerField;
    qryRepCertificadoSamGRUTA_FOTO: TIBStringField;
    qryRepCertificadoSamGTIPO_CF: TIBStringField;
    qryRepCertificadoSamGMOVIL1: TIBStringField;
    qryRepCertificadoSamGMOVIL2: TIBStringField;
    qryRepCertificadoSamGCODIGO_TEXTO: TIBStringField;
    qryRepCertificadoSamGUSARLEVELPRECIO: TSmallintField;
    qryRepCertificadoSamGCOD_VENDEDOR: TIntegerField;
    qryRepCertificadoSamGFECHA_NACIMIENTO: TDateTimeField;
    qryRepCertificadoSamGCODZONA: TIntegerField;
    qryRepCertificadoSamGRUTA: TIntegerField;
    qryRepCertificadoSamGCOD_CIUDAD: TIntegerField;
    qryRepCertificadoSamGDIA_RUTA: TIBStringField;
    qryRepCertificadoSamGCALLE: TIBStringField;
    qryRepCertificadoSamGMANZANA: TIBStringField;
    qryRepCertificadoSamGEDIFICIO: TIBStringField;
    qryRepCertificadoSamGNSS: TIBStringField;
    qryRepCertificadoSamGPLAN_ID: TIBStringField;
    qryRepCertificadoSamGEMAIL_TEMP: TIBStringField;
    qryRepCertificadoSamGCODIGO_CTE_RECL: TIntegerField;
    qryRepCertificadoSamGNO_SERIEEMAI: TIBStringField;
    qryRepCertificadoSamGCODIGO_DEALER: TIntegerField;
    qryRepCertificadoSamGPOLIZA_ESPECIAL: TSmallintField;
    qryRepCertificadoSamGCANALDISTRIBUCION: TIBStringField;
    qryRepCertificadoSamGGARANTIANUM: TIBStringField;
    qryRepCertificadoSamGMODELO: TIBStringField;
    qryRepCertificadoSamGMARCA: TIBStringField;
    qryRepCertificadoSamGFECHAINICIAL: TDateTimeField;
    qryRepCertificadoSamGFECHAFIN: TDateTimeField;
    qryRepCertificadoSamGDESCRIPCIONDELPRODUCTO: TMemoField;
    qryRepCertificadoSamGMONTOAPAGARPORMES: TFloatField;
    qryRepCertificadoSamGMONTOTOTALAPAGAR: TFloatField;
    qryRepCertificadoSamGFECHADEVENTA: TDateTimeField;
    qryRepCertificadoSamGPRECIOVENTA: TFloatField;
    qryRepCertificadoSamGVALORDELARTICULO: TFloatField;
    qryRepCertificadoSamGTIEMPOGVENDEDOR: TIntegerField;
    qryRepCertificadoSamGTELEFONOGARANTIA: TIBStringField;
    qryRepVehiculos: TIBQuery;
    qryRepCertificadoSamNUMERO: TIntegerField;
    qryRepCertificadoSamGTIPO_AFILIACION: TIntegerField;
    qryRepCertificadoSamTIPO_AFILIADO: TSmallintField;
    qryRepCertificadoSamGNOTIFY_EMAIL: TSmallintField;
    qryRepCertificadoSamNOTIFY_EMAIL: TSmallintField;
    tblGarantiaMovilNOTIFY_EMAIL: TSmallintField;
    tblDatosVehiculoNOTIFY_EMAIL: TSmallintField;
    qryCheckNumpolExiste: TIBQuery;
    ibsqlDatosVehEliminado: TIBSQL;
    qryNumPolDup: TIBQuery;
    qryNumPolDupNUMERO: TIntegerField;
    qryNumPolDupCANT: TIntegerField;
    tblDatosVehiculoCON_CARENCIA: TSmallintField;
    qryRepVehiculosNUM_TRNVTA: TIntegerField;
    qryRepVehiculosFECHA_VENTA: TDateTimeField;
    qryRepVehiculosDESCRIPCION_PRODUCTO: TIBStringField;
    qryRepVehiculosPLACA: TIBStringField;
    qryRepVehiculosMARCA: TIBStringField;
    qryRepVehiculosMODELO: TIBStringField;
    qryRepVehiculosCHASSIS: TIBStringField;
    qryRepVehiculosFECHA_INICIO: TDateTimeField;
    qryRepVehiculosCODIGO_CTE: TIntegerField;
    qryRepVehiculosNOMBRECLIENTE: TIBStringField;
    qryRepVehiculosSERIE: TIntegerField;
    qryRepVehiculosNUMERO: TIntegerField;
    qryRepVehiculosFICHA: TIntegerField;
    qryRepVehiculosDESCRIPCION: TIBStringField;
    qryRepVehiculosCODIGO_USUARIO: TIntegerField;
    qryRepVehiculosSTATUS: TIBStringField;
    qryRepVehiculosCOSTO: TFloatField;
    qryRepVehiculosMONTO_VENTA: TFloatField;
    qryRepVehiculosREGISTRO: TIBStringField;
    qryClientesID_PROVINCIA: TIntegerField;
    qryClientesID_MUNICIPIO: TIntegerField;
    tblClientes: TIBDataSet;
    tblClientesCODIGO_CTE: TIntegerField;
    tblClientesCIA_KEY: TIntegerField;
    tblClientesTIPO_CLIENTE: TSmallintField;
    tblClientesFOTO: TBlobField;
    tblClientesNOMBRE_CTE: TIBStringField;
    tblClientesNOMBRE_ABREV: TIBStringField;
    tblClientesMONEDA_FACT: TIBStringField;
    tblClientesNOMBRE_FACTURAR: TIBStringField;
    tblClientesCONTACTO: TIBStringField;
    tblClientesDIRECCION_CONT: TIBStringField;
    tblClientesTELEF_CONTACTO: TIBStringField;
    tblClientesFAX_CONTACTO: TIBStringField;
    tblClientesFORMA_PAGO: TSmallintField;
    tblClientesCODIGO_AGENCIA: TSmallintField;
    tblClientesSTATUS_CLIENTE: TIBStringField;
    tblClientesINSERTADO_POR: TIBStringField;
    tblClientesFECHA_INSERTADO: TDateTimeField;
    tblClientesFECHA_MOD: TDateTimeField;
    tblClientesMODI_POR: TIBStringField;
    tblClientesLIMITE_CREDITO: TFloatField;
    tblClientesEMAIL: TIBStringField;
    tblClientesWEBSITE: TIBStringField;
    tblClientesPAIS: TIBStringField;
    tblClientesCIUDAD: TIBStringField;
    tblClientesCEDULA: TIBStringField;
    tblClientesRNC: TIBStringField;
    tblClientesREFERENCIA: TIBStringField;
    tblClientesTELEF_REFERENCIA: TIBStringField;
    tblClientesOTRO_TELEFONO: TIBStringField;
    tblClientesCANT_DIAS_CREDITO: TSmallintField;
    tblClientesTIPO_NCF: TIBStringField;
    tblClientesOBSERVACION: TMemoField;
    tblClientesLUGAR_DE_TRABAJO: TIBStringField;
    tblClientesAPODO: TIBStringField;
    tblClientesCODIGO_USUARIO: TIntegerField;
    tblClientesRNC_NUMERO: TIBStringField;
    tblClientesCOMENTARIO: TMemoField;
    tblClientesCONDICION: TIntegerField;
    tblClientesPRECIO_ID: TIntegerField;
    tblClientesRUTA_FOTO: TIBStringField;
    tblClientesTIPO_CF: TIBStringField;
    tblClientesMOVIL1: TIBStringField;
    tblClientesMOVIL2: TIBStringField;
    tblClientesCODIGO_TEXTO: TIBStringField;
    tblClientesUSARLEVELPRECIO: TSmallintField;
    tblClientesCOD_VENDEDOR: TIntegerField;
    tblClientesFECHA_NACIMIENTO: TDateTimeField;
    tblClientesCODZONA: TIntegerField;
    tblClientesCOD_CIUDAD: TIntegerField;
    tblClientesRUTA: TIntegerField;
    tblClientesDIA_RUTA: TIBStringField;
    tblClientesCALLE: TIBStringField;
    tblClientesMANZANA: TIBStringField;
    tblClientesEDIFICIO: TIBStringField;
    tblClientesNSS: TIBStringField;
    tblClientesPLAN_ID: TIBStringField;
    tblClientesCODIGO_CTE_RECL: TIntegerField;
    tblClientesPORC_BENEFICIO: TFloatField;
    tblClientesEMAIL_TEMP: TIBStringField;
    tblClientesID_PROVINCIA: TIntegerField;
    tblClientesID_MUNICIPIO: TIntegerField;
    tblClienteTerritorio: TIBDataSet;
    tblClienteTerritorioCODIGO_CTE: TIntegerField;
    tblClienteTerritorioNOMBRE_FACTURAR: TIBStringField;
    tblClienteTerritorioPROVINCIA: TIBStringField;
    tblClienteTerritorioMUNICIPIO: TIBStringField;
    tblClienteTerritorioID_MUNICIPIO: TIntegerField;
    tblClienteTerritorioID_PROVINCIA: TIntegerField;
    qryClientesRNC_CED_ACTIVO: TSmallintField;
    tblClientesSHOWPRECIOCONITBIS: TSmallintField;
    procedure tblCteReferenciaMasterAfterScroll(DataSet: TDataSet);
    procedure qryTipoContactoRepAfterScroll(DataSet: TDataSet);
    procedure tblCiudadesAfterScroll(DataSet: TDataSet);
    procedure qryRepCertificadoSamFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblDatosVehiculoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryRepCertificadoSamGFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryRepVehiculosFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblDatosVehiculoAfterScroll(DataSet: TDataSet);
    procedure tblClientesAfterOpen(DataSet: TDataSet);
    procedure tblClientesAfterScroll(DataSet: TDataSet);
    procedure tblClientesBeforePost(DataSet: TDataSet);
    procedure tblClientesFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _XCodCte : integer;
    _chassis : string;
    _GARANTIANUM : string;
    FiltrarTranspItbis:Boolean;
  end;

var
  dmClientes: TdmClientes;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmClientes.tblCteReferenciaMasterAfterScroll(DataSet: TDataSet);
begin
  tblCteReferenciaDet.Close;
  tblCteReferenciaDet.Params[0].Value:= tblCteReferenciaMasterTIPO_REFERENCIA.Value;
  tblCteReferenciaDet.Params[1].Value:= tblCteReferenciaMasterCODIGO_CTE.Value;
  tblCteReferenciaDet.Open;
end;

procedure TdmClientes.qryTipoContactoRepAfterScroll(DataSet: TDataSet);
begin
  dmClientes.qryDatosContactoRep.Close;
  dmClientes.qryDatosContactoRep.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.qryDatosContactoRep.Params[1].Value:=dmClientes.qryTipoContactoReptipo.Value;
  dmClientes.qryDatosContactoRep.Open;
end;

procedure TdmClientes.tblCiudadesAfterScroll(DataSet: TDataSet);
begin
  qrySectores.Close;
  qrySectores.Params[0].Value:= tblCiudadesCODIGO.Value;
  qrySectores.Open;
end;

procedure TdmClientes.qryRepCertificadoSamFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (_chassis <> '') and (_XCodCte > 0) then
  Accept:= (Dataset['CODIGO_CTE'] = _XCodCte) and
  (Dataset['CHASSIS'] = _chassis)
  else
  if (_chassis <> '') then
  Accept:= (Dataset['CHASSIS'] = _chassis)
  else
  if (_XCodCte > 0) then
  Accept:= Dataset['CODIGO_CTE'] = _XCodCte;
end;

procedure TdmClientes.tblDatosVehiculoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=(DataSet['NUM_CERTIFICADO'] <> '');
end;

procedure TdmClientes.qryRepCertificadoSamGFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (_GARANTIANUM <> '') and (_XCodCte > 0) then
  Accept:= (Dataset['CODIGO_CTE'] = _XCodCte) and
  (Dataset['GARANTIANUM'] = _GARANTIANUM)
  else
  if (_GARANTIANUM <> '') then
  Accept:= Dataset['GARANTIANUM'] = _GARANTIANUM //_chassis)
  else
  if (_XCodCte > 0) then
  Accept:= Dataset['CODIGO_CTE'] = _XCodCte;
end;

procedure TdmClientes.qryRepVehiculosFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if (_chassis <> '') and (_XCodCte > 0) then
  Accept:= (Dataset['CODIGO_CTE'] = _XCodCte) and
  (Dataset['CHASSIS'] = _chassis)
  else
  if (_chassis <> '') then
  Accept:= (Dataset['CHASSIS'] = _chassis)
  else
  if (_XCodCte > 0) then
  Accept:= Dataset['CODIGO_CTE'] = _XCodCte; 
end;

procedure TdmClientes.tblDatosVehiculoAfterScroll(DataSet: TDataSet);
begin
  ibsqlDatosVehEliminado.Close;
  ibsqlDatosVehEliminado.Params[0].Value:=dmClientes.tblDatosVehiculoCODIGO_CTE.Value;
  ibsqlDatosVehEliminado.ExecQuery;
end;

procedure TdmClientes.tblClientesAfterOpen(DataSet: TDataSet);
begin
  if (GLBECOM = 1) then
  tblClientesPLAN_ID.ReadOnly:=False
  else
  tblClientesPLAN_ID.ReadOnly:=True;
end;

procedure TdmClientes.tblClientesAfterScroll(DataSet: TDataSet);
begin
  if (dmClientes.tblClientes.Tag = 0) and (GlbSam = 1) then
  begin
    if dmClientes.tblDatosVehiculo.State in [dsEdit, dsInsert] then exit;
    if dmClientes.tblGarantiaMovil.State in [dsEdit, dsInsert] then exit;
    dmClientes.tblDatosVehiculo.Close;
    dmClientes.tblDatosVehiculo.Params[0].Value:=dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblDatosVehiculo.open;

    dmClientes.tblGarantiaMovil.Close;
    dmClientes.tblGarantiaMovil.params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
    dmClientes.tblGarantiaMovil.open;
  end;
end;

procedure TdmClientes.tblClientesBeforePost(DataSet: TDataSet);
begin
  if not tblClientesID_PROVINCIA.IsNull and tblClientesID_MUNICIPIO.IsNull then
  ShowMessage('Asignar valor a municipio');
end;

procedure TdmClientes.tblClientesFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if FiltrarTranspItbis then
  Accept := DataSet['SHOWPRECIOCONITBIS'] = 1
  else
  Accept := DataSet['COD_VENDEDOR'] <= 0;
end;

procedure TdmClientes.DataModuleCreate(Sender: TObject);
begin
  FiltrarTranspItbis:=False;
end;

end.
