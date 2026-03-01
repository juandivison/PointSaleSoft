unit UfrmBuscarNIF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, WinSkinData;

type
  TfrmBuscarNIF = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsqryDatosReimpDocFiscal: TDataSource;
    SkinData1: TSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarNIF: TfrmBuscarNIF;

implementation

uses UDatModConectar, UDatModReportes;

{$R *.dfm}

end.
