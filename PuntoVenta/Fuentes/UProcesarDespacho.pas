unit UProcesarDespacho;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl,
  Buttons, rxToolEdit, RxLookup, RXCtrls, ImgList, DBActns, ActnList, Menus,
  ExtDlgs, RxMemDS, RxCalc, WinSkinData ;

type
  TfrmProcesarDespachoVendedores = class(TForm)
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
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
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
    DBImage2: TDBImage;
    Label19: TLabel;
    Consultar1: TMenuItem;
    RxLabel1: TRxLabel;
    CheckBox1: TCheckBox;
    Image1: TImage;
    ImprimirRecibo1: TMenuItem;
    DBEdit7: TDBEdit;
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
    BitBtn15: TBitBtn;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    dsqryEmpleados: TDataSource;
    DBImage1: TDBImage;
    Inventario1: TMenuItem;
    rxDatosDevcodigoRuta: TIntegerField;
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
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Actualizar1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edtCodBarraExit(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure BitBtn5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BalanceClientes1Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
    procedure ResumenVentaporDia1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure CalcularItem;

    procedure GuardarIngreso;
    procedure ActualizaBalanceCte;


    Procedure ActBalaceCteP;
    procedure EditarBalanceP;
    procedure InsertaBalanceP;
    procedure ActualizaInventario(tipotrn:Smallint);


  public
    procedure Guardar;
    procedure SumarDetalle;
    procedure ActualizaVentaDevolucion;
    procedure ProcesaDevolucionDetalleMem;
    procedure ProcesaDevolucionMasterMem;
    
    procedure ActualizaBalanceDespacho(Tipotrn:Smallint);
    procedure ProcesaVenta(tipo:Smallint;EsVenta:Boolean);    
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito

var
  frmProcesarDespachoVendedores: TfrmProcesarDespachoVendedores;
  tipoD : Integer = 2;//Ingreso
  Proc  : Smallint;
  strTipoVenta : String;
implementation

uses UDatModInventario, Uglobal, UDatModCxc, UDatModIngresos,
  URegFpago, UCtrlIngresos, UBuscarProductoInvVenta, UInventarioProd,
  UMaestroClientes, UFormSelFecha, UBalanceCxcClientes, UTransaccionesCxc,
  UQckReporteFactura, URepResumenVentas, UDatModReportes, UDatModDespacho,
  UBuscarProductoInvDespacho, UReporteResumenDespacho, URepInventarioProd;

{$R *.dfm}

procedure TfrmProcesarDespachoVendedores.FormCreate(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
  dmInventario.tblInventarioProd.Open;
  dmDespacho.tblTipoDespacho.Close;
  dmDespacho.tblTipoDespacho.Open;
  dmDespacho.qryEmpleados.close;
  dmDespacho.qryEmpleados.open;  
  dmDespacho.tblDespachoMaster.Close;
  dmDespacho.tblDespachoMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmDespacho.tblDespachoMaster.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmDespacho.tblDespachoMaster.Open;
  //dmDespacho.tblDespachoDet.Close;
  //dmDespacho.tblDespachoDet.Open;
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
       //dmDespacho.tblDespachoMaster.DisableControls;
       //dmDespacho.tblDespachoDet.DisableControls;
     end else
  Caption:='Procesar Ventas '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria)+' '+
  FormatDatetime('hh:mma/p',now);  
end;

procedure TfrmProcesarDespachoVendedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if (dmDespacho.tblDespachoMaster.State in[dsInsert, dsEdit]) or
     (dmDespacho.tblDespachoDet.State in[dsInsert, dsEdit]) then
  begin
    Messagedlg('Hay una transaccion pendiente, verifique',mtError,[mbok],0);
    CanClose := False;
  end else
  CanClose := True;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn3Click(Sender: TObject);
var
  i : Integer;
begin
  if dmDespacho.tblDespachoMasterSTATUS.Value = 'A' then
  begin
    if rxDBGrid1.SelectedRows.Count>0 then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if MessageDlg('Borrar item?',mtWarning,[mbyes,mbno],0)=mryes then
        begin
          rxDBGrid1.DataSource.DataSet.Delete;
          dmDespacho.tblDespachoDet.ApplyUpdates;
          if Not dmDespacho.tblDespachoDet.Transaction.InTransaction then
          dmDespacho.tblDespachoDet.Transaction.StartTransaction;
          try
            dmDespacho.tblDespachoDet.Transaction.CommitRetaining;
          except
          dmDespacho.tblDespachoDet.Transaction.RollbackRetaining;
          end;
        end;
      end;
  end;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn1Click(Sender: TObject);
var
 fechaHoy:TDatetime;
begin
  //Proc:=0;
  if dmDespacho.tblDespachoMaster.State = dsBrowse then
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
      if (dmDespacho.tblDespachoMasterSTATUS.Value = 'A') and (dmDespacho.tblDespachoMaster.RecordCount > 0) then
      begin
        dmDespacho.tblDespachoDet.Insert;
        //dmDespacho.tblDespachoDetNUM_FACTURA.Value:= dmDespacho.tblDespachoMasterNUMERO_FACTURA.Value;
        dmDespacho.tblDespachoDetCODIGO_PROD.Value  := dmInventario.tblInventarioProdCODIGO.Value;
        dmDespacho.tblDespachoDetPRECIO.Value       := dmInventario.tblInventarioProdPRECIO.Value;
        dmDespacho.tblDespachoDetPORC_DESC_DET.Value:= dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
        dmDespacho.tblDespachoDetSTATUS_det.Value   := 'A';
        dmDespacho.tblDespachoDetCANTIDAD.Value := 1;
        CalcularItem;
      end else
      begin
        dmDespacho.tblDespachoMaster.Insert;
        dmDespacho.tblDespachoMasterCODIGO_EMP.Value := 0;
        dmDespacho.tblDespachoMasterCODIGO_DESPACHADOR.Value := VarUsuarioGlb;
        dmDespacho.tblDespachoMasterFECHA.Value      := ExtraerFecha(GlbFechaTrnDiaria);
        dmDespacho.tblDespachoMasterSTATUS.Value:='A';
        if dmDespacho.tblDespachoDet.State = dsBrowse then
        begin
          dmDespacho.tblDespachoDet.Insert;
          dmDespacho.tblDespachoDetCODIGO_PROD.Value:= dmInventario.tblInventarioProdCODIGO.Value;
          dmDespacho.tblDespachoDetPRECIO.Value     := dmInventario.tblInventarioProdPRECIO.Value;
          dmDespacho.tblDespachoDetPORC_DESC_DET.Value := dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
          dmDespacho.tblDespachoDetSTATUS_det.Value :='A';
          dmDespacho.tblDespachoDetCANTIDAD.Value   :=1;
          CalcularItem;
       end;
      end;
      Guardar;
    end;
  end;
  dmDespacho.tblDespachoDet.Edit;
  DBEdit9.SetFocus;
  DBEdit9.SelectAll;
end;


procedure TfrmProcesarDespachoVendedores.BitBtn5Click(Sender: TObject);
begin
  dmDespacho.tblDespachoDet.Cancel;
  dmDespacho.tblDespachoMaster.Cancel;
end;


procedure TfrmProcesarDespachoVendedores.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmProcesarDespachoVendedores.FormShow(Sender: TObject);
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
  if GlbFechaTrnDiaria = 0 then
  begin
    MessageDlg('Favor Salir del Programa para ajustar Fecha Trn Diaria',mtInformation, [mbOK], 0);
    Close;
  end;
end;

procedure TfrmProcesarDespachoVendedores.CalcularItem;
begin
  if dmDespacho.tblDespachoDet.state in [dsEdit, dsInsert] then
  begin
    dmDespacho.tblDespachoDetVALOR_BRUTO.Value :=
    dmDespacho.tblDespachoDetPRECIO.Value *
    dmDespacho.tblDespachoDetCANTIDAD.Value;
    dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value:=
    dmDespacho.tblDespachoDetVALOR_BRUTO.Value -
   (dmDespacho.tblDespachoDetVALOR_BRUTO.Value *
    dmDespacho.tblDespachoDetPORC_DESC_DET.Value/100);
  if dmInventario.tblInventarioProdPAGA_ITBI.Value = 1 then
  begin
    dmDespacho.tblDespachoDetITBI_DET.Value:=
    dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value *
    FGlbPorcItbi(ExtraerFecha(dmDespacho.tblDespachoMasterFECHA.Value), dmDespacho.tblDespachoDetCODIGO_PROD.Value) / 100;
    dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value:=
    dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value  +
    dmDespacho.tblDespachoDetITBI_DET.Value;
  end;
  end;
end;

procedure TfrmProcesarDespachoVendedores.DBEdit9Exit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmProcesarDespachoVendedores.DBEdit10Exit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmProcesarDespachoVendedores.DBEdit11Exit(Sender: TObject);
begin
  CalcularItem;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn7Click(Sender: TObject);
begin
  //Proc:=1;
  if dmDespacho.tblDespachoMaster.State = dsBrowse then
  begin
    dmDespacho.tblDespachoMaster.Insert;
    //dmDespacho.tblDespachoMasterCODIGO_EMP.Value := 0;
    dmDespacho.tblDespachoMasterFECHA.Value      := ExtraerFecha(GlbFechaTrnDiaria);
    dmDespacho.tblDespachoMasterSTATUS.Value:='A';
    dmDespacho.tblDespachoMasterCODIGO_DESPACHADOR.Value := VarUsuarioGlb;
    if dmDespacho.tblDespachoDet.State = dsBrowse then
    begin
      dmDespacho.tblDespachoDet.Insert;
      dmDespacho.tblDespachoDetSTATUS_DET.Value :='A';
      dmDespacho.tblDespachoDetCANTIDAD.Value   :=1;
      RxDBLookupCombo1.SetFocus;
    end;
    if dmDespacho.tblDespachoMaster.State = dsInsert then
    bitbtn7.Enabled:=false;
  end;
end;

procedure TfrmProcesarDespachoVendedores.RxDBLookupCombo2Change(Sender: TObject);
begin
 // if Proc = 0 then exit;
  if not dmInventario.tblInventarioProd.Locate('CODIGO',dmDespacho.tblDespachoDetCODIGO_PROD.Value,[]) then
  MessageDlg('Producto no encontrado, verifique',mtError,[mbOk],0)
  else
  begin
    if dmDespacho.tblDespachoDet.State in [dsEdit, dsInsert] then
    begin
      dmDespacho.tblDespachoDetDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
      dmDespacho.tblDespachoDetPRECIO.Value       := dmInventario.tblInventarioProdPRECIO.Value;
      dmDespacho.tblDespachoDetPORC_DESC_DET.Value:= dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
    end;
  end;
end;

procedure TfrmProcesarDespachoVendedores.DBEdit7Exit(Sender: TObject);
begin
  RxDBLookupCombo2Change(Self);  
end;

procedure TfrmProcesarDespachoVendedores.Guardar;
begin
  if dmDespacho.tblDespachoMaster.State in [dsEdit,dsInsert] then
  begin
    dmDespacho.tblDespachoMaster.Post;
    dmDespacho.tblDespachoMaster.ApplyUpdates;
    if Not dmDespacho.tblDespachoMaster.Transaction.InTransaction then
    dmDespacho.tblDespachoMaster.Transaction.StartTransaction;
    try
      dmDespacho.tblDespachoMaster.Transaction.CommitRetaining;
    except
    dmDespacho.tblDespachoMaster.Transaction.RollbackRetaining;
    end;
    if not EsCuadre then
    bitbtn7.Enabled:=True;
  end;
  if dmDespacho.tblDespachoDet.State in [dsEdit,dsInsert] then
  begin
    if dmDespacho.tblDespachoDet.State in [dsInsert] then  
    dmDespacho.tblDespachoDetNUMERO.Value:= dmDespacho.tblDespachoMasterNUMERO.Value;
    dmDespacho.tblDespachoDet.Post;
    dmDespacho.tblDespachoDet.ApplyUpdates;
    if Not dmDespacho.tblDespachoDet.Transaction.InTransaction then
    dmDespacho.tblDespachoDet.Transaction.StartTransaction;
    try
      dmDespacho.tblDespachoDet.Transaction.CommitRetaining;
    except
    dmDespacho.tblDespachoDet.Transaction.RollbackRetaining;
    end;
    SumarDetalle;
  end;
  RxDBLookupCombo4Exit(Self);
end;

procedure TfrmProcesarDespachoVendedores.BitBtn8Click(Sender: TObject);
begin
  Guardar;
end;

procedure TfrmProcesarDespachoVendedores.ProcesaVenta(tipo:Smallint;EsVenta:Boolean);
var
   impRecibo : Boolean;
begin
  impRecibo:=False;
  dmDespacho.qryBalanceDespacho.Close;
  dmDespacho.qryBalanceDespacho.Open;
  if (tipo = 0) And (EsVenta = False) And (dmDespacho.tblDespachoMasterSTATUS.Value = 'P') then //devolucion
  begin
    impRecibo:=True;
    if dmdespacho.tblDespachoMasterTIPO_TRN.IsNull then
    begin
      dmdespacho.tblDespachoMaster.Edit;
      dmdespacho.tblDespachoMasterTIPO_TRN.Value:=2;
      Guardar;
    end;
    strTipoVenta:='DEVOLUCION';
    ActualizaVentaDevolucion;
    ActualizaInventario(0);
    ActualizaBalanceDespacho(2);//Credito aqui voy mi dios
    ImpRecibo:=True;
  end;

  if (dmDespacho.tblDespachoMaster.State = dsBrowse) And
     (dmDespacho.tblDespachoMasterSTATUS.Value = 'A') then
  begin
    dmDespacho.tblDespachoMaster.Edit;
    dmDespacho.tblDespachoMasterSTATUS.Value := 'P';
    if (tipo = 1)  then //Entrada
    begin
      strTipoVenta:='Entrada'; //dios es todo
      ActualizaInventario(1);
      ActualizaBalanceDespacho(2);//aqui voy juan
      //ActualizaBalanceCte;
      impRecibo:=True;
    end else
    if (tipo = 2) then //Salida-Despacho
    begin
      strTipoVenta:='DESPACHO-SALIDA';
      if dmDespacho.tblDespachoMasterCODIGO_EMP.Value = 0 then
      begin
        Messagedlg('Codigo empleado no puede ser CERO ( 0 ), verifique',mtError,[mbok],0);
        exit;
      end;
       ActualizaInventario(0);
       ActualizaBalanceDespacho(1);
       //ActualizaBalanceCte;
       impRecibo:=True;
     end;
    if dmDespacho.tblDespachoMaster.State in [dsEdit,dsInsert] then
    begin
      dmDespacho.tblDespachoMaster.Post;
      dmDespacho.tblDespachoMaster.ApplyUpdates;
      if Not dmDespacho.tblDespachoMaster.Transaction.InTransaction then
      dmDespacho.tblDespachoMaster.Transaction.StartTransaction;
      try
        dmDespacho.tblDespachoMaster.Transaction.CommitRetaining;
      except
      dmDespacho.tblDespachoMaster.Transaction.RollbackRetaining;
      end;
    end;
 end;
 if not EsVenta then
   if impRecibo then ImprimirRecibo1Click(Self);
end;

procedure TfrmProcesarDespachoVendedores.GuardarIngreso;
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

procedure TfrmProcesarDespachoVendedores.ActualizaBalanceCte;
begin
  ActBalaceCteP;
end;

procedure TfrmProcesarDespachoVendedores.ActBalaceCteP;
begin
  dmDespacho.tblDespachoDet.first;
  while not dmDespacho.tblDespachoDet.Eof do
  begin
    if dmDespacho.QrybalanceDespacho.Locate('CODIGO;codigo_producto',
       VarArrayOf([dmDespacho.tblDespachoMastercodigo_emp.Value,
                   dmDespacho.tblDespachoDetcodigo_prod.Value]),[]) then
    begin
      EditarBalanceP;
    end else
    begin
      InsertaBalanceP;
    end;//Locate
    if dmDespacho.qryBalanceDespacho.state in [dsEdit,dsInsert] then
    begin
      dmDespacho.qryBalanceDespacho.Post;
      dmDespacho.qryBalanceDespacho.ApplyUpdates;
    end;
    if Not dmDespacho.qryBalanceDespacho.Transaction.InTransaction then
    dmDespacho.qryBalanceDespacho.Transaction.StartTransaction;
    try
      dmDespacho.qryBalanceDespacho.Transaction.CommitRetaining;
    except
    dmDespacho.qryBalanceDespacho.Transaction.RollbackRetaining;
    end;
    dmDespacho.tblDespachoDet.Next;
  end;

end;

procedure TfrmProcesarDespachoVendedores.EditarBalanceP;
begin
  dmDespacho.qryBalanceDespacho.Edit;
  dmDespacho.qryBalanceDespachoFECHA_BCE.Value:= dmDespacho.tblDespachoMasterFecha.Value;
  dmDespacho.qryBalanceDespachoBALANCE_ACT.Value:=//+
  dmDespacho.qryBalanceDespachoBALANCE_ACT.Value + dmDespacho.tblDespachoDetValor_Total_Det.Value;
  dmDespacho.qryBalanceDespachoDEBITO_MES.Value:=//+
  dmDespacho.qryBalanceDespachoDEBITO_MES.Value + dmDespacho.tblDespachoDetValor_Total_Det.Value;
  dmDespacho.qryBalanceDespachoDEBITO_ACM.Value:=//+
  dmDespacho.qryBalanceDespachoDEBITO_ACM.Value + dmDespacho.tblDespachoDetValor_Total_Det.Value;
end;

procedure TfrmProcesarDespachoVendedores.InsertaBalanceP;
begin
  dmDespacho.qryBalanceDespacho.Insert;
  dmDespacho.qryBalanceDespachoCODIGO_EMP.Value    :=dmDespacho.tblDespachoMastercodigo_emp.Value;
  dmDespacho.qryBalanceDespachoCODIGO_PRODUCTO.Value  :=dmDespacho.tblDespachoDetCODIGO_PROD.AsInteger;
  dmDespacho.qryBalanceDespachoSTATUS_BCE.Value:='A';
  dmDespacho.qryBalanceDespachoFECHA_BCE.Value :=dmDespacho.tblDespachoMasterfecha.Value;
  dmDespacho.qryBalanceDespachoFECHA_IN.Value  :=Now;
  dmDespacho.qryBalanceDespachoIN_POR.Value    :=StrUserName;
  if (dmDespacho.tblDespachoMasterTipo_trn.Value = 1) then //Entrada
  begin
    dmDespacho.qryBalanceDespachoBALANCE_ACT.Value:= dmDespacho.tblDespachoMasterMONTO_TOTAL.Value;
    dmDespacho.qryBalanceDespachoDEBITO_MES.Value :=  dmDespacho.tblDespachoMasterMONTO_TOTAL.Value;
    dmDespacho.qryBalanceDespachoDEBITO_ACM.Value :=  dmDespacho.tblDespachoMasterMONTO_TOTAL.Value;
  end else
  begin
    dmDespacho.qryBalanceDespachoBALANCE_ACT.Value:=//-
    dmDespacho.qryBalanceDespachoBALANCE_ACT.Value - dmDespacho.tblDespachoMasterMONTO_TOTAL.Value;
    dmDespacho.qryBalanceDespachoCREDITO_MES.Value:= dmDespacho.tblDespachoMasterMONTO_TOTAL.Value;
    dmDespacho.qryBalanceDespachoCREDITO_ACM.Value:= dmDespacho.tblDespachoMasterMONTO_TOTAL.Value;
    dmDespacho.qryBalanceDespachoFECHA_ULT_PAGO.Value:= dmDespacho.tblDespachoMasterfecha.Value;
  end;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn4Click(Sender: TObject);
begin
  if (dmDespacho.tblDespachoMaster.State = dsBrowse) And
     (dmDespacho.tblDespachoMasterSTATUS.Value = 'A') then
  begin
    if dmdespacho.tblDespachoMasterTIPO_TRN.IsNull then
    begin
      dmdespacho.tblDespachoMaster.Edit;
      dmdespacho.tblDespachoMasterTIPO_TRN.Value:=1;
      Guardar;
    end;
    ProcesaVenta(1,False)
  end;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn2Click(Sender: TObject);
begin
  if dmdespacho.tblDespachoMasterTIPO_TRN.IsNull then
  begin
    dmdespacho.tblDespachoMaster.Edit;
    dmdespacho.tblDespachoMasterTIPO_TRN.Value:=2;
    Guardar;
  end;
  dmDespacho.qryBalanceDespacho.close;
  dmDespacho.qryBalanceDespacho.open;
  ProcesaVenta(2,True);
end;

procedure TfrmProcesarDespachoVendedores.SumarDetalle;
var
  suma:Real;
begin
  dmDespacho.tblDespachoDet.DisableControls;
  if dmDespacho.tblDespachoDet.State = dsInactive then
  begin
    MessageDlg('Error linea 702 en uprocesarespacho unit, verificar',mtInformation, [mbOK], 0);
  end;
  dmDespacho.tblDespachoDet.First;
  While Not dmDespacho.tblDespachoDet.Eof do
  begin
    Suma := Suma + dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value;
    dmDespacho.tblDespachoDet.Next;
  end;
  dmDespacho.tblDespachoMaster.Edit;
  dmDespacho.tblDespachoMasterMONTO_TOTAL.Value:=Suma;
  dmDespacho.tblDespachoMaster.Post;
  dmDespacho.tblDespachoMaster.ApplyUpdates;
  if Not dmDespacho.tblDespachoMaster.Transaction.InTransaction then
  dmDespacho.tblDespachoMaster.Transaction.StartTransaction;
  try
    dmDespacho.tblDespachoMaster.Transaction.CommitRetaining;
  except
  dmDespacho.tblDespachoMaster.Transaction.RollbackRetaining;
  end;
  dmDespacho.tblDespachoDet.EnableControls;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn13Click(Sender: TObject);
begin
  if (dmDespacho.tblDespachoMasterSTATUS.Value = 'A') then
  if dmDespacho.tblDespachoDet.State = dsBrowse then
  begin
    dmDespacho.tblDespachoDet.Insert;
    dmDespacho.tblDespachoDetNUMERO.Value := dmDespacho.tblDespachoMasterNUMERO.Value;
    //dmDespacho.tblDespachoDetNUM_FACTURA.Value  := dmDespacho.tblDespachoMasterNUMERO_FACTURA.Value;
    dmDespacho.tblDespachoDetCODIGO_PROD.Value  := dmInventario.tblInventarioProdCODIGO.Value;
    //dmDespacho.tblDespachoDetCODIGO_BARRA.Value :=edtCodBarra.Text;
    //dmDespacho.tblDespachoDetDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
    dmDespacho.tblDespachoDetPRECIO.Value       := dmInventario.tblInventarioProdPRECIO.Value;
    dmDespacho.tblDespachoDetPORC_DESC_DET.Value:= dmInventario.tblInventarioProdPORC_DESCUENTO.Value;
    dmDespacho.tblDespachoDetSTATUS_DET.Value   :='A';
    dmDespacho.tblDespachoDetCANTIDAD.Value     :=1;
    CalcularItem;
    RxDBLookupCombo2.SetFocus;
  end;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn6Click(Sender: TObject);
begin
  case varTipousuario of
  0,2:begin
        If messagedlg('Procesar devolucion',mtWarning,[mbyes,mbno],0)=mryes then
        ProcesaVenta(0,False);
      end;
  else messagedlg('Usuario activo no tiene suficientes derechos.'#13'Favor llamar al supervisor.',mtError,[mbOk],0);
  end;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn14Click(Sender: TObject);
begin
  frmBuscarInvDespachoVendedores:=TfrmBuscarInvDespachoVendedores.Create(Nil);
  try
    frmBuscarInvDespachoVendedores.Showmodal;
  finally
  frmBuscarInvDespachoVendedores.Free;
  frmBuscarInvDespachoVendedores:=Nil;
  end;
  SumarDetalle;
end;

procedure TfrmProcesarDespachoVendedores.Actualizar1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(nil);
  try
    frmInventarioProd.Showmodal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
end;

procedure TfrmProcesarDespachoVendedores.Clientes1Click(Sender: TObject);
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
   frmClientes.Showmodal;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
end;

procedure TfrmProcesarDespachoVendedores.Consultar1Click(Sender: TObject);
begin
  frmSelFecha:=TfrmSelFecha.Create(nil);
  try
    if frmSelFecha.showmodal = mrOk then
    begin
      dmDespacho.tblDespachoMaster.Close;
      dmDespacho.tblDespachoMaster.Params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.Date);
      dmDespacho.tblDespachoMaster.Params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.Date);
      {dmDespacho.tblDespachoMaster.Params[2].Value:='A';
      dmDespacho.tblDespachoMaster.Params[3].Value:='P';
      dmDespacho.tblDespachoMaster.Params[4].Value:='C';}
      dmDespacho.tblDespachoMaster.Open;
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

