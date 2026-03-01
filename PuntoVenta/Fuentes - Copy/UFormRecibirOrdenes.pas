unit UFormRecibirOrdenes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, EditNew, Mask, DBCtrls, ComCtrls, Grids,
  Db, DBGrids, RXDBCtrl, ExtCtrls, RXCtrls, RxMemDS, RxLookup, rxToolEdit,
  WinSkinData, IBCustomDataSet, IBStoredProc, Menus;

type
  TfrmRecibirOrdenes = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Shape2: TShape;
    Label14: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtNumOrden: TEditN;
    edtFechaIni: TDateTimePicker;
    edtFechaFin: TDateTimePicker;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    StaticText2: TStaticText;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBStatusLabel1: TDBStatusLabel;
    Label8: TLabel;
    Totales: TRxMemoryData;
    TotalesSubTotal: TFloatField;
    Totalesitbis: TFloatField;
    Totalesmontodesc: TFloatField;
    Totalestotalneto: TFloatField;
    Totalesmontorecibido: TFloatField;
    Totalesdevolucion: TFloatField;
    TotalesCodCliente: TIntegerField;
    TotalesNombreCliente: TStringField;
    TotalesDireccion: TStringField;
    TotalesTelefono: TStringField;
    TotalesPorcDesAdicional: TFloatField;
    TotalesMontoDescAdicional: TFloatField;
    Totalesncf_numero: TStringField;
    TotalesMontoInteres: TCurrencyField;
    TotalesPorcientoInteres: TFloatField;
    TotalesqrLabelNcfDesc: TStringField;
    TotalesRnc_Numero: TStringField;
    chkExento: TCheckBox;
    Label10: TLabel;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    Shape1: TShape;
    RxDBGrid2: TRxDBGrid;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn13: TBitBtn;
    SkinData1: TSkinData;
    Label9: TLabel;
    Label19: TLabel;
    edtNumFactProv: TEditN;
    edtNumeroNCF: TEditN;
    Label20: TLabel;
    stpProcActBalanceProvcxp: TIBStoredProc;
    RxDBLookupCombo8: TRxDBLookupCombo;
    DBEdit14: TDBEdit;
    Label21: TLabel;
    BitBtn18: TBitBtn;
    tblPrecioXUnidadLevel: TIBDataSet;
    tblPrecioXUnidadLevelIDUNIDAD: TIntegerField;
    tblPrecioXUnidadLevelDESCRIPCION: TIBStringField;
    tblPrecioXUnidadLevelCOD_PRODUCTO: TIntegerField;
    tblPrecioXUnidadLevelCANTIDAD: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA1: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA2: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA3: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA4: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD1: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD2: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD3: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD4: TFloatField;
    tblPrecioXUnidadLevelCOD_USUARIO_IN: TIntegerField;
    tblPrecioXUnidadLevelCOD_USUARIO_UPD: TIntegerField;
    tblPrecioXUnidadLevelFECHA_IN: TDateTimeField;
    tblPrecioXUnidadLevelIN_POR: TIBStringField;
    tblPrecioXUnidadLevelFECHA_MOD: TDateTimeField;
    tblPrecioXUnidadLevelMOD_POR: TIBStringField;
    chkboxActPrecioXUnidad: TCheckBox;
    BitBtn29: TBitBtn;
    chkMarcarTodo: TCheckBox;
    BitBtn14: TBitBtn;
    MainMenu1: TMainMenu;
    ReImprimirFactura1: TMenuItem;
    Modificar1: TMenuItem;
    dtpkFechaFactura: TDateEdit;
    Label22: TLabel;
    chkEnviarEmail: TCheckBox;
    Recibidas1: TMenuItem;
    DBEdit5: TDBEdit;
    Label23: TLabel;
    ReEnviarOrdenporEmail1: TMenuItem;
    rxEmailEnviado: TRxMemoryData;
    rxEmailEnviadoNumero: TIntegerField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure chkMarcarTodoClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure ReImprimirFactura1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure Recibidas1Click(Sender: TObject);
    procedure ReEnviarOrdenporEmail1Click(Sender: TObject);

  private
    { Private declarations }
    Procedure CalcularPrecio(idx: smallint;porcValue: Extended;codProducto:Integer);
    procedure ProcesaCalculos;
    Function FuncGetFormaPago(var x:integer):Boolean;
    procedure ProcInsertarCXP(monto : Real);
    Procedure CalcularPrecioSurt(idx: smallint;porcValue: Extended; codProducto: Integer; cantUni:integer);
    Procedure ProcInsDespachoMaster;
    Procedure ProcInsDespachoDetalle;
    Procedure CalcularValoresDet;

    procedure Imprimir;
    procedure ProcEnviarEmail;
  public
    { Public declarations }
  end;

var
  frmRecibirOrdenes: TfrmRecibirOrdenes;
  porItbi : Currency;
implementation

uses UDatModRegOpeDiaria, UGlobal, UDatModInventario, UInventarioProd,
  URegFpago, UDatosVentas, UDatModCxp, UDatModConectar,
  UFormPrecioXUnidadNivel, UPrecioProdXUnidad, UBuscarProveedores,
  UDatModProveedor, UFormBuscarDatosEstudiantes, UBuscarProvConOrden,
  UDatModCompania, UDatModDespacho, UQckReporteFactura,
  UDatmodDatosGenerales, UQckOrdenCompraNew, UFormConsultarOrdenCompra,
  UQckOrdenCompraRecibida;

{$R *.dfm}

procedure TfrmRecibirOrdenes.SpeedButton1Click(Sender: TObject);
begin
  if (edtNumOrden.ValueInteger > 0) then
  begin
    dtmTransOpeDiaria.qryGetFechaOrden.Close;
    dtmTransOpeDiaria.qryGetFechaOrden.Params[0].Value:= edtNumOrden.ValueInteger;
    dtmTransOpeDiaria.qryGetFechaOrden.Open;

    if (dtmTransOpeDiaria.qryGetFechaOrden.RecordCount > 0) then
    begin
      dtmTransOpeDiaria.tblOrdenCompraMaster.Close;
      dtmTransOpeDiaria.tblOrdenCompraMaster.Params[0].Value:= ExtraerFecha(dtmTransOpeDiaria.qryGetFechaOrdenFECHA.Value);
      dtmTransOpeDiaria.tblOrdenCompraMaster.Params[1].Value:= ExtraerFecha(dtmTransOpeDiaria.qryGetFechaOrdenFECHA.Value);
      dtmTransOpeDiaria.tblOrdenCompraMaster.Open;
      dtmTransOpeDiaria.tblOrdenCompraMaster.Locate('NUM_ORDEN',edtNumOrden.ValueInteger,[]);
    end;
  end else
  begin
    dtmTransOpeDiaria.tblOrdenCompraMaster.Close;
    dtmTransOpeDiaria.tblOrdenCompraMaster.Params[0].Value:= ExtraerFecha(edtFechaIni.Date);
    dtmTransOpeDiaria.tblOrdenCompraMaster.Params[1].Value:= ExtraerFecha(edtFechaFin.Date);
    dtmTransOpeDiaria.tblOrdenCompraMaster.Open;
  end;
