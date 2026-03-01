unit USeleccionarNCF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, WinSkinData;

type
  TfrmSelNCF = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelNCF: TfrmSelNCF;

implementation
  uses UDatModFactura, uglobal;
{$R *.dfm}


procedure TfrmSelNCF.FormCreate(Sender: TObject);
begin
  if NCFCTeNotSetup then
  begin
    if (GlbFormatoConduce = 444) then
    begin
      Label1.Visible:=True;
    end;
  end;
  dmFactura.ibQryViewNCF.Close;
  if (GlbActivaECF = 1) then
  begin
  if (GlbActivaECF = 1) then
  begin
    if dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.UnPrepare;
    dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_1.SQL.Text;
  end else
  if (GlbActivaIFiscal = 1 ) then
  begin
    if dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.UnPrepare;
    dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  end;
  dmFactura.ibQryViewNCF.Open;
  end else
  if (GlbActivaIFiscal = 1 ) then
  begin
    if dmFactura.ibQryViewNCF.Prepared then
    dmFactura.ibQryViewNCF.UnPrepare;
    dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  end;

  if Not dmFactura.ibQryViewNCF.Prepared then
  dmFactura.ibQryViewNCF.Prepare;
  dmFactura.ibQryViewNCF.Open;

end;

procedure TfrmSelNCF.FormShow(Sender: TObject);
begin
  BitBtn1.SetFocus;
end;

end.
