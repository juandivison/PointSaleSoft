unit UDatoProntoPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDatoProntoPago = class(TForm)
    edtCredito: TEdit;
    Label1: TLabel;
    edtDebito: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatoProntoPago: TfrmDatoProntoPago;

implementation

{$R *.dfm}

end.
