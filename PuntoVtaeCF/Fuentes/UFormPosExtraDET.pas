unit UFormPosExtraDET;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Db, Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons;

type
  TfrmPosExtraDet = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    DataSource2: TDataSource;
    RxDBGrid2: TRxDBGrid;
    BitBtn2: TBitBtn;
    RxDBGrid3: TRxDBGrid;
    dsqryPosExtraSum: TDataSource;
    Button4: TButton;
    dsqryGetSumVtaExtra: TDataSource;
    RxDBGrid4: TRxDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RxDBGrid2CellClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    esFeedback : boolean;
    numero_cotiza : integer;
    ticket_preventa : integer;
    serierxVenta:integer;
    procedure ProcAbrirDatos(nmr:integer);
    procedure ProcAbrirPorCodUsuario;
    procedure ProcInsertarDato(numCotiza:integer);
    procedure ProcPosExtraCotiza(numcoti:Integer);
    procedure ProcPosExtraRecuperaVenta(num: Integer);
    procedure ProcInsertarOferta(serie: integer;cant:real;codp:integer);
  end;

var
  frmPosExtraDet: TfrmPosExtraDet;

implementation

uses UDatModCalculos, UGlobal, UProcVentaRapida, UDatModInventario,
  UFormLog;

{$R *.dfm}

procedure TfrmPosExtraDet.Button1Click(Sender: TObject);
begin
  ProcAbrirDatos(GlbNumVtaPOS);
end;

procedure TfrmPosExtraDet.ProcAbrirDatos(nmr: integer);
begin
  if (GlbUsandoCotiza) then exit;
  if dmCalculos.qryConsultaPosExtraDet.Tag = 99 then exit;
  dmCalculos.qryConsultaPosExtraDet.Close;
  dmCalculos.qryConsultaPosExtraDet.SQL.Clear;
  if (nmr > 0 ) then
  begin
    dmCalculos.qryDatosCotiPosExtra.Close;
    dmCalculos.qryDatosCotiPosExtra.params[0].Value:=nmr;
    dmCalculos.qryDatosCotiPosExtra.params[1].Value:=0;
    dmCalculos.qryDatosCotiPosExtra.params[2].Value:=0;

  end else
  begin
    dmCalculos.qryDatosCotiPosExtra.Close;
    dmCalculos.qryDatosCotiPosExtra.params[0].Value:=-777;//nmr
    dmCalculos.qryDatosCotiPosExtra.params[1].Value:=0;
    dmCalculos.qryDatosCotiPosExtra.params[2].Value:=0;
    dmCalculos.qryDatosCotiPosExtra.Open; 
  end;
  dmCalculos.qryPosExtraDet.Open;
  frmLogError.CurrenLN:= 91;
  frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,'ProcAbrirDatos(nmr: integer);','UFormExtraDET;');
end;

procedure TfrmPosExtraDet.Button2Click(Sender: TObject);
begin
  ProcAbrirDatos(GlbNumVtaPOS);
end;

