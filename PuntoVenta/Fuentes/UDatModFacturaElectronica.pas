unit UDatModFacturaElectronica;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmFactElectronica = class(TDataModule)
    tblEndPointseCF: TIBDataSet;
    tblEndPointseCFID: TIntegerField;
    tblEndPointseCFENV: TSmallintField;
    tblEndPointseCFNAME: TIBStringField;
    tblEndPointseCFURL: TIBStringField;
    tblEndPointseCFHTTP_METHOD: TIBStringField;
    tblEndPointseCFDESCRIPTION: TIBStringField;
    tblEndPointseCFCREATED_AT: TDateTimeField;
    tblEndPointseCFUPDATED_AT: TDateTimeField;
    tblECF_TIMBRE_LOG: TIBDataSet;
    tblECF_TIMBRE_LOGID: TIntegerField;
    tblECF_TIMBRE_LOGTRN: TIntegerField;
    tblECF_TIMBRE_LOGENCF: TIBStringField;
    tblECF_TIMBRE_LOGCODIGO_SEGURIDAD: TIBStringField;
    tblECF_TIMBRE_LOGFECHA_EMISION: TDateTimeField;
    tblECF_TIMBRE_LOGMONTO_TOTAL: TFloatField;
    tblECF_TIMBRE_LOGURL_IMAGE: TIBStringField;
    tblECF_TIMBRE_LOGRAW_RETURN: TMemoField;
    tblECF_TIMBRE_LOGFECHA_CREACION: TDateTimeField;
    qryEcfAconciliar: TIBQuery;
    qryEcfAconciliarNUMERO: TIntegerField;
    qryEcfAconciliarFECHA: TDateTimeField;
    qryEcfAconciliarNUMERO_NCF: TIBStringField;
    qryListaEcfAVerificar: TIBQuery;
    qryListaEcfAVerificarNUMERO: TIntegerField;
    qryListaEcfAVerificarSERIE_ECF_ASIGNADO: TIntegerField;
    qryListaEcfAVerificarNUMERO_NCF: TIBStringField;
    qryListaEcfAVerificarNCF_ANTERIOR: TIBStringField;
    qryListaEcfAVerificarDGII_STATUS: TIBStringField;
    qryListaEcfAVerificarFECHA: TDateTimeField;
    tblCambiarNCF: TIBDataSet;
    tblCambiarNCFSERIE: TIntegerField;
    tblCambiarNCFTIPO_NCF: TIBStringField;
    tblCambiarNCFNUMERO_NCF: TIBStringField;
    tblCambiarNCFFECHA: TDateTimeField;
    tblCambiarNCFCODIGO_CTE: TIntegerField;
    tblCambiarNCFNOMBRE_COMPLETO: TIBStringField;
    tblCambiarNCFCEDULA: TIBStringField;
    tblCambiarNCFDIRECCION: TIBStringField;
    tblCambiarNCFCIUDAD: TIBStringField;
    tblCambiarNCFMONTO: TFloatField;
    tblCambiarNCFSTATUS: TIBStringField;
    tblCambiarNCFCODIGO_USUARIO: TIntegerField;
    tblCambiarNCFFECHA_INSERT: TDateTimeField;
    tblCambiarNCFFECHA_UPDATE: TDateTimeField;
    tblCambiarNCFCODIGO_USUARIO_UPD: TIntegerField;
    tblCambiarNCFECF: TIBStringField;
    tblCambiarNCFNUMERO_NCF_REFERENCIA: TIBStringField;
    tblCambiarNCFDGII_STATUS: TIBStringField;
    tblCambiarNCFTRACK_ID: TIBStringField;
    tblCambiarNCFLAST_ERROR: TMemoField;
    tblCambiarNCFFECHA_INTENTO: TDateTimeField;
    tblCambiarNCFFECHA_ESTADO: TDateTimeField;
    tblCambiarNCFREINTENTOS: TIntegerField;
    tblCambiarNCFNCF_ANTERIOR: TIBStringField;
    tblCambiarNCFBLOQUEADO: TSmallintField;
    tblCambiarNCFHASH_FACTURA: TIBStringField;
    qrySecEcf: TIBQuery;
    qrySecEcfECFNUM: TFloatField;
    tblUpdateNCF: TIBDataSet;
    tblUpdateNCFSERIE: TIBStringField;
    tblUpdateNCFNCF: TFloatField;
    qryAsignarECFASerieB: TIBQuery;
    qryAsignarECFASerieBSERIE: TIntegerField;
    qryAsignarECFASerieBTIPO_NCF: TIBStringField;
    qryAsignarECFASerieBNUMERO_NCF: TIBStringField;
    qryAsignarECFASerieBNCF_ANTERIOR: TIBStringField;
    qryAsignarECFASerieBFECHA_UPDATE: TDateTimeField;
    qryAsignarECFASerieBNUMERO: TIntegerField;
    qryAsignarECFASerieBVALOR_TOTAL_DET: TFloatField;
    qryEcfAconciliarSERIE_ECF_ASIGNADO: TIntegerField;
    qryEcfAconciliarQRXML: TIBQuery;
    qryEcfAconciliarQRXMLNUMERO: TIntegerField;
    qryEcfAconciliarQRXMLFECHA: TDateTimeField;
    qryEcfAconciliarQRXMLNUMERO_NCF: TIBStringField;
    qryEcfAconciliarQRXMLSERIE_ECF_ASIGNADO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFactElectronica: TdmFactElectronica;

implementation
   uses UGlobal, UDatModConectar;
{$R *.dfm}

end.
