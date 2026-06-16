unit UProyeccionRegalia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB,Dialogs, Menus, Grids, DBGrids, RxDBCtrl, ComCtrls, StdCtrls, EditNew,
  Buttons, ExtCtrls, RxCtrls, WinSkinData;

type
  TfrmProyeccionRegPascual = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RxSpeedButton3: TRxSpeedButton;
    dtpkFechaInicial: TDateTimePicker;
    dtpkFechaFinal: TDateTimePicker;
    rdgStatusEmp: TRadioGroup;
    BitBtn1: TBitBtn;
    edtCantMesesProy: TEditN;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    tabRegalia: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabCuentas: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    Proyeccion1: TMenuItem;
    NominaRegalia1: TMenuItem;
    GenerarCheques1: TMenuItem;
    ImprimirCheques1: TMenuItem;
    PopupMenu2: TPopupMenu;
    BuscarporCodigo1: TMenuItem;
    PopupMenuDbgrid: TPopupMenu;
    ConsiderarParaRegalia1: TMenuItem;
    ExcluirparaRepalia1: TMenuItem;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure Proyeccion1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BuscarporCodigo1Click(Sender: TObject);
    procedure ConsiderarParaRegalia1Click(Sender: TObject);
    procedure ExcluirparaRepalia1Click(Sender: TObject);
    procedure NominaRegalia1Click(Sender: TObject);
    procedure GenerarCheques1Click(Sender: TObject);
    procedure ImprimirCheques1Click(Sender: TObject);
    procedure rdgStatusEmpClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);

  private
    procedure IncExcEmpParaRega(status: String);
    procedure AplicarFiltroStatusEmpRegalia;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProyeccionRegPascual: TfrmProyeccionRegPascual;

implementation
  uses UDatmodDatosGenerales, Uglobal, UElijeTipockReg, URegDatAdicionales,
  URepProyRegalia, UChequesRegalia, UDatModNomina, USelTipoNomIntegrar,
  UDatModCompania;
{$R *.dfm}

procedure TfrmProyeccionRegPascual.BitBtn1Click(Sender: TObject);
var
  xCodemp: Integer;
begin
  xCodemp := -1;
  dmDatos.statusEmpReg := '';

  if dmdatos.QryProyRegalia.Active then
  begin
    if dmdatos.QryProyRegalia.RecordCount > 0 then
      xCodemp := dmdatos.QryProyRegaliaCODIGO.Value;
  end;

  dmdatos.qryRegAdicional.Close;
  dmdatos.qryRegAdicional.Params[0].Value :=
    StrToInt(FormatDateTime('yyyy', dtpkFechaFinal.DateTime));
  dmdatos.qryRegAdicional.Open;

  dmdatos.mesesProy := edtCantMesesProy.ValueFloat;

  GlbFechaFinal := ExtraerFecha(dtpkFechaFinal.DateTime);
  GlbFechaInicial := ExtraerFecha(dtpkFechaInicial.DateTime);

  case rdgStatusEmp.ItemIndex of
    0: dmDatos.statusEmpReg := 'A';
    1: dmDatos.statusEmpReg := 'I';
    2: dmDatos.statusEmpReg := '';
  end;

  dmdatos.QryProyRegalia.Close;
  dmdatos.QryProyRegalia.Filtered := False;

  dmdatos.QryProyRegalia.Params[0].Value := GlbFechaInicial;
  dmdatos.QryProyRegalia.Params[1].Value := GlbFechaFinal;
  dmdatos.QryProyRegalia.Open;

  AplicarFiltroStatusEmpRegalia;

  dmdatos.qryChequesPTipo.Close;
  dmdatos.qryChequesPTipo.Open;

  if xCodemp > 0 then
    dmdatos.QryProyRegalia.Locate('CODIGO', xCodemp, []);
end;


procedure TfrmProyeccionRegPascual.FormCreate(Sender: TObject);
var
  Anio,MMes,DMes: Integer;
begin
  MMes:= StrToInt(FormatDateTime('mm',date))-1;
  Anio:= StrToInt(FormatDateTime('yyyy',now));
  if Mmes = 0 then
  begin
    MMes :=12;
    Dec(Anio);
  end;
  DMes:=DiasEnElMes(StrToInt(FormatDateTime('yyyy',now)),MMes);
  dtpkFechaInicial.Date:=EncodeDate(StrToInt(FormatDateTime('yyyy',now)),1,1);
  dtpkFechaFinal.Date:=EncodeDate(Anio,MMes,DMes);
end;

procedure TfrmProyeccionRegPascual.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if   dmdatos.QryProyRegaliaStatus_Emp.Value <> 'A' then
  begin
    BackGround := clYellow;
    AFont.Color := clBlue;
  end;
end;

