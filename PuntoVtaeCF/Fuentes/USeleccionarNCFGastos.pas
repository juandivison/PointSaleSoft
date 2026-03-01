unit USeleccionarNCFGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, WinSkinData;

type
  TfrmSelNCFGastos = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelNCFGastos: TfrmSelNCFGastos;

implementation
  uses UDatModFactura, uglobal;
{$R *.dfm}


procedure TfrmSelNCFGastos.FormCreate(Sender: TObject);
begin
  dmFactura.ibQryViewNCF.Close;
  if Not dmFactura.ibQryViewNCFGastos.Prepared then
  dmFactura.ibQryViewNCFGastos.Prepare;

  dmFactura.ibQryViewNCFGastos.Open;

  dmFactura.ibQryViewNCFGastos.Open;
end;

procedure TfrmSelNCFGastos.FormShow(Sender: TObject);
begin
  BitBtn1.SetFocus;
end;

end.
