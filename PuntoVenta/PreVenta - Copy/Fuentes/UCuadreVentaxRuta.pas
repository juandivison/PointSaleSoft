unit UCuadreVentaxRuta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, DB, Buttons, EditNew, RxMemDS,
  Grids, DBGrids, RXDBCtrl, RxLookup, Mask, IBCustomDataSet, IBQuery,
  RXCtrls, RXToolEdit, Menus, ComCtrls, RxCalc, WinSkinData;

type
  TfrmCuadreXRuta = class(TForm)
    dsqrydatosempleados: TDataSource;
    rxVentaxRuta: TRxMemoryData;
    dsrxVentaxRuta: TDataSource;
    rxVentaxRutaruta: TIntegerField;
    rxVentaxRutacodigo_emp: TIntegerField;
    rxVentaxRutacodigo_prod: TIntegerField;
    rxVentaxRutanombre_vendedor: TStringField;
    rxVentaxRutacantidad: TFloatField;
    rxVentaxRutaprecio: TFloatField;
    rxVentaxRutamonto: TFloatField;
    dsqryBlcRuta: TDataSource;
    rxVentaxRutadescuento: TFloatField;
    rxVentaxRutaitbi: TFloatField;
    rxVentaxRutaformaPago: TSmallintField;
    rxVentaxRutaNumeroDoc: TStringField;
    rxVentaxRutaDescripcion: TStringField;
    rxVentaxRutaValorTotal: TFloatField;
    qryInventario: TIBQuery;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioCODIGO: TIntegerField;
    dsqryInventario: TDataSource;
    rxVentaxRutaCodigoCliente: TIntegerField;
    rxVentaxRutafecha: TDateTimeField;
    rxVentaTotal: TRxMemoryData;
    rxVentaTotalformaPago: TSmallintField;
    rxVentaTotalMonto: TFloatField;
    dsrxVentatotal: TDataSource;
    rxVentaTotalDescFPago: TStringField;
    rxVentaxRutaOrigen: TSmallintField;
    rxVentaTotalDebito: TFloatField;
    rxVentaTotalCredito: TFloatField;
    rxVentaTotalorigen: TFloatField;
    rxVentaxRutaCantSalida: TFloatField;
    rxVentaxRutaCantRegreso: TFloatField;
    dstblCuadreRuta: TDataSource;
    MainMenu1: TMainMenu;
    Reporte1: TMenuItem;
    ReImprimirCuadre1: TMenuItem;
    dsqryDetalleCuadreRuta: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    Label16: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Edit1: TEdit;
    edtCodProd: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    DBText4: TDBText;
    Label23: TLabel;
    BitBtn8: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    RxDBGrid2: TRxDBGrid;
    Label24: TLabel;
    DBText5: TDBText;
    rxVentaTotalDiferencia: TFloatField;
    BitBtn9: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    TabSheet3: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    BitBtn11: TBitBtn;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    rxVentaxRutarecarga: TFloatField;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    edtNumRuta: TEditN;
    Label26: TLabel;
    dsqryCargarDatosCuadreRuta: TDataSource;
    btnLimpiarDatos: TBitBtn;
    CuadreVendedor1: TMenuItem;
    rxVentaxRutacodigo_prod_inv: TIntegerField;
    RxCalculator1: TRxCalculator;
    rxCalcular: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenuCostosGastos: TPopupMenu;
    CostosGastos1: TMenuItem;
    Proveedores1: TMenuItem;
    CentroCostos1: TMenuItem;
    Productos1: TMenuItem;
    Prestamos1: TMenuItem;
    CreditoNormal1: TMenuItem;
    BitBtn15: TBitBtn;
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure edtCantRegresoExit(Sender: TObject);
    procedure edtCodCteExit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBGrid2CellClick(Column: TColumn);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn14Click(Sender: TObject);
    procedure btnLimpiarDatosClick(Sender: TObject);
    procedure rxVentaxRutaBeforePost(DataSet: TDataSet);
    procedure CuadreVendedor1Click(Sender: TObject);
    procedure ReImprimirCuadre1Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rxCalcularClick(Sender: TObject);
    procedure Prestamos1Click(Sender: TObject);
    procedure Productos1Click(Sender: TObject);
    procedure CostosGastos1Click(Sender: TObject);
    procedure Proveedores1Click(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CreditoNormal1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
  private
    { Private declarations }
    procedure GrabarEnDespacho;
    procedure PostearCuadre;
    procedure PostearBalanceRuta;
    procedure GuardarCuadreCaja;
    procedure ActualizaInventarioRecarga;
    procedure ProcDetalleReporte;
  public
    { Public declarations }
    procedure sumar;    
  end;

var
  frmCuadreXRuta: TfrmCuadreXRuta;

implementation

uses UDatModCuadrexRuta, UDatModClientes, UDatosVentas, uglobal,
  UProcesarVentas, UDatModInventario, UProcesarDespacho, UDatModDespacho,
  UQckReporteFacturaCuadre, UFormSelFecha, URepCuadreDiario,
  UDatModUsuarios, UPrestamoEmpleados, UFormProductosServicios,
  URegistrarTransOpeDiaria, UFormProveedores, UTransaccionesCxc,
  UDatModConectar, UDetValoresCuadre;


{$R *.dfm}

procedure TfrmCuadreXRuta.Edit1Exit(Sender: TObject);
begin
  if edit1.Text = '' then exit;
  edtnumruta.Text:=edit1.Text;
  if not dmcuadrexruta.qryDatosEmpleado.Locate('CODIGO_RUTA',strtoint(edit1.Text),[]) then
     MessageDlg('Ruta no existe, verifique',mtInformation, [mbOK], 0)
  else
  begin
    dmcuadrexruta.qryBlcRuta.Close;
    dmcuadrexruta.qryBlcRuta.params[0].Value:=dmcuadrexruta.qryDatosEmpleadoCODIGO_EMP.Value;
    dmcuadrexruta.qryBlcRuta.open;
   if rxVentaxRuta.State in [dsInsert, dsEdit] then
   rxVentaxRutaruta.AsString := Edit1.Text;
  end;
end;

procedure TfrmCuadreXRuta.FormCreate(Sender: TObject);
begin
  dmcuadrexruta.qryDatosEmpleado.Close;
  dmcuadrexruta.qryDatosEmpleado.Open;
  rxVentaxRuta.Close;
  rxVentaxRuta.Open;
  dmVentas.qryClientes.Close;
  dmVentas.qryClientes.Open;
  qryInventario.Close;
  qryInventario.Open;
  dmVentas.TblFormaPago.Close;
  dmVentas.TblFormaPago.Open;
  dmVentas.tblVentasMast.Close;
  dmVentas.tblVentasMast.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblVentasMast.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblVentasMast.Params[2].Value:='A';
  dmVentas.tblVentasMast.Params[3].Value:='A';
  dmVentas.tblVentasMast.Params[4].Value:='A';
  dmVentas.tblVentasMast.Open;
  PageControl1.ActivePage:=TabSheet1;
end;

procedure TfrmCuadreXRuta.BitBtn2Click(Sender: TObject);
begin
  if rxVentaxRuta.State in [dsEdit, dsInsert] then
  begin
    rxVentaxRutaOrigen.Value:=dmVentas.tblFormaPagoORIGEN.Value;
    rxVentaxRuta.Post;
  end;
  DBText2.Visible:=False;
  Edit1.SetFocus;
  edtCodProd.Text:='';
  //edtCantRegreso.Text:='';
  dmcuadrexruta.qryDetalleCuadreRuta.close;
  dmcuadrexruta.qryDetalleCuadreRuta.Params[0].Value:=rxVentaxRutaRUTA.Value;
  dmcuadrexruta.qryDetalleCuadreRuta.Params[1].Value:=ExtraerFecha(rxVentaxRutaFECHA.Value);
  dmcuadrexruta.qryDetalleCuadreRuta.Params[2].Value:=rxVentaxRutaCODIGO_EMP.Value;
  dmcuadrexruta.qryDetalleCuadreRuta.Open;
end;

procedure TfrmCuadreXRuta.DBEdit9Exit(Sender: TObject);
begin
  if rxVentaxRuta.state in [dsEdit, dsInsert] then
  begin
    rxVentaxRutadescuento.Value:=qryInventarioPORC_DESCUENTO.Value;
    rxVentaxRutamonto.Value:=rxVentaxRutaPrecio.Value * rxVentaxRutaCantidad.Value;
    if qryInventarioPAGA_ITBI.Value = 1 then
    rxVentaxRutaitbi.Value:= (rxVentaxRutamonto.Value -
                       (rxVentaxRutamonto.Value * rxVentaxRutadescuento.Value/100)) *
    FGlbPorcItbi(ExtraerFecha(rxVentaxRutafecha.Value), rxVentaxRutacodigo_prod.Value) / 100;
    rxVentaxRutaValorTotal.Value:= (rxVentaxRutaMonto.Value -
                       (rxVentaxRutaMonto.Value * rxVentaxRutadescuento.Value/100))
                                          + rxVentaxRutaitbi.Value;

  end;
end;

procedure TfrmCuadreXRuta.edtCodProdExit(Sender: TObject);
begin
  if edtCodProd.Text = '' then exit;
  if not qryInventario.Locate('CODIGO_TEXTO',edtCodProd.Text,[]) then
     MessageDlg('Codigo no encontrado, verifique',mtInformation, [mbOK], 0)
  else
  begin
    dmCuadrexRuta.qryBlcRuta.locate('CODIGO_TEXTO',edtCodProd.Text,[]);
    DBText2.Visible:=True;
    if rxVentaxRuta.State in [dsInsert, dsEdit] then
    begin
      rxVentaxRutacodigo_prod.Value := StrToInt(edtCodProd.Text);
      rxVentaxRutaDescripcion.Value    := qryInventarioDESCRIPCION.Value;
    end;
  end;
end;

procedure TfrmCuadreXRuta.edtCantRegresoExit(Sender: TObject);
begin
  ///if rxVentaxRuta.State <> dsBrowse then exit;
{if dmCuadrexRuta.tblCuadreruta.Locate('RUTA;FECHA;CODIGO_EMP;CODIGO_PROD;FORMAPAGO',
       VarArrayOf([rxVentaxRutaruta.value,
                   rxVentaxRutafecha.Value,
                   rxVentaxRutacodigo_emp.Value,
                   rxVentaxRutacodigo_prod.Value,
                   rxVentaxRutaformapago.Value]), []) then
 begin

 end else
 begin  }
  if dmCuadrexRuta.qryBlcRuta.Locate('CODIGO_TEXTO',edtCodProd.Text,[]) then
  begin
    if rxVentaxRuta.state = dsBrowse then
    begin
      rxVentaxRuta.Insert;
      rxVentaxRutaCodigoCliente.Value  := 0;
      //t edtCodCte.ValueInteger:= 0;
      rxVentaxRutaformaPago.Value:=0;//cuadre
      rxVentaxRutacodigo_emp.Value     := dmcuadrexruta.qryDatosEmpleadoCODIGO_EMP.Value;
      rxVentaxRutaRuta.Value           := StrtoInt(edit1.Text);
      rxVentaxRutaDescripcion.Value    := qryInventarioDESCRIPCION.Value;
      rxVentaxRutafecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
      rxVentaxRutacodigo_prod.Value    := StrToInt(edtCodProd.Text);
      rxVentaxRutanombre_vendedor.Value:= dmcuadrexruta.qryDatosEmpleadoNOMBRECOMPLETO.Value;
      //rxVentaxRutacantidad.Value       := edtCantVenta.ValueFloat;
      rxVentaxRutaCantSalida.Value     := dmCuadrexRuta.qryBlcRutaBALANCE_ACT.Value;
      //t rxVentaxRutaCantRegreso.Value    := edtCantRegreso.ValueFloat;
      rxVentaxRutacantidad.Value       := rxVentaxRutaCantSalida.Value - rxVentaxRutaCantRegreso.Value;
      if rxVentaxRutacantidad.Value = 0 then
      rxVentaxRutaformaPago.Value:=0;//cuadre
      rxVentaxRutaprecio.Value         := dmCuadrexRuta.qryBlcRutaPRECIO.Value;
      rxVentaxRutamonto.Value          := dmCuadrexRuta.qryBlcRutaPRECIO.Value * rxVentaxRutacantidad.Value;
      rxVentaxRutaValorTotal.Value     := rxVentaxRutamonto.Value -
      (rxVentaxRutamonto.Value * rxVentaxRutadescuento.Value/100);
    end else
    begin
      if rxVentaxRuta.State = dsbrowse then
      rxVentaxRuta.Edit;
      //rxVentaxRutacantidad.Value       := edtCantVenta.ValueFloat;
      rxVentaxRutaCantSalida.Value     := dmCuadrexRuta.qryBlcRutaBALANCE_ACT.Value;
      //if rxVentaxRutaformaPago.Value <> 5 then
      //begin
        //t rxVentaxRutaCantRegreso.Value     := edtCantRegreso.ValueFloat;
        rxVentaxRutacantidad.Value       := rxVentaxRutaCantSalida.Value - rxVentaxRutaCantRegreso.Value;
     // end else rxVentaxRutaCantRegreso.Value:= 0;
      rxVentaxRutaprecio.Value         := dmCuadrexRuta.qryBlcRutaPRECIO.Value;
      rxVentaxRutamonto.Value          := dmCuadrexRuta.qryBlcRutaPRECIO.Value * rxVentaxRutacantidad.Value;
      rxVentaxRutaValorTotal.Value     := rxVentaxRutamonto.Value -
      (rxVentaxRutamonto.Value * rxVentaxRutadescuento.Value/100);
    end;
  end;
 //end;
end;

procedure TfrmCuadreXRuta.edtCodCteExit(Sender: TObject);
begin
{  if not dmVentas.qryClientes.Locate('CODIGO_CTE',edtCodCte.ValueInteger,[]) then
   MessageDlg('Codigo no encontrado, verifique',mtInformation, [mbOK], 0)
  else if rxVentaxRuta.State in [dsEdit, dsInsert] then
  rxVentaxRutaCodigoCliente.Value:=edtCodCte.ValueInteger;}
end;

procedure TfrmCuadreXRuta.Sumar;
var
    Monto:Real;
begin
  rxVentaxRuta.First;
  rxVentaTotal.close;
  rxVentaTotal.open;
  rxVentaxRuta.DisableControls;
  While Not rxVentaxRuta.Eof do
  begin
    if rxVentaTotal.Locate('formaPago;origen',
                    VarArrayOf([rxVentaxRutaformaPago.Value,
                                rxVentaxRutaOrigen.Value]),[]) then
    begin
      rxVentaTotal.Edit;
      if rxVentaTotalorigen.Value = 1 then
      rxVentaTotalDebito.Value := rxVentaTotalDebito.Value + rxVentaxRutaValorTotal.Value
      else if rxVentaTotalorigen.Value = 2 then
      rxVentaTotalCredito.Value := rxVentaTotalCredito.Value + rxVentaxRutaValorTotal.Value;
      rxVentaTotal.Post;
    end else
    begin
      rxVentaTotal.Insert;
      if rxVentaxRutaOrigen.Value = 1 then
      rxVentaTotalDebito.Value   := rxVentaxRutaValorTotal.Value
      else if rxVentaxRutaOrigen.Value = 2 then
      rxVentaTotalCredito.Value   := rxVentaxRutaValorTotal.Value;
      rxVentaTotalOrigen.Value    := rxVentaxRutaOrigen.Value;
      rxVentaTotalFormaPago.Value := rxVentaxRutaformaPago.Value;
      rxVentaTotalDescFPago.Value := dmVentas.TblFormaPagoDESCRIPCION.Value;
      rxVentaTotal.Post;
    end;
    rxVentaxRuta.Next;
  end;
  rxVentaTotal.First;
  Monto := 0;
  While Not rxVentaTotal.Eof Do
  begin
    Monto:=Monto + rxVentaTotalCredito.Value;
    rxVentaTotal.Next;
  end;
  rxVentaxRuta.EnableControls;
  rxVentaTotal.Last;
  rxVentaTotal.Insert;
  rxVentaTotalDescFPago.Value := 'Total';
  rxVentaTotalmonto.Value := Monto;
  rxVentaTotalDiferencia.Value:= Monto - dmcuadrexruta.qryDetalleCuadreRutaTotal.Value;
  rxVentaTotal.Post;
  RxCalculator1.Value:= Monto;
  rxVentaTotal.SortOnFields('formaPago',True,True);
end;

procedure TfrmCuadreXRuta.DBEdit11Exit(Sender: TObject);
begin
  if rxVentaxRuta.state in [dsedit, dsinsert] then
  begin
    rxVentaxRutaValorTotal.Value     := rxVentaxRutamonto.Value -
   (rxVentaxRutamonto.Value * rxVentaxRutadescuento.Value/100);
  end;
end;

procedure TfrmCuadreXRuta.BitBtn3Click(Sender: TObject);
begin
  Sumar;
  BitBtn2Click(Self);
end;

procedure TfrmCuadreXRuta.BitBtn4Click(Sender: TObject);
begin
  if rxVentaxRuta.State In [dsEdit, dsInsert] then
  rxVentaxRuta.Cancel else rxVentaxRuta.Delete;
end;

procedure TfrmCuadreXRuta.RxDBLookupCombo1Exit(Sender: TObject);
begin
  //edtCodCte.ValueInteger:=dmVentas.qryClientesCODIGO_CTE.Value;
end;

procedure TfrmCuadreXRuta.BitBtn1Click(Sender: TObject);
var
   fPagoAuxi : Smallint;
   Cont : Integer;
begin
  dmCuadrexRuta.tblCuadreruta.Close;
  dmCuadrexRuta.tblCuadreruta.Params[0].Value:= ExtraerFecha(rxVentaxRutafecha.Value);
  dmCuadrexRuta.tblCuadreruta.Params[1].Value:= rxVentaxRutaRuta.Value;
  dmCuadrexRuta.tblCuadreruta.Open;
  if dmCuadrexRuta.tblCuadreruta.state = dsBrowse then
  begin
    if dmCuadrexRuta.tblCuadreruta.Locate('RUTA;FECHA;CODIGO_EMP;CODIGO_PROD;FORMAPAGO',
       VarArrayOf([rxVentaxRutaruta.Value,
                   ExtraerFecha(rxVentaxRutafecha.Value),
                   rxVentaxRutaCodigo_emp.Value,
                   rxVentaxRutaCodigo_prod.AsString,
                   rxVentaxRutaFormapago.Value]), []) then
    begin
      MessageDlg('Cuadre ya fue procesado',mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  EsCuadre:=True;
  rxVentaxRuta.SortOnFields('FormaPago',True,True);

  cont:=0;
  if rxVentaxRuta.RecordCount > 0 then
  begin
    rxVentaxRuta.First;  
    While Not rxVentaxRuta.Eof do
    begin
      if rxVentaxRutacantidad.Value > 0 then
      begin
      if (Cont = 0) then
      FPagoAuxi := rxVentaxRutaformaPago.Value;

      if (FpagoAuxi<>rxVentaxRutaformaPago.Value) then
      begin
        FPagoAuxi:=rxVentaxRutaformaPago.Value;
        Cont:=0;
      end;
      if (Cont = 0) then
      begin
        dmVentas.tblVentasMast.Insert;
        dmVentas.tblVentasMastCODIGO_CTE.Value := rxVentaxRutaCodigoCliente.Value;
        dmVentas.tblVentasMastFECHA.Value      := ExtraerFecha(rxVentaxRutaFecha.Value);
        dmVentas.tblVentasMastSTATUS.Value:='A';
        dmVentas.tblVentasMastMONEDA.Value:='1';
        dmventas.tblVentasMastFORMA_PAGO.Value:=0;
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
      end;
      Inc(cont);
      dmVentas.tblVentasDetalle.Insert;
      dmVentas.tblVentasDetalleNUMERO.Value       := dmVentas.tblVentasMastNUMERO.Value;
      dmVentas.tblVentasDetalleCODIGO_PROD.Value := rxVentaxRutacodigo_prod.AsString;
      dmVentas.tblVentasDetalleDESCRIPCION.Value  := rxVentaxRutaDescripcion.Value;
      dmVentas.tblVentasDetalleCANTIDAD.Value     := rxVentaxRutacantidad.Value;
      dmVentas.tblVentasDetallePRECIO.Value       := rxVentaxRutaPrecio.Value;
      dmVentas.tblVentasDetallePORC_DESC_DET.Value:= rxVentaxRutadescuento.Value;
      dmVentas.tblVentasDetalleITBI_DET.Value     := rxVentaxRutaitbi.Value;
      dmVentas.tblVentasDetalleVALOR_SERVICIO_DET.Value:=rxVentaxRutamonto.Value;
      dmVentas.tblVentasDetalleVALOR_TOTAL_DET.Value   :=rxVentaxRutaValorTotal.Value;
      dmVentas.tblVentasDetalleIN_POR.Value  := StrUserName;
      dmVentas.tblVentasDetalleFECHA_IN.Value:= Now;
      dmVentas.tblVentasDetalleSTATUS_DET.Value:='A';
      dmVentas.tblVentasDetalle.Post;
      dmVentas.tblVentasDetalle.ApplyUpdates;
      if Not dmVentas.tblVentasDetalle.Transaction.InTransaction then
      dmVentas.tblVentasDetalle.Transaction.StartTransaction;
      try
        dmVentas.tblVentasDetalle.Transaction.CommitRetaining;
      except
      dmVentas.tblVentasDetalle.Transaction.RollbackRetaining;
      end;
      frmProcesarVentas.SumarDetalle;
      end;
      GuardarCuadreCaja;
      rxVentaxRuta.Next;
    end;
  end;
  dmCuadrexRuta.tblCuadreruta.ApplyUpdates;
  if Not dmCuadrexRuta.tblCuadreruta.Transaction.InTransaction then
  dmCuadrexRuta.tblCuadreruta.Transaction.StartTransaction;
  try
   dmCuadrexRuta.tblCuadreruta.Transaction.CommitRetaining;
  except
  dmCuadrexRuta.tblCuadreruta.Transaction.RollbackRetaining;
  end;
  GrabarEnDespacho;
  PostearBalanceRuta;
  {frmProcesarVentas:=TfrmProcesarVentas.Create(nil);
  try
    PostearCuadre;
    //FrmProcesarVentas.ShowModal;
  finally
  frmProcesarVentas.Free;
  frmProcesarVentas:=Nil;}
  EsCuadre:=False;
  //end;
  dmVentas.qryClientes.locate('CODIGO_CTE',dmCuadrexRuta.tblCuadrerutaCODIGOCLIENTE.Value,[]);
    {qckFacturaCuadre:=tqckFacturaCuadre.Create(nil);
    try
      qckFacturaCuadre.Preview;
    finally
    qckFacturaCuadre.free;
    qckFacturaCuadre:=nil;
    end;}
  dmcuadrexruta.qryDetalleCuadreRuta.close;
  dmcuadrexruta.qryDetalleCuadreRuta.Params[0].Value:=rxVentaxRutaRUTA.Value;
  dmcuadrexruta.qryDetalleCuadreRuta.Params[1].Value:=ExtraerFecha(rxVentaxRutaFECHA.Value);
  dmcuadrexruta.qryDetalleCuadreRuta.Params[2].Value:=rxVentaxRutaCODIGO_EMP.Value;
  dmcuadrexruta.qryDetalleCuadreRuta.Open;
  BitBtn9Click(Self);    
end;

procedure TfrmCuadreXRuta.BitBtn6Click(Sender: TObject);
begin
  if rxVentaxRuta.State in [dsEdit, dsInsert] then
  rxVentaxRuta.Cancel else
  begin
    if MessageDlg('Limpiar Datos?',mtInformation, [mbyes,mbno], 0) = mrYes then
    btnLimpiarDatosClick(Self);
  end;
end;

procedure TfrmCuadreXRuta.BitBtn5Click(Sender: TObject);
begin
  {if edit1.Text = '' then
  begin
    MessageDlg('Falta Codigo Ruta',mtInformation, [mbOK], 0);
    edit1.SetFocus;
  end;

  if edtCodProd.Text= '' then
  begin
    MessageDlg('Falta codigo producto',mtInformation, [mbOK], 0);
    edtCodProd.SetFocus;
  end;}
  if rxVentaxRuta.State in [dsBrowse] then
  begin
    rxVentaxRuta.Insert;
    rxVentaxRutafecha.Value:=ExtraerFecha(GlbFechaTrnDiaria);
    rxVentaxRutaformaPago.Value:=0;//cuadre
    edit1.SetFocus;
  end;
end;

procedure TfrmCuadreXRuta.PostearCuadre;
begin
  dmVentas.tblVentasMast.First;
  While Not dmVentas.tblVentasMast.Eof do
  begin
    if dmVentas.tblVentasMastSTATUS.Value = 'A' then
    begin
      case dmVentas.tblVentasMastFORMA_PAGO.Value of
         0 : Begin //Considerado como efectivo
               frmProcesarVentas.ProcesaVenta(1,True);
               dmVentas.tblVentasMast.Edit;
               dmVentas.tblVentasMastSTATUS.Value := 'P';
               frmProcesarVentas.Guardar;
             end;
      end;
    end;
    dmVentas.tblVentasMast.Next;
  end;
end;

procedure TfrmCuadreXRuta.PostearBalanceRuta;
var
  suma : Real;
begin
  dmDespacho.tblDespachoDet.DisableControls;
  dmDespacho.tblDespachoDet.First;
  While Not dmDespacho.tblDespachoDet.Eof do
  begin
    Suma := Suma + dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value;
    dmDespacho.tblDespachoDet.Next;
  end;
  dmDespacho.tblDespachoDet.EnableControls;
  dmDespacho.tblDespachoMaster.Edit;
  dmDespacho.tblDespachoMasterMONTO_TOTAL.Value:=Suma;
  dmdespacho.tblDespachoMasterTIPO_TRN.Value:=0;
  frmProcesarDespachoVendedores.Guardar;
  if dmDespacho.qryBalanceDespacho.State = dsInactive then
  begin
    dmDespacho.qryBalanceDespacho.close;
    dmDespacho.qryBalanceDespacho.open;
  end;

  rxVentaxRuta.First;
  While not rxVentaxRuta.Eof do
  begin
    if dmDespacho.qryBalanceDespacho.Locate('CODIGO_EMP;CODIGO_RUTA;CODIGO_PRODUCTO',
                  VarArrayOf([rxVentaxRutaCODIGO_EMP.Value,
                             rxVentaxRutaruta.Value,
                             rxVentaxRutacodigo_prod_inv.Value]),[]) then
    begin
      dmDespacho.qryBalanceDespacho.Edit;
      dmDespacho.qryBalanceDespachoFECHA_BCE.Value  :=rxVentaxRutaFECHA.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ANT.Value:=dmDespacho.qryBalanceDespachoBALANCE_ACT.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ACT.Value:=
      (dmDespacho.qryBalanceDespachoBALANCE_ACT.Value + rxVentaxRutarecarga.Value)
                                                      - rxVentaxRutacantidad.Value;

      dmDespacho.qryBalanceDespachoCREDITO_MES.Value:=dmDespacho.qryBalanceDespachoCREDITO_MES.Value +
                                                      rxVentaxRutaCANTIDAD.Value+
                                                      rxVentaxRutaRECARGA.Value;
      dmDespacho.qryBalanceDespachoCREDITO_ACM.Value:=dmDespacho.qryBalanceDespachoCREDITO_ACM.Value +
                                                      rxVentaxRutaCANTIDAD.Value+
                                                      rxVentaxRutaRECARGA.Value;
      dmDespacho.qryBalanceDespacho.Post;
      dmDespacho.qryBalanceDespacho.ApplyUpdates;
      if Not dmDespacho.qryBalanceDespacho.Transaction.InTransaction Then
      dmDespacho.qryBalanceDespacho.Transaction.StartTransaction;
      try
        dmDespacho.qryBalanceDespacho.Transaction.CommitRetaining;
      except
      dmDespacho.qryBalanceDespacho.Transaction.RollbackRetaining;
      end;
      if rxVentaxRutarecarga.Value > 0 then //disminuir inventario
      ActualizaInventarioRecarga;
    end else
    begin
      dmDespacho.qryBalanceDespacho.Insert;
      dmDespacho.qryBalanceDespachoCODIGO_PRODUCTO.Value:= rxVentaxRutaCODIGO_PROD.Value;
      dmDespacho.qryBalanceDespachoCODIGO_EMP.Value     := rxVentaxRutaCODIGO_EMP.Value;
      dmDespacho.qryBalanceDespachoCODIGO_RUTA.Value    := rxVentaxRutaRUTA.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ACT.Value    := - rxVentaxRutaCANTIDAD.Value + rxVentaxRutaRECARGA.Value;
      dmDespacho.qryBalanceDespachoCREDITO_MES.Value    := rxVentaxRutaCANTIDAD.Value   + rxVentaxRutaRECARGA.Value;
      dmDespacho.qryBalanceDespachoCREDITO_ACM.Value    := rxVentaxRutaCANTIDAD.Value   + rxVentaxRutaRECARGA.Value;
      dmDespacho.qryBalanceDespachoSTATUS_BCE.Value     := 'A';
      dmDespacho.qryBalanceDespachoFECHA_BCE.Value      := rxVentaxRutafecha.Value;
      dmDespacho.qryBalanceDespachoFECHA_IN.Value  :=Now;
      dmDespacho.qryBalanceDespachoIN_POR.Value    :=StrUserName;
      dmDespacho.qryBalanceDespacho.Post;
      dmDespacho.qryBalanceDespacho.ApplyUpdates;
      if Not dmDespacho.qryBalanceDespacho.Transaction.InTransaction Then
      dmDespacho.qryBalanceDespacho.Transaction.StartTransaction;
      try
        dmDespacho.qryBalanceDespacho.Transaction.CommitRetaining;
      except
      dmDespacho.qryBalanceDespacho.Transaction.RollbackRetaining;
      end;
    end;
    rxVentaxRuta.Next;
  end;
end;

procedure TfrmCuadreXRuta.GrabarEnDespacho;
var
   fPagoAuxi : Smallint;
   suma:Real;
begin
  suma:=0;
  dmDespacho.tblDespachoMaster.Close;
  dmDespacho.tblDespachoMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmDespacho.tblDespachoMaster.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmDespacho.tblDespachoMaster.Open;
  rxVentaxRuta.First;
  if rxVentaxRuta.RecordCount > 0 then
  begin
    dmdespacho.tblDespachoMaster.Insert;
    dmdespacho.tblDespachoMasterCODIGO_EMP.Value := rxVentaxRutacodigo_emp.Value;
    dmdespacho.tblDespachoMasterFECHA.Value      := ExtraerFecha(rxVentaxRutaFecha.Value);
    dmdespacho.tblDespachoMasterSTATUS.Value     := 'P';
    dmdespacho.tblDespachoMasterCODIGO_DESPACHADOR.Value := VarUsuarioGlb;
    dmdespacho.tblDespachoMasterCODIGO_RUTA.Value:= rxVentaxRutaruta.Value;
    dmdespacho.tblDespachoMaster.Post;
    dmdespacho.tblDespachoMaster.ApplyUpdates;
    if Not dmdespacho.tblDespachoMaster.Transaction.InTransaction then
    dmdespacho.tblDespachoMaster.Transaction.StartTransaction;
    try
      dmdespacho.tblDespachoMaster.Transaction.CommitRetaining;
    except
    dmdespacho.tblDespachoMaster.Transaction.RollbackRetaining;
    end;
    While Not rxVentaxRuta.Eof do
    begin
      if rxVentaxRutacantidad.Value > 0 then
      begin
      dmDespacho.tblDespachoDet.Insert;
      dmDespacho.tblDespachoDetNUMERO.Value       := dmDespacho.tblDespachoMasterNUMERO.Value;
      dmDespacho.tblDespachoDetCODIGO_PROD.Value  := rxVentaxRutacodigo_prod_inv.Value;
      dmDespacho.tblDespachoDetDESCRIPCION.Value  := rxVentaxRutaDESCRIPCION.Value;
      dmDespacho.tblDespachoDetCANTIDAD.Value     := rxVentaxRutacantidad.Value;
      dmDespacho.tblDespachoDetPRECIO.Value       := rxVentaxRutaPrecio.Value;
      dmDespacho.tblDespachoDetPORC_DESC_DET.Value:= rxVentaxRutadescuento.Value;
      dmDespacho.tblDespachoDetITBI_DET.Value     := rxVentaxRutaitbi.Value;
      dmDespacho.tblDespachoDetVALOR_BRUTO.Value:=rxVentaxRutamonto.Value;
      dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value   :=rxVentaxRutaValorTotal.Value;
      dmDespacho.tblDespachoDetRECARGA.Value := rxVentaxRutarecarga.Value;
      Suma:=Suma + dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value;
      dmDespacho.tblDespachoDetIN_POR.Value  := StrUserName;
      dmDespacho.tblDespachoDetFECHA_IN.Value:= Now;
      dmDespacho.tblDespachoDetSTATUS_DET.Value:='A';
      dmDespacho.tblDespachoDet.Post;
      dmDespacho.tblDespachoDet.ApplyUpdates;
      if Not dmDespacho.tblDespachoDet.Transaction.InTransaction then
      dmDespacho.tblDespachoDet.Transaction.StartTransaction;
      try
        dmDespacho.tblDespachoDet.Transaction.CommitRetaining;
      except
      dmDespacho.tblDespachoDet.Transaction.RollbackRetaining;
      end;
      end;
      rxVentaxRuta.Next;
    end;
    if suma > 0 then
    begin
      dmdespacho.tblDespachoMaster.Edit;
      dmdespacho.tblDespachoMasterMONTO_TOTAL.Value:=suma;
      dmdespacho.tblDespachoMasterSTATUS.Value:='P';
      dmdespacho.tblDespachoMaster.Post;
      dmdespacho.tblDespachoMaster.ApplyUpdates;
      if Not dmdespacho.tblDespachoMaster.Transaction.InTransaction then
      dmdespacho.tblDespachoMaster.Transaction.StartTransaction;
      try
        dmdespacho.tblDespachoMaster.Transaction.CommitRetaining;
      except
      dmdespacho.tblDespachoMaster.Transaction.RollbackRetaining;
      end;      
    end;
  end;
end;

procedure TfrmCuadreXRuta.GuardarCuadreCaja;
begin
if not dmCuadrexRuta.tblCuadreruta.Locate('RUTA;FECHA;CODIGO_EMP;CODIGO_PROD;FORMAPAGO',
       VarArrayOf([rxVentaxRutaruta.value,
                   ExtraerFecha(rxVentaxRutafecha.Value),
                   rxVentaxRutacodigo_emp.Value,
                   rxVentaxRutacodigo_prod.Value,
                   rxVentaxRutaformapago.Value]), []) then
  dmCuadrexRuta.tblCuadreruta.InsertRecord([rxVentaxRutaRUTA.Value,
                                            Extraerfecha(rxVentaxRutaFECHA.Value),
                                            rxVentaxRutaCODIGO_EMP.Value,
                                            rxVentaxRutaCODIGO_PROD.Value,
                                            rxVentaxRutaFORMAPAGO.Value,
                                            rxVentaxRutaNOMBRE_VENDEDOR.Value,
                                            rxVentaxRutaCANTSALIDA.Value,
                                            rxVentaxRutaCANTREGRESO.Value,
                                            rxVentaxRutaRECARGA.Value,
                                            rxVentaxRutaCANTIDAD.Value,
                                            rxVentaxRutaPRECIO.Value,
                                            rxVentaxRutaMONTO.Value,
                                            rxVentaxRutaDESCUENTO.Value,
                                            rxVentaxRutaITBI.Value,
                                            rxVentaxRutaNUMERODOC.Value,
                                            rxVentaxRutaDESCRIPCION.Value,
                                            rxVentaxRutaVALORTOTAL.Value,
                                            rxVentaxRutaCODIGOCLIENTE.Value,
                                            rxVentaxRutaORIGEN.Value,
                                            NULL]);                                            
end;

procedure TfrmCuadreXRuta.RxDBGrid2CellClick(Column: TColumn);
begin
  edtCodProd.Text:= dmCuadrexRuta.tblCuadrerutaCODIGO_PROD.Value;
end;

procedure TfrmCuadreXRuta.BitBtn8Click(Sender: TObject);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsedit, dsinsert] then
  begin
    dmcuadrexruta.qryDetalleCuadreRuta.Post;
    dmcuadrexruta.qryDetalleCuadreRuta.ApplyUpdates;
    if not dmcuadrexruta.qryDetalleCuadreRuta.Transaction.InTransaction then
    dmcuadrexruta.qryDetalleCuadreRuta.Transaction.StartTransaction;
    try
      dmcuadrexruta.qryDetalleCuadreRuta.Transaction.CommitRetaining;
    except
    dmcuadrexruta.qryDetalleCuadreRuta.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCuadreXRuta.BitBtn10Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblCuadreruta.state = dsBrowse then
  dmCuadrexRuta.tblCuadreruta.Edit;
end;

procedure TfrmCuadreXRuta.BitBtn11Click(Sender: TObject);
begin
 if dmCuadrexRuta.tblCuadreruta.state in [dsInsert,dsEdit] then
 begin
  dmCuadrexRuta.tblCuadreruta.Post;
  dmCuadrexRuta.tblCuadreruta.ApplyUpdates;
  if Not dmCuadrexRuta.tblCuadreruta.Transaction.InTransaction then
    dmCuadrexRuta.tblCuadreruta.Transaction.StartTransaction;
  try
    dmCuadrexRuta.tblCuadreruta.Transaction.CommitRetaining;
  except
  dmCuadrexRuta.tblCuadreruta.Transaction.RollbackRetaining;
  end;
 end;
end;


procedure TfrmCuadreXRuta.BitBtn9Click(Sender: TObject);
begin
  if rxVentaxRutaruta.IsNull then exit;
  if dmcuadrexruta.qryDetalleCuadreRuta.RecordCount = 0 then
  begin
    dmcuadrexruta.qryDetalleCuadreRuta.Insert;
    dmcuadrexruta.qryDetalleCuadreRutaRUTA.Value:=rxVentaxRutaruta.Value;
    dmcuadrexruta.qryDetalleCuadreRutaFECHA.Value:= rxVentaxRutafecha.Value;
    dmcuadrexruta.qryDetalleCuadreRutaCODIGO_EMP.Value:= rxVentaxRutacodigo_emp.Value;
    ProcDetalleReporte;    
    //DBEdit3.SetFocus;
  end;
end;

procedure TfrmCuadreXRuta.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TfrmCuadreXRuta.BitBtn12Click(Sender: TObject);
begin
if dmCuadrexRuta.tblCuadreruta.state = dsBrowse then
 begin
  dmCuadrexRuta.tblCuadreruta.close;
  dmCuadrexRuta.tblCuadreruta.open;
 end;
end;

procedure TfrmCuadreXRuta.BitBtn13Click(Sender: TObject);
begin
  if edit1.Text = '' then
  begin
    MessageDlg('Favor de indicar la ruta',mtInformation, [mbOK], 0);
    edit1.SetFocus;
  end;
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
     frmselfecha.FechaIni.Date:=GlbFechaTrnDiaria;
     frmselfecha.FechaFin.Date:=GlbFechaTrnDiaria;
  if frmselfecha.ShowModal = mrok then
  begin
  dmCuadrexRuta.tblCuadreruta.Close;
  dmCuadrexRuta.tblCuadreruta.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.date);
  dmCuadrexRuta.tblCuadreruta.Params[1].Value:= StrToInt(edit1.Text);
  dmCuadrexRuta.tblCuadreruta.Open;
  if dmUsuarios.qryUsuarios.state = dsInactive then
  dmUsuarios.qryUsuarios.Open;
  If not dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]) then
  MessageDlg('Usuario logueado debe salir del sistema',mtInformation, [mbOK], 0);
  qckReporteCuadreDiario:=TqckReporteCuadreDiario.create(Nil);
  try
  qckReporteCuadreDiario.Preview;
  finally
  qckReporteCuadreDiario.Free;
  qckReporteCuadreDiario:=Nil;
  end;
  end;
  finally
  frmselfecha.free;
  frmselfecha:=nil
  end;