end;

procedure TfrmRecibirOrdenes.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.qryProveedor.Close;
  dtmTransOpeDiaria.qryProveedor.Open;
  edtFechaIni.Date:= GlbFechaTrnDiaria;
  edtFechaFin.Date:= GlbFechaTrnDiaria;
  dtmTransOpeDiaria.EsRecibiendoOrden:=True;
  dtmTransOpeDiaria.tblTipoCompra.Close;
  dtmTransOpeDiaria.tblTipoCompra.Open;
  dtpkFechaFactura.Date:=GlbFechaTrnDiaria;
end;

procedure TfrmRecibirOrdenes.CalcularPrecio(idx: smallint;
  porcValue: Extended;codProducto:Integer);
begin
  if dmInventario.tblInventarioProd.State in [dsBrowse,dsInactive] then exit;
  case idx of
  1:begin
      dmInventario.tblInventarioProdPRECIOVENTA1.Value:=
    (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;
  2:begin
     dmInventario.tblInventarioProdPRECIOVENTA2.Value:=
     (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;
  3:begin
     dmInventario.tblInventarioProdPRECIOVENTA3.Value:=
     (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;

  4:begin
     dmInventario.tblInventarioProdPRECIOVENTA4.Value:=
     (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    end;
  end;//case
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= dmInventario.tblInventarioProdPRECIOVENTA4.Value;
  dmInventario.tblInventarioProdPRECIO_ANT.Value:=dmInventario.tblInventarioProdPRECIO.Value;
  dmInventario.tblInventarioProdPRECIO.Value       := dmInventario.tblInventarioProdPRECIOVENTA1.Value;

  if dmInventario.tblInventarioProdPRECIO_MINIMO.Value > dmInventario.tblInventarioProdPRECIO.Value then
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= dmInventario.tblInventarioProdPRECIO.Value;
  if dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.IsNull then
  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=0;

  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=
  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value +
  dmInventario.tblInventarioProdCANTIDAD.Value;
end;

procedure TfrmRecibirOrdenes.BitBtn1Click(Sender: TObject);
var
  i, idx : integer;
  fpago : integer;
  suma : Currency;
  procesado : Boolean;
  fname : string;
begin
  if rxEmailEnviado.state = dsInactive then
  rxEmailEnviado.Open;

  if RxDBGrid1.SelectedRows.Count = 0 then
  begin
    MessageDlg('No ha seleccionado ningún record.', mtWarning, [mbOK], 0);
    Exit;
  end;
 fpago:= -1;
 suma := 0;
 procesado:=false;
 if (edtNumFactProv.Text = '') then
 begin
    MessageDlg('Favor indicar número factura',mtInformation, [mbOK], 0);
    edtNumFactProv.SetFocus;
    exit;
 end;
  if FuncGetFormaPago(fpago) then
  begin

  end else
  begin
    MessageDlg('Favor indicar forma de pago',mtInformation, [mbOK], 0);
    exit;
  end;
  if (dtmTransOpeDiaria.tblOrdenCompraMasterSTATUS_ORD.Value = 'R') then
  begin
    MessageDlg('Orden ya fue procesada, verifique.',mtInformation, [mbOK], 0);
    exit;
  end;
  if MessageDlg('Desea actualizar precios?',mtInformation, [mbyes,mbno], 0) = mryes then
  chkboxActPrecioXUnidad.Checked:=True
  else
  chkboxActPrecioXUnidad.Checked:=False;

  if dmInventario.tblInventarioProd.state = dsEdit then
  BitBtn4Click(Self);
  if dmInventario.tblInventarioProd.State = dsInactive then
  dmInventario.tblInventarioProd.Open;
  if RxDBGrid1.SelectedRows.Count > 0 then
  begin
    with RxDBGrid1.DataSource.DataSet do
    begin
      for i := 0 to RxDBGrid1.SelectedRows.Count-1 do
      begin
         GotoBookmark(Pointer(RxDBGrid1.SelectedRows.Items[i]));

        if dmInventario.tblInventarioProd.Locate('codigo', dtmTransOpeDiaria.tblOrdenCompraDetCOD_SERV_PROD.Value,[]) then
        begin
          suma:=suma + dtmTransOpeDiaria.tblOrdenCompraDetVALOR.Value +
          dtmTransOpeDiaria.tblOrdenCompraDetITBI_DET.Value
          - dtmTransOpeDiaria.tblOrdenCompraDetMONTO_DESCUENTO.Value;

          dmInventario.tblInventarioProd.Edit;
          dmInventario.tblInventarioProdCODFABRICANTE.Value:=dtmTransOpeDiaria.tblOrdenCompraMasterCODIGO_PROVEE.Value;
          if dmInventario.tblInventarioProdCANTIDAD.IsNull then
          dmInventario.tblInventarioProdCANTIDAD.Value:=0;
          
          if not dtmTransOpeDiaria.tblOrdenCompraDetCANT_OFERTA.IsNull then
          dmInventario.tblInventarioProdCANTIDAD.Value:=
          dmInventario.tblInventarioProdCANTIDAD.Value +
          dtmTransOpeDiaria.tblOrdenCompraDetCANTIDAD.Value +
          dtmTransOpeDiaria.tblOrdenCompraDetCANT_OFERTA.Value
          else
          dmInventario.tblInventarioProdCANTIDAD.Value:=
          dmInventario.tblInventarioProdCANTIDAD.Value +
          dtmTransOpeDiaria.tblOrdenCompraDetCANTIDAD.Value;
          
          if (GlbUsaPUnidadLevel = 1) then
          begin
            tblPrecioXUnidadLevel.Close;
            tblPrecioXUnidadLevel.Params[0].Value:= dmInventario.tblInventarioProdCODIGO.Value;
            tblPrecioXUnidadLevel.Open;
            tblPrecioXUnidadLevel.First;

            if (tblPrecioXUnidadLevel.RecordCount = 0) then
            begin
              frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
              try
                dmInventario.tblInventarioProd.Locate('codigo',dmInventario.tblInventarioProdCODIGO.Value,[]);
                frmPrecioUnidadNivel.buscarCodigo(dmInventario.tblInventarioProdCODIGO.Value);
                frmPrecioUnidadNivel.BitBtn1Click(Self);

        dmInventario.tblInventarioProd.DisableControls;
        dmInventario.tblInventarioProd.Locate('CODIGO',dmInventario.tblInventarioProdCODIGO.Value,[]);
        dmInventario.tblInventarioProd.EnableControls;

                frmPrecioUnidadNivel.Showmodal;
              finally
              frmPrecioUnidadNivel.Free;
              frmPrecioUnidadNivel:=Nil;
             end;
            end;

           tblPrecioXUnidadLevel.First;
           While Not tblPrecioXUnidadLevel.Eof do
           begin
             For idx:=1 To 4 Do
             begin
               tblPrecioXUnidadLevel.Edit;
               if dmInventario.tblInventarioProd.State = dsBrowse then
               dmInventario.tblInventarioProd.Edit;

               if (dtmTransOpeDiaria.tblOrdenCompraDetSTATUS.Value = 'A') then //Te Amo JesusCrist
               begin
                 fname :='PORCUTILIDAD'+IntToStr(idx);
                 dmInventario.tblInventarioProdPRECIO_COMPRA.Value := dtmTransOpeDiaria.tblOrdenCompraDetPRECIO.Value;
                 if not tblPrecioXUnidadLevel.Fieldbyname(fname).IsNull then
                 CalcularPrecioSurt(idx,tblPrecioXUnidadLevel.Fieldbyname(fname).AsVariant,
                 dmInventario.tblInventarioProdCODIGO.Value,tblPrecioXUnidadLevelCANTIDAD.AsInteger);

                 if dmInventario.tblInventarioProd.State = dsEdit then
                 begin
                   dmInventario.tblInventarioProd.Post;
                   dmInventario.tblInventarioProd.ApplyUpdates;
                 end;
               end;
             end;
             GlbSalvarQuery(tblPrecioXUnidadLevel);

             GlbSalvarQuery(dmInventario.tblInventarioProd);

        try
        if dmInventario.tblInventarioProdINVENTARIAR.Value = 1 then

        dmVentas.Proc_InsertarKardexDet(
        glbCia_Key,
        1, //TIPO SMALLINT,  --1-Entradas 2-Salida
        1, //TIPO_OPE SMALLINT,--1-Orden Compra 2-Venta 3-Devolucion 4-Transferencia 5-Dañado 6-Donacion 7-Otro
        now,
        dmInventario.tblInventarioProdCODIGO.Value, //CODIGO_PRODUCTO :integer;
        dtmTransOpeDiaria.tblOrdenCompraDetCANTIDAD.Value,
        dmInventario.tblInventarioProdPRECIO_COMPRA.Value, //COSTO_PRODUCTO :real;
        dmInventario.tblInventarioProdPRECIO.Value, // PRECIO_VENTA :real;
        VarUsuarioGlb, //CODIGO_USUARIO :integer;
        dtmTransOpeDiaria.tblOrdenCompraDetNUMERO.Value,//Numero trn despacho
        'A' //STATUS :string;
        ,'Recibir Orden Compra');
        except
        end;
        tblPrecioXUnidadLevel.Next;
       end;
       end else
       begin
          For idx:=1 To 4 Do
          begin
            if dmInventario.tblInventarioProd.State = dsbrowse then
            dmInventario.tblInventarioProd.Edit;
            if (dtmTransOpeDiaria.tblOrdenCompraDetSTATUS.Value = 'A') then
            begin
              fname :='PORCUTILIDAD'+IntToStr(idx);
              dmInventario.tblInventarioProdPRECIO_COMPRA.Value := dtmTransOpeDiaria.tblOrdenCompraDetPRECIO.Value;
              if not dmInventario.tblInventarioProd.Fieldbyname(fname).IsNull then
              CalcularPrecio(idx,dmInventario.tblInventarioProd.Fieldbyname(fname).AsVariant,
              dmInventario.tblInventarioProdCODIGO.Value);

              if dmInventario.tblInventarioProd.State = dsEdit then
              begin
                dmInventario.tblInventarioProd.Post;
                dmInventario.tblInventarioProd.ApplyUpdates;
             end;
            end;
          end;
         end;
       end;
        dtmTransOpeDiaria.tblOrdenCompraDet.Edit;
        dtmTransOpeDiaria.tblOrdenCompraDetMOD_POR.Value := StrUsername;
        dtmTransOpeDiaria.tblOrdenCompraDetFECHA_MOD.Value := now;
        dtmTransOpeDiaria.tblOrdenCompraDetSTATUS.Value := 'R';
        dtmTransOpeDiaria.tblOrdenCompraDet.FieldByName('cod_usuario_recibe').Value:=VarUsuarioGlb;
        //dtmTransOpeDiaria.tblOrdenCompraDet.State
        dtmTransOpeDiaria.tblOrdenCompraDet.Post;
        dtmTransOpeDiaria.tblOrdenCompraDet.ApplyUpdates;

        if not dtmTransOpeDiaria.tblOrdenCompraDet.Transaction.InTransaction then
        dtmTransOpeDiaria.tblOrdenCompraDet.Transaction.StartTransaction;
        try
          dtmTransOpeDiaria.tblOrdenCompraDet.Transaction.CommitRetaining;
        except
        dtmTransOpeDiaria.tblOrdenCompraDet.Transaction.RollbackRetaining;
        end;
        procesado := True;
        try
         if chkEnviarEmail.Checked then
         ProcEnviarEmail;
        except
        end;
      end;//end for i := 0 to RxDbGrid1.SelectedRows

      if not dmInventario.tblInventarioProd.Transaction.InTransaction then
      dmInventario.tblInventarioProd.Transaction.StartTransaction;
      try
        dmInventario.tblInventarioProd.Transaction.CommitRetaining;
      except
      dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
      end;
    end;//end with
  end; //end rxDebGrid1.SelectedRos.Count > 0

  if (fpago >= 0) and (procesado) then
  begin
    dtmTransOpeDiaria.tblOrdenCompraMaster.Edit;
    dtmTransOpeDiaria.tblOrdenCompraMasterNUMERO_NCF.Value:= edtNumeroNCF.Text;
    dtmTransOpeDiaria.tblOrdenCompraMasterFPAGO.Value  := fpago;
    dtmTransOpeDiaria.tblOrdenCompraMasterMOD_POR.Value:= StrUserName;
    dtmTransOpeDiaria.tblOrdenCompraMasterFECHA_MOD.Value:= now;
    dtmTransOpeDiaria.tblOrdenCompraMasterFecha_recibida.Value:= GlbFechaTrnDiaria;
    dtmTransOpeDiaria.tblOrdenCompraMasterSTATUS_ORD.Value    := 'R';
    dtmTransOpeDiaria.tblOrdenCompraMaster.Post;
    dtmTransOpeDiaria.tblOrdenCompraMaster.ApplyUpdates;

    if not dtmTransOpeDiaria.tblOrdenCompraMaster.Transaction.InTransaction then
    dtmTransOpeDiaria.tblOrdenCompraMaster.Transaction.StartTransaction;
    try
      dtmTransOpeDiaria.tblOrdenCompraMaster.Transaction.CommitRetaining;
    except
    dtmTransOpeDiaria.tblOrdenCompraMaster.Transaction.RollbackRetaining;
    end;
    if (fpago = 7) OR (fpago = 8) then
    ProcInsertarCXP(Suma);
    MessageDlg('Proceso finalizado.',mtInformation,[mbok],0);
  end;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value := glbCia_Key;
  dmInventario.tblInventarioProd.Open;
end;

procedure TfrmRecibirOrdenes.BitBtn9Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraDet.First;
end;

procedure TfrmRecibirOrdenes.BitBtn10Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraDet.Prior;
end;

procedure TfrmRecibirOrdenes.BitBtn11Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraDet.Next;
end;

procedure TfrmRecibirOrdenes.BitBtn12Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraDet.Last;
end;

procedure TfrmRecibirOrdenes.BitBtn2Click(Sender: TObject);
begin
 if dtmTransOpeDiaria.tblOrdenCompraDet.state = dsBrowse then
 dtmTransOpeDiaria.tblOrdenCompraDet.Edit;
end;

procedure TfrmRecibirOrdenes.BitBtn3Click(Sender: TObject);
begin
 if dtmTransOpeDiaria.tblOrdenCompraDet.state = dsBrowse then
 begin
   if (dtmTransOpeDiaria.tblOrdenCompraDetSTATUS.Value = 'A') then
   begin
     if MessageDlg('Cancelar record?',mtwarning,[mbyes,mbno],0) = mrYes then
     begin
       dtmTransOpeDiaria.tblOrdenCompraDet.Edit;
       dtmTransOpeDiaria.tblOrdenCompraDetSTATUS.Value :='A';
       BitBtn4Click(Self);
     end;
   end;
 end else
 dtmTransOpeDiaria.tblOrdenCompraDet.Cancel;
end;

procedure TfrmRecibirOrdenes.BitBtn4Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblOrdenCompraDet.state in [dsEdit,dsinsert] then
  begin
    GlbSalvarQuery(dtmTransOpeDiaria.tblOrdenCompraDet);
  end;
  CalcularValoresDet;
end;

procedure TfrmRecibirOrdenes.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if (dtmTransOpeDiaria.tblOrdenCompraDetSTATUS.Value ='R') then
  Background := clTeal else
  if (dtmTransOpeDiaria.tblOrdenCompraDetSTATUS.Value ='C') then
  Background := clGray;

end;

procedure TfrmRecibirOrdenes.ProcesaCalculos;
begin
  //rxVenta.AutoCalcFields:=False;
  if dtmTransOpeDiaria.tblOrdenCompraDet.State In [dsEdit, dsInsert] then
  begin
    dtmTransOpeDiaria.tblOrdenCompraDetVALOR.Value:= dtmTransOpeDiaria.tblOrdenCompraDetCANTIDAD.Value * dtmTransOpeDiaria.tblOrdenCompraDetPrecio.Value;
    //if EsDevolucion then
    //rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * -1;

    porItbi := FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dtmTransOpeDiaria.tblOrdenCompraDetCOD_SERV_PROD.Value);

    if chkExento.Checked then
    porItbi:=0;

    //if Not EsDevolucion then
    //rxVentaPorc_Desc.Value := qryInventarioPORC_DESCUENTO.Value;

    if dtmTransOpeDiaria.tblOrdenCompraDetPORC_DESC_DET.Value > 0 then
    dtmTransOpeDiaria.tblOrdenCompraDetMONTO_DESCUENTO.Value :=
    (dtmTransOpeDiaria.tblOrdenCompraDetVALOR.Value * dtmTransOpeDiaria.tblOrdenCompraDetPORC_DESC_DET.Value/100)
    else dtmTransOpeDiaria.tblOrdenCompraDetMONTO_DESCUENTO.Value := 0;

    //if (TotalesPorcDesAdicional.Value > 0) then
    //TotalesMontoDescAdicional.Value:= (rxVentaMontoBruto.Value * TotalesPorcDesAdicional.Value / 100);
    //rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value
    //- TotalesMontoDescAdicional.Value;
    dtmTransOpeDiaria.tblOrdenCompraDetITBI_DET.Value:=0;
    if (dmInventario.tblInventarioProdPAGA_ITBI.Value = 1) And (not chkExento.Checked) then
    dtmTransOpeDiaria.tblOrdenCompraDetITBI_DET.Value:=
    ((dtmTransOpeDiaria.tblOrdenCompraDetVALOR.Value -
      dtmTransOpeDiaria.tblOrdenCompraDetMONTO_DESCUENTO.Value) * porItbi / 100);

    //rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    dtmTransOpeDiaria.tblOrdenCompraDet.Post;
  end;
  //dtmTransOpeDiaria.tblOrdenCompraDet.AutoCalcFields:=False;
end;

procedure TfrmRecibirOrdenes.BitBtn5Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraMaster.First;
end;

procedure TfrmRecibirOrdenes.BitBtn6Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraMaster.Prior;
end;

procedure TfrmRecibirOrdenes.BitBtn7Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraMaster.Next;
end;

procedure TfrmRecibirOrdenes.BitBtn8Click(Sender: TObject);
begin
  dtmTransOpeDiaria.tblOrdenCompraMaster.Last;
end;

procedure TfrmRecibirOrdenes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmTransOpeDiaria.EsRecibiendoOrden:= False;
  dtmTransOpeDiaria.qryGetFechaOrden.Close;
  dtmTransOpeDiaria.tblOrdenCompraMaster.Close;
end;

procedure TfrmRecibirOrdenes.BitBtn13Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(nil);
  try
    frmInventarioProd.Showmodal;
  finally
  frmInventarioProd.free;
  frmInventarioProd:=nil;
  end;
end;

procedure TfrmRecibirOrdenes.FormShow(Sender: TObject);
begin
  edtNumOrden.SetFocus;
end;

function TfrmRecibirOrdenes.FuncGetFormaPago(var x: integer): Boolean;
begin
  Result:=False;
  frmFormaPago:=TfrmFormaPago.Create(Nil);
  try
    if frmFormaPago.Showmodal = mrOk then
    begin
      x:=dmVentas.TblFormaPagoCODIGO.Value;
      result:=True;
    end else x:=-1;
  finally
  frmFormaPago.Free;
  frmFormaPago:=Nil;
  end;
end;

procedure TfrmRecibirOrdenes.ProcInsertarCXP(monto: Real);
begin
  dmCxp.tblTransCxp.Close;
  dmCxp.tblTransCxp.Params[0].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxp.tblTransCxp.Params[1].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxp.tblTransCxp.Open;

  dmCxp.tblTransCxp.Insert;
  dmCxp.tblTransCxpSTATUS.Value   := 'A';
  dmCxp.tblTransCxpTIPO_DOC.Value := 2; //Factura
  dmCxp.tblTransCxpconcepto.Value := 'Compra';

  dmCxp.tblTransCxpmoneda.Value  := '1';
  dmCxp.tblTransCxpfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

  dmCxp.tblTransCxpcodigo_cliente.Value := dtmTransOpeDiaria.tblOrdenCompraMasterCODIGO_PROVEE.Value;
  dmCxp.tblTransCxpcodigo_serv.Value    := 0;
  dmCxp.tblTransCxpNUMERO_DOC.Value     := edtNumFactProv.ValueInteger;

  dmCxp.tblTransCxpvalor_documento.Value:= Monto;
  dmCxp.tblTransCxptipo_tranf.Value     := 1;//Debito
  dmCxp.tblTransCxptipo_serv.Value      := 2;
  dmCxp.tblTransCxpfecha_in.Value       := Now;
  dmCxp.tblTransCxpIN_POR.Value         := StrUserName;
  dmCxp.tblTransCxp.Post;
  dmCxp.tblTransCxp.ApplyUpdates;

  if Not dmCxp.tblTransCxp.Transaction.InTransaction then
  dmCxp.tblTransCxp.Transaction.StartTransaction;
  try
    dmCxp.tblTransCxp.Transaction.CommitRetaining;
  except
  dmCxp.tblTransCxp.Transaction.RollbackRetaining;
  end;
  dmcxp.stpInsFactPendiente.Params[0].Value := dtmTransOpeDiaria.tblOrdenCompraMasterCODIGO_PROVEE.Value;
  dmcxp.stpInsFactPendiente.Params[1].Value := 0;
  dmcxp.stpInsFactPendiente.Params[2].Value := '1';
  //if (rxDataNumConduce.Value > 0) then
  //dmcxp.stpInsFactPendiente.Params[3].Value := rxDataNumConduce.Value
  //else
  dmcxp.stpInsFactPendiente.Params[3].Value := edtNumFactProv.ValueInteger;//edtNumConduce.ValueInteger;

  dmcxp.stpInsFactPendiente.Params[4].Value := Monto;
  dmcxp.stpInsFactPendiente.Params[5].Value := dmcxp.tblTransCxpFECHA.Value;
  if not dtmTransOpeDiaria.tblOrdenCompraMasterNUMERO_NCF.IsNull then
  dmcxp.stpInsFactPendiente.Params[6].Value := MyStrCopyRango(dtmTransOpeDiaria.tblOrdenCompraMasterNUMERO_NCF.Value,10,11)
  else
  dmcxp.stpInsFactPendiente.Params[6].Value := null;

  if not dtmTransOpeDiaria.qryProveedorCANT_DIAS_CREDITO.IsNull then
  dmcxp.stpInsFactPendiente.Params[7].Value :=
  ExtraerFecha(dtpkFechaFactura.Date) + dtmTransOpeDiaria.qryProveedorCANT_DIAS_CREDITO.Value
  else
  dmcxp.stpInsFactPendiente.Params[7].Value := ExtraerFecha(dtpkFechaFactura.Date)+30;
  dmcxp.stpInsFactPendiente.Params[8].Value := edtNumFactProv.Text;
  dmcxp.stpInsFactPendiente.ExecProc;
  if Not dmCxp.stpInsFactPendiente.Transaction.InTransaction then
  dmCxp.stpInsFactPendiente.Transaction.StartTransaction;
  try
    dmCxp.stpInsFactPendiente.Transaction.CommitRetaining;
  except
  dmCxp.stpInsFactPendiente.Transaction.RollbackRetaining;
  end;
  
  stpProcActBalanceProvcxp.Params[0].Value := dmCxp.tblTransCxpCodigo_cliente.Value;
  stpProcActBalanceProvcxp.Params[1].Value := dmCxp.tblTransCxpCODIGO_SERV.Value;
  stpProcActBalanceProvcxp.Params[2].Value := dmCxp.tblTransCxpMONEDA.Value;
  stpProcActBalanceProvcxp.Params[3].Value := 1;
  stpProcActBalanceProvcxp.Params[4].Value := dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
  stpProcActBalanceProvcxp.Params[5].Value := dmCxp.tblTransCxpFECHA.Value;
  stpProcActBalanceProvcxp.Params[6].Value := dmCxp.tblTransCxpSERIE.Value;
  stpProcActBalanceProvcxp.ExecProc;
end;

procedure TfrmRecibirOrdenes.RxDBGrid1DblClick(Sender: TObject);
begin
  RxDBGrid1.SelectAll;
end;

procedure TfrmRecibirOrdenes.BitBtn18Click(Sender: TObject);
var _Guarda : boolean;
begin
  _Guarda:=False;
  if dtmTransOpeDiaria.tblOrdenCompraMaster.State = dsBrowse then
  begin
    dtmTransOpeDiaria.tblOrdenCompraMaster.Edit;
    _Guarda:=True;
  end;
  dtmTransOpeDiaria.tblOrdenCompraMasterIDTIPO_COMPRA.AsVariant:=null;
  if _Guarda then
  BitBtn4Click(Self);
end;

procedure TfrmRecibirOrdenes.CalcularPrecioSurt(idx: smallint;
  porcValue: Extended; codProducto, cantUni: integer);
begin
  if not chkboxActPrecioXUnidad.Checked then Exit;

  dmInventario.tblInventarioProdPRECIO_ANT.Value:=dmInventario.tblInventarioProdPRECIO.Value;

  dmInventario.tblInventarioProdPRECIO.Value :=
  (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value  * cantUni);

  if tblPrecioXUnidadLevel.State in [dsBrowse,dsInactive] then exit;
  case idx of
  1:begin
      tblPrecioXUnidadLevelPRECIOVENTA1.Value:=
      (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);

      if (GLBAplicaITBISLevel = 1) then
      tblPrecioXUnidadLevelPRECIOVENTA1.Value:=
      tblPrecioXUnidadLevelPRECIOVENTA1.Value
      * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  2:begin
     tblPrecioXUnidadLevelPRECIOVENTA2.Value:=
     (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);
     if (GLBAplicaITBISLevel = 1) then
    tblPrecioXUnidadLevelPRECIOVENTA2.Value:=
    tblPrecioXUnidadLevelPRECIOVENTA2.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  3:begin
     tblPrecioXUnidadLevelPRECIOVENTA3.Value:=
     (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);
     if (GLBAplicaITBISLevel = 1) then
    tblPrecioXUnidadLevelPRECIOVENTA3.Value:=
    tblPrecioXUnidadLevelPRECIOVENTA3.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;

  4:begin
     tblPrecioXUnidadLevelPRECIOVENTA4.Value:=
     (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);
     
     if (GLBAplicaITBISLevel = 1) then     
    tblPrecioXUnidadLevelPRECIOVENTA4.Value:=
    tblPrecioXUnidadLevelPRECIOVENTA4.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria), dmInventario.tblInventarioProdCODIGO.Value)/100);

    dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=
    (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);
    end;
  end;//case
  //dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= dmInventario.tblInventarioProdPRECIOVENTA4.Value;

  if dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.IsNull then
  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=0;

  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=
  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value +
  dmInventario.tblInventarioProdCANTIDAD.Value;
