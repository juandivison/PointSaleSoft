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

  {if (GlbActivaIFiscal = 1 ) then
  dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text
  else
  dmFactura.ibQryViewNCF.SQL.Text := 'select v.*, -1 as TIPO_NCF_IFISCAL, 1000 as tipo_ncfNCR  from view_nfc v';
  if Not dmFactura.ibQryViewNCF.Prepared then
  dmFactura.ibQryViewNCF.Prepare;
  dmFactura.ibQryViewNCF.Open;}

  //t if (GlbActivaIFiscal = 1 ) then
  //t begin
    //t if dmFactura.ibQryViewNCF.Prepared then
    //t dmFactura.ibQryViewNCF.UnPrepare;
    //t dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  //t end;// else
  //dmFactura.ibQryViewNCF.SQL.Text := 'select v.*, -1 as TIPO_NCF_IFISCAL, 1000 as tipo_ncfNCR  from view_nfc v';
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