procedure TfrmPosExtraDet.ProcAbrirPorCodUsuario;
begin
  if dmCalculos.qryConsultaPosExtraDet.Tag = 99 then exit;
  if GlbEntradoAvta then
  begin
    GlbEntradoAvta:=False;
    exit;
  end;

  if (frmProcVentaRapida.rxVentaStatus.Value = 'C') then exit;
  if dmCalculos.qryPosExtraDet.State = dsBrowse then
  if (numero_cotiza <= 0) and (ticket_preventa <= 0) then
  if not esCargaDatosFFood then
  Exit;

  if (dmCalculos.qryConsultaPosExtraDet.Tag <> 99) then
  begin
    dmCalculos.qryConsultaPosExtraDet.Close;
    dmCalculos.qryConsultaPosExtraDet.Params[0].Value := -1;
    dmCalculos.qryConsultaPosExtraDet.Params[1].Value := VarUsuarioGlb;
    if ticket_preventa > 0 then
    dmCalculos.qryConsultaPosExtraDet.Params[2].Value := ticket_preventa
    else
    dmCalculos.qryConsultaPosExtraDet.Params[2].Value := numero_cotiza;
    frmLogError.CurrenLN:= 126;
    frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'TfrmPosExtraDet.ProcAbrirPorCodUsuario;',
    'UFormPosExtraDET');
    dmCalculos.qryConsultaPosExtraDet.Open;
    frmLogError.CurrenLN:=130;
    frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'TfrmPosExtraDet.ProcAbrirPorCodUsuario;',
    'UFormPosExtraDET');

    dmCalculos.qryConsultaPosExtraDet.Last;
  end;
  frmProcVentaRapida.rxVenta.DisableControls;
  frmProcVentaRapida.recuperando:=True;
  frmProcVentaRapida.sumarDatos :=False;
  dmCalculos.esFeedback := True;
  frmProcVentaRapida.qryInventario.Close;
  frmProcVentaRapida.qryInventario.Params[0].Value:= glbCia_Key;
  frmProcVentaRapida.qryInventario.Open;
  if (dmCalculos.qryConsultaPosExtraDet.Tag <> 99) then
  dmCalculos.qryConsultaPosExtraDet.First;
  frmProcVentaRapida.rxVenta.DisableControls;
  RxDBGrid1.DisableScroll;
  frmProcVentaRapida.ProgressBar1.Max:= dmCalculos.qryConsultaPosExtraDet.RecordCount;
  frmProcVentaRapida.ProgressBar1.Position := 0;
  frmProcVentaRapida.ProgressBar1.Visible:= False;
  //if dmCalculos.qryConsultaPosExtraDet.RecordCount > 0 then
  //begin
    //if (numero_cotiza <= 0) or (ticket_preventa <=0 ) then
   // if not esCargaDatosFFood then
    //if (LlenandoDatos and EsModificandoCotiza) then
    //begin
      //dmcalculos.ProcDeletePosExtraDet(dmCalculos.qryConsultaPosExtraDetNumero.Value);
      //dmCalculos.qryConsultaPosExtraDet.Close;
      //dmCalculos.qryConsultaPosExtraDet.Open;;
    //end else
    //begin
      //revisar logica para insertar venta existente
    //end;
    //t if MessageDlg('Existe una venta pendiente, desea cargarla?',mtInformation,[mbyes, mbno],0) = mrno then
    //t begin
    //t   dmcalculos.ProcDeletePosExtraDet(dmCalculos.qryConsultaPosExtraDetNumero.Value);
    //t   dmCalculos.qryConsultaPosExtraDet.Close;
    //t   dmCalculos.qryConsultaPosExtraDet.Open;;
    //t end;
  //end;
  dmCalculos.qryConsultaPosExtraDet.Tag := 99;//no cerrar cuado es loop
  dmCalculos.qryConsultaPosExtraDet.First;
  While not dmCalculos.qryConsultaPosExtraDet.Eof Do
  begin
    if dmCalculos.qryDatosCotiPosExtra.params[0].Value - -777 then Break;
    if frmProcVentaRapida.rxVenta.RecordCount = dmCalculos.qryConsultaPosExtraDet.RecordCount then
    break;
    frmProcVentaRapida.rxVenta.Append;
    frmProcVentaRapida.rxVentaSerie.Value := dmcalculos.qryConsultaPosExtraDetSerie.Value;
    frmProcVentaRapida.rxVentaStatus.Value:= 'A';
    GlbNumVtaPOS := dmcalculos.qryConsultaPosExtraDetNUMERO.Value;
    frmProcVentaRapida.rxVentaNumeroCotiza.Value:=  dmCalculos.qryConsultaPosExtraDetNUMERO_COTIZA.Value;
    frmProcVentaRapida.rxVentaFecha.Value := dmcalculos.qryConsultaPosExtraDetFECHA.Value;

    frmProcVentaRapida.rxVentaTipoVenta.Value:= 0;//dmcalculos.qryConsultaPosExtraDetD_TIPO_VENTA.Value;
    frmProcVentaRapida.rxVentaMoneda.Value := dmcalculos.qryConsultaPosExtraDetD_MONEDA.Value;

    if not frmProcVentaRapida.qryInventario.Locate('CODIGO', dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value,[]) then
    frmProcVentaRapida.rxVentaDescripcion.Value:= '????????'
    else
    frmProcVentaRapida.rxVentaDescripcion.Value:=frmProcVentaRapida.qryInventarioDESCRIPCION.Value;
    frmProcVentaRapida.rxVentaCodArticulo.Value:= dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value;
    frmProcVentaRapida.rxVentaCodTexto.Value :=dmcalculos.qryConsultaPosExtraDetCODTEXTO.Value;
    frmProcVentaRapida.rxVentaCant.Value  := dmcalculos.qryConsultaPosExtraDetD_CANT.Value;
    frmProcVentaRapida.rxVentaPrecio.Value:= dmcalculos.qryConsultaPosExtraDetD_PRECIO.Value;

    if dmcalculos.qryConsultaPosExtraDetD_TRANSPITBIS.Value = 1 then
    frmProcVentaRapida.rxVentaporc_desc.Value:=
    dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value / (1 + dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value/100)
    else
    frmProcVentaRapida.rxVentaporc_desc.Value:= dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value;
    frmProcVentaRapida.rxVentaItbi.Value  :=
    (frmProcVentaRapida.rxVentaCant.Value * frmProcVentaRapida.rxVentaPrecio.Value) *
    (frmProcVentaRapida.rxVentaporc_desc.Value /100);
    frmProcVentaRapida.rxVentaPorcDescItem.Value:=dmcalculos.qryConsultaPosExtraDetD_PORCDESCITEM.Value;
    frmProcVentaRapida.rxVentaTipoUnidad.Value:= dmcalculos.qryConsultaPosExtraDetD_TIPO_UNIDAD.Value;

    frmProcVentaRapida.rxVentaDC_ITBIS_CLD.Value := dmcalculos.qryConsultaPosExtraDetDC_ITBIS_CLD.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_GLB.Value := dmcalculos.qryConsultaPosExtraDetTC_MONTOITBISRECARGO_GLB.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_ITM.Value := dmcalculos.qryConsultaPosExtraDetTC_MONTOITBISRECARGO_ITM.Value;

    if dmInventario.qryTipoUnidad.State = dsInactive then dmInventario.qryTipoUnidad.Open;

    if dmInventario.qryTipoUnidad.Locate('IDUNIDAD',dmcalculos.qryConsultaPosExtraDetD_TIPO_UNIDAD.Value ,[]) then
    frmProcVentaRapida.cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value
    else frmProcVentaRapida.cboxTipoUnidad.Text:='UNIDAD';

    frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value);
    frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);

    if frmProcVentaRapida.qryProductos.State = dsInactive then
    frmProcVentaRapida.qryProductos.Open;

    if frmProcVentaRapida.qryProductos.Locate('CODIGO',frmProcVentaRapida.rxVentaCodArticulo.Value,[]) then
    begin
      frmProcVentaRapida.rxVentaCodTexto.Value   := frmProcVentaRapida.qryProductosCODIGO_TEXTO.Value;
      frmProcVentaRapida.rxVentaDescripcionEspecial.Value := frmProcVentaRapida.qryProductosDESCRIPCIONADICIONAL.Value;
      frmProcVentaRapida.rxVentaCostoProducto.Value       := frmProcVentaRapida.qryProductosPRECIO_COMPRA.Value;
      frmProcVentaRapida.rxVentaInvetariar.Value := frmProcVentaRapida.qryProductosINVENTARIAR.Value;
    end;

    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;

    FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), frmProcVentaRapida.rxVentaCodArticulo.Value);
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := GlbIDTasa;

    if (GlbIgI = 1) and (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO')
    and (GlbCalcItbis = 0) then
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := 1;

    dmCalculos.EsProcCalc:=True;
    frmLogError.Marca:=11; frmLogError.CurrenLN:=237; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Antes dmCalculos.ProcesaCalculos;','UFormPosExtraDET');
    dmCalculos.ProcesaCalculos;
    frmLogError.Marca:=22; frmLogError.CurrenLN:=237; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Despues dmCalculos.ProcesaCalculos;','UFormPosExtraDET');

    frmLogError.CurrenLN:=240;
    frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'While not dmCalculos.qryConsultaPosExtraDet.Eof Do TfrmPosExtraDet.ProcAbrirPorCodUsuario;',
    'UFormPosExtraDET');

    if frmProcVentaRapida.rxVenta.State in [dsEdit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;

    frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'While not dmCalculos.qryConsultaPosExtraDet.Eof Do TfrmPosExtraDet.ProcAbrirPorCodUsuario;',
    'UformPosExtraDET;');


    frmProcVentaRapida.ProgressBar1.StepIt;
    Application.ProcessMessages;
    dmCalculos.EsProcCalc:=False;
    dmCalculos.qryConsultaPosExtraDet.Next;//dmCalculos.qryConsultaPosExtraDetserie.value
  end;
  esCargaDatosFFood:=false;
  numero_cotiza :=-1;
  dmCalculos.qryConsultaPosExtraDet.Tag := 0;
  frmProcVentaRapida.ProgressBar1.Visible:=False;
  dmCalculos.esFeedback := False;
  dmCalculos.qryPosExtraDet.Close;
  dmCalculos.qryPosExtraDet.Params[0].Value:=dmcalculos.qryConsultaPosExtraDetNUMERO.Value;
  dmCalculos.qryPosExtraDet.Open;
  frmLogError.CurrenLN:=266;
  frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
  'Antes',
  'UFormExtraDET');

  dmcalculos.qryConsultaPosExtraDet.close;
  dmcalculos.qryConsultaPosExtraDet.Open;


  frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
  'Despues procedure TfrmPosExtraDet.ProcAbrirPorCodUsuario;',
  'dmcalculos.qryConsultaPosExtraDet.Open UFormExtraDET');

  dmcalculos.qryConsultaPosExtraDet.close;
  dmcalculos.qryConsultaPosExtraDet.Open;frmLogError.CurrenLN:=280;
  frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
  'Antes',
  'dmcalculos.qryConsultaPosExtraDet.Open UFormExtraDET');

      frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
      'Antes dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      '');
    if (frmProcVentaRapida.rxVenta.RecordCount > 0)
    or (not frmProcVentaRapida.rxVentaCodArticulo.IsNull) then
    dmcalculos.Pos_UpdateTotales(dmcalculos.qryConsultaPosExtraDetNUMERO.Value);

      frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
      'Despues dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);',
      'UFormExtraDET');
  frmProcVentaRapida.rxVenta.EnableControls;
  frmProcVentaRapida.RxDBGrid1.EnableScroll;
