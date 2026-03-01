unit UDatModRuta;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBTable;

type
  TdmRutas = class(TDataModule)
    tblRutas: TIBDataSet;
    tblRutasCODIGO: TIntegerField;
    tblRutasCODIGO_EMP: TIntegerField;
    tblRutasFICHA: TIntegerField;
    tblRutasFECHA: TDateTimeField;
    tblRutasSTATUS: TIBStringField;
    qryEmpleados: TIBQuery;
    qryEmpleadosAPELLIDO: TIBStringField;
    qryEmpleadosNOMBRE: TIBStringField;
    qryEmpleadosCODIGO: TIntegerField;
    qryEmpleadosNOMBRE_EMPLEADO: TIBStringField;
    tblTipoComision: TIBTable;
    tblRutasTIPO_COMISION: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRutas: TdmRutas;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
