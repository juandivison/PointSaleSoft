unit UFormConsVeh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RxDBCtrl, DB, WinSkinData, StdCtrls, Buttons;

type
  TfrmConsVeh = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsVeh: TfrmConsVeh;

implementation

uses UDatModClientes;

{$R *.dfm}

procedure TfrmConsVeh.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not dmClientes.qryRepVehiculosFECHA_VENTA.IsNull then
  begin
    Background:= clMoneyGreen;
  end;
end;

end.
