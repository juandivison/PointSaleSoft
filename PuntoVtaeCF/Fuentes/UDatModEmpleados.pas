unit UDatModEmpleados;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable, IBQuery;

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
    dstblEmpleados: TDataSource;
    qryEmpleados: TIBQuery;
    qryEmpleadosDESC_CARGO: TIBStringField;
    qryEmpleadosNOMBREVENDEDOR: TIBStringField;
    qryEmpleadosCODIGO: TIntegerField;
    qryEmpleadosCODIGO_CIA: TIntegerField;
    qryEmpleadosNOMBRE: TIBStringField;
    qryEmpleadosAPELLIDO: TIBStringField;
    qryEmpleadosCEDULA: TIBStringField;
    qryEmpleadosFOTO: TBlobField;
    qryEmpleadosPASSPORT: TIBStringField;
    qryEmpleadosCALLE: TIBStringField;
    qryEmpleadosNUM_CASA: TSmallintField;
    qryEmpleadosCIUDAD: TIBStringField;
    qryEmpleadosPAIS: TIBStringField;
    qryEmpleadosTELEF_CASA: TIBStringField;
    qryEmpleadosTELEF_OFICINA: TIBStringField;
    qryEmpleadosCELULAR: TIBStringField;
    qryEmpleadosEMAIL: TIBStringField;
    qryEmpleadosSEXO: TIBStringField;
    qryEmpleadosESTADO_CIVIL: TIBStringField;
    qryEmpleadosTELEF_REFERENCIA: TIBStringField;
    qryEmpleadosNOMBRE_REFERENCIA: TIBStringField;
    qryEmpleadosFECHA_NAC: TDateTimeField;
    qryEmpleadosNACIONALIDAD: TIBStringField;
    qryEmpleadosFECHA_ENTRADA: TDateTimeField;
    qryEmpleadosFECHA_SALIDA: TDateTimeField;
    qryEmpleadosSALARIO: TFloatField;
    qryEmpleadosTIPO_NOMINA: TSmallintField;
    qryEmpleadosTIPO_EMPLEADO: TSmallintField;
    qryEmpleadosDEPTO_EMP: TSmallintField;
    qryEmpleadosSECCION: TSmallintField;
    qryEmpleadosCARGO: TSmallintField;
    qryEmpleadosPAGA_AFP: TSmallintField;
    qryEmpleadosPAGA_TSS: TSmallintField;
    qryEmpleadosSTATUS: TIBStringField;
    qryEmpleadosFECHA_IN: TDateTimeField;
    qryEmpleadosIN_POR: TIBStringField;
    qryEmpleadosFECHA_MOD: TDateTimeField;
    qryEmpleadosMOD_POR: TIBStringField;
    qryEmpleadosLICENCIA: TIBStringField;
    qryEmpleadosFECHA_VENCE_LICENCIA: TDateTimeField;
    qryEmpleadosFECHAVACACIONES: TDateTimeField;
    procedure tblRutaAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEmpleados: TdmEmpleados;

implementation

uses UGlobal, UDatModConectar;

{$R *.dfm}

procedure TdmEmpleados.tblRutaAfterScroll(DataSet: TDataSet);
begin
  if tblEmpleados.state = dsBrowse then
  tblEmpleados.Locate('codigo',tblRutaCODIGO_EMP.Value,[])
end;

end.
