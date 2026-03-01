unit UFormBuscarSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, RxDBCtrl, DB,
  IBCustomDataSet, IBQuery, WinSkinData;

type
  TfrmBuscarSerie = class(TForm)
    qryProdSerie: TIBQuery;
    qryProdSerieCODIGO: TIntegerField;
    qryProdSerieSERIE: TIBStringField;
    qryProdSerieSTATUS: TIBStringField;
    qryProdSerieCODIGO_CTE: TIntegerField;
    qryProdSerieSTATUS_EQUIPO: TSmallintField;
    Label1: TLabel;
    RxDBGrid1: TRxDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsqryProdSerie: TDataSource;
    SkinData1: TSkinData;
    qryProdSerieDESCESTATUS: TIBStringField;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarSerie: TfrmBuscarSerie;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmBuscarSerie.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text <> '') then
  begin
    qryProdSerie.Locate('SERIE',Edit1.Text,[loCaseInsensitive, loPartialKey]);
  end;
end;

procedure TfrmBuscarSerie.Button1Click(Sender: TObject);
begin
  if not qryProdSerie.Locate('SERIE',Edit1.Text,[loCaseInsensitive]) then
  MessageDlg('No existe',mtInformation,[mbok],0);
end;

procedure TfrmBuscarSerie.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProdSerieSTATUS_EQUIPO.Value = 3 then
  Background:= clSilver else
  if qryProdSerieSTATUS_EQUIPO.Value = 2 then
  Background:= clMoneyGreen;
end;

end.
