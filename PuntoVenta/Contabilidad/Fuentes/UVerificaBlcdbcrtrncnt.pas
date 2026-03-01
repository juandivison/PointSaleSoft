unit UVerificaBlcdbcrtrncnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, DBCtrls,
  IBCustomDataSet, IBQuery, WinSkinData;

type
  TfrmVeriDbcrtrncnt = class(TForm)
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    btnBoton: TBitBtn;
    btnboton2: TBitBtn;
    dtqryDbCr: TDataSource;
    qryDbCr: TIBQuery;
    qryDbCrFECHA: TDateTimeField;
    qryDbCrDEBITO_TRN: TFloatField;
    qryDbCrCREDITO_TRN: TFloatField;
    SkinData1: TSkinData;
    procedure btnBotonClick(Sender: TObject);
    procedure btnboton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVeriDbcrtrncnt: TfrmVeriDbcrtrncnt;

implementation

uses UDatModConectar, uglobal;

{$R *.dfm}

procedure TfrmVeriDbcrtrncnt.btnBotonClick(Sender: TObject);
begin
  qrydbcr.close;
  close;
end;

procedure TfrmVeriDbcrtrncnt.btnboton2Click(Sender: TObject);
begin
  GlbProcede:=false;
  qrydbcr.close;
  close;
end;

procedure TfrmVeriDbcrtrncnt.FormShow(Sender: TObject);
begin
  if qrydbcr.RecordCount = 1 then
      frmveridbcrtrncnt.Height:=175;
end;

procedure TfrmVeriDbcrtrncnt.FormCreate(Sender: TObject);
var
  debito, credito:Real;
begin
  qrydbcr.Close;
  qrydbcr.Params[0].Value := glbfechainicial;
  qrydbcr.Params[1].Value := glbfechainicial;
  qrydbcr.Open;
  qrydbcr.First;
  debito:=0;
  credito:=0;
  if qrydbcr.RecordCount > 1 then
  begin
    frmveridbcrtrncnt.Height:=273;
  end else
  Begin
    btnBoton.Top:=72;
    btnboton2.top:=72;
    dbgrid1.Visible:=False;
  end;
  while not qrydbcr.Eof do
  begin
    debito :=debito  + qrydbcrdebito_trn.Value;
    credito:=credito + qrydbcrcredito_trn.Value;
    qrydbcr.next;
  end;
  label3.Caption:= InsertarComa(Format('%8.2f',[debito]));
  label4.Caption:= InsertarComa(Format('%8.2f',[credito]));
  if label3.Caption = label4.caption then
  GlbProcede:=true else GlbProcede:=false;
end;

end.