end;

procedure TfrmPosExtraDet.FormCreate(Sender: TObject);
begin
  if frmProcVentaRapida.chkNoLeyPropina.Checked then
  dmCalculos.CalcPropinaLegal := False
  else
  dmCalculos.CalcPropinaLegal:=True;

  dmCalculos.qryConsultaPosExtraDet.close;
  if (dmCalculos.qryConsultaPosExtraDet.SQL.Text = '') then
  dmCalculos.qryConsultaPosExtraDet.SQL.Add('SELECT * from proc_posConsExtraDet(:numerostr, :coduser,:numcotiza)');
  dmCalculos.qryConsultaPosExtraDet.Open;
  dmCalculos.qryPosExtraDet.Close;
  dmCalculos.qryPosExtraDet.Open;

  dmCalculos.qryPosExtraSum.close;
  dmCalculos.qryPosExtraSum.Open;  
end;

procedure TfrmPosExtraDet.Button3Click(Sender: TObject);
begin
  if MessageDlg('Eliminar record?',mtError,[mbyes,mbno],0)=mrYes then
  begin
    if dmCalculos.qryPosExtraDet.RecordCount > 0 then
    dmCalculos.qryPosExtraDet.Delete;
    GlbSalvarQuery(dmCalculos.qryPosExtraDet);
  end;
end;

