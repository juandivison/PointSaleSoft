unit UFormDescAdicional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls;

type
  TfrmDescripcionAdicional = class(TForm)
    DBMemo1: TDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDescripcionAdicional: TfrmDescripcionAdicional;

implementation
 USES UDatModInventario;
{$R *.dfm}

end.
