unit UDatModControl;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet;

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
    procedure qryControlAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmControl: TdmControl;

implementation

uses UDatModCon, uglobal;

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

end.
