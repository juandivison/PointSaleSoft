unit UTemporalVtaForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, DB, Buttons;

type
  TfrmTemporalForm = class(TForm)
    dsTotal: TDataSource;
    DataSource2: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label29: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    chkExento: TCheckBox;
    DBText2: TDBText;
    DBEdit10: TDBEdit;
    DBText16: TDBText;
    DBText3: TDBText;
    dbTextMontoExoneraITBIS: TDBText;
    DBText15: TDBText;
    Edit1: TEdit;
    DBText5: TDBText;
    DBText7: TDBText;
    BitBtn1: TBitBtn;
    RxDBGrid3: TRxDBGrid;
    dsrxError: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemporalForm: TfrmTemporalForm;

implementation

uses UDatModCalculos, UProcVentaRapida, UGlobal;

{$R *.dfm}

procedure TfrmTemporalForm.BitBtn1Click(Sender: TObject);
var
  guardarRec : TBookMark;
begin
  if frmProcVentaRapida.qryInventario.State = dsInactive then
  begin
    frmProcVentaRapida.qryInventario.params[0].Value:=glbCia_Key;
    frmProcVentaRapida.qryInventario.Open;
  end;

end;

end.
