unit UFormDescuentoNomDependiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, GetAnyDate, DB, WinSkinData, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, rxToolEdit, RxLookup, Mask, DBCtrls, RXCtrls, ExtCtrls, ComCtrls;

type
  TfrmProcDescDependientes = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label4: TLabel;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    DBEdit2: TDBEdit;
    BitBtn9: TBitBtn;
    SkinData1: TSkinData;
    dsQryEmpleados: TDataSource;
    GetAnyDate1: TGetAnyDate;
    DStblDependienteNomMaster: TDataSource;
    dstblDependienteNomDet: TDataSource;
    Label6: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label1: TLabel;
    Shape1: TShape;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    dstblTipoPlanSFS: TDataSource;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn1Click2(Sender: TObject);
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn4Click2(Sender: TObject);
    procedure BitBtn5Click2(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click2(Sender: TObject);
    procedure SpeedButton2Click2(Sender: TObject);
    procedure SpeedButton3Click2(Sender: TObject);

    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcDescDependientes: TfrmProcDescDependientes;

implementation

uses UDatModNomina,UDatModDescuentosNom,uglobal, DateUtils;

{$R *.dfm}

procedure TfrmProcDescDependientes.BitBtn10Click(Sender: TObject);
begin
  dmnomina.tblDependienteNomMaster.First;
end;

procedure TfrmProcDescDependientes.BitBtn11Click(Sender: TObject);
begin
  dmnomina.tblDependienteNomMaster.Prior;
end;

procedure TfrmProcDescDependientes.BitBtn12Click(Sender: TObject);
begin
  dmnomina.tblDependienteNomMaster.Next;
end;

procedure TfrmProcDescDependientes.BitBtn13Click(Sender: TObject);
begin
  dmnomina.tblDependienteNomMaster.Last;
end;

procedure TfrmProcDescDependientes.BitBtn1Click2(Sender: TObject);
begin
  if dmnomina.tblDependienteNomMaster.RecordCount = 0 then exit;
  if dmNomina.tblDependienteNomDet.State = dsBrowse then
  begin
    dmNomina.tblDependienteNomDet.Append;
    dmNomina.tblDependienteNomDetMONTO_COMPLEMENTARIO.Value:=0;
    dmNomina.tblDependienteNomDetMONTO.Value:=0;
    dmNomina.tblDependienteNomDetCOD_USUARIO.Value := VarUsuarioGlb;
    dmNomina.tblDependienteNomDetFECHA_IN.Value:= Now;
    dmNomina.tblDependienteNomDetIN_POR.Value:= StrUserName;
    dmNomina.tblDependienteNomDetSTATUS.Value:='A';
    //DBEdit2.SetFocus;
  end;
end;

procedure TfrmProcDescDependientes.BitBtn2Click2(Sender: TObject);
begin
  if dmNomina.tblDependienteNomDet.State = dsBrowse then
  dmNomina.tblDependienteNomDet.Edit;
end;

procedure TfrmProcDescDependientes.BitBtn3Click2(Sender: TObject);
begin
  if dmNomina.tblDependienteNomDet.State in [dsEdit, dsInsert] then
  dmNomina.tblDependienteNomDet.cancel;
end;

procedure TfrmProcDescDependientes.BitBtn4Click2(Sender: TObject);
var
  sql : string;
begin
  SpeedButton1Click2(Self);
  if dmNomina.tblDependienteNomDet.state in [dsEdit, dsInsert] then
  begin
    if dmNomina.tblDependienteNomDet.State in [dsInsert] then
    dmNomina.tblDependienteNomDetCODIGO_EMP.Value:=
    dmNomina.tblDependienteNomMasterCODIGO_EMP.Value;

    dmNomina.tblDependienteNomDet.Post;
    dmNomina.tblDependienteNomDet.ApplyUpdates;
    if Not dmNomina.tblDependienteNomDet.Transaction.InTransaction then
    dmNomina.tblDependienteNomDet.Transaction.StartTransaction;
    try
      dmNomina.tblDependienteNomDet.Transaction.CommitRetaining;
    except
    dmNomina.tblDependienteNomDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcDescDependientes.BitBtn5Click2(Sender: TObject);
begin
  if dmNomina.tblDependienteNomDet.State in [dsInactive, dsBrowse] then
  begin
    dmNomina.tblDependienteNomDet.Close;
    dmNomina.tblDependienteNomDet.Open;
  end;
end;

procedure TfrmProcDescDependientes.BitBtn9Click(Sender: TObject);
var
  sqlT : String;
begin
  sqlT:='';
  
end;

procedure TfrmProcDescDependientes.SpeedButton1Click2(Sender: TObject);
begin
  if dmnomina.tblDependienteNomMaster.State In [dsInsert, dsEdit] then
  begin
    if dmnomina.tblDependienteNomMaster.State In [dsInsert] then
    begin
      //
    end;
    dmnomina.tblDependienteNomMaster.Post;
    dmnomina.tblDependienteNomMaster.ApplyUpdates;
    if not dmnomina.tblDependienteNomMaster.Transaction.InTransaction then
    dmnomina.tblDependienteNomMaster.Transaction.StartTransaction;
    try
      dmnomina.tblDependienteNomMaster.Transaction.CommitRetaining;
    except
    dmnomina.tblDependienteNomMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProcDescDependientes.SpeedButton2Click2(Sender: TObject);
begin
  if dmnomina.tblDependienteNomMaster.State = dsBrowse then
  begin
    dmnomina.tblDependienteNomMaster.Append;
    dmnomina.tblDependienteNomMasterFECHA_INI.Value:=EncodeDate(MonthOf(now),01,01);
    dmnomina.tblDependienteNomMasterFECHA_FIN.Value:=EncodeDate(MonthOf(dmnomina.tblDependienteNomMasterFECHA_INI.Value)+1,12,31);
    dmnomina.tblDependienteNomMasterSTATUS.Value:='A';
    dmnomina.tblDependienteNomMasterMONTO_COMPLENTARIO.Value:=0;
    dmnomina.tblDependienteNomMasterFECHA_INI.Value:=now;
    dmnomina.tblDependienteNomMasterIN_POR.Value:=StrUserName;
    dmnomina.tblDependienteNomMasterCOD_USUARIO.Value:=VarUsuarioGlb;
  end;
end;

procedure TfrmProcDescDependientes.SpeedButton3Click2(Sender: TObject);
begin
  if dmnomina.tblDependienteNomMaster.State in [dsinsert, dsEdit] then
  dmnomina.tblDependienteNomMaster.Cancel;
end;


procedure TfrmProcDescDependientes.SpeedButton7Click(Sender: TObject);
begin
  dmnomina.tblDependienteNomMaster.Close;
  dmnomina.tblDependienteNomMaster.Open;
end;

procedure TfrmProcDescDependientes.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar definitivamente este record?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if MessageDlg('Detalles serán eliminados, desea continuar?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmNomina.tblDependienteNomDet.First;
      While Not dmNomina.tblDependienteNomDet.Eof do
      begin
        dmNomina.tblDependienteNomDet.Delete;
      end;
    end;
    if dmNomina.tblDependienteNomDet.RecordCount = 0 then
    begin
      if dmnomina.tblDependienteNomMasterSTATUS.Value = 'A' then
      begin
        dmnomina.tblDependienteNomMaster.Delete;
        SpeedButton1Click2(Self);
      end;
    end;
  end;
end;

procedure TfrmProcDescDependientes.FormCreate(Sender: TObject);
begin
  dmNomina.qryEmpleados.Close;
  dmNomina.qryEmpleados.Open;
  dmNomina.tblDependienteNomMaster.Close;
  dmNomina.tblDependienteNomMaster.Open;
  dmDescuentosNom.tblTipoDescuento.Close;
  dmDescuentosNom.tblTipoDescuento.Open;
  dmNomina.tblTipoPlanSFS.Close;
  dmNomina.tblTipoPlanSFS.Open;
end;

end.
