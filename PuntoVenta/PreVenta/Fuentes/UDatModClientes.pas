unit UDatModClientes;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

type
  TdmClientes = class(TDataModule)
    tblClientes: TIBDataSet;
    dstblClientes: TDataSource;
    tblTipoCliente: TIBTable;
    tblMoneda: TIBTable;
    tblClientesCODIGO_CTE: TIntegerField;
    tblClientesTIPO_CLIENTE: TSmallintField;
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
    tblClientesFOTO: TBlobField;
    tblClientesRNC_NUMERO: TIBStringField;
    tblClientesCONDICION: TIntegerField;
    tblClientesCANT_DIAS_CREDITO: TSmallintField;
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
    tblClientesPRECIO_ID: TIntegerField;
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
    dstblClientesDelivery: TDataSource;
    tblClientesDelivery: TIBDataSet;
    tblClientesDeliveryCODIGO: TIntegerField;
    tblClientesDeliveryNOMBRE: TIBStringField;
    tblClientesDeliveryTELEFONO: TIBStringField;
    tblClientesDeliveryDIRECCION: TIBStringField;
    tblClientesDeliveryFECHA_IN: TDateTimeField;
    tblClientesDeliveryINSERT_POR: TIBStringField;
    procedure tblCteReferenciaMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClientes: TdmClientes;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmClientes.tblCteReferenciaMasterAfterScroll(DataSet: TDataSet);
begin
  tblCteReferenciaDet.Close;
  tblCteReferenciaDet.Params[0].Value:= tblCteReferenciaMasterTIPO_REFERENCIA.Value;
  tblCteReferenciaDet.Params[1].Value:= tblCteReferenciaMasterCODIGO_CTE.Value;
  tblCteReferenciaDet.Open;
end;

end.
