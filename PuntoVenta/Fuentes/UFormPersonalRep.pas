unit UFormPersonalRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, WinSkinData;

type
  TFrmFormPerRep = class(TForm)
    Opciones: TRadioGroup;
    GroupBox1: TGroupBox;
    Activos: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ActivosClick(Sender: TObject);
    procedure OpcionesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ClickCtrl : Integer;
    { Private declarations }
  public
    VistaPrevia : Boolean;
    Filtrar : Integer;
    { Public declarations }
  end;

var
  FrmFormPerRep: TFrmFormPerRep;

implementation

{$R *.DFM}

procedure TFrmFormPerRep.BitBtn2Click(Sender: TObject);
begin
  VistaPrevia := True;
end;

procedure TFrmFormPerRep.BitBtn4Click(Sender: TObject);
begin
  VistaPrevia := False;
end;

procedure TFrmFormPerRep.ActivosClick(Sender: TObject);
begin
  ClickCtrl := ClickCtrl + 1;
  if ClickCtrl = 4 Then
  ClickCtrl := 1;
  if ClickCtrl = 1 Then //Activos
  Begin
    Filtrar := 1;
    Activos.Caption := 'Activos';
  End  Else
  if ClickCtrl = 2 Then //Inactivos
  Begin
    Filtrar := 2;
    Activos.Caption := 'Inactivos';
  End  Else
  if ClickCtrl = 3 Then //Todos
  Begin
    Filtrar := 3;
    Activos.Caption := 'Todos';
  end;
end;

procedure TFrmFormPerRep.OpcionesClick(Sender: TObject);
begin
  ClickCtrl := 1;
end;

procedure TFrmFormPerRep.FormCreate(Sender: TObject);
begin
  ActivosClick(Self);
end;

end.
