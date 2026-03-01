unit UFromDespachoInvAlmacen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, IBQuery, DBCtrls,
  EditNew, Grids, DBGrids, RXDBCtrl, ExtCtrls, RxMemDS, Mask, Buttons,
  IBStoredProc;

type
  TfrmDespachoInvAlmacen = class(TForm)
    tblDivInventarioOrigen: TIBTable;
    tblDivInventarioOrigenINVENTARIO_ID: TIntegerField;
    tblDivInventarioOrigenDESCRIPCION: TIBStringField;
    ComboBox1: TComboBox;
    Inventario: TLabel;
    tblDivInventarioDestino: TIBTable;
    ComboBox2: TComboBox;
    Label1: TLabel;
    tblDivInventarioDestinoINVENTARIO_ID: TIntegerField;
    tblDivInventarioDestinoDESCRIPCION: TIBStringField;
    qryInventario: TIBQuery;
    Label6: TLabel;
    edtCodigo: TEditN;
    DBText1: TDBText;
    dsqryInventario: TDataSource;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioFECHA: TDateTimeField;
    qryInventarioCODIGO_BARRA: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioCANTIDAD_REORDEN: TIntegerField;
    qryInventarioPRECIO_ANT: TFloatField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioBLCE_CANT_ENTRADA: TFloatField;
    qryInventarioBLCE_CANT_SALIDA: TFloatField;
    qryInventarioFECHA_ULTIMA_TRN: TDateTimeField;
    qryInventarioSTATUS: TIBStringField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioFOTO: TBlobField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioCODIGO_PRECIO: TIBStringField;
    qryInventarioUNIDAD: TFloatField;
    qryInventarioPRECIO_COMPRA: TFloatField;
    qryInventarioPRECIO_MINIMO: TFloatField;
    qryInventarioREFERENCIA: TIBStringField;
    qryInventarioFECHA_VENCIMIENTO: TDateTimeField;
    qryInventarioINVENTARIAR: TSmallintField;
    qryProductos: TIBQuery;
    qryProductosCODIGO: TIntegerField;
    qryProductosCODIGO_TEXTO: TIBStringField;
    qryProductosCANTIDAD: TFloatField;
    qryProductosPRECIO_MINIMO: TFloatField;
    qryProductosPRECIO: TFloatField;
    qryProductosDESCRIPCION: TIBStringField;
    qryProductosREFERENCIA: TIBStringField;
    qryProductosINVENTARIAR: TSmallintField;
    qryProductosPAGA_ITBI: TSmallintField;
    Panel2: TPanel;
    RxDBGrid2: TRxDBGrid;
    rxVenta: TRxMemoryData;
    rxVentaSerie: TIntegerField;
    rxVentaFecha: TDateTimeField;
    rxVentaCant: TFloatField;
    rxVentaPrecio: TCurrencyField;
    rxVentaMontoBruto: TCurrencyField;
    rxVentaDescripcion: TStringField;
    rxVentaDevolucion: TCurrencyField;
    rxVentaMontoNeto: TCurrencyField;
    rxVentaCodUsuario: TIntegerField;
    rxVentaCodArticulo: TIntegerField;
    rxVentaNumeroRecibo: TIntegerField;
    rxVentaCodTexto: TStringField;
    rxVentaNCF: TStringField;
    rxVentaNumeroTrn: TIntegerField;
    rxVentaporc_desc: TFloatField;
    rxVentaItbi: TFloatField;
    rxVentaMontoDescuento: TFloatField;
    rxVentaSerieProd: TStringField;
    rxVentaNumeroFactura: TIntegerField;
    rxVentaInvetariar: TSmallintField;
    rxVentaloteNum: TStringField;
    rxVentaMontoItbisenPrecio: TCurrencyField;
    rxVentaReferencia: TStringField;
    rxVentaNumeroDoc: TIntegerField;
    qryProdSerie: TIBQuery;
    qryProdSerieCODIGO: TIntegerField;
    qryProdSerieSERIE: TIBStringField;
    qryProdSerieSTATUS: TIBStringField;
    chkMostrarVistaproductos: TCheckBox;
    LectorCodBarra1: TCheckBox;
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
    dsTotales: TDataSource;
    Label9: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    DataSource2: TDataSource;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    Label16: TLabel;
    DBText6: TDBText;
    Label17: TLabel;
    Edit1: TEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    chkExento: TCheckBox;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    stpMantInvAlmacen: TIBStoredProc;
    stpProcInsDespachoDet: TIBStoredProc;
    DataSource1: TDataSource;
    procUpdateDespSerieInvIDAlmacen: TIBStoredProc;
    stpProcInsDespachoMaster: TIBStoredProc;
    BitBtn2: TBitBtn;
    ibStpActualizaInvProd: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure AsignarSqlText(campo:String; valor:string; OrderBy : String);
    procedure edtCodigoEnter(Sender: TObject);
    procedure rxVentaAfterPost(DataSet: TDataSet);
    procedure ComboBox2Exit(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure rxVentaBeforePost(DataSet: TDataSet);
    procedure chkExentoClick(Sender: TObject);
    procedure chkExentoEnter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
     procedure ProcesarSumaTotal;
     procedure ProcesaNuevo;
     procedure ActualizaInvAlmacen(accion:Integer;CodDivInv:Integer);
     Procedure ProcInsDespachoMaster;
     Procedure ProcInsDespachoDetalle;
     procedure ProcesaCalculos;
     procedure ImprimirReporte;
     procedure Imprimir;
  public
    { Public declarations }
  end;

var
  frmDespachoInvAlmacen: TfrmDespachoInvAlmacen;
  BuscandoPorDesc: Boolean = false;
  TipoVenta : String;
  xCodigoCte : Integer;
  xSalir, Prod_existe: boolean;
  EsFinanciamiento : Boolean = false;
  EsFactura  : Boolean = false;
  isShowing : Boolean;

  sumarDatos  : Boolean = True;
  clave : String;
  yNumSerie : Integer;
  MontoItbisEnPrecio : Extended;
  PrecioAnterior : Extended;
  Entro : Boolean = false;
  reciboImpreso : Boolean;
  nombreuser : String[12];

  INV_ID_ORIGEN : Integer;
  INV_ID_DESTINO: Integer;

implementation

uses UDatModConectar, UFormSelSerieProd, UGlobal, UDatModCompania,
  UDatModInventario, UIndicarLoteNum, UDatModDespacho, UDatosVentas,
  UQckReporteFacturaDespA;

{$R *.dfm}

procedure TfrmDespachoInvAlmacen.FormCreate(Sender: TObject);
begin
  tblDivInventarioOrigen.Close;
  tblDivInventarioOrigen.Open;
  tblDivInventarioDestino.Close;
  tblDivInventarioDestino.Open;
  tblDivInventarioOrigen.First;
  ComboBox1.Clear;
  ComboBox2.Clear;
  While Not tblDivInventarioOrigen.Eof Do
  Begin
    ComboBox2.Items.Add(tblDivInventarioOrigenDESCRIPCION.Value);
    ComboBox1.Items.Add(tblDivInventarioOrigenDESCRIPCION.Value);
    tblDivInventarioOrigen.Next;
  End;
  tblDivInventarioOrigen.First;
  ComboBox2.Text := tblDivInventarioOrigenDESCRIPCION.Value;
  ComboBox1.Text := tblDivInventarioOrigenDESCRIPCION.Value;
  qryProductos.Close;
  qryProductos.Open;
  qryInventario.Close;
  qryInventario.Open;
  rxVenta.Close;
  rxVenta.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  Label10.Caption:= DateToStr(GlbFechaTrnDiaria);
  Label11.Caption:= VarNombreUsuario;
  Totales.Close;
  Totales.Open;
  Totales.Insert;
  TotalesSubTotal.Value := 0;
  Totalesitbis.Value    := 0;
  Totalesmontodesc.Value:= 0;
  Totalestotalneto.Value:= 0;
  Totalesmontorecibido.Value := 0;
  Totalesdevolucion.Value := 0;
  Totales.Post;
  //lblProcDev.Visible := False;
  if (GlbActF10CodBarra = 1) then
  LectorCodBarra1.Checked:= True;
end;

procedure TfrmDespachoInvAlmacen.ComboBox1Change(Sender: TObject);
begin
  if Not tblDivInventarioOrigen.Locate('descripcion', ComboBox1.Text,[]) then
  MessageDlg('División inventario no existe, verifique', mtInformation, [mbOK], 0);
end;

procedure TfrmDespachoInvAlmacen.ComboBox2Change(Sender: TObject);
begin
  if Not tblDivInventarioDestino.Locate('descripcion', ComboBox2.Text, []) then
  MessageDlg('División inventario no existe, verifique', mtInformation, [mbOK], 0);
end;

procedure TfrmDespachoInvAlmacen.edtCodigoChange(Sender: TObject);
  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;
begin
  //if rxVenta.State = dsBrowse then
  if LectorCodBarra1.Checked then Exit;
  BuscandoPorDesc:=False;
  if edtCodigo.Text = '' then exit;
  if esNumero(edtCodigo.Text) then
  begin
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end;
    if (edtCodigo.Text = '1000') or (edtCodigo.Text = '10000') then
    begin
      qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[]);
    end;
  end else
  begin
     BuscandoPorDesc:=True;
    AsignarSqlText('descripcion',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion',edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      panel2.Top:=edtcodigo.Top+30;
      panel2.Left:=edtcodigo.Left;
      panel2.Visible:=True;
      panel2.BringToFront;
    end;
  end;
end;

procedure TfrmDespachoInvAlmacen.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
begin
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text:='';
  if reciboImpreso then
  Totales.EmptyTable;

  reciboImpreso :=False;

  if BuscandoPorDesc  then
  begin
    RxDBGrid2.SetFocus;
    Exit;
  end;
  
  //Esta condicion es sospechosa de causar que codigo_texto obtenga un valor incorrecto
   if panel2.Visible then
  edtCodigo.Text := qryProductosCodigo_Texto.Value;

  if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[]) then
  begin
    //MessageDlg('Codigo no encontrado, verifique', mtError, [mbOK], 0);
    //edtCodigo.SetFocus;
    Prod_existe:=False;
  end else
  begin
    Prod_existe:=true;
    qryInventario.Locate('CODIGO_TEXTO', edtCodigo.Text,[]);

    if rxVenta.State = dsBrowse then
    begin
      rxVenta.DisableControls;
      rxVenta.SortOnFields('serie', false, false);
      if (rxVenta.RecordCount > 0) then
      begin
        rxVenta.Last;
        numero := rxVentaSerie.Value + 1;
      end else numero := 1;
      rxVenta.EnableControls;
      rxVenta.Insert;
      rxVentaCant.Value:=1;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      rxVentaSerie.Value := Numero;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      rxVentaCodUsuario.Value := VarUsuarioGlb;
    end;
    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      rxVentaReferencia.Value := qryProductosREFERENCIA.Value;

       //tj MontoItbisEnPrecio:=
       //tj qryProductosPRECIO.Value * FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value))/100;
       //tj if (qryProductosPAGA_ITBI.Value = 1) And (Not chkExento.Checked)
       //tj and GlbPermiteCambioPrecio then
       //tj rxVentaPrecio.Value  := qryProductosPRECIO.Value * (1 + FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value))/100)
       //tj else
       //tj begin
        rxVentaPrecio.Value  := qryProductosPRECIO.Value;
        rxVentaMontoItbisenPrecio.Value:=0;
        MontoItbisEnPrecio:=0;
       //tj end;
      
      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      rxVentaCodTexto.Value   := edtCodigo.Text;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      qryProdSerie.close;
      //qryProdSerie.Params[0].Value:= edtCodigo.Text;
      qryProdSerie.Params[0].Value:= qryProductoscodigo.Value;
      qryProdSerie.Open;
      if (qryProdSerieSTATUS.Value = 'R') then
      begin
        MessageDlg('Número serie no disponible, verifique',mtInformation, [mbOK], 0);
        edtCodigo.SetFocus;
      end;
      if qryProdSerie.RecordCount > 0 then
      begin
      frmSelSerie:=TfrmSelSerie.Create(Nil);
      try
        if frmSelSerie.Showmodal = mrOk then
        begin
          rxVentaSerieProd.Value:= qryProdSerieSERIE.Value;
        end;
      finally
      frmSelSerie.Free;
      frmSelSerie:= Nil;
      end;
      end;

      //dmInventario.qryLote.Close;
      //dmInventario.qryLote.Params[0].Value:= qryInventarioCODIGO.Value;
      //dmInventario.qryLote.Open;
      //if dmInventario.qryLote.recordcount > 0 then
      //begin
      //  frmShowLote:=TfrmShowLote.Create(Nil);
      //  try
      //    if frmShowLote.Showmodal = mrok then
      //    rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
      //  finally
      //  frmShowLote.free;
      //  frmShowLote:=nil;
      //  end;
      //end;
    end else ProcesaNuevo;
  end;
  panel2.Visible:=chkMostrarVistaproductos.Checked;
  if LectorCodBarra1.Checked then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmDespachoInvAlmacen.AsignarSqlText(campo, valor,
  OrderBy: String);
