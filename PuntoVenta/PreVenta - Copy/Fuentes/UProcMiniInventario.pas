unit UProcMiniInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons,
  RXCtrls, ExtDlgs;

type
  TfrmRegMiniInvientario = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel4: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn13: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoTexto : String;
  end;

var
  frmRegMiniInvientario: TfrmRegMiniInvientario;

implementation

uses UDatModInventario, Uglobal, UDatModReportes, URepInventarioProd;

{$R *.dfm}

procedure TfrmRegMiniInvientario.BitBtn13Click(Sender: TObject);
begin
  dmReportes.qryRepInventarioProdMasBclRuta.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO_P'
  else
  dmReportes.qryRepInventarioProdMasBclRuta.SQL.Text := 'Select * from PROC_DATOS_REP_INVENTARIO';

  dmReportes.qryRepInventarioProdMasBclRuta.Open;
  qckRepDatosInventario:=TqckRepDatosInventario.Create(nil);
  try
    qckRepDatosInventario.Preview;
  finally
  qckRepDatosInventario.Free;
  qckRepDatosInventario:=Nil;
  end;
end;

procedure TfrmRegMiniInvientario.BitBtn1Click(Sender: TObject);
begin
 if dmInventario.tblInventarioProd.State = dsBrowse then
  begin
    dmInventario.tblInventarioProd.Insert;
    dmInventario.tblInventarioProdSTATUS.Value:='A';
    dmInventario.tblInventarioProdFECHA.Value :=ExtraerFecha(date);
    DbEdit2.SetFocus;
  end;
end;

procedure TfrmRegMiniInvientario.BitBtn2Click(Sender: TObject);
begin
 if dmInventario.tblInventarioProd.State = dsBrowse then
  begin
    dmInventario.tblInventarioProd.Edit;
  end;
end;

procedure TfrmRegMiniInvientario.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblInventarioProd.Cancel;
  end else
  if MessageDlg('Borrar artículo de inventario?',mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    dmInventario.tblInventarioProd.Delete;
    if Not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRegMiniInvientario.BitBtn4Click(Sender: TObject);
var
  numMax : Integer;
begin
  if dmInventario.tblInventarioProd.State in [dsEdit,dsInsert] then
  begin
    if dmInventario.tblInventarioProd.State = dsInsert then
    begin
      dmInventario.tblInventarioProdFECHA.Value:=ExtraerFecha(date);
      dmInventario.tblInventarioProdTIPO.Value:=0;
      dmInventario.tblInventarioProdSTATUS.Value:='A';
      if (dmInventario.tblInventarioProdCODIGO_TEXTO.IsNull) or
         (dmInventario.tblInventarioProdCODIGO_TEXTO.Value = '') then
      begin
        numMax := FsqlMaxNumero('INVENTARIO_PRODUCTO ', 'CODIGO_TEXTO');
        if numMax = 0 then
        dmInventario.tblInventarioProdCODIGO_TEXTO.Value:='1'
        else dmInventario.tblInventarioProdCODIGO_TEXTO.Value:=IntToStr(numMax);
      end;
      dmInventario.tblInventarioProd.Post;
      dmInventario.tblInventarioProd.ApplyUpdates;
      if not dmInventario.tblInventarioProd.Transaction.InTransaction then
      dmInventario.tblInventarioProd.Transaction.StartTransaction;
      try
        dmInventario.tblInventarioProd.Transaction.CommitRetaining;
      except
      dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
     end;
    end;
  end;
end;

procedure TfrmRegMiniInvientario.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblInventarioProd.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblInventarioProd.Close;
    dmInventario.tblInventarioProd.Open;
  end;
end;

procedure TfrmRegMiniInvientario.FormCreate(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;
  CodigoTexto:='';
end;

procedure TfrmRegMiniInvientario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmInventario.tblInventarioProd.Close;
end;

procedure TfrmRegMiniInvientario.RxDBGrid1DblClick(Sender: TObject);
begin
  CodigoTexto:= dmInventario.tblInventarioProdCODIGO_TEXTO.Value;
  Close;
end;

end.
