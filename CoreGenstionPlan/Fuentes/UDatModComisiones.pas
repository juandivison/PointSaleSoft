unit UDatModComisiones;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

type
  TdmComision = class(TDataModule)
    tblComisiones: TIBDataSet;
    tblTipoComision: TIBTable;
    tblComisionesCODIGO: TIBStringField;
    tblComisionesTIPO: TSmallintField;
    tblComisionesFECHA_INICIAL: TDateTimeField;
    tblComisionesFECHA_FINAL: TDateTimeField;
    tblComisionesMONTO_COMISION: TFloatField;
    tblComisionesSTATUS: TIBStringField;
    tblInventarioProd: TIBTable;
    tblInventarioProdCODIGO: TIntegerField;
    tblInventarioProdDESCRIPCION: TIBStringField;
    dstblInventarioProd: TDataSource;
    tblInventarioProdCodigoMasDesc: TStringField;
    tblInventarioProdCODIGO_TEXTO: TIBStringField;
    procedure tblInventarioProdCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmComision: TdmComision;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmComision.tblInventarioProdCalcFields(DataSet: TDataSet);
begin
  tblInventarioProdCodigoMasDesc.Value:= tblInventarioProdCODIGO_TEXTO.Value+'-'+tblInventarioProdDESCRIPCION.Value;
end;

end.
