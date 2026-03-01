unit UProcesarVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  Buttons, rxToolEdit, RxLookup, RXCtrls, ImgList, DBActns, ActnList, Menus,
  ExtDlgs, RxMemDS, WinSkinData, RxCalc ;

type
  TfrmProcesarVentas = class(TForm)
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
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
    edtCodBarra: TEdit;
    Label17: TLabel;
    BitBtn1: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    Label1: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    DBStatusLabel2: TDBStatusLabel;
    BitBtn7: TBitBtn;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    ActionList1: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    DataSetLast1: TDataSetLast;
    ImageList1: TImageList;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    BitBtn13: TBitBtn;
    PopupMenu1: TPopupMenu;
    Ingresos1: TMenuItem;
    BitBtn14: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    Actualizar1: TMenuItem;
    Clientes1: TMenuItem;
    Ingresos2: TMenuItem;
    Cxc1: TMenuItem;
    BalanceClientes1: TMenuItem;
    DBImage1: TDBImage;
    DBImage2: TDBImage;
    Label19: TLabel;
    Consultar1: TMenuItem;
    RxLabel1: TRxLabel;
    CheckBox1: TCheckBox;
    Image1: TImage;
    ImprimirRecibo1: TMenuItem;
    DBEdit7: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    rxDatosDev: TRxMemoryData;
    rxDatosDevnumero: TIntegerField;
    rxDatosDevfecha: TDateTimeField;
    rxDatosDevcodigo_cte: TIntegerField;
    rxDatosDevobservacion: TStringField;
    rxDatosDevmoneda: TStringField;
    rxDatosDevvalor_total_det: TFloatField;
    rxDatosDevstatus: TStringField;
    rxDatosDevforma_pago: TIntegerField;
    rxDatosDevnumero_factura: TIntegerField;
    rxDatosVentaDevDet: TRxMemoryData;
    rxDatosVentaDevDetcodigo_barra: TStringField;
    rxDatosVentaDevDetdescripcion: TStringField;
    rxDatosVentaDevDetcantidad: TFloatField;
    rxDatosVentaDevDetprecio: TFloatField;
    rxDatosVentaDevDetporc_desc_Det: TFloatField;
    rxDatosVentaDevDetitbi_Det: TFloatField;
    rxDatosVentaDevDetvalor_servicio_det: TFloatField;
    rxDatosVentaDevDetvalor_total_det: TFloatField;
    rxDatosVentaDevDetnum_factura: TIntegerField;
    rxDatosVentaDevDetstatus_det: TStringField;
    rxDatosVentaDevDetcodigo_prod: TStringField;
    rxDatosVentaDevDetNumero: TIntegerField;
    Reportes1: TMenuItem;
    ResumenVentaporDia1: TMenuItem;
    Calculadora1: TMenuItem;
    RxCalculator1: TRxCalculator;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Ingresos1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Actualizar1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Ingresos2Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edtCodBarraExit(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure BitBtn5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BalanceClientes1Click(Sender: TObject);
    procedure Cxc1Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
    procedure ResumenVentaporDia1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularItem;
    procedure GuardarIngreso;

    procedure ActualizaBalanceCte;


    Procedure ActBalaceCteP;
    procedure EditarBalanceP;
    procedure InsertaBalanceP;

    procedure ActualizaVentaDevolucion;
    procedure ProcesaDevolucionDetalleMem;
    procedure ProcesaDevolucionMasterMem;

    procedure ActualizaInventario(tipotrn:Smallint);
  public
    { Public declarations }
    irDirecto : Boolean;
    procedure ProcesaVenta(tipo:Smallint;EsVenta:Boolean);
    procedure Guardar;
    procedure SumarDetalle;
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito

var
  frmProcesarVentas: TfrmProcesarVentas;
  tipoD : Integer = 2;//Ingreso
  Proc  : Smallint;
  strTipoVenta : String;
implementation

uses UDatosVentas, UDatModInventario, Uglobal, UDatModCxc, UDatModIngresos,
  URegFpago, UCtrlIngresos, UBuscarProductoInvVenta, UInventarioProd,
  UMaestroClientes, UFormSelFecha, UBalanceCxcClientes, UTransaccionesCxc,
  UQckReporteFactura, URepResumenVentas, UDatModReportes, URepFacturaVenta,
  URFactura;

{$R *.dfm}

procedure TfrmProcesarVentas.FormCreate(Sender: TObject);
begin
  if EsCuadre then
  begin
    Caption:='Procesar Ventas '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria)+' '+
    FormatDatetime('hh:mma/p',now);
    exit;
  end;
  dmVentas.qryClientes.Close;
  dmVentas.qryClientes.Open;
  dmVentas.TblFormaPago.close;
  dmVentas.TblFormaPago.open;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;    
  dmVentas.tblVentasMast.Close;
  dmVentas.tblVentasMast.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblVentasMast.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.tblVentasMast.Params[2].Value:='A';
  dmVentas.tblVentasMast.Params[3].Value:='C';
  dmVentas.tblVentasMast.Params[4].Value:='P';
  dmVentas.tblVentasMast.Open;
  dmVentas.tblVentasDetalle.Close;
  dmVentas.tblVentasDetalle.Open;
  CheckBox1.Checked:=False;
  RxLabel1.Visible :=False;
  CheckBox1.Visible:=False;
  Image1.Visible:=True;
  if not EsCuadre then 
  if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
     If varTipousuario <> 2 then
     begin
       MessageDlg('El dia '+FormatDateTime('dd-mmm-yyyy',Glbfechatrndiaria)+' no se ha cerrado,'#13''+
                   'favor comuniquese con el supervisor',mtInformation, [mbOK], 0);
       Caption:='Procesar Ventas '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria)+' '+
       FormatDatetime('hh:mma/p',now)+' ATENCION: PARA PROCESAR TRANSACCIONES DEBE CERRAR EL DIA';
       panel1.Color:=clGray;
       //dmVentas.tblVentasMast.DisableControls;
       //dmVentas.tblVentasDetalle.DisableControls;
     end else
  Caption:='Procesar Ventas '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria)+' '+
  FormatDatetime('hh:mma/p',now);
end;

