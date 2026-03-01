unit UReversaCobroEstudiante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons;

type
  TfrmReversarCobroEst = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReversarCobroEst: TfrmReversarCobroEst;

implementation
uses UDatModIngresos;
{$R *.dfm}

procedure TfrmReversarCobroEst.BitBtn1Click(Sender: TObject);
begin
  dmIngresos.qryReciboAReversar.Close;
  dmIngresos.qryReciboAReversar.Params[0].Value:=StrToInt(frmReversarCobroEst.Edit1.Text);
  dmIngresos.qryReciboAReversar.Open;
  if dmIngresos.qryReciboAReversar.RecordCount = 0 then
  begin
    MessageDlg('Número recibo no existe.',mtInformation,[mbok],0);
  end;
end;

end.
