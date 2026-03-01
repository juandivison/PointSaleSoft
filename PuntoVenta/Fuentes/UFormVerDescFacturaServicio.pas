unit UFormVerDescFacturaServicio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  WinSkinData;

type
  TfrmVerDescFactServicio = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    Label8: TLabel;
    DBEdit8: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerDescFactServicio: TfrmVerDescFactServicio;

implementation

uses UProcVentaRapida;

{$R *.dfm}

end.