procedure TfrmProcesarVentas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if (dmVentas.tblVentasMastSTATUS.Value = 'A') And
     (dmVentas.tblVentasMastFORMA_PAGO.IsNull) Then
  begin
    MessageDlg('Favor indicar la forma de pago transaccion actual',mtError, [mbOK], 0);
    CanClose:=False;
    Exit;
  end;
  if (dmVentas.tblVentasMast.State in[dsInsert, dsEdit]) or
     (dmVentas.tblVentasDetalle.State in[dsInsert, dsEdit]) then
  begin
    Messagedlg('Hay una transaccion pendiente, verifique',mtError,[mbok],0);
    CanClose := False;
  end else
  CanClose := True;
end;

procedure TfrmProcesarVentas.BitBtn3Click(Sender: TObject);
var
  i : Integer;
begin
  if dmVentas.tblVentasMastSTATUS.Value = 'A' then
  begin
    if rxDBGrid1.SelectedRows.Count>0 then
    With rxDBGrid1.DataSource.DataSet do
      For i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if MessageDlg('Borrar item?',mtWarning,[mbyes,mbno],0)=mryes then
        begin
          rxDBGrid1.DataSource.DataSet.Delete;
          dmVentas.tblVentasDetalle.ApplyUpdates;
          if Not dmVentas.tblVentasDetalle.Transaction.InTransaction then
          dmVentas.tblVentasDetalle.Transaction.StartTransaction;
          try
            dmVentas.tblVentasDetalle.Transaction.CommitRetaining;
          except
          dmVentas.tblVentasDetalle.Transaction.RollbackRetaining;
          end;
        end;
      end;
  end;
end;

procedure TfrmProcesarVentas.BitBtn1Click(Sender: TObject);
var
 fechaHoy:TDatetime;
begin
  //Proc:=0;
  if dmVentas.tblVentasMast.State = dsBrowse then
  begin
    if not dmInventario.tblInventarioProd.Locate('Codigo_Barra',edtCodBarra.Text,[]) then
    begin
      if MessageDlg('Codigo: '+edtCodBarra.Text+', no fue encontrado desea registrarlo?',mtInformation,[mbyes,mbno],0)=mryes then
      begin
        frmInventarioProd:=TfrmInventarioProd.Create(Nil);
        try
          dmInventario.tblInventarioProd.Insert;
          dmInventario.tblInventarioProdCODIGO_BARRA.Value:= edtCodBarra.Text;
          dmInventario.tblInventarioProdSTATUS.Value      := 'A';
          dmInventario.tblInventarioProdFECHA.Value       := Now;
          frmInventarioProd.ShowModal;
        finally
        frmInventarioProd.Free;
        frmInventarioProd:=Nil;
        end;
      end else exit;
    end;
    fechaHoy:=ExtraerFecha(date)-1;
    if GlbFechaTrnDiaria <> fechaHoy then
    begin
      if MessageDlg('Se a detectado que el día '+
              DateToStr(GlbFechaTrnDiaria)+' no ha sido cerrado.'#13''+
                  'Desea procesar esta transacción en este día?',mtWarning, [mbyes,mbno], 0) = mrno then
        exit;
    end;
    if dmInventario.tblInventarioProd.Locate('Codigo_Barra',edtCodBarra.Text,[]) then
    begin
      if (dmVentas.tblVentasMastSTATUS.Value = 'A') and (dmVentas.tblVentasMast.RecordCount > 0) then
      begin
        dmVentas.tblVentasDetalle.Insert;
        dmVentas.tblVentasDetalleNUM_FACTURA.Value  := dmVentas.tblVentasMastNUMERO_FACTURA.Value;
        dmventas.tblVentasDetalleCODIGO_PROD.Value  := dmInventario.tblInventarioProdCODIGO_TEXTO.Value;
        dmventas.tblVentasDetalleCODIGO_BARRA.Value := edtCodBarra.Text;
        dmventas.tblVentasDetalleDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
        dmventas.tblVentasDetallePRECIO.Value       := dmInventario.tblInventarioProdPRECIO.Value;
        dmventas.tblVentasDetallePORC_DESC_DET.Value:= dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
        dmventas.tblVentasDetalleSTATUS_DET.Value   :='A';
        dmventas.tblVentasDetalleCANTIDAD.Value     :=1;
        CalcularItem;
      end else
      begin
        dmVentas.tblVentasMast.Insert;
        dmVentas.tblVentasMastCODIGO_CTE.Value := 0;
        dmVentas.tblVentasMastCODIGO_VENDEDOR.Value := VarUsuarioGlb;
        dmVentas.tblVentasMastFECHA.Value      := ExtraerFecha(GlbFechaTrnDiaria);
        dmVentas.tblVentasMastSTATUS.Value:='A';
        dmVentas.tblVentasMastMONEDA.Value:='1';
        if dmVentas.tblVentasDetalle.State = dsBrowse then
        begin
          dmVentas.tblVentasDetalle.Insert;
          dmVentas.tblVentasDetalleNUM_FACTURA.Value  := dmVentas.tblVentasMastNUMERO_FACTURA.Value;
          dmventas.tblVentasDetalleCODIGO_PROD.Value:= dmInventario.tblInventarioProdCODIGO_TEXTO.Value;
          dmventas.tblVentasDetalleCODIGO_BARRA.Value :=edtCodBarra.Text;          
          dmventas.tblVentasDetalleDESCRIPCION.Value:= dmInventario.tblInventarioProdDESCRIPCION.Value;
          dmventas.tblVentasDetallePRECIO.Value     := dmInventario.tblInventarioProdPRECIO.Value;
          dmventas.tblVentasDetallePORC_DESC_DET.Value := dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
          dmventas.tblVentasDetalleSTATUS_DET.Value :='A';
          dmventas.tblVentasDetalleCANTIDAD.Value   :=1;
          CalcularItem;
       end;
      end;
      Guardar;
    end;
  end;
  dmventas.tblVentasDetalle.Edit;
  DBEdit9.SetFocus;
  DBEdit9.SelectAll;
end;


procedure TfrmProcesarVentas.BitBtn5Click(Sender: TObject);
begin
  dmventas.tblVentasDetalle.Cancel;
  dmventas.tblVentasMast.Cancel;
end;


