unit URegNumChequeCxp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RxLookup, Mask, DBCtrls;

type
  TfrmRegNumCheque = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegNumCheque: TfrmRegNumCheque;

implementation
uses UDatModCxp, UPagarCXPFacturas;
{$R *.dfm}

procedure TfrmRegNumCheque.FormCreate(Sender: TObject);
begin
  dmCxp.tblBanco.Close;
  dmCxp.tblBanco.Open;
end;

end.
