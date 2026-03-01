unit UPosteoTrnDepre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, RXCtrls,
  ibquery, variants, IBCustomDataSet, Mask, DBCtrls, ToolEdit, DBTables,
  IBTable, WinSkinData;

type
  TfrmPosteoTransDepre = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtpkfecha: TDateTimePicker;
    btnProcesar: TBitBtn;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    tabDatosActivos: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabCalDepre: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    RxLabel1: TRxLabel;
    ProgressBar1: TProgressBar;
    tActivosControl: TIBTable;
    dtActivosControl: TDataSource;
    tActivosControlFECHA_ACTUALIZAR: TDateTimeField;
    tActivosControlIN_POR: TStringField;
    tActivosControlFECHA_IN: TDateTimeField;
    tActivosControlUPD_POR: TStringField;
    tActivosControlFECHA_UPD: TDateTimeField;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnProcesarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ActualizarMaestroActivos;
    Procedure Actualiza;
    Procedure ActualizaHistorico;
    procedure ActualizaDepreAnual;//correr este procedure en Enero de Cada Año
    Function VerificaFecha:Boolean;
  public
    { Public declarations }
  end;

var
  frmPosteoTransDepre: TfrmPosteoTransDepre;

implementation
Uses UDatModuloActivos,UGlobalActivos;

{$R *.DFM}

procedure TfrmPosteoTransDepre.FormCreate(Sender: TObject);
var
  anio,mes,dia : Word;
begin
  dm.qryControl.Close;
  dm.qryControl.Filtered:= False;//16--> Depreciacion de Activos
  GlBCntSistema := 16;
  GlbCntSub_sistema:=1;
  GlbCntCod_cia:=1;
  dm.qryControl.Filtered:= True;
  dm.qryControl.Open;
  dtpkfecha.DateTime:= dm.qryControlFECHA_ACT.Value;
  DecodeDate(dtpkfecha.DateTime,Anio,Mes,Dia);
  {if mes = 12 then
  begin
    Inc(anio);
    Mes:=1;
  end;}
  dia:=DiasEnElMes(anio,mes);
  dtpkfecha.DateTime:=EncodeDate(anio,mes,dia);
  RxLabel1.Visible  := False;
  if dm.qrycontrolStatus.Value = 'R' then
  begin
    dtpkfecha.DateTime := dm.qryControlFECHA_ACT.Value;
    btnProcesar.Enabled:= False;
    RxLabel1.Visible   := True;
  end;
  dm.qryMaestroActivos.Close;
  dm.qryMaestroActivos.Open;
  dm.qryDepreciacion.Filtered := False;
  dm.qryDepreciacion.Close;
  dm.qryDepreciacion.Params[0].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Params[1].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Open;
end;

procedure TfrmPosteoTransDepre.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dm.qryDepreciacionSTATUS.Value = 'R' then
  Background := $00CAE1C4;// else Background := clWindow;
end;

procedure TfrmPosteoTransDepre.btnProcesarClick(Sender: TObject);
begin
  //no usar ActualizaDepreAnual;
  if not VerificaFecha then Exit;
  ActualizaHistorico;
  ActualizarMaestroActivos;
  dm.qrycontrol.Edit;
  dm.qrycontrolstatus.Value := 'R';
  dm.qrycontrol.Post;
  dm.qrycontrol.ApplyUpdates;
    if not dm.qryControl.Transaction.InTransaction then
  dm.qryControl.Transaction.StartTransaction;
  try
    dm.qryControl.Transaction.CommitRetaining;
  except
  dm.qryControl.Transaction.RollbackRetaining;
  end;

end;

procedure TfrmPosteoTransDepre.ActualizarMaestroActivos;
var
  MCaption : String;
begin
  Dm.QryDepreciacion.First;
  ProgressBar1.Max := dm.qryDepreciacion.RecordCount;
  MCaption:= Caption;
  Caption:= 'Actualizando Maestro Activos con depreciacion mensual...';
  While Not dm.qryDepreciacion.Eof do
  begin
    if dm.qryDepreciacionStatus.Value = 'A' then
    begin
      if dm.qryMaestroActivos.Locate('tipo;codigo',
      VarArrayOf([dm.qryDepreciacionTIPO.Value,dm.qryDepreciacionCODIGO.Value]),[]) then
      begin
        Actualiza;
      end else
      begin
        Messagedlg(dm.qryDepreciacionTIPO.AsString+'-'+dm.qryDepreciacionCODIGO.AsString+
        ' -->Activo No encontrado en "Maestro de Activos"',mtError,[mbok],0);
      end;
    end;
    ProgressBar1.StepIt;
    dm.qryDepreciacion.Next;
  end;
  if not dm.qryDepreciacion.Transaction.InTransaction then
  dm.qryDepreciacion.Transaction.StartTransaction;
  try
    dm.qryDepreciacion.Transaction.CommitRetaining;
  except
  dm.qryDepreciacion.Transaction.RollbackRetaining;
  end;
  ProgressBar1.Position:=0;
  Caption:= MCaption;
