unit UCancelaReinsertaVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons;

type
  TfrmCancelaVta = class(TForm)
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    Label1: TLabel;
    DataSource2: TDataSource;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelaVta: TfrmCancelaVta;

implementation

uses UDatModCalculos;

{$R *.dfm}

procedure TfrmCancelaVta.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmCalculos.qryVentasSTATUS.Value = 'C') then
  BackGround := clSilver;
end;

procedure TfrmCancelaVta.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmCalculos.qryVentasDEtSTATUS_DET.Value = 'C') then
  BackGround := clSilver;
end;

end.