procedure TfrmProcesarDespachoVendedores.CheckBox1Click(Sender: TObject);
begin
  CheckBox1.Checked:=False;
  RxLabel1.Visible :=False;
  CheckBox1.Visible:=False;
  Image1.Visible:=True;
end;

procedure TfrmProcesarDespachoVendedores.edtCodBarraExit(Sender: TObject);
begin
  if edtCodBarra.Text <> '' then
  BitBtn1Click(Self);
end;

procedure TfrmProcesarDespachoVendedores.DBEdit6Change(Sender: TObject);
begin
  if (dmDespacho.tblDespachoMasterSTATUS.Value = 'D') then
  begin
    BitBtn6.Enabled:=False;
    BitBtn2.Enabled:=False;
    BitBtn4.Enabled:=False;
    BitBtn3.Enabled:=False;
    BitBtn5.Enabled:=False;
  end else
  if (dmDespacho.tblDespachoMasterSTATUS.Value = 'P') then
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

procedure TfrmProcesarDespachoVendedores.ActualizaVentaDevolucion;
begin
  rxdatosdev.Close;
  rxdatosdev.Open;
  rxDatosVentaDevDet.Close;
  rxDatosVentaDevDet.Open;

  ProcesaDevolucionDetalleMem; 
  ProcesaDevolucionMasterMem;
  
  dmDespacho.tblDespachoMaster.Insert;
  dmDespacho.tblDespachoMasterCODIGO_DESPACHADOR.Value := VarUsuarioGlb;
  dmDespacho.tblDespachoMasterFECHA.Value          := rxDatosDevFecha.Value;
  dmDespacho.tblDespachoMasterCODIGO_EMP.Value     := rxDatosDevCodigo_cte.Value;
  dmdespacho.tblDespachoMasterCODIGO_RUTA.Value    := rxDatosDevcodigoRuta.Value;
  dmDespacho.tblDespachoMasterFECHA_IN.Value       := Now;
  dmDespacho.tblDespachoMasterTIPO_TRN.Value := 3;//devolucion
  dmDespacho.tblDespachoMasterMONTO_TOTAL.Value    := rxDatosDevValor_Total_Det.Value * -1;
  dmDespacho.tblDespachoMasterIN_POR.Value         := StrUserName;
  dmDespacho.tblDespachoMasterSTATUS.Value         := rxDatosDevstatus.Value;
  dmDespacho.tblDespachoMaster.Post;
  dmDespacho.tblDespachoMaster.ApplyUpdates;
  if Not dmDespacho.tblDespachoMaster.Transaction.InTransaction then
  dmDespacho.tblDespachoMaster.Transaction.StartTransaction;
  try
    dmDespacho.tblDespachoMaster.Transaction.CommitRetaining;
  except
  dmDespacho.tblDespachoMaster.Transaction.RollbackRetaining;
  end;

  rxDatosVentaDevDet.First;
  While Not rxDatosVentaDevDet.Eof do 
  begin
    dmDespacho.tblDespachoDet.Insert;
    //dmDespacho.tblDespachoDetNUM_FACTURA.Value  := dmDespacho.tblDespachoMasterNUMERO_FACTURA.Value;
    dmDespacho.tblDespachoDetNUMERO.Value      := dmDespacho.tblDespachoMasterNUMERO.Value; //rxDatosVentaDevDetNumero.Value;
    dmDespacho.tblDespachoDetCODIGO_PROD.Value := rxDatosVentaDevDetcodigo_prod.AsInteger;
    //dmDespacho.tblDespachoDetCODIGO_BARRA.Value:= rxDatosVentaDevDetcodigo_barra.Value;
    //dmDespacho.tblDespachoDetDESCRIPCION.Value := rxDatosVentaDevDetdescripcion.Value;
    dmDespacho.tblDespachoDetCANTIDAD.Value    := rxDatosVentaDevDetcantidad.Value;
    dmDespacho.tblDespachoDetPRECIO.Value      := rxDatosVentaDevDetprecio.Value;
    dmDespacho.tblDespachoDetPORC_DESC_DET.Value:= rxDatosVentaDevDetporc_desc_det.Value;
    dmDespacho.tblDespachoDetITBI_DET.Value     := rxDatosVentaDevDetitbi_det.Value;
    dmDespacho.tblDespachoDetVALOR_BRUTO.Value:= rxDatosVentaDevDetvalor_servicio_Det.Value;
    dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value   := rxDatosVentaDevDetvalor_total_det.Value;
    //dmDespacho.tblDespachoDetNUM_FACTURA.Value:= rxDatosVentaDevDetnum_factura.Value;
    dmDespacho.tblDespachoDetSTATUS_DET.Value := rxDatosVentaDevDetstatus_det.Value;
    dmDespacho.tblDespachoDet.Post;
    dmDespacho.tblDespachoDet.ApplyUpdates;
    if Not dmDespacho.tblDespachoDet.Transaction.InTransaction then
    dmDespacho.tblDespachoDet.Transaction.StartTransaction;
    try
      dmDespacho.tblDespachoDet.Transaction.CommitRetaining;
    except
    dmDespacho.tblDespachoDet.Transaction.RollbackRetaining;
    end;
    rxDatosVentaDevDet.Next;
  end;

