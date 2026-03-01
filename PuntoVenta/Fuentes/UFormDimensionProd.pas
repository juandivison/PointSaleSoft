unit UFormDimensionProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls, RxCtrls, RxDBCtrl,
  WinSkinData;

type
  TfrmDimensionProd = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBStatusLabel4: TDBStatusLabel;
    SkinData1: TSkinData;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDimensionProd: TfrmDimensionProd;

implementation

uses UDatModPanaderia;

{$R *.dfm}

end.
