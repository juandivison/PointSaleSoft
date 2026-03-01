unit URegOrdenCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, RXToolEdit, RXDBCtrl, EditNew,
  db, ExtCtrls, Grids, DBGrids;

type
  TfrmRegOrdenCompra = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    edtCodigo: TEditN;
    Shape1: TShape;
    RadioGroup1: TRadioGroup;
    RxDBGrid1: TRxDBGrid;
    procedure edtCodigoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegOrdenCompra: TfrmRegOrdenCompra;

implementation

uses UDatmodDatosGenerales, UDatModProveedor;

{$R *.dfm}

procedure TfrmRegOrdenCompra.edtCodigoChange(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 0) then
  dmdatos.qryInv.Locate('codigo',edtCodigo.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmRegOrdenCompra.FormCreate(Sender: TObject);
begin
  dmdatos.qryInv.close;
  dmdatos.qryInv.Open;
end;

procedure TfrmRegOrdenCompra.edtCodigoExit(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex = 0) then
  dmdatos.qryInv.Locate('codigo', edtCodigo.Text, [loCaseInsensitive, loPartialKey]);

end;

end.
