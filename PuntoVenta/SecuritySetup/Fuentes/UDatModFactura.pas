unit UDatModFactura;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBStoredProc, IBTable;

type
  TdmFactura = class(TDataModule)
    tblFacturas: TIBDataSet;
    dstblFacturas: TDataSource;
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
    tblFacturasSERIE: TFloatField;
    tblFacturasTIPO: TSmallintField;
    tblFacturasCODIGO_CTE: TIntegerField;
    tblFacturasFECHA: TDateTimeField;
    tblFacturasDESCRIPCION: TIBStringField;
    tblFacturasMONTO_FACT: TFloatField;
    tblFacturasRCXC: TIBStringField;
    tblFacturasRCNT: TIBStringField;
    tblFacturasSTATUS: TIBStringField;
    tblFacturasFECHA_IN: TDateTimeField;
    tblFacturasIN_POR: TIBStringField;
    tblFacturasFECHA_MOD: TDateTimeField;
    tblFacturasMOD_POR: TIBStringField;
    qryClientes: TIBQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesNOMBRE: TIBStringField;
    qryClientesAPELLIDO: TIBStringField;
    qryClientesNOMBRE_EMPRESA: TIBStringField;
    dsqryClientes: TDataSource;
    qryClientesNOMBRE_CLIENTE: TStringField;
    tblBalanceCliente: TIBDataSet;
    tblBalanceClienteCODIGO: TIntegerField;
    tblBalanceClienteSERVICIO: TIntegerField;
    tblBalanceClienteMONEDA: TIBStringField;
    tblBalanceClienteCTA1_BCE: TIBStringField;
    tblBalanceClienteCTA2_BCE: TIBStringField;
    tblBalanceClienteCTA3_BCE: TIBStringField;
    tblBalanceClienteBALANCE_ACT: TFloatField;
    tblBalanceClienteBALANCE_ANT: TFloatField;
    tblBalanceClienteDEBITO_MES: TFloatField;
    tblBalanceClienteCREDITO_MES: TFloatField;
    tblBalanceClienteDEBITO_ACM: TFloatField;
    tblBalanceClienteCREDITO_ACM: TFloatField;
    tblBalanceClienteFECHA_BCE: TDateTimeField;
    tblBalanceClienteFECHA_ULT_PAGO: TDateTimeField;
    tblBalanceClienteSTATUS_BCE: TIBStringField;
    tblBalanceClienteFECHA_IN: TDateTimeField;
    tblBalanceClienteIN_POR: TIBStringField;
    tblBalanceClienteFECHA_MOD: TDateTimeField;
    tblBalanceClienteMOD_POR: TIBStringField;
    qryClientesTELEFONO_LOCAL: TIBStringField;
    qryClientesDIRECCION_LOCAL: TIBStringField;
    qryClientesDESCRIPCION: TIBStringField;
    dstblBalanceCliente: TDataSource;
    tblBalanceClienteCOMENTARIO: TMemoField;
    stpFactPagoInc: TIBStoredProc;
    stpFactPendiente: TIBStoredProc;
    tblFacturasMONEDA: TIBStringField;
    qryFacturasCte: TIBQuery;
    dsqryFacturasCte: TDataSource;
    qryFacturasCteNUMERO: TIntegerField;
    qryFacturasCteMONEDA: TIBStringField;
    qryFacturasCteTIPO: TSmallintField;
    qryFacturasCteCODIGO_CTE: TIntegerField;
    qryFacturasCteFECHA: TDateTimeField;
    qryFacturasCteDESCRIPCION: TIBStringField;
    qryFacturasCteMONTO_FACT: TFloatField;
    qryFacturasCteRCXC: TIBStringField;
    qryFacturasCteRCNT: TIBStringField;
    qryFacturasCteSTATUS: TIBStringField;
    qryFacturasCteNUMERO_FACT: TIntegerField;
    qryFacturasCteMONTO_PENDIENTE: TFloatField;
    tblFacturasNUMERO: TIntegerField;
    qryFacturaMaster: TIBQuery;
    qryFacturaDet: TIBQuery;
    qryFacturaDetCODIGO_CTE: TIntegerField;
    qryFacturaDetMONTO_FACT: TFloatField;
    qryFacturaDetMONEDA: TIBStringField;
    qryFacturaDetRCXC: TIBStringField;
    qryFacturaDetSTATUS: TIBStringField;
    qryFacturaDetRCNT: TIBStringField;
    qryFacturaDetNUMERO_FACTURA: TIntegerField;
    qryFacturaDetFICHA_VEH: TIntegerField;
    qryFacturaDetNUMERO_CONTRATO: TIntegerField;
    qryFacturaDetFECHA_SALIDA: TDateTimeField;
    qryFacturaDetCANTIDAD_DIAS: TFloatField;
    qryFacturaDetTARIFABASE: TFloatField;
    qryFacturaDetMONTO_ITBIS: TFloatField;
    qryFacturaMasterNOMBRE_EMPRESA: TIBStringField;
    qryFacturaMasterCODIGO_CTE: TIntegerField;
    qryFacturaMasterTIPO_CLIENTE: TSmallintField;
    qryFacturaMasterNOMBRE: TIBStringField;
    qryFacturaMasterAPELLIDO: TIBStringField;
    qryFacturaMasterTELEF_CONTACTO: TIBStringField;
    qryFacturaMasterDESCRIPCION: TIBStringField;
    qryFacturaMasterDIRECCION_REAL: TIBStringField;
    qryFacturaMasterDIRECCION_LOCAL: TIBStringField;
    qryFacturaMasterCONDICION: TSmallintField;
    qryFacturaMasterTELEF_REFERENCIA: TIBStringField;
    qryFacturaMasterOTRO_TELEFONO: TIBStringField;
    qryFacturaMasterCIUDAD: TIBStringField;
    qryFacturaMasterPAIS: TIBStringField;
    qryFacturaMasterMONTO_FACT: TFloatField;
    qryFacturaMasterFECHA: TDateTimeField;
    qryFacturaMasterMONEDA: TIBStringField;
    qryFacturaMasterRCXC: TIBStringField;
    qryFacturaMasterSTATUS: TIBStringField;
    qryFacturaMasterRCNT: TIBStringField;
    qryFacturaMasterNUMERO_FACTURA: TIntegerField;
    qryFacturaDetFECHA_FACTURA: TDateTimeField;
    qryFacturaDetFECHA_ENTRADA: TDateTimeField;
    qryFacturaDetTOTAL_CONSUMO: TFloatField;
    qryFacturaMasterTELEFONO_LOCAL: TIBStringField;
    qryFacturaMasterTIPO_CONTRATO: TSmallintField;
    qryFacturaMasterCANT_DIAS_CREDITO: TSmallintField;
    qryFacturaDetMONTO_SIN_TBIS: TFloatField;
    qryFacturaDetMONTO_ABONADO: TFloatField;
    qryFacturaDetNew: TIBQuery;
    qryFacturaMasterABONO: TFloatField;
    qryFacturaMasterAJUSTE: TFloatField;
    qryFacturaMasterMONTO_COMBUSTIBLE: TFloatField;
    tblDgii_SerieNCF: TIBTable;
    dstblDgii_SerieNCF: TDataSource;
    tblDgii_SerieNCFNCF: TFloatField;
    tblDgii_SerieNCFFECHA_IN: TDateTimeField;
    tblDgii_SerieNCFFECHA_UPD: TDateTimeField;
    tblDgii_SerieNCFACTIVO: TSmallintField;
    qryFacturaMasterNUM_COMP_FISCAL: TFloatField;
    tblTipoCF: TIBTable;
    dstblTipoCF: TDataSource;
    tblTipoCFTIPO_CF: TIBStringField;
    tblTipoCFDESCRIPCION: TIBStringField;
    tblDgii_SerieNCFSERIE: TIBStringField;
    tblDgii_SerieNCFDIV_NEGOCIO: TIBStringField;
    tblDgii_SerieNCFPECF: TIBStringField;
    tblDgii_SerieNCFAICF: TIBStringField;
    tblDgii_SerieNCFTIPO_CF: TIBStringField;
    qryFacturaMasterNCF_DGII: TIBStringField;
    ibQryViewNCF: TIBQuery;
    dsibQryViewNCF: TDataSource;
    ibQryViewNCFID: TIBStringField;
    ibQryViewNCFDESCRIPCION: TIBStringField;
    ibQryViewNCFSERIE: TIBStringField;
    ibQryViewNCFDIV_NEGOCIO: TIBStringField;
    ibQryViewNCFPECF: TIBStringField;
    ibQryViewNCFAICF: TIBStringField;
    ibQryViewNCFTIPO_CF: TIBStringField;
    ibQryViewNCFNCF: TFloatField;
    qryFacturaMasterMONTO_OFERTA: TFloatField;
    qryFacturaMasterRNC_CTE: TIBStringField;
    qryFacturaMasterCEDULA_CTE: TIBStringField;
    procedure qryClientesCalcFields(DataSet: TDataSet);
    procedure qryFacturaMasterAfterScroll(DataSet: TDataSet);
    procedure ibQryViewNCFFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFactura: TdmFactura;

implementation

uses UDatModCon;

{$R *.dfm}

procedure TdmFactura.qryClientesCalcFields(DataSet: TDataSet);
begin
  if qryClientesNOMBRE_EMPRESA.IsNull then
  qryClientesNOMBRE_CLIENTE.Value:= qryClientesNOMBRE.Value + ' '+qryClientesAPELLIDO.Value
  else qryClientesNOMBRE_CLIENTE.Value:= qryClientesNOMBRE_EMPRESA.Value;

end;

procedure TdmFactura.qryFacturaMasterAfterScroll(DataSet: TDataSet);
begin
  qryFacturaDet.Close;
  qryFacturaDet.Params[0].Value := qryFacturaMasterNUMERO_FACTURA.Value;
  qryFacturaDet.Open;
end;

procedure TdmFactura.ibQryViewNCFFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=  (DataSet['tipo_cf'] = '01' ) OR (DataSet['tipo_cf'] = '02' ) OR
            (DataSet['tipo_cf'] = '14' )
end;

end.