procedure TfrmProcesarVentas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 115 then //F4
     if edtCodBarra.Text <> '' then
     BitBtn1Click(Self);
  if key = 113 then BitBtn8Click(Self); //F2     
  if key = 116 then BitBtn13Click(Self);//F5
  if key = 117 then BitBtn14Click(Self);//F6  
  if key = 118 then BitBtn6Click(Self); //F7
  if key = 119 then BitBtn4Click(Self); //F8
  if key = 120 then BitBtn2Click(Self); //F9
end;

procedure TfrmProcesarVentas.FormShow(Sender: TObject);
begin
  edtCodBarra.SetFocus;
  case varTipousuario of
  0,2:begin
        reportes1.Enabled:=True;
        BalanceClientes1.Enabled:=True;
      end;
  else
  begin
    reportes1.Enabled:=False;
    BalanceClientes1.Enabled:=False;    
  end;
  end;
  if irDirecto then
  BitBtn14Click(Self);//Procesar Venta - Inventario
end;

procedure TfrmProcesarVentas.CalcularItem;
begin
  if dmventas.tblVentasDetalle.state in [dsEdit, dsInsert] then
  begin
    dmventas.tblVentasDetalleVALOR_SERVICIO_DET.Value :=
    dmventas.tblVentasDetallePRECIO.Value *
    dmventas.tblVentasDetalleCANTIDAD.Value;
    dmventas.tblVentasDetalleVALOR_TOTAL_DET.Value:=
    dmventas.tblVentasDetalleVALOR_SERVICIO_DET.Value -
   (dmventas.tblVentasDetalleVALOR_SERVICIO_DET.Value *
    dmventas.tblVentasDetallePORC_DESC_DET.Value/100);
  if dmInventario.tblInventarioProdPAGA_ITBI.Value = 1 then
  begin
    dmventas.tblVentasDetalleITBI_DET.Value:=
    dmventas.tblVentasDetalleVALOR_TOTAL_DET.Value *
    FGlbPorcItbi(ExtraerFecha(dmVentas.tblVentasMastFECHA.Value),dmventas.tblVentasDetalleCODIGO_PROD.AsInteger) / 100;
    dmventas.tblVentasDetalleVALOR_TOTAL_DET.Value:=
    dmventas.tblVentasDetalleVALOR_TOTAL_DET.Value  +
    dmventas.tblVentasDetalleITBI_DET.Value;
  end;
  end;
end;

procedure TfrmProcesarVentas.DBEdit9Exit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmProcesarVentas.DBEdit10Exit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmProcesarVentas.DBEdit11Exit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmProcesarVentas.BitBtn7Click(Sender: TObject);
begin
  //Proc:=1;
  if dmVentas.tblVentasMast.State = dsBrowse then
  begin
    dmVentas.tblVentasMast.Insert;
    dmVentas.tblVentasMastCODIGO_CTE.Value := 0;
    dmVentas.tblVentasMastFECHA.Value      := ExtraerFecha(GlbFechaTrnDiaria);
    dmVentas.tblVentasMastSTATUS.Value:='A';
    dmVentas.tblVentasMastMONEDA.Value:='1';
    dmVentas.tblVentasMastCODIGO_VENDEDOR.Value := VarUsuarioGlb;
    if dmVentas.tblVentasDetalle.State = dsBrowse then
    begin
      dmVentas.tblVentasDetalle.Insert;
      dmVentas.tblVentasDetalleNUM_FACTURA.Value  := dmVentas.tblVentasMastNUMERO_FACTURA.Value;
      dmventas.tblVentasDetalleSTATUS_DET.Value :='A';
      dmventas.tblVentasDetalleCANTIDAD.Value   :=1;
      RxDBLookupCombo2.SetFocus;
    end;
  end;
end;

procedure TfrmProcesarVentas.RxDBLookupCombo2Change(Sender: TObject);
begin
 // if Proc = 0 then exit;
  if not dmInventario.tblInventarioProd.Locate('CODIGO_TEXTO',dmVentas.tblVentasDetalleCODIGO_PROD.Value,[]) then
  MessageDlg('Producto no encontrado, verifique',mtError,[mbOk],0)
  else
  begin
    if dmventas.tblVentasDetalle.State in [dsEdit, dsInsert] then
    begin
      dmVentas.tblVentasDetalleDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
      dmVentas.tblVentasDetallePRECIO.Value       := dmInventario.tblInventarioProdPRECIO.Value;
      dmVentas.tblVentasDetallePORC_DESC_DET.Value:= dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
    end;
  end;
end;

procedure TfrmProcesarVentas.DBEdit7Exit(Sender: TObject);
begin
  RxDBLookupCombo2Change(Self);  
end;

procedure TfrmProcesarVentas.Guardar;
begin
  if dmVentas.tblVentasMast.State in [dsEdit,dsInsert] then
  begin
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
  if dmVentas.tblVentasDetalle.State in [dsEdit,dsInsert] then
  begin
    if dmVentas.tblVentasDetalle.State in [dsInsert] then  
    dmVentas.tblVentasDetalleNUMERO.Value:= dmVentas.tblVentasMastNUMERO.Value;
    dmVentas.tblVentasDetalle.Post;
    dmVentas.tblVentasDetalle.ApplyUpdates;
    if Not dmVentas.tblVentasDetalle.Transaction.InTransaction then
    dmVentas.tblVentasDetalle.Transaction.StartTransaction;
    try
      dmVentas.tblVentasDetalle.Transaction.CommitRetaining;
    except
    dmVentas.tblVentasDetalle.Transaction.RollbackRetaining;
    end;
    SumarDetalle;
  end;
end;

procedure TfrmProcesarVentas.BitBtn8Click(Sender: TObject);
begin
  Guardar;
end;

procedure TfrmProcesarVentas.ProcesaVenta(tipo:Smallint;EsVenta:Boolean);
var
   impRecibo : Boolean;