procedure TfrmProyeccionRegPascual.Proyeccion1Click(Sender: TObject);
begin
  qckProyRegalia:=tqckProyRegalia.Create(nil);
  try
    case rdgStatusEmp.ItemIndex of
      0:qckProyRegalia.qrStatusEmp.Caption:='Empleados Activos';
      1:qckProyRegalia.qrStatusEmp.Caption:='Empleados Inactivos';
      2:qckProyRegalia.qrStatusEmp.Caption:='Empleados Activos/Inactivos';
    end;
    qckProyRegalia.preview;
  finally
  qckProyRegalia.free;
  qckProyRegalia:=nil;
  end;
end;

procedure TfrmProyeccionRegPascual.NominaRegalia1Click(Sender: TObject);
begin
  qckProyRegalia:=tqckProyRegalia.Create(nil);
  try
    case rdgStatusEmp.ItemIndex of
      0:qckProyRegalia.qrStatusEmp.Caption:='Empleados Activos';
      1:qckProyRegalia.qrStatusEmp.Caption:='Empleados Inactivos';
      2:qckProyRegalia.qrStatusEmp.Caption:='Empleados Activos/Inactivos';
    end;
    qckProyRegalia.qrTituloReporte.Caption:='Nómina Regalia Pascual';
    qckProyRegalia.preview;
  finally
  qckProyRegalia.free;
  qckProyRegalia:=nil;
  end;
end;


procedure TfrmProyeccionRegPascual.GenerarCheques1Click(Sender: TObject);
begin
  //ShowMessage('Opcion desactivada hasta diciembre');
  frmElijeBcoCksReg:=TfrmElijeBcoCksReg.Create(nil);
  try
    frmElijeBcoCksReg.Showmodal;
  finally
  frmElijeBcoCksReg.free;
  frmElijeBcoCksReg:=nil;
  end;
end;
   

procedure TfrmProyeccionRegPascual.BuscarporCodigo1Click(Sender: TObject);
begin
  if not dmdatos.QryProyRegalia.Locate('codigo',StrToInt(InputBox('Buscar por código empleado','Entre codigo','')),[]) then
  MessageDlg('Codigo no existe',mtinformation,[mbok],0);
end;

procedure TfrmProyeccionRegPascual.ImprimirCheques1Click(Sender: TObject);
begin
  frmCksRegalia:=TfrmCksRegalia.Create(nil);
  try
    frmCksRegalia.Showmodal;
  finally
  frmCksRegalia.free;
  frmCksRegalia:=nil;
  end;
end;

procedure TfrmProyeccionRegPascual.BitBtn2Click(Sender: TObject);
begin
  frmDatosAdicRegalia:=TfrmDatosAdicRegalia.Create(nil);
  try
    frmDatosAdicRegalia.ShowModal;
  finally
  frmDatosAdicRegalia.Free;
  frmDatosAdicRegalia:=Nil;
  end;
end;

procedure TfrmProyeccionRegPascual.IncExcEmpParaRega(status: String);
var
   i:Integer;
begin
  dmdatos.qryEmpRegalia.Close;
  dmdatos.qryEmpRegalia.Open;
  if RxDBGrid1.SelectedRows.Count>0 then
  With RxDBGrid1.DataSource.DataSet do
  For i:=0 to RxDBGrid1.SelectedRows.Count-1 do
  begin
    GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));
    if not dmdatos.qryEmpRegalia.Locate('CIA_KEY;CODIGO',
    VarArrayOf([dmDatos.QryProyRegaliaCIA_KEY.Value,
    dmdatos.QryProyRegaliaCODIGO.Value]),[]) then
    begin
      dmDatos.qryEmpRegalia.Insert;
      dmdatos.qryEmpRegaliaCIA_KEY.Value := dmDatos.QryProyRegaliaCIA_KEY.Value;
      dmdatos.qryEmpRegaliaCODIGO.Value  := dmdatos.QryProyRegaliaCODIGO.Value;
      dmDatos.qryEmpRegaliaStatus.Value  := Status;
      dmDatos.qryEmpRegalia.Post;
    end;
  end;
  GlbSalvarQuery(dmDatos.qryEmpRegalia);
  BitBtn1Click(Self);  
end;

procedure TfrmProyeccionRegPascual.ConsiderarParaRegalia1Click(
  Sender: TObject);
begin
  IncExcEmpParaRega('A');
end;

procedure TfrmProyeccionRegPascual.ExcluirparaRepalia1Click(
  Sender: TObject);
begin
  IncExcEmpParaRega('D');
end;

procedure TfrmProyeccionRegPascual.BitBtn9Click(Sender: TObject);
begin
  dmDatos.qryEmpRegalia.First;
end;

procedure TfrmProyeccionRegPascual.BitBtn12Click(Sender: TObject);
begin
  dmDatos.qryEmpRegalia.Last; 
end;

procedure TfrmProyeccionRegPascual.BitBtn10Click(Sender: TObject);
begin
  dmDatos.qryEmpRegalia.Prior;
end;

procedure TfrmProyeccionRegPascual.BitBtn11Click(Sender: TObject);
begin
  dmDatos.qryEmpRegalia.Next;
end;

procedure TfrmProyeccionRegPascual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmdatos.qryChequesPTipo.Close;
  dmdatos.qryRegAdicional.Close;
  dmdatos.QryProyRegalia.close;
