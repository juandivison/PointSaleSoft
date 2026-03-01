unit UFormMaestroEstudiante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RXCtrls, ExtCtrls, Grids, DBGrids,
  db, RXDBCtrl, ComCtrls, Buttons, WinSkinData, RxLookup, rxToolEdit;

type
  TfrmMaestroEstudiante = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
    Label9: TLabel;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    Shape1: TShape;
    RxLabel1: TRxLabel;
    Shape2: TShape;
    RxDBGrid2: TRxDBGrid;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn7: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label12: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label10: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label13: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    SpeedButton1: TSpeedButton;
    BitBtn5: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    Label14: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    BitBtn6: TBitBtn;
    SkinData1: TSkinData;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn8: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMaestroEstudiante: TfrmMaestroEstudiante;
  FInsertarpagos : Boolean;
  abortarProceso : Boolean;
implementation

uses UDatModEstudiante, UGlobal, UBuscarClientesPersonasP,
  UMaestroClientes, UDatModUsuarios, UQckRepListadoEstudiantes,
  UDatModReportes, UFormMensualidadEstudiantes, UDatModClientes,
  URepListadoEstActivos, UActivapermisos;

{$R *.dfm}

procedure TfrmMaestroEstudiante.FormCreate(Sender: TObject);
begin
  dmEstudiante.qryEstudianteDet.Close;
  dmEstudiante.qryEstudianteDet.Open;
  dmEstudiante.qryEstudianteMast.Close;
  dmEstudiante.qryEstudianteMast.Open;
  dmEstudiante.qryClientes.Close;
  dmEstudiante.qryClientes.Open;
  dmEstudiante.qryAnoEscolar.Close;
  dmEstudiante.qryAnoEscolar.Open;
  dmEstudiante.qryNivelModalidad.Close;
  dmEstudiante.qryNivelModalidad.Open;
end;

procedure TfrmMaestroEstudiante.btnInsertarClick(Sender: TObject);
begin
  if dmEstudiante.qryEstudianteMast.State = dsBrowse then
  begin
    dmEstudiante.qryEstudianteMast.Insert;
    dmEstudiante.qryEstudianteMastSTATUS.Value:='A';
    dmEstudiante.qryEstudianteMastFECHA_IN.Value:=now;
    dmEstudiante.qryEstudianteMastIN_POR.Value:=strUsername;
    dmEstudiante.qryEstudianteMastCOD_USUARIO.Value:= VarUsuarioGlb;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmMaestroEstudiante.btnSalvarClick(Sender: TObject);
begin
  if dmEstudiante.qryEstudianteMast.State in [dsInsert, dsEdit] then
  begin
    dmEstudiante.qryEstudianteMast.Post;
    dmEstudiante.qryEstudianteMast.ApplyUpdates;
    if not dmEstudiante.qryEstudianteMast.Transaction.InTransaction then
    dmEstudiante.qryEstudianteMast.Transaction.StartTransaction;
    try
     dmEstudiante.qryEstudianteMast.Transaction.CommitRetaining;
    except
    dmEstudiante.qryEstudianteMast.Transaction.RollbackRetaining;
    end;
  end
end;

procedure TfrmMaestroEstudiante.btnCerarAbrirresClick(Sender: TObject);
begin
  dmEstudiante.qryEstudianteMast.Close;
  dmEstudiante.qryEstudianteMast.Open;
end;

procedure TfrmMaestroEstudiante.btnModificarClick(Sender: TObject);
begin
  if dmEstudiante.qryEstudianteMast.State = dsBrowse then
  dmEstudiante.qryEstudianteMast.Edit;
end;

