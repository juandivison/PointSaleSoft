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
    procedure ProcAsignaQuery;
  public
    { Public declarations }
  end;

var
  frmSelNCFGastos: TfrmSelNCFGastos;

implementation
  uses UDatModFactura, uglobal;
{$R *.dfm}

procedure TfrmSelNCFGastos.ProcAsignaQuery;
begin
  dmFactura.ibQryViewNCFGastos.Close;
  dmFactura.ibQryViewNCFGastos.SQL.Text := dmFactura.ibQryViewNCFGastos_0.SQL.Text;
  if GlbActivaECF = 1 then
    begin
      dmFactura.ibQryViewNCFGastos.SQL.Add(Format('Where v.TIPO_CF in (%s,%s)',['41','43']));
      dmFactura.ibQryViewNCFGastos.SQL.Add('order by v.TIPO_CF');
    end else
    begin
      dmFactura.ibQryViewNCFGastos.SQL.Add(Format('Where v.TIPO_CF in (%s)',['11']));
      dmFactura.ibQryViewNCFGastos.SQL.Add('order by v.TIPO_CF');
    end;
  dmFactura.ibQryViewNCFGastos.Open;
end;

procedure TfrmSelNCFGastos.FormCreate(Sender: TObject);
begin
  //dmFactura.ibQryViewNCF.Close;

  {if (GlbActivaIFiscal = 1 ) then
  dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text
  else
  dmFactura.ibQryViewNCF.SQL.Text := 'select v.*, -1 as TIPO_NCF_IFISCAL, 1000 as tipo_ncfNCR  from view_nfc v';
  if Not dmFactura.ibQryViewNCF.Prepared then
  dmFactura.ibQryViewNCF.Prepare;
  dmFactura.ibQryViewNCF.Open;}

  {if GlbActivaECF = 1 then
  begin
    if dmFactura.ibQryViewNCF.Prepared then
       dmFactura.ibQryViewNCF.UnPrepare;
    dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  end else
  dmFactura.ibQryViewNCF.SQL.Text := 'select v.*, -1 as TIPO_NCF_IFISCAL, 1000 as tipo_ncfNCR  from view_nfc v';

  if Not dmFactura.ibQryViewNCFGastos.Prepared then
  dmFactura.ibQryViewNCFGastos.Prepare;
  dmFactura.ibQryViewNCFGastos.Open;

  dmFactura.ibQryViewNCFGastos.Open;
  }
  ProcAsignaQuery;
end;

procedure TfrmSelNCFGastos.FormShow(Sender: TObject);
begin
  BitBtn1.SetFocus;
end;

end.
