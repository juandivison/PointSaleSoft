unit UDatModITBIS;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBTable;

type
  TdmItbis = class(TDataModule)
    tblItbis: TIBTable;
    dstblItbis: TDataSource;
    tblItbisGRUPO: TSmallintField;
    tblItbisFECHA_INI: TDateTimeField;
    tblItbisFECHA_FIN: TDateTimeField;
    tblItbisPORCIENTO: TFloatField;
    tblItbisOBSERVACIONES: TIBStringField;
    tblItbisSTATUS: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmItbis: TdmItbis;

implementation

uses UDatModCon;

{$R *.dfm}

end.
