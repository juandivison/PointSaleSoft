unit uSelSingleFechaOpc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, ComCtrls;

type
  TfrmSelSingleFechaOpc = class(TForm)
    Label1: TLabel;
    FechaIni: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelSingleFechaOpc: TfrmSelSingleFechaOpc;

implementation

{$R *.dfm}

end.