end;

procedure TfrmCuadreXRuta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin      //F4
  if key = 115 then BitBtn1Click(Self)
  else     //F5
  if key = 116 then BitBtn7Click(Self);
end;

procedure TfrmCuadreXRuta.BitBtn14Click(Sender: TObject);
begin
  if rxVentaxRuta.RecordCount > 0 then
  begin
    MessageDlg('Para realizar este proceso debe limpiar los datos.',mtInformation, [mbOK], 0);
    exit;
  end;
    dmCuadrexRuta.qryCargarDatosCuadreRuta.Close;
    dmCuadrexRuta.qryCargarDatosCuadreRuta.Params[0].Value:= EdtNumRuta.ValueInteger;
    dmCuadrexRuta.qryCargarDatosCuadreRuta.Open;
    dmCuadrexRuta.qryCargarDatosCuadreRuta.DisableControls;


    frmSelFecha:=TfrmSelFecha.Create(Nil);
    frmSelFecha.Caption:='Entre fecha del cuadre';
    frmSelFecha.FechaIni.Date    :=ExtraerFecha(GlbFechaTrnDiaria);
    frmSelFecha.FechaFin.Visible := False;
    if frmSelFecha.ShowModal = mrOk then
    begin
      dmCuadrexRuta.tblCuadreruta.Close;
      dmCuadrexRuta.tblCuadreruta.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.date);
      dmCuadrexRuta.tblCuadreruta.Params[1].Value:= EdtNumRuta.ValueInteger;
      dmCuadrexRuta.tblCuadreruta.Open;
    end;
    
  rxVentaxRuta.DisableControls;
  dmCuadrexRuta.qryCargarDatosCuadreRuta.First;  
  while not dmcuadrexruta.qryCargarDatosCuadreRuta.Eof do
  begin
    rxVentaxRuta.Insert;
    rxVentaxRutaruta.Value           := edtNumRuta.ValueInteger;
    rxVentaxRutacodigo_prod_inv.Value:= dmcuadrexruta.qryCargarDatosCuadreRutaCODIGO_PROD_INV.value;
    rxVentaxRutacodigo_emp.Value     := dmCuadrexRuta.qryCargarDatosCuadreRutaCODIGO_EMP.Value;
    rxVentaxRutacodigo_prod.Value    := dmCuadrexRuta.qryCargarDatosCuadreRutaCODIGO_TEXTO.AsInteger;
    rxVentaxRutanombre_vendedor.Value:= dmCuadrexRuta.qryCargarDatosCuadreRutaNOMBREEMPLEADO.Value;
    rxVentaxRutaprecio.Value         := dmCuadrexRuta.qryCargarDatosCuadreRutaPRECIO.Value;
    rxVentaxRutaformaPago.Value      := 0;
    rxVentaxRutaDescripcion.Value    := dmCuadrexRuta.qryCargarDatosCuadreRutaDESCRIPCION.Value;
    rxVentaxRutaCodigoCliente.Value  := 0;
    rxVentaxRutafecha.Value     :=      ExtraerFecha(GlbFechaTrnDiaria);
    rxVentaxRutaOrigen.Value    :=      2;//Credito
    rxVentaxRutaCantSalida.Value:=      dmCuadrexRuta.qryCargarDatosCuadreRutaBALANCE_ACT.Value;
    if dmCuadrexRuta.tblCuadreruta.Locate('CODIGO_PROD',dmCuadrexRuta.qryCargarDatosCuadreRutaCODIGO_TEXTO.Value,[]) then
    begin
      rxVentaxRutaCantRegreso.Value:= dmCuadrexRuta.tblCuadrerutaCANTREGRESO.Value;
      rxVentaxRutaCantSalida.Value := dmCuadrexRuta.tblCuadrerutaCANTSALIDA.Value;
      rxVentaxRutaruta.Value       := dmCuadrexRuta.tblCuadrerutaRUTA.Value;
      rxVentaxRutarecarga.Value    := dmCuadrexRuta.tblCuadrerutaRECARGA.Value;
    end;
    rxVentaxRuta.Post;
    dmcuadrexruta.qryCargarDatosCuadreRuta.Next;
  end;
  rxVentaxRuta.SortOnFields('codigo_prod_inv',True,False);
  rxVentaxRuta.EnableControls;
  dmCuadrexRuta.qryCargarDatosCuadreRuta.EnableControls;