begin
  qryProductos.DisableControls;
  if qryProductos.Active then
  qryProductos.Close;
  if (campo = '') then
  begin
    qryProductos.SQL.Text:=
    'Select *  From INVENTARIO_PRODUCTO ' +
    'ORDER BY tipo,descripcion, Referencia, codigo';
  end else
  qryProductos.SQL.Text:=
  Format('Select *  From INVENTARIO_PRODUCTO ' +
         'WHERE UPPER(%s) Like %s ',[Campo, Valor]) +
         'ORDER BY tipo,descripcion, Referencia, codigo';
  qryProductos.Open;
  qryProductos.EnableControls;
end;

procedure TfrmDespachoInvAlmacen.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.SelectAll;
end;

procedure TfrmDespachoInvAlmacen.rxVentaAfterPost(DataSet: TDataSet);
begin
  if sumarDatos then
  ProcesarSumaTotal;
end;

procedure TfrmDespachoInvAlmacen.ProcesarSumaTotal;
var
  monto:Extended;
  itbis, descuento, neto: Extended;
  puerto, linea1, linea2 : String;
begin
  if rxVenta.state <> dsBrowse then Exit;
  rxVenta.DisableControls;
  rxVenta.First;
  Monto:=0; Itbis:=0; Descuento:=0; Neto:=0;
  //rxVenta.Edit;
  //rxVentaMontoItbisEnPrecio.Value:=0;
  //rxVenta.Post;
  While Not rxVenta.Eof do
  begin
    Monto := Monto + rxVentaMontoBruto.Value;
    Itbis := itbis + rxVentaItbi.Value;
    Descuento:= descuento + rxVentaMontoDescuento.Value;
    Neto     := Neto + rxVentaMontoNeto.Value;
    rxVenta.Next;
  end;
  //EditN1.Text:=InsertarComa(FloatToStr(Monto));

  //EdtMontoDesc.Text := InsertarComa(FloatToStr(Descuento));
  //edtTotalNeto.Text := InsertarComa(FloatToStr(Neto));
  //edtItbis.Text     := InsertarComa(FloatToStr(Itbis));

  Totales.Edit;
  TotalesSubTotal.Value     := Monto;
  Totalesitbis.Value        := Itbis;
  Totalesmontodesc.Value    := Descuento;
  {if not EsFactura or not EsFinanciamiento then
    if (Totalesmontorecibido.Value < Neto) then
  begin
    MessageDlg('Monto recibido no puede ser menor que Neto, verifique',mtInformation, [mbOK], 0);
  end;}
  if EsFactura or EsFinanciamiento then
  begin
    if (Totalesmontorecibido.Value < Neto) then
    Totalestotalneto.Value := Neto - Totalesmontorecibido.Value +
    TotalesMontoInteres.Value
    else Totalestotalneto.Value   := Totalesmontorecibido.Value - Neto  +
    TotalesMontoInteres.Value;
  end else Totalestotalneto.Value := Neto;

  Totales.Post;

  //if chkDisplay.Checked then
  //begin
  //  puerto:='1';
  //  linea1:= '*** Total  Venta ***';
  //  linea2:=Format('%8.2f',[Totalestotalneto.Value]);
  //  WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
  //  '" "'+ linea2 +'"'),SW_HIDE);
  //end;

  rxVenta.EnableControls;

