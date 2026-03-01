unit UConsultaPreventa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, RXCtrls, Grids, DBGrids, RXDBCtrl,
  StdCtrls, Buttons, WinSkinData, IBSQL;

type
  TfrmConsultaPreVenta = class(TForm)
    qryPreventaMaster: TIBQuery;
    qryPreventaDet: TIBQuery;
    qryPreventaDetSERIE: TIntegerField;
    qryPreventaDetNUMERO: TIntegerField;
    qryPreventaDetDESCRIPCION: TIBStringField;
    qryPreventaDetCANTIDAD: TFloatField;
    qryPreventaDetPRECIO: TFloatField;
    qryPreventaDetPORC_DESC_DET: TFloatField;
    qryPreventaDetITBI_DET: TFloatField;
    qryPreventaDetVALOR_SERVICIO_DET: TFloatField;
    qryPreventaDetVALOR_TOTAL_DET: TFloatField;
    qryPreventaDetSTATUS_DET: TIBStringField;
    qryPreventaDetSERIE_PROD: TIBStringField;
    qryPreventaDetTIPO_UNIDAD: TIntegerField;
    qryPreventaMasterNUMERO: TIntegerField;
    qryPreventaMasterFECHA: TDateTimeField;
    qryPreventaMasterCODIGO_CTE: TIntegerField;
    qryPreventaMasterCODIGO_VENDEDOR: TIntegerField;
    qryPreventaMasterOBSERVACION: TIBStringField;
    qryPreventaMasterMONEDA: TIBStringField;
    qryPreventaMasterVALOR_TOTAL_DET: TFloatField;
    qryPreventaMasterSTATUS: TIBStringField;
    qryPreventaMasterMONTO_BRUTO: TFloatField;
    qryPreventaMasterPORC_DESCUENTO: TIntegerField;
    qryPreventaMasterMONTO_DESCUENTO: TFloatField;
    qryPreventaMasterMONTO_INICIAL: TFloatField;
    qryPreventaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField;
    dsqryPreventaDet: TDataSource;
    dsqryPreventaMaster: TDataSource;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    RxLabel1: TRxLabel;
    qryPreventaDetCODIGO_PROD: TIBStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SkinData1: TSkinData;
    qryPreventaMasterNombreCliente: TStringField;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryPreventaMasterNombreVendedor: TStringField;
    qryEmpleado: TIBQuery;
    qryEmpleadoCODIGO: TIntegerField;
    qryEmpleadoNOMBRE: TIBStringField;
    qryEmpleadoAPELLIDO: TIBStringField;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    tblPreventaMaster: TIBDataSet;
    tblPreventaMasterNUMERO: TIntegerField;
    tblPreventaMasterFECHA: TDateTimeField;
    tblPreventaMasterCIA_KEY: TIntegerField;
    tblPreventaMasterCODIGO_CTE: TIntegerField;
    tblPreventaMasterCODIGO_VENDEDOR: TIntegerField;
    tblPreventaMasterFORMA_PAGO: TSmallintField;
    tblPreventaMasterOBSERVACION: TIBStringField;
    tblPreventaMasterMONEDA: TIBStringField;
    tblPreventaMasterVALOR_TOTAL_DET: TFloatField;
    tblPreventaMasterSTATUS: TIBStringField;
    tblPreventaMasterFECHA_IN: TDateTimeField;
    tblPreventaMasterIN_POR: TIBStringField;
    tblPreventaMasterFECHA_MOD: TDateTimeField;
    tblPreventaMasterMOD_POR: TIBStringField;
    tblPreventaMasterNUMERO_FACTURA: TIntegerField;
    tblPreventaMasterNUMERO_DOC_PAGO: TIBStringField;
    tblPreventaMasterSERIE_NCF_ASIGNADO: TIntegerField;
    tblPreventaMasterMONTO_BRUTO: TFloatField;
    tblPreventaMasterPORC_DESCUENTO: TIntegerField;
    tblPreventaMasterMONTO_DESCUENTO: TFloatField;
    tblPreventaMasterMONTO_INICIAL: TFloatField;
    tblPreventaMasterNOMBRE_CLIENTE_GENERAL: TIBStringField;
    tblPreventaDEt: TIBDataSet;
    tblPreventaDEtSERIE: TIntegerField;
    tblPreventaDEtNUMERO: TIntegerField;
    tblPreventaDEtCODIGO_PROD: TIBStringField;
    tblPreventaDEtCODIGO_BARRA: TIBStringField;
    tblPreventaDEtDESCRIPCION: TIBStringField;
    tblPreventaDEtCANTIDAD: TFloatField;
    tblPreventaDEtPRECIO: TFloatField;
    tblPreventaDEtPORC_DESC_DET: TFloatField;
    tblPreventaDEtITBI_DET: TFloatField;
    tblPreventaDEtVALOR_SERVICIO_DET: TFloatField;
    tblPreventaDEtVALOR_TOTAL_DET: TFloatField;
    tblPreventaDEtNUM_FACTURA: TFloatField;
    tblPreventaDEtSTATUS_DET: TIBStringField;
    tblPreventaDEtFECHA_IN: TDateTimeField;
    tblPreventaDEtIN_POR: TIBStringField;
    tblPreventaDEtFECHA_MOD: TDateTimeField;
    tblPreventaDEtMOD_POR: TIBStringField;
    tblPreventaDEtCANT_REGRESO: TFloatField;
    tblPreventaDEtCANT_PROMO: TFloatField;
    tblPreventaDEtMONTO_DIETA: TFloatField;
    tblPreventaDEtMONTO_AJUSTE: TFloatField;
    tblPreventaDEtSERIE_PROD: TIBStringField;
    tblPreventaDEtSTATUS_CNT: TIBStringField;
    tblPreventaDEtTIPO_UNIDAD: TIntegerField;
    btnEliminarRecord: TBitBtn;
    ibsqlDeletePreventaDet: TIBSQL;
    ibsqlDeletePreventaMaster: TIBSQL;
    qryCheckExiste: TIBQuery;
    qryCheckExisteNUMERO: TIntegerField;
    qryCheckExisteTICKET_ID: TIntegerField;
    qryproc_InsePrevVtaExtraDet: TIBQuery;
    BitBtn5: TBitBtn;
    tblPreventaDEtLOTE_NUM: TIBStringField;
    qryPreventaDetLOTE_NUM: TIBStringField;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryPreventaMasterAfterScroll(DataSet: TDataSet);
    procedure qryPreventaMasterCalcFields(DataSet: TDataSet);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure tblPreventaMasterAfterScroll(DataSet: TDataSet);
    procedure btnEliminarRecordClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ProcGetFastFood;
    Procedure ActInventario(codProd:Integer);
    function  CheckTicketExiste(numTicket:integer):boolean;
  public
     NumTicketFFood : integer;
     esCargaDatosFFood:Boolean;
  end;