end;

procedure TfrmCuadreXRuta.btnLimpiarDatosClick(Sender: TObject);
begin
  if MessageDlg('Proceder a limpiar los datos?',mtInformation, [mbno, mbyes], 0) = mryes then
  begin
    rxVentaxRuta.Close;
    rxVentaxRuta.Open;
    rxVentaTotal.close;
    rxVentaTotal.Open;
  end;
end;

procedure TfrmCuadreXRuta.rxVentaxRutaBeforePost(DataSet: TDataSet);
begin
  rxVentaxRutacantidad.Value:=
  rxVentaxRutaCantSalida.Value - rxVentaxRutaCantRegreso.Value;
  rxVentaxRutamonto.Value   := rxVentaxRutaPRECIO.Value * rxVentaxRutacantidad.Value;
      rxVentaxRutaValorTotal.Value := rxVentaxRutamonto.Value -
      (rxVentaxRutamonto.Value * rxVentaxRutadescuento.Value/100);
end;

procedure TfrmCuadreXRuta.CuadreVendedor1Click(Sender: TObject);
var
  r : Integer;
begin
  r:= StrToInt(InputBox('Re-impresion de cuadre','Entre numero ruta',''));
  dmCuadrexRuta.tblCuadreruta.Close;
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaFin.Visible:=False;
    label2.Visible:=False;
    label1.Caption:='Seleccione Fecha Cuadre';
  if frmSelFecha.ShowModal = mrOk then
  begin
    dmCuadrexRuta.tblCuadreruta.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.date);
    dmCuadrexRuta.tblCuadreruta.Params[1].Value:= r;
    dmCuadrexRuta.tblCuadreruta.Open;

    qckFacturaCuadre:=tqckFacturaCuadre.Create(nil);
    try
      qckFacturaCuadre.Preview;
    finally
    qckFacturaCuadre.free;
    qckFacturaCuadre:=Nil;
    end;
  end;
  finally
  frmSelFecha.free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmCuadreXRuta.ReImprimirCuadre1Click(Sender: TObject);
