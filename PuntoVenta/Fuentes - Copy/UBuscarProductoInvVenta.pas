unit UBuscarProductoInvVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl, StdCtrls,
  Buttons, ExtCtrls, Mask, DBCtrls, RxMemDS, RXCtrls, RxLookup,
  IBStoredProc;

type
  TfrmBuscarProdInv = class(TForm)
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
    Shape2: TShape;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label9: TLabel;
    rxDataCodigoCliente: TIntegerField;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn7: TBitBtn;
    rxDatacodigo: TStringField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    DBEdit8: TDBEdit;
    qryInventarioCANTIDAD: TFloatField;
    Label12: TLabel;
    DBText1: TDBText;
    Label13: TLabel;
    ibProcBuscarDatos: TIBStoredProc;
    rxDataCodigoProd: TIntegerField;
    qryInventarioCODIGO_PROD: TIntegerField;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure ProcesaDatos;
  public
    { Public declarations }
  end;

var
  frmBuscarProdInv: TfrmBuscarProdInv;
   trnProcesada : Boolean;
implementation

uses UDatModConectar, UDatModInventario, uGlobal, UDatosVentas,
  UProcesarVentas;

{$R *.dfm}

procedure TfrmBuscarProdInv.RxDBGrid1CellClick(Column: TColumn);
begin
 ProcesaDatos;
end;

procedure TfrmBuscarProdInv.FormCreate(Sender: TObject);
begin
  qryInventario.close;
  qryInventario.open;
  rxData.close;
  rxData.Open;
  trnProcesada:=False;
end;

procedure TfrmBuscarProdInv.BitBtn4Click(Sender: TObject);
begin
  if qryInventarioCANTIDAD.Value < rxDataCantidad.Value then
  begin
    Messagedlg('Cantidad no puede ser mayor que '+qryInventarioCANTIDAD.AsString,mtError,[mbok],0);
    if Messagedlg('Cancelar transaccion?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      BitBtn5Click(Self);
      Exit;
    end else
    DBEdit3.SetFocus;
  end;
  if rxData.state in [dsEdit, dsInsert] then
  begin
    rxDataporc_desc.Value:=qryInventarioPORC_DESCUENTO.Value;
    rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value;
    if qryInventarioPAGA_ITBI.Value = 1 then
    rxDataitbi.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100)) *
    FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value),rxDataCodigoProd.Value) / 100;
    rxDatatotal_neto.Value:= (rxDatavalor.Value -
                             (rxDatavalor.Value * rxDataporc_desc.Value/100))
                                                + rxDataitbi.Value;
    rxData.Post;
  end else 
  //Panel1.Visible:=False;
end;

procedure TfrmBuscarProdInv.BitBtn5Click(Sender: TObject);
begin
  if rxData.State In [dsEdit, dsInsert] then
  rxData.Cancel else rxData.Delete;
end;

procedure TfrmBuscarProdInv.BitBtn6Click(Sender: TObject);
begin
  if Messagedlg('Cancelar venta?',mtWarning,[mbyes,mbno],0)=mryes then
  begin
    rxdata.close;
    rxdata.EmptyTable;
    rxData.open;
  end;
end;

procedure TfrmBuscarProdInv.BitBtn2Click(Sender: TObject);
var
   VentaCorrecta : Boolean;