end;

procedure TfrmDespachoInvAlmacen.ProcesaNuevo;
var
  numero : Integer;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if (rxVentaCodArticulo.IsNull) Or (rxVentaCant.IsNull) Or (rxVentaPrecio.IsNull) then
    begin
      if frmDespachoInvAlmacen.Showing then
      edtCodigo.SetFocus
    end else
    //Exit;
    rxVenta.Post;
  end;
  rxVenta.DisableControls;
  if (rxVenta.RecordCount > 0) then
  begin
    rxVenta.Last;
    numero := rxVentaSerie.Value + 1;
  end else numero:=1;
  rxVenta.EnableControls;
  rxVenta.Insert;
  rxVentaCant.Value:=1;
  rxVentaSerie.Value := Numero;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCodUsuario.Value := VarUsuarioGlb;
end;

procedure TfrmDespachoInvAlmacen.ComboBox2Exit(Sender: TObject);
begin
  if (ComboBox2.Text = ComboBox1.Text) then
  begin
    MessageDlg('Origen y Destino no pueden ser iguales, verifique.',mtError, [mbOK], 0);
    ComboBox2.SetFocus;
    Exit;
  end;
end;

procedure TfrmDespachoInvAlmacen.RxDBGrid2DblClick(Sender: TObject);
begin
  edtCodigo.Text:= qryProductosCodigo_texto.Value;
  panel2.Visible:=False;
  Prod_existe:=True;
  DBEdit1.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmDespachoInvAlmacen.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);

  var
    xxxx : word; item : String;