var
  frmConsultaPreVenta: TfrmConsultaPreVenta;

implementation

uses UDatModConectar, UDatModFastFood, uglobal, UDatModInventario;

{$R *.dfm}

procedure TfrmConsultaPreVenta.BitBtn3Click(Sender: TObject);
begin
  qryPreventaMaster.Close;
  qryPreventaMaster.Open;
end;

procedure TfrmConsultaPreVenta.FormCreate(Sender: TObject);
begin
  dminventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dminventario.tblInventarioProd.Params[0].Value := GlbCia_Key;
  dminventario.tblInventarioProd.Open;
  if GLBEsFastFood and (GlbPorcPropina > 0) then
  begin
    if Not Assigned(dmFastfood) then
    dmFastfood:= TdmFastfood.Create(Nil);

    dmFastFood.tblMenuItem.Close;
    dmFastFood.tblMenuItem.Open;
  end;
  if GLBEsFastFood and (GlbPorcPropina > 0) then
  begin
     BitBtn5.Visible:= True;
     btnEliminarRecord.Visible:= True;
     btnEliminarRecord.Enabled:= True;
  end else
  begin
     //T btnEliminarRecord.Visible:= False;
     //T btnEliminarRecord.Enabled:= False;
  end;
  //Precargar FastFod records
  NumTicketFFood :=-1;
  if GLBEsFastFood and (GlbPorcPropina > 0) then
  try
  ProcGetFastFood;
  except
  end;
  qryClientes.Close;
  qryClientes.Open;
  qryEmpleado.Close;
  qryEmpleado.Open;
  BitBtn3Click(Self);
