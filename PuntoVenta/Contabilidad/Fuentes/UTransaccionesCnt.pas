unit UTransaccionesCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ComCtrls, StdCtrls, Buttons, RXCtrls,
  ExtCtrls, DB, Mask, DBCtrls, WinSkinData, RxLookup, Menus,
  UGetDateTipoM, RxToolEdit;

type
  TfrmTransaccionesCnt = class(TForm)
    Panel1: TPanel;
    btnNuevo: TBitBtn;
    btnModificar: TBitBtn;
    btnCancelar: TBitBtn;
    btnRefrescar: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    tabRecord: TTabSheet;
    tabExaminar: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    dstblTransCntMaster: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Shape1: TShape;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    dstblTransCntDet: TDataSource;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    dbeditcta1: TDBEdit;
    dbeditcta2: TDBEdit;
    dbeditcta3: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    RxDBGrid2: TRxDBGrid;
    BitBtn2: TBitBtn;
    dbtextDebito: TDBText;
    DBText3: TDBText;
    Label14: TLabel;
    Label16: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    Bevel1: TBevel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label17: TLabel;
    dsTblDeptos: TDataSource;
    dstblCentroDeCosto: TDataSource;
    Label1: TLabel;
    dstblTipoDoc: TDataSource;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    BitBtn8: TBitBtn;
    LabelNombCta: TLabel;
    labelSignocta: TLabel;
    FechaTrn: TGetDateTipoMoneda;
    SkinData1: TSkinData;
    Label18: TLabel;
    DBText1: TDBText;
    Label19: TLabel;
    BitBtn13: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure dbeditcta3Exit(Sender: TObject);
    procedure PorNombre1Click(Sender: TObject);
    procedure PorCuenta1Click(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure dbeditcta3Change(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
    procedure DBEdit8Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure RxDBGrid2CellClick(Column: TColumn);
    procedure LabelNombCtaClick(Sender: TObject);
  private
    procedure B41Click(Sender: TObject);
    procedure Cheques1Click(Sender: TObject);
    procedure Depreciaciones1Click(Sender: TObject);
    procedure EA1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure Ingresos1Click(Sender: TObject);
    procedure Ingresos2Click(Sender: TObject);
    procedure NotaCredito1Click(Sender: TObject);
    procedure NotaDeDebito1Click(Sender: TObject);
    procedure Todas1Click(Sender: TObject);
    procedure AbrirDatos;
    procedure ActivaDiferencia;
    { Private declarations }
  public
    { Public declarations }
    Procedure FiltrarTrn(Tipo : Integer);
  end;

var
  frmTransaccionesCnt: TfrmTransaccionesCnt;

implementation

uses UDatModTransCnt, Uglobal, UDatmodDatos, UViewCtaCatalogo,
  UFormSelFecha, UDmRep, URepTransCnt, URepTrnDiariaResCta;

{$R *.dfm}

procedure TfrmTransaccionesCnt.BitBtn2Click(Sender: TObject);
begin
  if dmTransCnt.tblTransCntDet.State in [dsEdit,dsInsert] then Exit;
  if Not dmTransCnt.tblTransCntMaster.Transaction.InTransaction then
  dmTransCnt.tblTransCntMaster.Transaction.StartTransaction;
  if not dmTransCnt.tblTransCntDet.Transaction.InTransaction then
  dmTransCnt.tblTransCntDet.Transaction.StartTransaction;

  if dmTransCnt.tblTransCntMaster.State = dsBrowse then
  begin
    dmTransCnt.tblTransCntMaster.Insert;
    dmTransCnt.tblTransCntMasterCIA_KEY.Value := GlbCodOficina;
    dmTransCnt.tblTransCntMasterSTATUS.Value  :='A';
    dmTransCnt.tblTransCntMasterFECHA_IN.Value := Now;
    dmTransCnt.tblTransCntMasterIN_POR.Value:= strusername;;
    dmTransCnt.tblTransCntMasterFECHA.Value := ExtraerFecha(GlbFechaTrnDiaria);

    dmTransCnt.tblTransCntDet.Insert;
    dmTransCnt.tblTransCntDetIN_POR.Value := strusername;
    dmTransCnt.tblTransCntDetSTATUS.Value:='A';
    dmTransCnt.tblTransCntDetFECHA_IN.Value:=now;
    if Assigned(frmTransaccionesCnt) then    
    if frmTransaccionesCnt.Showing then
    DBEdit2.SetFocus;
    dmTransCnt.rxTotales.Close;
    dmTransCnt.rxTotales.EmptyTable;
    dmTransCnt.rxTotales.Open;
  end;
end;

procedure TfrmTransaccionesCnt.BitBtn4Click(Sender: TObject);
begin
  if dmTransCnt.tblTransCntMaster.State in [dsEdit, dsInsert] then
  begin
    if (dmTransCnt.tblTransCntMasterMONTO.IsNull  or (dmTransCnt.tblTransCntMasterMONTO.Value = 0)) then
    begin
      MessageDlg('Favor indicar monto total transacción.', mtInformation, [mbok], 0);
      if Assigned(frmTransaccionesCnt) then      
      if frmTransaccionesCnt.Showing then
      DBEdit3.SetFocus;
      Exit;
    end;
    if Not dmTransCnt.tblTransCntMaster.Transaction.InTransaction then
    dmTransCnt.tblTransCntMaster.Transaction.StartTransaction;
    dmTransCnt.tblTransCntMaster.Post;
    dmTransCnt.tblTransCntMaster.ApplyUpdates;
    try
      dmTransCnt.tblTransCntMaster.Transaction.CommitRetaining;
    except
      dmTransCnt.tblTransCntMaster.Transaction.RollbackRetaining;
    end;
  end;
  if dmTransCnt.tblTransCntDet.State in [dsEdit, dsInsert] then
  begin
    if not dmTransCnt.tblTransCntDet.Transaction.InTransaction then
    dmTransCnt.tblTransCntDet.Transaction.StartTransaction;
    dmTransCnt.tblTransCntDet.Post;
    dmTransCnt.tblTransCntDet.ApplyUpdates;
    try
      dmTransCnt.tblTransCntDet.Transaction.CommitRetaining;
    except
    dmTransCnt.tblTransCntDet.Transaction.RollbackRetaining;
    end;
  end;
  dmTransCnt.ProcSumaDetTrnCnt;
  ActivaDiferencia;
end;

procedure TfrmTransaccionesCnt.btnNuevoClick(Sender: TObject);
begin
  if dmTransCnt.tblTransCntDet.State = dsBrowse then
  begin
    if not dmTransCnt.tblTransCntDet.Transaction.InTransaction then
    dmTransCnt.tblTransCntDet.Transaction.StartTransaction;
    dmTransCnt.tblTransCntDet.Insert;
    dmTransCnt.tblTransCntDetIN_POR.Value  := strUserName;
    dmTransCnt.tblTransCntDetSTATUS.Value  := 'A';
    dmTransCnt.tblTransCntDetFECHA_IN.Value:= Now;
    if Assigned(frmTransaccionesCnt) then    
    if frmTransaccionesCnt.Showing then
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmTransaccionesCnt.FormCreate(Sender: TObject);
begin
  dmTransCnt.tblDeptos.Close;
  dmTransCnt.tblDeptos.Open;
  dmTransCnt.tblCentroDeCosto.Close;
  dmTransCnt.tblCentroDeCosto.Open;
  dmtranscnt.tblTipodoc.close;
  dmtranscnt.tblTipodoc.open;
  AbrirDatos;
  //dmTransCnt.tblTransCntMaster.close;
  //dmtranscnt.tblTransCntMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  //dmtranscnt.tblTransCntMaster.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  //dmTransCnt.tblTransCntMaster.open;
end;
procedure TfrmTransaccionesCnt.btnRefrescarClick(Sender: TObject);
begin
  AbrirDatos;
  exit;
  frmSelFecha:=TfrmSelFecha.Create(Nil);
  frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
  if frmSelFecha.ShowModal = mrOk then
  begin
    if dmTransCnt.tblTransCntMaster.State in [dsBrowse, dsinactive] then
    begin
      dmtranscnt.tblTransCntMaster.Close;
      dmtranscnt.tblTransCntMaster.Params[0].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmtranscnt.tblTransCntMaster.Params[1].Value:=ExtraerFecha(frmSelFecha.FechaIni.Date);
      dmtranscnt.tblTransCntMaster.Open;
    end;
  end;
end;

procedure TfrmTransaccionesCnt.BitBtn1Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntMaster.First;
  BitBtn1.Enabled:=False;
  dbeditcta3Exit(Self);  
end;

procedure TfrmTransaccionesCnt.BitBtn11Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntMaster.Next;
  if dmTransCnt.tblTransCntMaster.RecordCount > 0 then
  BitBtn1.Enabled:=True;
  dbeditcta3Exit(Self);  
end;

procedure TfrmTransaccionesCnt.BitBtn10Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntMaster.Prior;
  dbeditcta3Exit(Self);  
end;

procedure TfrmTransaccionesCnt.BitBtn9Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntMaster.Last;
  BitBtn9.Enabled:=false;
  dbeditcta3Exit(Self);  
end;

procedure TfrmTransaccionesCnt.BitBtn3Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntDet.First;
  dbeditcta3Exit(Self);
end;

procedure TfrmTransaccionesCnt.BitBtn5Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntDet.Next;
  dbeditcta3Exit(Self);  
end;

procedure TfrmTransaccionesCnt.BitBtn6Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntDet.Prior;
  dbeditcta3Exit(Self);  
end;

procedure TfrmTransaccionesCnt.BitBtn7Click(Sender: TObject);
begin
  dmTransCnt.tblTransCntDet.Last;
  dbeditcta3Exit(Self);  
end;

procedure TfrmTransaccionesCnt.dbeditcta3Exit(Sender: TObject);
begin
  if Not CtaExiste(dmTransCnt.tblTransCntDetCUENTA1.Text,dmTransCnt.tblTransCntDetCUENTA2.Text,
  dmTransCnt.tblTransCntDetCUENTA3.Text, false) then
  begin
    LabelNombCta.Caption:='????????';
    if Assigned(frmTransaccionesCnt) then
    if frmTransaccionesCnt.Showing then
    begin
      try
      dbEditCta1.setfocus;
      dbEditCta1.selectall;
      except
      end;
    end;
  end else
  LabelNombCta.Caption:=glbNombreCta;
  if FctaTipo(dmTransCnt.tblTransCntDetCUENTA1.Value,dmTransCnt.tblTransCntDetCUENTA2.Text,dmTransCnt.tblTransCntDetCUENTA3.Text,false) = 1 then
  labelSignocta.caption:='Cuenta de Origen Debito'
  else if FctaTipo(dmTransCnt.tblTransCntDetCUENTA1.Text,dmTransCnt.tblTransCntDetCUENTA2.Text,dmTransCnt.tblTransCntDetCUENTA3.Text,false) = 2 then
  labelSignocta.caption:='Cuenta de Origen Credito'
  else
  Begin
    labelSignocta.caption:='Error en Signo cuenta';
    Beep;
  end;
end;

procedure TfrmTransaccionesCnt.Ingresos1Click(Sender: TObject);
begin
  FiltrarTrn(1);
end;

procedure TfrmTransaccionesCnt.Ingresos2Click(Sender: TObject);
begin
  FiltrarTrn(2);
end;

procedure TfrmTransaccionesCnt.NotaDeDebito1Click(Sender: TObject);
begin
  FiltrarTrn(3);
end;

procedure TfrmTransaccionesCnt.Cheques1Click(Sender: TObject);
begin
  FiltrarTrn(4);
end;

procedure TfrmTransaccionesCnt.NotaCredito1Click(Sender: TObject);
begin
  FiltrarTrn(5);
end;

procedure TfrmTransaccionesCnt.EA1Click(Sender: TObject);
begin
  FiltrarTrn(6);
end;

procedure TfrmTransaccionesCnt.Entrada1Click(Sender: TObject);
begin
  FiltrarTrn(7);
end;

procedure TfrmTransaccionesCnt.Depreciaciones1Click(Sender: TObject);
begin
  FiltrarTrn(8);
end;

procedure TfrmTransaccionesCnt.B41Click(Sender: TObject);
begin
  FiltrarTrn(9);
end;

procedure TfrmTransaccionesCnt.Todas1Click(Sender: TObject);
begin
  FiltrarTrn(0);
end;
procedure TfrmTransaccionesCnt.FiltrarTrn(Tipo: Integer);
begin

end;

procedure TfrmTransaccionesCnt.PorNombre1Click(Sender: TObject);
begin
  if not dmdatos.qryViewCuentas.Locate('nombre_cta',InputBox('Buscar por Cuenta','Entre #cuenta',''),[]) then
  glbNoExiste;
end;

procedure TfrmTransaccionesCnt.PorCuenta1Click(Sender: TObject);
begin
  if Not dmdatos.qryViewCuentas.Locate('cuenta', InputBox('Buscar por Cuenta','Entre #cuenta',''), []) then
  glbNoExiste;
end;

procedure TfrmTransaccionesCnt.btnModificarClick(Sender: TObject);
begin
  if dmTransCnt.tblTransCntMaster.State in [dsBrowse] then
  begin
    dmTransCnt.tblTransCntMaster.Edit;
  end;
end;

procedure TfrmTransaccionesCnt.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if dmTransCnt.tblTransCntDet.state In [dsEdit, dsInsert] then
      begin
        if not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          dmTransCnt.tblTransCntDetCUENTA1.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value;
          dmTransCnt.tblTransCntDetCUENTA2.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value;
          dmTransCnt.tblTransCntDetCUENTA3.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmTransaccionesCnt.AbrirDatos;
begin
  dmTransCnt.tblTransCntMaster.close;
  if PideFecha then
  begin
    if FechaTrn.Execute then
    begin
      GlbFechaInicial:=ExtraerFecha(FechaTrn.Fecha);
      dmTransCnt.tblTransCntMaster.Params[0].Value := ExtraerFecha(Fechatrn.Fecha);
      dmTransCnt.tblTransCntMaster.Params[1].Value := ExtraerFecha(Fechatrn.FechaFinal);
    end;
  end else
  begin
    dmTransCnt.tblTransCntMaster.Params[0].Value := ExtraerFecha(glbfechaInicial);
    dmTransCnt.tblTransCntMaster.Params[1].Value := ExtraerFecha(glbfechaInicial);
  end;
  dmTransCnt.tblTransCntMaster.Open;
end;

procedure TfrmTransaccionesCnt.dbeditcta3Change(Sender: TObject);
begin
  dbeditcta3Exit(Self);
end;

procedure TfrmTransaccionesCnt.RxDBGrid2Enter(Sender: TObject);
begin
  dbeditcta3Exit(Self);
end;

procedure TfrmTransaccionesCnt.ActivaDiferencia;
begin
  if (GlbTrnNoCuadra) then
  begin
    label18.Visible:=True;
    dbtext1.Visible:=True;
  end else
  begin
    label18.Visible:=False;
    dbtext1.Visible:=False;
    {if dmTransCnt.tblTransCntMaster.State = dsBrowse then
    begin
      if dmTransCnt.tblTransCntMasterMONTO.IsNull then
      begin
        dmTransCnt.tblTransCntMaster.Edit;
        dmTransCnt.tblTransCntMasterMONTO.Value:=dmTransCnt.rxTotalTrnasDetDebito.Value;
        if Not dmTransCnt.tblTransCntMaster.Transaction.InTransaction then
        dmTransCnt.tblTransCntMaster.Transaction.StartTransaction;
        dmTransCnt.tblTransCntMaster.Post;
        dmTransCnt.tblTransCntMaster.ApplyUpdates;
        try
         dmTransCnt.tblTransCntMaster.Transaction.CommitRetaining;
        except
        dmTransCnt.tblTransCntMaster.Transaction.RollbackRetaining;
        end;
      end;
    end;}
  end;
end;

procedure TfrmTransaccionesCnt.DBEdit7Change(Sender: TObject);
begin
  ActivaDiferencia;
end;

procedure TfrmTransaccionesCnt.DBEdit8Change(Sender: TObject);
begin
  ActivaDiferencia;
end;

procedure TfrmTransaccionesCnt.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if GlbTrnNoCuadra then
  begin
    MessageDlg('Transacción no cuadra, verifique.', mtError, [mbOk],0);
    CanClose:= False;
  end else
  CanClose:= True;
end;

procedure TfrmTransaccionesCnt.btnCancelarClick(Sender: TObject);
begin
  //dmTransCnt.tblTransCntDet.First;
  //while not dmTransCnt.tblTransCntDet.Eof do
  //begin
    if (dmTransCnt.tblTransCntDetstatus.Value = 'A') then
    begin
      dmTransCnt.tblTransCntDet.Edit;
      dmTransCnt.tblTransCntDetStatus.Value:='C';
      if dmTransCnt.tblTransCntDet.State in [dsEdit, dsInsert] then
      begin
        if not dmTransCnt.tblTransCntDet.Transaction.InTransaction then
        dmTransCnt.tblTransCntDet.Transaction.StartTransaction;
        dmTransCnt.tblTransCntDet.Post;
        dmTransCnt.tblTransCntDet.ApplyUpdates;
        try
          dmTransCnt.tblTransCntDet.Transaction.CommitRetaining;
        except
        dmTransCnt.tblTransCntDet.Transaction.RollbackRetaining;
        end;
      end;
   end;
   // dmTransCnt.tblTransCntDet.next;
  //end;
end;

procedure TfrmTransaccionesCnt.BitBtn13Click(Sender: TObject);
var
  dia,dia1,mes1,anio1:word;
begin
  if fechatrn.execute then
  begin
    glbFechaInicial:=fechatrn.fecha;
    glbFechaFinal:=fechatrn.fechaFinal;
    DecodeDAte(fechatrn.fecha,anio1,mes1,dia1);
    if UpperCase(InputBox('Reporte de Transacciones','D-Detallado R-Resumen x Cta','D')) = 'D' then
    Begin
      dtmodrep.qryRepTrnDiariaCnt.Close;
      dtmodrep.qryRepTrnDiariaCnt.Params[0].Value := ExtraerFecha(fechatrn.Fecha);
      dtmodrep.qryRepTrnDiariaCnt.Params[1].Value := ExtraerFecha(fechatrn.FechaFinal);
      dtmodrep.qryRepTrnDiariaCnt.Open;
      //qckRepTrnCnt:=TqckRepTrnCnt.Create(nil);
      if not Assigned(qckRepTrnCnt) Then
      qckRepTrnCnt:=TqckRepTrnCnt.Create(Nil);
      try
        qckRepTrnCnt.Prepare;
        glbTPag   :=qckRepTrnCnt.PageNumber;
      finally
      qckRepTrnCnt.QRPrinter.Free;
      end;
      qckRepTrnCnt:= Nil;
      if not Assigned(qckRepTrnCnt) Then
      qckRepTrnCnt:=TqckRepTrnCnt.Create(Nil);
      try
        if messagedlg('Imprimir?',mtInformation,[mbYes,mbNo],0) = mrYes then
        begin
          qckRepTrnCnt.PrinterSetup;
          qckRepTrnCnt.print;
        end else
        qckRepTrnCnt.Preview;
        finally
        qckRepTrnCnt.Free;
        qckRepTrnCnt:=Nil
      end;
        dtmodrep.qryRepTrnDiariaCnt.close
      end else
      begin
        // qryBlcMesCta se usa para balance inicial
        dmdatos.qryBlcMesCta.Close;
        if mes1 = 1 then
        begin
          dmdatos.qryBlcMesCta.Filtered := False;
          //dmdatos.qryBlcMesCta.Filter   := 'STATUS_CIEA = '+chr(39)+'D'+chr(39);
          dmdatos.STATUS_CIEA_FILTER_V := 'D';
          dmdatos.qryBlcMesCta.Filtered := True;
          mes1:=13;
          Dec(Anio1);
        end;
        dmdatos.qryBlcMesCta.Params[0].value := EncodeDate(anio1,mes1-1,DiasEnelMes(anio1,mes1-1));
        dmdatos.qryBlcMesCta.Params[1].value := EncodeDate(anio1,mes1-1,DiasEnelMes(anio1,mes1-1));
        dmdatos.qryBlcMesCta.Open;
        
        dtmodrep.qryRepTrnDiariaCntR.Close;
        dtmodrep.qryRepTrnDiariaCntR.Params[0].Value := ExtraerFecha(fechatrn.Fecha);
        dtmodrep.qryRepTrnDiariaCntR.Params[1].Value := ExtraerFecha(fechatrn.FechaFinal);
        dtmodrep.qryRepTrnDiariaCntR.Params[2].Value := GlbCodigoCia;        
        dtmodrep.qryRepTrnDiariaCntR.Open;
        qckRepTrnDiariaResCta:=TqckRepTrnDiariaResCta.Create(Nil);
        try
          if messagedlg('Imprimir?',mtinformation,[mbyes,mbno],0) = mryes then
        begin
          qckRepTrnDiariaResCta.PrinterSetup;
          qckRepTrnDiariaResCta.print;
        end else
        qckRepTrnDiariaResCta.Preview;
        finally
        qckRepTrnDiariaResCta.Free;
        qckRepTrnDiariaResCta:=Nil
        end;
        dtmodrep.qryRepTrnDiariaCntR.close;
      end;
  end;
end;

procedure TfrmTransaccionesCnt.RxDBGrid2CellClick(Column: TColumn);
begin
  dbeditcta3Exit(Self);
end;

procedure TfrmTransaccionesCnt.LabelNombCtaClick(Sender: TObject);
begin
  dbeditcta3Exit(Self);
end;

end.
