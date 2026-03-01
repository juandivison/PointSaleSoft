unit USelInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, IBCustomDataSet, IBTable;

type
  TfrmSelInventario = class(TForm)
    ComboBox1: TComboBox;
    Inventario: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tblDivInventario: TIBTable;
    tblDivInventarioINVENTARIO_ID: TIntegerField;
    tblDivInventarioDESCRIPCION: TIBStringField;
    tblDivInventarioSTATUS: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    procedure LlenarComboBox;
  public
    { Public declarations }
  end;

var
  frmSelInventario: TfrmSelInventario;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmSelInventario.FormCreate(Sender: TObject);
begin
  LlenarCombobox;
end;

procedure TfrmSelInventario.ComboBox1Change(Sender: TObject);
begin
  if Not tblDivInventario.Locate('descripcion', ComboBox1.Text,[]) then
  MessageDlg('Division inventario no existe, verifique', mtInformation, [mbOK], 0);
end;

procedure TfrmSelInventario.LlenarComboBox;
begin
  tblDivInventario.close;
  tblDivInventario.Open;
  tblDivInventario.First;
  ComboBox1.Clear;
  While not tblDivInventario.Eof do
  begin
    if (tblDivInventarioSTATUS.Value = 'A') then //Considerado para venta
    ComboBox1.Items.Add(tblDivInventarioDESCRIPCION.Value);
    tblDivInventario.Next;
  end;
  tblDivInventario.First;
  ComboBox1.Text:=tblDivInventarioDESCRIPCION.Value;
end;

end.
