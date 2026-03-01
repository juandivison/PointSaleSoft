unit URegFpago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Buttons, WinSkinData;

type
  TfrmFormaPago = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigo_fpago : integer;
    setEfectivo : smallint;
    soloEfeYCred : smallint;
  end;

var
  frmFormaPago: TfrmFormaPago;

implementation

uses UDatosVentas, UDatModIngresos;

{$R *.dfm}

procedure TfrmFormaPago.FormCreate(Sender: TObject);
begin
  dmVentas.TblFormaPago.Close;
  dmVentas.TblFormaPago.Open;
  While Not dmVentas.TblFormaPago.Eof do
  begin
    if dmVentas.TblFormaPagoCODIGO.Value > 0 then
    ComboBox1.Items.Add(Trim(dmVentas.tblFormaPagoDESCRIPCION.Value));
    dmVentas.tblFormaPago.Next;
  end;
  if setEfectivo = 1 then
  begin
    ComboBox1.ItemIndex:=1;
    ComboBox1.Text := 'Efectivo';
  end else
  ComboBox1.ItemIndex:=7;//Credito Normal

  ComboBox1Change(Self);
  dmVentas.TblFormaPagoCODIGO.Value;
end;

procedure TfrmFormaPago.ComboBox1Change(Sender: TObject);
begin
  if Not dmVentas.tblFormaPago.Locate('descripcion',ComboBox1.Text,[]) then
  Messagedlg('Forma de Pago no encontrada',mtError,[mbOk],0)
  else
  codigo_fpago:= dmVentas.TblFormaPagoCODIGO.Value;
end;

procedure TfrmFormaPago.FormShow(Sender: TObject);
begin
  if setEfectivo = 1 then
  begin
    ComboBox1.ItemIndex:=1;
    ComboBox1.Text := 'Efectivo';
  end else
  ComboBox1.ItemIndex:=6;//Credito Normal

  ComboBox1Change(Self);
end;

procedure TfrmFormaPago.ComboBox1Exit(Sender: TObject);
begin
  if (soloEfeYCred in [1,7]) then  //efectivo o creditos
  begin
    MessageDlg('Seleccione Efectivo o Crédito.', mtInformation,[mbOk],0);
    ComboBox1.ItemIndex:=1;
    ComboBox1.Text := 'Efectivo';
    ComboBox1Change(Self);
    ComboBox1.SetFocus;
  end;
end;

end.