begin
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  //if (key = 123) then //F12
  //begin
  //  NoGenerarNCF1Click(Self);
  //end;
  //if (key = 120) then
  //BitBtn5Click(self);
  
  if (key = 27) then
  begin
    if MessageDlg('Cerrar ventana?', mtInformation, [mbYes,mbNo], 0) = mryes then
    Close;
  end;
  //if (key = 121) then //F
  //LectorCodBarra1Click(Self);
  //lectorcodbarra1.Checked:= not lectorcodbarra1.Checked;

  //if (key = 118) then //F7
  //BuscarCliente1Click(Self)
  //else if (key = 117) then
  //CheckBox1.checked:= Not CheckBox1.checked;
  if (key = 113) then
  begin
    edtCodigo.SetFocus;
    Exit;
  end;
  //if (key = 115) then
  //BitBtn3Click(Self) else
  //if (key = 113) then BitBtn1Click(Self)
  //else if (key = 114) then BitBtn2Click(Self)
  //else if (key = 116) then
  //if (Edit1.Text <> '') then
  //BitBtn4Click(Self)
  //else
  if (key = 119) then //F9
  begin
    if rxVenta.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre numero item a eliminar','');
      if rxVenta.Locate('Serie',strToInt(item),[]) then
      rxVenta.Delete;
      ProcesarSumaTotal;
  end;
  end;
end;

procedure TfrmDespachoInvAlmacen.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;
end;

procedure TfrmDespachoInvAlmacen.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmDespachoInvAlmacen.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmDespachoInvAlmacen.BitBtn1Click(Sender: TObject);
begin
  {if (rxVentaCodArticulo.AsString <>'') and (rxVentaCant.AsString <> '')
     and (rxVentaMontoBruto.Value <= 0) then
  begin
    raise ERangeError.Create('Monto debe ser mayor que cero, verifique');
    DBEdit1.SetFocus;
    exit;
  end;}
  reciboImpreso :=False;
  ProcesaNuevo;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmDespachoInvAlmacen.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.RecordCount > 0 then
  begin
    if MessageDlg('Cancelar Venta?', mtInformation, [mbYes, mbNo], 0)= mryes then
    begin
      rxVenta.Close;
      rxVenta.EmptyTable;
      rxVenta.Open;
      Totales.EmptyTable;
    end;
  end;