begin
  impRecibo:=False;
  if dmVentas.tblVentasMastFORMA_PAGO.Value = FormaPagoNotaDebito then Exit;
  dmCxc.tblTransCxc.Close;
  dmCxc.tblTransCxc.Params[0].Value:=ExtraerFecha(dmVentas.tblVentasMastFECHA.Value);
  dmCxc.tblTransCxc.Params[1].Value:=ExtraerFecha(dmVentas.tblVentasMastFECHA.Value);
  dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;  
  dmCxc.tblTransCxc.Open;

  dmCxc.qryBalanceCtes.Close;
  dmCxc.qryBalanceCtes.Open;
  if (tipo = 0) And (EsVenta = False) And (dmVentas.tblVentasMastSTATUS.Value = 'P') then //devolucion
  begin
    impRecibo:=True;
    strTipoVenta:='DEVOLUCION';
    if dmventas.tblVentasMastFORMA_PAGO.Value = TipoPagoFactura then //Factura
    begin
      ActualizaVentaDevolucion;
      ActualizaInventario(0);
      dmCxc.tblTransCxc.Insert;
      dmCxc.tblTransCxcCIA_KEY.Value:=GlbCodigoCia;
      dmCxc.tblTransCxcSTATUS.Value         :='R';
      dmCxc.tblTransCxcTIPO_DOC.Value       := 3; //Nota Debito
      dmCxc.tblTransCxcmoneda.Value         := '1';
      dmCxc.tblTransCxcfecha.Value          := ExtraerFecha(dmVentas.tblVentasMastFECHA.Value);
      dmCxc.tblTransCxcnumero_doc.Value     := dmVentas.tblVentasMastNUMERO.Value;
      dmCxc.tblTransCxccodigo_cliente.Value := dmVentas.tblVentasMastCODIGO_CTE.Value;
      dmCxc.tblTransCxccodigo_serv.Value    := 0;//dmInventario.tblInventarioProdTIPO.Value; //1000;//Temporal
      dmCxc.tblTransCxcNUMERO_DOC.Value     := dmVentas.tblVentasMastNUMERO.Value;
      dmCxc.tblTransCxcnumero_trn_Venta.Value:= dmVentas.tblVentasMastNUMERO.Value;
      dmCxc.tblTransCxcconcepto.Value        := 'Devolucion';
      dmCxc.tblTransCxcvalor_documento.Value := dmVentas.tblVentasMastVALOR_TOTAL_DET.Value * -1;
      dmCxc.tblTransCxctipo_tranf.Value      := 2;//Crédito
      dmCxc.tblTransCxctipo_serv.Value       := 2;//Ferreteria
      dmCxc.tblTransCxcfecha_in.Value        := Now;
      dmCxc.tblTransCxcIN_POR.Value          := StrUserName;
      dmCxc.tblTransCxcCODIGO_VENDEDOR.Value := VarUsuarioGlb;
      dmCxc.tblTransCxc.Post;
      dmCxc.tblTransCxc.ApplyUpdates;
      if Not dmCxc.tblTransCxc.Transaction.InTransaction then
      dmCxc.tblTransCxc.Transaction.StartTransaction;
      try
        dmCxc.tblTransCxc.Transaction.CommitRetaining;
      except
      dmCxc.tblTransCxc.Transaction.RollbackRetaining;
      end;
      if dmCxc.tblTransCxcTIPO_DOC.Value = 3 then //Nota Debito
      begin
        if dmCxc.qryBalanceCtes.Locate('codigo',dmcxc.tblTransCxcCODIGO_CLIENTE.Value,[]) then
        begin
          dmcxc.qryBalanceCtes.Edit;
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
          dmcxc.qryBalanceCtesBALANCE_ACT.Value - dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_MES.Value:=dmcxc.qryBalanceCtesCREDITO_MES.Value + dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_ACM.Value:=dmcxc.qryBalanceCtesCREDITO_ACM.Value + dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtes.Post;
          dmcxc.qryBalanceCtes.ApplyUpdates;
          if Not dmcxc.qryBalanceCtes.Transaction.InTransaction Then
          dmcxc.qryBalanceCtes.Transaction.StartTransaction;
          try
            dmcxc.qryBalanceCtes.Transaction.CommitRetaining;
          except
          dmcxc.qryBalanceCtes.Transaction.RollbackRetaining;
          end;
        end;
        //ActualizaVentaDevolucion;
      end;
      ImpRecibo:=True;
    end else
    begin
      ImpRecibo:=True;
      ActualizaVentaDevolucion;
    end;
  end;

  if (dmVentas.tblVentasMast.State = dsBrowse) And
     (dmVentas.tblVentasMastSTATUS.Value = 'A') then
  begin
    dmVentas.tblVentasMast.Edit;
    dmVentas.tblVentasMastSTATUS.Value := 'P';
    if (tipo = 1) and (EsVenta) then //Cash
    begin
      strTipoVenta:='PAGADO';
      impRecibo:=False;
      if Not EsCuadre then
      begin
        frmFormaPago:=TfrmFormaPago.Create(Nil); //dmIngresos.tblIngresoMasterFORMA_PAGO.Value
        try
          if frmFormaPago.Showmodal = mrOk then
          dmVentas.tblVentasMastFORMA_PAGO.Value   := dmVentas.TblFormaPagoCODIGO.Value;
          if dmVentas.tblVentasMastFORMA_PAGO.Value = TipoPagoFactura then
            if dmventas.tblVentasMastCODIGO_CTE.Value  = 0 then
            begin
              Messagedlg('Codigo cliente no puede ser CERO ( 0 ), verifique',mtError,[mbOk],0);
              dmVentas.tblVentasMast.Cancel;
              Exit;
            end;
         finally
         frmFormaPago.Free;
         frmFormaPago:=Nil;
         end;
         impRecibo:=True;
      end;
      ActualizaInventario(0);
    end else
    if (tipo = 2) and (EsVenta) then //Credito
    begin
      strTipoVenta:='VENTA A CREDITO';
      if dmVentas.tblVentasMastCODIGO_CTE.Value = 0 then
      begin
        Messagedlg('Codigo cliente no puede ser CERO ( 0 ), verifique',mtError,[mbok],0);
        exit;
      end;
       ActualizaInventario(0);
       dmCxc.tblTransCxc.Insert;
       dmCxc.tblTransCxcCIA_KEY.Value:=GlbCodigoCia;
       dmCxc.tblTransCxcSTATUS.Value:='A';
       dmCxc.tblTransCxcTIPO_DOC.Value       := 1; //Factura
       dmCxc.tblTransCxcmoneda.Value         := '1';
       dmCxc.tblTransCxcfecha.Value          := ExtraerFecha(dmVentas.tblVentasMastFECHA.Value);
       dmCxc.tblTransCxcnumero_doc.Value     := dmVentas.tblVentasMastNUMERO.Value;
       dmVentas.tblVentasMastFORMA_PAGO.Value:=TipoPagoFactura;//Facturar
       dmCxc.tblTransCxccodigo_cliente.Value := dmVentas.tblVentasMastCODIGO_CTE.Value;
       dmCxc.tblTransCxccodigo_serv.Value    := 0;//dmInventario.tblInventarioProdTIPO.Value;//1000;//Temporal
       dmCxc.tblTransCxcNUMERO_DOC.Value      := dmVentas.tblVentasMastNUMERO.Value;
       dmCxc.tblTransCxcnumero_trn_Venta.Value:= dmVentas.tblVentasMastNUMERO.Value;
       dmCxc.tblTransCxcconcepto.Value        := 'Trans. de ventas';
       dmCxc.tblTransCxcvalor_documento.Value:= dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;
       dmCxc.tblTransCxctipo_tranf.Value     := 1;//Crédito
       dmCxc.tblTransCxctipo_serv.Value      := 2;//Ferreteria
       dmCxc.tblTransCxcfecha_in.Value       := Now;
       dmCxc.tblTransCxcIN_POR.Value := strUserName;
       dmCxc.tblTransCxc.Post;
       dmCxc.tblTransCxc.ApplyUpdates;
       if Not dmCxc.tblTransCxc.Transaction.InTransaction then
       dmCxc.tblTransCxc.Transaction.StartTransaction;
       try
         dmCxc.tblTransCxc.Transaction.CommitRetaining;
       except
       dmCxc.tblTransCxc.Transaction.RollbackRetaining;
       end;
       ActualizaBalanceCte;
       impRecibo:=True;
     end;
    if dmVentas.tblVentasMast.State in [dsEdit,dsInsert] then
    begin
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
  //end;
 end;
 if Not EsCuadre then
 if impRecibo then ImprimirRecibo1Click(Self);