end;

procedure TfrmProcesarDespachoVendedores.BitBtn5MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if dmDespacho.tblDespachoMaster.State in [dsEdit, dsInsert] then
  Bitbtn5.Enabled:=True;
end;

procedure TfrmProcesarDespachoVendedores.BalanceClientes1Click(Sender: TObject);
begin
  frmBalanceCxcCtes:=TfrmBalanceCxcCtes.Create(Nil);
  try
    frmBalanceCxcCtes.Showmodal;
  finally
  frmBalanceCxcCtes.Free;
  frmBalanceCxcCtes:=Nil;
  end;
end;

procedure TfrmProcesarDespachoVendedores.ImprimirRecibo1Click(Sender: TObject);
begin
  dmDespacho.tblDespachoMaster.DisableControls;
  dmDespacho.tblDespachoMaster.DisableControls;
  dmDespacho.tblDespachoDet.DisableControls;
  dmDespacho.tblDespachoDet.DisableControls;
  qckFactura:=TqckFactura.Create(nil);
  try
    qckFactura.Prepare;
    qckFactura.qrtipoVenta.caption:=strTipoVenta;
    qckFactura.TPag.Caption:=IntToStr(qckFactura.PageNumber);
    if MessageDlg('Imprimir factura?',mtinformation,[mbyes,mbno],0)=mryes then
    begin
      qckFactura.PrinterSetup;
      qckFactura.Print;
    end else
    qckFactura.Preview;
  finally
  qckFactura.free;
  qckFactura:=nil;
  end;
  dmDespacho.tblDespachoMaster.EnableControls;
  dmDespacho.tblDespachoMaster.EnableControls;
  dmDespacho.tblDespachoDet.EnableControls;
  dmDespacho.tblDespachoDet.EnableControls;
