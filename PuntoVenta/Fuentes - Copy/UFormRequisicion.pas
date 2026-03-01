unit UFormRequisicion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, rxToolEdit, RXDBCtrl, RxLookup, StdCtrls, Mask, DBCtrls, Buttons,
  Grids, DBGrids, RXCtrls, WinSkinData, GetAnyDate;

type
  TfrmRequisicion = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    SpeedButton4: TSpeedButton;
    DBStatusLabel2: TDBStatusLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    dsQryEmpleados: TDataSource;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    GetAnyDate1: TGetAnyDate;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    BitBtn9: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label6: TLabel;
    SkinData1: TSkinData;
    procedure SpeedButton1Click2(Sender: TObject);
    procedure SpeedButton2Click2(Sender: TObject);
    procedure SpeedButton3Click2(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn1Click2(Sender: TObject);
    procedure BitBtn2Click2(Sender: TObject);
    procedure BitBtn3Click2(Sender: TObject);
    procedure BitBtn4Click2(Sender: TObject);
    procedure BitBtn5Click2(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcReceta;
    procedure ActualizaInvAlmacen;
  public
    { Public declarations }
  end;

var
  frmRequisicion: TfrmRequisicion;
  StatusProd : String;

implementation

uses UDatModPanaderia, uglobal, UDatModUsuarios, UFormPanRendimiento,
  URepRequisicion, UDatModReportes;

{$R *.dfm}



procedure TfrmRequisicion.SpeedButton1Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanReqMateriaPMast.State In [dsInsert, dsEdit] then
  begin
    if dmPanaderia.tblPanReqMateriaPMast.State In [dsInsert] then
    begin
      dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value:= FsqlMaxNumero('PAN_REQ_MATERIA_PRIMA_MASTER','ID_REQUISICION');
      if dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.IsNull or (dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value = 0) then
      dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value:=1;
    end;
    dmPanaderia.tblPanReqMateriaPMast.Post;
    dmPanaderia.tblPanReqMateriaPMast.ApplyUpdates;
    if not dmPanaderia.tblPanReqMateriaPMast.Transaction.InTransaction then
    dmPanaderia.tblPanReqMateriaPMast.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanReqMateriaPMast.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanReqMateriaPMast.Transaction.RollbackRetaining;
    end;
    BitBtn8.Enabled:=True;
  end;
end;

procedure TfrmRequisicion.SpeedButton2Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanReqMateriaPMast.State = dsBrowse then
  begin
    BitBtn8.Enabled:=False;
    dmPanaderia.tblPanReqMateriaPMast.Insert;
    dmPanaderia.tblPanReqMateriaPMastSTATUS.Value:='A';
    dmPanaderia.tblPanReqMateriaPMastFECHA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    dmPanaderia.tblPanReqMateriaPMastFECHA_IN.Value:= Now;
    dmPanaderia.tblPanReqMateriaPMastIN_POR.Value:= StruserName;
    dmPanaderia.tblPanReqMateriaPMastCOD_USUARIO.Value:= VarUsuarioGlb;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmRequisicion.SpeedButton3Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanReqMateriaPMast.State in [dsinsert, dsEdit] then
  begin
    dmPanaderia.tblPanReqMateriaPMast.Cancel;
  end else
  begin
    {if MessageDlg('Cancelar plan?', mtinformation,[mbyes,mbno],0)=mryes then
    begin
    if dmPanaderia.tblPanReqMateriaPMastDetSTATUS.Value = 'A' then
    begin
      dmPanaderia.tblPanReqMateriaPMastDet.Edit;
      dmPanaderia.tblPanReqMateriaPMastDetSTATUS.Value:='C';
      SpeedButton6Click(Self);
    end;
    end;}
  end;
end;

procedure TfrmRequisicion.SpeedButton7Click(Sender: TObject);
begin
  dmPanaderia.tblPanReqMateriaPMast.Close;
  dmPanaderia.tblPanReqMateriaPMast.Open;
end;

procedure TfrmRequisicion.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar definitivamente esta requisicion?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if MessageDlg('Detalles serán eliminados, desea continuar?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmPanaderia.tblPanReqMateriaPDet.First;
      While Not dmPanaderia.tblPanReqMateriaPDet.Eof do
      begin
        dmPanaderia.tblPanReqMateriaPDet.Delete;
      end;
      //SpeedButton6Click(Self);
    end;
    if dmPanaderia.tblPanReqMateriaPDet.RecordCount = 0 then
    begin
      if dmPanaderia.tblPanReqMateriaPMastSTATUS.Value = 'A' then
      begin
        dmPanaderia.tblPanReqMateriaPMast.Delete;
        SpeedButton1Click2(Self);
      end;
    end;
  end;
end;

procedure TfrmRequisicion.BitBtn1Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanReqMateriaPDet.State = dsBrowse then
  begin
    dmPanaderia.tblPanReqMateriaPDet.Insert;
    //DBEdit2.SetFocus;
  end;
end;

procedure TfrmRequisicion.BitBtn2Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanReqMateriaPDet.State = dsBrowse then
  dmPanaderia.tblPanReqMateriaPDet.Edit;
end;

procedure TfrmRequisicion.BitBtn3Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanReqMateriaPDet.State in [dsEdit, dsInsert] then
  dmPanaderia.tblPanReqMateriaPDet.cancel;
end;

procedure TfrmRequisicion.BitBtn4Click2(Sender: TObject);
var
  sql : string;
begin
  if (dmPanaderia.tblPanReqMateriaPMastSTATUS.Value = 'R') then
  begin
    MessageDlg('Requisicion fue procesada, verifique', mtWarning, [mbok],0);
    Exit;
  end;
  if dmPanaderia.qryDatosCalcReceta.State = dsInactive then
  begin
    MessageDlg('Favor calcular receta',mtWarning,[mbok],0);
    SpeedButton4.Show;
    exit;
  end;
  SpeedButton1Click2(Self);
  if dmPanaderia.ibSqlCheckIdReq.Open then
  dmPanaderia.ibSqlCheckIdReq.Close;
  dmPanaderia.ibSqlCheckIdReq.Params[0].Value:=dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
  dmPanaderia.ibSqlCheckIdReq.ExecQuery;
  if Not dmPanaderia.ibSqlCheckIdReq.Transaction.InTransaction then
  dmPanaderia.ibSqlCheckIdReq.Transaction.StartTransaction;
  try
    dmPanaderia.ibSqlCheckIdReq.Transaction.CommitRetaining;
  except
  dmPanaderia.ibSqlCheckIdReq.Transaction.RollbackRetaining;
  end;

  if (dmPanaderia.ibSqlCheckIdReq.RecordCount = 1) then
  begin
    sql:='Delete from PAN_REQ_MATERIA_PRIMA_DET where status = '+
    chr(39)+'A'+chr(39)+' and id_requisicion = ' +
    dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.AsString;
    dmPanaderia.ibSql.SQL.Text:=sql;
    if not dmPanaderia.ibSql.Prepared then
    dmPanaderia.ibSql.Prepare;
    dmPanaderia.ibSql.ExecQuery;
  end;
  dmPanaderia.qryDatosCalcReceta.First;
  if dmPanaderia.tblPanReqMateriaPDet.State = dsInactive then
  dmPanaderia.tblPanReqMateriaPDet.Open;
  StatusProd:='';
  While Not dmPanaderia.qryDatosCalcReceta.Eof Do
  begin
    dmPanaderia.tblPanReqMateriaPDet.Insert;
    dmPanaderia.tblPanReqMateriaPDetSERIE.Value         := FsqlMaxNumero('PAN_REQ_MATERIA_PRIMA_DET','serie');
    dmPanaderia.tblPanReqMateriaPDetID_REQUISICION.Value:= dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
    dmPanaderia.tblPanReqMateriaPDetCODIGO_PROD.Value := dmPanaderia.qryDatosCalcRecetaCODIGO_PROD.Value;
    dmPanaderia.tblPanReqMateriaPDetTIPO_UNIDAD.Value := dmPanaderia.qryDatosCalcRecetaTIPO_UNIDAD.Value; 
    dmPanaderia.tblPanReqMateriaPDetCANTIDAD.Value:=dmPanaderia.qryDatosCalcRecetaCANTIDAD.Value;
    dmPanaderia.tblPanReqMateriaPDetPRECIO.Value  :=dmPanaderia.qryDatosCalcRecetaPRECIO.Value;
    dmPanaderia.tblPanReqMateriaPDetVALOR.Value   :=dmPanaderia.qryDatosCalcRecetaCANTIDAD.Value * dmPanaderia.qryDatosCalcRecetaPRECIO.Value;
    dmPanaderia.tblPanReqMateriaPDetSTATUS.Value  := 'A';
    dmPanaderia.tblPanReqMateriaPDetFECHA_IN.Value:= Now;
    dmPanaderia.tblPanReqMateriaPDetIN_POR.Value  := StrUserName;
    
    dmPanaderia.tblPanReqMateriaPDet.Post;
    dmPanaderia.tblPanReqMateriaPDet.ApplyUpdates;
    if Not dmPanaderia.tblPanReqMateriaPDet.Transaction.InTransaction then
    dmPanaderia.tblPanReqMateriaPDet.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanReqMateriaPDet.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanReqMateriaPDet.Transaction.RollbackRetaining;
    end;
    //Actualiza Inventario Produccion
    ActualizaInvAlmacen;

    dmPanaderia.qryDatosCalcReceta.Next;
  end;
  if (StatusProd <> '') then
  begin
    dmPanaderia.tblPanReqMateriaPMast.Edit;
    dmPanaderia.tblPanReqMateriaPMastSTATUS.Value:=StatusProd;
    SpeedButton1Click2(Self);
  end;
  RxDBGrid1.BringToFront;
  RxDBGrid1.Visible:=True;
  RxDBGrid2.SendToBack;
  RxDBGrid2.Visible:=False;
{  if dmPanaderia.tblPanReqMateriaPDet.State in [dsEdit, dsInsert] then
  begin
    if dmPanaderia.tblPanReqMateriaPDet.State = dsInsert then
    begin
      dmPanaderia.tblPanReqMateriaPDetSERIE.Value := FsqlMaxNumero('PAN_REQ_MATERIA_PRIMA_DET','serie');
      if dmPanaderia.tblPanReqMateriaPDetserie.IsNull Or (dmPanaderia.tblPanReqMateriaPDetserie.Value = 0) then
      dmPanaderia.tblPanReqMateriaPDetserie.Value := 1;
    end;
    dmPanaderia.tblPanReqMateriaPDet.Post;
    dmPanaderia.tblPanReqMateriaPDet.ApplyUpdates;
    if Not dmPanaderia.tblPanReqMateriaPDet.Transaction.InTransaction then
    dmPanaderia.tblPanReqMateriaPDet.Transaction.StartTransaction;
    try
      dmPanaderia.tblPanReqMateriaPDet.Transaction.CommitRetaining;
    except
    dmPanaderia.tblPanReqMateriaPDet.Transaction.RollbackRetaining;
    end;
  end; }
end;

procedure TfrmRequisicion.BitBtn5Click2(Sender: TObject);
begin
  if dmPanaderia.tblPanReqMateriaPDet.State in [dsInactive, dsBrowse] then
  begin
    dmPanaderia.tblPanReqMateriaPDet.Close;
    dmPanaderia.tblPanReqMateriaPDet.Open;
  end;
end;

procedure TfrmRequisicion.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryEmpleados.Close;
  dmUsuarios.qryEmpleados.Open;
  dmPanaderia.qryRecetas.Close;
  dmPanaderia.qryRecetas.Open;
  dmPanaderia.tblPanReqMateriaPMast.Close;
  dmPanaderia.tblPanReqMateriaPMast.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmPanaderia.tblPanReqMateriaPMast.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmPanaderia.tblPanReqMateriaPMast.Open;
  RxDBGrid2.SendToBack;
  RxDBGrid2.Visible:=False;
  RxDBGrid1.BringToFront;
  RxDBGrid1.Visible:=True;
end;

procedure TfrmRequisicion.ProcReceta;
begin
  //t if dmPanaderia.tblPanReqMateriaPMast.State = dsInsert then
  //t begin
    RxDBGrid1.SendToBack;
    RxDBGrid1.Visible:=False;
    RxDBGrid2.BringToFront;
    RxDBGrid2.Visible:=True;
    if dmPanaderia.tblPanReqMateriaPMastCANTIDAD.IsNull then exit;
    dmPanaderia.qryDatosCalcReceta.Close;
    dmPanaderia.qryDatosCalcReceta.Params[0].Value:= dmPanaderia.tblPanReqMateriaPMastCANTIDAD.Value;
    dmPanaderia.qryDatosCalcReceta.Params[1].Value:= dmPanaderia.tblPanReqMateriaPMastID_RECETA.Value;
    dmPanaderia.qryDatosCalcReceta.Open;
  //t end;
end;

procedure TfrmRequisicion.SpeedButton4Click(Sender: TObject);
begin
  ProcReceta;
end;

procedure TfrmRequisicion.BitBtn7Click(Sender: TObject);
begin
  frmPanRendimiento:=TfrmPanRendimiento.Create(nil);
  try
    dmPanaderia.tblPanRendimiento.Close;
    dmPanaderia.tblPanRendimiento.Params[0].Value:=dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
    dmPanaderia.tblPanRendimiento.Open;
    frmPanRendimiento.Showmodal;
  finally
  frmPanRendimiento.Free;
  frmPanRendimiento:=Nil;
  end;
end;

procedure TfrmRequisicion.BitBtn8Click(Sender: TObject);
begin
  if GetAnyDate1.Execute then
  begin
    dmPanaderia.tblPanReqMateriaPMast.Close;
    dmPanaderia.tblPanReqMateriaPMast.Params[0].Value:= ExtraerFecha(GetAnyDate1.Fecha);
    dmPanaderia.tblPanReqMateriaPMast.Params[1].Value:= ExtraerFecha(GetAnyDate1.FechaFinal);
    dmPanaderia.tblPanReqMateriaPMast.Open;
    if dmPanaderia.tblPanReqMateriaPMast.RecordCount = 0 then
    begin
      RxDBGrid2.BringToFront;
      RxDBGrid2.Visible:=True;
      RxDBGrid1.SendToBack;
      RxDBGrid1.Visible:=False;
    end else
    begin
      RxDBGrid1.BringToFront;
      RxDBGrid1.Visible:=True;
      RxDBGrid2.SendToBack;
      RxDBGrid2.Visible:=False;
    end;
  end;
end;

procedure TfrmRequisicion.BitBtn10Click(Sender: TObject);
begin
  dmPanaderia.tblPanReqMateriaPMast.First;
end;

procedure TfrmRequisicion.BitBtn11Click(Sender: TObject);
begin
  dmPanaderia.tblPanReqMateriaPMast.Prior;
end;

procedure TfrmRequisicion.BitBtn12Click(Sender: TObject);
begin
  dmPanaderia.tblPanReqMateriaPMast.Next;
end;

procedure TfrmRequisicion.BitBtn13Click(Sender: TObject);
begin
  dmPanaderia.tblPanReqMateriaPMast.Last;
end;

procedure TfrmRequisicion.ActualizaInvAlmacen;
begin
  dmPanaderia.stpMantInvAlmacen.Params[0].Value := dmPanaderia.qryDatosCalcRecetaCODIGO_PROD.Value;
  dmPanaderia.stpMantInvAlmacen.Params[1].Value := GlbIDAlmacenProd;
  dmPanaderia.stpMantInvAlmacen.Params[2].Value := dmPanaderia.qryDatosCalcRecetaCANTIDAD.Value;
  dmPanaderia.stpMantInvAlmacen.Params[3].Value := VarUsuarioGlb;    //codigo_usuario
  dmPanaderia.stpMantInvAlmacen.Params[4].Value := ExtraerFecha(Now);//fecha_in
  dmPanaderia.stpMantInvAlmacen.Params[5].Value := strUserName;      //in_por
  dmPanaderia.stpMantInvAlmacen.Params[6].Value := ExtraerFecha(Now);//fecha_mod
  dmPanaderia.stpMantInvAlmacen.Params[7].Value := strUserName;      //in_por//mod_por
  dmPanaderia.stpMantInvAlmacen.Params[8].Value := 'A';              //status
  dmPanaderia.stpMantInvAlmacen.Params[9].Value := glbCia_Key;
  dmPanaderia.stpMantInvAlmacen.ExecProc;
  if Not dmPanaderia.stpMantInvAlmacen.Transaction.InTransaction then
  dmPanaderia.stpMantInvAlmacen.Transaction.StartTransaction;
  try
    dmPanaderia.stpMantInvAlmacen.Transaction.CommitRetaining;
  except
  dmPanaderia.stpMantInvAlmacen.Transaction.RollbackRetaining;
  end;
  StatusProd:='R';
end;

procedure TfrmRequisicion.BitBtn9Click(Sender: TObject);
var
  sqlT : String;
begin
  sqlT:='';
  if RadioButton1.Checked then
  begin
    dmReportes.qryRepRequisicion.Close;
      dmReportes.qryRepRequisicion.Params[0].ParamType := ptInput;
      dmReportes.qryRepRequisicion.Params[1].ParamType := ptInput;
    dmReportes.qryRepRequisicion.Params[0].AsInteger := dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
    dmReportes.qryRepRequisicion.Params[1].AsInteger := dmPanaderia.tblPanReqMateriaPMastID_REQUISICION.Value;
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
  if (Length(sqlT) > 0 ) then
  begin
    dmReportes.qryRepRequisicion.Close;
    dmReportes.qryRepRequisicion.SQL.Text := sqlT;
    if dmReportes.qryRepRequisicion.Prepared then
    dmReportes.qryRepRequisicion.UnPrepare;
    dmReportes.qryRepRequisicion.Prepare;
  end;
end;

end.
