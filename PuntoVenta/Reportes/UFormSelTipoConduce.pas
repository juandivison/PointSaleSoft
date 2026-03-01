unit UFormSelTipoConduce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, EditNew, Buttons, WinSkinData;

type
  TfrmSeleccionarTipoConduce = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditN1: TEditN;
    Label1: TLabel;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tipoConduce : smallint;
  end;

var
  frmSeleccionarTipoConduce: TfrmSeleccionarTipoConduce;

implementation
uses uGlobal;
{$R *.dfm}

procedure TfrmSeleccionarTipoConduce.FormCreate(Sender: TObject);
begin
 RadioGroup1.ItemIndex:=GlbTipoConduce;
 tipoConduce:=GlbTipoConduce;
end;

procedure TfrmSeleccionarTipoConduce.RadioGroup1Click(Sender: TObject);
begin
  tipoConduce:= RadioGroup1.ItemIndex;
end;

end.
