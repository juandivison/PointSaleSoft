unit UFormProcDevolucion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UProcVentaRapida, DB, IBStoredProc, Menus, WinSkinData,
  IBCustomDataSet, IBQuery, RxMemDS, RxLookup, StdCtrls, EditNew, Grids,
  DBGrids, RXDBCtrl, Mask, DBCtrls, Buttons, ExtCtrls, RXCtrls, IBSQL;

type
  TfrmProcVentaRapidaEdicion = class(TfrmProcVentaRapida)
    ibsqlSerie_ncf: TIBSQL;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoExit(Sender: TObject);

  private
    { Private declarations }
        procedure ProcesaCalculos;
        procedure ProcesarSumaTotal;
  public
    { Public declarations }
  end;

var
  frmProcVentaRapidaEdicion: TfrmProcVentaRapidaEdicion;

implementation
uses UEdicionVenta, URepRecibo8_5_11Devol, URepComprobanteDevol, uGlobal,
  UFormSelSerieProd;
{$R *.dfm}

procedure TfrmProcVentaRapidaEdicion.FormCreate(Sender: TObject);
begin
  inherited;
   BitBtn7.Enabled:=False;
  BitBtn1.Enabled:=False;
  BitBtn6.Enabled:=False;
  BitBtn8.Enabled:=False;
  BitBtn11.Enabled:=False;
end;

procedure TfrmProcVentaRapidaEdicion.BitBtn5Click(Sender: TObject);
begin
  //inherited;
  if MessageDlg('Eliminar record seleccionado?', mtWarning, [mbyes, mbno], 0) = mryes then
  begin
    //InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
    ibStpActualizaInvProd.Params[2].Value:= 1;//tipoTrn
    ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
    ibStpActualizaInvProd.ExecProc;

    //ActualizaInvAlmacen;//Actualiza Division Inventario

    if Not ibStpActualizaInvProd.Transaction.InTransaction then
    ibStpActualizaInvProd.Transaction.StartTransaction;
    try
      ibStpActualizaInvProd.Transaction.CommitRetaining;
    except
    ibStpActualizaInvProd.Transaction.RollbackRetaining;
    end;
    rxVenta.Delete;
  end;
end;

procedure TfrmProcVentaRapidaEdicion.BitBtn4Click(Sender: TObject);
  var
  serie_asignadoncf : Integer;
  valorNCF : String;
