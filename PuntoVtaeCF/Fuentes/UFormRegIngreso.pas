unit UFormRegIngreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, DBActns, ActnList, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons,
  RxLookup, rxToolEdit, Mask, DBCtrls, RXCtrls, ExtCtrls, ComCtrls,
  WinSkinData, IBCustomDataSet, IBQuery, GetAnyDate, IBStoredProc;

type
  TfrmRegIngresos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Label15: TLabel;
    Shape2: TShape;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit13: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn7: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    TabSheet2: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label16: TLabel;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    DBEdit11: TDBEdit;
    RxDBLookupCombo5: TRxDBLookupCombo;
    DataSetFirst2: TDataSetFirst;
    DataSetPrior2: TDataSetPrior;
    DataSetNext2: TDataSetNext;
    DataSetLast2: TDataSetLast;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    BitBtn16: TBitBtn;
    SkinData1: TSkinData;
    BitBtn17: TBitBtn;
    qryBlcCxcRecibo: TIBQuery;
    qryBlcCxcReciboBALANCE_ACTUAL: TFloatField;
    GetAnyDate1: TGetAnyDate;
    BitBtn18: TBitBtn;
    stpactfctingresos: TIBStoredProc;
    stpactBalancectecxc: TIBStoredProc;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
  private
    { Private declarations }
    function Cuadra:Boolean;
    procedure ImprimirRecibo(tipo :smallint);
    procedure RegistraDatosCxc;    
  public
    { Public declarations }
  end;

var
  frmRegIngresos: TfrmRegIngresos;
      strNumero : String;

implementation

uses UFormSelFecha, UGlobal, UProcesaPagoFct,UDatModIngresos,
  UDatModInventario, UDatModUsuarios, URepReciboAbonoCXC, UDatModCxc;

{$R *.dfm}

procedure TfrmRegIngresos.BitBtn1Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State = dsBrowse then
  begin
    {if Not Cuadra then
    MessageDlg('Transaccion actual no cuadra, verifique',mterror,[mbok],0) else
    begin}
      dmIngresos.tblIngresoMaster.Insert;
      dmIngresos.tblIngresoMasterCIA_KEY.Value:= GLBCODIGO_CIA;
      dmIngresos.tblIngresoMasterCOD_EMPLEADO.Value:= VarUsuarioGlb;
      dmIngresos.tblIngresoMasterIN_POR.Value:=strUserName;
      dmIngresos.tblIngresoMasterTIPO.Value  :=2;//Recibo
      dmIngresos.tblIngresoMasterFECHA.Value:=ExtraerFecha(GlbFechaTrnDiaria);
      dmIngresos.tblIngresoMasterSTATUS.Value  := 'A';
      dmIngresos.tblIngresoMasterTIPO_ING.Value:=2;
      
      if (dmIngresos.tblIngresoMasterTIPO_ING.Value = 2) then
      dmIngresos.tblIngresoMasterCONCEPTO.Value:='INGRESOS CXC'
      else
      dmIngresos.tblIngresoMasterCONCEPTO.Value:='INGRESOS';
      
      dmIngresos.tblIngresoMasterMoneda.Value:= '1';//dmIngreso.ibtCompaniaMONEDA.Value;
      BitBtn7Click(Self);
      //DBDateEdit1.SetFocus;
      RxDBLookupCombo3.SetFocus;
    //end;
  end;
end;

function TfrmRegIngresos.Cuadra: Boolean;
begin

end;

procedure TfrmRegIngresos.BitBtn7Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoDet.State = dsBrowse then
  begin
    dmIngresos.tblIngresoDet.Insert;
    dmIngresos.tblIngresoDetIN_POR.Value:=strusername;
    dmIngresos.tblIngresoDetSTATUS.Value := 'A';
    if (dmIngresos.tblIngresoMasterTIPO_ING.Value = 2) then
    dmIngresos.tblIngresoDetDETALLE.Value:='INGRESOS CXC'
    else
    dmIngresos.tblIngresoDetDETALLE.Value:='INGRESOS';    
    DBEdit6.SetFocus;
  end;
end;

procedure TfrmRegIngresos.BitBtn4Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State in [dsEdit, dsInsert] then
  begin
    if dmIngresos.tblIngresoMaster.State in [dsInsert] then
    dmIngresos.tblIngresoMasterNUMERO.Value:= FsqlMaxNumero('ingresos','numero');
    strNumero:= dmIngresos.tblIngresoMasterNUMERO.AsString;
    dmIngresos.tblIngresoMaster.Post;
    dmIngresos.tblIngresoMaster.ApplyUpdates;
    if not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
    dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;
  end;

  if dmIngresos.tblIngresoDet.State in [dsEdit, dsInsert] then
  begin
    if dmIngresos.tblIngresoDet.State in [dsInsert] then
    begin
      dmIngresos.tblIngresoDetNUMERO_ing.Value:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
      dmIngresos.tblIngresoDetSERIE_MASTER.Value:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
    end;

    dmIngresos.tblIngresoDet.Post;
    dmIngresos.tblIngresoDet.ApplyUpdates;
    if Not dmIngresos.tblIngresoDet.Transaction.InTransaction then
    dmIngresos.tblIngresoDet.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoDet.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoDet.Transaction.RollbackRetaining;
    end;
