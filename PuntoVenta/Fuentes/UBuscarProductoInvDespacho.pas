unit UBuscarProductoInvDespacho;

interface
                 
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl, StdCtrls,
  Buttons, ExtCtrls, Mask, DBCtrls, RxMemDS, RXCtrls, RxLookup, EditNew;

type
  TfrmBuscarInvDespachoVendedores = class(TForm)
    qryInventario: TIBQuery;
    dsqryInventario: TDataSource;
    RxDBGrid1: TRxDBGrid;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    rxData: TRxMemoryData;
    rxDataCantidad: TFloatField;
    rxDataporc_desc: TFloatField;
    rxDataitbi: TCurrencyField;
    rxDatavalor: TCurrencyField;
    rxDatatotal_neto: TCurrencyField;
    dsrxData: TDataSource;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    rxDataPrecio: TCurrencyField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    rxDatafecha: TDateTimeField;
    RxDBGrid2: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    Shape1: TShape;
    Shape2: TShape;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    rxDatacodigo: TStringField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    DBEdit8: TDBEdit;
    dsqryEmpleados: TDataSource;
    qryInventarioCODIGO: TIntegerField;
    dstblRuta: TDataSource;
    rxDataCodigoRuta: TIntegerField;
    rxDataCodEmp: TIntegerField;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    rxDataNuevoBalance: TFloatField;
    Label13: TLabel;
    DBEdit10: TDBEdit;
    rxDataNuevoMonto: TFloatField;
    Label14: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    rxDataBalanceAct: TFloatField;
    EditN1: TEditN;
    Label18: TLabel;
    Label19: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    rxDataTIPO_TRN: TIntegerField;
    qryInventarioCANTIDAD: TFloatField;
    lablBlcInv: TLabel;
    dbEditBlcInventario: TDBEdit;
    qryRuta: TIBQuery;
    qryRutaCODIGO: TIntegerField;
    qryRutaCODIGO_EMP: TIntegerField;
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rxDataAfterPost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rxDataCalcFields(DataSet: TDataSet);
    procedure DBEdit9Enter(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
  private
    { Private declarations }
     procedure procesaclick;
  public
    { Public declarations }
  end;

var
  frmBuscarInvDespachoVendedores: TfrmBuscarInvDespachoVendedores;
   trnProcesada : Boolean;
implementation

uses UDatModConectar, UDatModInventario, uGlobal, UDatosVentas, UDatModDespacho,
  UDatModEmpleados, UDatModCuadrexRuta, UProcesarDespacho;

{$R *.dfm}

procedure TfrmBuscarInvDespachoVendedores.RxDBGrid1CellClick(Column: TColumn);
begin
  procesaClick;
end;

procedure TfrmBuscarInvDespachoVendedores.FormCreate(Sender: TObject);
begin
  qryInventario.close;
  qryInventario.open;
  rxData.close;
  rxData.Open;
  trnProcesada:=False;
  dmEmpleados.tblRuta.close;
  dmEmpleados.tblRuta.open;
  dmEmpleados.tblEmpleados.close;
  dmEmpleados.tblEmpleados.open;
  dmCuadrexRuta.tblBalanceDespacho.close;
  dmCuadrexRuta.tblBalanceDespacho.open;
  dmInventario.qryPrecioInventario.Close;
  dmInventario.qryPrecioInventario.Params[0].Value:=ExtraerFecha(date);
  dmInventario.qryPrecioInventario.Params[1].Value:=ExtraerFecha(date);
  dmInventario.qryPrecioInventario.open;
end;

procedure TfrmBuscarInvDespachoVendedores.BitBtn4Click(Sender: TObject);
begin
  if qryInventarioCANTIDAD.Value < rxDataCantidad.Value then
  begin
    Messagedlg('Cantidad no puede ser mayor que '+qryInventarioCANTIDAD.AsString,mtError,[mbok],0);
    DBEdit3.SetFocus;
  end;
  if rxData.state in [dsEdit, dsInsert] then
  begin
    if rxDataCantidad.Value = 0 then
    begin
      rxData.Cancel;
      exit;
    end;
    rxDataporc_desc.Value:=qryInventarioPORC_DESCUENTO.Value;
    rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value;
    if qryInventarioPAGA_ITBI.Value = 1 then
    rxDataitbi.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100)) *
    FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), qryInventarioCODIGO.Value) / 100;
    rxDatatotal_neto.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100))
                                          + rxDataitbi.Value;
    rxDataCodEmp.Value:=dmDespacho.qryEmpleadosCODIGO.Value;
    rxDataNuevoBalance.Value:= rxDataCantidad.Value + rxDataBalanceAct.Value;
    if rxDataCodigoRuta.Value = 0 then
    begin
      MessageDlg('Codigo ruta no puede ser cero, verifique', mtInformation, [mbOK], 0);
      DBEdit9.SetFocus;
      exit;
    end;
    if rxDatacodigo.IsNull then
    begin
      MessageDlg('Codigo producto no puede nulo, verifique',mtInformation, [mbOK], 0);
      DBEdit9.SetFocus;
      exit;
    end;
    qryRuta.Close;
    qryRuta.Params[0].Value:= rxDataCodigoRuta.Value;
    qryRuta.Open;
    if qryRuta.RecordCount = 0 then
    begin
      MessageDlg('Ruta '+rxDataCodigoRuta.AsString+' no existe, verifique',mtInformation, [mbOK], 0);
      DBEdit9.SetFocus;
      Exit;
    end;
    rxData.Post;
    Edit1.Text:='';
    Edit1.SetFocus;
  end;