end;

procedure TfrmConsultaPreVenta.qryPreventaMasterAfterScroll(
  DataSet: TDataSet);
begin
  qryPreventaDet.Close;
  qryPreventaDet.params[0].Value:=qryPreventaMasterNUMERO.value;
  qryPreventaDet.Open;
end;

procedure TfrmConsultaPreVenta.qryPreventaMasterCalcFields(
  DataSet: TDataSet);
begin
  if qryPreventaMasterCODIGO_CTE.Value > 0 then
  begin
    if qryClientes.Locate('CODIGO_CTE', qryPreventaMasterCODIGO_CTE.Value,[]) then
    begin
      if Not qryClientesNOMBRE_FACTURAR.IsNull then
      qryPreventaMasterNombreCliente.Value:= qryClientesNOMBRE_FACTURAR.Value
      else
      if Not qryClientesNOMBRE_CTE.IsNull then
      qryPreventaMasterNombreCliente.Value:= qryClientesNOMBRE_CTE.Value;
    end;
  end else
  qryPreventaMasterNombreCliente.Value:=  qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
  
  if qryEmpleado.Locate('codigo', qryPreventaMasterCODIGO_VENDEDOR.Value,[]) then
     qryPreventaMasterNombreVendedor.Value:=
     qryEmpleadoNombre.Value+' ' + qryEmpleadoAPELLIDO.Value;
end;

procedure TfrmConsultaPreVenta.Edit1Change(Sender: TObject);
begin
  //if qryPreventaMasterCODIGO_CTE.Value <=0 then
  //begin
    if not qryPreventaMaster.Locate('NOMBRE_CLIENTE_GENERAL',edit1.Text,[loCaseInsensitive, loPartialKey]) then
    if qryClientes.Locate('NOMBRE_FACTURAR', edit1.Text,[loCaseInsensitive, loPartialKey]) then
    qryPreventaMaster.Locate('codigo_cte',qryClientesCODIGO_CTE.Value,[loCaseInsensitive, loPartialKey]);
  //end else
  //begin
  //  if qryClientes.Locate('NOMBRE_FACTURAR', edit1.Text,[loCaseInsensitive, loPartialKey]) then
  //  qryPreventaMaster.Locate('codigo_cte',qryClientesCODIGO_CTE.Value,[loCaseInsensitive, loPartialKey]);
  //end;
end;

procedure TfrmConsultaPreVenta.Edit1Enter(Sender: TObject);
begin
  qryPreventaMaster.AutoCalcFields:=False;
end;

procedure TfrmConsultaPreVenta.Edit1Exit(Sender: TObject);
begin
  qryPreventaMaster.AutoCalcFields:=true;
end;

procedure TfrmConsultaPreVenta.ProcGetFastFood;
var
 insD : boolean;
