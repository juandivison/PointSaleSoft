unit UFormProveedores;

interface             

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, Buttons,
  RXCtrls, ExtCtrls, WinSkinData, RxLookup, RxDBComb;

type
  TfrmProveedores = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsProveedores: TDataSource;
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    SkinData1: TSkinData;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label18: TLabel;
    Label27: TLabel;
    labelCantDias: TLabel;
    Label28: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBComboBox1: TDBComboBox;
    DBEdit21: TDBEdit;
    Button1: TButton;
    dstblCondicionVenta: TDataSource;
    BitBtn1: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label19: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    Label20: TLabel;
    RxDBLookupCombo15: TRxDBLookupCombo;
    Label72: TLabel;
    RxDBLookupCombo13: TRxDBLookupCombo;
    Label71: TLabel;
    dsqryMunicipioseCF: TDataSource;
    dsqryProvinciaseCF: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo13Enter(Sender: TObject);
    procedure RxDBLookupCombo13Exit(Sender: TObject);
    procedure RxDBLookupCombo15Enter(Sender: TObject);
  private
    { Private declarations }
    Procedure ValidarRncCedula;
    procedure ProcOpenTerritorios;
  public
    { Public declarations }
    _codP : integer;
  end;

var
  frmProveedores: TfrmProveedores;

implementation

uses UDatModRegOpeDiaria, uglobal, UformVendedorProveedor, UDatModClientes,
  UBuscarProveedores, UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmProveedores.FormCreate(Sender: TObject);
begin
  dmDatos.qryProvinciaseCF.Close;
  dmDatos.qryProvinciaseCF.Open;
  dmDatos.qryMunicipioseCF.Close;
  dmDatos.qryMunicipioseCF.Open;

  dtmTransOpeDiaria.tblPersonaJuridica.Close;
  dtmTransOpeDiaria.tblPersonaJuridica.Open;
  dtmTransOpeDiaria.tblProveedores.Close;
  dtmTransOpeDiaria.tblProveedores.Open;
  dmClientes.tblCondicionVenta.Close;
  dmClientes.tblCondicionVenta.Open;
end;

procedure TfrmProveedores.btnInsertarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.state = dsBrowse then
  dtmTransOpeDiaria.tblProveedores.Insert;
  dtmTransOpeDiaria.tblProveedoresTIPO_CLIENTE.Value:=0;
  dtmTransOpeDiaria.tblProveedoresSTATUS.Value:='A';
  dtmTransOpeDiaria.tblProveedoresFECHA_IN.Value:= Now;
  dtmTransOpeDiaria.tblProveedoresIN_POR.Value:= strUserName;
  dtmTransOpeDiaria.tblProveedoresCIA_KEY.Value:= GlbCia_Key;
  DBEdit3.SetFocus;
end;

procedure TfrmProveedores.btnModificarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State In [dsBrowse] then
  dtmTransOpeDiaria.tblProveedores.Edit;
end;

procedure TfrmProveedores.btnSalvarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State In [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblProveedores.Post;
    dtmTransOpeDiaria.tblProveedores.ApplyUpdates;
    if Not dtmTransOpeDiaria.tblProveedores.Transaction.InTransaction then
    dtmTransOpeDiaria.tblProveedores.Transaction.StartTransaction;
    try
      dtmTransOpeDiaria.tblProveedores.Transaction.CommitRetaining;
    except
    dtmTransOpeDiaria.tblProveedores.Transaction.Rollback;
    end;
  end;
end;

procedure TfrmProveedores.btnCancelarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State In [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblProveedores.Cancel;
end;

procedure TfrmProveedores.btnCerarAbrirresClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State = dsBrowse then
  begin
    dtmTransOpeDiaria.tblProveedores.Close;
    //dtmTransOpeDiaria.tblProveedores.params[0].Value:=glbCia_Key;
    dtmTransOpeDiaria.tblProveedores.Open;
  end;
end;

procedure TfrmProveedores.Button1Click(Sender: TObject);
begin
  frmVendedorProveedor:=TfrmVendedorProveedor.Create(nil);
  try
    frmVendedorProveedor.showmodal;
  finally
  frmVendedorProveedor.free;
  frmVendedorProveedor:=nil;
  end;
end;

procedure TfrmProveedores.BitBtn1Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      if Not dtmTransOpeDiaria.tblProveedores.Locate('CODIGO_CTE', frmProcBuscarProv.xCodigoCte,[]) then
      MessageDlg('Codigo proveedor no encontrado, verifique', mtInformation, [mbok], 0);
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end;
end;

procedure TfrmProveedores.DBEdit14Exit(Sender: TObject);
begin
  if (dtmTransOpeDiaria.tblProveedores.State in [dsEdit, dsInsert]) then
  ValidarRncCedula;
end;

procedure TfrmProveedores.ValidarRncCedula;
begin
  if (Length(StringReplace(dtmTransOpeDiaria.tblProveedoresRNC_PROVEEDOR.Value,'-','',[rfReplaceAll])) = 11) then
  begin
    if Not (DocumentoValido(dcCedula,dtmTransOpeDiaria.tblProveedoresRNC_PROVEEDOR.Value)) then
    begin
      if dmClientes.tblClientes.State in [dsEdit, dsInsert] then
      begin
        Messagedlg('Número cédula no válido, verifique.',mtInformation,[mbok],0);
        dtmTransOpeDiaria.tblProveedoresRNC_PROVEEDOR.AsVariant:= null;
        dbedit4.SetFocus;
      end;
      Exit;
    end else dtmTransOpeDiaria.tblProveedorestipodoc.Value:=1;
  end else
  if (Length(StringReplace(dtmTransOpeDiaria.tblProveedoresRNC_PROVEEDOR.Value,'-','',[rfReplaceAll])) = 9) then
  begin
    if Not (DocumentoValido(dcRNC,dtmTransOpeDiaria.tblProveedoresRNC_PROVEEDOR.Value)) then
    begin
      Messagedlg('Favor indicar #RNC válido.',mtInformation,[mbok],0);
      dtmTransOpeDiaria.tblProveedoresRNC_PROVEEDOR.AsVariant:= null;
      dbedit4.SetFocus;
    end else dtmTransOpeDiaria.tblProveedorestipodoc.Value:=1;
  end else
  dtmTransOpeDiaria.tblProveedorestipodoc.Value:=3;
end;

procedure TfrmProveedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  _codP:= dtmTransOpeDiaria.tblProveedoresCODIGO_CTE.Value;
end;

procedure TfrmProveedores.RxDBLookupCombo13Enter(Sender: TObject);
begin
 ProcOpenTerritorios;
end;

procedure TfrmProveedores.ProcOpenTerritorios;
begin
  dmDatos.qryMunicipioseCF.Close;
  dmDatos.qryMunicipioseCF.Params[0].Value:=dtmTransOpeDiaria.tblProveedoresID_PROVINCIA.Value;
  dmDatos.qryMunicipioseCF.Params[1].Value:=dtmTransOpeDiaria.tblProveedoresID_PROVINCIA.Value;
  dmDatos.qryMunicipioseCF.Open;
end;

procedure TfrmProveedores.RxDBLookupCombo13Exit(Sender: TObject);
begin
 ProcOpenTerritorios;
end;

procedure TfrmProveedores.RxDBLookupCombo15Enter(Sender: TObject);
begin
 ProcOpenTerritorios;
end;

end.
