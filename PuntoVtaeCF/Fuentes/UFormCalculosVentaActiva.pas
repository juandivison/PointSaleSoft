unit UFormCalculosVentaActiva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, Grids, DBGrids, RXDBCtrl, WinSkinData;

type
  TfrmVerCalcVenta = class(TForm)
    RxDBGrid1: TRxDBGrid;
    rxTotales: TRxMemoryData;
    rxTotalesMontoNeto: TCurrencyField;
    rxTotalesItbi: TCurrencyField;
    rxTotalesMontoDescuento: TCurrencyField;
    rxTotalesMontoitbisenPrecio: TCurrencyField;
    rxTotalesMontoDescItem: TCurrencyField;
    rxTotalesRecargo: TCurrencyField;
    rxTotalesMontoTranspItbis: TCurrencyField;
    rxTotalesMontoItbisRecargo: TCurrencyField;
    rxTotalesMontoDesGlobal: TCurrencyField;
    DataSource1: TDataSource;
    RxDBGrid2: TRxDBGrid;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerCalcVenta: TfrmVerCalcVenta;

implementation

uses UProcVentaRapida;

{$R *.dfm}

procedure TfrmVerCalcVenta.FormCreate(Sender: TObject);
var
   bmark : TBookmark;
begin
  bmark := frmProcVentaRapida.rxVenta.GetBookmark();
  frmProcVentaRapida.rxVenta.First;
  rxTotales.Close;
  rxTotales.Open;
  rxTotales.Insert;
  rxTotalesMontoNeto.Value :=0;
  rxTotalesItbi.Value :=0;
  rxTotalesMontoDescuento.Value :=0;
  rxTotalesMontoitbisenPrecio.Value :=0;
  rxTotalesMontoDescItem.Value :=0;
  rxTotalesRecargo.Value :=0;
  rxTotalesMontoTranspItbis.Value :=0;
  rxTotalesMontoItbisRecargo.Value :=0;
  rxTotalesMontoDesGlobal.Value :=0;
  rxtotales.Post;
  While Not frmProcVentaRapida.rxVenta.Eof Do
  begin
    rxTotales.Edit;
    rxTotalesMontoNeto.Value := rxTotalesMontoNeto.Value + frmProcVentaRapida.rxVentaMontoNeto.Value;
    rxTotalesItbi.Value := rxTotalesItbi.Value + frmProcVentaRapida.rxVentaItbi.Value;
    rxTotalesMontoDescuento.Value := rxTotalesMontoDescuento.Value + frmProcVentaRapida.rxVentaMontoDescuento.Value;
    rxTotalesMontoitbisenPrecio.Value := rxTotalesMontoitbisenPrecio.Value + frmProcVentaRapida.rxVentaMontoItbisenPrecio.Value;
    rxTotalesMontoDescItem.Value := rxTotalesMontoDescItem.Value + frmProcVentaRapida.rxVentaMontoDescItem.Value;
    rxTotalesRecargo.Value       := rxTotalesRecargo.Value + frmProcVentaRapida.rxVentaRecargo.Value;
    rxTotalesMontoTranspItbis.Value := rxTotalesMontoTranspItbis.Value + frmProcVentaRapida.rxVentaMontoTranspItbis.Value;
    rxTotalesMontoItbisRecargo.Value:= rxTotalesMontoItbisRecargo.Value + frmProcVentaRapida.rxVentaMontoItbisRecargo.Value;
    rxTotalesMontoDesGlobal.Value := rxTotalesMontoDesGlobal.Value + frmProcVentaRapida.rxVentaMontoDesGlobal.Value;
    rxTotales.Post;
    frmProcVentaRapida.rxVenta.Next;
    application.ProcessMessages;
  end;
  frmProcVentaRapida.rxVenta.GotoBookmark(bmark);
  frmProcVentaRapida.rxVenta.FreeBookmark(bmark);
end;

end.
