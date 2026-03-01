unit UDatModTransCnt;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBSQL;

type
  TdmTransCnt = class(TDataModule)
    tblTransCntMaster: TIBDataSet;
    tblTransCntDet: TIBDataSet;
    tblTransCntMasterNUMERO: TIntegerField;
    tblTransCntMasterFECHA: TDateTimeField;
    tblTransCntMasterTIPO_DOC: TSmallintField;
    tblTransCntMasterDESCRIPCION: TIBStringField;
    tblTransCntMasterMONTO: TFloatField;
    tblTransCntMasterSTATUS: TIBStringField;
    tblTransCntMasterIN_POR: TIBStringField;
    tblTransCntMasterFECHA_IN: TDateTimeField;
    tblTransCntMasterMOD_POR: TIBStringField;
    tblTransCntMasterFECHA_MOD: TDateTimeField;
    tblDeptos: TIBQuery;
    tblDeptosCODIGO: TSmallintField;
    tblDeptosNOMBRE: TIBStringField;
    tblCentroDeCosto: TIBQuery;
    tblCentroDeCostoCODIGO: TIntegerField;
    tblCentroDeCostoDESCRIPCION: TIBStringField;
    tblTipodoc: TIBQuery;
    tblTipodocCODIGO: TSmallintField;
    tblTipodocCODIGO_ABR: TIBStringField;
    tblTipodocDESCRIPCION: TIBStringField;
    ibsqlUpdateStatusContrato: TIBSQL;
    tblTransCntDetSERIE: TFloatField;
    tblTransCntDetNUMERO: TIntegerField;
    tblTransCntDetCODIGO_DEPTO: TIntegerField;
    tblTransCntDetDESCRIPCION_TRN: TIBStringField;
    tblTransCntDetDEBITO_TRN: TFloatField;
    tblTransCntDetCREDITO_TRN: TFloatField;
    tblTransCntDetCUENTA1: TIBStringField;
    tblTransCntDetCUENTA2: TIBStringField;
    tblTransCntDetCUENTA3: TIBStringField;
    tblTransCntDetSTATUS_APLICADA: TIBStringField;
    tblTransCntDetSTATUS: TIBStringField;
    tblTransCntDetIN_POR: TIBStringField;
    tblTransCntDetFECHA_IN: TDateTimeField;
    tblTransCntDetMOD_POR: TIBStringField;
    tblTransCntDetFECHA_MOD: TDateTimeField;
    tblTransCntDetNUM_DOC: TFloatField;
    tblTransCntDetCOD_CTA_CONCEPTO: TIntegerField;
    tblTransCntDetCODIGO_CENTRO_COSTO: TIntegerField;
    procedure tblTransCntDetBeforePost(DataSet: TDataSet);
    procedure tblTransCntMasterAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTransCnt: TdmTransCnt;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TdmTransCnt.tblTransCntDetBeforePost(DataSet: TDataSet);
begin
  tblTransCntDetNUMERO.Value:=tblTransCntMasterNUMERO.Value;
end;

procedure TdmTransCnt.tblTransCntMasterAfterScroll(DataSet: TDataSet);
begin
  tblTransCntDet.Close;
  tblTransCntDet.Params[0].Value:= tblTransCntMasterNUMERO.Value;
  tblTransCntDet.Open;
end;

end.