//t    if not dmIngresos.tblIngresoDetNUMERO_Ing.IsNull then
//t    begin
//t      dmIngreso.IBStpSumarIngDet.Params[0].Value:=dmIngresos.tblIngresoDetNUMERO.Value;
//t      dmIngreso.IBStpSumarIngDet.ExecProc;
//t    end;
//t    dmIngresos.tblIngresoMaster.Edit;
//t    dmIngresos.tblIngresoMasterValor_Ing.Value:= dmIngreso.IBStpSumarIngDet.Params[1].Value;
//t    dmIngresos.tblIngresoMaster.Post;
//t    dmIngresos.tblIngresoMaster.ApplyUpdates;
    if not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
    dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRegIngresos.FormCreate(Sender: TObject);
var
  x : byte;
begin
  dmingresos.IBQryCliente.close;
  dmingresos.IBQryCliente.open;
  dmIngresos.tblIngresoMaster.Close;
  //frmSelFecha:=TfrmSelFecha.Create(nil);
  GetAnyDate1.UsaFechaCierre:=True;
  GetAnyDate1.FechaCierre:=GlbFechaTrnDiaria;
  try

    //if frmSelFecha.ShowModal = mrOk then
    if GetAnyDate1.Execute then
    begin
      dmIngresos.tblIngresoMaster.Close;
      dmIngresos.tblIngresoMaster.Params[0].Value:=ExtraerFecha(GetAnyDate1.Fecha);
      dmIngresos.tblIngresoMaster.Params[1].Value:=ExtraerFecha(GetAnyDate1.fechafinal);
      dmIngresos.tblIngresoMaster.Open;
      x:=0;
    end else x:=1;
  finally
  //frmSelFecha.Free;
  //frmSelFecha:=Nil;
  end;
  if x = 1 then exit;
  dmingresos.IBTableTipoIng.Close;
  dmingresos.IBTableTipoIng.Open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  dmIngresos.IBTableServicio.Close;
  dmIngresos.IBTableServicio.Open;
end;

procedure TfrmRegIngresos.BitBtn3Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State in [dsEdit, dsInsert] then
  dmIngresos.tblIngresoMaster.Cancel;
  if dmIngresos.tblIngresoDet.State in [dsEdit, dsInsert] then
  dmIngresos.tblIngresoDet.Cancel;
end;

procedure TfrmRegIngresos.BitBtn5Click(Sender: TObject);
begin
  if dmIngresos.tblIngresoMaster.State in [dsBrowse, dsInactive] then
  begin
    dmIngresos.tblIngresoMaster.close;
    dmIngresos.tblIngresoMaster.Open;
  end;
  if dmIngresos.tblIngresoDet.State in [dsBrowse, dsInactive] then
  begin
    dmIngresos.tblIngresoDet.close;
    dmIngresos.tblIngresoDet.open;
  end;
end;

procedure TfrmRegIngresos.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Si-Modificar Master  No-Modificar Detalle',mtInformation,[mbyes,mbno],0) = mryes then
    if dmIngresos.tblIngresoMaster.State = dsBrowse then dmIngresos.tblIngresoMaster.Edit
  else if dmIngresos.tblIngresoDet.State = dsBrowse then dmIngresos.tblIngresoDet.Edit;
end;

procedure TfrmRegIngresos.BitBtn16Click(Sender: TObject);
begin
{  frmProcesaPagoFactura:=TfrmProcesaPagoFactura.Create(Nil);
  try
    frmProcesaPagoFactura.ShowModal;
  finally
  frmProcesaPagoFactura.Free;
  frmProcesaPagoFactura:=Nil;
  end;}
end;

procedure TfrmRegIngresos.DBEdit6Enter(Sender: TObject);
begin
  if dmIngresos.tblIngresoDet.State = dsBrowse then
  begin
    if dmIngresos.tblIngresoMaster.State = dsInsert then
    dmIngresos.tblIngresoDet.Insert;
    dmIngresos.tblIngresoDetSTATUS.Value := 'A';    
    if (dmIngresos.tblIngresoMasterTIPO_ING.Value = 2) then
    dmIngresos.tblIngresoDetDETALLE.Value:='INGRESOS CXC'
    else
    dmIngresos.tblIngresoDetDETALLE.Value:='INGRESOS';
  end;
