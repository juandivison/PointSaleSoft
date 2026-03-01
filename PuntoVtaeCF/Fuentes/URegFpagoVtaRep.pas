unit URegFpagoVtaRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Db, Dialogs, RxLookup, StdCtrls, Buttons, WinSkinData;

type
  TfrmFormaPagoVRep = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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
  frmFormaPagoVRep: TfrmFormaPagoVRep;

implementation

uses UDatosVentas, UDatModIngresos;

{$R *.dfm}

procedure TfrmFormaPagoVRep.FormCreate(Sender: TObject);
begin
  setEfectivo:=1;
  dmVentas.TblFormaPago.Close;
  dmVentas.TblFormaPago.Open;
  dmVentas.tblFormaPago.First;
  While Not dmVentas.tblFormaPago.Eof Do
  begin
    if (dmVentas.tblFormaPagoCODIGO.Value = 1) Or
    (dmVentas.tblFormaPagoCODIGO.Value = 7) then
    ComboBox1.Items.Add(Trim(dmVentas.tblFormaPagoDESCRIPCION.Value));
    dmVentas.tblFormaPago.Next;
  end;
  if setEfectivo = 1 then
  begin
    //ComboBox1.ItemIndex:=1;
    ComboBox1.Text := 'Efectivo';
  end else
  begin
    ComboBox1.ItemIndex:=1;//Credito Normal
    ComboBox1.Text:='Credito';
  end;
  ComboBox1Change(Self);
  
end;

procedure TfrmFormaPagoVRep.ComboBox1Change(Sender: TObject);
begin
  if Not dmVentas.tblFormaPago.Locate('descripcion', ComboBox1.Text,[loCaseInsensitive]) then
  Messagedlg('Forma de Pago no encontrada',mtError,[mbOk],0)
  else
  codigo_fpago:= dmVentas.TblFormaPagoCODIGO.Value;
end;

procedure TfrmFormaPagoVRep.ComboBox1Exit(Sender: TObject);
begin
  if (not soloEfeYCred in [1,7]) then  //efectivo o creditos
  begin
    MessageDlg('Seleccione Efectivo o Crédito.', mtInformation,[mbOk],0);
    ComboBox1.Text := 'Efectivo';
    ComboBox1Change(Self);
    ComboBox1.SetFocus;
  end;
end;

end.