procedure TfrmMaestroEstudiante.BitBtn1Click(Sender: TObject);
begin
  if dmEstudiante.qryEstudianteDet.State = dsBrowse then
  begin
    dmEstudiante.qryEstudianteDet.Insert;
    dmEstudiante.qryEstudianteDetID_ESTUDIANTE.Value:= dmEstudiante.qryEstudianteMastID_ESTUDIANTE.Value;
    dmEstudiante.qryEstudianteDetIDANOESCOLAR.Value := GLBIDAnioEscolar;
    dmEstudiante.qryEstudianteDetFECHA_IN.Value:= Now;
    dmEstudiante.qryEstudianteDetIN_POR.Value  := StrUserName;
    dmEstudiante.qryEstudianteDetSTATUS.Value  :='A';
    dmEstudiante.qryEstudianteDetCOD_USUARIO.Value := VarUsuarioGlb;
    RxDBLookupCombo3.SetFocus;
  end;
end;

procedure TfrmMaestroEstudiante.BitBtn3Click(Sender: TObject);
begin
  dmEstudiante.qryEstudianteDet.Edit;
end;

procedure TfrmMaestroEstudiante.BitBtn4Click(Sender: TObject);
begin
  if dmEstudiante.qryEstudianteDet.State in [dsInsert, dsEdit] then
  begin
    if dmEstudiante.qryEstudianteDet.State in [dsInsert] then
    FInsertarpagos:=True
    else FInsertarpagos:=False;
    dmEstudiante.qryEstudianteDet.Post;
    dmEstudiante.qryEstudianteDet.ApplyUpdates;
    if not dmEstudiante.qryEstudianteDet.Transaction.InTransaction then
    dmEstudiante.qryEstudianteDet.Transaction.StartTransaction;
    try
     dmEstudiante.qryEstudianteDet.Transaction.CommitRetaining;
    except
    dmEstudiante.qryEstudianteDet.Transaction.RollbackRetaining;
    end;
  end;
  if FInsertarpagos then
  BitBtn6Click(Self);
end;

procedure TfrmMaestroEstudiante.SpeedButton1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    if (dmEstudiante.qryEstudianteMast.State = dsInsert) then
    if FrmBuscarClientesPersonas.ShowModal = mrOk then
    dmEstudiante.qryEstudianteMastIDFAMILIA.Value := FrmBuscarClientesPersonas.CodigoCliente;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas := Nil;
  end;
end;

procedure TfrmMaestroEstudiante.BitBtn5Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.first;
    while not dmUsuarios.qryRoles.eof do
    begin
      ActivaPermiso(TForm(frmClientes), 1000, dmUsuarios.qryRolesID_ROL.Value, 0);//menu principal: 1000 debe estar en la tabla PROCESOS
      dmUsuarios.qryRoles.Next;
    end;
    if dmclientes.tblClientes.State = dsBrowse then
    dmclientes.tblClientes.Locate('CODIGO_CTE', dmEstudiante.qryEstudianteMastIDFAMILIA.Value, []);
    frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  dmEstudiante.qryClientes.Close;
  dmEstudiante.qryClientes.Open;
end;

procedure TfrmMaestroEstudiante.RxSpeedButton1Click(Sender: TObject);
begin
  dmreportes.qryRepEstudiantesActivos.Close;
  dmreportes.qryRepEstudiantesActivos.Open;
  qckRepEstActivos:=tqckRepEstActivos.Create(Nil);
  try
    qckRepEstActivos.Preview;
  finally
  qckRepEstActivos.Free;
  qckRepEstActivos:=Nil;
  end;
end;

procedure TfrmMaestroEstudiante.RxDBLookupCombo4Exit(Sender: TObject);
begin
  dmEstudiante.qryCursosLookupEstudiante.Close;
  dmEstudiante.qryCursosLookupEstudiante.Params[0].Value := dmEstudiante.qryEstudianteDetIDNIVEL.Value;
  dmEstudiante.qryCursosLookupEstudiante.Open;
end;