end;

procedure TfrmRecibirOrdenes.BitBtn29Click(Sender: TObject);
var
  xProd : integer;
begin
  if GlbUsaPUnidadLevel = 1 then
  begin
    xProd :=dtmTransOpeDiaria.tblOrdenCompraDetCOD_SERV_PROD.Value;  //dmInventario.tblInventarioProdCodigo.Value;
    frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
    try
      frmPrecioUnidadNivel.buscarCodigo(xProd);
        dmInventario.tblInventarioProd.DisableControls;
        dmInventario.tblInventarioProd.Locate('CODIGO',xProd,[]);
        dmInventario.tblInventarioProd.EnableControls;
      frmPrecioUnidadNivel.Showmodal;
    finally
    frmPrecioUnidadNivel.Free;
    frmPrecioUnidadNivel:=Nil;
    end;
  end else
  begin
    frmPrecioProdXUnidad:=TfrmPrecioProdXUnidad.Create(nil);
    try
      frmPrecioProdXUnidad.buscarCodigo(dtmTransOpeDiaria.tblOrdenCompraDetCOD_SERV_PROD.Value);
      frmPrecioProdXUnidad.Showmodal;
    finally
    frmPrecioProdXUnidad.Free;
    frmPrecioProdXUnidad:=Nil;
    end;
  end;
