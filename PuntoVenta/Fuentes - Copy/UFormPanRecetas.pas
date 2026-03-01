unit UFormPanRecetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl, Buttons, Grids,
  db, DBGrids, RXCtrls, RxLookup, WinSkinData, Menus, ExtDlgs, ExtCtrls,
  jpeg;

type
  TfrmRecetas = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label6: TLabel;
    SpeedButton4: TSpeedButton;
    SkinData1: TSkinData;
    PopupMenu1: TPopupMenu;
    SelectSkin1: TMenuItem;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    DBStatusLabel2: TDBStatusLabel;
    Image1: TImage;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecetas: TfrmRecetas;

implementation

uses UDatModPanaderia, UGlobal;

{$R *.dfm}

procedure TfrmRecetas.BitBtn10Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.State in [dsBrowse] then
  dmPanaderia.tblPanReceta.Prior;
end;

procedure TfrmRecetas.BitBtn11Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.state in [dsBrowse] then
  dmPanaderia.tblPanReceta.next;
end;

procedure TfrmRecetas.BitBtn12Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.state in [dsBrowse] then
  dmPanaderia.tblPanReceta.Last;
end;

procedure TfrmRecetas.BitBtn9Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.state in [dsBrowse] then
  dmPanaderia.tblPanReceta.first;
end;

procedure TfrmRecetas.SpeedButton1Click(Sender: TObject);
begin
  if dmPanaderia.tblPanRecetaDet.State in [dsinsert, dsEdit] then
  begin
    if dmPanaderia.tblPanRecetaDet.State in [dsinsert] then
    dmPanaderia.tblPanRecetaDetSERIE.Value:= FsqlMaxNumero('Pan_Receta_det','Serie');
    dmPanaderia.tblPanRecetaDet.Post;
    dmPanaderia.tblPanRecetaDet.ApplyUpdates;
    if not dmPanaderia.tblPanRecetaDet.Transaction.InTransaction then
    dmPanaderia.tblPanRecetaDet.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanRecetaDet.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanRecetaDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRecetas.SpeedButton2Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.State in [dsEdit, dsInsert] then
  begin    
    SpeedButton9Click(Self);
  end;
  if dmPanaderia.tblPanRecetaDet.State = dsBrowse then
  begin
    dmPanaderia.tblPanRecetaDet.Insert;
    dmPanaderia.tblPanRecetaDetID_RECETA.Value:=dmPanaderia.tblPanRecetaID_RECETA.Value;
    dmPanaderia.tblPanRecetaDetSTATUS.Value :='A';
    dmPanaderia.tblPanRecetaDetCOD_USUARIO.Value:= VarUsuarioGlb;
    dmPanaderia.tblPanRecetaDetIN_POR.Value:= strUserName;
    dmPanaderia.tblPanRecetaDetFECHA_IN.Value:= now;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmRecetas.SpeedButton3Click(Sender: TObject);
begin
  if dmPanaderia.tblPanRecetaDet.State in [dsinsert, dsEdit] then
  begin
    dmPanaderia.tblPanRecetaDet.Cancel;
  end;
end;

procedure TfrmRecetas.SpeedButton4Click(Sender: TObject);
begin
  dmPanaderia.tblPanRecetaDet.Close;
  dmPanaderia.tblPanRecetaDet.Open;
end;

procedure TfrmRecetas.FormCreate(Sender: TObject);
begin
  dmPanaderia.tblPanReceta.Close;
  dmPanaderia.tblPanReceta.Open;
  dmPanaderia.tblTipoUnidades.Close;
  dmPanaderia.tblTipoUnidades.Open;
  dmPanaderia.qryInventario.Close;
  dmPanaderia.qryInventario.Open;
end;

procedure TfrmRecetas.SpeedButton5Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.State = dsBrowse then
  begin
    dmPanaderia.tblPanReceta.Insert;
    dmPanaderia.tblPanRecetaSTATUS.Value:='A';
    dmPanaderia.tblPanRecetaFECHA.Value:=ExtraerFecha(Now);
    dmPanaderia.tblPanRecetaFECHA_IN.Value:= Now;
    dmPanaderia.tblPanRecetaIN_POR.Value:= StruserName;
    dmPanaderia.tblPanRecetaCOD_USUARIO.Value:= VarUsuarioGlb;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmRecetas.SpeedButton6Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.State in [dsinsert, dsEdit] then
  begin
    dmPanaderia.tblPanReceta.Cancel;
  end;
end;

procedure TfrmRecetas.SpeedButton7Click(Sender: TObject);
begin
  dmPanaderia.tblPanReceta.Close;
  dmPanaderia.tblPanReceta.Open;
end;

procedure TfrmRecetas.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar definitivamente esta receta?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if MessageDlg('Ingredientes receta serán eliminados, desea continuar?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmPanaderia.tblPanRecetaDet.First;
      While Not dmPanaderia.tblPanRecetaDet.Eof do
      begin
        dmPanaderia.tblPanRecetaDet.Delete;
      end;
      SpeedButton6Click(Self);
    end;
    if dmPanaderia.tblPanRecetaDet.RecordCount = 0 then
    begin
      if dmPanaderia.tblPanRecetaSTATUS.Value = 'A' then
      begin
        dmPanaderia.tblPanReceta.Delete;
        SpeedButton9Click(Self);
      end;
    end;
  end;
end;
procedure TfrmRecetas.SpeedButton9Click(Sender: TObject);
begin
  if dmPanaderia.tblPanReceta.State in [dsInsert, dsEdit] then
  begin
    if dmPanaderia.tblPanReceta.State in [dsInsert] then
    dmPanaderia.tblPanRecetaID_RECETA.Value:= FsqlMaxNumero('PAN_RECETA_Mast','ID_RECETA');
    dmPanaderia.tblPanReceta.Post;
    dmPanaderia.tblPanReceta.ApplyUpdates;
    if not dmPanaderia.tblPanReceta.Transaction.InTransaction then
    dmPanaderia.tblPanReceta.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanReceta.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanReceta.Transaction.RollbackRetaining;
    end;
  end;
end;


end.
