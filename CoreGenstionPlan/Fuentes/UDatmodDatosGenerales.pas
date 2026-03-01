unit UDatmodDatosGenerales;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmDatos = class(TDataModule)
    qryTasa: TIBQuery;
    dsqryTasa: TDataSource;
    qryTasaSERIE: TIntegerField;
    qryTasaVALORMONEDA: TFloatField;
    qryTasaSIMBOLO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatos: TdmDatos;

implementation

uses UDatModConectar;//UDatModCon;

{$R *.dfm}

end.
