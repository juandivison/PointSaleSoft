unit UFormIndiqueMontoRetencion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmIndicaMontoRetencion = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndicaMontoRetencion: TfrmIndicaMontoRetencion;

implementation

{$R *.dfm}

procedure TfrmIndicaMontoRetencion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Edit1.Text <> '') and (Edit2.Text = '') then
  begin
    if MessageDlg('Favor indicar descripción.',mtError,[mbyes, mbno],0) = mryes then
    canclose:=false
    else canclose:=true;
  end;
end;

procedure TfrmIndicaMontoRetencion.Edit1Change(Sender: TObject);
begin
  if (Edit1.Text = '') then
  BitBtn1.Enabled:=False else
  BitBtn1.Enabled:=True;
end;

procedure TfrmIndicaMontoRetencion.Edit2Change(Sender: TObject);
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '')  then
  BitBtn1.Enabled:=True else
  if (Edit2.Text = '') then
  BitBtn1.Enabled:=False;
end;

procedure TfrmIndicaMontoRetencion.Edit1Exit(Sender: TObject);
begin
  if (Edit1.Text = '') then
  BitBtn1.Enabled:=False else
  BitBtn1.Enabled:=True;
end;

end.
