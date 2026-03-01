unit UFormRutaVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, DB, dbnavE, RxLookup, StdCtrls, Buttons, RxCtrls,
  ExtCtrls, Grids, DBGrids, Mask, DBCtrls, RxDBCtrl;

type
  TfrmRutasVentas = class(TForm)
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBNavigatorE1: TDBNavigatorE;
    DataSource1: TDataSource;
    dsQryEmpleados: TDataSource;
    dstblTipoComision: TDataSource;
    SkinData1: TSkinData;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRutasVentas: TfrmRutasVentas;

implementation

uses UDatModRuta, UGlobal;

{$R *.dfm}

procedure TfrmRutasVentas.FormCreate(Sender: TObject);
begin
  dmRutas.tblTipoComision.Close;
  dmRutas.tblTipoComision.Open;
  dmrutas.tblRutasVta.Close;
  dmrutas.tblRutasVta.Open;
end;

procedure TfrmRutasVentas.btnInsertarClick(Sender: TObject);
begin
  if dmrutas.tblRutasVta.State = dsBrowse then
  begin
    dmrutas.tblRutasVta.Append;
    dmrutas.tblRutasVtaFECHA.Value:=now;
    dmrutas.tblRutasVtaSTATUS.Value:='A';
    dmrutas.tblRutasVtaTIPO_COMISION.Value:=1;
    dmrutas.tblRutasVtaMONTO_COMISION.Value:=0;
  end;
end;

procedure TfrmRutasVentas.btnModificarClick(Sender: TObject);
begin
  if dmrutas.tblRutasVta.State = dsBrowse then
  dmrutas.tblRutasVta.Edit;
end;

procedure TfrmRutasVentas.btnSalvarClick(Sender: TObject);
begin
  if dmrutas.tblRutasVta.State in [dsEdit, dsInsert] then
  begin
    if dmrutas.tblRutasVta.State in [dsInsert] then
    dmrutas.tblRutasVtaCODIGO.Value := FsqlMaxNumero('RUTA_VTA','CODIGO');
    GlbSalvarQuery(dmrutas.tblRutasVta);
  end;
end;

procedure TfrmRutasVentas.btnCancelarClick(Sender: TObject);
begin
  if dmrutas.tblRutasVta.State in [dsEdit, dsInsert] then
  dmRutas.tblRutasVta.Cancel;
end;

procedure TfrmRutasVentas.btnCerarAbrirresClick(Sender: TObject);
begin
  dmrutas.tblRutasVta.Close;
  dmrutas.tblRutasVta.Open;
end;

end.
