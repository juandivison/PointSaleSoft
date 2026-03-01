unit UFormMantDepositos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  db, RXCtrls, ExtCtrls, RxLookup, WinSkinData, RxToolEdit;

type
  TfrmDepositos = class(TForm)
    Label1: TLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Shape1: TShape;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    SpeedButton5: TSpeedButton;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label3: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label11: TLabel;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton9: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Shape2: TShape;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    procedure SpeedButton1Click2(Sender: TObject);
    procedure SpeedButton2Click2(Sender: TObject);
    procedure SpeedButton3Click2(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Function ValidarMonto : Boolean;
    procedure GuardarDatosDistBilletes;
    procedure LlenaDatosBilletes;
  public
    { Public declarations }

  end;

var
  frmDepositos: TfrmDepositos;

implementation

uses UDatModTransCnt, uglobal, UFormSelFecha, UDmRep, URepDepositos,
  UFormDepDesglose;

{$R *.dfm}

procedure TfrmDepositos.SpeedButton1Click2(Sender: TObject);
begin
  if dmTransCnt.tblDepositoMaster.State in [dsInsert, dsEdit] then
  begin
    //dmTransCnt.tblDepositoMasterid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    if dmTransCnt.tblDepositoMasterID_BANCO.IsNull then
    begin
      MessageDlg('Debe indicar Banco', mtError, [mbok],0);
      Exit;
    end;
    dmTransCnt.tblDepositoMaster.Post;
    dmTransCnt.tblDepositoMaster.ApplyUpdates;
    if not dmTransCnt.tblDepositoMaster.Transaction.InTransaction then
    dmTransCnt.tblDepositoMaster.Transaction.StartTransaction;
    try
      dmTransCnt.tblDepositoMaster.Transaction.CommitRetaining;
    except
    dmTransCnt.tblDepositoMaster.Transaction.RollbackRetaining;
    end;
    //SpeedButton2.Enabled:= False;
    SpeedButton4.Enabled:= True;
  end;
  if dmTransCnt.tblDepositoDet.State in [dsInsert, dsEdit] then
  begin
    //dmTransCnt.tblDepositoMasterid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    if dmTransCnt.tblDepositoDetTIPO_DEPOSITO.IsNull then
    begin
      MessageDlg('Debe indicar tipo deposito',mtError,[mbok],0);
      Exit;
    end;
    if dmTransCnt.tblDepositoDet.State in [dsInsert] then
    dmTransCnt.tblDepositoDetNUMERO.Value := dmTransCnt.tblDepositoMasterNUMERO.Value;
    dmTransCnt.tblDepositoDet.Post;
    dmTransCnt.tblDepositoDet.ApplyUpdates;
    if not dmTransCnt.tblDepositoDet.Transaction.InTransaction then
    dmTransCnt.tblDepositoDet.Transaction.StartTransaction;
    try
      dmTransCnt.tblDepositoDet.Transaction.CommitRetaining;
    except
    dmTransCnt.tblDepositoDet.Transaction.RollbackRetaining;
    end;
  end;
    if dmTransCnt.tblDepositoDet.UpdatesPending then
    begin
      dmTransCnt.tblDepositoDet.ApplyUpdates;
      if not dmTransCnt.tblDepositoDet.Transaction.InTransaction then
      dmTransCnt.tblDepositoDet.Transaction.StartTransaction;
      try
        dmTransCnt.tblDepositoDet.Transaction.CommitRetaining;
      except
      dmTransCnt.tblDepositoDet.Transaction.RollbackRetaining;
      end;
    end;
end;

procedure TfrmDepositos.SpeedButton2Click2(Sender: TObject);
begin
  if dmTransCnt.tblDepositoMaster.State in [dsInsert, dsInactive, dsedit] then
  exit;

  ValidarMonto;
  //dmTransCnt.totalDet
  if dmTransCnt.tblDepositoMaster.State = dsBrowse then
  begin
    dmTransCnt.tblDepositoMaster.Insert;
    dmTransCnt.tblDepositoMasterSTATUS.Value:='A';
    dmTransCnt.tblDepositoMasterFECHA.Value :=ExtraerFecha(GlbFechaTrnDiaria);
    dmTransCnt.tblDepositoMasterFECHA_IN.Value:= Now;
    dmTransCnt.tblDepositoMasterIN_POR.Value  := StruserName;
    dmTransCnt.tblDepositoMasterCOD_USUARIO.Value:= VarUsuarioGlb;
    RxDBLookupCombo1.SetFocus;
    //SpeedButton2.Enabled:= True;
    SpeedButton4.Enabled:= False;
  end;
end;

procedure TfrmDepositos.SpeedButton3Click2(Sender: TObject);
begin
  if dmTransCnt.tblDepositoMaster.State in [dsinsert, dsEdit] then
  begin
    dmTransCnt.tblDepositoMaster.Cancel;
  end else
  begin
    if MessageDlg('Cancelar deposito?', mtinformation,[mbyes,mbno],0)=mryes then
    begin
    if dmTransCnt.tblDepositoMasterSTATUS.Value = 'A' then
    begin
      dmTransCnt.tblDepositoDet.Edit;
      dmTransCnt.tblDepositoMasterSTATUS.Value:='C';
      SpeedButton1Click2(self);
    end;
    end;
  end;
end;

procedure TfrmDepositos.SpeedButton7Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
  if frmSelFecha.ShowModal = mrOk then
  begin
    dmtranscnt.tblTransCntMaster.Close;
    dmtranscnt.tblTransCntMaster.Params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
    dmtranscnt.tblTransCntMaster.Params[1].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);    
    dmtranscnt.tblTransCntMaster.Open;
  end;