end;

procedure TfrmProyeccionRegPascual.rdgStatusEmpClick(Sender: TObject);
begin
  BitBtn1Click(Self);
end;

procedure TfrmProyeccionRegPascual.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('¿Desea integrar monto Regalia a Nómina?',mtInformation,[mbyes,mbno],0)=mrno then
  exit;
  frmSelDatosIntegrarNom:=TfrmSelDatosIntegrarNom.Create(Nil);
  try
    if frmSelDatosIntegrarNom.ShowModal = mrOk then
    begin
      GlbFechaNomina := ExtraerFecha(frmSelDatosIntegrarNom.dtpkFechaNom.Datetime);
      frmSelDatosIntegrarNom.VerificarTipoCia;
      frmSelDatosIntegrarNom.VerificarTipoNomina(frmSelDatosIntegrarNom.xTipoNomina);
      dmCompania.tblCompania.Close;
      dmCompania.tblCompania.Open;
      dmCompania.tblCompania.Locate('CODIGO',GlbCodigoCia,[]);
      dmNomina.tblNomina.Close;
      dmNomina.tblNomina.Params[0].Value := GlbCia_Key;
      dmNomina.tblNomina.Params[1].Value := GlbTipoNom;
      dmNomina.tblNomina.Params[2].Value := ExtraerFecha(GlbFechaNomina);
      dmNomina.tblNomina.Open;
  
  dmdatos.QryProyRegalia.Last;
  dmdatos.QryProyRegalia.First;  
  ProgressBar1.Max:=dmdatos.QryProyRegalia.RecordCount;
  ProgressBar1.Visible:=True;
  dmdatos.QryProyRegalia.DisableControls;
  While Not dmdatos.QryProyRegalia.Eof do
  begin
    if dmNomina.tblNomina.Locate('CODIGO_EMP', dmdatos.QryProyRegaliaCODIGO.Value,[]) then
    begin
      if (dmNomina.tblNominaSTATUS_NOMINA.Value = 'R') then
      begin
        dmdatos.QryProyRegalia.Next;      
        continue;
      end;
      dmNomina.tblNomina.Edit;

      if dmdatos.QryProyRegaliaREG_PROY.IsNull then
      dmNomina.tblNominaREGALIA.Value := 0;

      if (dmdatos.QryProyRegaliaSTATUS_REGALIA.Value = 'A') or
         (dmdatos.QryProyRegaliaSTATUS_REGALIA.Value = '') or
         (dmdatos.QryProyRegaliaSTATUS_REGALIA.IsNull) then
      begin
        dmNomina.tblNominaREGALIA.Value := dmdatos.QryProyRegaliaREG_PROY.Value;
        //  dmdatos.QryProyRegalia.Edit;
        //  dmdatos.QryProyRegaliaSTATUS_REGALIA.Value := 'R';
        //  dmdatos.QryProyRegalia.Post;
      end;
      dmNomina.tblNomina.Post;
    end;
    ProgressBar1.StepIt;
    dmdatos.QryProyRegalia.Next;
  end;
  ProgressBar1.Visible:=False;
  dmdatos.QryProyRegalia.EnableControls;
  try
    dmNomina.tblNomina.ApplyUpdates;
    dmNomina.tblNomina.Transaction.CommitRetaining;
  except
  dmNomina.tblNomina.Transaction.RollbackRetaining;
  end;
  try
    dmdatos.QryProyRegalia.ApplyUpdates;
    dmdatos.QryProyRegalia.Transaction.CommitRetaining;
    dmnomina.ibstpProcActNomTotales.Params[0].Value:= glbTipoNom;
    dmnomina.ibstpProcActNomTotales.Params[1].Value:= glbCia_Key;
    dmnomina.ibstpProcActNomTotales.Params[2].Value:= ExtraerFecha(GlbFechaNomina);
    dmnomina.ibstpProcActNomTotales.ExecProc;
    if Not dmnomina.ibstpProcActNomTotales.Transaction.InTransaction then
    dmnomina.ibstpProcActNomTotales.Transaction.StartTransaction;
    try
      dmnomina.ibstpProcActNomTotales.Transaction.CommitRetaining;
    except
    dmnomina.ibstpProcActNomTotales.Transaction.RollbackRetaining;
    end;

  except
  dmdatos.QryProyRegalia.Transaction.RollbackRetaining;
  end;
    end;
  finally
  frmSelDatosIntegrarNom.free;
  frmSelDatosIntegrarNom:=nil;
  end;
end;

procedure TfrmProyeccionRegPascual.AplicarFiltroStatusEmpRegalia;
begin
  dmdatos.QryProyRegalia.Filtered := False;

  if Trim(dmdatos.statusEmpReg) <> '' then
  begin
    dmdatos.QryProyRegalia.Filtered := True;
    rdgStatusEmp.Font.Color := $009CCC75;
  end
  else
  begin
    rdgStatusEmp.Font.Color := clWindowText;
  end;
end;

end.
