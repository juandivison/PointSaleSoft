unit UFormPrecioProdPorProveedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, WinSkinData, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmListadoCostoProdProveedor = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    dsqryProdPorProveedor: TDataSource;
    qryProdPorProveedor: TIBQuery;
    qryProdPorProveedorFECHA: TDateTimeField;
    qryProdPorProveedorCODIGO_PROV: TSmallintField;
    qryProdPorProveedorNOMBREPROVEEDOR: TIBStringField;
    qryProdPorProveedorPRECIO: TFloatField;
    qryProdPorProveedorTELEFONO: TIBStringField;
    qryProdPorProveedorEMAIL: TIBStringField;
  private
    { Private declarations }

  public
    procedure AbrirQuery(cod : Integer);  
    { Public declarations }
  end;

var
  frmListadoCostoProdProveedor: TfrmListadoCostoProdProveedor;

implementation

uses UProcVentaRapida,uglobal;

{$R *.dfm}

procedure TfrmListadoCostoProdProveedor.AbrirQuery(cod : Integer);
begin
  qryProdPorProveedor.Close;
  qryProdPorProveedor.Params[0].Value:= cod;
  qryProdPorProveedor.Params[1].Value:= glbCia_Key;
  qryProdPorProveedor.Open;
end;

end.
