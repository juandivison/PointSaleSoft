unit UPrecioProdXUnidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, Buttons,
  RXCtrls, RxLookup, EditNew;

type
  TfrmPrecioProdXUnidad = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsqryInv: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label3: TLabel;
    BitBtn7: TBitBtn;
    edtCodigo: TEditN;
    BitBtn8: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xcodProducto : Integer;
    procedure buscarCodigo(codigo:integer);
  end;

var
  frmPrecioProdXUnidad: TfrmPrecioProdXUnidad;
  codigoProd : Integer;

implementation

uses UDatmodDatosGenerales, UFormUnidades, UGlobal;

{$R *.dfm}

procedure TfrmPrecioProdXUnidad.BitBtn1Click(Sender: TObject);
begin
  if (dmDatos.qryPrecioXUnidad.State = dsBrowse) then
  begin
    dmDatos.qryPrecioXUnidad.Insert;
    dmDatos.qryPrecioXUnidadID_UNIDAD.Value:= dmdatos.qryInvtipo_unidad.Value;
    dmDatos.qryPrecioXUnidadID_PROD.Value:= dmdatos.qryInvCODIGO.Value;
    dmDatos.qryPrecioXUnidadCOD_USUARIO.Value:= VarUsuarioGlb;
    dmDatos.qryPrecioXUnidadFECHA_IN.Value:= now;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmPrecioProdXUnidad.FormCreate(Sender: TObject);
begin
  dmDatos.qryPrecioXUnidad.Close;
  dmDatos.qryPrecioXUnidad.Open;
  dmDatos.tblTipoUnidad.Close;
  dmDatos.tblTipoUnidad.Open;
  dmDatos.qryInv.Close;
  dmDatos.qryInv.Open;
  dmDatos.qryInv.First;
  dmDatos.qryPrecioXUnidad.Close;
  dmDatos.qryPrecioXUnidad.Params[0].Value:= dmDatos.qryInvCODIGO.Value;
  dmDatos.qryPrecioXUnidad.Open;
end;

procedure TfrmPrecioProdXUnidad.BitBtn9Click(Sender: TObject);
begin
  dmDatos.qryInv.First;
  dmDatos.qryPrecioXUnidad.Close;
  dmDatos.qryPrecioXUnidad.Params[0].Value:= dmDatos.qryInvCODIGO.Value;
  dmDatos.qryPrecioXUnidad.Open;
  codigoProd:=dmDatos.qryInvCODIGO.Value;
end;

procedure TfrmPrecioProdXUnidad.BitBtn10Click(Sender: TObject);
begin
  dmDatos.qryInv.Prior;
  dmDatos.qryPrecioXUnidad.Close;
  dmDatos.qryPrecioXUnidad.Params[0].Value:= dmDatos.qryInvCODIGO.Value;
  dmDatos.qryPrecioXUnidad.Open;
  codigoProd:=dmDatos.qryInvCODIGO.Value;  
end;

procedure TfrmPrecioProdXUnidad.BitBtn11Click(Sender: TObject);
begin
  dmDatos.qryInv.Next;
  dmDatos.qryPrecioXUnidad.Close;
  dmDatos.qryPrecioXUnidad.Params[0].Value:= dmDatos.qryInvCODIGO.Value;
  dmDatos.qryPrecioXUnidad.Open;
  codigoProd:=dmDatos.qryInvCODIGO.Value;  
end;

procedure TfrmPrecioProdXUnidad.BitBtn12Click(Sender: TObject);
begin
  dmDatos.qryInv.Last;
  dmDatos.qryPrecioXUnidad.Close;
  dmDatos.qryPrecioXUnidad.Params[0].Value:= dmDatos.qryInvCODIGO.Value;
  dmDatos.qryPrecioXUnidad.Open;
  codigoProd:=dmDatos.qryInvCODIGO.Value;
end;

procedure TfrmPrecioProdXUnidad.BitBtn2Click(Sender: TObject);
begin
  if (dmDatos.qryPrecioXUnidad.State = dsBrowse) then
  begin
    dmDatos.qryPrecioXUnidad.Edit;
    dmDatos.qryPrecioXUnidadFECHA_UPDATE.Value:= now;
  end;
end;

procedure TfrmPrecioProdXUnidad.BitBtn4Click(Sender: TObject);
begin
  if (dmDatos.qryPrecioXUnidad.State In [dsEdit, dsInsert]) then
  begin
    dmDatos.qryPrecioXUnidad.Post;
    dmDatos.qryPrecioXUnidad.ApplyUpdates;
    if not dmDatos.qryPrecioXUnidad.Transaction.InTransaction then
    dmDatos.qryPrecioXUnidad.Transaction.StartTransaction;
    try
      dmDatos.qryPrecioXUnidad.Transaction.CommitRetaining;
    except
    dmDatos.qryPrecioXUnidad.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmPrecioProdXUnidad.BitBtn3Click(Sender: TObject);
begin
  if (dmDatos.qryPrecioXUnidad.State In [dsEdit, dsInsert]) then
  begin
    dmDatos.qryPrecioXUnidad.Cancel;
  end;
end;

procedure TfrmPrecioProdXUnidad.BitBtn5Click(Sender: TObject);
begin
  if (dmDatos.qryPrecioXUnidad.State In [dsBrowse, dsInactive]) then
  begin
    dmDatos.qryPrecioXUnidad.Close;
    dmDatos.qryPrecioXUnidad.Open;
  end;
end;

procedure TfrmPrecioProdXUnidad.BitBtn7Click(Sender: TObject);
begin
 frmUnidades:=TfrmUnidades.Create(Nil);
 try
   frmUnidades.Showmodal;
 finally
 frmUnidades.Free;
 frmUnidades:=Nil;
 end;
end;

procedure TfrmPrecioProdXUnidad.edtCodigoExit(Sender: TObject);
begin
  if (edtCodigo.Text = '') then exit;
  if Not dmDatos.qryInv.Locate('CODIGO', codigoProd, []) then
  begin
    MessageDlg('Codigo no encontrado, verifique.',mtInformation,[mbok],0);
    edtCodigo.SetFocus;
    edtCodigo.SelectAll;
  end else
  begin
    codigoProd:= dmDatos.qryInvCODIGO.Value;
    dmDatos.qryPrecioXUnidad.Close;
    dmDatos.qryPrecioXUnidad.Params[0].Value:= codigoProd;
    dmDatos.qryPrecioXUnidad.Open;
  end;
end;

procedure TfrmPrecioProdXUnidad.edtCodigoChange(Sender: TObject);
begin
  if (edtCodigo.Text = '') then exit;
  if IsNumerico(edtCodigo.Text) then
  begin
    if dmDatos.qryInv.Locate('codigo', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    codigoProd := dmDatos.qryInvCODIGO.Value;
  end else
  begin
    if dmDatos.qryInv.Locate('descripcion', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    codigoProd := dmDatos.qryInvCODIGO.Value;
  end;
end;

procedure TfrmPrecioProdXUnidad.BitBtn8Click(Sender: TObject);
begin
  edtCodigoExit(Self);
end;

procedure TfrmPrecioProdXUnidad.buscarCodigo(codigo: integer);
begin
  if codigo > 0 then
  dmDatos.qryInv.Locate('codigo',codigo ,[]);
  dmDatos.qryPrecioXUnidad.Close;
  dmDatos.qryPrecioXUnidad.Params[0].Value:= dmDatos.qryInvCODIGO.Value;
  dmDatos.qryPrecioXUnidad.Open;
end;

end.
