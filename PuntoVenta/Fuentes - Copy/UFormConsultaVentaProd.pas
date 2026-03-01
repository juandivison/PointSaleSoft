unit UFormConsultaVentaProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, RXDBCtrl, WinSkinData;

type
  TfrmConsultaProdVenta = class(TForm)
    edtIni: TEdit;
    edtFin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaProdVenta: TfrmConsultaProdVenta;

implementation

uses UDatModReportes, URepProdMasVenta;

{$R *.dfm}

procedure TfrmConsultaProdVenta.BitBtn2Click(Sender: TObject);
begin
  qckProdMasVendidos:=TqckProdMasVendidos.Create(Nil);
  try
    qckProdMasVendidos.Preview;
  finally
  qckProdMasVendidos.free;
  qckProdMasVendidos:=nil;
  end;
end;

procedure TfrmConsultaProdVenta.BitBtn1Click(Sender: TObject);
begin
  dmReportes.qryProdMasVendido.Close;
  dmReportes.qryProdMasVendido.Params[0].Value:= StrToInt(edtIni.Text);
  dmReportes.qryProdMasVendido.Params[1].Value:= StrToInt(edtFin.Text);
  dmReportes.qryProdMasVendido.Open;
end;

end.