end;

procedure TfrmDepositos.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Desea Esta transaccion?', mtWarning,[mbyes,mbno],0)=mryes then
  begin
    if MessageDlg('Detalle serán eliminados tambien, desea continuar?', mtWarning,[mbyes,mbno],0)=mryes then
    begin
      dmTransCnt.tblDepositoDet.First;
      While Not dmTransCnt.tblDepositoDet.Eof do
      begin
        dmTransCnt.tblDepositoDetSTATUS.Value:='C';
      end;
      SpeedButton1Click2(self);

    end;
    if dmTransCnt.tblDepositoDet.RecordCount = 0 then
    begin
      if dmTransCnt.tblDepositoMasterSTATUS.Value = 'A' then
      begin
        dmTransCnt.tblDepositoMaster.Delete;
       dmTransCnt.tblDepositoDet.ApplyUpdates;
       if not dmTransCnt.tblDepositoDet.Transaction.InTransaction then
       dmTransCnt.tblDepositoDet.Transaction.StartTransaction;
       try
         dmTransCnt.tblDepositoDet.Transaction.CommitRetaining;
       except
       dmTransCnt.tblDepositoDet.Transaction.RollbackRetaining;
       end;
      end;
    end;
  end;
end;

procedure TfrmDepositos.SpeedButton4Click(Sender: TObject);
begin
  if dmTransCnt.tblDepositoDet.State = dsBrowse then
  begin
    if dmTransCnt.tblDepositoMaster.state = dsInsert then
    begin
      messagedlg('Primero debe guardar record master.', mtError, [mbok],0);
      Exit;
    end;

    if dmTransCnt.tblDepositoMasterNUMERO.IsNull then
    begin
      messagedlg('No existe record master para relacionar detalle, verifique',mtError, [mbok],0);
      Exit;
    end;
    dmTransCnt.tblDepositoDet.Insert;
    dmTransCnt.tblDepositoDetNUMERO.Value:= dmTransCnt.tblDepositoMasterNUMERO.Value;
    dmTransCnt.tblDepositoDetSTATUS.Value:= 'A';
    dmTransCnt.tblDepositoDetFECHA_IN.Value:= Now;
    dmTransCnt.tblDepositoDetCOD_USUARIO.Value:= VarUsuarioGlb;
    RxDBLookupCombo2.SetFocus;
  end;
end;

procedure TfrmDepositos.FormShow(Sender: TObject);
begin
  if (formatdatetime('mm',now) = '5') then
  begin
    messagedlg('Este modulo esta vencido, favor llamar a soporte tecnico, gracias',mtWarning, [mbok],0);
    SpeedButton2.Enabled:=false;
    SpeedButton1.Enabled:=false;
  end;
