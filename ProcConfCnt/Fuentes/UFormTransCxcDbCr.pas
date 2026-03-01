unit UFormTransCxcDbCr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, EditNew, RxMemDS, Buttons, ExtCtrls, RXCtrls,
  IBStoredProc, Menus, RxLookup, IBSQL, DBCtrls, Mask, ToolEdit, RxDBComb,
  ComCtrls;
  
type
  TfrmTransCxcProc = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    rxdbboxmoneda: TRxDBComboBox;
    Label18: TLabel;
    Label3: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    Label8: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    Label4: TLabel;
    RxDBGrid2: TRxDBGrid;
    BitBtn13: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    btnInsertar: TBitBtn;
    TabSheet1: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodCte : integer;
  end;

var
  frmTransCxcProc: TfrmTransCxcProc;

implementation

uses UDatModConectar, UGlobal, UDatModCxc, UDatModIngresos,
  UDatModUsuarios, URepReciboAbonoCXC, UBuscarClientesPersonasP;
  
{$R *.dfm}

procedure TfrmTransCxcProc.FormCreate(Sender: TObject);
begin
  dmcxc.qryTrancxc.Close;  
  dmcxc.qryTrancxc.Open;
end;

procedure TfrmTransCxcProc.FormShow(Sender: TObject);
begin
  qryFactPendiente.Close;
  qryFactPendiente.Params[0].Value:= CodCte;
  qryFactPendiente.Open;
end;

end.
 