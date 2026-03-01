unit UFormNumCompFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Buttons, Mask, DBCtrls, IBCustomDataSet,
  IBStoredProc, ExtCtrls, RXCtrls, RXDBCtrl, Grids, DBGrids, RxLookup,
  WinSkinData;

type
  TfrmMantNumCombFiscal = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ibStpMaxNCF: TIBStoredProc;
    DBRadioGroup1: TDBRadioGroup;
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
    BitBtn5: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SkinData1: TSkinData;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit6DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMantNumCombFiscal: TfrmMantNumCombFiscal;

implementation

uses UDatModFactura, UDatModCon, UFormCompFiscal;

{$R *.dfm}

procedure TfrmMantNumCombFiscal.FormCreate(Sender: TObject);
begin
  dmFactura.tblDgii_SerieNCF.Close;
  dmFactura.tblDgii_SerieNCF.Open;
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
end;

procedure TfrmMantNumCombFiscal.BitBtn2Click(Sender: TObject);
begin
  if dmFactura.tblDgii_SerieNCF.State in [dsEdit, dsInsert] then
  begin
    dmFactura.tblDgii_SerieNCF.Post;
    if not dmFactura.tblDgii_SerieNCF.Transaction.InTransaction then
    dmFactura.tblDgii_SerieNCF.Transaction.StartTransaction;
    try
      dmFactura.tblDgii_SerieNCF.Transaction.CommitRetaining;
    except
    dmFactura.tblDgii_SerieNCF.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmMantNumCombFiscal.DBEdit6DblClick(Sender: TObject);
begin
  frmTipoCompFiscal:=TfrmTipoCompFiscal.Create(Nil);
  try
    frmTipoCompFiscal.Showmodal;
  finally
  frmTipoCompFiscal.Free;
  frmTipoCompFiscal:=Nil;
  end;
end;

procedure TfrmMantNumCombFiscal.BitBtn5Click(Sender: TObject);
begin
 if dmFactura.tblDgii_SerieNCF.State in [dsBrowse] then
  begin
    dmFactura.tblDgii_SerieNCF.Insert;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmMantNumCombFiscal.BitBtn3Click(Sender: TObject);
begin
  if dmFactura.tblDgii_SerieNCF.State In [dsEdit, dsInsert] then
  begin
    dmFactura.tblDgii_SerieNCF.Cancel;
  end;
end;

procedure TfrmMantNumCombFiscal.BitBtn1Click(Sender: TObject);
begin
if dmFactura.tblDgii_SerieNCF.State in [dsBrowse] then
  begin
    dmFactura.tblDgii_SerieNCF.Edit;
    dmFactura.tblDgii_SerieNCFFECHA_UPD.Value:=Now;
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end;
end;

procedure TfrmMantNumCombFiscal.BitBtn9Click(Sender: TObject);
begin
  dmFactura.tblDgii_SerieNCF.First;
end;

procedure TfrmMantNumCombFiscal.BitBtn10Click(Sender: TObject);
begin
  dmFactura.tblDgii_SerieNCF.Prior;
end;

procedure TfrmMantNumCombFiscal.BitBtn11Click(Sender: TObject);
begin
  dmFactura.tblDgii_SerieNCF.Next;
end;

procedure TfrmMantNumCombFiscal.BitBtn12Click(Sender: TObject);
begin
  dmFactura.tblDgii_SerieNCF.Last;
end;

end.