end;

procedure TfrmBuscarInvDespachoVendedores.BitBtn5Click(Sender: TObject);
begin
  if rxData.State In [dsEdit, dsInsert] then
  rxData.Cancel else rxData.Delete;
end;

procedure TfrmBuscarInvDespachoVendedores.BitBtn6Click(Sender: TObject);
begin
  if Messagedlg('Cancelar venta?',mtWarning,[mbyes,mbno],0)=mryes then
  begin
    rxdata.Close;
    rxdata.EmptyTable;
    rxData.Open;
  end;
end;

procedure TfrmBuscarInvDespachoVendedores.BitBtn2Click(Sender: TObject);
begin
  if rxdata.RecordCount > 0 then
  begin
    dmDespacho.tblDespachoMaster.Insert;
    dmDespacho.tblDespachoMasterCODIGO_EMP.Value := rxDataCodEmp.Value;
    dmDespacho.tblDespachoMasterCODIGO_RUTA.Value:= rxDataCodigoRuta.Value;
    dmDespacho.tblDespachoMasterFECHA.Value      := ExtraerFecha(rxDataFecha.Value);
    dmDespacho.tblDespachoMasterSTATUS.Value     := 'A';
    //dmDespacho.tblDespachoMasterMONEDA.Value     := '1';
    dmDespacho.tblDespachoMasterCODIGO_DESPACHADOR.Value:= VarUsuarioGlb;
    dmDespacho.tblDespachoMaster.Post;
    dmDespacho.tblDespachoMaster.ApplyUpdates;
    if Not dmDespacho.tblDespachoMaster.Transaction.InTransaction then
      dmDespacho.tblDespachoMaster.Transaction.StartTransaction;
    try
      dmDespacho.tblDespachoMaster.Transaction.CommitRetaining;
    except
    dmDespacho.tblDespachoMaster.Transaction.RollbackRetaining;
    end;
    rxData.First;
    While Not rxData.Eof do
    begin
      if (rxDataCodigo.Value <> '') And (not rxDataCodigo.IsNull) then
      begin
      dmDespacho.tbldespachoDet.Insert;
      dmDespacho.tbldespachoDetNUMERO.Value       := dmVentas.tblVentasMastNUMERO.Value;
      dmDespacho.tbldespachoDetCODIGO_PROD.Value  := rxDatacodigo.AsInteger;
      dmDespacho.tbldespachoDetDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
      dmDespacho.tbldespachoDetCANTIDAD.Value     := rxDataCantidad.AsInteger;
      dmDespacho.tbldespachoDetPRECIO.Value       := rxDataPrecio.Value;
      dmDespacho.tbldespachoDetPORC_DESC_DET.Value   := rxDataporc_desc.Value;
      dmDespacho.tbldespachoDetITBI_DET.Value        := rxDataitbi.Value;
      dmDespacho.tblDespachoDetVALOR_BRUTO.Value     := rxDatavalor.Value;
      dmDespacho.tbldespachoDetVALOR_TOTAL_DET.Value := rxDatatotal_neto.Value;
      dmDespacho.tbldespachoDetSTATUS_DET.Value;
      dmDespacho.tbldespachoDetIN_POR.Value       := StrUserName;
      dmDespacho.tbldespachoDetFECHA_IN.Value     := Now;
      dmDespacho.tbldespachoDetSTATUS_DET.Value   := 'A';
      dmDespacho.tbldespachoDet.Post;
      dmDespacho.tbldespachoDet.ApplyUpdates;
      if Not dmDespacho.tbldespachoDet.Transaction.InTransaction then
      dmDespacho.tbldespachoDet.Transaction.StartTransaction;
      try
        dmDespacho.tbldespachoDet.Transaction.CommitRetaining;
      except
      dmDespacho.tbldespachoDet.Transaction.RollbackRetaining;
      end;
      end;
      rxData.Next;
    end;
    rxData.Close;
    rxData.EmptyTable;
    rxData.Open;
    trnProcesada:=True;
    dmDespacho.qryBalanceDespacho.Close;
    dmDespacho.qryBalanceDespacho.Open;
    frmProcesarDespachoVendedores.ProcesaVenta(2,True);
    //Close;
  end;
end;