end;

procedure TfrmPosteoTransDepre.Actualiza;
begin
  if dm.qryMaestroActivosSTATUS_ACTIVO.Value = 'A' then
  begin
    dm.qryMaestroActivos.Edit;
    dm.qryMaestroActivosDEPRE_ACUMULADA.Value:=
    dm.qryMaestroActivosDEPRE_ACUMULADA.Value + dm.qryDepreciacionVALOR.Value;
    dm.qryMaestroActivosDEPRE_MENSUAL.Value:=dm.qryDepreciacionVALOR.Value;
    dm.qrymaestroactivosDEPRE_ANUAL.Value :=
    dm.qrymaestroactivosDEPRE_ANUAL.Value + dm.qryDepreciacionVALOR.Value;
    dm.qryMaestroActivosVALOR_EN_LIBRO.Value :=
    dm.qryMaestroActivosVALOR_EN_LIBRO.Value - dm.qryDepreciacionVALOR.Value;
    dm.qryMaestroActivosBALANCE_DEPRE.Value :=  dm.qryMaestroActivosVALOR_EN_LIBRO.Value;
    dm.qryMaestroActivosFECHA_ULT_ACT.Value := ExtraerFecha(dtpkfecha.Datetime);
    dm.qrymaestroactivosfecha_upd.Value     := Now;
    dm.qryMaestroActivosupd_POR.Value:=StrUserName;
    dm.qryMaestroActivos.Post;
    dm.qryMaestroActivos.ApplyUpdates;
    dm.qryDepreciacion.Edit;
    dm.qryDepreciacionStatus.Value := 'R';
    dm.qryDepreciacion.Post;
    dm.qryDepreciacion.ApplyUpdates;
  end;
end;

procedure TfrmPosteoTransDepre.ActualizaHistorico;
var
  MCaption:String;
begin
  MCaption:= Caption;
  Caption:='Actualizando Historio de Activos...';
  dm.qryHistoricoActivos.Close;
  dm.qryHistoricoActivos.Filtered:=False;
  dm.qryHistoricoActivos.Params[0].Value :=ExtraerFecha(dtpkfecha.DateTime);
  dm.qryHistoricoActivos.Params[1].Value :=ExtraerFecha(dtpkfecha.DateTime);
  dm.qryHistoricoActivos.Open;
  if dm.qryHistoricoActivos.Recordcount > 0 then Exit;
  dm.qryMaestroActivos.First;
  progressbar1.Position:=0;
  progressbar1.Max := dm.qryMaestroActivos.RecordCount;
  While not dm.qryMaestroActivos.Eof do
  begin
    progressbar1.StepIt;
    dm.qryHistoricoActivos.Insert;
    dm.qryHistoricoActivosTIPO.Value   := dm.qryMaestroActivosTIPO.Value;
    dm.qryHistoricoActivosCODIGO.Value := dm.qryMaestroActivoscodigo.Value;
    dm.qryHistoricoActivosFECHA.Value  := ExtraerFecha(dtpkfecha.datetime);
    dm.qryHistoricoActivosDEPRE_ACUMULADA.Value := dm.qrymaestroactivosDEPRE_ACUMULADA.Value;
    dm.qryHistoricoActivosVALOR_EN_LIBRO.Value  := dm.qrymaestroactivosValor_En_Libro.Value;
    dm.qryHistoricoActivosBALANCE_DEPRE.Value   := dm.qrymaestroactivosbalance_depre.Value;
    dm.qryHistoricoActivosIN_POR.Value   := StrUserName;
    dm.qryHistoricoActivosFECHA_IN.Value := Now;
    dm.qryHistoricoActivos.Post;
    dm.qryHistoricoActivos.ApplyUpdates;
    dm.qryMaestroActivos.Next;
  end;
  progressbar1.Position:=0;
  if not dm.qryMaestroActivos.Transaction.InTransaction then
  dm.qryMaestroActivos.Transaction.StartTransaction;
  try
    dm.qryMaestroActivos.Transaction.Commit;
  except
  dm.qryMaestroActivos.Transaction.Rollback;
  end;
  dm.qryHistoricoActivos.Close;
  Caption:= MCaption;