end;

procedure TfrmProcesarVentas.GuardarIngreso;
begin
  if dmIngresos.tblIngresoMaster.State in [dsEdit,dsInsert] then
  begin
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
end;

procedure TfrmProcesarVentas.ActualizaBalanceCte;
begin  
  ActBalaceCteP;
end;

procedure TfrmProcesarVentas.ActBalaceCteP;
begin
    if dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
       VarArrayOf([dmCxc.tblTransCxccodigo_cliente.Value,
                   dmCxc.tblTransCxccodigo_serv.Value,
                   dmCxc.tblTransCxcMONEDA.Value]),[]) then
    begin
      EditarBalanceP;
    end else
    begin
      InsertaBalanceP;
    end;//Locate
    if dmcxc.qryBalanceCtes.state in [dsEdit,dsInsert] then
    begin
      dmcxc.qryBalanceCtes.Post;
      dmcxc.qryBalanceCtes.ApplyUpdates;
    end;
    dmCxc.tblTranscxc.Edit;
    dmCxc.tblTransCxcSTATUS.Value:= 'R';
    dmCxc.tblTranscxc.Post;
    dmCxc.tblTranscxc.ApplyUpdates;
    if Not dmCxc.tblTranscxc.Transaction.InTransaction then
    dmCxc.tblTranscxc.Transaction.StartTransaction;
    try
      dmCxc.tblTranscxc.Transaction.CommitRetaining;
    except
    dmCxc.tblTranscxc.Transaction.RollbackRetaining;
    end;
    if Not dmcxc.qryBalanceCtes.Transaction.InTransaction then
    dmcxc.qryBalanceCtes.Transaction.StartTransaction;
    try
      dmcxc.qryBalanceCtes.Transaction.CommitRetaining;
    except
    dmcxc.qryBalanceCtes.Transaction.RollbackRetaining;
    end;
end;

procedure TfrmProcesarVentas.EditarBalanceP;
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= dmcxc.tblTransCxcFECHA.Value;
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value + dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_MES.Value + dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_ACM.Value + dmCxc.tblTransCxcvalor_documento.Value;
end;

procedure TfrmProcesarVentas.InsertaBalanceP;
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value    := dmVentas.tblVentasMastCODIGO_CTE.Value;//dmCxc.qryProcServcodigo_cliente.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0;//dmInventario.tblInventarioProdTIPO.Value; //dmCxc.qryProcServcodigo_serv.Value;
  dmcxc.qryBalanceCtesMONEDA.Value    := dmVentas.tblVentasMastMONEDA.Value;// dmCxc.qryProcServmoneda.Value;
  if dmcxc.qryBalanceCtesMONEDA.IsNull then
  dmcxc.qryBalanceCtesMONEDA.Value:='1';
  //chequear moneda
  dmcxc.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value := dmVentas.tblVentasMastFECHA.Value;//dmCxc.qryProcServfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  :=Now;
  dmcxc.qryBalanceCtesIN_POR.Value    :=StrUserName;
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 1) or (dmCxc.tblTransCxcTIPO_DOC.Value = 3) then
      begin
        dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmVentas.tblVentasMastVALOR_TOTAL_DET.Value; //dmCxc.qryProcServVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_MES.Value := dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;// dmCxc.qryProcServVALOR_DOCUMENTO.Value;
        dmcxc.qryBalanceCtesDEBITO_ACM.Value := dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;// dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      end else
      if (dmCxc.tblTransCxcTIPO_DOC.Value = 2) Or (dmCxc.tblTransCxcTIPO_DOC.Value = 4) or
         (dmCxc.tblTransCxcTIPO_DOC.Value = 5) then
      begin
        if (dmCxc.tblTransCxcTIPO_DOC.Value = 4) And ((dmCxc.tblTransCxcTIPO_DOC.Value = 1) ) then
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:= dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_MES.Value := dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesDEBITO_ACM.Value := dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
        end else
        begin
          dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
          dmcxc.qryBalanceCtesBALANCE_ACT.Value - dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_MES.Value:= dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesCREDITO_ACM.Value:= dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
          dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= dmVentas.tblVentasMastFECHA.Value;       //dmCxc.qryProcServfecha.Value;
        end;
      end;
end;

procedure TfrmProcesarVentas.BitBtn4Click(Sender: TObject);
begin
  if dmventas.tblVentasMastCODIGO_CTE.Value  = 0 then
  begin
    Messagedlg('Codigo cliente no puede ser CERO ( 0 ), verifique',mtError,[mbOk],0);
    Exit;
  end else
  ProcesaVenta(2,True);