end;

procedure TfrmRecibirOrdenes.chkMarcarTodoClick(Sender: TObject);
begin
  if chkMarcarTodo.Checked then
  RxDBGrid1.SelectAll
  else RxDBGrid1.UnselectAll;
end;

procedure TfrmRecibirOrdenes.BitBtn14Click(Sender: TObject);
begin
  if (GlbColegio = 0) then
  begin
    frmProcBuscarProvOrden:=TfrmProcBuscarProvOrden.Create(Nil);
    try
      if frmProcBuscarProvOrden.Showmodal = mrOk then
      begin
        edtNumOrden.SetInteger(frmProcBuscarProvOrden.numOrden);
     end;
    finally
    frmProcBuscarProvOrden.Free;
    frmProcBuscarProvOrden:=Nil;
    end;
  end;
  if (edtNumOrden.Text <> '') then
  SpeedButton1Click(Self);
end;

procedure TfrmRecibirOrdenes.ReImprimirFactura1Click(Sender: TObject);
var
  sNum : Integer;
begin
  if dtmTransOpeDiaria.tblOrdenCompraMaster.State = dsInactive then
  begin
    //MessageDlg('Favor indicar proveedor', mtInformation, [mbOK], 0);
    //RxDBLookupCombo3.SetFocus;
    Exit;
  end;
  //strTipoVenta:='Entrada';
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmDespacho.tblDespachoMasterRep.Close;
  sNum:=0;
  sNum := dtmTransOpeDiaria.tblOrdenCompraMasterNUM_ORDEN.Value;

  dmdatos.qryDatosOrdenImp.Close;
  dmdatos.qryDatosOrdenImp.Params[0].Value:= sNum;
  dmdatos.qryDatosOrdenImp.Open;

          qckOrdenDeCompraRecibida:=TqckOrdenDeCompraRecibida.Create(Nil);
          try
            qckOrdenDeCompraRecibida.Prepare;
            if (dmdatos.qryDatosOrdenImpSTATUS_ORD.Value = 'P') then
            qckOrdenDeCompraRecibida.qrLabelReImp.Visible := True
            else
            qckOrdenDeCompraRecibida.qrLabelReImp.Visible:= False;

            //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
            if MessageDlg('Imprimir?',mtinformation,[mbyes, mbno],0) = mrno then
               qckOrdenDeCompraRecibida.Preview
            else
            begin
              qckOrdenDeCompraRecibida.PrinterSetup;
              qckOrdenDeCompraRecibida.Print;
            end;
            {if chkEnviarEmail.Checked then
            begin
              GlbIDTipoEmail:=100;
              GlbEnviaEmail:=True;
              GlbSubject:='Orden de Compra Recibida';
              ReportExport(qckOrdenDeCompraNew,GlbRutaInformes+'OrdenCompraNum'+dmdatos.qryDatosOrdenImp.Params[0].AsString+'_'+
              FormatDateTime('yyyymmdd', dmdatos.qryDatosOrdenImpFECHA.Value)+'.pdf');
              GlbIDTipoEmail:=0;
              GlbSubject:='';
            end; }
          finally
          qckOrdenDeCompraRecibida.Free;
          qckOrdenDeCompraRecibida:=Nil;
          end;
  exit;

  dmDespacho.tblDespachoMasterRep.Params[0].Value:= sNum;
  //StrToInt(Inputbox('Re-imprimir factura','Entre número',InttoStr(sNum)));

  dmDespacho.tblDespachoMasterRep.Params[1].Value:=dtmTransOpeDiaria.tblOrdenCompraMasterCODIGO_PROVEE.Value;
  dmDespacho.tblDespachoMasterRep.Open;
  dmVentas.qryProveedor.Close;
  dmVentas.qryProveedor.Params[0].Value:= dtmTransOpeDiaria.tblOrdenCompraMasterCODIGO_PROVEE.Value;//dmDespacho.tblDespachoMasterRepCODIGO_PROV.Value;
  dmVentas.qryProveedor.Open;
  Imprimir;  