begin
  dmFastFood.tblMenuItem.close;
  dmFastFood.tblMenuItem.Open;
  esCargaDatosFFood:=False;
  insD:=False;
  //dmFastfood.ADOQryTicket.Sql.Text
  dmFastfood.ADOQryTicket.Close;
  dmFastfood.ADOQryTicket.Open;
  dmFastfood.ADOQryTicket.First;
  tblPreventaMaster.Close;
  tblPreventaMaster.Open;
  dmFastfood.ADOQryTicket.First;
  if dmFastfood.ADOQryTicket.RecordCount > 0 then
  esCargaDatosFFood:=True;
  While Not dmFastfood.ADOQryTicket.Eof Do
  begin
    if tblPreventaMaster.Locate('NUMERO',dmFastfood.ADOQryTicketTICKET_ID.Value,[]) then
    begin
      dmFastfood.ADOQryTicket.Next;
      insD:= False;
      Break;
    end;
    if CheckTicketExiste(dmFastfood.ADOQryTicketTICKET_ID.Value) then
    begin
      dmFastfood.ADOQryTicket.Next;
      Continue;
    end;

    tblPreventaMaster.Insert;
    tblPreventaMasterNUMERO.Value := dmFastfood.ADOQryTicketTICKET_ID.Value;
    tblPreventaMasterFECHA.Value  := dmFastfood.ADOQryTicketcreated_datetime.Value;
    tblPreventaMasterCIA_KEY.Value:= glbCia_Key;
    tblPreventaMasterCODIGO_CTE.Value := dmFastfood.ADOQryTicketCUSTOMER_ID.Value;
    tblPreventaMasterCODIGO_VENDEDOR.Value:=dmFastfood.ADOQryTicketSERVED_BY_EMPLOYEE_ID.Value;
    tblPreventaMasterFORMA_PAGO.Value:=1;
    tblPreventaMasterVALOR_TOTAL_DET.Value:=dmFastfood.ADOQryTicketPAID_AMOUNT.Value;
    tblPreventaMasterMONTO_BRUTO.Value:=tblPreventaMasterVALOR_TOTAL_DET.Value;
    tblPreventaMasterSTATUS.Value:='A';
    tblPreventaMasterMONEDA.Value:='1';
    GlbSalvarQuery(tblPreventaMaster);
    insD:=True;
    dmFastfood.tblAdoTicketUpdate.Close;
    dmFastfood.tblAdoTicketUpdate.Parameters[0].Value:=dmFastfood.ADOQryTicketTICKET_ID.Value;
    dmFastfood.tblAdoTicketUpdate.Open;

    //Insertar Detalle
    NumTicketFFood:=tblPreventaMasterNUMERO.Value;

    dmfastfood.tblAdoTICKET_ITEM.First;

    //if tblPreventaMasterNUMERO.IsNull then Exit;

    While Not dmfastfood.tblAdoTICKET_ITEM.Eof Do
    begin
      if tblPreventaDEt.Locate('SERIE;NUMERO',
      Vararrayof([dmfastfood.tblAdoTICKET_ITEMTICKET_ITEM_ID.Value,
      tblPreventaMasterNUMERO.Value]),[]) then
      begin
        dmfastfood.tblAdoTICKET_ITEM.next;
        Continue;
      end;
      tblPreventaDEt.Insert;
      tblPreventaDEtSERIE.Value:= dmfastfood.tblAdoTICKET_ITEMTICKET_ITEM_ID.Value;
      // FsqlMaxNumero('VENTAS_DET_PREVENTA','serie');
      tblPreventaDEtNUMERO.Value     := tblPreventaMasterNUMERO.Value;
      tblPreventaDEtCODIGO_PROD.Value:=dmfastfood.tblAdoTICKET_ITEMMENU_ITEM_ID.AsString;
      tblPreventaDEtDESCRIPCION.Value:= dmfastfood.tblAdoTICKET_ITEMMENU_ITEM_NAME.Value;
      tblPreventaDEtCANTIDAD.Value := dmfastfood.tblAdoTICKET_ITEMMENU_ITEM_COUNT.Value;
      tblPreventaDEtPRECIO.Value   := dmfastfood.tblAdoTICKET_ITEMMENU_ITEM_PRICE.Value;
      tblPreventaDEtITBI_DET.Value := dmfastfood.tblAdoTICKET_ITEMTAX1_AMOUNT.Value;
      tblPreventaDEtVALOR_SERVICIO_DET.Value:=
      dmfastfood.tblAdoTICKET_ITEMMENU_ITEM_PRICE.Value;
      tblPreventaDEtVALOR_TOTAL_DET.Value:=
      tblPreventaDEtVALOR_SERVICIO_DET.Value +
      tblPreventaDEtITBI_DET.Value;
      tblPreventaDEtSTATUS_DET.Value :=   'A';
      GlbSalvarQuery(tblPreventaDEt);
      
      ActInventario(tblPreventaDEtCODIGO_PROD.AsInteger);
      dmfastfood.tblAdoTICKET_ITEM.next;
    end;
    //fin inserar detalle

    dmFastfood.ADOQryTicket.Next;
  end;
  //dmFastfood.ADOConnection1.Close;
  //dmFastfood.Free;
  //dmFastfood:=Nil;
end;

procedure TfrmConsultaPreVenta.tblPreventaMasterAfterScroll(
  DataSet: TDataSet);
begin
  tblPreventaDEt.close;
  tblPreventaDEt.params[0].value:= tblPreventaMasterNUMERO.Value;
  tblPreventaDEt.Open;
end;