end;

procedure TfrmProcesarDespachoVendedores.ProcesaDevolucionDetalleMem;
begin
  dmDespacho.tblDespachoDet.First;
  while not dmDespacho.tblDespachoDet.Eof do
  begin
    rxDatosVentaDevDet.Insert;
    rxDatosVentaDevDetcodigo_prod.Value   := dmDespacho.tblDespachoDetCODIGO_PROD.AsString;
    //rxDatosVentaDevDetcodigo_barra.Value  := dmDespacho.tblDespachoDetCODIGO_BARRA.Value;
    //rxDatosVentaDevDetdescripcion.Value   := dmDespacho.tblDespachoDetDESCRIPCION.Value;
    rxDatosVentaDevDetcantidad.Value      := dmDespacho.tblDespachoDetCANTIDAD.Value * -1;
    rxDatosVentaDevDetprecio.Value        := dmDespacho.tblDespachoDetPRECIO.Value;
    rxDatosVentaDevDetporc_desc_det.Value := dmDespacho.tblDespachoDetPORC_DESC_DET.Value;
    rxDatosVentaDevDetitbi_det.Value      := dmDespacho.tblDespachoDetITBI_DET.Value* -1;
    rxDatosVentaDevDetvalor_servicio_Det.Value:= dmDespacho.tblDespachoDetVALOR_BRUTO.Value* -1;
    rxDatosVentaDevDetvalor_total_det.Value:= dmDespacho.tblDespachoDetVALOR_TOTAL_DET.Value* -1;
    //rxDatosVentaDevDetnum_factura.Value    := dmDespacho.tblDespachoDetNUM_FACTURA.AsInteger;
    rxDatosVentaDevDetNumero.Value         := dmDespacho.tblDespachoDetNUMERO.Value;
    rxDatosVentaDevDetstatus_det.Value     := dmDespacho.tblDespachoDetSTATUS_DET.Value;
    rxDatosVentaDevDet.Post;
    dmDespacho.tblDespachoDet.Next;
  end;
