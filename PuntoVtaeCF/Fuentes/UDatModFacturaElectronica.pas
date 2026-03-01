unit UDatModFacturaElectronica;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet;

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