procedure TfrmConsultaPreVenta.ActInventario(codProd:Integer);
begin
  if Not dmFastFood.tblMenuItem.Locate('menu_item_id', codProd,[]) then Exit;  
  if Not dminventario.tblInventarioProd.Locate('CODIGO', codProd, []) then
  begin
    dminventario.tblInventarioProd.Insert;
    dminventario.tblInventarioProdCODIGO.Value     := dmFastFood.tblMenuItemmenu_item_id.Value;
    dminventario.tblInventarioProdDESCRIPCION.Value:= dmFastFood.tblMenuItemmenu_item_name.Value;
    dminventario.tblInventarioProdCANTIDAD.Value:= dmFastFood.tblMenuItemqty.Value;
    dminventario.tblInventarioProdRUTAIMAGEN.Value := dmFastFood.tblMenuItempicture_name.Value;
    dminventario.tblInventarioProdCOD_MONEDA.Value := '1';
    dminventario.tblInventarioProdCODIGO_TEXTO.Value := dminventario.tblInventarioProdCODIGO.AsString;
    dminventario.tblInventarioProdCODIGO_BARRA.Value := dminventario.tblInventarioProdCODIGO.AsString;

    dminventario.tblInventarioProdPRECIO.Value  := dmFastFood.tblMenuItemprice1.Value;

    dminventario.tblInventarioProdPRECIO_MINIMO.Value:= dminventario.tblInventarioProdPRECIO.Value -
    (dminventario.tblInventarioProdPRECIO.Value * 5/100);
    dminventario.tblInventarioProdPAGA_ITBI.Value  :=1;
    dminventario.tblInventarioProdINVENTARIAR.Value:= 1;
    dminventario.tblInventarioProdCIA_KEY.Value:= 1;
    dminventario.tblInventarioProdFECHA.Value  := StrToDate(formatDatetime(ShortDateFormat, Now));
    dminventario.tblInventarioProdTIPO.Value   := 4;//restaurant
    dminventario.tblInventarioProdSTATUS.Value := 'A';
    dminventario.tblInventarioProdPRECIO_COMPRA.Value := dmFastFood.tblMenuItemcost.Value;
    if dmFastFood.tblMenuItemtax_item_id1.Value = 1 then
    begin
      dminventario.tblInventarioProdPORCITBIS.Value  := 18;
      dminventario.tblInventarioProdIDTASAITBIS.Value:=  6;
    end else
    begin
      dminventario.tblInventarioProdPORCITBIS.Value  := 0;
      dminventario.tblInventarioProdIDTASAITBIS.Value:= 1; //exonerado
    end;
    GlbSalvarQuery(dminventario.tblInventarioProd);
  end else
  begin
    dminventario.tblInventarioProd.Edit;
    dminventario.tblInventarioProdDESCRIPCION.Value:= dmFastFood.tblMenuItemmenu_item_name.Value;
    dminventario.tblInventarioProdCANTIDAD.Value:= dmFastFood.tblMenuItemqty.Value;

    dminventario.tblInventarioProdPRECIO.Value  := dmFastFood.tblMenuItemprice1.Value;

    dminventario.tblInventarioProdPRECIO_MINIMO.Value:= dminventario.tblInventarioProdPRECIO.Value -
    (dminventario.tblInventarioProdPRECIO.Value * 1/100);
    dminventario.tblInventarioProdPAGA_ITBI.Value  :=1;
    dminventario.tblInventarioProdINVENTARIAR.Value:= 1;
    dminventario.tblInventarioProdCIA_KEY.Value:= 1;
    dminventario.tblInventarioProdFECHA.Value  := StrToDate(formatDatetime(ShortDateFormat, Now));
    dminventario.tblInventarioProdTIPO.Value   := 4;//restaurant
    dminventario.tblInventarioProdSTATUS.Value := 'A';
    dminventario.tblInventarioProdPRECIO_COMPRA.Value := dmFastFood.tblMenuItemcost.Value;
    if dmFastFood.tblMenuItemtax_item_id1.Value = 1 then
    begin
      dminventario.tblInventarioProdPORCITBIS.Value  := 18;
      dminventario.tblInventarioProdIDTASAITBIS.Value:=  6;
    end else
    begin
      dminventario.tblInventarioProdPORCITBIS.Value  := 0;
      dminventario.tblInventarioProdIDTASAITBIS.Value:= 1; //exonerado
    end;
    GlbSalvarQuery(dminventario.tblInventarioProd);
  end;