end;

procedure TfrmProcesarDespachoVendedores.ProcesaDevolucionMasterMem;
begin
  rxDatosDev.Insert;
  rxDatosDevfecha.Value          := dmDespacho.tblDespachoMasterFECHA.Value;
  rxDatosDevcodigo_cte.Value     := dmDespacho.tblDespachoMasterCODIGO_EMP.Value;
  //rxDatosDevforma_pago.Value     := dmDespacho.tblDespachoMasterFORMA_PAGO.Value;
  rxDatosDevobservacion.Value    := 'Devolucion Despacho #'+dmDespacho.tblDespachoMasterNUM_ORDEN.AsString;
  //rxDatosDevmoneda.Value         := dmDespacho.tblDespachoMasterMONEDA.Value;
  rxDatosDevvalor_total_det.Value:= dmDespacho.tblDespachoMasterMONTO_TOTAL.Value;
  rxDatosDevstatus.Value         := dmDespacho.tblDespachoMasterSTATUS.Value;
  rxDatosDevnumero_factura.Value := dmDespacho.tblDespachoMasterNUM_ORDEN.AsInteger;
  rxDatosDevcodigoRuta.Value     := dmdespacho.tblDespachoMasterCODIGO_RUTA.Value;
  rxDatosDevstatus.Value         := 'D';
  rxDatosDev.Post;