procedure TfrmMaestroEstudiante.BitBtn6Click(Sender: TObject);
begin
  dmEstudiante.tblPagosEstudiantes.Close;
  dmEstudiante.tblPagosEstudiantes.Params[0].Value:= GLBIDAnioEscolar;
  dmEstudiante.tblPagosEstudiantes.Params[1].Value:= dmEstudiante.qryEstudianteMastID_ESTUDIANTE.Value;
  dmEstudiante.tblPagosEstudiantes.Open;
  dmEstudiante.qryAnoEscolarActivo.Close;
  dmEstudiante.qryAnoEscolarActivo.Open;
  frmMensualidadEstudiantes:=TfrmMensualidadEstudiantes.Create(Nil);
  try
    frmMensualidadEstudiantes.BitBtn7Click(Self);
    frmMensualidadEstudiantes.Showmodal;
  finally
  frmMensualidadEstudiantes.Free;
  frmMensualidadEstudiantes:=Nil;
  end;
end;

procedure TfrmMaestroEstudiante.BitBtn9Click(Sender: TObject);
begin
  dmEstudiante.qryEstudianteMast.First;
end;

procedure TfrmMaestroEstudiante.BitBtn10Click(Sender: TObject);
begin
  dmEstudiante.qryEstudianteMast.Prior;
end;

procedure TfrmMaestroEstudiante.BitBtn11Click(Sender: TObject);
begin
  dmEstudiante.qryEstudianteMast.Next;
end;

procedure TfrmMaestroEstudiante.BitBtn12Click(Sender: TObject);
begin
  dmEstudiante.qryEstudianteMast.Last;
end;

procedure TfrmMaestroEstudiante.BitBtn8Click(Sender: TObject);
begin
  dmEstudiante.qryEstudianteMast.Last;
  ProgressBar1.Max:= dmEstudiante.qryEstudianteMast.RecordCount;
  dmEstudiante.qryEstudianteMast.First;
  ProgressBar1.Visible:= True;
  Panel1.Enabled:=False;
  While Not dmEstudiante.qryEstudianteMast.Eof do
  begin
    if abortarProceso then
    begin
      break;
    end;
    ProgressBar1.StepIt;
    dmEstudiante.tblPagosEstudiantes.close;
    dmEstudiante.tblPagosEstudiantes.Params[0].Value:= GLBIDAnioEscolar;
    dmEstudiante.tblPagosEstudiantes.Params[1].Value:= dmEstudiante.qryEstudianteMastID_ESTUDIANTE.Value;
    dmEstudiante.tblPagosEstudiantes.open;
    dmEstudiante.qryAnoEscolarActivo.Close;
    dmEstudiante.qryAnoEscolarActivo.Open;
    frmMensualidadEstudiantes:=TfrmMensualidadEstudiantes.Create(Nil);
    try
      frmMensualidadEstudiantes.BitBtn7Click(Self);
     //frmMensualidadEstudiantes.Showmodal;
    finally
    frmMensualidadEstudiantes.Free;
    frmMensualidadEstudiantes:=Nil;
    end;
    dmEstudiante.qryEstudianteMast.Next;

    Application.ProcessMessages;
  end;
  ProgressBar1.Visible:= False;
  Panel1.Enabled:=True;
  Beep;
  ShowMessage('Proceso terminado.');
end;

procedure TfrmMaestroEstudiante.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 27) and (ProgressBar1.Visible) then
  begin
    if MessageDlg('Abortar proceso?', mtInformation, [mbYes, mbNo], 0)= mrYes then
    begin
      abortarProceso := True;
      ProgressBar1.Visible:= False;
    end else
    abortarProceso := False;
  end
  Else abortarProceso := False;
end;

procedure TfrmMaestroEstudiante.FormKeyPress(Sender: TObject;
  var Key: Char);
  var  t : integer;
begin
  t:=1;
end;

procedure TfrmMaestroEstudiante.btnCancelarClick(Sender: TObject);
begin
  if dmEstudiante.qryEstudianteMast.State In [dsEdit, dsInsert] then
  dmEstudiante.qryEstudianteMast.Cancel;
  
  if dmEstudiante.qryEstudianteDet.State In [dsEdit, dsInsert] then
  dmEstudiante.qryEstudianteDet.Cancel;
end;

end.