end;

procedure TfrmDepositos.FormCreate(Sender: TObject);
begin
  dmTransCnt.qryBancos.Close;
  dmTransCnt.qryBancos.Open;
  dmTransCnt.tblTipoDeposito.Close;
  dmTransCnt.tblTipoDeposito.Open;
  dmtranscnt.tblDepositoMaster.Close;
  dmtranscnt.tblDepositoMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmtranscnt.tblDepositoMaster.Open;
end;

Function TfrmDepositos.ValidarMonto : Boolean;
begin
  if (dmTransCnt.tblDepositoDet.RecordCount > 0) then
  begin
    result := True;
    dmTransCnt.ProcSumar;
    if (dmTransCnt.totalDet < dmTransCnt.tblDepositoMasterMONTO.Value) OR
       (dmTransCnt.totalDet > dmTransCnt.tblDepositoMasterMONTO.Value) then
    begin
      MessageDlg('Favor indicar monto correcto en master.', mtError, [mbok], 0);
      result := False;
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmDepositos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ValidarMonto then
  CanClose:=True else CanClose:=False;
end;

procedure TfrmDepositos.SpeedButton5Click(Sender: TObject);
begin
  dtmodrep.qryRepDepositos.Close;
  dtmodrep.qryRepDepositos.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dtmodrep.qryRepDepositos.Params[1].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dtmodrep.qryRepDepositos.Open;

  qckRepDeposito:=TqckRepDeposito.Create(nil);
  try
    qckRepDeposito.Prepare;
    glbTPag := qckRepDeposito.PageNumber;
    qckRepDeposito.Preview;
  finally
  //qckBceGral.QRPrinter.Free;
  qckRepDeposito.Free;
  qckRepDeposito:=Nil;
  end;
end;

procedure TfrmDepositos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //F5 = 116 - F4 = 115 - F9 = 120
  if (key = 115) then //F4 inserta master
  begin
    SpeedButton2Click2(Self);
  end else
  if (key = 116) and SpeedButton4.Enabled then //F4 inserta detalle
  begin
    SpeedButton4Click(Self);
  end else
  if (key = 120) then //F9 - guardar
  begin
    SpeedButton1Click2(Self);
  end; 
end;

procedure TfrmDepositos.SpeedButton6Click(Sender: TObject);
begin
  if dmTransCnt.tblDepositoDet.State in [dsBrowse] then
  begin
    dmTransCnt.tblDepositoDet.Edit;
    dmTransCnt.tblDepositoDetNUMERO.Value  := dmTransCnt.tblDepositoMasterNUMERO.Value;
    dmTransCnt.tblDepositoDetSTATUS.Value  := 'A';
    dmTransCnt.tblDepositoDetFECHA_IN.Value:= Now;
    dmTransCnt.tblDepositoDetIN_POR.Value  := strUserName; 
  end;
end;

procedure TfrmDepositos.SpeedButton9Click(Sender: TObject);
begin
  if dmTransCnt.tblDepositoMaster.State in [dsBrowse] then
  begin
    dmTransCnt.tblDepositoMaster.Edit;
    dmTransCnt.tblDepositoMasterFECHA_UPDATE.Value:=now;
    dmTransCnt.tblDepositoMasterCOD_USUARIO.Value:=VarUsuarioGlb;
  end;
end;

procedure TfrmDepositos.BitBtn9Click(Sender: TObject);
begin
  dmTransCnt.tblDepositoMaster.First;
end;

procedure TfrmDepositos.BitBtn10Click(Sender: TObject);
begin
  dmTransCnt.tblDepositoMaster.Prior;
end;

procedure TfrmDepositos.BitBtn11Click(Sender: TObject);
begin
  dmTransCnt.tblDepositoMaster.next;
end;

procedure TfrmDepositos.BitBtn12Click(Sender: TObject);
begin
  dmTransCnt.tblDepositoMaster.Last;
end;

