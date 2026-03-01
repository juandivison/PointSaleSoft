unit UFormVtaCafeteria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UProcVentaRapida, WinSkinData, IBSQL, IBCustomDataSet,
  IBStoredProc, Menus, IBQuery, DB, RxMemDS, StdCtrls, RXCtrls, RxLookup,
  EditNew, Mask, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl;

type
  TfrmVentaCafeteria = class(TfrmProcVentaRapida)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVentaCafeteria: TfrmVentaCafeteria;

implementation

{$R *.dfm}

end.
