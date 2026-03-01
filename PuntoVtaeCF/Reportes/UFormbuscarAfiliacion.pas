unit UFormbuscarAfiliacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URepAfiliaciones, DB, WinSkinData, IBCustomDataSet, IBQuery,
  Grids, DBGrids, RxDBCtrl, Buttons, StdCtrls, ExtCtrls, EditNew, Mask,
  RxToolEdit, RxCtrls;

type
  TfrmBuscarInspecciones = class(TfrmRepInspecciones)
    RxDBGrid2: TRxDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarInspecciones: TfrmBuscarInspecciones;

implementation

{$R *.dfm}

end.