procedure TfrmDepositos.BitBtn1Click(Sender: TObject);
begin
  dmTransCnt.tblDepDistBilletes.Close;
  dmTransCnt.tblDepDistBilletes.Params[0].Value:=dmTransCnt.tblDepositoMasterNUMERO.Value;
  dmTransCnt.tblDepDistBilletes.Open;
  
  frmDesgloseDeposito:=TfrmDesgloseDeposito.Create(Nil);
  try
    frmDesgloseDeposito.xtVenta:=dmTransCnt.tblDepositoMasterMONTO.Value;
    frmDesgloseDeposito.ProcInserta;
    if dmTransCnt.tblDepDistBilletes.Recordcount > 0 then
    LlenaDatosBilletes;
    if frmDesgloseDeposito.Showmodal = mrOk then
    begin
      GuardarDatosDistBilletes;
    end;
  finally
  frmDesgloseDeposito.Free;
  frmDesgloseDeposito:=Nil;
  end;
  //
end;

procedure TfrmDepositos.GuardarDatosDistBilletes;
begin
  dmTransCnt.tblDepDistBilletes.Close;
  dmTransCnt.tblDepDistBilletes.Params[0].Value:=dmTransCnt.tblDepositoMasterNUMERO.Value;
  dmTransCnt.tblDepDistBilletes.Open;
  if dmTransCnt.tblDepDistBilletes.RecordCount = 0 then
  begin
  dmTransCnt.tblDepDistBilletes.Insert;
  dmTransCnt.tblDepDistBilletesIDDEPOSITO.Value:=dmTransCnt.tblDepositoMasterNUMERO.Value;
  dmTransCnt.tblDepDistBilletesFECHA.Value     :=dmTransCnt.tblDepositoMasterFECHA.Value;
  dmTransCnt.tblDepDistBilletesCOD_EMPLEADO.Value:=VarUsuarioGlb;
  dmTransCnt.tblDepDistBilletesMONTO_EN_CHEQUE.Value:=frmDesgloseDeposito.rxCuadreMONTO_EN_CHEQUE.Value;
  dmTransCnt.tblDepDistBilletesM2000.Value:=frmDesgloseDeposito.rxCuadreM2000.AsInteger;
  dmTransCnt.tblDepDistBilletesM1000.Value:=frmDesgloseDeposito.rxCuadreM1000.AsInteger;
  dmTransCnt.tblDepDistBilletesM500.Value:=frmDesgloseDeposito.rxCuadreM500.AsInteger;
  dmTransCnt.tblDepDistBilletesM200.Value:=frmDesgloseDeposito.rxCuadreM200.AsInteger;
  dmTransCnt.tblDepDistBilletesM100.Value:=frmDesgloseDeposito.rxCuadreM100.AsInteger;
  dmTransCnt.tblDepDistBilletesM50.Value:=frmDesgloseDeposito.rxCuadreM50.AsInteger;
  dmTransCnt.tblDepDistBilletesM25.Value:=frmDesgloseDeposito.rxCuadreM25.AsInteger;
  dmTransCnt.tblDepDistBilletesM20.Value:=frmDesgloseDeposito.rxCuadreM20.AsInteger;
  dmTransCnt.tblDepDistBilletesM10.Value:=frmDesgloseDeposito.rxCuadreM10.AsInteger;
  dmTransCnt.tblDepDistBilletesM5.Value:=frmDesgloseDeposito.rxCuadreM5.AsInteger;
  dmTransCnt.tblDepDistBilletesMONTO_MONEDAS.Value:=frmDesgloseDeposito.rxCuadreMONEDAS.AsInteger;
  dmTransCnt.tblDepDistBilletesCOD_USUARIO.Value:= VarUsuarioGlb;
  dmTransCnt.tblDepDistBilletesSTATUS.Value:='A';
  dmTransCnt.tblDepDistBilletesFECHA_IN.Value:=now;
  end else
  begin
    dmTransCnt.tblDepDistBilletes.Edit;
    dmTransCnt.tblDepDistBilletesIDDEPOSITO.Value:=dmTransCnt.tblDepositoMasterNUMERO.Value;
    dmTransCnt.tblDepDistBilletesFECHA.Value     :=dmTransCnt.tblDepositoMasterFECHA.Value;
    dmTransCnt.tblDepDistBilletesCOD_EMPLEADO.Value:=VarUsuarioGlb;
    dmTransCnt.tblDepDistBilletesMONTO_EN_CHEQUE.Value:=frmDesgloseDeposito.rxCuadreMONTO_EN_CHEQUE.Value;
    dmTransCnt.tblDepDistBilletesM2000.Value:=frmDesgloseDeposito.rxCuadreM2000.AsInteger;
    dmTransCnt.tblDepDistBilletesM1000.Value:=frmDesgloseDeposito.rxCuadreM1000.AsInteger;
    dmTransCnt.tblDepDistBilletesM500.Value:=frmDesgloseDeposito.rxCuadreM500.AsInteger;
    dmTransCnt.tblDepDistBilletesM200.Value:=frmDesgloseDeposito.rxCuadreM200.AsInteger;
    dmTransCnt.tblDepDistBilletesM100.Value:=frmDesgloseDeposito.rxCuadreM100.AsInteger;
    dmTransCnt.tblDepDistBilletesM50.Value:=frmDesgloseDeposito.rxCuadreM50.AsInteger;
    dmTransCnt.tblDepDistBilletesM25.Value:=frmDesgloseDeposito.rxCuadreM25.AsInteger;
    dmTransCnt.tblDepDistBilletesM20.Value:=frmDesgloseDeposito.rxCuadreM20.AsInteger;
    dmTransCnt.tblDepDistBilletesM10.Value:=frmDesgloseDeposito.rxCuadreM10.AsInteger;
    dmTransCnt.tblDepDistBilletesM5.Value:=frmDesgloseDeposito.rxCuadreM5.AsInteger;
    dmTransCnt.tblDepDistBilletesMONTO_MONEDAS.Value:=frmDesgloseDeposito.rxCuadreMONEDAS.AsInteger;
    dmTransCnt.tblDepDistBilletesCOD_USUARIO.Value:= VarUsuarioGlb;
    //dmTransCnt.tblDepDistBilletesSTATUS.Value:='A';
    dmTransCnt.tblDepDistBilletesFECHA_UPDATE.Value:=now;
  end;
  dmTransCnt.tblDepDistBilletes.Post;
  dmTransCnt.tblDepDistBilletes.ApplyUpdates;
  if not dmTransCnt.tblDepDistBilletes.Transaction.InTransaction then
  dmTransCnt.tblDepDistBilletes.Transaction.StartTransaction;
  try
    dmTransCnt.tblDepDistBilletes.Transaction.CommitRetaining;
  except
  dmTransCnt.tblDepDistBilletes.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmDepositos.LlenaDatosBilletes;
