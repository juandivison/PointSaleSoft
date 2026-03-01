unit UFormClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, RXCtrls, RXDBCtrl, Buttons, Grids,
  DBGrids, DB, WinSkinData;

type
  TfrmClientes = class(TForm)
    Label5: TLabel;
    DBEdit1: TDBEdit;
    dmClientes: TDataSource;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    BitBtn7: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses UDMResidentes, UGlobal, UFormBuscarResidentePuerta;

{$R *.dfm}

procedure TfrmClientes.BitBtn1Click(Sender: TObject);
begin
  if dmResidentes.tblClientes.State in [dsBrowse] then
  begin
    dmResidentes.tblClientes.Insert;
    dmResidentes.tblClientesFECHA_INSERT.Value   := Now;
    dmResidentes.tblClientesCODIGO_USUARIO.Value := GlbCodigousuario;
    dmResidentes.tblClientesSTATUS.Value         := 'A';
  end;
end;

procedure TfrmClientes.BitBtn2Click(Sender: TObject);
begin
  if dmResidentes.tblClientes.State in [dsBrowse] then
  begin
    dmResidentes.tblClientes.Edit;
  end;
end;

procedure TfrmClientes.BitBtn3Click(Sender: TObject);
begin
  if dmResidentes.tblClientes.State In [dsEdit, dsInsert] then
  begin
    dmResidentes.tblClientes.Cancel;
  end;
end;

procedure TfrmClientes.BitBtn4Click(Sender: TObject);
begin
  if dmResidentes.tblClientes.State In [dsEdit, dsInsert] then
  begin
    if dmResidentes.tblClientesMEMBER_ID.IsNull then
    begin
      MessageDlg('Favor indicar id residente', mtInformation,[mbok],0);
      Exit;
    end;
    if dmResidentes.tblClientesRNC_CEDULA.IsNull then
    begin
      MessageDlg('Favor indicar cedula/rnc cliente', mtInformation,[mbok],0);
      Exit;
    end;

    GlbSalvarQuery(dmResidentes.tblClientes);
  end;
end;

procedure TfrmClientes.BitBtn5Click(Sender: TObject);
begin
  if dmResidentes.tblClientes.State In [dsBrowse, dsInactive] then
  begin
    dmResidentes.tblClientes.Close;
    dmResidentes.tblClientes.Open;
  end;
end;

procedure TfrmClientes.BitBtn7Click(Sender: TObject);
begin
  //frmBuscarResidente:=TfrmBuscarResidente.Create(nil);
  if dmresidentes.tblResidentes.State = dsInactive then
  begin
    dmresidentes.tblResidentes.Filtered:=False;
    dmresidentes.tblResidentes.Open;
  end;
  frmBuscarResidentePuerta:=TfrmBuscarResidentePuerta.Create(nil);
  try
    if frmBuscarResidentePuerta.Showmodal = mrOk then
    begin
      if dmresidentes.tblResidentes.Locate('MEMBER_ID', frmBuscarResidentePuerta._memberID, []) then
      begin
      //if Not dmResidentes.tblClientes.Locate('MEMBER_ID', frmBuscarResidentePuerta._memberID, []) then
      //begin
        BitBtn1Click(Self);
        dmResidentes.tblClientesMEMBER_ID.Value:= frmBuscarResidentePuerta._memberID;
        if dmResidentes.tblResidentes.Locate('MEMBER_ID', dmResidentes.tblClientesMEMBER_ID.Value, []) then
        dmResidentes.tblClientesNOMBRE_COMPLETO.Value:=
        dmResidentes.tblResidentesMFIRSTNAME.Value;
        if Not dmResidentes.tblResidentesMLASTNAME.IsNull then
        dmResidentes.tblClientesNOMBRE_COMPLETO.Value:=
        dmResidentes.tblClientesNOMBRE_COMPLETO.Value +dmResidentes.tblResidentesMLASTNAME.Value;
        if not dmResidentes.tblResidentesMIDENTIFICATIONID.IsNull then
        dmResidentes.tblClientesRNC_CEDULA.Value:=
        dmResidentes.tblResidentesMIDENTIFICATIONID.Value;
      //end;
    end;
    end;
  finally
  frmBuscarResidentePuerta.Free;
  frmBuscarResidentePuerta:=Nil;
  end;
end;

procedure TfrmClientes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dmResidentes.tblClientes.State in [dsEdit, dsInsert] then
  begin
    MessageDlg('Hay una transacción pendiente, verifique',mtwarning,[mbOk],0);
    CanClose:=False;
  end else
  CanClose:=True;
end;

end.
