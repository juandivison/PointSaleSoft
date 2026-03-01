unit UFormARS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EditNew, Menus, Buttons, RxCtrls, ExtCtrls, ComCtrls,
  db, Grids, DBGrids, RxDBCtrl, DBCtrls, Mask, RxLookup, IBCustomDataSet,
  IBQuery, WinSkinData;

type
  TfrmARS = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn7: TBitBtn;
    PopupMenu1: TPopupMenu;
    ListadoARS1: TMenuItem;
    edtBuscar: TEditN;
    RxDBGrid1: TRxDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit4: TDBEdit;
    Label19: TLabel;
    BitBtn29: TBitBtn;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit5: TDBEdit;
    DBComboBox1: TDBComboBox;
    labelCantDias: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    tblARS: TIBDataSet;
    tblARSIDARS: TIntegerField;
    tblARSRNC: TIBStringField;
    tblARSNOMBRE: TIBStringField;
    tblARSLETRAAUTORIZACION: TIBStringField;
    tblARSCONTACTO: TIBStringField;
    tblARSDIRECCION: TMemoField;
    tblARSTELEFONO: TIBStringField;
    tblARSTIPO_NCF: TIBStringField;
    tblARSDIASDECREDITO: TIntegerField;
    tblARSPORC_DESCUENTO: TFloatField;
    tblARSSTATUS: TIBStringField;
    tblARSFECHA_IN: TDateTimeField;
    tblARSFECHA_UPDATE: TDateTimeField;
    tblARSIN_POR: TIBStringField;
    tblARSUPDATE_POR: TIBStringField;
    dstblARS: TDataSource;
    qryArs: TIBQuery;
    qryArsNOMBRE: TIBStringField;
    dsqryArs: TDataSource;
    SkinData1: TSkinData;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    tblARSNOMBRE_DEPENDIENTE: TIBStringField;
    RxDBGrid2: TRxDBGrid;
    procedure edtBuscarEnter(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure ListadoARS1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure qryArsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmARS: TfrmARS;

implementation
uses UDatModConectar, uglobal, UDatModClientes, UDatModFactura,
  UMaestroClientes;

{$R *.dfm}

procedure TfrmARS.edtBuscarEnter(Sender: TObject);
begin
  edtBuscar.Text:='';
end;

procedure TfrmARS.BitBtn29Click(Sender: TObject);
begin
  if tblARS.State = dsBrowse then
  begin
    tblARS.Edit;
    tblARSTIPO_NCF.AsVariant:=null;
    btnSalvarClick(Self);
  end else
  if tblARS.State in [dsEdit] then
  begin
    tblARSTIPO_NCF.AsVariant:=null;
    btnSalvarClick(Self);
  end;
end;

procedure TfrmARS.btnSalvarClick(Sender: TObject);
var
  tmp : string;
  esIns : boolean;
begin
  esIns:=False;
  if tblARS.state in [dsEdit, dsInsert] then
  begin
    //if tblars.State = dsInsert then
    esIns:=True;
    //else esIns := False;
    
    if tblARS.State in [dsInsert] then
    begin
      if tblARSIDARS.IsNull then
      tblARSIDARS.Value:= FsqlMaxNumero('ARS','IDARS');
    end;
    tmp:=tblARSNOMBRE.Value;
    GlbSalvarQuery(tblARS);
    dmclientes.qryClientes.Close;
    dmclientes.qryClientes.Open;
  end;
  qryArs.Close;
  qryArs.Open;
  qryArs.Locate('NOMBRE',tmp,[]);
  if esIns then
  begin
    dmclientes.qryClientes.Close;
    dmclientes.qryClientes.Open;
    if not dmclientes.qryClientes.Locate('RNC_NUMERO',tblARSRNC.Value,[]) then
    begin
      MessageDlg('ARS no existe como cliente, será agregado.',mtWarning,[mbok],0);
      frmclientes:=Tfrmclientes.Create(nil);
      try
        dmclientes.tblClientes.Append;
        dmclientes.tblClientesNOMBRE_CTE.Value      := tblARSNOMBRE.Value;
        dmclientes.tblClientesNOMBRE_FACTURAR.Value := tblARSNOMBRE.Value;
        dmclientes.tblClientesNOMBRE_ABREV.Value    := tblARSNOMBRE.Value;
        dmclientes.tblClientesTIPO_CLIENTE.Value    := 0;
        dmclientes.tblClientesSTATUS_CLIENTE.Value  := 'A';
        dmclientes.tblClientesFECHA_INSERTADO.Value := now;
        dmclientes.tblClientesINSERTADO_POR.Value   := strusername;
        dmclientes.tblClientesRNC_NUMERO.Value      := tblARSRNC.Value;
        dmclientes.tblClientesCIA_KEY.Value         := 1;
        dmclientes.tblClientesMONEDA_FACT.Value     := '1';
        frmclientes.Showmodal;
      finally
      FreeAndNil(frmclientes);
      end;
    end;
  end;
  dmclientes.tblClientes.Close;
  dmclientes.tblClientes.Open;
  dmclientes.qryClientes.close;
  dmclientes.qryClientes.Open;
  if dmclientes.qryClientes.Locate('RNC_NUMERO', tblARSRNC.Value,[]) then
  begin
    if dmclientes.tblClientes.Locate('RNC_NUMERO', tblARSRNC.Value,[]) then
    begin
      dmclientes.tblClientes.Edit;
      dmclientes.tblClientesCODIGO_AGENCIA.Value:= tblARSIDARS.Value;
      GlbSalvarQuery(dmclientes.tblClientes);
    end;
  end;
end;

procedure TfrmARS.btnModificarClick(Sender: TObject);
begin
  if tblARS.State in [dsBrowse] then
  tblARS.Edit;
end;

procedure TfrmARS.btnCancelarClick(Sender: TObject);
begin
  if tblARS.state in [dsEdit, dsInsert] then
  tblARS.Cancel;
end;

procedure TfrmARS.btnCerarAbrirresClick(Sender: TObject);
begin
   if tblARS.state in [dsBrowse] then
   begin
     tblARS.Close;
     tblARS.Open;
   end;
end;

procedure TfrmARS.btnInsertarClick(Sender: TObject);
begin
  if tblARS.State in [dsBrowse] then
  begin
    tblARS.Append;
    tblARSSTATUS.Value:='A';
    tblARSFECHA_IN.Value:=now;
    tblARSIN_POR.Value:=strusername;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmARS.ListadoARS1Click(Sender: TObject);
begin
  MessageDlg('Will be ready very soon...',mtinformation, [mbok], 0);
end;

procedure TfrmARS.FormCreate(Sender: TObject);
begin
  tblARS.Close;
  tblARS.Open;
  qryArs.Close;
  qryArs.open;
  dmFactura.tblTipoCF.Close;
  dmFactura.tblTipoCF.Open;
end;

procedure TfrmARS.edtBuscarChange(Sender: TObject);
begin
  qryArs.Locate('NOMBRE',edtBuscar.Text,[]);
end;

procedure TfrmARS.BitBtn7Click(Sender: TObject);
begin
  qryArs.Locate('NOMBRE',edtBuscar.Text,[]);
end;

procedure TfrmARS.qryArsAfterScroll(DataSet: TDataSet);
begin
  tblARS.Locate('NOMBRE',qryArsNOMBRE.Value,[]);
end;

end.
