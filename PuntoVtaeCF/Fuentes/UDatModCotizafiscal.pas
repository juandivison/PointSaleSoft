unit UDatModCotizafiscal;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL;
                                  
type
  Tdmcotizafiscal = class(TDataModule)
    qryDatosReimpDocFiscal: TIBQuery;
    qryDatosReimpDocFiscalNombrecliente: TStringField;
    qryDatosReimpDocFiscalRNC: TStringField;
    qryDatosReimpdocFiscalDet: TIBQuery;
    qryDatosCotizaMaster: TIBQuery;
    qryDatosCotizaDetalle: TIBQuery;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesDESCRIPCION_TIPOCTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesEMAIL: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryDatosCotizaMasterNUMERO: TIntegerField;
    qryDatosCotizaMasterFECHA: TDateTimeField;
    qryDatosCotizaMasterCIA_KEY: TIntegerField;
    qryDatosCotizaMasterFECHA_VENCE: TDateTimeField;
    qryDatosCotizaMasterCODIGO_CTE: TIntegerField;
    qryDatosCotizaMasterCODIGO_VENDEDOR: TIntegerField;
    qryDatosCotizaMasterOBSERVACION: TIBStringField;
    qryDatosCotizaMasterMONEDA: TIBStringField;
    qryDatosCotizaMasterVALOR_TOTAL: TFloatField;
    qryDatosCotizaMasterSTATUS: TIBStringField;
    qryDatosCotizaMasterFECHA_IN: TDateTimeField;
    qryDatosCotizaMasterIN_POR: TIBStringField;
    qryDatosCotizaMasterFECHA_MOD: TDateTimeField;
    qryDatosCotizaMasterMOD_POR: TIBStringField;
    qryDatosCotizaMasterNUMERO_FACTURA: TIntegerField;
    qryDatosCotizaMasterNUMERO_DOC_PAGO: TIBStringField;
    qryDatosCotizaMasterSERIE_NCF_ASIGNADO: TIntegerField;
    qryDatosCotizaMasterMONTO_BRUTO: TFloatField;
    qryDatosCotizaMasterPORC_DESCUENTO: TIntegerField;
    qryDatosCotizaMasterMONTO_DESCUENTO: TFloatField;
    qryDatosCotizaMasterMONTO_INICIAL: TFloatField;
    qryDatosCotizaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryDatosCotizaMasterMONTO_PAGADO: TFloatField;
    qryDatosCotizaMasterMONTO_CAMBIO: TFloatField;
    qryDatosCotizaMasterMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosCotizaMasterMONTODESCGASTOSADMIN: TFloatField;
    qryDatosCotizaMasterMONTODESCITBISGASTOSADMIN: TFloatField;
    qryDatosCotizaMasterMONTODESCTRANSP: TFloatField;
    qryDatosCotizaMasterMONTODESCDIRTECNICA: TFloatField;
    qryDatosCotizaMasterMONTODESCITBISDIRTECNICA: TFloatField;
    qryDatosCotizaMasterMONTODESCIMPREVISTO: TFloatField;
    qryDatosCotizaMasterMONTODESCITBISIMPREVISTO: TFloatField;
    qryDatosCotizaMasterTIPO_FACTURA: TSmallintField;
    qryDatosCotizaMasterAPLICA_TIPODESC: TSmallintField;
    qryDatosCotizaMasterCOMENTARIO: TMemoField;
    qryDatosCotizaMasterREFERENCIACTE: TIBStringField;
    qryDatosCotizaMasterMONTO_RECARGO: TFloatField;
    qryDatosCotizaMasterTIPONCFIFISCAL: TIntegerField;
    qryDatosCotizaMasterMONTO_EXONERADO_ITBIS: TFloatField;
    qryDatosReimpDocFiscalFECHA: TDateTimeField;
    qryDatosReimpDocFiscalNUMERO: TIntegerField;
    qryDatosReimpDocFiscalCODIGO_CTE: TIntegerField;
    qryDatosReimpDocFiscalNIF: TIBStringField;
    qryDatosReimpDocFiscalNUMERO_NCF: TIBStringField;
    qryDatosReimpDocFiscalTIPO: TIntegerField;
    qryDatosReimpDocFiscalTOTAL_BRUTO: TFloatField;
    qryDatosReimpDocFiscalMONTO_ITBIS: TFloatField;
    qryDatosReimpDocFiscalMONTO_CAMBIO: TFloatField;
    qryDatosReimpDocFiscalTOTAL_NETO: TFloatField;
    qryDatosReimpDocFiscalMONTO_DESCUENTO: TFloatField;
    qryDatosReimpDocFiscalMONTO_PAGADO: TFloatField;
    qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS: TFloatField;
    qryDatosReimpDocFiscalNUMERO1: TIntegerField;
    qryDatosReimpDocFiscalFECHA1: TDateTimeField;
    qryDatosReimpDocFiscalCIA_KEY: TIntegerField;
    qryDatosReimpDocFiscalFECHA_VENCE: TDateTimeField;
    qryDatosReimpDocFiscalCODIGO_CTE1: TIntegerField;
    qryDatosReimpDocFiscalCODIGO_VENDEDOR: TIntegerField;
    qryDatosReimpDocFiscalOBSERVACION: TIBStringField;
    qryDatosReimpDocFiscalMONEDA: TIBStringField;
    qryDatosReimpDocFiscalVALOR_TOTAL: TFloatField;
    qryDatosReimpDocFiscalSTATUS: TIBStringField;
    qryDatosReimpDocFiscalFECHA_IN: TDateTimeField;
    qryDatosReimpDocFiscalIN_POR: TIBStringField;
    qryDatosReimpDocFiscalFECHA_MOD: TDateTimeField;
    qryDatosReimpDocFiscalMOD_POR: TIBStringField;
    qryDatosReimpDocFiscalNUMERO_FACTURA: TIntegerField;
    qryDatosReimpDocFiscalNUMERO_DOC_PAGO: TIBStringField;
    qryDatosReimpDocFiscalSERIE_NCF_ASIGNADO: TIntegerField;
    qryDatosReimpDocFiscalMONTO_BRUTO: TFloatField;
    qryDatosReimpDocFiscalPORC_DESCUENTO: TIntegerField;
    qryDatosReimpDocFiscalMONTO_DESCUENTO1: TFloatField;
    qryDatosReimpDocFiscalMONTO_INICIAL: TFloatField;
    qryDatosReimpDocFiscalNOMBRE_CLIENTE_GENERAL: TIBStringField;
    qryDatosReimpDocFiscalMONTO_PAGADO1: TFloatField;
    qryDatosReimpDocFiscalMONTO_CAMBIO1: TFloatField;
    qryDatosReimpDocFiscalMONTO_TOTAL_ITBIS1: TFloatField;
    qryDatosReimpDocFiscalMONTODESCGASTOSADMIN: TFloatField;
    qryDatosReimpDocFiscalMONTODESCITBISGASTOSADMIN: TFloatField;
    qryDatosReimpDocFiscalMONTODESCTRANSP: TFloatField;
    qryDatosReimpDocFiscalMONTODESCDIRTECNICA: TFloatField;
    qryDatosReimpDocFiscalMONTODESCITBISDIRTECNICA: TFloatField;
    qryDatosReimpDocFiscalMONTODESCIMPREVISTO: TFloatField;
    qryDatosReimpDocFiscalMONTODESCITBISIMPREVISTO: TFloatField;
    qryDatosReimpDocFiscalTIPO_FACTURA: TSmallintField;
    qryDatosReimpDocFiscalAPLICA_TIPODESC: TSmallintField;
    qryDatosReimpDocFiscalCOMENTARIO: TMemoField;
    qryDatosReimpDocFiscalREFERENCIACTE: TIBStringField;
    qryDatosReimpDocFiscalMONTO_RECARGO: TFloatField;
    qryDatosReimpDocFiscalTIPONCFIFISCAL: TIntegerField;
    qryDatosReimpDocFiscalMONTO_EXONERADO_ITBIS: TFloatField;
    qryDatosCotizaDetalleSERIE: TIntegerField;
    qryDatosCotizaDetalleNUMERO: TIntegerField;
    qryDatosCotizaDetalleCODIGO_PROD: TIBStringField;
    qryDatosCotizaDetalleCODIGO_BARRA: TIBStringField;
    qryDatosCotizaDetalleDESCRIPCIONESPECIAL: TMemoField;
    qryDatosCotizaDetalleDESCRIPCION: TIBStringField;
    qryDatosCotizaDetalleCANTIDAD: TFloatField;
    qryDatosCotizaDetallePRECIO: TFloatField;
    qryDatosCotizaDetallePORC_DESC_DET: TFloatField;
    qryDatosCotizaDetalleITBI_DET: TFloatField;
    qryDatosCotizaDetalleVALOR_SERVICIO_DET: TFloatField;
    qryDatosCotizaDetalleVALOR_TOTAL_DET: TFloatField;
    qryDatosCotizaDetalleSTATUS_DET: TIBStringField;
    qryDatosCotizaDetalleFECHA_IN: TDateTimeField;
    qryDatosCotizaDetalleIN_POR: TIBStringField;
    qryDatosCotizaDetalleFECHA_MOD: TDateTimeField;
    qryDatosCotizaDetalleMOD_POR: TIBStringField;
    qryDatosCotizaDetalleCANT_REGRESO: TFloatField;
    qryDatosCotizaDetalleCANT_PROMO: TFloatField;
    qryDatosCotizaDetalleMONTO_DIETA: TFloatField;
    qryDatosCotizaDetalleMONTO_AJUSTE: TFloatField;
    qryDatosCotizaDetalleSERIE_PROD: TIBStringField;
    qryDatosCotizaDetalleSTATUS_CNT: TIBStringField;
    qryDatosCotizaDetalleTIPO_UNIDAD: TIntegerField;
    qryDatosCotizaDetalleITBIS_EXENTO: TSmallintField;
    qryDatosCotizaDetalleTIPO_VENTA: TSmallintField;
    qryDatosCotizaDetalleDESCRIPCIONPRODUCTO: TMemoField;
    qryDatosCotizaDetallePORC_DESC_ITEM: TFloatField;
    qryDatosCotizaDetalleMONTO_DESC_ITEM: TFloatField;
    qryDatosReimpdocFiscalDetSERIE: TIntegerField;
    qryDatosReimpdocFiscalDetNUMERO: TIntegerField;
    qryDatosReimpdocFiscalDetCODIGO_PROD: TIBStringField;
    qryDatosReimpdocFiscalDetCODIGO_BARRA: TIBStringField;
    qryDatosReimpdocFiscalDetDESCRIPCIONESPECIAL: TMemoField;
    qryDatosReimpdocFiscalDetDESCRIPCION: TIBStringField;
    qryDatosReimpdocFiscalDetCANTIDAD: TFloatField;
    qryDatosReimpdocFiscalDetPRECIO: TFloatField;
    qryDatosReimpdocFiscalDetPORC_DESC_DET: TFloatField;
    qryDatosReimpdocFiscalDetITBI_DET: TFloatField;
    qryDatosReimpdocFiscalDetVALOR_SERVICIO_DET: TFloatField;
    qryDatosReimpdocFiscalDetVALOR_TOTAL_DET: TFloatField;
    qryDatosReimpdocFiscalDetSTATUS_DET: TIBStringField;
    qryDatosReimpdocFiscalDetFECHA_IN: TDateTimeField;
    qryDatosReimpdocFiscalDetIN_POR: TIBStringField;
    qryDatosReimpdocFiscalDetFECHA_MOD: TDateTimeField;
    qryDatosReimpdocFiscalDetMOD_POR: TIBStringField;
    qryDatosReimpdocFiscalDetCANT_REGRESO: TFloatField;
    qryDatosReimpdocFiscalDetCANT_PROMO: TFloatField;
    qryDatosReimpdocFiscalDetMONTO_DIETA: TFloatField;
    qryDatosReimpdocFiscalDetMONTO_AJUSTE: TFloatField;
    qryDatosReimpdocFiscalDetSERIE_PROD: TIBStringField;
    qryDatosReimpdocFiscalDetSTATUS_CNT: TIBStringField;
    qryDatosReimpdocFiscalDetTIPO_UNIDAD: TIntegerField;
    qryDatosReimpdocFiscalDetITBIS_EXENTO: TSmallintField;
    qryDatosReimpdocFiscalDetTIPO_VENTA: TSmallintField;
    qryDatosReimpdocFiscalDetDESCRIPCIONPRODUCTO: TMemoField;
    qryDatosReimpdocFiscalDetPORC_DESC_ITEM: TFloatField;
    qryDatosReimpdocFiscalDetMONTO_DESC_ITEM: TFloatField;
    qryDescLineas: TIBQuery;
    qryDescLineasIDLINEA: TIntegerField;
    qryDescLineasITEM: TIntegerField;
    qryDescLineasDESCRIPCION: TIBStringField;
    qryDatosCotizaMasterPORCPROPINALEGAL: TFloatField;
    qryDatosCotizaMasterPROPINA: TFloatField;
    qryDatosCotizaMasterPROPINALEGAL: TFloatField;
    qryDescLineasSTATUS: TIBStringField;
    tblctrlImpCotizaFiscal: TIBDataSet;
    tblctrlImpCotizaFiscalNUMERO_TRN: TIntegerField;
    tblctrlImpCotizaFiscalACTIVO: TSmallintField;
    tblctrlImpCotizaFiscalFECHA: TDateTimeField;
    tblctrlImpCotizaFiscalIMPRIMIENDO: TSmallintField;
    tblctrlImpNVtaFiscal: TIBDataSet;
    tblctrlImpNVtaFiscalNUMERO_TRN: TIntegerField;
    tblctrlImpNVtaFiscalACTIVO: TSmallintField;
    tblctrlImpNVtaFiscalFECHA: TDateTimeField;
    tblctrlImpNVtaFiscalIMPRIMIENDO: TSmallintField;
    qryLComentarioCot: TIBQuery;
    qryLComentarioCotID: TSmallintField;
    qryLComentarioCotNUMLIN: TSmallintField;
    qryLComentarioCotNUMERO_TRN: TIntegerField;
    qryLComentarioCotLINEA: TIBStringField;
    qryLComentarioCotTIPO_OPE: TSmallintField;
    tblLineaComentario: TIBDataSet;
    tblLineaComentarioID: TSmallintField;
    tblLineaComentarioNUMLIN: TSmallintField;
    tblLineaComentarioNUMERO_TRN: TIntegerField;
    tblLineaComentarioLINEA: TIBStringField;
    tblLineaComentarioTIPO_OPE: TSmallintField;
    ibsqlUpdLcomentarioCoti: TIBSQL;
    procedure qryDatosReimpDocFiscalCalcFields(DataSet: TDataSet);
    procedure qryDatosReimpDocFiscalAfterScroll(DataSet: TDataSet);
    procedure qryDatosCotizaMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProcInsCtrlImpCotiFiscal(numcoti:integer);
  end;

