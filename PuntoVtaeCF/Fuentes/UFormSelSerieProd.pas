unit UFormSelSerieProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB, WinSkinData;

type
  TfrmSelSerie = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    SkinData1: TSkinData;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelSerie: TfrmSelSerie;

implementation

uses UProcVentaRapida;

{$R *.dfm}

procedure TfrmSelSerie.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text <> '') then
  begin
    frmProcVentaRapida.qryProdSerie.Locate('SERIE',Edit1.Text,[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmSelSerie.Button1Click(Sender: TObject);
begin
  if not frmProcVentaRapida.qryProdSerie.Locate('SERIE',Edit1.Text,[loCaseInsensitive]) then
  MessageDlg('No existe',mtInformation,[mbok],0);
end;

end.
