unit URegNumTarjetaPagoCxp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls;

type
  TfrmRegNumTarjeta = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegNumTarjeta: TfrmRegNumTarjeta;

implementation
 uses UPagarCXPFacturas;
{$R *.dfm}

end.
