unit UFormConsultaNoVentaProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, RXDBCtrl, WinSkinData;

type
  TfrmConsultaFechaUltmaVta = class(TForm)
    edtIni: TEdit;
    edtFin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    CheckBox1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaFechaUltmaVta: TfrmConsultaFechaUltmaVta;

implementation

uses UDatModReportes, URepProdMasVenta, URepProdMasVentaFUltVta;

{$R *.dfm}

procedure TfrmConsultaFechaUltmaVta.BitBtn2Click(Sender: TObject);
begin
  qckProdFUltVta:=TqckProdFUltVta.Create(Nil);
  try
    qckProdFUltVta.Preview;
  finally
  qckProdFUltVta.free;
  qckProdFUltVta:=nil;
  end;
end;

procedure TfrmConsultaFechaUltmaVta.BitBtn1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
    dmReportes.qryFechaUltVtaProd.Close;
    dmReportes.qryFechaUltVtaProd.SQL.Text:= dmReportes.qryFechaUltVtaProd_1.SQL.Text;
    dmReportes.qryFechaUltVtaProd.Params[0].Value:= StrToInt(edtIni.Text);
    dmReportes.qryFechaUltVtaProd.Params[1].Value:= StrToInt(edtFin.Text);
    dmReportes.qryFechaUltVtaProd.Open;
  end else
  begin
    dmReportes.qryFechaUltVtaProd.Close;
    dmReportes.qryFechaUltVtaProd.SQL.Text:= dmReportes.qryFechaUltVtaProd_0.SQL.Text;
    dmReportes.qryFechaUltVtaProd.Open;
  end;
end;

procedure TfrmConsultaFechaUltmaVta.CheckBox1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
    edtIni.Hint:= 'Indique cantidad de dias con venta';
    edtFin.Hint:= 'Indique cantidad de dias con venta';
  end else
  begin
    edtIni.Hint:= 'Indique cantidad de dias sin venta';
    edtFin.Hint:= 'Indique cantidad de dias sin venta';
  end;
end;

end.
