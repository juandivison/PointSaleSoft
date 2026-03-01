unit UIndicarLoteNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, RXDBCtrl,
  WinSkinData;

type
  TfrmShowLote = class(TForm)
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowLote: TfrmShowLote;

implementation

uses UDatModInventario;

{$R *.dfm}

end.
