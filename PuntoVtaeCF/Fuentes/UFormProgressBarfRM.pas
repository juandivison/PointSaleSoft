unit UFormProgressBarfRM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfrmProgressbarfrm = class(TForm)
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EjecutaBarra;
  end;

var
  frmProgressbarfrm: TfrmProgressbarfrm;

implementation

{$R *.dfm}

{ TfrmProgressbarfrm }

procedure TfrmProgressbarfrm.EjecutaBarra;
var
  y,x : integer;
begin
  ProgressBar1.Max:=2000;
  ProgressBar1.Position:=0;
  for y:=1 to x do
    ProgressBar1.StepIt;
end;

end.
