unit UDatModBalanceCxc;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBSQL;

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