end;

procedure TfrmRegIngresos.BitBtn17Click(Sender: TObject);
begin
  ImprimirRecibo(0);
end;

procedure TfrmRegIngresos.DBEdit9Enter(Sender: TObject);
begin
  if dmIngresos.tblIngresoDet.State = dsInsert then
  dmIngresos.tblIngresoDetVALOR_DET.Value := dmIngresos.tblIngresoMasterVALOR_ING.Value;
  dbedit9.SelectAll;
end;

procedure TfrmRegIngresos.ImprimirRecibo(tipo: smallint);
begin
  if (strNumero = '') then
  tipo:=1;

  if (dmIngresos.tblIngresoMasterSTATUS.Value = 'A') then
  RegistraDatosCxc;

  if tipo = 1 then
  begin
    if (strNumero = '') then
    strNumero:= dmIngresos.tblIngresoMasterNUMERO.AsString;
    strNumero := InputBox('Imprimir recibo de ingreso','Entre Número de Recibo',strNumero);
    dmIngresos.qryRepIngMaster.Close;
    dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
    dmIngresos.qryRepIngMaster.Open;

    qryBlcCxcRecibo.Close;
    qryBlcCxcRecibo.Params[0].Value := StrToInt(strNumero);
    qryBlcCxcRecibo.Params[1].Value := dmIngresos.qryRepIngMasterCODIGO_CTE.Value;
    qryBlcCxcRecibo.Open;
  end else
  begin

    dmIngresos.qryRepIngMaster.Close;
    dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
    dmIngresos.qryRepIngMaster.Open;
    qryBlcCxcRecibo.Close;
    qryBlcCxcRecibo.Params[0].Value := StrToInt(strNumero);
    qryBlcCxcRecibo.Params[1].Value := dmIngresos.qryRepIngMasterCODIGO_CTE.Value;
    qryBlcCxcRecibo.Open;
  end;
  dmIngresos.tblIngresoMaster.Close;
  dmIngresos.tblIngresoMaster.params[0].Value:= ExtraerFecha(dmIngresos.qryRepIngMasterFECHA.Value);
  dmIngresos.tblIngresoMaster.params[1].Value:= ExtraerFecha(dmIngresos.qryRepIngMasterFECHA.Value);
  dmIngresos.tblIngresoMaster.Open;
  if not dmIngresos.tblIngresoMaster.Locate('NUMERO',dmIngresos.qryRepIngMaster.Params[0].Value,[]) then
  begin
    MessageDlg('Recibo no encontrado, verifique.', mtWarning, [mbOK], 0);
    exit;
  end;

  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);
  //qckReciboIngreso:=TqckReciboIngreso.Create(Nil);
  qckReciboAbonoCXC:=TqckReciboAbonoCXC.Create(nil);
  try
    qckReciboAbonoCXC.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    qckReciboAbonoCXC.lblBalanceAct.Caption:= InsertarComa(qryBlcCxcReciboBALANCE_ACTUAL.AsString);
    //qckReciboAbonoCXC.qrLabelReimprimir.Caption:=;//aqui aqui aqui
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'P' then
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='Re-Impresion' else
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='';
    if dmIngresos.qryRepIngDetalle.RecordCount > 1 then
    begin
      qckReciboAbonoCXC.Page.Length := qckReciboAbonoCXC.Page.Length +
      dmIngresos.qryRepIngDetalle.RecordCount * 2;
    end;
    if  MessageDlg('Imprimir?',mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      qckReciboAbonoCXC.PrinterSetup;
      qckReciboAbonoCXC.Print;
    end else
    qckReciboAbonoCXC.Preview;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
    begin
      if dmIngresos.tblIngresoMasterTIPO_TARGETA.Value = 2 then //credito
      begin

      end;
      qckReciboAbonoCXC.qrLabelReimprimir.Caption:='';
      dmIngresos.tblIngresoMaster.Edit;
      dmIngresos.tblIngresoMasterSTATUS.Value := 'P';
      dmIngresos.tblIngresoMaster.Post;
      dmIngresos.tblIngresoMaster.ApplyUpdates;
      if Not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
      dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
      try
        dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
      except
      dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
      end;
    end;
  finally
  qckReciboAbonoCXC.Free;
  qckReciboAbonoCXC:=Nil;
  end;
end;

procedure TfrmRegIngresos.BitBtn18Click(Sender: TObject);
begin
  ImprimirRecibo(1);
end;

procedure TfrmRegIngresos.RegistraDatosCxc;
begin
  //if (dmIngresos.tblIngresoMasterDOCUMENTO.IsNull then
  //begin
  //  MessageDlg('Favor indicar numero factura.', mtError,[mbOk], 0);
  //end;
  dmcxc.qrytrancxc.Params[2].Value := glbCia_Key;
  if dmcxc.qrytrancxc.State = dsInactive then
  dmcxc.qrytrancxc.Open;
  dmcxc.qrytrancxc.Insert;
  dmcxc.qryTrancxcnumero_recibo.Value:=dmIngresos.tblIngresoMasterNUMERO.AsInteger;
  dmcxc.qrytrancxcserie.Value := FsqlMaxNumero('TRANS_CXC','SERIE');

  if dmcxc.qrytrancxcserie.Value = 0 then
  dmcxc.qrytrancxcserie.Value          := 1;

  dmcxc.qrytrancxctipo_doc.Value       := 2; //Recibo
  dmcxc.qrytrancxcmoneda.Value         := '1';
  dmcxc.qrytrancxcfecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qrytrancxcnumero_doc.Value     := dmIngresos.tblIngresoMasterDOCUMENTO.AsInteger;
  dmcxc.qrytrancxctipo_serv.Value      := 2;
  dmcxc.qrytrancxccodigo_cliente.Value := dmIngresos.tblIngresoMasterCODIGO_CTE.Value;
  dmcxc.qrytrancxccodigo_serv.Value    := 0;
  dmcxc.qrytrancxcconcepto.Value       := dmIngresos.tblIngresoMasterCONCEPTO.Value;
  dmcxc.qrytrancxcValor_documento.Value:= dmIngresos.tblIngresoMasterVALOR_ING.Value;
  dmcxc.qrytrancxcTipo_tranf.Value     := 2;
  dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= VarUsuarioGlb;
  dmcxc.qryTrancxcIN_POR.Value         := strusername;
  dmcxc.qryTrancxcFECHA_IN.Value       := Now;
  dmcxc.qrytrancxcStatus.Value         := 'A';
  dmcxc.qrytrancxc.Post;
  dmcxc.qrytrancxc.ApplyUpdates;
  if not dmcxc.qrytrancxc.Transaction.InTransaction then
  dmcxc.qrytrancxc.Transaction.StartTransaction;
  try
    dmcxc.qrytrancxc.Transaction.CommitRetaining;
  except
  dmcxc.qrytrancxc.Transaction.RollbackRetaining;
  end;

  stpactfctingresos.Params[0].value:= FsqlMaxNumero('FctIngresos','Serie');
  stpactfctingresos.Params[1].Value:= dmIngresos.tblIngresoMasterNUMERO.Value;
  stpactfctingresos.Params[2].Value:= dmIngresos.tblIngresoMasterDOCUMENTO.AsInteger;
  stpactfctingresos.Params[3].Value:= dmIngresos.tblIngresoMasterVALOR_ING.Value;
  stpactfctingresos.Params[4].Value:= '1';//FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value;
  stpactfctingresos.Params[5].Value:= 'A';
  stpactfctingresos.Params[6].Value:= 0;//Renta Vehiculo;dmIngresos.tblIngresosDetCOD_SERVICIO.Value;
  stpactfctingresos.Params[7].Value:= 2;// := qryFactPendienteTIPO.Value;
  stpactfctingresos.Params[8].Value:= 2;//Recibos;

  stpactfctingresos.ExecProc;
  if Not stpactfctingresos.Transaction.InTransaction then
  stpactfctingresos.Transaction.StartTransaction;
  try
    stpactfctingresos.Transaction.CommitRetaining;
  except
  stpactfctingresos.Transaction.RollbackRetaining;
  end;

  //Actualiza Balance cliente
  stpactBalancectecxc.Params[0].Value:= dmIngresos.tblIngresoMasterCODIGO_CTE.Value;
  stpactBalancectecxc.Params[1].Value:= 0; //codigo_servicio;
  stpactBalancectecxc.Params[2].Value:= dmIngresos.tblIngresoMasterMONEDA.Value;
  stpactBalancectecxc.Params[3].Value:= 2;
  stpactBalancectecxc.Params[4].Value:= dmIngresos.tblIngresoMasterVALOR_ING.Value;
  stpactBalancectecxc.Params[5].Value:= dmIngresos.tblIngresoMasterFECHA.Value;
  stpactBalancectecxc.Params[6].Value:= dmcxc.qrytrancxcserie.Value;

  stpactBalancectecxc.ExecProc;
  if not stpactBalancectecxc.Transaction.InTransaction then
  stpactBalancectecxc.Transaction.StartTransaction;
  try
    stpactBalancectecxc.Transaction.CommitRetaining;
  except
  stpactBalancectecxc.Transaction.RollbackRetaining;
  end;

  if Not stpactfctingresos.Transaction.InTransaction then
  stpactfctingresos.Transaction.StartTransaction;
  try
    stpactfctingresos.Transaction.CommitRetaining;
  except
  stpactfctingresos.Transaction.RollbackRetaining;
  end;
end;

end.