var
  dmcotizafiscal: Tdmcotizafiscal;

implementation

uses UDatModConectar, Uglobal;

{$R *.dfm}

procedure Tdmcotizafiscal.qryDatosReimpDocFiscalCalcFields(
  DataSet: TDataSet);
begin
  if (qryClientes.RecordCount > 0) then
  begin
    qryDatosReimpDocFiscalNombrecliente.Value:= qryClientesNOMBRE_FACTURAR.Value;
    qryDatosReimpDocFiscalRNC.Value := qryClientesRNC_NUMERO.Value;
  end;
end;

procedure Tdmcotizafiscal.qryDatosReimpDocFiscalAfterScroll(
  DataSet: TDataSet);
begin
  qryClientes.Close;
  qryClientes.Open;
  qryClientes.Locate('CODIGO_CTE', qryDatosReimpDocFiscalCODIGO_CTE.Value, []);

  qryDatosReimpdocFiscalDet.Close;
  qryDatosReimpdocFiscalDet.Params[0].Value:= qryDatosReimpDocFiscalNUMERO.Value;
  qryDatosReimpdocFiscalDet.Open;
end;

procedure Tdmcotizafiscal.qryDatosCotizaMasterAfterScroll(
  DataSet: TDataSet);
begin
  qryDatosCotizaDetalle.Close;
  qryDatosCotizaDetalle.Params[0].Value:= qryDatosCotizaMasterNUMERO.Value;
  qryDatosCotizaDetalle.Open;
  //qryTipoIFiscal.Close;
  //qryTipoIFiscal.Params[0].Value := qryDatosVentaMasterTIPO_NCF.Value;
  //qryTipoIFiscal.Open;

  //qryTipoIFiscal.Locate('TIPO_NCF_IFISCAL', qryDatosVentaMasterTIPONCFIFISCAL.Value, []);

  //qryBuscarNIF.Close;
  //qryBuscarNIF.Params[0].Value:= qryDatosVentaMasterNUMERO.Value;
  //qryBuscarNIF.Open;
end;

procedure Tdmcotizafiscal.ProcInsCtrlImpCotiFiscal(numcoti:integer);
begin
  GlbImprimiendo := False;
  tblctrlImpCotizaFiscal.Close;
  tblctrlImpCotizaFiscal.Params[0].Value:= numcoti;
  tblctrlImpCotizaFiscal.Open;
  tblctrlImpCotizaFiscal.Last;
  if tblctrlImpCotizaFiscal.RecordCount = 0 then
  begin
    tblctrlImpCotizaFiscal.Append;
    tblctrlImpCotizaFiscalNUMERO_TRN.Value := numcoti;
    tblctrlImpCotizaFiscalFECHA.Value      := ExtraerFecha(Now);
    GlbSalvarQuery(tblctrlImpCotizaFiscal);
  end else
  begin
    if tblctrlImpCotizaFiscalIMPRIMIENDO.Value = 1 then
    begin
      GlbImprimiendo := True;
    end;
  end;
end;

end.