procedure TfrmPosExtraDet.ProcInsertarDato(numCotiza: integer);
begin
  if dmCalculos.qryDatosCotiPosExtra.params[0].Value = -777 then exit;
  While not dmCalculos.qryConsultaPosExtraDet.Eof Do
  begin
    if frmProcVentaRapida.rxVenta.RecordCount = dmCalculos.qryConsultaPosExtraDet.RecordCount then
    break;
    frmProcVentaRapida.rxVenta.Append;
    frmProcVentaRapida.rxVentaSerie.Value := dmcalculos.qryConsultaPosExtraDetSerie.Value;
    frmProcVentaRapida.rxVentaStatus.Value:= 'A';
    GlbNumVtaPOS := dmcalculos.qryConsultaPosExtraDetNUMERO.Value;
    frmProcVentaRapida.rxVentaNumeroCotiza.Value:=  dmCalculos.qryConsultaPosExtraDetNUMERO_COTIZA.Value;
    frmProcVentaRapida.rxVentaFecha.Value := dmcalculos.qryConsultaPosExtraDetFECHA.Value;

    frmProcVentaRapida.rxVentaTipoVenta.Value:= 0;//dmcalculos.qryConsultaPosExtraDetD_TIPO_VENTA.Value;
    frmProcVentaRapida.rxVentaMoneda.Value := dmcalculos.qryConsultaPosExtraDetD_MONEDA.Value;

    if not frmProcVentaRapida.qryInventario.Locate('CODIGO', dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value,[]) then
    frmProcVentaRapida.rxVentaDescripcion.Value:= '????????'
    else
    frmProcVentaRapida.rxVentaDescripcion.Value:=frmProcVentaRapida.qryInventarioDESCRIPCION.Value;
    frmProcVentaRapida.rxVentaCodArticulo.Value:= dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value;
    frmProcVentaRapida.rxVentaCodTexto.Value :=dmcalculos.qryConsultaPosExtraDetCODTEXTO.Value;
    frmProcVentaRapida.rxVentaCant.Value  := dmcalculos.qryConsultaPosExtraDetD_CANT.Value;
    frmProcVentaRapida.rxVentaPrecio.Value:= dmcalculos.qryConsultaPosExtraDetD_PRECIO.Value;

    if dmcalculos.qryConsultaPosExtraDetD_TRANSPITBIS.Value = 1 then
    frmProcVentaRapida.rxVentaporc_desc.Value:=
    dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value / (1 + dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value/100)
    else
    frmProcVentaRapida.rxVentaporc_desc.Value:= dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value;
    frmProcVentaRapida.rxVentaItbi.Value  :=
    (frmProcVentaRapida.rxVentaCant.Value * frmProcVentaRapida.rxVentaPrecio.Value) *
    (frmProcVentaRapida.rxVentaporc_desc.Value /100);
    frmProcVentaRapida.rxVentaPorcDescItem.Value:=dmcalculos.qryConsultaPosExtraDetD_PORCDESCITEM.Value;
    frmProcVentaRapida.rxVentaTipoUnidad.Value:= dmcalculos.qryConsultaPosExtraDetD_TIPO_UNIDAD.Value;

    frmProcVentaRapida.rxVentaDC_ITBIS_CLD.Value := dmcalculos.qryConsultaPosExtraDetDC_ITBIS_CLD.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_GLB.Value := dmcalculos.qryConsultaPosExtraDetTC_MONTOITBISRECARGO_GLB.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_ITM.Value := dmcalculos.qryConsultaPosExtraDetTC_MONTOITBISRECARGO_ITM.Value;

    if dmInventario.qryTipoUnidad.State = dsInactive then dmInventario.qryTipoUnidad.Open;
    
    if dmInventario.qryTipoUnidad.Locate('IDUNIDAD',dmcalculos.qryConsultaPosExtraDetD_TIPO_UNIDAD.Value ,[]) then
    frmProcVentaRapida.cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value
    else frmProcVentaRapida.cboxTipoUnidad.Text:='UNIDAD';

    frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value);
    frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);

    if frmProcVentaRapida.qryProductos.State = dsInactive then
    frmProcVentaRapida.qryProductos.Open;

    if frmProcVentaRapida.qryProductos.Locate('CODIGO',frmProcVentaRapida.rxVentaCodArticulo.Value,[]) then
    begin
      frmProcVentaRapida.rxVentaCodTexto.Value   := frmProcVentaRapida.qryProductosCODIGO_TEXTO.Value;
      frmProcVentaRapida.rxVentaDescripcionEspecial.Value := frmProcVentaRapida.qryProductosDESCRIPCIONADICIONAL.Value;
      frmProcVentaRapida.rxVentaCostoProducto.Value       := frmProcVentaRapida.qryProductosPRECIO_COMPRA.Value;
      frmProcVentaRapida.rxVentaInvetariar.Value := frmProcVentaRapida.qryProductosINVENTARIAR.Value;
    end;

    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;

    FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), frmProcVentaRapida.rxVentaCodArticulo.Value);
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := GlbIDTasa;

    if (GlbIgI = 1) and (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO')
    and (GlbCalcItbis = 0) then
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := 1;

    dmCalculos.EsProcCalc:=True;

    frmLogError.Marca:=11; frmLogError.CurrenLN:=384; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Antes dmCalculos.ProcesaCalculos;','UFormPosExtraDET');
    dmCalculos.ProcesaCalculos;
    frmLogError.Marca:=22; frmLogError.CurrenLN:=384; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Despues dmCalculos.ProcesaCalculos;','UFormPosExtraDET');

     frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'Antes frmProcVentaRapida.rxVenta.Post;',
    'UFormPosExtraDET');

    if frmProcVentaRapida.rxVenta.State in [dsEdit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;

    frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    'Despues frmProcVentaRapida.rxVenta.Post;',
    'UFormPosExtraDet');
    frmProcVentaRapida.ProgressBar1.StepIt;
    Application.ProcessMessages;
    dmCalculos.EsProcCalc:=False;
    dmCalculos.qryConsultaPosExtraDet.Next;//dmCalculos.qryConsultaPosExtraDetserie.value
    frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,'','UFormPosExtraDet');
  end;
end;

