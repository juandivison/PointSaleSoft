unit UGarantiasEliminadas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl,
  WinSkinData, IBSQL;

type
  TfrmRecuperaGEliminada = class(TForm)
    tblGarantiasEliminadas: TIBDataSet;
    tblGarantiasEliminadasNUMERO: TIntegerField;
    tblGarantiasEliminadasCODIGO_CTE: TIntegerField;
    tblGarantiasEliminadasFECHA_APERTURA: TDateTimeField;
    tblGarantiasEliminadasFECHA_VENCE_SEGURO: TDateTimeField;
    tblGarantiasEliminadasTIPO_AFILIADO: TSmallintField;
    tblGarantiasEliminadasPLACA: TIBStringField;
    tblGarantiasEliminadasIDMARCA: TIntegerField;
    tblGarantiasEliminadasMODELO: TIBStringField;
    tblGarantiasEliminadasANO_VEH: TIntegerField;
    tblGarantiasEliminadasTIPO_SEGURO: TSmallintField;
    tblGarantiasEliminadasCIA_SEGURO: TIBStringField;
    tblGarantiasEliminadasEMPRESA_LABORA: TIBStringField;
    tblGarantiasEliminadasFECHA_IN: TDateTimeField;
    tblGarantiasEliminadasIN_POR: TIBStringField;
    tblGarantiasEliminadasCODIGO_DEALER: TIntegerField;
    tblGarantiasEliminadasCODIGO_AGENCIA: TIntegerField;
    tblGarantiasEliminadasCOLOR: TIBStringField;
    tblGarantiasEliminadasNUM_CERTIFICADO: TIntegerField;
    tblGarantiasEliminadasCHASSIS: TIBStringField;
    tblGarantiasEliminadasNUMPOL: TIntegerField;
    tblGarantiasEliminadasSTATUSCXC: TIBStringField;
    tblGarantiasEliminadasPOLIZA_ESPECIAL: TSmallintField;
    tblGarantiasEliminadasRUTA_FILEAUTH: TIBStringField;
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    ibsqlEliminar: TIBSQL;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ProcElimina(num:integer);
  end;

var
  frmRecuperaGEliminada: TfrmRecuperaGEliminada;

implementation

uses UDatModConectar;

{$R *.dfm}

{ TfrmRecuperaGEliminada }

procedure TfrmRecuperaGEliminada.ProcElimina(num: integer);
begin
  ibsqlEliminar.Params[0].Value:=num;
  ibsqlEliminar.ExecQuery;
  try
    if not ibsqlEliminar.Transaction.InTransaction then
    ibsqlEliminar.Transaction.StartTransaction;
    ibsqlEliminar.Transaction.CommitRetaining;
  except
  ibsqlEliminar.Transaction.RollbackRetaining;
  end;
end;

end.
