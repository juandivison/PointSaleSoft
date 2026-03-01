unit UFormSelTasaITBIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DB, WinSkinData;

type
  TfrmSelTasaITBIS = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dsqryBuscarTasaItbis: TDataSource;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelTasaITBIS: TfrmSelTasaITBIS;

implementation

uses UDatosVentas, uGlobal;

{$R *.dfm}

procedure TfrmSelTasaITBIS.FormCreate(Sender: TObject);
begin
  dmVentas.qryBuscarTasaItbis.Close;
  dmVentas.qryBuscarTasaItbis.Params[0].Value := ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.qryBuscarTasaItbis.Open;
end;

procedure TfrmSelTasaITBIS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GlbIDTasa :=  dmVentas.qryBuscarTasaItbisIDTASAITBIS.Value;
end;

end.
