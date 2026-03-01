unit UDatModClientes;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

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

end.
