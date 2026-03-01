unit UFormAuditoriaInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RxDBCtrl, ComCtrls, IBCustomDataSet, IBQuery,
  StdCtrls, Buttons;

type
  TfrmAuditoriaInv = class(TForm)
    qryCantProdReg: TIBQuery;
    qryCantProdRegCANT: TIntegerField;
    qryCantProdRegFECHA: TDateTimeField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    IBQuery1: TIBQuery;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuditoriaInv: TfrmAuditoriaInv;

implementation
 uses UDatModConectar, UGlobal;
{$R *.dfm}

procedure TfrmAuditoriaInv.BitBtn1Click(Sender: TObject);
begin
  qryCantProdReg.Close;
  qryCantProdReg.Open;
end;

end.
