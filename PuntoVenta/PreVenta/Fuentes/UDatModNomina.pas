unit UDatModNomina;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmNomina = class(TDataModule)
    tblNomina: TIBDataSet;
    qryEmpleados: TIBQuery;
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
    dstblNomina: TDataSource;
    dsqryEmpleados: TDataSource;
    qryDeducciones: TIBQuery;
    qryDeduccionesTIPO_NOMINA: TIntegerField;
    qryDeduccionesCODIGO_DESCUENTO: TSmallintField;
    qryDeduccionesFECHA_INICIAL: TDateTimeField;
    qryDeduccionesFECHA_FINAL: TDateTimeField;
    qryDeduccionesPORCIENTO_EMP: TFloatField;
    qryDeduccionesPORCIENTO_EMPLEADOR: TFloatField;
    qryDeduccionesDESCRIPCION: TIBStringField;
    qryDeduccionesSTATUS: TIBStringField;
    tblPrestamo: TIBDataSet;
    tblPrestamoNUMERO: TIntegerField;
    tblPrestamoCODIGO_EMP: TIntegerField;
    tblPrestamoRUTA: TIntegerField;
    tblPrestamoFECHA: TDateTimeField;
    tblPrestamoTIPO_PRESTAMO: TSmallintField;
    tblPrestamoCUOTAS: TFloatField;
    tblPrestamoPORC_INTERES: TFloatField;
    tblPrestamoMONTO_PRESTAMO: TFloatField;
    tblPrestamoMONTO_PAGADO: TFloatField;
    tblPrestamoFECHA_ULTIMO_PAGO: TDateTimeField;
    tblPrestamoSTATUS: TIBStringField;
    tblPrestamoIN_POR: TIBStringField;
    tblPrestamoFECHA_IN: TDateTimeField;
    tblPrestamoMOD_POR: TIBStringField;
    tblPrestamoFECHA_MOD: TDateTimeField;
    tblNominaSERIE_NOMINA: TIntegerField;
    tblNominaCIA_KEY: TSmallintField;
    tblNominaTIPO_NOMINA: TSmallintField;
    tblNominaCODIGO_EMP: TIntegerField;
    tblNominaFECHA_NOMINA: TDateTimeField;
    tblNominaSALARIO_BRUTO: TFloatField;
    tblNominaIDSS: TFloatField;
    tblNominaCOOPERATIVA: TFloatField;
    tblNominaMONTO_AFP: TFloatField;
    tblNominaSEGURO_MEDICO: TFloatField;
    tblNominaISR: TFloatField;
    tblNominaOTROS_INGRESOS: TFloatField;
    tblNominaOTRAS_DEDUCCIONES: TFloatField;
    tblNominaSALARIO_NETO: TFloatField;
    tblNominaFECHA_IN: TDateTimeField;
    tblNominaCODIGO_USUARIO: TIntegerField;
    tblNominaSTATUS_NOMINA: TIBStringField;
    tblNominaNUMERO_CKS: TIntegerField;
    tblNominaCUOTA_PRESTAMO: TFloatField;
    tblNominaTSS: TFloatField;
    tblNominaCOMISION: TFloatField;
    qryDatosComision: TIBQuery;
    tblControl: TIBDataSet;
    tblControlFECHA_ACT: TDateTimeField;
    tblControlSISTEMA: TIntegerField;
    tblControlSUB_SISTEMA: TIntegerField;
    qryRepNomina: TIBQuery;
    qryRepNominaSERIE_NOMINA: TIntegerField;
    qryRepNominaCIA_KEY: TSmallintField;
    qryRepNominaTIPO_NOMINA: TSmallintField;
    qryRepNominaCODIGO_EMP: TIntegerField;
    qryRepNominaFECHA_NOMINA: TDateTimeField;
    qryRepNominaSALARIO_BRUTO: TFloatField;
    qryRepNominaIDSS: TFloatField;
    qryRepNominaCOOPERATIVA: TFloatField;
    qryRepNominaMONTO_AFP: TFloatField;
    qryRepNominaSEGURO_MEDICO: TFloatField;
    qryRepNominaISR: TFloatField;
    qryRepNominaOTROS_INGRESOS: TFloatField;
    qryRepNominaOTRAS_DEDUCCIONES: TFloatField;
    qryRepNominaSALARIO_NETO: TFloatField;
    qryRepNominaFECHA_IN: TDateTimeField;
    qryRepNominaCODIGO_USUARIO: TIntegerField;
    qryRepNominaSTATUS_NOMINA: TIBStringField;
    qryRepNominaNUMERO_CKS: TIntegerField;
    qryRepNominaCUOTA_PRESTAMO: TFloatField;
    qryRepNominaTSS: TFloatField;
    qryRepNominaCOMISION: TFloatField;
    qryRepNominaNOMBRE: TIBStringField;
    qryRepNominaAPELLIDO: TIBStringField;
    qryRepNominaCEDULA: TIBStringField;
    qryDatosComisionCODIGO_EMP: TIntegerField;
    qryDatosComisionCODIGO_RUTA: TIntegerField;
    qryDatosComisionTIPO_COMISION: TIntegerField;
    qryDatosComisionCODIGO_PROD: TIBStringField;
    qryDatosComisionMONTO_COMISION: TFloatField;
    qryDatosComisionCANT_CAJAS_VENDIDAS: TFloatField;
    qryDatosComisionCOMISION_NETA: TFloatField;
    qryTipoNomina: TIBQuery;
    qryTipoNominaCODIGO: TIntegerField;
    qryTipoNominaDESCRIPCION: TIBStringField;
    qryTipoNominaOBSERVACIONES: TIBStringField;
    qryTipoNominaSTATUS_TIPO_NOMINA: TIBStringField;
    dsqryTipoNomina: TDataSource;
    procedure tblNominaSALARIO_BRUTOChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmNomina: TdmNomina;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmNomina.tblNominaSALARIO_BRUTOChange(Sender: TField);
begin
  tblNominaSALARIO_NETO.Value:=
  tblNominaSALARIO_BRUTO.Value  +
  tblNominaCOMISION.Value       +
  tblNominaOTROS_INGRESOS.Value -
  ( tblNominaCOOPERATIVA.Value  +
            tblNominaTSS.Value  +
      tblNominaMONTO_AFP.Value  +
  tblNominaSEGURO_MEDICO.Value  +
  tblNominaOTRAS_DEDUCCIONES.Value +
  tblNominaISR.Value +
  tblNominaCUOTA_PRESTAMO.Value);
end;

end.
