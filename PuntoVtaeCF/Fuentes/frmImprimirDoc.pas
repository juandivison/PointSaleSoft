unit frmImprimirDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, WinSkinData;

type
  TfrmImprimir = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    SkinData1: TSkinData;
    rdgXLS: TRadioButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimir: TfrmImprimir;

implementation

{$R *.dfm}

end.