end;

procedure TfrmProcesarVentas.BitBtn2Click(Sender: TObject);
begin
  ProcesaVenta(1,True);
end;

procedure TfrmProcesarVentas.SumarDetalle;
var
  suma:Real;
begin
  dmVentas.tblVentasDetalle.DisableControls;
  dmVentas.tblVentasDetalle.First;
  While Not dmVentas.tblVentasDetalle.Eof do
  begin
    Suma := Suma + dmVentas.tblVentasDetalleVALOR_TOTAL_DET.Value;
    dmVentas.tblVentasDetalle.Next;
  end;
  dmVentas.tblVentasMast.Edit;
  dmVentas.tblVentasMastVALOR_TOTAL_DET.Value:=Suma;
  dmVentas.tblVentasMast.Post;
  dmVentas.tblVentasMast.ApplyUpdates;
  if Not dmVentas.tblVentasMast.Transaction.InTransaction then
  dmVentas.tblVentasMast.Transaction.StartTransaction;
  try
    dmVentas.tblVentasMast.Transaction.CommitRetaining;
  except
  dmVentas.tblVentasMast.Transaction.RollbackRetaining;
  end;
  dmVentas.tblVentasDetalle.EnableControls;
end;

procedure TfrmProcesarVentas.BitBtn13Click(Sender: TObject);
begin
  if (dmVentas.tblVentasMastSTATUS.Value = 'A') then
  if dmVentas.tblVentasDetalle.State = dsBrowse then
  begin
    dmVentas.tblVentasDetalle.Insert;
    dmVentas.tblVentasDetalleNUM_FACTURA.Value  := dmVentas.tblVentasMastNUMERO_FACTURA.Value;
    dmventas.tblVentasDetalleCODIGO_PROD.Value  := dmInventario.tblInventarioProdCODIGO_TEXTO.Value;
    dmventas.tblVentasDetalleCODIGO_BARRA.Value :=edtCodBarra.Text;
    dmventas.tblVentasDetalleDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
    dmventas.tblVentasDetallePRECIO.Value       := dmInventario.tblInventarioProdPRECIO.Value;
    dmventas.tblVentasDetallePORC_DESC_DET.Value:= dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
    dmventas.tblVentasDetalleSTATUS_DET.Value   :='A';
    dmventas.tblVentasDetalleCANTIDAD.Value     :=1;
    CalcularItem;
    RxDBLookupCombo2.SetFocus;    
  end;
end;

procedure TfrmProcesarVentas.Ingresos1Click(Sender: TObject);
begin
  frmIngresos:=TfrmIngresos.Create(Nil);
  try
    frmIngresos.Showmodal;
  finally
  frmIngresos.Free;
  frmIngresos:=Nil;
  end;
end;

procedure TfrmProcesarVentas.BitBtn6Click(Sender: TObject);
begin
  case varTipousuario of
  0,2:begin
        If messagedlg('Procesar devolucion',mtWarning,[mbyes,mbno],0)=mryes then
        ProcesaVenta(0,False);
      end;
  else messagedlg('Usuario activo no tiene suficientes derechos.'#13'Favor llamar al supervisor.',mtError,[mbOk],0);
  end;
end;

procedure TfrmProcesarVentas.BitBtn14Click(Sender: TObject);
begin
  if (dmVentas.tblVentasMastSTATUS.Value = 'A') And
     (dmVentas.tblVentasMastFORMA_PAGO.IsNull) Then
  begin
    MessageDlg('Favor indicar la forma de pago transaccion actual',mtError, [mbOK], 0);
    Exit;
  end;
  frmBuscarProdInv:=TfrmBuscarProdInv.Create(Nil);
  try
    frmBuscarProdInv.Showmodal;
  finally
  frmBuscarProdInv.Free;
  frmBuscarProdInv:=Nil;
  end;
  SumarDetalle;
end;

procedure TfrmProcesarVentas.Actualizar1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(nil);
  try
    frmInventarioProd.showmodal;
  finally
  frmInventarioProd.free;
  frmInventarioProd:=nil;
  end;
end;

procedure TfrmProcesarVentas.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
   frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

procedure TfrmProcesarVentas.Ingresos2Click(Sender: TObject);
begin
  frmIngresos:=TfrmIngresos.Create(nil);
  try
    frmIngresos.ShowModal;
  finally
  frmIngresos.free;
  frmIngresos:=nil;
  end;
end;

procedure TfrmProcesarVentas.Consultar1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    if frmSelFecha.showmodal = mrOk then
    begin
      dmVentas.tblVentasMast.Close;
      dmVentas.tblVentasMast.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.Date);
      dmVentas.tblVentasMast.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.Date);
      dmVentas.tblVentasMast.Params[2].Value:='A';
      dmVentas.tblVentasMast.Params[3].Value:='P';
      dmVentas.tblVentasMast.Params[4].Value:='C';
      dmVentas.tblVentasMast.Open;
      CheckBox1.Checked:=True;
      RxLabel1.Visible :=True;
      CheckBox1.Visible:=True;
      Image1.Visible   :=False;
    end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil;
  end;
end;

procedure TfrmProcesarVentas.CheckBox1Click(Sender: TObject);
begin
  CheckBox1.Checked:=False;
  RxLabel1.Visible :=False;
  CheckBox1.Visible:=False;
  Image1.Visible:=True;
end;

procedure TfrmProcesarVentas.edtCodBarraExit(Sender: TObject);
begin
  if edtCodBarra.Text <> '' then
  BitBtn1Click(Self);
end;

procedure TfrmProcesarVentas.DBEdit6Change(Sender: TObject);
begin
  if (dmventas.tblVentasMastSTATUS.Value = 'D') then
  begin
    BitBtn6.Enabled:=False;
    BitBtn2.Enabled:=False;
    BitBtn4.Enabled:=False;
    BitBtn3.Enabled:=False;
    BitBtn5.Enabled:=False;
  end else
  if (dmventas.tblVentasMastSTATUS.Value = 'P') then
  begin
    BitBtn2.Enabled:=False;
    BitBtn4.Enabled:=False;
    BitBtn3.Enabled:=False;
    BitBtn5.Enabled:=False;
    BitBtn6.Enabled:=True;
  end else
  begin
    BitBtn2.Enabled:=True;
    BitBtn4.Enabled:=True;
    BitBtn3.Enabled:=True;
    BitBtn5.Enabled:=True;
    BitBtn6.Enabled:=False;    
  end;