end;

procedure TfrmDespachoInvAlmacen.BitBtn5Click(Sender: TObject);
begin
  if rxVenta.state = dsbrowse then
  begin
    if MessageDlg('Borrar item No.'+rxVentaSerie.AsString+'?',mtWarning, [mbYes,mbNO], 0)=mryes then
    begin
      rxVenta.Delete;
      ProcesarSumaTotal;
    end
  end;
end;

procedure TfrmDespachoInvAlmacen.ActualizaInvAlmacen(accion:Integer;CodDivInv:Integer);
begin
  stpMantInvAlmacen.Params[0].Value := rxVentaCodArticulo.Value;//codigo inventario
  stpMantInvAlmacen.Params[1].Value := CodDivInv;//inventario_id
  stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value * accion;
  stpMantInvAlmacen.Params[3].Value := VarUsuarioGlb;//codigo_usuario
  stpMantInvAlmacen.Params[4].Value := ExtraerFecha(Now);//fecha_in
  stpMantInvAlmacen.Params[5].Value := strUserName;//in_por
  stpMantInvAlmacen.Params[6].Value := ExtraerFecha(Now);//fecha_mod
  stpMantInvAlmacen.Params[7].Value := strUserName;//in_por//mod_por
  stpMantInvAlmacen.Params[8].Value := 'A';//status
  stpMantInvAlmacen.ExecProc;

  if Not stpMantInvAlmacen.Transaction.InTransaction then
  stpMantInvAlmacen.Transaction.StartTransaction;
  try
    stpMantInvAlmacen.Transaction.CommitRetaining;
  except
  stpMantInvAlmacen.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmDespachoInvAlmacen.BitBtn4Click(Sender: TObject);
var
  invX : integer;
begin
  if (ComboBox1.Text = ComboBox2.Text) then
  begin
    MessageDlg('Origen y Destino no pueden ser iguales, verifique.', mtInformation, [mbOK], 0);
    Exit;
  end;

  if tblDivInventarioOrigen.Locate('DESCRIPCION', ComboBox1.Text,[]) then
  begin
    invX:=tblDivInventarioOrigenINVENTARIO_ID.Value;
    INV_ID_ORIGEN :=invX;
  end;

  if tblDivInventarioDestino.Locate('DESCRIPCION', ComboBox2.Text,[]) then
  begin
    invX:=tblDivInventarioDestinoINVENTARIO_ID.Value;
    INV_ID_DESTINO:=invX;
  end;

  ProcInsDespachoMaster;
  ProcInsDespachoDetalle;

  rxVenta.First;
  while not rxVenta.eof do
  begin
  if tblDivInventarioOrigen.Locate('DESCRIPCION', ComboBox1.Text,[]) then
  begin
    invX:=tblDivInventarioOrigenINVENTARIO_ID.Value;
    INV_ID_ORIGEN :=invX;
    ActualizaInvAlmacen(-1,invX);
  end;

  if tblDivInventarioDestino.Locate('DESCRIPCION', ComboBox2.Text,[]) then
  begin
    invX:=tblDivInventarioDestinoINVENTARIO_ID.Value;
    INV_ID_DESTINO:=invX;
    ActualizaInvAlmacen(1, invX);
  end;
    rxVenta.Next;
  end;


  ImprimirReporte;

  rxVenta.Close;
  rxVenta.EmptyTable;
  rxVenta.Open;
  edtCodigo.SetFocus;
  Totales.Close;
  Totales.Open;
  Totales.Insert;
  TotalesSubTotal.Value := 0;
  Totalesitbis.Value    := 0;
  Totalesmontodesc.Value:= 0;
  Totalestotalneto.Value:= 0;
  Totalesmontorecibido.Value := 0;
  Totalesdevolucion.Value := 0;
  Totales.Post;
end;

