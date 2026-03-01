unit UcheckSecNCF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, WinSkinData,
  RXCtrls;

type
  TfrmCheckNCFSec = class(TForm)
    dsCheckNCFSec: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn6: TBitBtn;
    SkinData1: TSkinData;
    Label1: TLabel;
    RxLabel1: TRxLabel;
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
  private
    { Private declarations }
  public
    { Public declarations }
    function VerificaStatus:Boolean;
  end;

var
  frmCheckNCFSec: TfrmCheckNCFSec;

implementation

uses UDatModFactura;

{$R *.dfm}

procedure TfrmCheckNCFSec.FormCreate(Sender: TObject);
begin
  dmFactura.qryCheckNCFSec.Close;
  dmFactura.qryCheckNCFSec.Open;
end;

procedure TfrmCheckNCFSec.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if dmFactura.qryCheckNCFSecSTATUS.Value = 1 then
  begin
    BackGround := clYellow;
    Afont.Style := [fsBold];
  end else
  if dmFactura.qryCheckNCFSecSTATUS.Value = 2 then
  begin
    BackGround := clRed;
    Afont.Style := [fsBold];
  end;
end;

function TfrmCheckNCFSec.VerificaStatus: Boolean;
begin
  if dmFactura.qryCheckNCFSec.State = dsInactive then
  dmFactura.qryCheckNCFSec.Open;
  dmFactura.qryCheckNCFSec.First;
  dmFactura.qryCheckNCFSec.DisableControls;
  Result:=True;
  While Not dmFactura.qryCheckNCFSec.Eof Do
  begin
    if dmFactura.qryCheckNCFSecSTATUS.Value In [1,2] then
    Result := false;
    //else Result := False;
    dmFactura.qryCheckNCFSec.Next;
  end;
  dmFactura.qryCheckNCFSec.EnableControls;

end;

end.