end;

procedure TfrmRecibirOrdenes.Imprimir;
begin
  qckFactura:=TqckFactura.Create(Nil);
  try
    qckFactura.Prepare;
    qckFactura.qrtipoVenta.Caption := 'Entrada';
    qckFactura.TPag.Caption:=IntToStr(qckFactura.PageNumber);
    if MessageDlg('Imprimir factura?', mtInformation,[mbYes, mbNo],0) = mrYes then
    begin
      qckFactura.PrinterSetup;
      qckFactura.Print;
    end else
    qckFactura.Preview;
  finally
  qckFactura.Free;
  qckFactura:=Nil;
  end;

end;

procedure TfrmRecibirOrdenes.ProcInsDespachoDetalle;
var
  idx : integer;
   fname : string;
begin
  {dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;            //13994

  rxData.AutoCalcFields := false;
  rxData.First;
  While Not rxdata.Eof do
  begin
    if GlbEsDebugEntradas = 1 then
    begin
      WriteToLog('*** INI *** LOTE NUMERO: '+edtLotNum.Text);
      WriteToLog('Codigo Producto: '+rxDataCodigoProd.AsString);
      qryVerifica.Close;
      qryVerifica.Params[0].Value:= rxDataCodigoProd.AsInteger;
      qryVerifica.Open;
      WriteToLog('Balance Anterior: '+qryVerificaCANTIDAD.AsString);
    end;
    //stpProcInsDespachoDet.Params[0].Value :=
    stpProcInsDespachoDet.Params[1].Value := stpProcInsDespachoMaster.Params[0].Value;
    stpProcInsDespachoDet.Params[2].Value := 1;//tipo_trn
    stpProcInsDespachoDet.Params[3].Value := rxDataCodigoProd.AsInteger;//cod_producto
    stpProcInsDespachoDet.Params[4].Value := rxDataCantidad.AsInteger;//cantidad
    stpProcInsDespachoDet.Params[5].Value := rxDataPrecio.Value;
    stpProcInsDespachoDet.Params[6].Value := rxDataporc_desc.Value;
    stpProcInsDespachoDet.Params[7].Value := rxDataitbi.Value;
    stpProcInsDespachoDet.Params[8].Value := rxDatavalor.Value;
    stpProcInsDespachoDet.Params[9].Value := rxDatatotal_neto.Value;
    stpProcInsDespachoDet.Params[10].Value := Null; //Num_orden
    stpProcInsDespachoDet.Params[11].Value := 'A';
    stpProcInsDespachoDet.Params[12].Value := Now;
    nombreuser:=StrUserName;
    stpProcInsDespachoDet.Params[13].Value := nombreuser;
    stpProcInsDespachoDet.Params[14].Value := Null;
    stpProcInsDespachoDet.Params[15].Value := Null;
    stpProcInsDespachoDet.Params[16].Value := rxDataDescProducto.Value;
    stpProcInsDespachoDet.Params[17].Value := Null;
    stpProcInsDespachoDet.Params[18].Value := rxDataCantUnidad.Value;
    stpProcInsDespachoDet.Params[19].Value := rxDataunidadId.Value;
    stpProcInsDespachoDet.Params[20].Value := rxDataCantOferta.Value;// edtCantOferta.ValueInteger;
    stpProcInsDespachoDet.ExecProc; }