end;

procedure TfrmProcesarDespachoVendedores.ActualizaInventario(tipotrn:smallint);
begin
  dmDespacho.tblDespachoDet.First;
  While Not dmDespacho.tblDespachoDet.Eof do
  begin
    if dmInventario.tblInventarioProd.Locate('CODIGO',dmDespacho.tblDespachoDetCODIGO_PROD.Value,[]) then
    begin
      dmInventario.tblInventarioProd.Edit;
      dmInventario.tblInventarioProdFECHA_ULTIMA_TRN.Value:=ExtraerFecha(Date);
      dmInventario.tblInventarioProd.Post;
      dmInventario.tblInventarioProd.ApplyUpdates;
      if not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end;
    end;
    dmDespacho.IBStoredProc1.Params[0].Value:=dmDespacho.tblDespachoDetCODIGO_PROD.Value;
    dmDespacho.IBStoredProc1.Params[1].Value:=dmDespacho.tblDespachoDetCANTIDAD.Value;
    dmDespacho.IBStoredProc1.Params[2].Value:=tipotrn;
    dmDespacho.IBStoredProc1.Params[3].Value:=1;
    dmDespacho.IBStoredProc1.ExecProc;
    if not dmDespacho.IBStoredProc1.Transaction.InTransaction then
    dmDespacho.IBStoredProc1.Transaction.StartTransaction;
    try
      dmDespacho.IBStoredProc1.Transaction.CommitRetaining;
    except
    dmDespacho.IBStoredProc1.Transaction.RollbackRetaining;
    end;
    { if not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end; }
    dmDespacho.tblDespachoDet.Next;
  end;
