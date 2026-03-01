unit UFormCheckGenerador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB, WinSkinData;

type
  TfrmCheckGenerador = class(TForm)
    dsqryMaxGeneradores: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SkinData1: TSkinData;
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckGenerador: TfrmCheckGenerador;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmCheckGenerador.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmConectar.qryMaxGeneradoresSERIE.Value <>
      dmConectar.qryMaxGeneradoresGENERADORSEC.Value) then
  begin
    if dmConectar.qryMaxGeneradoresSERIE.IsNull then
    BackGround := clYellow
    else
    BackGround := clred;
  end;
end;

procedure TfrmCheckGenerador.FormCreate(Sender: TObject);
begin
  dmConectar.qryMaxGeneradores.Close;
  dmConectar.qryMaxGeneradores.Open;
end;

end.