end;

procedure TfrmRecibirOrdenes.ProcInsDespachoMaster;
var
  suma : Real;
begin
  //pendiente de revision
  {rxData.AutoCalcFields := False;
  rxData.First;
  Suma:=0;
  While Not rxData.Eof Do
  begin
    Suma:=Suma + rxDataTotal_neto.Value;
    rxData.Next;
  end;

  stpProcInsDespachoMaster.Params[2].Value := ExtraerFecha(rxDataFecha.Value);//fecha
  stpProcInsDespachoMaster.Params[3].Value := rxDataTipo_trn.Value;//tipo_trn
  stpProcInsDespachoMaster.Params[4].Value := VarUsuarioGlb;//codigo_despachador
  stpProcInsDespachoMaster.Params[5].Value := VarUsuarioGlb;//codigo_emp
  stpProcInsDespachoMaster.Params[6].Value := suma;//monto_total
  stpProcInsDespachoMaster.Params[7].Value := 'A';//status //0//num_orden
  stpProcInsDespachoMaster.Params[8].Value := GlbFechaTrnDiaria; //fecha_in
  nombreuser:=StrUserName;
  stpProcInsDespachoMaster.Params[9].Value :=  nombreuser;//in_por
  stpProcInsDespachoMaster.Params[10].Value := GlbFechaTrnDiaria;//fecha_mod
  stpProcInsDespachoMaster.Params[11].Value := Null;//mod_por
  stpProcInsDespachoMaster.Params[12].Value := 0;//codigo_ruta registro pedido
  stpProcInsDespachoMaster.Params[13].Value := rxDataNumConduce.Value;//num_conduce
  stpProcInsDespachoMaster.Params[14].Value := rxProveedorCodigo.Value;
  stpProcInsDespachoMaster.Params[15].Value := rxProveedorNCF.Value;
  stpProcInsDespachoMaster.Params[16].Value := rxProveedorRNCPROVEEDOR.Value;
  stpProcInsDespachoMaster.Params[17].Value := 1;//Master;
  stpProcInsDespachoMaster.Params[18].Value := Null;//serie_inv_id
  stpProcInsDespachoMaster.Params[19].Value := Null;//inv_id_origen
  stpProcInsDespachoMaster.Params[20].Value := Null;//inv_id_destino
  stpProcInsDespachoMaster.Params[21].Value := rxProveedorFormaPago.Value;
  stpProcInsDespachoMaster.ExecProc;
  if not stpProcInsDespachoMaster.Transaction.InTransaction then
  stpProcInsDespachoMaster.Transaction.StartTransaction;
  try
    stpProcInsDespachoMaster.Transaction.CommitRetaining;
  except
  stpProcInsDespachoMaster.Transaction.RollbackRetaining;
  end;}