//var
 // r : Integer;
begin
{  r:= StrToInt(InputBox('Re-impresion de reporte diario','Entre numero ruta',''));
  dmCuadrexRuta.tblCuadreruta.Close;
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    frmSelFecha.FechaFin.Visible:=False;
    frmSelFecha.Fechaini.Date:=ExtraerFecha(glbfechatrndiaria);
    label2.Visible := False;
    label1.Caption := 'Seleccione Fecha Cuadre';
  if frmSelFecha.ShowModal = mrOk then
  begin
    dmCuadrexRuta.tblCuadreruta.Params[0].Value:= ExtraerFecha(frmSelFecha.FechaIni.date);
    dmCuadrexRuta.tblCuadreruta.Params[1].Value:= r;
    dmCuadrexRuta.tblCuadreruta.Open;  }
    BitBtn13Click(Self);
 { end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;}
end;

procedure TfrmCuadreXRuta.TabSheet3Show(Sender: TObject);
begin
  edtnumruta.Text:=edit1.Text;
end;

procedure TfrmCuadreXRuta.BitBtn7Click(Sender: TObject);
begin
  BitBtn14Click(Self);
end;

procedure TfrmCuadreXRuta.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Hay una transaccion pendiente, Cancelar',mtInformation, [mbyes, mbno], 0) = mryes then
    begin
    dmcuadrexruta.qryDetalleCuadreRuta.Cancel;
    CanClose := False;    
    end else
    CanClose := True;
  end else CanClose := True;
