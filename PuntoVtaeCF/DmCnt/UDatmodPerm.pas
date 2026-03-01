unit UDatmodPerm;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet;

type
  TdmPerm = class(TDataModule)
    qryLogErrores: TIBDataSet;
    dtqryLogErrores: TDataSource;
    qryLogErroresSERIE: TIntegerField;
    qryLogErroresFECHA: TDateTimeField;
    qryLogErroresUSUARIO: TIBStringField;
    qryLogErroresMODULO: TIBStringField;
    qryLogErroresUNIDAD: TIBStringField;
    qryLogErroresDESCRIPCION: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPerm: TdmPerm;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
