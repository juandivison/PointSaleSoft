unit UFormReferenciaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, RxLookup, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  ExtCtrls, Buttons, RXCtrls, WinSkinData;

type
  TfrmReferenciaClientes = class(TForm)
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label20: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label21: TLabel;
    RxDBGrid2: TRxDBGrid;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReferenciaClientes: TfrmReferenciaClientes;
  nombreCte : String;

implementation

uses UDatModClientes, Uglobal;

{$R *.dfm}

procedure TfrmReferenciaClientes.SpeedButton1Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaMaster.State in [dsInsert, dsEdit] then
  begin
    //dmClientes.tblCteReferenciaMasterid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    if dmClientes.tblCteReferenciaMasterCODIGO_CTE.IsNull then
    begin
      MessageDlg('Debe indicar cliente',mtError,[mbok],0);
      Exit;
    end;
    dmClientes.tblCteReferenciaMaster.Post;
    dmClientes.tblCteReferenciaMaster.ApplyUpdates;
    if not dmClientes.tblCteReferenciaMaster.Transaction.InTransaction then
    dmClientes.tblCteReferenciaMaster.Transaction.StartTransaction;
    try
      dmClientes.tblCteReferenciaMaster.Transaction.CommitRetaining;
    except
    dmClientes.tblCteReferenciaMaster.Transaction.RollbackRetaining;
    end;
    {dmClientes.qryReferenciacliente.close;
    dmClientes.qryReferenciacliente.Open;
    dmClientes.qryReferenciacliente.Locate('CODIGO_CTE;DESCRIPCION',
    VarArrayOf([dmClientes.tblCteReferenciaMasterCODIGO_CTE.Value,
    dmClientes.tblCteTipoReferenciaDESCRIPCION.Value]),[]);}
  end;
end;

procedure TfrmReferenciaClientes.SpeedButton2Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaMaster.State = dsBrowse then
  begin
    dmClientes.tblCteReferenciaMaster.Insert;
    dmClientes.tblCteReferenciaMasterCODIGO_CTE.Value:=dmclientes.tblClientesCODIGO_CTE.Value;
    RxDBLookupCombo2.SetFocus;
  end;
end;

procedure TfrmReferenciaClientes.SpeedButton3Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaMaster.State in [dsinsert, dsEdit] then
  begin
    dmClientes.tblCteReferenciaMaster.Cancel;
  end;
end;

procedure TfrmReferenciaClientes.SpeedButton7Click(Sender: TObject);
begin
  dmClientes.tblCteReferenciaMaster.Close;
  dmClientes.tblCteReferenciaMaster.Open;
  dmClientes.qryReferenciacliente.Close;
  dmClientes.qryReferenciacliente.Params[0].Value:= dmclientes.tblClientesCODIGO_CTE.Value;
  dmClientes.qryReferenciacliente.Open;  
end;

procedure TfrmReferenciaClientes.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Todas las referencias para este cliente seran eliminadas, continuar?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    dmClientes.tblCteReferenciaDet.First;
    While Not dmClientes.tblCteReferenciaDet.Eof do
    begin
      dmClientes.tblCteReferenciaDet.Delete;
    end;
    SpeedButton6Click(Self);
  end;
  if dmClientes.tblCteReferenciaMaster.RecordCount = 0 then
  begin
    dmClientes.tblCteReferenciaMaster.Delete;
    SpeedButton1Click(Self);
  end;
end;

procedure TfrmReferenciaClientes.SpeedButton4Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaMaster.RecordCount > 0 then
  begin
    dmClientes.tblCteReferenciaDet.Insert;
    dmClientes.tblCteReferenciaDetCODIGO_CTE.Value:=dmClientes.tblCteReferenciaMasterCODIGO_CTE.Value;
    dmClientes.tblCteReferenciaDetTIPO_REFERENCIA.Value:=dmClientes.tblCteReferenciaMasterTIPO_REFERENCIA.Value;
    dmClientes.tblCteReferenciaDetPAIS.Value:='REPUBLICA DOMINICANA';
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmReferenciaClientes.SpeedButton5Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaDet.State in [dsinsert, dsEdit] then
  begin
    dmClientes.tblCteReferenciaDet.Cancel;
  end;
end;

procedure TfrmReferenciaClientes.SpeedButton6Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaDet.State in [dsinsert, dsEdit] then
  begin
    if MessageDlg('Eliminar esta referencia?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmClientes.tblCteReferenciaDet.Delete;
      SpeedButton10Click(Self);
    end;
  end;
end;

procedure TfrmReferenciaClientes.SpeedButton10Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaDet.State in [dsInsert, dsEdit] then
  begin
    //dmClientes.tblCteReferenciaMasterid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    if dmClientes.tblCteReferenciaMasterCODIGO_CTE.IsNull or
    dmClientes.tblCteReferenciaMasterTIPO_REFERENCIA.IsNull then
    begin
      MessageDlg('Debe indicar cliente y referencia',mtError,[mbok],0);
      Exit;
    end;
    dmClientes.tblCteReferenciaDetSERIE.Value:=
    FsqlMaxNumero('cte_referencia_det','serie');
    if dmClientes.tblCteReferenciaDetSERIE.IsNull or
    (dmClientes.tblCteReferenciaDetSERIE.Value = 0) then
    dmClientes.tblCteReferenciaDetSERIE.Value:=1; 
    dmClientes.tblCteReferenciaDet.Post;
    dmClientes.tblCteReferenciaDet.ApplyUpdates;
    if not dmClientes.tblCteReferenciaDet.Transaction.InTransaction then
    dmClientes.tblCteReferenciaDet.Transaction.StartTransaction;
    try
      dmClientes.tblCteReferenciaDet.Transaction.CommitRetaining;
    except
    dmClientes.tblCteReferenciaDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmReferenciaClientes.BitBtn9Click(Sender: TObject);
begin
  dmClientes.tblCteReferenciaMaster.First;
end;

procedure TfrmReferenciaClientes.BitBtn10Click(Sender: TObject);
begin
  dmClientes.tblCteReferenciaMaster.Prior;
end;

procedure TfrmReferenciaClientes.BitBtn11Click(Sender: TObject);
begin
  dmClientes.tblCteReferenciaMaster.Next;
end;

procedure TfrmReferenciaClientes.BitBtn12Click(Sender: TObject);
begin
  dmClientes.tblCteReferenciaMaster.Last;
end;

procedure TfrmReferenciaClientes.FormCreate(Sender: TObject);
begin
  nombreCte:='';
  dmClientes.tblCteReferenciaMaster.Close;
  dmClientes.tblCteReferenciaMaster.Open;
  if dmClientes.tblClientesNOMBRE_CTE.IsNull then
  nombreCte:= dmClientes.tblClientesNOMBRE_FACTURAR.Value
  else
  nombreCte:= dmClientes.tblClientesNOMBRE_CTE.Value;
  label21.Caption:= nombreCte;
  dmClientes.tblCteTipoReferencia.Close;
  dmClientes.tblCteTipoReferencia.Open;
end;

procedure TfrmReferenciaClientes.BitBtn1Click(Sender: TObject);
begin
  if dmClientes.tblCteReferenciaDet.State in [dsBrowse] then
  begin
    dmClientes.tblCteReferenciaDet.Edit;
  end;
end;

end.
