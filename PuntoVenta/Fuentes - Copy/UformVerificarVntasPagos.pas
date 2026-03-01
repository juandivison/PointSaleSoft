unit UformVerificarVntasPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, DBGrids, RxDBCtrl, DB,
  WinSkinData;

type
  TfrmVerificarValoresVtaPago = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    BitBtn8: TBitBtn;
    SkinData1: TSkinData;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerificarValoresVtaPago: TfrmVerificarValoresVtaPago;

implementation

uses UDatModCuadrexRuta,UDatosVentas, Uglobal;

{$R *.dfm}

procedure TfrmVerificarValoresVtaPago.Button3Click(Sender: TObject);
begin
  DateTimePicker1.Date:=DateTimePicker1.Date + 1;
  BitBtn8Click(Self);
end;

procedure TfrmVerificarValoresVtaPago.Button4Click(Sender: TObject);
begin
  DateTimePicker1.Date:=DateTimePicker1.Date - 1;
  BitBtn8Click(Self);  
end;

procedure TfrmVerificarValoresVtaPago.BitBtn8Click(Sender: TObject);
begin
  dmCuadrexRuta.qryValidarPagos.close;
  dmCuadrexRuta.qryValidarPagos.params[0].Value:=ExtraerFecha(DateTimePicker1.Date);
  dmCuadrexRuta.qryValidarPagos.Open;
end;

end.
