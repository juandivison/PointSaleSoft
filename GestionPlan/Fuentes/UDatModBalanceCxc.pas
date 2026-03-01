unit UDatModBalanceCxc;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBSQL, IBQuery;

type
  TdmBalanceCxc = class(TDataModule)
    qryBalanceCte: TIBDataSet;
    qryBalanceCteCODIGO: TIntegerField;
    qryBalanceCteSERVICIO: TIntegerField;
    qryBalanceCteMONEDA: TIBStringField;
    qryBalanceCteBALANCE_ACT: TFloatField;
    qryBalanceCteBALANCE_ANT: TFloatField;
    qryBalanceCteDEBITO_MES: TFloatField;
    qryBalanceCteCREDITO_MES: TFloatField;
    qryBalanceCteDEBITO_ACM: TFloatField;
    qryBalanceCteCREDITO_ACM: TFloatField;
    qryBalanceCteFECHA_BCE: TDateTimeField;
    qryBalanceCteFECHA_ULT_PAGO: TDateTimeField;
    qryBalanceCteSTATUS_BCE: TIBStringField;
    qryBalanceCteFECHA_IN: TDateTimeField;
    qryBalanceCteIN_POR: TIBStringField;
    qryBalanceCteFECHA_MOD: TDateTimeField;
    qryBalanceCteMOD_POR: TIBStringField;
    qryBalanceCteNOMBRE_FACTURAR: TIBStringField;
    qryBalanceCteTELEF_CONTACTO: TIBStringField;
    qryBalanceCteCONTACTO: TIBStringField;
    qryTotalCxc: TIBSQL;
    qryBalanceCteFOTO: TBlobField;
    qryTotalCxP: TIBSQL;
    qryBalancePlanF: TIBQuery;
    dsqryBalancePlanF: TDataSource;
    qryBalancePlanFBALANCE_ACT: TFloatField;
    qryBalancePlanFBALANCE_ANT: TFloatField;
    qryBalancePlanFCODIGO: TIntegerField;
    qryBalancePlanFCREDITO_ACM: TFloatField;
    qryBalancePlanFDEBITO_ACM: TFloatField;
    qryBalancePlanFFECHA_BLCE: TDateTimeField;
    qryBalancePlanFFECHA_ULT_PAGO: TDateTimeField;
    qryBalancePlanFSTATUS: TIBStringField;
    qryBalancePlanFNOMBRE_FACTURAR: TIBStringField;
    qryBalancePlanFTELEF_CONTACTO: TIBStringField;
    qryBalancePlanFCONTACTO: TIBStringField;
    qryBalancePlanFFOTO: TBlobField;
    qryTotalBalancePF: TIBSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBalanceCxc: TdmBalanceCxc;

implementation

uses UDatModConectar;

{$R *.dfm}

end.