end;

procedure TfrmCuadreXRuta.rxCalcularClick(Sender: TObject);
begin
  if RxCalculator1.Execute then
  RxCalculator1.Value:=rxVentaTotalMonto.Value -

  (dmcuadrexruta.qryDetalleCuadreRutaDieta.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCHEQUE.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_DIRECTO.Value +
  dmcuadrexruta.qryDetalleCuadreRutaEFECTIVO.Value        +
  dmcuadrexruta.qryDetalleCuadreRutaCREDITO_NORMAL.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaCOMBUSTIBLE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaREP_CAMION.Value  +
  dmcuadrexruta.qryDetalleCuadreRutaAJUSTE.Value +
  dmcuadrexruta.qryDetalleCuadreRutaPROMOCION.Value);

end;

procedure TfrmCuadreXRuta.ActualizaInventarioRecarga;
begin
  dmDespacho.IBStoredProc1.Params[0].Value:=rxVentaxRutacodigo_prod_inv.Value;
  dmDespacho.IBStoredProc1.Params[1].Value:=rxVentaxRutaReCarga.Value;
  dmDespacho.IBStoredProc1.Params[2].Value:=0;//disminuir inventario
  dmDespacho.IBStoredProc1.Params[3].Value:=1;
  dmDespacho.IBStoredProc1.ExecProc;
  if not dmDespacho.IBStoredProc1.Transaction.InTransaction then
  dmDespacho.IBStoredProc1.Transaction.StartTransaction;
  try
    dmDespacho.IBStoredProc1.Transaction.CommitRetaining;
  except
  dmDespacho.IBStoredProc1.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmCuadreXRuta.Prestamos1Click(Sender: TObject);