procedure TfrmDespachoInvAlmacen.ProcInsDespachoDetalle;
begin
  //rxData.AutoCalcFields := false;
  rxVenta.First;
  While Not rxVenta.Eof do
  begin
    //stpProcInsDespachoDet.Params[0].Value :=
    stpProcInsDespachoDet.Params[1].Value := stpProcInsDespachoMaster.Params[0].Value;
    stpProcInsDespachoDet.Params[2].Value := 1;//tipo_trn
    stpProcInsDespachoDet.Params[3].Value := rxVentaCodArticulo.AsInteger;//cod_producto
    stpProcInsDespachoDet.Params[4].Value := rxVentaCant.AsInteger;//cantidad
    stpProcInsDespachoDet.Params[5].Value := rxVentaPrecio.Value;
    stpProcInsDespachoDet.Params[6].Value := 0;//rxDataporc_desc.Value;
    stpProcInsDespachoDet.Params[7].Value := rxVentaitbi.Value;
    stpProcInsDespachoDet.Params[8].Value := rxVentaMontoBruto.Value;
    stpProcInsDespachoDet.Params[9].Value := rxVentaMontoNeto.Value;
    stpProcInsDespachoDet.Params[10].Value := Null; //Num_orden
    stpProcInsDespachoDet.Params[11].Value := 'A';
    stpProcInsDespachoDet.Params[12].Value := Now;
    nombreuser:=StrUserName;
    stpProcInsDespachoDet.Params[13].Value := nombreuser;
    stpProcInsDespachoDet.Params[14].Value := Null;
    stpProcInsDespachoDet.Params[15].Value := Null;
    stpProcInsDespachoDet.Params[16].Value := rxVentaDescripcion.Value;
    stpProcInsDespachoDet.Params[17].Value := Null;
    stpProcInsDespachoDet.Params[18].Value := Null;
    stpProcInsDespachoDet.Params[19].Value := Null;
    stpProcInsDespachoDet.ExecProc;
    //ActualizaInvAlmacen;

    if Not stpProcInsDespachoDet.Transaction.InTransaction then
    stpProcInsDespachoDet.Transaction.StartTransaction;
    try
      stpProcInsDespachoDet.Transaction.CommitRetaining;
    except
    stpProcInsDespachoDet.Transaction.RollbackRetaining;
    end;

    ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
    ibStpActualizaInvProd.Params[2].Value:= 0;//tipoTrn
    ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
    if (rxVentaInvetariar.Value <> 0) And  (INV_ID_ORIGEN = 1 ) then
    ibStpActualizaInvProd.ExecProc;

    rxVenta.Next;
    //aqui voyyyyyyy
    //stpProcActInv.Params[0].Value:= rxDataCodigoProd.Value;//Codigo_producto
    //stpProcActInv.Params[1].Value:= rxDataCantidad.Value;  //Nuevacantidad
    //stpProcActInv.Params[2].Value:= rxDataPrecioCompra.Value;//I_precio_compra
    //stpProcActInv.Params[3].Value:= rxDataPrecioVenta.Value; //I_precio_venta
    //stpProcActInv.Params[4].Value:= rxDataFechaVencimiento.Value; //Fecha Vencimiento
    //stpProcActInv.ExecProc;
    //if Not stpProcActInv.Transaction.InTransaction then
    //stpProcActInv.Transaction.StartTransaction;
    //try
    //  stpProcActInv.Transaction.CommitRetaining;
    //except
    //stpProcActInv.Transaction.RollbackRetaining;
    //end;

    //ProcInsCostoProdProveedor(rxDataCodigoProd.Value,rxDataNumConduce.Value,rxDataPrecioCompra.Value);
    //if (edtLotNum.Text <> '') then
    //begin
    //  ibstpInsertarLote.Params[0].Value:= rxDataCodigoProd.Value;
    //  ibstpInsertarLote.Params[1].Value:= edtLotNum.Text;
    //  ibstpInsertarLote.Params[2].Value:= rxProveedorCodigo.Value;
    //  ibstpInsertarLote.Params[3].Value:= Date;
    //  ibstpInsertarLote.Params[4].Value:= rxDataCantidad.AsInteger;
    //  ibstpInsertarLote.Params[5].Value:= 0;
    //  ibstpInsertarLote.Params[6].Value:= rxDataFechaVencimiento.Value;
    //  ibstpInsertarLote.ExecProc;
    //end;
    //rxVenta.Edit;
    //rxVentaStatus.Value:='R';
    //rxVenta.Post;
  end;

  if Not ibStpActualizaInvProd.Transaction.InTransaction then
  ibStpActualizaInvProd.Transaction.StartTransaction;
    try
      ibStpActualizaInvProd.Transaction.CommitRetaining;
    except
    ibStpActualizaInvProd.Transaction.RollbackRetaining;
    end;

  if Not dmInventario.stpProcInsCostoProd.Transaction.InTransaction then
  dmInventario.stpProcInsCostoProd.Transaction.StartTransaction;
  try
    dmInventario.stpProcInsCostoProd.Transaction.CommitRetaining;
  except
  dmInventario.stpProcInsCostoProd.Transaction.RollbackRetaining;
  end;
  //rxData.AutoCalcFields := True;
end;

procedure TfrmDespachoInvAlmacen.ProcInsDespachoMaster;
var
  suma : Real;