begin
  //inherited;
  //Generar y asignar Numero de Comprobante Fiscal
  valorNCF:='';

  frmEdicionVenta.tblDatosVenta.Edit;
  frmEdicionVenta.tblDatosVentaCODIGO_VENDEDOR.Value:=VarUsuarioGlb;
  frmEdicionVenta.tblDatosVentaVALOR_TOTAL_DET.Value := TotalesSubTotal.Value;
  if ibsqlSerie_ncf.Open then
  ibsqlSerie_ncf.Close;
  ibsqlSerie_ncf.Params[0].Value:=frmEdicionVenta.tblDatosVentaSERIE_NCF_ASIGNADO.Value;
  ibsqlSerie_ncf.ExecQuery;
  valorNCF:= ibsqlSerie_ncf.fieldbyname('numero_ncf').value;
  frmEdicionVenta.tblDatosVentaMOD_POR.Value:=strusername;
  frmEdicionVenta.tblDatosVentaFECHA_MOD.Value:=now;

  if Not frmEdicionVenta.tblDatosVenta.Transaction.InTransaction then
  frmEdicionVenta.tblDatosVenta.Transaction.StartTransaction;
  try
    frmEdicionVenta.tblDatosVenta.Transaction.CommitRetaining;
  except
  frmEdicionVenta.tblDatosVenta.Transaction.RollbackRetaining;
  end;

  rxVenta.DisableControls;
  rxVenta.First;
  While Not rxVenta.Eof do
  begin
    //InsertarDet(ipStpInsertVentMast.Params[0].Value);
    if frmEdicionVenta.tblDatosDet.Locate('Serie', rxVentaSerie.Value,[]) then
    begin
      frmEdicionVenta.tblDatosDet.Edit;
      frmEdicionVenta.tblDatosDetCANTIDAD.Value := rxVentaCant.Value;
      frmEdicionVenta.tblDatosDetPRECIO.Value   := rxVentaPrecio.Value;

      frmEdicionVenta.tblDatosDetPORC_DESC_DET.Value:= rxVentaporc_desc.Value;
      frmEdicionVenta.tblDatosDetITBI_DET.Value     := rxVentaItbi.Value;//itbi_det
      frmEdicionVenta.tblDatosDetVALOR_SERVICIO_DET.value := rxVentaMontoBruto.Value;
      frmEdicionVenta.tblDatosDetVALOR_TOTAL_DET.Value    := rxVentaMontoNeto.Value;

      frmEdicionVenta.tblDatosDetMOD_POR.Value:= StrUsername;
      frmEdicionVenta.tblDatosDetFECHA_MOD.Value:= Now;
      frmEdicionVenta.tblDatosDet.Post;
      frmEdicionVenta.tblDatosDet.ApplyUpdates;
      rxVenta.Next;
    end;
  end;
  rxVenta.First;
  rxVenta.EnableControls;

  if Not frmEdicionVenta.tblDatosDet.Transaction.InTransaction then
  frmEdicionVenta.tblDatosDet.Transaction.StartTransaction;
  try
    frmEdicionVenta.tblDatosDet.Transaction.CommitRetaining;
  except
  frmEdicionVenta.tblDatosDet.Transaction.RollbackRetaining;
  end;

  if (GlbRec55Pulg = 1) then
  begin

  if rxSolDatoscte.State In [dsInactive] then
    rxSolDatoscte.Open;

    if rxSolDatoscte.State In [dsBrowse] then
    if rxSolDatoscte.RecordCount = 0 then
    begin
      if tablaPropietarioCodigoPropietario.value > 0 then
      begin
        rxSolDatoscte.Close;
        rxSolDatoscte.Open;
        rxSolDatoscte.Insert;
        rxSolDatoscteNombre.Value    := qryClienteNOMBRE_CTE.Value;
        rxSolDatoscteDireccion1.Value:= qryClienteDIRECCION_CONT.Value;
        rxSolDatoscteDireccion2.Value:= '';

        if qryClienteRNC_NUMERO.IsNull then
           rxSolDatoscteCedula.Value    := qryClienteCEDULA.Value
        else
        rxSolDatoscteCedula.Value    := qryClienteRNC_NUMERO.Value;

        rxSolDatoscteCiudad.Value    := qryClienteCIUDAD.Value;
        rxSolDatoscteTelefono.Value  := qryClienteTELEF_CONTACTO.Value;

        if Length(edtObservacion.Text) > 0 then
        rxSolDatoscteNombre.Value    := edtObservacion.Text;
      end else
      begin
        rxSolDatoscte.Close;
        rxSolDatoscte.Open;
        rxSolDatoscte.Insert;
        rxSolDatoscteNombre.Value  := '*** Cliente Generico ***';
      end;
      rxSolDatosctencfDescripcion.Value := TotalesqrLabelNcfDesc.Value;
      rxSolDatoscte.Post;
    end;
    
    qckRepRecibo8_5_11Devol :=TqckRepRecibo8_5_11Devol.Create(Nil);
    try
    qckRepRecibo8_5_11Devol.TPag.Caption:= IntToStr(qckRepRecibo8_5_11Devol.PageNumber);
    finally
    qckRepRecibo8_5_11Devol.Free;
    qckRepRecibo8_5_11Devol:=Nil;
    end;

    qckRepRecibo8_5_11Devol:=TqckRepRecibo8_5_11Devol.Create(Nil);
    try
      qckRepRecibo8_5_11Devol.xtipoVenta := TipoVenta;
      qckRepRecibo8_5_11Devol.valorNCF   := valorNCF;
      qckRepRecibo8_5_11Devol.Preview;
      if MessageDlg('Re-imprimir',mtInformation, [mbNo, mbyes], 0) = mryes then
      begin
        qckRepRecibo8_5_11Devol.Preview;
      end;
    finally
    qckRepRecibo8_5_11Devol.Free;
    qckRepRecibo8_5_11Devol:=Nil;
    end;
  end else
  begin
    qckRepReciboDevol:=TqckRepReciboDevol.Create(Nil);
    try
      //aqui indicar codigo cliente JUAN
      //frmEdicionVenta.tblDatosVentaCODIGO_CTE.Value
      if Length(TotalesNombreCliente.Value) > 0 then
      totales.recordcount;
      TotalesRnc_Numero.Value;
      TotalesNombreCliente.Value;
      if not frmEdicionVenta.tblDatosVentaNOMBRE_CTE.IsNull then
      qckRepReciboDevol.nombreCteGenerico:=frmEdicionVenta.tblDatosVentaNOMBRE_CTE.Value
      else
      if Length(edtObservacion.Text) > 0 then
      qckRepReciboDevol.nombreCteGenerico:=edtObservacion.Text;

      qckRepReciboDevol.xtipoVenta := TipoVenta;
      qckRepReciboDevol.valorNCF:= valorNCF;
      qckRepReciboDevol.qrLabelRNC.Caption := TotalesRnc_Numero.Value;
      //qckRepReciboDevol.
      if rxVenta.RecordCount >= 2 then
      qckRepReciboDevol.Page.Length:= qckRepReciboDevol.Page.Length +
      (rxVenta.RecordCount - 1 ) * 0.96;
      //if ImprimirRecibo1.Checked then
      if MessageDlg('Imprimir?', mtInformation, [mbyes, mbno], 0) = mrYes then
      qckRepReciboDevol.Print else
      qckRepReciboDevol.Preview;
    finally
    qckRepReciboDevol.Free;
    qckRepReciboDevol:=Nil;
    end;
  end;
  rxVenta.EmptyTable;
  Edit1.Text := '';
  edtCodigo.Text := '';
  //BitBtn4.Enabled := False;
  //BitBtn1.SetFocus;
  Totales.EmptyTable;
  Close;
