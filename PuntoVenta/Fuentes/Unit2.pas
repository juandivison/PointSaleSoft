unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmConciliareCFConDGII = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConciliareCFConDGII: TfrmConciliareCFConDGII;

implementation

{$R *.dfm}

procedure TfrmConciliareCFConDGII.BitBtn1Click(Sender: TObject);
begin
  dmFactElectronica.qryEcfAconciliar.Close;
  dmFactElectronica.qryEcfAconciliar.Open;
end;

end.
