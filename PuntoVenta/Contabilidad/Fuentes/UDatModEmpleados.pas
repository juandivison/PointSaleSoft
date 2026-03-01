unit UDatModEmpleados;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

type
  TdmEmpleados = class(TDataModule)
    tblEmpleados: TIBDataSet;
    tblRuta: TIBTable;
    tblRutaCODIGO: TIntegerField;
    tblRutaCODIGO_EMP: TIntegerField;
    tblRutaFICHA: TIntegerField;
    tblRutaFECHA: TDateTimeField;
    tblRutaSTATUS: TIBStringField;
    tblEmpleadosCODIGO: TIntegerField;
    tblEmpleadosCODIGO_CIA: TIntegerField;
    tblEmpleadosNOMBRE: TIBStringField;
    tblEmpleadosAPELLIDO: TIBStringField;
    tblEmpleadosCEDULA: TIBStringField;
    tblEmpleadosFOTO: TBlobField;
    tblEmpleadosPASSPORT: TIBStringField;
    tblEmpleadosCALLE: TIBStringField;
    tblEmpleadosNUM_CASA: TSmallintField;
    tblEmpleadosCIUDAD: TIBStringField;
    tblEmpleadosPAIS: TIBStringField;
    tblEmpleadosTELEF_CASA: TIBStringField;
    tblEmpleadosTELEF_OFICINA: TIBStringField;
    tblEmpleadosCELULAR: TIBStringField;
    tblEmpleadosEMAIL: TIBStringField;
    tblEmpleadosSEXO: TIBStringField;
    tblEmpleadosESTADO_CIVIL: TIBStringField;
    tblEmpleadosTELEF_REFERENCIA: TIBStringField;
    tblEmpleadosNOMBRE_REFERENCIA: TIBStringField;
    tblEmpleadosFECHA_NAC: TDateTimeField;
    tblEmpleadosNACIONALIDAD: TIBStringField;
    tblEmpleadosFECHA_ENTRADA: TDateTimeField;
    tblEmpleadosFECHA_SALIDA: TDateTimeField;
    tblEmpleadosSALARIO: TFloatField;
    tblEmpleadosTIPO_NOMINA: TSmallintField;
    tblEmpleadosTIPO_EMPLEADO: TSmallintField;
    tblEmpleadosDEPTO_EMP: TSmallintField;
    tblEmpleadosSECCION: TSmallintField;
    tblEmpleadosCARGO: TSmallintField;
    tblEmpleadosPAGA_AFP: TSmallintField;
    tblEmpleadosPAGA_TSS: TSmallintField;
    tblEmpleadosSTATUS: TIBStringField;
    tblEmpleadosFECHA_IN: TDateTimeField;
    tblEmpleadosIN_POR: TIBStringField;
    tblEmpleadosFECHA_MOD: TDateTimeField;
    tblEmpleadosMOD_POR: TIBStringField;
    procedure tblRutaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEmpleados: TdmEmpleados;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TdmEmpleados.tblRutaAfterScroll(DataSet: TDataSet);
begin
  if tblEmpleados.state = dsBrowse then
  tblEmpleados.Locate('codigo',tblRutaCODIGO_EMP.Value,[])
end;

end.