end;

procedure TfrmConsultaPreVenta.btnEliminarRecordClick(Sender: TObject);
begin
  if MessageDlg('Eliminar Record?', mtInformation,[mbYes, mbNo],0) = mrYes  then
  begin
    qryPreventaDet.First;
    While not qryPreventaDet.Eof do
    begin
      ibsqlDeletePreventaDet.Params[0].Value:= qryPreventaDetNUMERO.Value;
      ibsqlDeletePreventaDet.ExecQuery;
      qryPreventaDet.Next;
    end;
    ibsqlDeletePreventaMaster.Params[0].Value:= qryPreventaMasterNUMERO.Value;
    ibsqlDeletePreventaMaster.ExecQuery;
    if not ibsqlDeletePreventaMaster.Transaction.InTransaction then
    ibsqlDeletePreventaMaster.Transaction.StartTransaction;
    try
      ibsqlDeletePreventaMaster.Transaction.CommitRetaining;
    except
    ibsqlDeletePreventaMaster.Transaction.RollbackRetaining;
    end;

    if not ibsqlDeletePreventaDet.Transaction.InTransaction then
    ibsqlDeletePreventaDet.Transaction.StartTransaction;
    try
      ibsqlDeletePreventaDet.Transaction.CommitRetaining;
    except
    ibsqlDeletePreventaDet.Transaction.RollbackRetaining;
    end;
  end;
  qryPreventaMaster.Close;
  qryPreventaMaster.Open;
  qryPreventaDet.Close;
  qryPreventaDet.Open;
end;

function TfrmConsultaPreVenta.CheckTicketExiste(
  numTicket: integer): boolean;
begin
  qryCheckExiste.Close;
  qryCheckExiste.params[0].Value:=numTicket;
  qryCheckExiste.Open;
  qryCheckExiste.Last;
  if qryCheckExiste.RecordCount >=1 then
  result:=True
  else result:=False;     
end;

procedure TfrmConsultaPreVenta.BitBtn5Click(Sender: TObject);
begin
  if (Not GLBEsFastFood) then Exit;
  if (tblPreventaMasterNUMERO.IsNull) then Exit;
  if MessageDlg('Desea asignar estatus de procesado a ticket #'+tblPreventaMasterNUMERO.AsString+' en Utouch?',mtInformation,[mbyes,mbno],0) = mrNo then exit;
  dmFastfood.tblAdoTicketUpdate.Close;
  dmFastfood.tblAdoTicketUpdate.Parameters[0].Value:= tblPreventaMasterNUMERO.Value;
  dmFastfood.tblAdoTicketUpdate.Open;
  //dmFastfood.tblAdoTicketUpdate.First;
  if (dmFastfood.tblAdoTicketUpdateTicket_ID.Value = tblPreventaMasterNUMERO.Value) then
  begin
    dmFastfood.tblAdoTicketUpdate.Edit;
    dmFastfood.tblAdoTicketUpdateProcessFiscalYN.Value:='Y';
  dmFastfood.tblAdoTicketUpdate.Post;
  end;
  dmFastfood.tblAdoTicketUpdate.Close;
  dmFastfood.tblAdoTicketUpdate.Parameters[0].Value:= tblPreventaMasterNUMERO.Value;
  dmFastfood.tblAdoTicketUpdate.Open;
  if (dmFastfood.tblAdoTicketUpdateTicket_ID.Value = tblPreventaMasterNUMERO.Value) then
  begin
    if (uppercase(dmFastfood.tblAdoTicketUpdateProcessFiscalYN.Value) <> 'Y') then
    begin
      dmFastfood.tblAdoTicketUpdate.Edit;
      dmFastfood.tblAdoTicketUpdateProcessFiscalYN.Value:='Y';
      dmFastfood.tblAdoTicketUpdate.Post;
    end;
  end;
  qryPreventaMaster.Close;
  qryPreventaMaster.Open;
  qryPreventaDet.Close;
  qryPreventaDet.Open;
end;

end.