begin
 frmPrestamos:=TfrmPrestamos.Create(Nil);
  try
    frmPrestamos.Showmodal;
  finally
  frmPrestamos.Free;
  frmPrestamos:=Nil;
  end;
end;

procedure TfrmCuadreXRuta.Productos1Click(Sender: TObject);
begin
  frmProductosServ:=TfrmProductosServ.Create(Nil);
  try
    frmProductosServ.Showmodal;
  finally
  frmProductosServ.Free;
  frmProductosServ:=Nil;
  end;
end;

procedure TfrmCuadreXRuta.CostosGastos1Click(Sender: TObject);
begin
  frmRegTransOpeDiaria:=TfrmRegTransOpeDiaria.Create(Nil);
  try
    frmRegTransOpeDiaria.Showmodal;
  finally
  frmRegTransOpeDiaria.Free;
  frmRegTransOpeDiaria := Nil;
  end;
end;

procedure TfrmCuadreXRuta.Proveedores1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Nil);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
end;

procedure TfrmCuadreXRuta.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if rxVentaxRuta.State = dsBrowse then
  begin
    if (Key = VK_DOWN) or
       ( (Key = VK_TAB) and
       (RxDBGrid1.SelectedIndex = RxDBGrid1.Columns.Count-1) ) then
    begin
      with (Sender as TRxDBGrid).DataSource.DataSet do
      begin
        DisableControls;
        Next;
        if EOF then Key := 0 else rxVentaxRuta.Prior;
        EnableControls;
      end;
    end;
  end;
