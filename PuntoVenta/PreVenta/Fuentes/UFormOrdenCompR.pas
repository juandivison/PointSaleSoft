unit UFormOrdenCompraR;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup;

type
  TfrmOrdenCompraR = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RxSpeedButton5: TRxSpeedButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Shape4: TShape;
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
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxDBGrid3: TRxDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBEdit3: TDBEdit;
    Edit1: TEdit;
    edtCodigo: TEditN;
    Panel2: TPanel;
    RxDBGrid2: TRxDBGrid;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn10: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    edtReferencia: TEditN;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    edtObservacion: TEdit;
    chkExento: TCheckBox;
    chkDisplay: TCheckBox;
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
    DataSource1: TDataSource;
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
    SkinData1: TSkinData;
    PopupMenu1: TPopupMenu;
    MaestroCliente1: TMenuItem;
    Inventario1: TMenuItem;
    LectorCodBarra1: TMenuItem;
    ImprimirRecibo1: TMenuItem;
    Devolucin1: TMenuItem;
    ReImprimirRecibo1: TMenuItem;
    NCFSinValorFiscal1: TMenuItem;
    MostrarVistaproductos1: TMenuItem;
    NoGenerarNCF1: TMenuItem;
    ImprimirLabel1: TMenuItem;
    BuscarCliente1: TMenuItem;
    NoMostrarProdVencidos1: TMenuItem;
    Ayuda1: TMenuItem;
    dsqryInventario: TDataSource;
    qryInventario: TIBQuery;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioPRECIO_MINIMO: TFloatField;
    qryInventarioINVENTARIAR: TSmallintField;
    qryInventarioCODIGO: TIntegerField;
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
    DataSource2: TDataSource;
    rxSolDatoscte: TRxMemoryData;
    rxSolDatoscteNombre: TStringField;
    rxSolDatoscteDireccion1: TStringField;
    rxSolDatoscteDireccion2: TStringField;
    rxSolDatoscteCedula: TStringField;
    rxSolDatoscteCelular: TStringField;
    rxSolDatoscteSector: TStringField;
    rxSolDatoscteCiudad: TStringField;
    rxSolDatoscteApodo: TStringField;
    rxSolDatoscteTelefono: TStringField;
    rxSolDatoscteOtraPersona: TStringField;
    rxSolDatosctencfDescripcion: TStringField;
    qryProdSerie: TIBQuery;
    qryProdSerieCODIGO: TIntegerField;
    qryProdSerieSERIE: TIBStringField;
    qryProdSerieSTATUS: TIBStringField;
    qryProv: TIBQuery;
    qryProvCODIGO_CTE: TIntegerField;
    qryProvNOMBRE_CTE: TIBStringField;
    qryProvNOMBRE_ABREV: TIBStringField;
    qryProvNOMBRE_FACTURAR: TIBStringField;
    qryProvDIRECCION_CONT: TIBStringField;
    qryProvTELEF_CONTACTO: TIBStringField;
    qryProvCIUDAD: TIBStringField;
    qryProvRNC: TIBStringField;
    qryProvRNC_NUMERO: TIBStringField;
    qryProvCEDULA: TIBStringField;
    qryProvPRECIO_ID: TIntegerField;
    qryProvLIMITE_CREDITO: TFloatField;
    dsqryProv: TDataSource;
    dstablaPropietario: TDataSource;
    tablaPropietario: TRxMemoryData;
    tablaPropietarioCodigoPropietario: TIntegerField;
    stpProcBuscarUltNum: TIBStoredProc;
    tblDatosVentaVehiculos: TIBDataSet;
    tblDatosVentaVehiculosNUM_SERIE: TIntegerField;
    tblDatosVentaVehiculosMARCA: TIBStringField;
    tblDatosVentaVehiculosMODELO: TIBStringField;
    tblDatosVentaVehiculosPLACA: TIBStringField;
    tblDatosVentaVehiculosMONTO_INICIAL: TFloatField;
    tblProductoSerie: TIBDataSet;
    tblProductoSerieCODIGO: TIntegerField;
    tblProductoSerieSERIE: TIBStringField;
    tblProductoSerieSTATUS: TIBStringField;
    ibstpUpdateLote: TIBStoredProc;
    qryClasifPrecio: TIBQuery;
    qryClasifPrecioCOD_PRODUCTO: TIntegerField;
    qryClasifPrecioPRECIO_ID: TIntegerField;
    qryClasifPrecioPRECIO_VENTA: TFloatField;
    qryVence: TIBQuery;
    qryVenceCODIGO: TIntegerField;
    qryVenceLOTE_NUM: TIBStringField;
    qryVenceCODIGO_PROV: TIntegerField;
    qryVenceCANT_IN: TIntegerField;
    qryVenceCANT_OUT: TIntegerField;
    qryVenceFECHA_VENCIMIENTO: TDateTimeField;
    qryVenceNOMBRE_PROVEEDOR: TIBStringField;
    qryVenceDESCRIPCION_PRODUCTO: TIBStringField;
    qryVenceCODIGO_TEXTO: TIBStringField;
    qryVenceDIASPORVENCER: TIntegerField;
    qryVenceDIASVENCIDOS: TIntegerField;
    qryVencePRECIO: TFloatField;
    dsqryVence: TDataSource;
    BitBtn15: TBitBtn;
    rdgBuscarPor: TRadioGroup;
    procedure Ayuda1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure chkExentoEnter(Sender: TObject);
    procedure chkExentoExit(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure LectorCodBarra1Click(Sender: TObject);
    procedure MaestroCliente1Click(Sender: TObject);
    procedure MostrarVistaproductos1Click(Sender: TObject);
    procedure NoGenerarNCF1Click(Sender: TObject);
    procedure NoMostrarProdVencidos1Click(Sender: TObject);
    procedure qryProvAfterScroll(DataSet: TDataSet);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
    procedure RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure rxLabelVenceDblClick(Sender: TObject);
    procedure rxVentaAfterPost(DataSet: TDataSet);
    procedure rxVentaBeforePost(DataSet: TDataSet);
    procedure SecretPanel1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdenCompraR: TfrmOrdenCompraR;

implementation

uses UDatModConectar, UGlobal, UDatModCompania,
  UFormSelFecha, UDatModFactura, USeleccionarNCF,
  UBuscarClientesPersonasP, UFormDatosCotiza, UDatModClientes,
  UFormSelproducto, USolDatos, UFormSelSerieProd, UInvXReferencia,
  UFormEntreClave, Math, UDatModInventario, ULabelImpCodBarra, UConsultaPrecio,
  UDatModUsuarios;


{$R *.dfm}

procedure TfrmOrdenCompraR.Ayuda1Click(Sender: TObject);
begin
  ShellExecute(TForm1.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmOrdenCompraR.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    Totales.Edit;
    rxVenta.Edit;
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmOrdenCompraR.BitBtn14Click(Sender: TObject);
begin
  DBEdit2.ReadOnly := False;
  if (varTipousuario = 0) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else
  begin
    if VerificaClave then
    begin
      DBEdit2.ReadOnly := False;
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmOrdenCompraR.BitBtn15Click(Sender: TObject);
var
  tRecordsDet : integer;
begin

end;

procedure TfrmOrdenCompraR.BitBtn1Click(Sender: TObject);
begin
  reciboImpreso :=False;
  ProcesaNuevo;
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmOrdenCompraR.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.RecordCount > 0 then
  begin
    if VerificaClave then
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
end;

procedure TfrmOrdenCompraR.BitBtn5Click(Sender: TObject);
begin
  if rxVenta.state = dsbrowse then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Borrar item No.'+rxVentaSerie.AsString+'?',mtWarning, [mbYes,mbNO], 0)=mryes then
      begin
        rxVenta.Delete;
        ProcesarSumaTotal;
      end;
    end;
  end;
end;

procedure TfrmOrdenCompraR.BuscarCliente1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    xCodigoCte:=-1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmOrdenCompraR.chkExentoEnter(Sender: TObject);
begin
  chkExento.SetFocus;
end;

procedure TfrmOrdenCompraR.chkExentoExit(Sender: TObject);
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

procedure TfrmOrdenCompraR.DBEdit1Enter(Sender: TObject);
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

procedure TfrmOrdenCompraR.DBEdit1Exit(Sender: TObject);
//var
//  guardarRec : TBookMark;
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
      MessageDlg('Cantidad no puede ser numero negativo, verifique',mtError, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if EsDevolucion then
    rxVentaMontoBruto.Value:=rxVentaMontoBruto.Value * -1;
  end;
  // guardarRec := rxVenta.GetBookmark;
  //Aplica Descuento e Itbis
  GlbNumero:= rxVentaSerie.Value;
  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;
  //ProcesaNuevo;
  edtCodigo.SelectAll;
  edtCodigo.ClearSelection;

  if isShowing then
  edtCodigo.SetFocus;

  panel2.Visible := False;

  if isShowing then
  if (GlbPermiteCambioPrecio ) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else ProcesaCalculos;

end;

procedure TfrmOrdenCompraR.DBEdit2Enter(Sender: TObject);
begin
  if (GlbNumero > 0) then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
end;

procedure TfrmOrdenCompraR.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
begin
  if DBEdit2.ReadOnly = false then
  begin

  end;

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

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
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmOrdenCompraR.DBEdit5Exit(Sender: TObject);
begin
  if Totales.State in [dsedit, dsinsert] then
  begin
    ProcesaCalculos;
    if Totales.State in [dsedit, dsinsert] then
    Totales.Post;
  end;

end;

procedure TfrmOrdenCompraR.Edit1Enter(Sender: TObject);
begin
  if (Totalestotalneto.Value < 0) then
  begin
    MessageDlg('Total neto no puede ser negativo, verifique',mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TfrmOrdenCompraR.Edit1Exit(Sender: TObject);
var
  x,y : Real;
  Activa : Boolean;
  svalue : String;
  xvalue : String;
begin

  Activa:=True;
  if Edit1.text = '' then exit;
  x := StrToFloat(Edit1.Text);

  xvalue := Format('%8.2f', [StrToFloat(Edit1.Text)]);
  svalue := Format('%8.2f', [Totalestotalneto.Value]);
  x:= StrToFloat(xvalue);
  y:= StrToFloat(svalue);
  if (xvalue = svalue) then
  Activa:=True
  else
  if ((x - y) > 0 ) then
  begin
    Activa := False;
  end else Activa := True;

  x := StrToFloat(xvalue) - StrToFloat(svalue);
  Totales.Edit;
  BitBtn4.Enabled := True;
  if Not EsFactura Or Not EsFinanciamiento then
    if (x < -0.09 ) then
    begin
      MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
      Edit1.SetFocus;
      BitBtn4.Enabled := False;
      Exit;
    end;
  Totalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  Totalesdevolucion.Value := x;
  Totales.Post;

  //if Activa then
  //begin
    BitBtn4.Enabled := True;
    BitBtn4.SetFocus;
  //end;
end;

procedure TfrmOrdenCompraR.edtCodigoChange(Sender: TObject);
begin
  //if rxVenta.State = dsBrowse then
  rxLabelVence.Visible:= False;
  if LectorCodBarra1.Checked then exit;
  BuscandoPorDesc:=False;
  if edtCodigo.Text = '' then Exit;
  if esNumero(edtCodigo.Text) then
  begin
    AsignarSqlText('','','');
    if dmdatos.rxqryInv.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('codigo_texto', qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end
  end else
  begin
     BuscandoPorDesc:=True;
    AsignarSqlText('descripcion',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top:=edtcodigo.Top+30;
      panel2.Left:=edtcodigo.Left;
      panel2.Visible:=True;
      panel2.BringToFront;
    end;
  end;
end;

procedure TfrmOrdenCompraR.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.SelectAll;
end;

procedure TfrmOrdenCompraR.edtCodigoExit(Sender: TObject);
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

  if panel2.Visible then
  edtCodigo.Text := qryProductosCodigo_Texto.Value;

  //****************xxxx***********************
  if esNumero(edtCodigo.Text) then
  begin
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('codigo_texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end
  end else
  begin
     BuscandoPorDesc:=True;
    if  .Locate('Descripcion',edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top:=edtcodigo.Top+30;
      panel2.Left:=edtcodigo.Left;
      panel2.Visible:=True;
      panel2.BringToFront;
    end;
  end;
  //****************xxxx***********************

  if Not dmdatos.qryInv.Locate('codigo_Texto', edtCodigo.Text,[]) then
  begin
    //MessageDlg('Codigo no encontrado, verifique', mtError, [mbOK], 0);
    //edtCodigo.SetFocus;
    Prod_existe:=False;
  end else
  begin
    Prod_existe:= True;
    dmdatos.qryInv.Locate('CODIGO_TEXTO', edtCodigo.Text,[]);

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
      rxVentaCant.Value := 1;
      //rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      rxVentaSerie.Value := Numero;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      rxVentaCodUsuario.Value := VarUsuarioGlb;
    end;
    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      rxVentaDescripcion.Value:= dmdatos.rxqryInvDESCRIPCION.Value;
      rxVentaReferencia.Value := dmdatos.rxqryInvREFERENCIA.Value;

      if FAplicaPrecioMayorista then
      rxVentaPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value
      else
      rxVentaPrecio.Value  := dmdatos.rxqryInvPRECIO_COSTO.Value;
      rxVentaMontoItbisenPrecio.Value:=0;
      MontoItbisEnPrecio:=0;

      rxVentaCodArticulo.Value:= dmdatos.rxqryInvcodigo.Value;
      rxVentaCodTexto.Value   := edtCodigo.Text;
      //rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      qryProdSerie.close;

      qryProdSerie.Params[0].Value:= dmdatos.rxqryInvcodigo.Value;
      qryProdSerie.Open;
      if (qryProdSerieSTATUS.Value = 'R') then
      begin
        MessageDlg('Número serie no disponible, verifique', mtInformation, [mbOK], 0);
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

      dmInventario.qryLote.Close;
      dmInventario.qryLote.Params[0].Value:= dmdatos.rxqryInvCODIGO.Value;
      dmInventario.qryLote.Open;
      if dmInventario.qryLote.recordcount > 0 then
      begin
        frmShowLote:=TfrmShowLote.Create(Nil);
        try
          if frmShowLote.Showmodal = mrok then
          rxVentaloteNum.Value := dmInventario.qryLoteLOTE_NUM.Value;
        finally
        frmShowLote.free;
        frmShowLote:=nil;
        end;
      end;
    end else ProcesaNuevo;
  end;
  panel2.Visible:=MostrarVistaproductos1.Checked;
  if LectorCodBarra1.Checked And (rxVentaPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmOrdenCompraR.edtReferenciaChange(Sender: TObject);
begin
  if dmdatos.rxqryInv.Locate('referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey]) then
  begin
    Prod_existe:= True;
    edtCodigo.Text := dmdatos.rxqryInvCODIGO_TEXTO.Value;
    panel2.Top := edtcodigo.Top+30;
    panel2.Left:= edtcodigo.Left;
    panel2.Visible:=True;
    panel2.BringToFront;
  end
end;

procedure TfrmOrdenCompraR.edtReferenciaExit(Sender: TObject);
begin
  if Panel2.Visible then
  edtReferencia.Text := dmdatos.rxqryInvCodigo_Texto.Value;

  dmdatos.rxqryInv.Locate('Referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey])

end;

procedure TfrmOrdenCompraR.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    xxxx : word; item : String;
begin
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  if (key = 123) then //F12
  begin
    NoGenerarNCF1Click(Self);
  end;
  if (key = 120) then
  BitBtn5Click(self);
  
  if (key = 27) then
  begin
    if MessageDlg('Cerrar ventana?', mtInformation, [mbYes,mbNo], 0) = mryes then
    Close;
  end;
  if (key = 121) then //F10
  LectorCodBarra1Click(Self);
  
  if (key = 118) then //F7
  BuscarCliente1Click(Self)
  else if (key = 117) then
  CheckBox1.checked:= Not CheckBox1.checked;
  if (key = 113) then
  begin
    edtCodigo.SetFocus;
    Exit;
  end;
  if (key = 115) then
  BitBtn3Click(Self) else
  if (key = 113) then BitBtn1Click(Self)
  else if (key = 114) then BitBtn2Click(Self)
  else if (key = 116) then
  if (Edit1.Text <> '') then
  BitBtn4Click(Self)
  else if (key = 119) then //F9
  begin
    if rxVenta.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if rxVenta.Locate('Serie', strToInt(item),[]) then
      rxVenta.Delete;
      ProcesarSumaTotal;
  end;
  end;
end;

procedure TfrmOrdenCompraR.LectorCodBarra1Click(Sender: TObject);
begin
  if rdgBuscarPor.ItemIndex = 1 then
  edtCodigo.Hint:='Enter - para buscar codigo barra'
  else edtCodigo.Hint:= '';
end;

procedure TfrmOrdenCompraR.MaestroCliente1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Self);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
end;

procedure TfrmOrdenCompraR.MostrarVistaproductos1Click(Sender: TObject);
begin
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmOrdenCompraR.NoGenerarNCF1Click(Sender: TObject);
begin
  NoGenerarNCF1.Checked := not NoGenerarNCF1.Checked;
  if  NoGenerarNCF1.Checked then
  Label21.Visible := True else
  Label21.Visible := false;
  CheckBox1.Visible := Not Label21.Visible;
end;

procedure TfrmOrdenCompraR.NoMostrarProdVencidos1Click(Sender: TObject);
begin
  NoMostrarProdVencidos1.Checked:= not NoMostrarProdVencidos1.Checked;
  if NoMostrarProdVencidos1.Checked then
  begin
    SecretPanel1.Visible:=True;
    SecretPanel1.Active :=True;
  end
  else SecretPanel1.Visible:=False;
end;

procedure TfrmOrdenCompraR.qryProvAfterScroll(DataSet: TDataSet);
begin
  AbrirClasifPrecio;
end;

procedure TfrmOrdenCompraR.RxDBGrid2DblClick(Sender: TObject);
begin
  edtCodigo.Text := dmdatos.rxqryInvCodigo_texto.Value;
  panel2.Visible := False;
  Prod_existe    := True;
  DBEdit1.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmOrdenCompraR.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmOrdenCompraR.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmOrdenCompraR.RxDBGrid3DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:=false;
end;

procedure TfrmOrdenCompraR.rxLabelVenceDblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
end;

procedure TfrmOrdenCompraR.rxVentaAfterPost(DataSet: TDataSet);
begin
  if sumarDatos then
  ProcesarSumaTotal;
end;

procedure TfrmOrdenCompraR.rxVentaBeforePost(DataSet: TDataSet);
begin
  if rxVentaCant.IsNull or rxVentaPrecio.IsNull then
  begin
    DataSet.Cancel;
    if isShowing then
    BitBtn1.SetFocus;
  end;
end;

procedure TfrmOrdenCompraR.SecretPanel1DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
  SecretPanel1.Visible:=False;
end;

end.
