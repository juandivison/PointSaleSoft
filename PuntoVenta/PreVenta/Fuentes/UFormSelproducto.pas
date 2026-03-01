unit UFormSelproducto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Db, Dialogs, Grids, DBGrids, RXDBCtrl;

type
  TfrmMostrarProductos = class(TForm)
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodProdSeleted : String;
  end;

var
  frmMostrarProductos: TfrmMostrarProductos;

implementation

uses UProcVentaRapida;

{$R *.dfm}

procedure TfrmMostrarProductos.RxDBGrid1DblClick(Sender: TObject);
begin
  frmProcVentaRapida.edtCodigo.Text:= frmProcVentaRapida.qryProductosCodigo_texto.Value;
  Hide; 
end;

end.
