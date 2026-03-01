unit URegContactoCtes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, RxLookup, DB, StdCtrls, Mask, DBCtrls,
  Buttons, WinSkinData;

type
  TfrmRegContactos = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
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
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label10: TLabel;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegContactos: TfrmRegContactos;

implementation

uses UDatModClientes, URepContactoCte, UDatModCompania, UGlobal;

{$R *.dfm}

procedure TfrmRegContactos.FormCreate(Sender: TObject);
begin
  dmClientes.qryTipoContacto.Close;
  dmClientes.qryTipoContacto.Open;
  dmClientes.tblDatosContacto.Close;
  dmClientes.tblDatosContacto.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.tblDatosContacto.Open;
end;

procedure TfrmRegContactos.SpeedButton1Click(Sender: TObject);
begin
  if dmClientes.tblDatosContacto.State in [dsInsert, dsEdit] then
  begin
    if dmClientes.tblDatosContactoCODIGO_CTE.IsNull then
    begin
      MessageDlg('Debe indicar codigo cliente',mtError,[mbok],0);
      Exit;
    end;
    dmClientes.tblDatosContacto.Post;
    dmClientes.tblDatosContacto.ApplyUpdates;
    if not dmClientes.tblDatosContacto.Transaction.InTransaction then
    dmClientes.tblDatosContacto.Transaction.StartTransaction;
    try
      dmClientes.tblDatosContacto.Transaction.CommitRetaining;
    except
    dmClientes.tblDatosContacto.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRegContactos.SpeedButton2Click(Sender: TObject);
begin
  if dmClientes.tblDatosContacto.State = dsBrowse then
  begin
    dmClientes.tblDatosContacto.Insert;
    dmClientes.tblDatosContactoCODIGO_CTE.Value:= dmclientes.tblClientesCODIGO_CTE.Value;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmRegContactos.SpeedButton3Click(Sender: TObject);
begin
  if dmClientes.tblDatosContacto.State in [dsinsert, dsEdit] then
  begin
    dmClientes.tblDatosContacto.Cancel;
  end else
  begin
{    if MessageDlg('Cancelar plan?', mtinformation,[mbyes,mbno],0)=mryes then
    begin
    if dmClientes.tblDatosContactoDetSTATUS.Value = 'A' then
    begin
      dmClientes.tblDatosContactoDet.Edit;
      dmClientes.tblDatosContactoDetSTATUS.Value:='C';
      SpeedButton6Click(Self);
    end;
    end;}
  end;
end;

procedure TfrmRegContactos.SpeedButton7Click(Sender: TObject);
begin
  dmClientes.tblDatosContacto.Close;
  dmClientes.tblDatosContacto.Open;
end;

procedure TfrmRegContactos.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar record?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    dmClientes.tblDatosContacto.Delete;
    dmClientes.tblDatosContacto.ApplyUpdates;
    if not dmClientes.tblDatosContacto.Transaction.InTransaction then
    dmClientes.tblDatosContacto.Transaction.StartTransaction;
    try
      dmClientes.tblDatosContacto.Transaction.CommitRetaining;
    except
    dmClientes.tblDatosContacto.Transaction.RollbackRetaining;
    end;    
  end;
end;

procedure TfrmRegContactos.SpeedButton4Click(Sender: TObject);
begin
  dmCompania.tblCompania.close;
  dmCompania.tblCompania.open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);  
  dmClientes.qryTipoContactoRep.Close;
  dmClientes.qryTipoContactoRep.Open;
  qckRepContactoCte:=TqckRepContactoCte.Create(Nil);
  try
    qckRepContactoCte.Preview;
  finally
  qckRepContactoCte.Free;
  qckRepContactoCte:=Nil;
  end;
end;

end.