procedure TfrmPosExtraDet.ProcInsertarOferta(serie: integer;cant:real;codp:integer);
begin
  //While not dmCalculos.qryConsultaPosExtraDet.Eof Do
  //begin
  if not dmCalculos.qryConsultaPosExtraDet.Locate('serie',serie,[]) then exit;

    frmProcVentaRapida.rxVenta.Append;
    frmProcVentaRapida.rxVentaSerie.Value := serie + 1;
    frmProcVentaRapida.rxVentaStatus.Value:= 'A';
    GlbNumVtaPOS := dmcalculos.qryConsultaPosExtraDetNUMERO.Value;
    frmProcVentaRapida.rxVentaNumeroCotiza.Value:=  dmCalculos.qryConsultaPosExtraDetNUMERO_COTIZA.Value;
    frmProcVentaRapida.rxVentaFecha.Value := dmcalculos.qryConsultaPosExtraDetFECHA.Value;

    frmProcVentaRapida.rxVentaTipoVenta.Value:= 0;//dmcalculos.qryConsultaPosExtraDetD_TIPO_VENTA.Value;
    frmProcVentaRapida.rxVentaMoneda.Value := dmcalculos.qryConsultaPosExtraDetD_MONEDA.Value;

    if not frmProcVentaRapida.qryInventario.Locate('CODIGO', codp,[]) then
    frmProcVentaRapida.rxVentaDescripcion.Value:= '????????'
    else
    begin
      frmProcVentaRapida.rxVentaDescripcion.Value:=frmProcVentaRapida.qryInventarioDESCRIPCION.Value;
      frmProcVentaRapida.rxVentaCodArticulo.Value:= dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value;
      frmProcVentaRapida.rxVentaCodTexto.Value :=frmProcVentaRapida.qryInventarioCODIGO_TEXTO.Value;
    end;
    frmProcVentaRapida.rxVentaCant.Value  := cant;
    frmProcVentaRapida.rxVentaPrecio.Value:= 0;//oferta -promociones

    if dmcalculos.qryConsultaPosExtraDetD_TRANSPITBIS.Value = 1 then
    frmProcVentaRapida.rxVentaporc_desc.Value:=
    dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value / (1 + dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value/100)
    else
    frmProcVentaRapida.rxVentaporc_desc.Value:= dmcalculos.qryConsultaPosExtraDetD_TASA_ITBIS.Value;
    frmProcVentaRapida.rxVentaItbi.Value  :=
    (frmProcVentaRapida.rxVentaCant.Value * frmProcVentaRapida.rxVentaPrecio.Value) *
    (frmProcVentaRapida.rxVentaporc_desc.Value /100);
    frmProcVentaRapida.rxVentaPorcDescItem.Value:=dmcalculos.qryConsultaPosExtraDetD_PORCDESCITEM.Value;
    frmProcVentaRapida.rxVentaTipoUnidad.Value:= dmcalculos.qryConsultaPosExtraDetD_TIPO_UNIDAD.Value;

    frmProcVentaRapida.rxVentaDC_ITBIS_CLD.Value := dmcalculos.qryConsultaPosExtraDetDC_ITBIS_CLD.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_GLB.Value := dmcalculos.qryConsultaPosExtraDetTC_MONTOITBISRECARGO_GLB.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_ITM.Value := dmcalculos.qryConsultaPosExtraDetTC_MONTOITBISRECARGO_ITM.Value;

    if dmInventario.qryTipoUnidad.State = dsInactive then dmInventario.qryTipoUnidad.Open;
    
    if dmInventario.qryTipoUnidad.Locate('IDUNIDAD',dmcalculos.qryConsultaPosExtraDetD_TIPO_UNIDAD.Value ,[]) then
    frmProcVentaRapida.cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value
    else frmProcVentaRapida.cboxTipoUnidad.Text:='UNIDAD';

    frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(dmcalculos.qryConsultaPosExtraDetD_CODIGO_PROD.Value);
    frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);

    if frmProcVentaRapida.qryProductos.State = dsInactive then
    frmProcVentaRapida.qryProductos.Open;

    if frmProcVentaRapida.qryProductos.Locate('CODIGO',frmProcVentaRapida.rxVentaCodArticulo.Value,[]) then
    begin
      frmProcVentaRapida.rxVentaCodTexto.Value   := frmProcVentaRapida.qryProductosCODIGO_TEXTO.Value;
      frmProcVentaRapida.rxVentaDescripcionEspecial.Value := 'PROMO';
      frmProcVentaRapida.rxVentaCostoProducto.Value       := frmProcVentaRapida.qryProductosPRECIO_COMPRA.Value;
      frmProcVentaRapida.rxVentaInvetariar.Value := frmProcVentaRapida.qryProductosINVENTARIAR.Value;
    end;

    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;

    FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), frmProcVentaRapida.rxVentaCodArticulo.Value);
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := GlbIDTasa;

    if (GlbIgI = 1) and (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO')
    and (GlbCalcItbis = 0) then
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := 1;

    dmCalculos.EsProcCalc:=True;

    frmLogError.Marca:=11; frmLogError.CurrenLN:=384;
    //frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Antes dmCalculos.ProcesaCalculos;','UFormPosExtraDET');
    dmCalculos.ProcesaCalculos;
    frmLogError.Marca:=22; frmLogError.CurrenLN:=384;
    //frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Despues dmCalculos.ProcesaCalculos;','UFormPosExtraDET');

    //frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    //'Antes frmProcVentaRapida.rxVenta.Post;',
    //'UFormPosExtraDET');

    if frmProcVentaRapida.rxVenta.State in [dsEdit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;

    //frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,
    //'Despues frmProcVentaRapida.rxVenta.Post;',
    //'UFormPosExtraDet');
    frmProcVentaRapida.ProgressBar1.StepIt;
    Application.ProcessMessages;
    dmCalculos.EsProcCalc:=True;

    //frmLogError.LogSteps(GlbNumVtaPOS,serierxVenta,now,now,'','UFormPosExtraDet');
  //end;
end;

//Terminar esto en usa cotiza
procedure TfrmPosExtraDet.ProcPosExtraCotiza(numcoti: Integer);
begin
  dmCalculos.qryDatosCotiPosExtra.Close;
  dmCalculos.qryDatosCotiPosExtra.Params[0].Value := -1;
  dmCalculos.qryDatosCotiPosExtra.Params[1].Value := VarUsuarioGlb;
  dmCalculos.qryDatosCotiPosExtra.Params[2].Value := numcoti;
  try
  dmCalculos.qryDatosCotiPosExtra.Open;
  except
  dmCalculos.qryDatosCotiPosExtra.Close;
  dmCalculos.qryDatosCotiPosExtra.Params[0].Value := -1;
  dmCalculos.qryDatosCotiPosExtra.Params[1].Value := VarUsuarioGlb;
  dmCalculos.qryDatosCotiPosExtra.Params[2].Value := numcoti;
  dmCalculos.qryDatosCotiPosExtra.SQL.Text:= 'SELECT * from proc_posConsExtraDet(:numerostr, :coduser,:numcotiza)';
  if not dmCalculos.qryDatosCotiPosExtra.Prepared then
  dmCalculos.qryDatosCotiPosExtra.Prepare;
  dmCalculos.qryDatosCotiPosExtra.Open;
  end;
  
  dmCalculos.qryDatosCotiPosExtra.First;//dmCalculos.qryDatosCotiPosExtra.sql.text
  While not dmCalculos.qryDatosCotiPosExtra.Eof Do
  begin
    if frmProcVentaRapida.rxVenta.RecordCount = dmCalculos.qryDatosCotiPosExtra.RecordCount then
    break;
    frmProcVentaRapida.rxVenta.Append;
    GlbCalculado:=False;
    frmProcVentaRapida.rxVentaSerie.Value := dmcalculos.qryDatosCotiPosExtraSERIE.Value;
    frmProcVentaRapida.rxVentaStatus.Value:= 'A';
    GlbNumVtaPOS := dmcalculos.qryDatosCotiPosExtraNUMERO.Value;
    frmProcVentaRapida.rxVentaNumeroCotiza.Value:=  dmCalculos.qryDatosCotiPosExtraNUMERO_COTIZA.Value;
    frmProcVentaRapida.rxVentaFecha.Value := dmcalculos.qryDatosCotiPosExtraFECHA.Value;

    frmProcVentaRapida.rxVentaTipoVenta.Value:= 0;
    frmProcVentaRapida.rxVentaMoneda.Value := dmcalculos.qryDatosCotiPosExtraD_MONEDA.Value;
    if frmProcVentaRapida.qryInventario.State = dsInactive then
    frmProcVentaRapida.qryInventario.Open;

    if not frmProcVentaRapida.qryInventario.Locate('CODIGO', dmcalculos.qryDatosCotiPosExtraD_CODIGO_PROD.Value,[]) then
    frmProcVentaRapida.rxVentaDescripcion.Value:= '????????'
    else
    frmProcVentaRapida.rxVentaDescripcion.Value:=frmProcVentaRapida.qryInventarioDESCRIPCION.Value;
    frmProcVentaRapida.rxVentaCodArticulo.Value:= dmcalculos.qryDatosCotiPosExtraD_CODIGO_PROD.Value;
    frmProcVentaRapida.rxVentaCodTexto.Value :=dmcalculos.qryDatosCotiPosExtraCODTEXTO.Value;
    frmProcVentaRapida.rxVentaCant.Value  := dmcalculos.qryDatosCotiPosExtraD_CANT.Value;
    frmProcVentaRapida.rxVentaPrecio.Value:= dmcalculos.qryDatosCotiPosExtraD_PRECIO.Value;

    if dmcalculos.qryDatosCotiPosExtraD_TRANSPITBIS.Value = 1 then
    frmProcVentaRapida.rxVentaporc_desc.Value:=
    dmcalculos.qryDatosCotiPosExtraD_TASA_ITBIS.Value / (1 + dmcalculos.qryDatosCotiPosExtraD_TASA_ITBIS.Value/100)
    else
    frmProcVentaRapida.rxVentaporc_desc.Value:= dmcalculos.qryDatosCotiPosExtraD_TASA_ITBIS.Value;
    frmProcVentaRapida.rxVentaItbi.Value  :=
    (frmProcVentaRapida.rxVentaCant.Value * frmProcVentaRapida.rxVentaPrecio.Value) *
    (frmProcVentaRapida.rxVentaporc_desc.Value /100);
    frmProcVentaRapida.rxVentaPorcDescItem.Value:=dmcalculos.qryDatosCotiPosExtraD_PORCDESCITEM.Value;
    frmProcVentaRapida.rxVentaTipoUnidad.Value:= dmcalculos.qryDatosCotiPosExtraD_TIPO_UNIDAD.Value;

    frmProcVentaRapida.rxVentaDC_ITBIS_CLD.Value := dmcalculos.qryDatosCotiPosExtraDC_ITBIS_CLD.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_GLB.Value := dmcalculos.qryDatosCotiPosExtraTC_MONTOITBISRECARGO_GLB.Value;
    frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_ITM.Value := dmcalculos.qryDatosCotiPosExtraTC_MONTOITBISRECARGO_ITM.Value;

    if dmInventario.qryTipoUnidad.State = dsInactive then dmInventario.qryTipoUnidad.Open;
    
    if dmInventario.qryTipoUnidad.Locate('IDUNIDAD',dmcalculos.qryDatosCotiPosExtraD_TIPO_UNIDAD.Value ,[]) then
    frmProcVentaRapida.cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value
    else frmProcVentaRapida.cboxTipoUnidad.Text:='UNIDAD';

    frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(dmcalculos.qryDatosCotiPosExtraD_CODIGO_PROD.Value);
    frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);

    if frmProcVentaRapida.qryProductos.State = dsInactive then
    frmProcVentaRapida.qryProductos.Open;

    if frmProcVentaRapida.qryProductos.Locate('CODIGO',frmProcVentaRapida.rxVentaCodArticulo.Value,[]) then
    begin
      frmProcVentaRapida.rxVentaCodTexto.Value   := frmProcVentaRapida.qryProductosCODIGO_TEXTO.Value;
      frmProcVentaRapida.rxVentaDescripcionEspecial.Value := frmProcVentaRapida.qryProductosDESCRIPCIONADICIONAL.Value;
      frmProcVentaRapida.rxVentaCostoProducto.Value       := frmProcVentaRapida.qryProductosPRECIO_COMPRA.Value;
      frmProcVentaRapida.rxVentaInvetariar.Value := frmProcVentaRapida.qryProductosINVENTARIAR.Value;
    end;

    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;

    FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), frmProcVentaRapida.rxVentaCodArticulo.Value);
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := GlbIDTasa;

    if (GlbIgI = 1) and (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO')
    and (GlbCalcItbis = 0) then
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := 1;

    dmCalculos.EsProcCalc:=True;
    frmLogError.Marca:=11; frmLogError.CurrenLN:=478; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Antes dmCalculos.ProcesaCalculos;','UFormPosExtraDET');
    dmCalculos.ProcesaCalculos;
    frmLogError.Marca:=22; frmLogError.CurrenLN:=478; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Despues dmCalculos.ProcesaCalculos;','UFormPosExtraDET');
  
    frmProcVentaRapida.rxVentaDescripcionEspecial.Value:= dmcalculos.qryDatosCotiPosExtraDESCRIPCION_ESPECIAL.Value;
    //ver si el total se actualiza
    GlbCalculado:=False;
    dmCalculos.ProcesaCalculos();

    if frmProcVentaRapida.rxVenta.State in [dsEdit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;
    frmProcVentaRapida.ProgressBar1.StepIt;
    Application.ProcessMessages;
    dmCalculos.EsProcCalc:=False;
    dmCalculos.qryDatosCotiPosExtra.Next;//dmCalculos.qryConsultaPosExtraDetserie.value
  end;
  dmCalculos.qryDatosCotiPosExtra.Close;
  dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
end;

procedure TfrmPosExtraDet.ProcPosExtraRecuperaVenta(num: Integer);
begin
  if dmCalculos.qryDatosCotiPosExtra.State = dsInactive then exit;
  dmCalculos.qryDatosCotiPosExtra.First;
  While not dmCalculos.qryDatosCotiPosExtra.Eof Do
  begin
    if (GlbNumVtaPOS <> dmcalculos.qryDatosCotiPosExtraNUMERO.Value) then
    begin
      dmCalculos.qryDatosCotiPosExtra.Next;
      Continue;
    end;
    if frmProcVentaRapida.rxVenta.RecordCount = dmCalculos.qryDatosCotiPosExtra.RecordCount then
    Break;
    frmProcVentaRapida.rxVenta.Append;
    frmProcVentaRapida.rxVentaSerie.Value := dmcalculos.qryDatosCotiPosExtraSERIE.Value;
    frmProcVentaRapida.rxVentaStatus.Value:= 'A';

    //frmProcVentaRapida.rxVentaNumeroCotiza.Value:=  dmCalculos.qryDatosCotiPosExtraNUMERO_COTIZA.Value;
    frmProcVentaRapida.rxVentaFecha.Value := dmcalculos.qryDatosCotiPosExtraFECHA.Value;

    frmProcVentaRapida.rxVentaTipoVenta.Value:= 0;
    frmProcVentaRapida.rxVentaMoneda.Value := dmcalculos.qryDatosCotiPosExtraD_MONEDA.Value;
    if frmProcVentaRapida.qryInventario.State = dsInactive then
    frmProcVentaRapida.qryInventario.Open;
    if not frmProcVentaRapida.qryInventario.Locate('CODIGO', dmcalculos.qryDatosCotiPosExtraD_CODIGO_PROD.Value,[]) then
    frmProcVentaRapida.rxVentaDescripcion.Value:= '????????'
    else
    frmProcVentaRapida.rxVentaDescripcion.Value:=frmProcVentaRapida.qryInventarioDESCRIPCION.Value;
    frmProcVentaRapida.rxVentaCodArticulo.Value:= dmcalculos.qryDatosCotiPosExtraD_CODIGO_PROD.Value;
    frmProcVentaRapida.rxVentaCodTexto.Value :=dmcalculos.qryDatosCotiPosExtraCODTEXTO.Value;
    frmProcVentaRapida.rxVentaCant.Value  := dmcalculos.qryDatosCotiPosExtraD_CANT.Value;
    frmProcVentaRapida.rxVentaPrecio.Value:= dmcalculos.qryDatosCotiPosExtraD_PRECIO.Value;
    //frmProcVentaRapida.rxVentaPrecio.Value:= frmProcVentaRapida.qryInventarioPRECIO.Value;
    frmProcVentaRapida.rxVentaMontoBruto.Value:=
    frmProcVentaRapida.rxVentaCant.Value *
    frmProcVentaRapida.rxVentaPrecio.Value;
    if not frmProcVentaRapida.rxVentaMoneda.IsNull then
    begin
      if (frmProcVentaRapida.rxVentaMonedaBase.Value <> frmProcVentaRapida.rxVentaMoneda.Value) then
      if (not frmProcVentaRapida.rxVentaMonedaBase.IsNull and (frmProcVentaRapida.rxVentaMonedaBase.Value <> '')) then
      begin
        frmProcVentaRapida.rxVentamonto_tasa.Value:= GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);
        frmProcVentaRapida.rxVentaMontoBruto.Value:=
        frmProcVentaRapida.rxVentaMontoBruto.Value * frmProcVentaRapida.rxVentamonto_tasa.Value;

        GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);
        frmProcVentaRapida.lblTasa.Visible:=True;
      end;
    end;

    if dmcalculos.qryDatosCotiPosExtraD_TRANSPITBIS.Value = 1 then
    frmProcVentaRapida.rxVentaporc_desc.Value:=
    dmcalculos.qryDatosCotiPosExtraD_TASA_ITBIS.Value / (1 + dmcalculos.qryDatosCotiPosExtraD_TASA_ITBIS.Value/100)
    else
    frmProcVentaRapida.rxVentaporc_desc.Value:= dmcalculos.qryDatosCotiPosExtraD_TASA_ITBIS.Value;

    frmProcVentaRapida.rxVentaItbi.Value  :=
    (frmProcVentaRapida.rxVentaCant.Value * frmProcVentaRapida.rxVentaPrecio.Value) *
    (frmProcVentaRapida.rxVentaporc_desc.Value /100);
    frmProcVentaRapida.rxVentaPorcDescItem.Value:=dmcalculos.qryDatosCotiPosExtraD_PORCDESCITEM.Value;
    frmProcVentaRapida.rxVentaTipoUnidad.Value:= dmcalculos.qryDatosCotiPosExtraD_TIPO_UNIDAD.Value;

    frmProcVentaRapida.rxVentaDC_ITBIS_CLD.Value := dmcalculos.qryDatosCotiPosExtraDC_ITBIS_CLD.Value;
    //frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_GLB.Value := //dmcalculos.qryDatosCotiPos TC_MONTOITBISRECARGO_GLB.Value;
    //frmProcVentaRapida.rxVentaTC_MONTOITBISRECARGO_ITM.Value := dmcalculos.qryDatosCotiPosC_MONTOITBISRECARGO_ITM.Value;

    if dmInventario.qryTipoUnidad.State = dsInactive then dmInventario.qryTipoUnidad.Open;
    
    if dmInventario.qryTipoUnidad.Locate('IDUNIDAD',dmcalculos.qryDatosCotiPosExtraD_TIPO_UNIDAD.Value ,[]) then
    frmProcVentaRapida.cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value
    else frmProcVentaRapida.cboxTipoUnidad.Text:='UNIDAD';

    frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(dmcalculos.qryDatosCotiPosExtraD_CODIGO_PROD.Value);
    frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);

    if frmProcVentaRapida.qryProductos.State = dsInactive then
    frmProcVentaRapida.qryProductos.Open;

    if frmProcVentaRapida.qryProductos.Locate('CODIGO',frmProcVentaRapida.rxVentaCodArticulo.Value,[]) then
    begin
      frmProcVentaRapida.rxVentaCodTexto.Value   := frmProcVentaRapida.qryProductosCODIGO_TEXTO.Value;
      frmProcVentaRapida.rxVentaDescripcionEspecial.Value := frmProcVentaRapida.qryProductosDESCRIPCIONADICIONAL.Value;
      frmProcVentaRapida.rxVentaCostoProducto.Value       := frmProcVentaRapida.qryProductosPRECIO_COMPRA.Value;
      frmProcVentaRapida.rxVentaInvetariar.Value := frmProcVentaRapida.qryProductosINVENTARIAR.Value;
    end;

    frmProcVentaRapida.rxVentaCodUsuario.Value := VarUsuarioGlb;

    FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), frmProcVentaRapida.rxVentaCodArticulo.Value);
    frmProcVentaRapida.rxVentaIDTasaITBIS.Value := GlbIDTasa;
  if (GlbIgI = 1) and (UpperCase(GLBFormatoFactura) = 'FORMAFACOCO')
  and (GlbCalcItbis = 0) then
  frmProcVentaRapida.rxVentaIDTasaITBIS.Value := 1;
    dmCalculos.EsProcCalc:=True;
    frmLogError.Marca:=11; frmLogError.CurrenLN:=478; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Antes dmCalculos.ProcesaCalculos;','UFormPosExtraDET');
    dmCalculos.ProcesaCalculos;
    frmLogError.Marca:=22; frmLogError.CurrenLN:=478; frmLogError.LogSteps(GlbNumVtaPOS,0,now,now,'Despues dmCalculos.ProcesaCalculos;','UFormPosExtraDET');


    frmProcVentaRapida.rxVentaDescripcionEspecial.Value:= dmcalculos.qryDatosCotiPosExtraDESCRIPCION_ESPECIAL.Value;
    //ver si el total se actualiza
    //temporal, verificar si no se actualizan los valores
    //dmCalculos.ProcesaCalculos();

    if frmProcVentaRapida.rxVenta.State in [dsEdit, dsInsert] then
    frmProcVentaRapida.rxVenta.Post;
    frmProcVentaRapida.ProgressBar1.StepIt;
    Application.ProcessMessages;
    dmCalculos.EsProcCalc:=False;
    dmCalculos.qryDatosCotiPosExtra.Next;//dmCalculos.qryConsultaPosExtraDetserie.value
  end;
  dmCalculos.qryDatosCotiPosExtra.close;
  if dmCalculos.datCambio then
  dmCalculos.Pos_UpdateTotales(GlbNumVtaPOS);
