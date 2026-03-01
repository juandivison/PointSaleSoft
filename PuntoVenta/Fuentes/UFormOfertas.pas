unit UFormOfertas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RxLookup, RxToolEdit, RxDBCtrl, DB,
  Buttons, ExtCtrls, Grids, DBGrids, ExtDlgs, RxCtrls;

type
  TfrmOfertas = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    dsqryInvOfertaLookup: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    dsqryTipoUnidadVta: TDataSource;
    dsqryTipoUnidadOferta: TDataSource;
    BitBtn1: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);

    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xCodP : integer;
    Procedure AbrirDatos(tipo:smallint;codProd:integer);
  end;

var
  frmOfertas: TfrmOfertas;

implementation

uses UDatModInventario, uglobal, UConsultaInventario;

{$R *.dfm}

procedure TfrmOfertas.AbrirDatos(tipo:smallint;codProd:integer);
begin
  if tipo = 1 then //todo
  begin

    dmInventario.qryInvOfertaLookup.Close;
    dmInventario.qryInvOfertaLookup.Open;
    dmInventario.qryInvOfertaLookup.Locate('CODIGO',xCodP,[]);

    dmInventario.qryTipoUnidadVta.Close;
    dmInventario.qryTipoUnidadVta.Params[0].Value:= codProd;
    dmInventario.qryTipoUnidadVta.Open;

    dmInventario.qryTipoUnidadOferta.Close;
    dmInventario.qryTipoUnidadOferta.Params[0].Value:= codProd;
    dmInventario.qryTipoUnidadOferta.Open;

    dmInventario.tblOfertas.Close;
    dmInventario.tblOfertas.Params[0].Value:= codProd;
    dmInventario.tblOfertas.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmInventario.tblOfertas.Open;
  end else
  if tipo = 2 then //Parcial
  begin    
    dmInventario.qryTipoUnidadVta.Close;
    dmInventario.qryTipoUnidadVta.Params[0].Value:= codProd;
    dmInventario.qryTipoUnidadVta.Open;

    dmInventario.qryTipoUnidadOferta.Close;
    dmInventario.qryTipoUnidadOferta.Params[0].Value:= codProd;
    dmInventario.qryTipoUnidadOferta.Open;

    dmInventario.tblOfertas.Close;
    dmInventario.tblOfertas.Params[0].Value:= codProd;
    dmInventario.tblOfertas.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmInventario.tblOfertas.Open;
  end;
end;

procedure TfrmOfertas.FormCreate(Sender: TObject);
begin
  AbrirDatos(1,xCodP);
end;

procedure TfrmOfertas.RxDBLookupCombo1Change(Sender: TObject);
begin
  AbrirDatos(2,dmInventario.tblOfertasCODIGO_PROD.Value);
end;

procedure TfrmOfertas.btnCerarAbrirresClick(Sender: TObject);
begin
  if xCodP > 0 then
  AbrirDatos(1,xCodP)
  else
  if not dmInventario.tblOfertasCODIGO_PROD.IsNull then
  AbrirDatos(1,dmInventario.tblOfertasCODIGO_PROD.Value)
  else
  AbrirDatos(1,dmInventario.tblInventarioProdCODIGO.Value);
end;

procedure TfrmOfertas.BitBtn1Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    if dmInventario.tblInventarioProd.Locate('codigo',frmConsultaInventario.ibquery1codigo.Value,[]) then
    if not dmInventario.tblOfertas.Locate('CODIGO_PROD',frmConsultaInventario.ibquery1codigo.Value,[]) then
    begin
      dmInventario.tblOfertas.Append;
      dmInventario.tblOfertasCODIGO_PROD.Value:=frmConsultaInventario.ibquery1codigo.Value;
      dmInventario.tblOfertasSTATUS.Value:='A';
      dmInventario.tblOfertasTIPO_UNIDADVTA.Value:=1;
      dmInventario.tblOfertasTIPO_UNIDADOFTA.Value:=1;
      RxDBLookupCombo2.SetFocus;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmOfertas.btnInsertarClick(Sender: TObject);
var
  xcodAuxi : integer;
begin
  if not dmInventario.tblOfertasCODIGO_PROD.IsNull then
  xcodAuxi:= dmInventario.tblOfertasCODIGO_PROD.Value
  else xcodAuxi:=-1;

  dmInventario.tblOfertas.Append;
  if xcodAuxi = -1 then
  dmInventario.tblOfertasCODIGO_PROD.Value:=dmInventario.tblInventarioProdCODIGO.Value
  else dmInventario.tblOfertasCODIGO_PROD.Value:= xcodAuxi;

  dmInventario.tblOfertasSTATUS.Value:='A';
  dmInventario.tblOfertasTIPO_UNIDADVTA.Value:=1;
  dmInventario.tblOfertasTIPO_UNIDADOFTA.Value:=1;
  RxDBLookupCombo2.SetFocus;
end;


procedure TfrmOfertas.btnModificarClick(Sender: TObject);
begin
  dmInventario.tblOfertas.Edit;
end;

procedure TfrmOfertas.btnSalvarClick(Sender: TObject);
begin
  if dmInventario.tblOfertas.state in [dsedit, dsinsert] then
  begin
    if dmInventario.tblOfertasCANTIDAD.IsNull then
    raise Exception.Create('Favor indicar cantidad');
    GlbSalvarQuery(dmInventario.tblOfertas);
  end;
end;

procedure TfrmOfertas.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
    dmInventario.tblOfertas.Close;
    dmInventario.tblOfertas.SelectSQL.Text:= 'Select * From Ofertas';
    dmInventario.tblOfertas.Open;
  end else
  begin
    dmInventario.tblOfertas.Close;
    dmInventario.tblOfertas.SelectSQL.Text:= dminventario.qryoferta_base.SQL.Text;

    dmInventario.tblOfertas.Params[0].Value:= dmInventario.tblInventarioProdCODIGO.Value;
    dmInventario.tblOfertas.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
    dmInventario.tblOfertas.Open;
  end;
end;

end.