end;

procedure TfrmProcesarVentas.ActualizaVentaDevolucion;
begin
  rxdatosdev.Close;
  rxdatosdev.Open;
  rxDatosVentaDevDet.Close;
  rxDatosVentaDevDet.Open;

  ProcesaDevolucionDetalleMem;
  ProcesaDevolucionMasterMem;
  
  dmVentas.tblVentasMast.Insert;
  dmVentas.tblVentasMastCODIGO_VENDEDOR.Value := VarUsuarioGlb;
  dmVentas.tblVentasMastFECHA.Value          := rxDatosDevFecha.Value;
  dmVentas.tblVentasMastCODIGO_CTE.Value     := rxDatosDevCodigo_cte.Value;
  dmVentas.tblVentasMastFORMA_PAGO.Value     := rxDatosDevForma_pago.Value;
  dmVentas.tblVentasMastOBSERVACION.Value    := rxDatosDevObservacion.Value;
  dmVentas.tblVentasMastFORMA_PAGO.Value     := FormaPagoNotaDebito;
  dmVentas.tblVentasMastMONEDA.Value         := rxDatosDevMoneda.Value;
  dmVentas.tblVentasMastFECHA_IN.Value       := Now;
  dmVentas.tblVentasMastVALOR_TOTAL_DET.Value:= rxDatosDevValor_Total_Det.Value * -1;
  dmVentas.tblVentasMastIN_POR.Value         := StrUserName;
  dmVentas.tblVentasMastSTATUS.Value         := rxDatosDevstatus.Value;
  dmVentas.tblVentasMast.Post;
  dmVentas.tblVentasMast.ApplyUpdates;
  if Not dmVentas.tblVentasMast.Transaction.InTransaction then
  dmVentas.tblVentasMast.Transaction.StartTransaction;
  try
    dmVentas.tblVentasMast.Transaction.CommitRetaining;
  except
  dmVentas.tblVentasMast.Transaction.RollbackRetaining;
  end;

  rxDatosVentaDevDet.First;
  While Not rxDatosVentaDevDet.Eof do 
  begin
    dmventas.tblVentasDetalle.Insert;
    dmVentas.tblVentasDetalleNUM_FACTURA.Value  := dmVentas.tblVentasMastNUMERO_FACTURA.Value;
    dmventas.tblVentasDetalleNUMERO.Value      := dmVentas.tblVentasMastNUMERO.Value; //rxDatosVentaDevDetNumero.Value;
    dmventas.tblVentasDetalleCODIGO_PROD.Value := rxDatosVentaDevDetcodigo_prod.Value;
    dmventas.tblVentasDetalleCODIGO_BARRA.Value:= rxDatosVentaDevDetcodigo_barra.Value;
    dmventas.tblVentasDetalleDESCRIPCION.Value := rxDatosVentaDevDetdescripcion.Value;
    dmventas.tblVentasDetalleCANTIDAD.Value    := rxDatosVentaDevDetcantidad.Value;
    dmventas.tblVentasDetallePRECIO.Value      := rxDatosVentaDevDetprecio.Value;
    dmventas.tblVentasDetallePORC_DESC_DET.Value:= rxDatosVentaDevDetporc_desc_det.Value;
    dmventas.tblVentasDetalleITBI_DET.Value     := rxDatosVentaDevDetitbi_det.Value;
    dmventas.tblVentasDetalleVALOR_SERVICIO_DET.Value:= rxDatosVentaDevDetvalor_servicio_Det.Value;
    dmventas.tblVentasDetalleVALOR_TOTAL_DET.Value   := rxDatosVentaDevDetvalor_total_det.Value;
    dmventas.tblVentasDetalleNUM_FACTURA.Value:= rxDatosVentaDevDetnum_factura.Value;
    dmventas.tblVentasDetalleSTATUS_DET.Value := rxDatosVentaDevDetstatus_det.Value;
    dmVentas.tblVentasDetalle.Post;
    dmVentas.tblVentasDetalle.ApplyUpdates;
    if Not dmVentas.tblVentasDetalle.Transaction.InTransaction then
    dmVentas.tblVentasDetalle.Transaction.StartTransaction;
    try
      dmVentas.tblVentasDetalle.Transaction.CommitRetaining;
    except
    dmVentas.tblVentasDetalle.Transaction.RollbackRetaining;
    end;
    rxDatosVentaDevDet.Next;
  end;

end;

procedure TfrmProcesarVentas.BitBtn5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if dmventas.tblVentasMast.State in [dsEdit, dsInsert] then
  Bitbtn5.Enabled:=True;
end;

procedure TfrmProcesarVentas.BalanceClientes1Click(Sender: TObject);
begin
  frmBalanceCxcCtes:=TfrmBalanceCxcCtes.Create(Nil);
  try
    frmBalanceCxcCtes.Showmodal;
  finally
  frmBalanceCxcCtes.Free;
  frmBalanceCxcCtes:=Nil;
  end;
end;

procedure TfrmProcesarVentas.Cxc1Click(Sender: TObject);
begin
  frmtransaccionescxc:=Tfrmtransaccionescxc.create(Nil);
  try
    frmtransaccionescxc.Showmodal;
  finally
  frmtransaccionescxc.Free;
  frmtransaccionescxc:=Nil;
  end;
  dmVentas.qryClientes.Close;
  dmVentas.qryClientes.Open;  
end;

