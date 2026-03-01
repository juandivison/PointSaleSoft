unit frmMostrarDatosCoberturaRecl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, WinSkinData;

type
  TfrmMostrarDatosdupCob = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostrarDatosdupCob: TfrmMostrarDatosdupCob;

implementation

uses UFormReclamaciones;

{$R *.dfm}

end.