begin
  //rxVenta.AutoCalcFields := False;
  rxVenta.First;
  Suma:=0;
  //While Not rxData.Eof Do
  //begin
  //  Suma:=Suma + rxDataTotal_neto.Value;
  //  rxData.Next;
  //end;
  //dmDespacho.tblDespachoMaster.Insert;

  //stpProcInsDespachoMaster.Params[0].Value := //Out - serie_Trans
  //stpProcInsDespachoMaster.Params[1].Value := //Out - numorden
  //procUpdateDespAlmacen.Params[0].Value:= //secuencia - output
  procUpdateDespSerieInvIDAlmacen.Params[1].Value:=tblDivInventarioDestinoINVENTARIO_ID.Value;//Master; //invTipo = input
  procUpdateDespSerieInvIDAlmacen.Params[2].Value:=VarUsuarioGlb;//cod_usuario = input
  procUpdateDespSerieInvIDAlmacen.ExecProc;
  
  stpProcInsDespachoMaster.Params[2].Value := ExtraerFecha(rxVentaFecha.Value);//fecha
  stpProcInsDespachoMaster.Params[3].Value := 1;//entrada//rxDataTipo_trn.Value;//tipo_trn
  stpProcInsDespachoMaster.Params[4].Value := VarUsuarioGlb;//codigo_despachador
  stpProcInsDespachoMaster.Params[5].Value := VarUsuarioGlb;//codigo_emp
  stpProcInsDespachoMaster.Params[6].Value := Totalestotalneto.Value;;//monto_total
  stpProcInsDespachoMaster.Params[7].Value := 'A';//status //0//num_orden
  stpProcInsDespachoMaster.Params[8].Value := GlbFechaTrnDiaria; //fecha_in
  nombreuser:=StrUserName;
  stpProcInsDespachoMaster.Params[9].Value :=  nombreuser;//in_por
  stpProcInsDespachoMaster.Params[10].Value := GlbFechaTrnDiaria;//fecha_mod
  stpProcInsDespachoMaster.Params[11].Value := Null;//mod_por
  stpProcInsDespachoMaster.Params[12].Value := 0;//codigo_ruta registro pedido
  stpProcInsDespachoMaster.Params[13].Value := Null;//rxDataNumConduce.Value;//num_conduce
  stpProcInsDespachoMaster.Params[14].Value := 0;//rxProveedorCodigo.Value;
  stpProcInsDespachoMaster.Params[15].Value := Null;//rxProveedorNCF.Value;
  stpProcInsDespachoMaster.Params[16].Value := Null; //rxProveedorRNCPROVEEDOR.Value;
  if tblDivInventarioDestino.Locate('DESCRIPCION', ComboBox2.Text,[]) then
  stpProcInsDespachoMaster.Params[17].Value := tblDivInventarioDestinoINVENTARIO_ID.Value;//Master;
  stpProcInsDespachoMaster.Params[18].Value := procUpdateDespSerieInvIDAlmacen.Params[0].Value;
  stpProcInsDespachoMaster.Params[19].Value := INV_ID_ORIGEN;
  stpProcInsDespachoMaster.Params[20].Value := INV_ID_DESTINO;
  stpProcInsDespachoMaster.ExecProc;

  if Not stpProcInsDespachoMaster.Transaction.InTransaction then
  stpProcInsDespachoMaster.Transaction.StartTransaction;
  try
    stpProcInsDespachoMaster.Transaction.CommitRetaining;
  except
  stpProcInsDespachoMaster.Transaction.RollbackRetaining;
  end;

  //t if (rxProveedorFormaPago.Value = 7) OR (rxProveedorFormaPago.Value = 8) then
  //t ProcInsertarCXP(Suma);

  //rxData.AutoCalcFields := True;
end;

procedure TfrmDespachoInvAlmacen.FormShow(Sender: TObject);
begin
  isShowing:=true;
end;

procedure TfrmDespachoInvAlmacen.FormHide(Sender: TObject);
begin
  isShowing:=False;
end;