end;

procedure TfrmProcesarDespachoVendedores.ResumenVentaporDia1Click(Sender: TObject);
begin
  frmSelFecha:=tfrmSelFecha.create(nil);
  try
    frmSelFecha.FechaIni.DateTime:=GlbFechaTrnDiaria;
    frmSelFecha.FechaFin.DateTime:=GlbFechaTrnDiaria;
    if frmSelFecha.ShowModal = mrOk then
    begin
    dmreportes.qryResumenDespacho.Close;
    dmreportes.qryResumenDespacho.params[0].Value:=ExtraerFecha(frmselfecha.FechaIni.DateTime);
    dmreportes.qryResumenDespacho.params[1].Value:=ExtraerFecha(frmselfecha.FechaFin.DateTime);
    dmreportes.qryResumenDespacho.open;
    qckResumenDespacho:=TqckResumenDespacho.Create(Nil);
    try
    qckResumenDespacho.Prepare;
    glbTPag := qckResumenDespacho.PageNumber;
    qckResumenDespacho.Preview;
  finally
  qckResumenDespacho.Free;
  qckResumenDespacho:=Nil;
  end;
  end;
  finally
  frmSelFecha.Free;
  frmSelFecha:=Nil
  end;
end;

procedure TfrmProcesarDespachoVendedores.Calculadora1Click(Sender: TObject);
begin
  if RxCalculator1.Execute then
  RxCalculator1.Value:=0;
end;

procedure TfrmProcesarDespachoVendedores.BitBtn15Click(Sender: TObject);
begin
  if RxCalculator1.Execute then
  RxCalculator1.Value:=0;
end;

procedure TfrmProcesarDespachoVendedores.DBEdit6Exit(Sender: TObject);
begin
  RxDBLookupCombo2.SetFocus;
end;

procedure TfrmProcesarDespachoVendedores.RxDBLookupCombo2Exit(
  Sender: TObject);
begin
  if dmDespacho.tblDespachoDet.State in [dsEdit, dsInsert] then
  dmDespacho.tblDespachoDetDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
end;

procedure TfrmProcesarDespachoVendedores.RxDBLookupCombo4Exit(
  Sender: TObject);
begin
  if EsCuadre then Exit;
  BitBtn4.Enabled:=False;
  BitBtn2.Enabled:=False;
  BitBtn6.Enabled:=False;
  if dmDespacho.tblDespachoMasterTIPO_TRN.Value = 1 then
  BitBtn4.Enabled := True else
  if dmDespacho.tblDespachoMasterTIPO_TRN.Value = 2 then
  BitBtn2.Enabled := True else
  if dmDespacho.tblDespachoMasterTIPO_TRN.Value = 3 then
  begin
    if dmDespacho.tblDespachoMasterSTATUS.Value = 'A' then
    BitBtn6.Enabled := True else BitBtn6.Enabled:=False;
  end;
end;

procedure TfrmProcesarDespachoVendedores.Inventario1Click(Sender: TObject);
begin
  dmReportes.qryDatosRepInventario.Close;
  dmReportes.qryDatosRepInventario.Open;
  qckRepDatosInventario:=TqckRepDatosInventario.Create(nil);
  try
    qckRepDatosInventario.Preview;
  finally
  qckRepDatosInventario.Free;
  qckRepDatosInventario:=Nil;
  end;
end;

procedure TfrmProcesarDespachoVendedores.ActualizaBalanceDespacho(
  tipotrn: smallint);
