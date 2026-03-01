unit UFormFormatoTipoAfiliado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, ExtCtrls, DBCtrls,
  RxDBComb, WinSkinData, Buttons, Grids, DBGrids, RxDBCtrl, Mask, RxCtrls,
  RxLookup;

type
  TfrmLogoTipoAfiliado = class(TForm)
    tblLogoServicio: TIBTable;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    dstblLogoServicio: TDataSource;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    tblLogoServicioTIPO_AFILIADO: TIntegerField;
    tblLogoServicioRUTA_LOGO: TIBStringField;
    tblTipoAfiliado: TIBTable;
    dstblTipoAfiliado: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    tblTipoAfiliadoIDTIPO: TIntegerField;
    tblTipoAfiliadoDESCRIPCION: TIBStringField;
    tblTipoAfiliadoMONTOCOBERTURA: TFloatField;
    tblTipoAfiliadoDIASDECARENCIA: TIntegerField;
    tblTipoAfiliadoYEARANTIGUEDAD: TIntegerField;
    tblTipoAfiliadoSTATUS: TIBStringField;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogoTipoAfiliado: TfrmLogoTipoAfiliado;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmLogoTipoAfiliado.BitBtn10Click(Sender: TObject);
begin
  tblLogoServicio.prior;
end;

procedure TfrmLogoTipoAfiliado.BitBtn11Click(Sender: TObject);
begin
  tblLogoServicio.next;
end;

procedure TfrmLogoTipoAfiliado.BitBtn12Click(Sender: TObject);
begin
  tblLogoServicio.Last;
end;

procedure TfrmLogoTipoAfiliado.BitBtn9Click(Sender: TObject);
begin
  tblLogoServicio.first;
end;

procedure TfrmLogoTipoAfiliado.SpeedButton1Click(Sender: TObject);
begin
  if tblLogoServicio.State in [dsinsert, dsEdit] then
  begin
    if tblLogoServicioTIPO_AFILIADO.IsNull then exit;
    tblLogoServicio.Post;
    tblLogoServicio.ApplyUpdates;
    if not tblLogoServicio.Transaction.InTransaction then
    tblLogoServicio.Transaction.StartTransaction;
    try
      tblLogoServicio.Transaction.CommitRetaining;
    except
    tblLogoServicio.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmLogoTipoAfiliado.SpeedButton2Click(Sender: TObject);
begin
  if tblLogoServicio.State = dsBrowse then
  begin
    tblLogoServicio.Insert;
    RxDBComboBox1.SetFocus;
  end;
end;

procedure TfrmLogoTipoAfiliado.SpeedButton3Click(Sender: TObject);
begin
  if tblLogoServicio.State in [dsInsert, dsEdit] then
  begin
    tblLogoServicio.Cancel;
  end;
end;

procedure TfrmLogoTipoAfiliado.FormCreate(Sender: TObject);
begin
  tblTipoAfiliado.close;
  tblTipoAfiliado.Open;
  tblLogoServicio.Close;
  tblLogoServicio.Open;
end;

procedure TfrmLogoTipoAfiliado.BitBtn1Click(Sender: TObject);
var
  selectedFile: string;
  dlg: TOpenDialog;
begin
  tblLogoServicio.Edit;
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    if tblLogoServicioRUTA_LOGO.IsNull then
    dlg.InitialDir := 'C:\'
    else
    dlg.InitialDir := ExtractFileDir (tblLogoServicioRUTA_LOGO.Value);
    dlg.Filter := 'All files (*.*)|*.*';
    if dlg.Execute then
      selectedFile := dlg.FileName;
  finally
    dlg.Free;
  end;

  if (selectedFile <> '') then
    tblLogoServicioRUTA_LOGO.Value:=selectedFile;
end;

end.
