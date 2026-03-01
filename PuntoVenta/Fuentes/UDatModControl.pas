unit UDatModControl;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TdmControl = class(TDataModule)
    qryControl: TIBDataSet;
    qryControlDet: TIBDataSet;
    qryControlSISTEMA: TIntegerField;
    qryControlSUB_SISTEMA: TIntegerField;
    qryControlCOD_CIA: TIntegerField;
    qryControlFECHA_ACT: TDateTimeField;
    qryControlDESCRIPCION: TIBStringField;
    qryControlSTATUS: TIBStringField;
    qryControlFECHA_IN: TDateTimeField;
    qryControlIN_POR: TIBStringField;
    qryControlFECHA_MOD: TDateTimeField;
    qryControlMOD_POR: TIBStringField;
    qryControlDetSERIE: TFloatField;
    qryControlDetSISTEMA: TIntegerField;
    qryControlDetSUB_SISTEMA: TIntegerField;
    qryControlDetCOD_CIA: TIntegerField;
    qryControlDetFECHA_ACT: TDateTimeField;
    qryControlDetSTATUS: TIBStringField;
    qryControlDetFECHA_IN: TDateTimeField;
    qryControlDetIN_POR: TIBStringField;
    qryControlDetFECHA_MOD: TDateTimeField;
    qryControlDetMOD_POR: TIBStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    tblControlCierreZ: TIBDataSet;
    tblControlCierreZSISTEMA: TIntegerField;
    tblControlCierreZSUB_SISTEMA: TIntegerField;
    tblControlCierreZCOD_CIA: TIntegerField;
    tblControlCierreZFECHA_ACT: TDateTimeField;
    tblControlCierreZDESCRIPCION: TIBStringField;
    tblControlCierreZSTATUS: TIBStringField;
    tblControlCierreZFECHA_IN: TDateTimeField;
    tblControlCierreZIN_POR: TIBStringField;
    tblControlCierreZFECHA_MOD: TDateTimeField;
    tblControlCierreZMOD_POR: TIBStringField;
    tblControlCierreZFECHA_ULT_CIERREZ: TDateTimeField;
    qryCierreZ: TIBQuery;
    qryCierreZFECHA_ULT_CIERREZ: TDateTimeField;
    qryCierreZSTATUS: TIBStringField;
    qryVerificaCierreZ: TIBQuery;
    qryVerificaCierreZFECHA_ULT_CIERREZ: TDateTimeField;
    qryVerificaCierreZHORAS_TRANSCURRIDAS: TFloatField;
    qryControlFECHA_ULT_CIERREZ: TDateTimeField;
    procedure qryControlAfterScroll(DataSet: TDataSet);
    procedure qryControlDetAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControl: TdmControl;

implementation

uses UDatModConectar, uglobal;

{$R *.dfm}

procedure TdmControl.qryControlAfterScroll(DataSet: TDataSet);
var
  diasT,Anio, mes, dia:word;
  fechai, fechafin:TDatetime;
begin
  decodeDate(qrycontrolfecha_Act.Value,anio,mes,dia);
  diasT:=DiasEnElMes(anio,mes);
  fechai:=EncodeDate(anio,mes,1);
  fechafin:=EncodeDate(anio,mes,diasT);
  
  qrycontroldet.DisableControls;
  qrycontroldet.Close;
  qrycontroldet.params[0].Value := qrycontrolsistema.Value;
  qrycontroldet.params[1].Value := qrycontrolsub_sistema.Value;
  qrycontroldet.params[2].Value := qrycontrolcod_cia.Value;
  qrycontroldet.params[3].Value := ExtraerFecha(fechai);
  qrycontroldet.params[4].Value := ExtraerFecha(fechafin);
  qrycontroldet.Open;
  qrycontroldet.EnableControls;
end;

procedure TdmControl.qryControlDetAfterInsert(DataSet: TDataSet);
begin
  if qryControlDet.State = dsInsert then
  qryControlDetSERIE.Value:= FsqlMaxNumero('control_det','serie');
end;

end.