begin
  dmDespacho.tblDespachoDet.First;
  While Not dmDespacho.tblDespachoDet.Eof do
  begin
  if tipotrn = 2 then  //credito
  begin
    if dmDespacho.qryBalanceDespacho.Locate('CODIGO_EMP;CODIGO_RUTA;CODIGO_PRODUCTO',
                  VarArrayOf([dmDespacho.tblDespachoMasterCODIGO_EMP.Value,
                             dmDespacho.tblDespachoMasterCODIGO_RUTA.Value,
                             dmDespacho.tblDespachoDetCODIGO_PROD.Value]),[]) then
    begin
      dmDespacho.qryBalanceDespacho.Edit;
      dmDespacho.qryBalanceDespachoFECHA_BCE.Value  :=dmDespacho.tblDespachoMasterFECHA.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ANT.Value:=dmDespacho.qryBalanceDespachoBALANCE_ACT.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ACT.Value:=
      (dmDespacho.qryBalanceDespachoBALANCE_ACT.Value + dmDespacho.tblDespachoDetRECARGA.Value)
                                                      + dmDespacho.tblDespachoDetCANTIDAD.Value;


      dmDespacho.qryBalanceDespachoCREDITO_MES.Value:=dmDespacho.qryBalanceDespachoCREDITO_MES.Value -
                                                      dmDespacho.tblDespachoDetCANTIDAD.Value+
                                                      dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachoCREDITO_ACM.Value:=dmDespacho.qryBalanceDespachoCREDITO_ACM.Value -
                                                      dmDespacho.tblDespachoDetCANTIDAD.Value+
                                                      dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespacho.Post;
      dmDespacho.qryBalanceDespacho.ApplyUpdates;
      if Not dmDespacho.qryBalanceDespacho.Transaction.InTransaction Then
      dmDespacho.qryBalanceDespacho.Transaction.StartTransaction;
      try
        dmDespacho.qryBalanceDespacho.Transaction.CommitRetaining;
      except
      dmDespacho.qryBalanceDespacho.Transaction.RollbackRetaining;
      end;
    end else
    begin
      dmDespacho.qryBalanceDespacho.Insert;
      dmDespacho.qryBalanceDespachoCODIGO_PRODUCTO.Value:= dmDespacho.tblDespachoDetCODIGO_PROD.Value;
      dmDespacho.qryBalanceDespachoCODIGO_EMP.Value     := dmDespacho.tblDespachoMasterCODIGO_EMP.Value;
      dmDespacho.qryBalanceDespachoCODIGO_RUTA.Value    := dmDespacho.tblDespachoMasterCODIGO_RUTA.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ACT.Value    := -dmDespacho.tblDespachoDetCANTIDAD.Value +dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachoCREDITO_MES.Value:=dmDespacho.tblDespachoDetCANTIDAD.Value+dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachoCREDITO_ACM.Value:=dmDespacho.tblDespachoDetCANTIDAD.Value+dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachoSTATUS_BCE.Value:='A';
      dmDespacho.qryBalanceDespachoFECHA_BCE.Value :=dmDespacho.tblDespachoMasterfecha.Value;
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
  end else
  if tipotrn = 1 then    //debito
  begin
    if dmDespacho.qryBalanceDespacho.Locate('CODIGO_EMP;CODIGO_RUTA;CODIGO_PRODUCTO',
                  VarArrayOf([dmDespacho.tblDespachoMasterCODIGO_EMP.Value,
                             dmDespacho.tblDespachoMasterCODIGO_RUTA.Value,
                             dmDespacho.tblDespachoDetCODIGO_PROD.Value]),[]) then
    begin
      dmDespacho.qryBalanceDespacho.Edit;
      dmDespacho.qryBalanceDespachoBALANCE_ANT.Value:=dmDespacho.qryBalanceDespachoBALANCE_ACT.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ACT.Value:=//-
      dmDespacho.qryBalanceDespachoBALANCE_ACT.Value + dmDespacho.tblDespachoDetCANTIDAD.Value+
      dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachoDEBITO_MES.Value:=dmDespacho.qryBalanceDespachoDEBITO_MES.Value + dmDespacho.tblDespachoDetCANTIDAD.Value+
      dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachoDEBITO_ACM.Value:=dmDespacho.qryBalanceDespachoDEBITO_ACM.Value + dmDespacho.tblDespachoDetCANTIDAD.Value+
      dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespacho.Post;
      dmDespacho.qryBalanceDespacho.ApplyUpdates;
      if Not dmDespacho.qryBalanceDespacho.Transaction.InTransaction Then
      dmDespacho.qryBalanceDespacho.Transaction.StartTransaction;
      try
        dmDespacho.qryBalanceDespacho.Transaction.CommitRetaining;
      except
      dmDespacho.qryBalanceDespacho.Transaction.RollbackRetaining;
      end;
    end else
    begin
      dmDespacho.qryBalanceDespacho.Insert;
      dmDespacho.qryBalanceDespachoCODIGO_PRODUCTO.Value:= dmDespacho.tblDespachoDetCODIGO_PROD.Value;
      dmDespacho.qryBalanceDespachoCODIGO_EMP.Value     := dmDespacho.tblDespachoMasterCODIGO_EMP.Value;
      dmDespacho.qryBalanceDespachoCODIGO_RUTA.Value    := dmDespacho.tblDespachoMasterCODIGO_RUTA.Value;
      dmDespacho.qryBalanceDespachoBALANCE_ACT.Value    := dmDespacho.tblDespachoDetCANTIDAD.Value+dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachodebito_MES.Value:=dmDespacho.tblDespachoDetCANTIDAD.Value+dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachodebito_ACM.Value:=dmDespacho.tblDespachoDetCANTIDAD.Value + dmDespacho.tblDespachoDetRECARGA.Value;
      dmDespacho.qryBalanceDespachoSTATUS_BCE.Value:='A';
      dmDespacho.qryBalanceDespachoFECHA_BCE.Value :=dmDespacho.tblDespachoMasterfecha.Value;
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
  end;
  dmDespacho.tblDespachoDet.Next; 
  end;
end;

procedure TfrmProcesarDespachoVendedores.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if dmDespacho.tbldespachoDet.State = dsBrowse then
  begin
    if (Key = VK_DOWN) or
       ( (Key = VK_TAB) and
       (RxDBGrid1.SelectedIndex = RxDBGrid1.Columns.Count-1) ) then
    begin
      with (Sender as TRxDBGrid).DataSource.DataSet do
      begin
        DisableControls;
        Next;
        if EOF then Key := 0 else dmDespacho.tbldespachoDet.Prior;
        EnableControls;
      end;
    end;
  end;
end;

end.
