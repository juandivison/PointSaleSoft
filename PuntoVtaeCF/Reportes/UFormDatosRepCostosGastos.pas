unit UFormDatosRepCostosGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, WinSkinData;

type
  TfrmDatosRepCostos = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    cboxProveedores: TComboBox;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    chboxExportExcel: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure cboxProveedoresChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    _FPago : integer;
    _FCodProv : Integer;
  end;

var       
  frmDatosRepCostos: TfrmDatosRepCostos;

implementation

uses UDatModRegOpeDiaria, UDatModProveedor;

{$R *.dfm}

procedure TfrmDatosRepCostos.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.tblCondicion.Close;
  dtmTransOpeDiaria.tblCondicion.Open;
  dtmTransOpeDiaria.tblCondicion.First;
  while not dtmTransOpeDiaria.tblCondicion.Eof do
  begin
    ComboBox1.Items.Add(dtmTransOpeDiaria.tblCondicionDESCRIPCION.Value);
    dtmTransOpeDiaria.tblCondicion.Next;
  end;
  ComboBox1.Items.Add('Todos');
  ComboBox1.Text:='Todos';
  ComboBox1Change(Self);
  cboxProveedores.Clear;

  dmProveedor.qryProveedoresConGastos.Close;
  dmProveedor.qryProveedoresConGastos.Open;
  dmProveedor.qryProveedoresConGastos.First;
  while not dmProveedor.qryProveedoresConGastos.eof do
  begin
    cboxProveedores.Items.Add(dmProveedor.qryProveedoresConGastosDESCRIPCION.Value);
    dmProveedor.qryProveedoresConGastos.next;
  end;
  dmProveedor.qryProveedoresConGastos.First;
  cboxProveedores.Text := dmProveedor.qryProveedoresConGastosDESCRIPCION.Value;
  ComboBox1Change(Self);
  CheckBox1Click(Self);
end;

procedure TfrmDatosRepCostos.ComboBox1Change(Sender: TObject);
begin
  if (uppercase(ComboBox1.Text) = 'TODOS') then
  _FPago := -1 else
  if dtmTransOpeDiaria.tblCondicion.Locate('DESCRIPCION', ComboBox1.Text,[]) then
  _FPago := dtmTransOpeDiaria.tblCondicionCODIGO.Value;
end;

procedure TfrmDatosRepCostos.cboxProveedoresChange(Sender: TObject);
begin
  if dmProveedor.qryProveedoresConGastos.Locate('Descripcion',cboxProveedores.Text,[]) then
  _FCodProv := dmProveedor.qryProveedoresConGastosCodigo.Value;
end;

procedure TfrmDatosRepCostos.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  _FCodProv:= -1
  else
  cboxProveedoresChange(Self);
end;

end.