procedure TfrmBuscarInvDespachoVendedores.rxDataAfterPost(DataSet: TDataSet);
var
  Monto, MontoNuevo : Real;
  recordActual: TBookmark;
begin
  rxdata.DisableControls;
  Monto := 0;
  recordActual:=rxdata.GetBookmark;
  rxdata.First;
  While Not rxdata.Eof do
  begin
    Monto := Monto + rxDataTotal_Neto.Value;
    MontoNuevo := MontoNuevo + rxDataNuevoMonto.Value;
    rxData.Next;
  end;
  Label11.Caption := Format('%m',[monto]);
  Label16.Caption := Format('%m',[MontoNuevo]);
  rxdata.GotoBookmark(recordActual);
  rxdata.FreeBookmark(recordActual);
  rxdata.EnableControls;  
end;

procedure TfrmBuscarInvDespachoVendedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not trnProcesada then
  if Messagedlg('Salir sin procesar venta?',mtWarning,[mbYes,mbNo],0)=mrYes then
  begin
    rxdata.Close;
    rxdata.EmptyTable;
    rxdata.Open;
    CanClose := True;
  end else Canclose:=False
  else Canclose:=True;
end;

procedure TfrmBuscarInvDespachoVendedores.BitBtn7Click(Sender: TObject);
begin
  Messagedlg('Muy pronto esta opción estará disponible',mtinformation,[mbok],0);
end;

procedure TfrmBuscarInvDespachoVendedores.BitBtn1Click(Sender: TObject);
begin
  if edit1.Text = '' then exit;
  if qryInventario.Locate('CODIGO_TEXTO',Edit1.Text,[]) then procesaclick
  else MessageDlg('Codigo producto no encontrado, verifique',mtInformation, [mbOK], 0);
end;

procedure TfrmBuscarInvDespachoVendedores.procesaclick;
var
  X : Smallint;
  CodCte:Integer;
  codruta, codemp:smallint;
begin
  Panel1.Visible:=True;
  if rxData.State in [dsEdit, dsinsert] then
  BitBtn4click(Self);
  if rxData.RecordCount = 0 then
  begin
    rxData.Insert;
    rxDataTipo_trn.Value := 2;//Salida
    rxDataFecha.Value    := ExtraerFecha(GlbFechaTrnDiaria);
    rxDatacodigo.Value   := qryInventarioCODIGO.AsString;
    rxDataPrecio.Value   := qryInventarioPRECIO.Value;
    if dmCuadrexRuta.tblBalanceDespacho.Locate('CODIGO_RUTA;CODIGO_TEXTO',
    VarArrayOf([EditN1.Text,qryInventarioCODIGO_TEXTO.Value]),[]) then
    rxDataBalanceAct.Value:=dmCuadrexRuta.tblBalanceDespachoBALANCE_ACT.Value;
    DBEdit9.SetFocus;
  end else
  begin
    CodEmp :=rxDataCodEmp.Value;
    CodRuta:=rxDataCodigoRuta.Value;
    rxData.Insert;
    rxDataTipo_trn.Value  := 2;//Salida
    rxDataCodEmp.Value    := CodEmp;
    rxDataCodigoRuta.Value:= CodRuta;
    rxDataFecha.Value     := ExtraerFecha(GlbFechaTrnDiaria);
    rxDatacodigo.Value    := qryInventarioCODIGO.AsString;
    rxDataPrecio.Value    := qryInventarioPRECIO.Value;
    if dmCuadrexRuta.tblBalanceDespacho.Locate('CODIGO_RUTA;CODIGO_TEXTO',
    VarArrayOf([EditN1.Text,qryInventarioCODIGO_TEXTO.Value]),[]) then
    rxDataBalanceAct.Value:=dmCuadrexRuta.tblBalanceDespachoBALANCE_ACT.Value;
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmBuscarInvDespachoVendedores.Edit1Exit(Sender: TObject);
begin
  BitBtn1Click(self);
end;

procedure TfrmBuscarInvDespachoVendedores.FormShow(Sender: TObject);
begin
  if frmBuscarInvDespachoVendedores.Showing then
  EditN1.SetFocus;
end;

procedure TfrmBuscarInvDespachoVendedores.rxDataCalcFields(
  DataSet: TDataSet);
begin
  rxDataNuevoMonto.Value:= rxDataNuevoBalance.Value * rxDataPrecio.Value;
end;

procedure TfrmBuscarInvDespachoVendedores.DBEdit9Enter(Sender: TObject);
begin
  if rxData.State In [dsEdit, dsInsert] then
  rxDataCodigoRuta.Value := EditN1.ValueInteger;
end;

procedure TfrmBuscarInvDespachoVendedores.DBEdit9Exit(Sender: TObject);
begin
  if rxDataCodigoRuta.Value <> EditN1.ValueInteger then
  EditN1.Text := rxDataCodigoRuta.AsString;
end;

end.
