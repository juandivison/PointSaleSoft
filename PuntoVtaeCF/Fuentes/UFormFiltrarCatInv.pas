unit UFormFiltrarCatInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, RxToolEdit,
  RxLookup, Buttons, WinSkinData;

type
  TfrmFiltrarCategoriaInv = class(TForm)
    tblCatgoriaInv: TIBTable;
    tblCatgoriaInvCODCATEGORIA: TIntegerField;
    tblCatgoriaInvDESCRIPCION: TIBStringField;
    rxLookupCatInv: TRxLookupEdit;
    Label1: TLabel;
    dstblCatgoriaInv: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure rxLookupCatInvChange(Sender: TObject);
    procedure rxLookupCatInvExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codCatSel : integer;
  end;

var
  frmFiltrarCategoriaInv: TfrmFiltrarCategoriaInv;

implementation
  uses UDatModConectar;
  
{$R *.dfm}

procedure TfrmFiltrarCategoriaInv.FormCreate(Sender: TObject);
begin
  tblCatgoriaInv.Close;
  tblCatgoriaInv.Open;
  tblCatgoriaInv.first;
  rxLookupCatInv.Text:=tblCatgoriaInvDESCRIPCION.Value;
  rxLookupCatInvChange(Self);
end;

procedure TfrmFiltrarCategoriaInv.rxLookupCatInvChange(Sender: TObject);
begin
  codCatSel:= tblCatgoriaInvCODCATEGORIA.Value;
end;

procedure TfrmFiltrarCategoriaInv.rxLookupCatInvExit(Sender: TObject);
begin
  rxLookupCatInvChange(Self);
end;

end.