end;

procedure TfrmCuadreXRuta.CreditoNormal1Click(Sender: TObject);
begin
  frmTransaccionesCxc:=TfrmTransaccionesCxc.Create(Nil);
  try
    frmTransaccionesCxc.Showmodal;
  finally
  frmTransaccionesCxc.Free;
  frmTransaccionesCxc:=Nil;
  end;  
end;

procedure TfrmCuadreXRuta.BitBtn15Click(Sender: TObject);
begin
  if dmCuadrexRuta.tblCuadreruta.State = dsBrowse then
  begin
    dmCuadrexRuta.tblCuadreruta.Close;
    dmCuadrexRuta.tblCuadreruta.Open;
  end;
  frmValoresCuadreRuta:=TfrmValoresCuadreRuta.Create(Nil);
  try
    if frmValoresCuadreRuta.Showmodal = mrOk then
    begin
      if rxVentaTotal.State in [dsInactive] then rxVentaTotal.Open;
      if rxVentaTotal.RecordCount = 0 then BitBtn3Click(Self);
      if dmCuadrexRuta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
      begin
        if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsedit, dsinsert] then
        begin
          dmcuadrexruta.qryDetalleCuadreRuta.Post;
          dmcuadrexruta.qryDetalleCuadreRuta.ApplyUpdates;
          if not dmcuadrexruta.qryDetalleCuadreRuta.Transaction.InTransaction then
          dmcuadrexruta.qryDetalleCuadreRuta.Transaction.StartTransaction;
          try
            dmcuadrexruta.qryDetalleCuadreRuta.Transaction.CommitRetaining;
          except
          dmcuadrexruta.qryDetalleCuadreRuta.Transaction.RollbackRetaining;
         end;
      end;
      end;
      BitBtn3Click(Self);
    end;
  finally
  frmValoresCuadreRuta.Free;
  frmValoresCuadreRuta:=Nil;
  end;
end;

procedure TfrmCuadreXRuta.ProcDetalleReporte;
begin
  frmValoresCuadreRuta:=TfrmValoresCuadreRuta.Create(Nil);
  try
    if frmValoresCuadreRuta.Showmodal = mrOk then
    begin
      if dmCuadrexRuta.qryDetalleCuadreRuta.State in [dsEdit, dsInsert] then
      begin
        if dmcuadrexruta.qryDetalleCuadreRuta.State in [dsedit, dsinsert] then
        begin
          dmcuadrexruta.qryDetalleCuadreRuta.Post;
          dmcuadrexruta.qryDetalleCuadreRuta.ApplyUpdates;
          if not dmcuadrexruta.qryDetalleCuadreRuta.Transaction.InTransaction then
          dmcuadrexruta.qryDetalleCuadreRuta.Transaction.StartTransaction;
          try
            dmcuadrexruta.qryDetalleCuadreRuta.Transaction.CommitRetaining;
          except
          dmcuadrexruta.qryDetalleCuadreRuta.Transaction.RollbackRetaining;
         end;
      end;
      end;
    end;
  finally
  frmValoresCuadreRuta.Free;
  frmValoresCuadreRuta:=Nil;
  end;
end;

end.