end;

procedure TfrmProcVentaRapidaEdicion.DBEdit1Exit(Sender: TObject);
begin
  //inherited;
  if rxVenta.State In [dsInsert, dsEdit] then
  rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
  ProcesaCalculos;

  if rxVenta.State In [dsEdit] Then
  rxVenta.Post;

end;

procedure TfrmProcVentaRapidaEdicion.ProcesaCalculos;
var
  porItbi: Real;
begin
  if rxVenta.State In [dsEdit] then
  begin
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value));

    rxVentaPorc_Desc.Value := qryInventarioPORC_DESCUENTO.Value;

    if rxVentaPorc_Desc.Value > 0 then
    rxVentaMontoDescuento.Value := (rxVentaMontoBruto.Value * rxVentaporc_desc.Value/100)
    else rxVentaMontoDescuento.Value := 0;
    if (TotalesPorcDesAdicional.Value > 0) then
    TotalesMontoDescAdicional.Value:= (rxVentaMontoBruto.Value * TotalesPorcDesAdicional.Value / 100);
    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value
    - TotalesMontoDescAdicional.Value;

    if qryInventarioPAGA_ITBI.Value = 1 then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi/100);

    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
  end;
end;

procedure TfrmProcVentaRapidaEdicion.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
    xxxx : word; item : String;
begin
//  inherited;
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  if (key = 27) then
  begin
    if MessageDlg('Cerrar ventana?',mtInformation, [mbyes,mbNo], 0) = mryes then
    Close;
  end;
  if (key = 118) then //F7
  BuscarCliente1Click(Self)
  else if (key = 117) then
  CheckBox1.checked:= Not CheckBox1.checked;

  if (key = 115) then
  BitBtn3Click(Self) else
  //if (key = 113) then BitBtn1Click(Self) else
  if (key = 114) then BitBtn2Click(Self)
  else if (key = 116) then
  if (Edit1.Text <> '') then
  BitBtn4Click(Self)
  else if (key = 119) then //F9
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

procedure TfrmProcVentaRapidaEdicion.ProcesarSumaTotal;
var
  monto:Extended;
  itbis, descuento, neto: Extended;
begin
  if rxVenta.state <> dsBrowse then Exit;
  rxVenta.DisableControls;
  rxVenta.First;
  Monto:=0; Itbis:=0; Descuento:=0; Neto:=0;
  While Not rxVenta.Eof do
  begin
    Monto := Monto + rxVentaMontoBruto.Value;
    Itbis := itbis + rxVentaItbi.Value;
    Descuento:= descuento + rxVentaMontoDescuento.Value;
    Neto     := Neto + rxVentaMontoNeto.Value;
    rxVenta.Next;
  end;

  Totales.Edit;
  TotalesSubTotal.Value     := Monto;
  Totalesitbis.Value        := Itbis;
  Totalesmontodesc.Value    := Descuento;

  if EsFactura or EsFinanciamiento then
  begin
    if (Totalesmontorecibido.Value < Neto) then
    Totalestotalneto.Value := Neto - Totalesmontorecibido.Value +
    TotalesMontoInteres.Value
    else Totalestotalneto.Value := Totalesmontorecibido.Value - Neto  +
    TotalesMontoInteres.Value;
  end else Totalestotalneto.Value := Neto;

  Totales.Post;

  rxVenta.EnableControls;

end;

procedure TfrmProcVentaRapidaEdicion.edtCodigoExit(Sender: TObject);

var
  numero : Integer;
begin
  //inherited;
  if (edtCodigo.Text = '') then Exit;

  if panel2.Visible then
  edtCodigo.Text := qryProductosCodigo_Texto.Value;

  if Not qryProductos.Locate('codigo_Texto',edtCodigo.Text,[]) then
  begin
    //MessageDlg('Codigo no encontrado, verifique', mtError, [mbOK], 0);
    //edtCodigo.SetFocus;
    Prod_existe:=False;
  end else
  begin
    Prod_existe:=true;
    qryInventario.Locate('CODIGO_TEXTO',edtCodigo.Text,[]);
    //if rxVenta.State = dsBrowse then
    //begin
    //  rxVenta.DisableControls;
    //  if (rxVenta.RecordCount > 0) then
    //  begin
    //    rxVenta.Last;
    //    numero := rxVentaSerie.Value + 1;
    //  end else numero:=1;
    //  rxVenta.EnableControls;
      //rxVenta.Insert;
     rxVenta.Edit;
     // rxVentaSerie.Value := Numero;
     // rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      rxVentaCodUsuario.Value := VarUsuarioGlb;
   end;
    if rxVenta.State In [dsEdit] then
    begin
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      rxVentaPrecio.Value     := qryProductosPRECIO.Value;
      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      rxVentaCodTexto.Value   := edtCodigo.Text;
      qryProdSerie.close;
      qryProdSerie.Params[0].Value:= edtCodigo.Text;
      qryProdSerie.Open;
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
    //end;// else ProcesaNuevo;
  end;
  panel2.Visible:=MostrarVistaproductos1.Checked;
end;

end.
