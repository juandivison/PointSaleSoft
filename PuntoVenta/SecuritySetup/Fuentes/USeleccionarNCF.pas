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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelNCF: TfrmSelNCF;

implementation

{$R *.dfm}
uses UDatModFactura;
procedure TfrmSelNCF.FormCreate(Sender: TObject);
begin
  dmFactura.ibQryViewNCF.Close;
  dmFactura.ibQryViewNCF.Open;
end;

end.
