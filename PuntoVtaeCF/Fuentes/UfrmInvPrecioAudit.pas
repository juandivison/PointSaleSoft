unit UfrmInvPrecioAudit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, RxCtrls, RxDBCtrl;

type
  TfrmInvPrecioAudit = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn29: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    procedure BitBtn35Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInvPrecioAudit: TfrmInvPrecioAudit;

implementation

uses UDatModInventario, Uglobal, UConsultaInventario,
  UFormPrecioXUnidadNivel, UPrecioProdXUnidad;

{$R *.dfm}

procedure TfrmInvPrecioAudit.BitBtn35Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    dmInventario.tblInventarioProd.locate('codigo',frmConsultaInventario.ibquery1codigo.Value,[]);
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmInvPrecioAudit.FormCreate(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Close;//dmInventario.tblInventarioProd.selectSQL.TEXT
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_AuditarPrecioBase.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
end;

procedure TfrmInvPrecioAudit.BitBtn29Click(Sender: TObject);
var
  xProd : integer;
begin
  if (dmInventario.tblInventarioProdPRECIO_COMPRA.Value <= 0) then
  begin
    MessageDlg('Producto no tiene precio de costo, verifique',mtwarning,[mbok],0);
    exit;
  end;
  {if (GLBPrecioMayUnidad = 1) then
  begin
    xProd := dmInventario.tblInventarioProdCodigo.Value;
    if not Assigned(frmPrecioUnidadNivel) then
    frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
    try
      frmPrecioUnidadNivel.xProd := xProd;
      frmPrecioUnidadNivel.buscarCodigo(xProd);
      frmPrecioUnidadNivel.Show;
    finally
    //frmPrecioUnidadNivel.Free;
    //frmPrecioUnidadNivel:=Nil;
    end;
  end else }
  if GlbUsaPUnidadLevel = 1 then
  begin
    xProd := dmInventario.tblInventarioProdCodigo.Value;
    if not Assigned(frmPrecioUnidadNivel) then
    frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
    try
      frmPrecioUnidadNivel.xProd := xProd;
      frmPrecioUnidadNivel.buscarCodigo(xProd);
      frmPrecioUnidadNivel.Show;
    finally
    //frmPrecioUnidadNivel.Free;
    //frmPrecioUnidadNivel:=Nil;
    end;
  end else
  begin
    {
    frmPrecioProdXUnidad:=TfrmPrecioProdXUnidad.Create(nil);
    try
      if not Assigned(frmPrecioProdXUnidad) then
      frmPrecioProdXUnidad.buscarCodigo(dmInventario.tblInventarioProdCodigo.Value);
      frmPrecioProdXUnidad.Show;
    finally
    //frmPrecioProdXUnidad.Free;
    //frmPrecioProdXUnidad:=Nil;
    end;
    }
  end;
end;

procedure TfrmInvPrecioAudit.BitBtn2Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Next;
  BitBtn29Click(Self);
end;

procedure TfrmInvPrecioAudit.BitBtn1Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Prior;
  BitBtn29Click(Self);
end;

procedure TfrmInvPrecioAudit.BitBtn3Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.First;
  BitBtn29Click(Self);  
end;

procedure TfrmInvPrecioAudit.BitBtn4Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Last;
  BitBtn29Click(Self);
end;

procedure TfrmInvPrecioAudit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmInventario.tblInventarioProd.Close;//dmInventario.tblInventarioProd.selectSQL.TEXT
  dmInventario.tblInventarioProd.Filtered:=False;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
end;

end.