end;

procedure TfrmPosteoTransDepre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.qryHistoricoActivos.Close;
  dm.qryMaestroActivos.Close;
  dm.qryMaestroActivos.Filtered := False;
  dm.qryDepreciacion.Close;
  dm.qryDepreciacion.Filtered := False;
end;

procedure TfrmPosteoTransDepre.ActualizaDepreAnual;
var
  a1 : Integer;
begin
  dm.qryMaestroActivos.First;
  tActivosControl.close;
  tActivosControl.Open;
  if ExtraerFecha(tActivosControlFECHA_ACTUALIZAR.Value) =
     ExtraerFecha(dm.qryControlFECHA_ACT.Value) then
  begin
    if MessageDlg('Iniciar proceso de Actualización Valor en Libro?',mtinformation,[mbyes,mbno],0)=mrNo then
    Exit else
    begin
      While Not dm.qryMaestroActivos.Eof do
      begin
        dm.qryMaestroActivos.Edit;
        dm.qryMaestroActivosValor_depreciable.Value:= dm.qryMaestroActivosVALOR_EN_LIBRO.Value;
        dm.qryMaestroActivos.Post;
        dm.qryMaestroActivos.ApplyUpdates;
        dm.qryMaestroActivos.Next;
      end;
      tActivosControl.Edit;
      a1:= StrToInt(FormatDatetime('yyyy',Date));
      Inc(a1);
      tActivosControlFecha_Actualizar.Value := EncodeDate(a1,1,31);
      tactivoscontrolupd_por.Value:= StrUserName;
      tActivosControlfecha_upd.value:= Now;
      tActivosControl.Post;
      if Not tActivosControl.Transaction.InTransaction then
      tActivosControl.Transaction.StartTransaction;
      try
        tActivosControl.Transaction.CommitRetaining;
      except
      tActivosControl.Transaction.RollbackRetaining;
      end;
    end;//else MessageDlg('Iniciar proceso de Actualizacion de Valor en Libro?',mtinformation,[mbyes,mbno],0)=mrNo then
  end;
end;

procedure TfrmPosteoTransDepre.BitBtn6Click(Sender: TObject);
begin
  tActivosControl.close;
  tActivosControl.open;
end;

procedure TfrmPosteoTransDepre.BitBtn3Click(Sender: TObject);
begin
  if (StrToInt(FormatDateTime('mm',tActivosControlFECHA_ACTUALIZAR.Value)) = 1)   and
     (FormatDateTime('dd',tActivosControlFECHA_ACTUALIZAR.Value) = '31') then
  begin
    if tActivosControl.State = dsEdit then
    begin
      tActivosControl.Post;
      if Not tActivosControl.Transaction.InTransaction then
      tActivosControl.Transaction.StartTransaction;
      try
        tActivosControl.Transaction.CommitRetaining;
      except
      tActivosControl.Transaction.RollbackRetaining;
      end;
    end;
  end else
  begin
    MessageDlg('('+FormatDatetime('yyyy-mmm-dd',tActivosControlFECHA_ACTUALIZAR.Value)+') '+'Fecha debe ser xxxx-Enero-31, Verifique',mterror,[mbok],0);
    DBDateEdit1.SetFocus;
  end;
end;

Function TfrmPosteoTransDepre.VerificaFecha:Boolean;
begin
  dm.qryControl.Close;
  dm.qryControl.Filtered:= False;//16--> Depreciacion de Activos
  GlBCntSistema := 16;
  GlbCntSub_sistema:=1;
  GlbCntCod_cia:=1;
  dm.qryControl.Filtered:= True;
  dm.qryControl.Open;
  Result:=True;
  if (ExtraerFecha(dm.qryControlFECHA_ACT.Value) < ExtraerFecha(dtpkfecha.DateTime)) or
     (ExtraerFecha(dm.qryControlFECHA_ACT.Value) > ExtraerFecha(dtpkfecha.DateTime)) then
  begin
    MessageDlg('Fecha Incorrecta, Verifique',mtError,[mbok],0);
    Result:=False;
  end;
end;

end.