begin
  frmDesgloseDeposito.rxCuadreMONTO_EN_CHEQUE.Value:=dmTransCnt.tblDepDistBilletesMONTO_EN_CHEQUE.Value;
  frmDesgloseDeposito.rxCuadreM2000.Value:= dmTransCnt.tblDepDistBilletesM2000.Value;
  frmDesgloseDeposito.rxCuadreM1000.Value:=dmTransCnt.tblDepDistBilletesM1000.Value;
  frmDesgloseDeposito.rxCuadreM500.Value :=dmTransCnt.tblDepDistBilletesM500.Value;
  frmDesgloseDeposito.rxCuadreM200.Value := dmTransCnt.tblDepDistBilletesM200.Value;
  frmDesgloseDeposito.rxCuadreM100.Value :=dmTransCnt.tblDepDistBilletesM100.Value;
  frmDesgloseDeposito.rxCuadreM50.Value :=dmTransCnt.tblDepDistBilletesM50.Value;
  frmDesgloseDeposito.rxCuadreM25.Value := dmTransCnt.tblDepDistBilletesM25.Value;
  frmDesgloseDeposito.rxCuadreM20.Value := dmTransCnt.tblDepDistBilletesM20.Value;
  frmDesgloseDeposito.rxCuadreM10.Value := dmTransCnt.tblDepDistBilletesM10.Value;
  frmDesgloseDeposito.rxCuadreM5.Value := dmTransCnt.tblDepDistBilletesM5.Value;
  frmDesgloseDeposito.rxCuadreMONEDAS.Value:=dmTransCnt.tblDepDistBilletesMONTO_MONEDAS.Value;
end;

end.