end;

procedure TfrmRecibirOrdenes.DBEdit1Change(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblOrdenCompraDet.state in [dsEdit, dsInsert] then
  dtmTransOpeDiaria.tblOrdenCompraDetVALOR.Value:=
  dtmTransOpeDiaria.tblOrdenCompraDetCANTIDAD.Value *
  dtmTransOpeDiaria.tblOrdenCompraDetPRECIO.Value;
end;

procedure TfrmRecibirOrdenes.DBEdit3Change(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblOrdenCompraDet.state in [dsEdit, dsInsert] then
  dtmTransOpeDiaria.tblOrdenCompraDetVALOR.Value:=
  dtmTransOpeDiaria.tblOrdenCompraDetCANTIDAD.Value *
  dtmTransOpeDiaria.tblOrdenCompraDetPRECIO.Value;
end;

procedure TfrmRecibirOrdenes.CalcularValoresDet;
var
  bookmark : TBookmark;
  mto : real;
begin
  bookmark:= dtmTransOpeDiaria.tblOrdenCompraDet.GetBookmark;
  dtmTransOpeDiaria.tblOrdenCompraDet.DisableControls;
  dtmTransOpeDiaria.tblOrdenCompraDet.first;
  mto:=0.0;
  while not dtmTransOpeDiaria.tblOrdenCompraDet.eof do
  begin
    mto:=mto + dtmTransOpeDiaria.tblOrdenCompraDetVALOR.Value;
    dtmTransOpeDiaria.tblOrdenCompraDet.next;
  end;
  dtmTransOpeDiaria.tblOrdenCompraMaster.Edit;
  dtmTransOpeDiaria.tblOrdenCompraMasterMONTO.Value:=mto;
  GlbSalvarQuery(dtmTransOpeDiaria.tblOrdenCompraMaster);
  dtmTransOpeDiaria.tblOrdenCompraDet.GotoBookmark(bookmark);
  dtmTransOpeDiaria.tblOrdenCompraDet.FreeBookmark(bookmark);
  dtmTransOpeDiaria.tblOrdenCompraDet.EnableControls;
end;

procedure TfrmRecibirOrdenes.Recibidas1Click(Sender: TObject);
begin
  frmConsultaOrdenCompra:=TfrmConsultaOrdenCompra.Create(Nil);
  try
  frmConsultaOrdenCompra.Showmodal;
  finally
  frmConsultaOrdenCompra.free;
  frmConsultaOrdenCompra:=nil;
  end;
end;

procedure TfrmRecibirOrdenes.ProcEnviarEmail;
begin
  if (rxEmailEnviado.State = dsInactive) then
  rxEmailEnviado.Open;
  if rxEmailEnviado.Locate('Numero',dtmTransOpeDiaria.tblOrdenCompraMasterNUM_ORDEN.Value,[]) then
  Exit;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  //dmDespacho.tblDespachoMasterRep.Close;
  rxEmailEnviado.Append;
  rxEmailEnviadoNumero.Value:=dtmTransOpeDiaria.tblOrdenCompraMasterNUM_ORDEN.Value;
  rxEmailEnviado.Post;
  dmdatos.qryDatosOrdenImp.Close;
  dmdatos.qryDatosOrdenImp.Params[0].Value:= dtmTransOpeDiaria.tblOrdenCompraMasterNUM_ORDEN.Value;
  dmdatos.qryDatosOrdenImp.Open;//dmdatos.qryDatosOrdenImp.sql.text

          qckOrdenDeCompraRecibida:=TqckOrdenDeCompraRecibida.Create(Nil);
          try
            qckOrdenDeCompraRecibida.Prepare;
            if (dmdatos.qryDatosOrdenImpSTATUS_ORD.Value = 'P') then
            qckOrdenDeCompraRecibida.qrLabelReImp.Visible := True
            else
            qckOrdenDeCompraRecibida.qrLabelReImp.Visible:= False;

            //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
            //if MessageDlg('Imprimir?',mtinformation,[mbyes, mbno],0) = mrno then
            //qckOrdenDeCompraRecibida.Preview;
            //else
            //begin
            //  qckOrdenDeCompraNew.PrinterSetup;
            //  qckOrdenDeCompraNew.Print;
            //end;
            if chkEnviarEmail.Checked then
            begin
              GlbIDTipoEmail:=100;
              GlbEnviaEmail:=True;
              GlbSubject:='Orden de Compra Recibida';
              GlbMuestraMensajeEmail:=False;
              ReportExport(qckOrdenDeCompraRecibida,GlbRutaInformes+'OrdenCompraNum'+dmdatos.qryDatosOrdenImp.Params[0].AsString+'_'+
              FormatDateTime('yyyymmdd', dmdatos.qryDatosOrdenImpFECHA.Value)+'.pdf');
              GlbMuestraMensajeEmail:=True;
              GlbIDTipoEmail:=0;
              GlbSubject:='';
            end;
          finally
          qckOrdenDeCompraRecibida.Free;
          qckOrdenDeCompraRecibida:=Nil;
          end;
end;

procedure TfrmRecibirOrdenes.ReEnviarOrdenporEmail1Click(Sender: TObject);
var
  sNum : Integer;
begin
  if dtmTransOpeDiaria.tblOrdenCompraMaster.State = dsInactive then
  begin
    //MessageDlg('Favor indicar proveedor', mtInformation, [mbOK], 0);
    //RxDBLookupCombo3.SetFocus;
    Exit;
  end;
  //strTipoVenta:='Entrada';
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmDespacho.tblDespachoMasterRep.Close;
  sNum:=0;
  sNum := dtmTransOpeDiaria.tblOrdenCompraMasterNUM_ORDEN.Value;

  dmdatos.qryDatosOrdenImp.Close;
  dmdatos.qryDatosOrdenImp.Params[0].Value:= sNum;
  dmdatos.qryDatosOrdenImp.Open;

  qckOrdenDeCompraRecibida:=TqckOrdenDeCompraRecibida.Create(Nil);
  try
    qckOrdenDeCompraRecibida.Prepare;
    if (dmdatos.qryDatosOrdenImpSTATUS_ORD.Value = 'P') then
    qckOrdenDeCompraRecibida.qrLabelReImp.Visible := True
    else
    qckOrdenDeCompraRecibida.qrLabelReImp.Visible:= False;

    //T qckOrdenDeCompraNew.qrTpaginas.Caption:= ' de '+IntToStr(qckRepOrdenCompra.PageNumber);
    if MessageDlg('Imprimir?',mtinformation,[mbyes, mbno],0) = mrno then
    qckOrdenDeCompraRecibida.Preview
    else
    begin
      qckOrdenDeCompraRecibida.PrinterSetup;
      qckOrdenDeCompraRecibida.Print;
    end;
            //if chkEnviarEmail.Checked then
            //begin
    GlbIDTipoEmail:=100;
    GlbEnviaEmail:=True;
    GlbSubject:='Orden de Compra Recibida -Reenviada';
    ReportExport(qckOrdenDeCompraRecibida,GlbRutaInformes+'OrdenCompraNum'+dmdatos.qryDatosOrdenImp.Params[0].AsString+'_'+
    FormatDateTime('yyyymmdd', dmdatos.qryDatosOrdenImpFECHA.Value)+'.pdf');
    GlbIDTipoEmail:=0;
    GlbSubject:='';
            //end; }
    finally
    qckOrdenDeCompraRecibida.Free;
    qckOrdenDeCompraRecibida:=Nil;
    end;
end;

end.


