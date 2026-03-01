unit UFormPuertosLibres;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, WinSkinData, RXCtrls, jpeg, ExtCtrls;

type
  TfrmPuertosLibres = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    rxPuerto: TRxLabel;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure VerificarPuertosLibres;
    Procedure VerificarPuertosLibresM;
  end;

var
  frmPuertosLibres: TfrmPuertosLibres;

implementation
   uses Uglobal;
   
{$R *.dfm}

procedure TfrmPuertosLibres.FormCreate(Sender: TObject);
begin
  VerificarPuertosLibres;
  if Not GlbPuertoDisponible then
  begin
    rxPuerto.Font.Color:=clRed;
    rxPuerto.Caption:= 'Puerto '+'COM' + IntToStr(GlbPuerto) + ' no está disponible, verifique.';
  end else
  begin
    rxPuerto.Font.Color:=clNavy;
    rxPuerto.Caption:= 'Puerto '+'COM' + IntToStr(GlbPuerto)+' esta disponible';
  end;
end;

procedure TfrmPuertosLibres.VerificarPuertosLibres;
var
  List: TStringList;
  i: integer;
begin
  List:= TStringList.Create;
  try
    GetPortList(List);
    Combobox1.Items.Clear;
    GlbPuertoDisponible := False;
    Combobox1.Text :='';
    for i:= 0 to List.Count - 1 do
      if not PuertoCommOcupado(List[i]) then
      begin
        Combobox1.Items.Add(List[i]);
        if (UpperCase(List[i]) = 'COM' + IntToStr(GlbPuerto)) then
        begin
          Combobox1.Text := 'COM' + IntToStr(GlbPuerto);
          GlbPuertoDisponible := True;
        end;
      end;
  finally
    List.Free;
  end;
end;

procedure TfrmPuertosLibres.BitBtn2Click(Sender: TObject);
begin
  FormCreate(Self);
end;

procedure TfrmPuertosLibres.VerificarPuertosLibresM;
var
  List: TStringList;
  i: integer;
begin
  List:= TStringList.Create;
  try
    GetPortList(List);
    GlbPuertoDisponible := False;
    for i:= 0 to List.Count-1 do
      if not PuertoCommOcupado(List[i]) then
      begin
        if (UpperCase(List[i]) = 'COM' + IntToStr(GlbPuerto)) then
        begin
          GlbPuertoDisponible := True;
        end;
      end;
  finally
  List.Free;
  end;
end;

end.
