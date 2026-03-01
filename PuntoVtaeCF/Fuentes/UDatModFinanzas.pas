unit UDatModFinanzas;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmFinanzas = class(TDataModule)
    qryRep607: TIBQuery;
    qryRep607GRUPONCF: TIBStringField;
    qryRep607TIPO_IDENT: TSmallintField;
    qryRep607TIPODEINGRESO: TSmallintField;
    qryRep607TIPODOC: TIBStringField;
    qryRep607CODIGO_CTE: TIntegerField;
    qryRep607NOMBRE_CTE: TIBStringField;
    qryRep607FECHA: TDateTimeField;
    qryRep607MONEDA: TIBStringField;
    qryRep607RNC_NUMERO: TIBStringField;
    qryRep607CEDULA: TIBStringField;
    qryRep607DESC_NCF: TIBStringField;
    qryRep607FORMA_PAGO: TSmallintField;
    qryRep607VALOR_TOTAL_DET: TFloatField;
    qryRep607ITBI_DET: TFloatField;
    qryRep607ITBI_EXONERADO: TFloatField;
    qryRep607VALOR_BASE: TFloatField;
    qryRep607MONTO_DESCUENTO: TFloatField;
    qryRep607MONTO_RECARGO: TFloatField;
    qryRep607MONTOIBISRECARGO: TFloatField;
    qryRep607MONTOBASEEXENTO: TFloatField;
    qryRep607MONTOGRAVADO: TFloatField;
    qryRep607ITBIS_8PORCIENTO: TFloatField;
    qryRep607ITBIS_11PORCIENTO: TFloatField;
    qryRep607ITBIS_13PORCIENTO: TFloatField;
    qryRep607ITBIS_16PORCIENTO: TFloatField;
    qryRep607ITBIS_18PORCIENTO: TFloatField;
    qryRep607OTROPORCIENTOITBIS: TFloatField;
    qryRep607MONTO_PROPINA_LEGAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFinanzas: TdmFinanzas;

implementation
uses UDatModConectar;
{$R *.dfm}

end.