end;

procedure TfrmPosExtraDet.BitBtn1Click(Sender: TObject);
begin
  if frmProcVentaRapida.rxVenta.RecordCount = 0 then
  begin
    if MessageDlg('Procesar records como venta?',mtInformation,[mbyes,mbno],0) = mrYes then
    begin
      GlbNumVtaPOS := dmCalculos.qryPosExtraDetNumero.Value;
      frmPosExtraDet.ProcPosExtraRecuperaVenta(dmCalculos.qryPosExtraDetNumero.Value);
    end;
  end else
  MessageDlg('Impsible realizar operacion con venta en curso, verifique.',mtWarning,[mbok],0);
end;

procedure TfrmPosExtraDet.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    dmCalculos.qryDatosCotiPosExtra.Close;
    dmCalculos.qryDatosCotiPosExtra.params[0].Value:=-777;
    dmCalculos.qryDatosCotiPosExtra.params[1].Value:=0;
    dmCalculos.qryDatosCotiPosExtra.params[2].Value:=0;
    dmCalculos.qryDatosCotiPosExtra.Open;//dmCalculos.qryDatosCotiPosExtra.recordcount
    dmCalculos.qryPosExtraDet.Close;
    dmCalculos.qryPosExtraDet.params[0].Value := dmCalculos.qryDatosCotiPosExtraNumero.value;
    dmCalculos.qryPosExtraDet.Open;
    RxDBGrid2.Visible := True; 
    RxDBGrid1.Height:=201;
    RxDBGrid1.Top:= 264
  end else
  begin
    RxDBGrid2.Visible := False;
    RxDBGrid1.Height:=417;
    RxDBGrid1.Top:= 48
  end;