procedure TfrmDespachoInvAlmacen.DBEdit1Enter(Sender: TObject);
begin
  yNumSerie:= rxVentaSerie.Value;
  if Not Prod_existe and ((rxVenta.State in [dsEdit, dsInsert]) or (rxVenta.RecordCount > 0)) then
  begin
    MessageDlg('codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
    edtCodigo.SetFocus;
    Exit;
  end;
  //ProcesaCalculos;
  Panel2.Visible:=False;
end;

procedure TfrmDespachoInvAlmacen.DBEdit1Exit(Sender: TObject);
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if (rxVentaCant.Value > qryProductosCANTIDAD.Value) and (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario', mtWarning, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    if (rxVentaCant.Value < 0) then
    begin
      MessageDlg('Cantidad no puede ser número negativo, verifique',mtError, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if EsDevolucion then
    rxVentaMontoBruto.Value:=rxVentaMontoBruto.Value * -1;
  end;

  //Aplica Descuento e Itbis
  GlbNumero:= rxVentaSerie.Value;
  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

  edtCodigo.SelectAll;
  edtCodigo.ClearSelection;

  if isShowing then
  edtCodigo.SetFocus;

  panel2.Visible := False;

  if isShowing then
  if (varTipousuario = 0) then 
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else ProcesaCalculos;
end;

procedure TfrmDespachoInvAlmacen.DBEdit2Enter(Sender: TObject);
begin
  if (GlbNumero > 0) then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
end;

procedure TfrmDespachoInvAlmacen.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
begin
  if DBEdit2.ReadOnly = false then
  begin
  //guardarRec := rxVenta.GetBookmark;
  end;

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

  if (DBEdit2.ReadOnly = false) then
  begin
    //rxVenta.GotoBookmark(guardarRec);
    //rxVenta.FreeBookmark(guardarRec);
  end;
  if rxVenta.State = dsBrowse then
  rxVenta.Locate('Serie', yNumSerie,[]);
  if rxVentaCodTexto.Value = '' then Exit;
  if not qryInventario.Locate('CODIGO_TEXTO', rxVentaCodTexto.Value,[]) then
  MessageDlg('codigo '+rxVentaCodTexto.Value+' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin
    if (rxVentaPrecio.Value < qryInventarioPRECIO_MINIMO.Value) then
    begin
      if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
      begin
        DBEdit2.ReadOnly := False;
        DBEdit2.SetFocus;
        Exit;
      end;
    end;
  end;

  DBEdit2.ReadOnly := True;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmDespachoInvAlmacen.rxVentaBeforePost(DataSet: TDataSet);
begin
  if rxVentaCant.IsNull or rxVentaPrecio.IsNull then
  begin
    DataSet.Cancel;
    //if frmProcVentaRapida.Showing then
    if isShowing then
    BitBtn1.SetFocus;
  end;
end;

procedure TfrmDespachoInvAlmacen.chkExentoClick(Sender: TObject);
begin
  if (rxVenta.Recordcount > 1) then
  begin
    SumarDatos := False;
    rxVenta.EnableControls;
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      rxVenta.Edit;
      ProcesaCalculos;
      rxVenta.Next;
    end;
    sumarDatos := True;
    rxVenta.Edit;
    rxVenta.Post;
  end else
  begin
    rxVenta.Edit;
    ProcesaCalculos;
    //rxVenta.Post;
  end;
end;

procedure TfrmDespachoInvAlmacen.chkExentoEnter(Sender: TObject);
begin
  chkExento.SetFocus;
end;

procedure TfrmDespachoInvAlmacen.ProcesaCalculos;
var
  porItbi: Real;
begin
  if rxVenta.State In [dsEdit, dsInsert] then
  begin
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if EsDevolucion then
    rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * -1;

    porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value));

    if chkExento.Checked then
    porItbi:=0;

    if Not EsDevolucion then
    rxVentaPorc_Desc.Value := qryInventarioPORC_DESCUENTO.Value;

    if rxVentaPorc_Desc.Value > 0 then
    rxVentaMontoDescuento.Value := (rxVentaMontoBruto.Value * rxVentaporc_desc.Value/100)
    else rxVentaMontoDescuento.Value := 0;
    if (TotalesPorcDesAdicional.Value > 0) then
    TotalesMontoDescAdicional.Value:= (rxVentaMontoBruto.Value * TotalesPorcDesAdicional.Value / 100);
    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value
    - TotalesMontoDescAdicional.Value;
    rxVentaitbi.Value:=0;
    if (qryInventarioPAGA_ITBI.Value = 1) And (not chkExento.Checked) then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);

    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
    
  end;
end;

procedure TfrmDespachoInvAlmacen.ImprimirReporte;
var
  sNum : Integer;
begin
  //strTipoVenta:='Entrada';
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmDespacho.tblDespachoMasterRepA.Close;
  sNum:=0;
  if not stpProcInsDespachoMaster.Params[18].IsNull then
  sNum:= stpProcInsDespachoMaster.Params[18].Value;
  if (sNum = 0) then
  dmDespacho.tblDespachoMasterRepA.Params[0].Value:=
  StrToInt(Inputbox('(Re)Imprimir factura','Entre número', InttoStr(sNum)))
  else
  dmDespacho.tblDespachoMasterRepA.Params[0].Value:= sNum;
  dmDespacho.tblDespachoMasterRepA.Params[1].Value:= inv_id_origen;
  dmDespacho.tblDespachoMasterRepA.Params[2].Value:= inv_id_destino;
  dmDespacho.tblDespachoMasterRepA.Open;
  
  //dmVentas.qryProveedor.Close;
  //dmVentas.qryProveedor.Params[0].Value:= rxProveedorCodigo.Value;//dmDespacho.tblDespachoMasterRepCODIGO_PROV.Value;
  //dmVentas.qryProveedor.Open;
  Imprimir;
end;

procedure TfrmDespachoInvAlmacen.Imprimir;
begin
  qckFacturaDespA:=TqckFacturaDespA.Create(Nil);
  try
    qckFacturaDespA.Prepare;
    qckFacturaDespA.TPag.Caption:=IntToStr(qckFacturaDespA.PageNumber);
    if MessageDlg('Imprimir factura?', mtInformation,[mbYes, mbNo],0) = mrYes then
    begin
      qckFacturaDespA.PrinterSetup;
      qckFacturaDespA.Print;
    end else
    qckFacturaDespA.Preview;
  finally
  qckFacturaDespA.Free;
  qckFacturaDespA:=Nil;
  end;
end;

procedure TfrmDespachoInvAlmacen.BitBtn2Click(Sender: TObject);
var
  invX : Integer;
begin
  if (ComboBox1.Text = ComboBox2.Text) then
  begin
    MessageDlg('Origen y Destino no pueden ser iguales, verifique.', mtInformation, [mbOK], 0);
    Exit;
  end;
  if tblDivInventarioOrigen.Locate('DESCRIPCION', ComboBox1.Text,[]) then
  begin
    invX:=tblDivInventarioOrigenINVENTARIO_ID.Value;
    INV_ID_ORIGEN :=invX;
  end;

  if tblDivInventarioDestino.Locate('DESCRIPCION', ComboBox2.Text,[]) then
  begin
    invX:=tblDivInventarioDestinoINVENTARIO_ID.Value;
    INV_ID_DESTINO:=invX;
  end;
  ImprimirReporte;
end;

end.
