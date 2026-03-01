unit UMostrarFinancVigente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, RXCtrls, StdCtrls, Buttons;

type
  TfrmShowFinancVigente = class(TForm)
    qryMostrarFinancVigente: TIBQuery;
    qryMostrarFinancVigenteBALANCE_ACT: TFloatField;
    qryMostrarFinancVigenteCANT_CUOTAS: TIntegerField;
    qryMostrarFinancVigenteCODIGO_CTE: TIntegerField;
    qryMostrarFinancVigenteCREDITO_ACUM: TFloatField;
    qryMostrarFinancVigenteCUOTASPEND: TIntegerField;
    qryMostrarFinancVigenteDEBITO_ACUM: TFloatField;
    qryMostrarFinancVigenteFECHA: TDateTimeField;
    qryMostrarFinancVigenteFECHA_ULT_PAGO: TDateTimeField;
    qryMostrarFinancVigenteMONTOINICIAL: TFloatField;
    qryMostrarFinancVigenteNUM_FACTURA: TIntegerField;
    qryMostrarFinancVigenteNUMERO_TRN: TIntegerField;
    qryMostrarFinancVigentePORC_MORA: TFloatField;
    qryMostrarFinancVigentePORCIENTO: TFloatField;
    qryMostrarFinancVigenteSERIE: TIntegerField;
    qryMostrarFinancVigenteSTATUS: TIBStringField;
    qryMostrarFinancVigenteDESCRIPCION: TIBStringField;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxLabel1: TRxLabel;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Titulo : String;
    procedure AbrirDatos(codigocte : integer);
  end;

var
  frmShowFinancVigente: TfrmShowFinancVigente;

implementation

uses UDatModConectar, Uglobal;

{$R *.dfm}

procedure TfrmShowFinancVigente.AbrirDatos(CodigoCte: Integer);
begin
  qryMostrarFinancVigente.Close;
  qryMostrarFinancVigente.Params[0].Value:= CodigoCte;
  qryMostrarFinancVigente.Open;
end;

procedure TfrmShowFinancVigente.FormCreate(Sender: TObject);
begin
  frmShowFinancVigente.Caption:=Titulo;
end;

end.
