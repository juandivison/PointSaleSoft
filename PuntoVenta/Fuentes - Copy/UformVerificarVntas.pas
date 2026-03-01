unit UformVerificarVntas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, DBGrids, RxDBCtrl, DB,
  WinSkinData;

type
  TfrmVerificarValoresVta = class(TForm)
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
  frmVerificarValoresVta: TfrmVerificarValoresVta;

implementation

uses UDatModCuadrexRuta,UDatosVentas,Uglobal;

{$R *.dfm}

procedure TfrmVerificarValoresVta.Button3Click(Sender: TObject);
begin
  DateTimePicker1.Date:=DateTimePicker1.Date + 1;
  BitBtn8Click(self);
end;

procedure TfrmVerificarValoresVta.Button4Click(Sender: TObject);
begin
  DateTimePicker1.Date:=DateTimePicker1.Date - 1;
  BitBtn8Click(self);
end;

procedure TfrmVerificarValoresVta.BitBtn8Click(Sender: TObject);
begin
  dmVentas.qryRevisionVentas.close;
  dmVentas.qryRevisionVentas.params[0].Value:=ExtraerFecha(DateTimePicker1.Date);
  dmVentas.qryRevisionVentas.Open;
end;

end.
