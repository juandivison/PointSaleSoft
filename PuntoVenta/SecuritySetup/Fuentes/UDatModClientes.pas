unit UDatModClientes;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBSQL;

type
  TdmClientes = class(TDataModule)
    tblClientes: TIBDataSet;
    tblTipoCliente: TIBTable;
    tblMoneda: TIBTable;
    tblCondicionVenta: TIBTable;
    tblCondicionVentaDESCRIPCION: TIBStringField;
    tblCondicionVentaCODIGO: TSmallintField;
    tblClientesCODIGO: TIntegerField;
    tblClientesTIPO_CLIENTE: TSmallintField;
    tblClientesFOTO: TBlobField;
    tblClientesNOMBRE: TIBStringField;
    tblClientesAPELLIDO: TIBStringField;
    tblClientesNOMBRE_EMPRESA: TIBStringField;
    tblClientesCEDULA: TIBStringField;
    tblClientesFECHA_VENCE_PASAPORTE: TDateTimeField;
    tblClientesRNC: TIBStringField;
    tblClientesFECHA_VENCE_LICENCIA: TDateTimeField;
    tblClientesREFERENCIA: TIBStringField;
    tblClientesCONDICION: TSmallintField;
    tblClientesLIMITE_CREDITO: TFloatField;
    tblClientesEMAIL: TIBStringField;
    tblClientesWEBSITE: TIBStringField;
    tblClientesPAIS: TIBStringField;
    tblClientesESTADO: TIBStringField;
    tblClientesCIUDAD: TIBStringField;
    tblClientesDIRECCION_REAL: TIBStringField;
    tblClientesDIRECCION_LOCAL: TIBStringField;
    tblClientesSTATUS_CLIENTE: TIBStringField;
    tblClientesINSERTADO_POR: TIBStringField;
    tblClientesFECHA_INSERTADO: TDateTimeField;
    tblClientesFECHA_MOD: TDateTimeField;
    tblClientesMODI_POR: TIBStringField;
    tblClientesCANT_DIAS_CREDITO: TSmallintField;
    tblClientesPASAPORTE: TIBStringField;
    tblClientesLICENCIA: TIBStringField;
    tblClientesTELEFONO_LOCAL: TIBStringField;
    tblClientesTELEF_CONTACTO: TIBStringField;
    tblClientesTELEF_REFERENCIA: TIBStringField;
    tblClientesOTRO_TELEFONO: TIBStringField;
    tblClientesFAX_CONTACTO: TIBStringField;
    ibsqlCodMaxCte: TIBSQL;
    ibsqlBuscarCte: TIBSQL;
    tblClientesTIPO_NCF: TIBStringField;
    tblTipoNCF: TIBTable;
    tblTipoNCFTIPO_CF: TIBStringField;
    tblTipoNCFDESCRIPCION: TIBStringField;
    dstblTipoNCF: TDataSource;
    tblClientesOBSERVACION: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmClientes: TdmClientes;

implementation

uses UDatModCon;

{$R *.dfm}

end.