end;

procedure TfrmPosExtraDet.RxDBGrid2CellClick(Column: TColumn);
begin
 dmCalculos.qryDatosCotiPosExtra.Close;
 dmCalculos.qryDatosCotiPosExtra.params[0].Value:=dmCalculos.qryConsultaPosExtraDetNUMERO.Value;
 dmCalculos.qryDatosCotiPosExtra.params[1].Value:=0;
 dmCalculos.qryDatosCotiPosExtra.params[2].Value:=0;
 dmCalculos.qryDatosCotiPosExtra.Open;
 dmCalculos.qryPosExtraDet.Close;
 dmCalculos.qryPosExtraDet.params[0].Value := dmCalculos.qryDatosCotiPosExtraNumero.value;
 dmCalculos.qryPosExtraDet.Open;
end;

procedure TfrmPosExtraDet.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Eliminar record para número transacción :'+
  dmCalculos.qryPosExtraDetNUMERO.AsSTring+ '?',mtError,[mbyes,mbno],0)=mrYes then
  begin
    dmcalculos.ProcDeletePosExtraDet(dmCalculos.qryPosExtraDetNUMERO.Value);
    CheckBox1Click(Self);
  end;
end;

procedure TfrmPosExtraDet.Button4Click(Sender: TObject);
begin
  dmCalculos.qryPosExtraSum.close;
  dmCalculos.qryPosExtraSum.Open;
  dmCalculos.qryGetSumVtaExtra.Close;
  dmCalculos.qryGetSumVtaExtra.Params[0].Value := GlbNumVtaPOS;
  dmCalculos.qryGetSumVtaExtra.Open;
  if not dmCalculos.qryGetSumVtaExtra.Transaction.InTransaction then
  dmCalculos.qryGetSumVtaExtra.Transaction.StartTransaction;
  try
    dmCalculos.qryGetSumVtaExtra.Transaction.CommitRetaining;
  except
  dmCalculos.qryGetSumVtaExtra.Transaction.Rollback;
  end;  
end;

end.
