unit UFormSelFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtDlgs, WinSkinData;

type
  TfrmSelFecha = class(TForm)
    FechaIni: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    SkinData1: TSkinData;
    Label2: TLabel;
    FechaFin: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelFecha: TfrmSelFecha;

implementation



{$R *.dfm}

procedure TfrmSelFecha.FormCreate(Sender: TObject);
begin
  FechaIni.Datetime:= Now;
  FechaFin.Datetime:= Now;  
end;

end.