procedure TfrmProcesarVentas.ImprimirRecibo1Click(Sender: TObject);
begin
  dmVentas.tblVentasMast.DisableControls;
  dmVentas.tblVentasDetalle.DisableControls;
  dmVentas.qryClientes.DisableControls;
  {  qckFacturaVenta:=TqckFacturaVenta.Create(nil);
  try
    qckFacturaVenta.Prepare;
    qckFacturaVenta.qrtipoVenta.caption:=strTipoVenta;
    qckFacturaVenta.TPag.Caption:=IntToStr(qckFacturaVenta.PageNumber);
    if MessageDlg('Imprimir factura?',mtinformation,[mbyes,mbno],0)=mryes then
    begin
      qckFacturaVenta.PrinterSetup;
      qckFacturaVenta.Print;
    end else
    qckFacturaVenta.Preview;
  finally
  qckFacturaVenta.Free;
  qckFacturaVenta:=Nil;
  end;
}
  //Sustituir Factura a Credito por esta

  qckRepFacturaEstandar:=TqckRepFacturaEstandar.Create(Nil);
  try
    qckRepFacturaEstandar.Prepare;
    qckRepFacturaEstandar.qrtipoVenta.caption:=strTipoVenta;
    if strTipoVenta = '' then
    qckRepFacturaEstandar.qrtipoVenta.caption:='Re-Impresion';
    qckRepFacturaEstandar.TPag.Caption := IntToStr(qckRepFacturaEstandar.PageNumber);
    if MessageDlg('Imprimir factura?',mtinformation,[mbYes,mbNo],0)=mrYes then
    begin
      qckRepFacturaEstandar.PrinterSetup;
      qckRepFacturaEstandar.Print;
    end else
    qckRepFacturaEstandar.Preview;
  finally
  qckRepFacturaEstandar.Free;
  qckRepFacturaEstandar:=Nil;
  end;
  dmVentas.tblVentasMast.EnableControls;
  dmVentas.tblVentasDetalle.EnableControls;
  dmVentas.qryClientes.EnableControls;
end;

procedure TfrmProcesarVentas.ProcesaDevolucionDetalleMem;
begin
  dmventas.tblVentasDetalle.First;
  while not dmventas.tblVentasDetalle.Eof do
  begin
    rxDatosVentaDevDet.Insert;
    rxDatosVentaDevDetcodigo_prod.Value   := dmventas.tblVentasDetalleCODIGO_PROD.Value;
    rxDatosVentaDevDetcodigo_barra.Value  := dmventas.tblVentasDetalleCODIGO_BARRA.Value;
    rxDatosVentaDevDetdescripcion.Value   := dmventas.tblVentasDetalleDESCRIPCION.Value;
    rxDatosVentaDevDetcantidad.Value      := dmventas.tblVentasDetalleCANTIDAD.Value * -1;
    rxDatosVentaDevDetprecio.Value        := dmventas.tblVentasDetallePRECIO.Value;
    rxDatosVentaDevDetporc_desc_det.Value := dmventas.tblVentasDetallePORC_DESC_DET.Value;
    rxDatosVentaDevDetitbi_det.Value      := dmventas.tblVentasDetalleITBI_DET.Value* -1;
    rxDatosVentaDevDetvalor_servicio_Det.Value:= dmventas.tblVentasDetalleVALOR_SERVICIO_DET.Value* -1;
    rxDatosVentaDevDetvalor_total_det.Value:= dmventas.tblVentasDetalleVALOR_TOTAL_DET.Value* -1;
    rxDatosVentaDevDetnum_factura.Value    := dmventas.tblVentasDetalleNUM_FACTURA.AsInteger;
    rxDatosVentaDevDetNumero.Value         := dmventas.tblVentasDetalleNUMERO.Value;
    rxDatosVentaDevDetstatus_det.Value     := dmventas.tblVentasDetalleSTATUS_DET.Value;
    rxDatosVentaDevDet.Post;
    dmventas.tblVentasDetalle.Next;
  end;
end;

procedure TfrmProcesarVentas.ProcesaDevolucionMasterMem;
begin
  rxDatosDev.Insert;
  rxDatosDevfecha.Value          := dmVentas.tblVentasMastFECHA.Value;
  rxDatosDevcodigo_cte.Value     := dmVentas.tblVentasMastCODIGO_CTE.Value;
  rxDatosDevforma_pago.Value     := dmVentas.tblVentasMastFORMA_PAGO.Value;
  rxDatosDevobservacion.Value    := 'Devolución Factura #'+dmVentas.tblVentasMastNUMERO_FACTURA.AsString;
  rxDatosDevmoneda.Value         := dmVentas.tblVentasMastMONEDA.Value;
  rxDatosDevvalor_total_det.Value:= dmVentas.tblVentasMastVALOR_TOTAL_DET.Value;
  rxDatosDevstatus.Value         := dmVentas.tblVentasMastSTATUS.Value;
  rxDatosDevnumero_factura.Value := dmVentas.tblVentasMastNUMERO_FACTURA.Value;
  rxDatosDevstatus.Value         := 'D';
  rxDatosDev.Post;
end;

procedure TfrmProcesarVentas.ActualizaInventario(tipotrn:smallint);
begin
  if not dmVentas.IBStoredProc1.Transaction.InTransaction then
  dmVentas.IBStoredProc1.Transaction.StartTransaction;
  dmventas.tblVentasDetalle.First;
  While Not dmventas.tblVentasDetalle.Eof do
  begin
    dmVentas.IBStoredProc1.Params[0].Value:=dmVentas.tblVentasDetalleCODIGO_PROD.Value;
    dmVentas.IBStoredProc1.Params[1].Value:=dmVentas.tblVentasDetalleCANTIDAD.Value;
    dmVentas.IBStoredProc1.Params[2].Value:=tipotrn;
    dmVentas.IBStoredProc1.Params[3].Value:=0;    
    dmVentas.IBStoredProc1.ExecProc;
    dmventas.tblVentasDetalle.Next;
  end;
  try
    dmVentas.IBStoredProc1.Transaction.CommitRetaining;
  except
  dmVentas.IBStoredProc1.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcesarVentas.ResumenVentaporDia1Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.create(nil);
  try
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
    dmreportes.qryResumenVentas.Close;
    dmreportes.qryResumenVentas.params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
    dmreportes.qryResumenVentas.params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
    dmreportes.qryResumenVentas.open;
    qckResumenVentas:=TqckResumenVentas.Create(Nil);
    try
    qckResumenVentas.Prepare;
    glbTPag := qckResumenVentas.PageNumber;
    qckResumenVentas.Preview;
  finally
  qckResumenVentas.Free;
  qckResumenVentas:=Nil;
  end;
  end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil
  end;
end;

procedure TfrmProcesarVentas.Calculadora1Click(Sender: TObject);
begin
  if RxCalculator1.Execute then
  RxCalculator1.Value:=0;
end;

end.
