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
    qryControlMaster: TIBQuery;
    qryControlMasterSISTEMA: TIntegerField;
    qryControlMasterSUB_SISTEMA: TIntegerField;
    qryControlMasterCOD_CIA: TIntegerField;
    qryControlMasterFECHA_ACT: TDateTimeField;
    qryControlMasterDESCRIPCION: TIBStringField;
    qryControlMasterSTATUS: TIBStringField;
    qryControlDetalle: TIBQuery;
    procedure qryControlAfterScroll(DataSet: TDataSet);
    procedure qryControlMasterAfterScroll(DataSet: TDataSet);
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

procedure TdmControl.qryControlMasterAfterScroll(DataSet: TDataSet);
var
  diasT,Anio, mes, dia:word;
  fechai, fechafin:TDatetime;
begin
  decodeDate(qrycontrolMasterfecha_Act.Value,anio,mes,dia);
  diasT   :=DiasEnElMes(anio, mes);
  fechai  :=EncodeDate(anio, mes, 1);
  fechafin:=EncodeDate(anio, mes, diasT);

  qrycontroldetalle.Close;
  qrycontroldetalle.params[0].Value := qrycontrolMasterSistema.Value;
  qrycontroldetalle.params[1].Value := qrycontrolMasterSub_Sistema.Value;
  qrycontroldetalle.params[2].Value := qrycontrolMasterCod_cia.Value;
  qrycontroldetalle.params[3].Value := ExtraerFecha(fechai);
  qrycontroldetalle.params[4].Value := ExtraerFecha(fechafin);
  qrycontroldetalle.Open;
end;

end.
