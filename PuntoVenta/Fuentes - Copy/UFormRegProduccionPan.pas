unit UFormRegProduccionPan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GetAnyDate, DB, WinSkinData, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, rxToolEdit, RxLookup, Mask, DBCtrls, RXCtrls, Menus, ExtCtrls,
  ComCtrls;

type
  TfrmRegProduccion = class(TForm)
    SkinData1: TSkinData;
    dsQryEmpleados: TDataSource;
    GetAnyDate1: TGetAnyDate;
    PopupMenu1: TPopupMenu;
    DuplicarRecord1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    SpeedButton4: TSpeedButton;
    DBStatusLabel2: TDBStatusLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    DBEdit2: TDBEdit;
    BitBtn9: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Shape1: TShape;
    Label11: TLabel;
    Shape2: TShape;
    RxDBGrid2: TRxDBGrid;
    DBDateEdit2: TDBDateEdit;
    BitBtn4: TBitBtn;
    procedure BitBtn10Click2(Sender: TObject);
    procedure BitBtn11Click2(Sender: TObject);
    procedure BitBtn12Click2(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn1Click2(Sender: TObject);
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn5Click2(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click2(Sender: TObject);
    procedure SpeedButton1Click2(Sender: TObject);
    procedure SpeedButton2Click2(Sender: TObject);
    procedure SpeedButton3Click2(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegProduccion: TfrmRegProduccion;

implementation

uses UDatModPanaderia, UDatModReportes,
  Uglobal, UDatModNomina, UDatModUsuarios, UFormPanProcesoProduccionEmp,
  UFormTipoNomina, URepProdPanEmpleados;

{$R *.dfm}

procedure TfrmRegProduccion.BitBtn10Click2(Sender: TObject);
begin
  dmPanaderia.tblPanProduccionMast.First;
end;

procedure TfrmRegProduccion.BitBtn11Click2(Sender: TObject);
begin
  dmPanaderia.tblPanProduccionMast.Prior;
end;

procedure TfrmRegProduccion.BitBtn12Click2(Sender: TObject);
begin
  dmPanaderia.tblPanProduccionMast.Next;
end;

procedure TfrmRegProduccion.BitBtn13Click(Sender: TObject);
begin
  dmPanaderia.tblPanProduccionMast.Last;
end;

procedure TfrmRegProduccion.BitBtn1Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionDet.State = dsBrowse then
  begin
    dmPanaderia.tblPanProduccionDet.Insert;
    //DBEdit2.SetFocus;
  end;
end;

procedure TfrmRegProduccion.BitBtn2Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionDet.State = dsBrowse then
  dmPanaderia.tblPanProduccionDet.Edit;
end;

procedure TfrmRegProduccion.BitBtn3Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionDet.State in [dsEdit, dsInsert] then
  dmPanaderia.tblPanProduccionDet.cancel;
end;

procedure TfrmRegProduccion.BitBtn5Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionDet.State In [dsInactive, dsBrowse] then
  begin
    dmPanaderia.tblPanProduccionDet.Close;
    dmPanaderia.tblPanProduccionDet.Open;
  end;
end;

procedure TfrmRegProduccion.BitBtn8Click(Sender: TObject);
begin
  GetAnyDate1.UsaFechaCierre:=True;
  GetAnyDate1.FechaCierre:=GlbFechaTrnDiaria;
  if GetAnyDate1.Execute then
  begin
    dmPanaderia.tblPanProduccionMast.Close;
    dmPanaderia.tblPanProduccionMast.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
    dmPanaderia.tblPanProduccionMast.Params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmPanaderia.tblPanProduccionMast.Open;
    if dmPanaderia.tblPanProduccionMast.RecordCount = 0 then
    begin
      //RxDBGrid2.BringToFront;
      //RxDBGrid2.Visible:=True;
      //RxDBGrid1.SendToBack;
      //RxDBGrid1.Visible:=False;
    end else
    begin
      RxDBGrid1.BringToFront;
      RxDBGrid1.Visible:=True;
      //RxDBGrid2.SendToBack;
      //RxDBGrid2.Visible:=False;
    end;
  end;
end;

procedure TfrmRegProduccion.BitBtn9Click2(Sender: TObject);
var
  sqlT : String;
begin
  GetAnyDate1.UsaFechaCierre:=True;
  GetAnyDate1.FechaCierre:=GlbFechaTrnDiaria;
  if GetAnyDate1.Execute then
  begin
    dmPanaderia.qryRepPanProdEmpMaster.Close;
    dmPanaderia.qryRepPanProdEmpMaster.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
    dmPanaderia.qryRepPanProdEmpMaster.Params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmPanaderia.qryRepPanProdEmpMaster.Open;

    qckRepProdEmpleadosPan:=TqckRepProdEmpleadosPan.Create(Nil);
    try
      qckRepProdEmpleadosPan.Preview;
    finally
    qckRepProdEmpleadosPan.Free;
    qckRepProdEmpleadosPan:=Nil;
    end;
  end;
{  sqlT:='';
  if RadioButton1.Checked then
  begin
    dmReportes.qryRepRequisicion.Close;
    dmReportes.qryRepRequisicion.Params[0].Value:=dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
    dmReportes.qryRepRequisicion.Params[1].Value:=dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
    dmReportes.qryRepRequisicion.Open;
  end else
  begin
    GetAnyDate1.VFechaF:=True;
    GetAnyDate1.Fecha := GlbFechaTrnDiaria;
    GetAnyDate1.FechaFinal := GlbFechaTrnDiaria;    
    if GetAnyDate1.Execute then
    begin
      sqlT := dmReportes.qryRepRequisicion.SQL.Text;
      dmReportes.qryRepRequisicion.SQL.Text:=dmReportes.qryRepRequisicionXfecha.SQL.Text;
      dmReportes.qryRepRequisicion.Close;
      dmReportes.qryRepRequisicion.Params[0].ParamType := ptInput;
      dmReportes.qryRepRequisicion.Params[0].AsDateTime:= ExtraerFecha(GetAnyDate1.Fecha);
      dmReportes.qryRepRequisicion.Params[1].ParamType := ptInput;
      dmReportes.qryRepRequisicion.Params[1].AsDateTime:= ExtraerFecha(GetAnyDate1.FechaFinal);
      dmReportes.qryRepRequisicion.Open;
    end;
  end;
  qckRepRequisicion:=TqckRepRequisicion.Create(Nil);
  try
    qckRepRequisicion.Preview;
  finally
  qckRepRequisicion.Free;
  qckRepRequisicion:=nil;
  end;
  if (sqlT <> '') then
  begin
    dmReportes.qryRepRequisicion.Close;
    dmReportes.qryRepRequisicion.SQL.Text := sqlT;
  end;}
end;

procedure TfrmRegProduccion.SpeedButton1Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionMast.State In [dsInsert, dsEdit] then
  begin
    dmPanaderia.tblPanProduccionMast.Post;
    dmPanaderia.tblPanProduccionMast.ApplyUpdates;
    if not dmPanaderia.tblPanProduccionMast.Transaction.InTransaction then
    dmPanaderia.tblPanProduccionMast.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanProduccionMast.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanProduccionMast.Transaction.RollbackRetaining;
    end;
    BitBtn8.Enabled:=True;
  end;
end;

procedure TfrmRegProduccion.SpeedButton2Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionMast.State = dsBrowse then
  begin
    BitBtn8.Enabled:=False;
    dmPanaderia.tblPanProduccionMast.Insert;
    dmPanaderia.tblPanProduccionMastSTATUS.Value:='A';
    dmPanaderia.tblPanProduccionMastFECHA_PRODUCCION.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    dmPanaderia.tblPanProduccionMastFECHA_IN.Value:= Now;
    dmPanaderia.tblPanProduccionMastIN_POR.Value:= StruserName;
    //dmPanaderia.tblPanProduccionMastCOD_USUARIO.Value:= VarUsuarioGlb;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmRegProduccion.SpeedButton3Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionMast.State in [dsinsert, dsEdit] then
  begin
    dmPanaderia.tblPanProduccionMast.Cancel;
  end else
  begin
    {if MessageDlg('Cancelar plan?', mtinformation,[mbyes,mbno],0)=mryes then
    begin
    if dmPanaderia.tblPanProduccionMastDetSTATUS.Value = 'A' then
    begin
      dmPanaderia.tblPanProduccionMastDet.Edit;
      dmPanaderia.tblPanProduccionMastDetSTATUS.Value:='C';
      SpeedButton6Click(Self);
    end;
    end;}
  end;
end;

procedure TfrmRegProduccion.SpeedButton7Click(Sender: TObject);
begin
  dmPanaderia.tblPanProduccionMast.Close;
  dmPanaderia.tblPanProduccionMast.Open;
end;

procedure TfrmRegProduccion.SpeedButton8Click(Sender: TObject);
begin
  if (dmPanaderia.tblPanProduccionMastSTATUS.Value = 'R') then
  begin
    MessageDlg('Record no puede ser eliminado, verifique.', mtWarning,[mbYes,mbNo],0);
    Exit;
  end;

  if MessageDlg('Desea eliminar definitivamente este record?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if MessageDlg('Detalles serán eliminados, desea continuar?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmPanaderia.tblPanProduccionDet.First;
      While Not dmPanaderia.tblPanProduccionDet.Eof do
      begin
        dmPanaderia.tblPanProduccionDet.Delete;
      end;
      //SpeedButton6Click(Self);
    end;
    if dmPanaderia.tblPanProduccionDet.RecordCount = 0 then
    begin
      if dmPanaderia.tblPanProduccionMastSTATUS.Value = 'A' then
      begin
        dmPanaderia.tblPanProduccionMast.Delete;
        SpeedButton1Click2(Self);
      end;
    end;
  end;
end;

procedure TfrmRegProduccion.FormCreate(Sender: TObject);
begin
  dmNomina.qryTipoNomina.Close;
  dmNomina.qryTipoNomina.Open;
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;
  GetAnyDate1.UsaFechaCierre:=True;
  GetAnyDate1.FechaCierre:=GlbFechaTrnDiaria;
  if GetAnyDate1.Execute then
  begin
    dmPanaderia.tblPanProduccionMast.Close;
    dmPanaderia.tblPanProduccionMast.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
    dmPanaderia.tblPanProduccionMast.Params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmPanaderia.tblPanProduccionMast.Open;
  end;
end;

procedure TfrmRegProduccion.BitBtn7Click(Sender: TObject);
var
  flag : Boolean;
  tipoNomina : Integer;
begin
    flag:=false;
    frmTipoNomina:=TfrmTipoNomina.Create(Nil);
    try
      if frmTipoNomina.Showmodal = mrCancel then
      flag:=true else
      tipoNomina:= frmTipoNomina.xTipoNomina;
    finally
    frmTipoNomina.free;
    frmTipoNomina:=nil;
    end;

    if flag then exit;

  frmProcProdEmpleados:=TfrmProcProdEmpleados.Create(Nil);
  try
    frmProcProdEmpleados.tipoNomina:=tipoNomina;
    frmProcProdEmpleados.Showmodal;
  finally
  frmProcProdEmpleados.Free;
  frmProcProdEmpleados:=Nil;
  end;
end;

procedure TfrmRegProduccion.BitBtn4Click(Sender: TObject);
begin
  if dmPanaderia.tblPanProduccionDet.State In [dsInsert, dsEdit] then
  begin
    dmPanaderia.tblPanProduccionDet.Post;
    dmPanaderia.tblPanProduccionDet.ApplyUpdates;
    if not dmPanaderia.tblPanProduccionDet.Transaction.InTransaction then
    dmPanaderia.tblPanProduccionDet.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanProduccionDet.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanProduccionDet.Transaction.RollbackRetaining;
    end;
  end;
end;

end.
