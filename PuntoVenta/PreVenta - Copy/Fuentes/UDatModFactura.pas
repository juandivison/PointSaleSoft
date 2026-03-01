unit UDatModFactura;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery, IBStoredProc;

type
  TdmFactura = class(TDataModule)
    IBDataSetFacturas: TIBDataSet;
    dtIBDataSetFacturas: TDataSource;
    IBDatosFctPago: TIBDataSet;
    dtIBDatosFctPago: TDataSource;
    IBDatosFctPagoFECHA: TDateTimeField;
    IBDatosFctPagoNUMERO: TIntegerField;
    IBDatosFctPagoMONTO_FACT: TFloatField;
    IBDataSetPagoFct: TIBDataSet;
    IBDataSetPagoFctSERIE: TIntegerField;
    IBDataSetPagoFctNUMERO_FACTURA: TIntegerField;
    IBDataSetPagoFctNUMERO_RECIBO: TIntegerField;
    IBDataSetPagoFctMONTO_PAGADO: TFloatField;
    IBDataSetPagoFctSTATUS: TIBStringField;
    IBDataSetPagoFctFECHA_IN: TDateTimeField;
    IBDataSetPagoFctIN_POR: TIBStringField;
    IBDataSetPagoFctFECHA_MOD: TDateTimeField;
    IBDataSetPagoFctMOD_POR: TIBStringField;
    dtIBDataSetPagoFct: TDataSource;
    ibQryViewNCF: TIBQuery;
    ibQryViewNCFID: TIBStringField;
    ibQryViewNCFDESCRIPCION: TIBStringField;
    ibQryViewNCFSERIE: TIBStringField;
    ibQryViewNCFDIV_NEGOCIO: TIBStringField;
    ibQryViewNCFPECF: TIBStringField;
    ibQryViewNCFAICF: TIBStringField;
    ibQryViewNCFTIPO_CF: TIBStringField;
    ibQryViewNCFNCF: TFloatField;
    dstblDgii_SerieNCF: TDataSource;
    tblDgii_SerieNCF: TIBTable;
    tblDgii_SerieNCFNCF: TFloatField;
    tblDgii_SerieNCFFECHA_IN: TDateTimeField;
    tblDgii_SerieNCFFECHA_UPD: TDateTimeField;
    tblDgii_SerieNCFACTIVO: TSmallintField;
    tblDgii_SerieNCFSERIE: TIBStringField;
    tblDgii_SerieNCFDIV_NEGOCIO: TIBStringField;
    tblDgii_SerieNCFPECF: TIBStringField;
    tblDgii_SerieNCFAICF: TIBStringField;
    tblDgii_SerieNCFTIPO_CF: TIBStringField;
    dsibQryViewNCF: TDataSource;
    dstblTipoCF: TDataSource;
    tblTipoCF: TIBTable;
    tblTipoCFTIPO_CF: TIBStringField;
    tblTipoCFDESCRIPCION: TIBStringField;
    QryHistSecNCF: TIBQuery;
    QryHistSecNCFID_SERIE: TIntegerField;
    QryHistSecNCFIDNCF: TIBStringField;
    QryHistSecNCFINICIO_SECUECIA: TIntegerField;
    QryHistSecNCFFIN_SECUENCIA: TIntegerField;
    QryHistSecNCFFECHA_ASIGNACION: TDateTimeField;
    tblQryHistoricoSecNCF: TIBDataSet;
    tblQryHistoricoSecNCFID_SERIE: TIntegerField;
    tblQryHistoricoSecNCFIDNCF: TIBStringField;
    tblQryHistoricoSecNCFINICIO_SECUECIA: TIntegerField;
    tblQryHistoricoSecNCFFIN_SECUENCIA: TIntegerField;
    tblQryHistoricoSecNCFFECHA_ASIGNACION: TDateTimeField;
    ibStpVerificaSEC_NCF: TIBStoredProc;
    stpProcInsFactPendiente: TIBStoredProc;
    IBDataSetFacturasSERIE: TFloatField;
    IBDataSetFacturasNUMERO: TFloatField;
    IBDataSetFacturasMONEDA: TIBStringField;
    IBDataSetFacturasTIPO: TSmallintField;
    IBDataSetFacturasCODIGO_CTE: TIntegerField;
    IBDataSetFacturasFECHA: TDateTimeField;
    IBDataSetFacturasDESCRIPCION: TIBStringField;
    IBDataSetFacturasMONTO_FACT: TFloatField;
    IBDataSetFacturasRCXC: TIBStringField;
    IBDataSetFacturasRCNT: TIBStringField;
    IBDataSetFacturasSTATUS: TIBStringField;
    IBDataSetFacturasFECHA_IN: TDateTimeField;
    IBDataSetFacturasIN_POR: TIBStringField;
    IBDataSetFacturasFECHA_MOD: TDateTimeField;
    IBDataSetFacturasMOD_POR: TIBStringField;
    qryRepItbis: TIBQuery;
    qryRepItbisCODIGO_CTE: TIntegerField;
    qryRepItbisITBI_DET: TFloatField;
    qryRepItbisNOMBRE_CTE: TIBStringField;
    qryRepItbisFECHA: TDateTimeField;
    qryRepItbisMONEDA: TIBStringField;
    qryRepItbisNUMERO: TIntegerField;
    qryRepItbisRNC_NUMERO: TIBStringField;
    qryRepItbisCEDULA: TIBStringField;
    qryRepItbisVALOR_TOTAL_DET: TFloatField;
    qryFactReimpMaster: TIBQuery;
    qryFactReimpDet: TIBQuery;
    qryFactReimpMasterNUMERO: TFloatField;
    qryFactReimpMasterCODIGO_CTE: TIntegerField;
    qryFactReimpMasterFECHA: TDateTimeField;
    qryFactReimpMasterMONTO_FACT: TFloatField;
    qryFactReimpMasterNOMBRE_CTE: TIBStringField;
    qryFactReimpMasterRNC_NUMERO: TIBStringField;
    qryFactReimpMasterTELEF_CONTACTO: TIBStringField;
    qryFactReimpMasterPAIS: TIBStringField;
    qryFactReimpMasterCIUDAD: TIBStringField;
    qryFactReimpMasterDIRECCION_CONT: TIBStringField;
    qryRepItbisNUMERO_NCF: TIBStringField;
    tblProgServIguala: TIBDataSet;
    tblProgServIgualaNUMERO: TIntegerField;
    tblProgServIgualaCODIGO_CTE: TIntegerField;
    tblProgServIgualaFECHA_INI: TDateTimeField;
    tblProgServIgualaFECHA_FIN: TDateTimeField;
    tblProgServIgualaFECHA_ULT_FACT: TDateTimeField;
    tblProgServIgualaCOD_SERVICIO: TIntegerField;
    tblProgServIgualaMONTO: TFloatField;
    tblProgServIgualaCARGAR_ITBIS: TSmallintField;
    tblProgServIgualaSTATUS: TIBStringField;
    tblProgServIgualaCOD_USUARIO_IN: TIntegerField;
    tblProgServIgualaINSERTADO_POR: TIBStringField;
    tblProgServIgualaFECHA_UPDATE: TDateTimeField;
    tblProgServIgualaCOD_USUARIO_UPDATE: TIntegerField;
    tblServProgIgualas: TIBTable;
    dstblProgServIguala: TDataSource;
    tblServProgIgualasCODIGO: TSmallintField;
    dstblServProgIgualas: TDataSource;
    qryFactServFReimpMaster: TIBQuery;
    qryFactServFReimpDet: TIBQuery;
    qryFactServFReimpMasterNUMERO: TFloatField;
    qryFactServFReimpMasterCODIGO_CTE: TIntegerField;
    qryFactServFReimpMasterFECHA: TDateTimeField;
    qryFactServFReimpMasterMONTO_FACT: TFloatField;
    qryFactServFReimpMasterNOMBRE_CTE: TIBStringField;
    qryFactServFReimpMasterRNC_NUMERO: TIBStringField;
    qryFactServFReimpMasterTELEF_CONTACTO: TIBStringField;
    qryFactServFReimpMasterPAIS: TIBStringField;
    qryFactServFReimpMasterCIUDAD: TIBStringField;
    qryFactServFReimpMasterDIRECCION_CONT: TIBStringField;
    tblProgServIgualaTIPO_NCF: TIBStringField;
    tblServProgIguala: TIBTable;
    tblServProgIgualaCODIGO: TSmallintField;
    qryServProgIguala: TIBQuery;
    qryServProgIgualaCODIGO: TSmallintField;
    tblProgServIgualaDescripcionServicio: TStringField;
    dsqryServProgIguala: TDataSource;
    dstblServProgIguala: TDataSource;
    tblServProgIgualasDESCRIPCION: TIBStringField;
    tblServProgIgualaDESCRIPCION: TIBStringField;
    qryServProgIgualaDESCRIPCION: TIBStringField;
    qryRepItbis_Esp: TIBQuery;
    qryRepItbis_EspCODIGO_CTE: TIntegerField;
    qryRepItbis_EspITBI_DET: TFloatField;
    qryRepItbis_EspNOMBRE_CTE: TIBStringField;
    qryRepItbis_EspFECHA: TDateTimeField;
    qryRepItbis_EspMONEDA: TIBStringField;
    qryRepItbis_EspVALOR_TOTAL_DET: TFloatField;
    qryRepItbis_EspNUMERO: TIntegerField;
    qryRepItbis_EspRNC_NUMERO: TIBStringField;
    qryRepItbis_EspCEDULA: TIBStringField;
    qryRepItbis_EspNUMERO_NCF: TIBStringField;
    tblProgServIgualaFECHA_IN: TDateTimeField;
    qryFactReimpMasterFECHA_VENCE: TDateTimeField;
    IBDataSetFacturasFECHA_VENCE: TDateTimeField;
    procedure ibQryViewNCFFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblDgii_SerieNCFAfterScroll(DataSet: TDataSet);
    procedure qryFactReimpMasterAfterScroll(DataSet: TDataSet);
    procedure qryFactServFReimpMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFactura: TdmFactura;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmFactura.ibQryViewNCFFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=  (DataSet['tipo_cf'] = '01' ) OR
            (DataSet['tipo_cf'] = '02' ) OR
            (DataSet['tipo_cf'] = '14' );
end;

procedure TdmFactura.tblDgii_SerieNCFAfterScroll(DataSet: TDataSet);
begin
  QryHistSecNCF.close;
  QryHistSecNCF.params[0].Value:= tblDgii_SerieNCFNCF.Value;
  QryHistSecNCF.Open;
end;

procedure TdmFactura.qryFactReimpMasterAfterScroll(DataSet: TDataSet);
begin
  qryFactReimpDet.Close;
  qryFactReimpDet.Params[0].Value:=qryFactReimpMasterNUMERO.Value;
  qryFactReimpDet.Open;
end;

procedure TdmFactura.qryFactServFReimpMasterAfterScroll(DataSet: TDataSet);
begin
  qryFactServFReimpDet.Close;
  qryFactServFReimpDet.Params[0].Value:= dmFactura.qryFactServFReimpMasterNumero.Value;
  qryFactServFReimpDet.Open;
end;

end.
