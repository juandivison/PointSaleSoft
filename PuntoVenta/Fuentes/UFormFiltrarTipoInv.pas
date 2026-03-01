unit UFormFiltrarTipoInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, RxDBComb, IBCustomDataSet, IBQuery;

type
  TfrmFiltrarInv = class(TForm)
    qryTipoInv: TIBQuery;
    qryTipoInvCODIGO: TSmallintField;
    qryTipoInvDESCRIPCION: TIBStringField;
    dsqryTipoInv: TDataSource;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFiltrarInv: TfrmFiltrarInv;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmFiltrarInv.FormCreate(Sender: TObject);
begin
  qryTipoInv.Close;
  qryTipoInv.Open;
  qryTipoInv.first;
  ComboBox1.Clear();
  while not qryTipoInv.Eof do
  begin
    ComboBox1.Items.Add(qryTipoInvDESCRIPCION.Value);
    qryTipoInv.Next;
  end;
  qryTipoInv.First;
  ComboBox1.Text:=qryTipoInvDESCRIPCION.Value;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
end;

procedure TfrmFiltrarInv.ComboBox1Change(Sender: TObject);
begin
  if not qryTipoInv.Locate('DESCRIPCION', ComboBox1.Text,[]) then
  raise exception.Create('No existe');
end;

end.
