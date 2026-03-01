unit UFormDatosProdControlados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, Grids, DBGrids, RxDBCtrl, DBCtrls, StdCtrls, Mask,
  RxToolEdit, Buttons, WinSkinData;

type
  TfrmMedicamentoDNCD = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Label8: TLabel;
    Label13: TLabel;
    RxDBGrid1: TRxDBGrid;
    rxProdControlados: TRxMemoryData;
    dsrxProdControlados: TDataSource;
    rxProdControladosCodigo_PROD: TIntegerField;
    rxProdControladosMedicamento: TStringField;
    rxProdControladosCantRecetada: TCurrencyField;
    rxProdControladosCantDespachada: TCurrencyField;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    SkinData1: TSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMedicamentoDNCD: TfrmMedicamentoDNCD;

implementation

{$R *.dfm}

end.