begin
  VentaCorrecta:=False;
  if rxdata.RecordCount > 0 then
  begin
    dmVentas.tblVentasMast.Insert;
    dmVentas.tblVentasMastCODIGO_CTE.Value := rxDataCodigoCliente.Value;
    dmVentas.tblVentasMastFECHA.Value      := ExtraerFecha(rxDataFecha.Value);
    dmVentas.tblVentasMastSTATUS.Value:='A';
    dmVentas.tblVentasMastMONEDA.Value:='1';
    dmVentas.tblVentasMastCODIGO_VENDEDOR.Value := VarUsuarioGlb;
    dmVentas.tblVentasMast.Post;
    dmVentas.tblVentasMast.ApplyUpdates;
    if Not dmVentas.tblVentasMast.Transaction.InTransaction then
      dmVentas.tblVentasMast.Transaction.StartTransaction;
    try
      dmVentas.tblVentasMast.Transaction.CommitRetaining;
    except
    dmVentas.tblVentasMast.Transaction.RollbackRetaining;
    end;
    rxData.First;
    While Not rxdata.Eof do
    begin
      dmVentas.tblVentasDetalle.Insert;
      dmVentas.tblVentasDetalleNUMERO.Value       := dmVentas.tblVentasMastNUMERO.Value;
      dmVentas.tblVentasDetalleCODIGO_PROD.Value  := rxDatacodigo.Value;
      dmVentas.tblVentasDetalleDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
      dmVentas.tblVentasDetalleCANTIDAD.Value     := rxDataCantidad.AsInteger;
      dmVentas.tblVentasDetallePRECIO.Value       := rxDataPrecio.Value;
      dmVentas.tblVentasDetallePORC_DESC_DET.Value:= rxDataporc_desc.Value;
      dmVentas.tblVentasDetalleITBI_DET.Value     := rxDataitbi.Value;
      dmVentas.tblVentasDetalleVALOR_SERVICIO_DET.Value:=rxDatavalor.Value;
      dmVentas.tblVentasDetalleVALOR_TOTAL_DET.Value   :=rxDatatotal_neto.Value;
      dmVentas.tblVentasDetalleSTATUS_DET.Value;
      dmVentas.tblVentasDetalleIN_POR.Value       := StrUserName;
      dmVentas.tblVentasDetalleFECHA_IN.Value     := Now;
      dmVentas.tblVentasDetalleSTATUS_DET.Value   := 'A';
      dmVentas.tblVentasDetalle.Post;
      dmVentas.tblVentasDetalle.ApplyUpdates;
      VentaCorrecta:=True;
      if Not dmVentas.tblVentasDetalle.Transaction.InTransaction then
      dmVentas.tblVentasDetalle.Transaction.StartTransaction;
      try
        dmVentas.tblVentasDetalle.Transaction.CommitRetaining;
      except
      dmVentas.tblVentasDetalle.Transaction.RollbackRetaining;
      end;
      rxData.Next;
    end;
    if VentaCorrecta then
    frmProcesarVentas.ProcesaVenta(1,True);
    rxData.Close;
    rxData.EmptyTable;
    trnProcesada := True;
    VentaCorrecta:=False;
    Close;
  end;
end;

procedure TfrmBuscarProdInv.rxDataAfterPost(DataSet: TDataSet);
var
  monto : Real;
begin
  rxdata.DisableControls;
  Monto := 0;
  rxdata.First;
  While Not rxdata.Eof do
  begin
    Monto := Monto + rxDataTotal_Neto.Value;
    rxData.Next;
  end;
  Label11.Caption:=Format('%m',[monto]);
  rxdata.EnableControls;
end;

procedure TfrmBuscarProdInv.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Not trnProcesada then
  if Messagedlg('Salir sin procesar venta?',mtWarning,[mbYes,mbNo],0)=mrYes then
  begin
    rxdata.Close;
    rxdata.EmptyTable;
    rxdata.Open;
    CanClose:=True;
  end else Canclose:=False
  else Canclose:=True;
end;

procedure TfrmBuscarProdInv.BitBtn7Click(Sender: TObject);
begin
  Messagedlg('Muy pronto esta opción estará disponible',mtinformation,[mbok],0);
end;

procedure TfrmBuscarProdInv.BitBtn1Click(Sender: TObject);
begin
  if edit1.Text = '' then exit;
  if qryInventario.Locate('CODIGO_TEXTO',Edit1.Text,[]) then ProcesaDatos
  else MessageDlg('Codigo producto no encontrado, verifique',mtInformation, [mbOK], 0);
end;

procedure TfrmBuscarProdInv.ProcesaDatos;
var
  X : Smallint;
  CodCte:Integer;
begin
  Panel1.Visible:=True;
  if rxData.State in [dsEdit, dsinsert] then
  BitBtn4click(Self);
  if rxData.RecordCount = 0 then
  begin
    rxData.Insert;
    rxDataFecha.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    rxDatacodigo.Value:=qryInventarioCODIGO_TEXTO.Value;
    rxDataCodigoProd.Value:=qryInventarioCODIGO_PROD.value;
    rxDataPrecio.Value:=qryInventarioPRECIO.Value;
    rxDataCodigoCliente.Value := 0;
    //RxDBLookupCombo1.SetFocus;
    DBEdit3.SetFocus;
  end else
  begin
    if rxDataCodigoCliente.IsNull then
    CodCte:=0;
    CodCte:=rxDataCodigoCliente.Value;
    rxData.Insert;
    rxDataCodigoCliente.Value:=CodCte;
    rxDataFecha.Value :=ExtraerFecha(GlbFechaTrnDiaria);
    rxDatacodigo.Value:=qryInventarioCODIGO_TEXTO.Value;
    rxDataPrecio.Value:=qryInventarioPRECIO.Value;
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmBuscarProdInv.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if rxData.state in [dsEdit, dsInsert] then Exit;
  if (key = 115) then
  Edit1.SetFocus
  else if (key = 120) then
  BitBtn2Click(Self) else 
  if (key = 27) then
  BitBtn6Click(Self);
end;

procedure TfrmBuscarProdInv.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TfrmBuscarProdInv.FormActivate(Sender: TObject);
begin
  if rxData.State = dsInactive then rxData.open;
  if rxData.State = dsbrowse then
  if rxData.RecordCount = 0 then
  Edit1.SetFocus;
end;

end.
