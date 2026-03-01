unit UFormCalcPrecioCuadros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, RxLookup, Grids, DBGrids, RxDBCtrl,
  DB, Buttons, RxCtrls, WinSkinData, ExtCtrls, IBCustomDataSet, IBQuery,
  RxDBComb, ComCtrls, GetAnyDate, RxToolEdit, IBStoredProc, RxMemDS;

type
  TfrmCalcPrecioArticulo = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    RxSpeedButton1: TRxSpeedButton;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    ComboBox1: TComboBox;
    RxDBGrid2: TRxDBGrid;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn35: TBitBtn;
    Label14: TLabel;
    edtCodCanuela: TEdit;
    Label15: TLabel;
    Shape1: TShape;
    edtPastatu: TEdit;
    Label16: TLabel;
    DBStatusLabel4: TDBStatusLabel;
    qryMateriales: TIBQuery;
    qryMaterialesCODIGO_PROD: TIntegerField;
    qryMaterialesLARGO: TFloatField;
    qryMaterialesANCHO: TFloatField;
    qryMaterialesDESC_UNIDAD: TIBStringField;
    qryMaterialesDESCRIPCION: TIBStringField;
    qryMaterialesPRECIO: TFloatField;
    dsqryMateriales: TDataSource;
    Label13: TLabel;
    Shape2: TShape;
    RxDBComboBox1: TRxDBComboBox;
    Label3: TLabel;
    qryCliente: TIBQuery;
    qryClienteCODIGO_CTE: TIntegerField;
    qryClienteNOMBRECLIENTE: TIBStringField;
    qryClientePORC_BENEFICIO: TFloatField;
    qryClienteUSARLEVELPRECIO: TSmallintField;
    Label4: TLabel;
    DSqryCliente: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn12: TBitBtn;
    chkCotizacion: TCheckBox;
    qryInvTodos: TIBQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    FloatField3: TFloatField;
    qryInvTodosCODIGO_BARRA: TIBStringField;
    qryInvTodosCODIGO: TIntegerField;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    RxDBGrid4: TRxDBGrid;
    qryCteLookup: TIBQuery;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn17: TBitBtn;
    dsqryCteLookup: TDataSource;
    BitBtn4: TBitBtn;
    GetAnyDate1: TGetAnyDate;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    Label17: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    DBText1: TDBText;
    Label20: TLabel;
    Label21: TLabel;
    Shape3: TShape;
    edtCodCanuela2: TEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label22: TLabel;
    Label23: TLabel;
    DBCheckBox1: TDBCheckBox;
    btnFacturar: TButton;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label24: TLabel;
    DBEdit7: TDBEdit;
    Label25: TLabel;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    Label26: TLabel;
    ibStpActualizaInvProd: TIBStoredProc;
    BitBtn7: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    qryMaterialesCODIGO_BARRA: TIBStringField;
    SpeedButton3: TSpeedButton;
    DBCheckBox2: TDBCheckBox;
    Panel1: TPanel;
    RxDBGrid3: TRxDBGrid;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    qryMaterialesDESPERDICIO: TFloatField;
    SpeedButton4: TSpeedButton;
    DBCheckBox3: TDBCheckBox;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    DBCheckBox4: TDBCheckBox;
    QryPrecios: TIBQuery;
    QryPreciosCODIGO: TIntegerField;
    QryPreciosPRECIOVENTA1: TFloatField;
    QryPreciosPRECIOVENTA2: TFloatField;
    QryPreciosPRECIOVENTA3: TFloatField;
    QryPreciosPRECIOVENTA4: TFloatField;
    qryLevelPrecioCte: TIBQuery;
    qryLevelPrecioCteCODIGO_CTE: TIntegerField;
    qryLevelPrecioCteUSARLEVELPRECIO: TSmallintField;
    BitBtn15: TBitBtn;
    edtCodMatAdc: TEdit;
    Label29: TLabel;
    BitBtn16: TBitBtn;
    TabSheet3: TTabSheet;
    RxDBGrid5: TRxDBGrid;
    Label30: TLabel;
    DBText2: TDBText;
    DBEdit14: TDBEdit;
    CheckBox1: TCheckBox;
    rxServFct: TRxMemoryData;
    rxServFctNumeroMast: TIntegerField;
    Label31: TLabel;
    DBText3: TDBText;
    Label32: TLabel;
    DBText4: TDBText;
    chkBoxPLevel: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure edtCodCanuelaExit(Sender: TObject);
    procedure edtPastatuExit(Sender: TObject);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure RxDBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure edtCodCanuela2Exit(Sender: TObject);
    procedure edtCodCanuelaEnter(Sender: TObject);
    procedure edtCodCanuela2Enter(Sender: TObject);
    procedure edtPastatuEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFacturarClick(Sender: TObject);
    procedure RxDBGrid4GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure RxDBGrid3Enter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBCheckBox3Click(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure edtCodMatAdcChange(Sender: TObject);
    procedure edtCodMatAdcExit(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
  private
    { Private declarations }
    procedure ProcBuscarCliente;
    procedure ProcCrearFacturas;
    procedure UseFormVentas;
    procedure ProcActualizaInv(cantMaterial: currency; codProd: integer);

    Function GetPrecioNivel(codProd:Integer; t : smallint):Currency;
    Function GetNivelPrecio(codcte: integer):smallint;
    procedure ProcRefrescar;
  public
    { Public declarations }
    xcodCte : integer;
    //_numFactura : integer;
    procedure ProcAbridDatos(fecha:TDateTime; _st : string);
  end;

var
  frmCalcPrecioArticulo: TfrmCalcPrecioArticulo;
  edtCodProd : integer;
  EsCanuela : smallint;
  EsPastatu : smallint;
  _Inserta,ProcC : boolean;
  numCanuela : smallint;
  guardarRec : TBookMark;
  porcientoItbi : Real;
  Serie_Asignadoncf : Integer;
  _ShowImpFact  :Boolean;
  FechaIniFct, FechaFinFct : TDateTime;
  areaX : smallint;
  _EsGregarNuevo : boolean;
implementation

uses UDatModPanaderia, UDatModInventario, UGlobal,
  UDatModConectar, UBuscarClientesPersonasP, UInventarioProd,
  UMaestroClientes, UDatModClientes, UDatosVentas, UDatModUsuarios,
  UConsultaInventario, UQckCotizacionOrdenTrab, UDatModCompania,
  URegFpago,UDatModCxc, UDatModFactura, UProcVentaRapida, UProcesarIngresoCxc,
  UFormPrepago;

{$R *.dfm}

procedure TfrmCalcPrecioArticulo.FormCreate(Sender: TObject);
begin
  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  qryCteLookup.Close;
  qryCteLookup.Open;
  qryInvTodos.Close;
  qryInvTodos.Open;
  _Inserta:=False;
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);

  dmPanaderia.qryBuscarProd.close;
  dmPanaderia.qryBuscarProd.open;
  dmInventario.qryInvLookup.Close;
  dmInventario.qryInvLookup.Open;
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);
  dmPanaderia.qryInvIngrediente.close;
  dmPanaderia.qryInvIngrediente.open;
  dmPanaderia.tblIngredienteTrabCuadros.close;

  ProcAbridDatos(ExtraerFecha(GlbFechaTrnDiaria),'A');

  dmPanaderia.qryInvLookupIngrediente.Close;
  dmPanaderia.qryInvLookupIngrediente.Open;
  dmPanaderia.qryInvLookupIngrediente.First;
  if dmPanaderia.qryInvLookupIngrediente.recordCount = 0 then
  begin
    MessageDlg('Debe configurar los ingredientes en inventario.',mtWarning,[mbok],0);
  end;
  ComboBox1.Items.clear;
  while not dmPanaderia.qryInvLookupIngrediente.Eof do
  begin
    ComboBox1.Items.Add(dmPanaderia.qryInvLookupIngredienteDESCRIPCION.Value);
    dmPanaderia.qryInvLookupIngrediente.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);

  dmPanaderia.tblIngredienteTrabCuadros.Close;

  ProcAbridDatos(ExtraerFecha(GlbFechaTrnDiaria),'A');

end;

procedure TfrmCalcPrecioArticulo.ComboBox1Change(Sender: TObject);
begin
  Label29.Visible:=False;
  if dmPanaderia.qryInvLookupIngrediente.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  begin
    Label29.Visible:=True;
    edtCodProd:= dmPanaderia.qryInvLookupIngredienteCODIGO.Value;
    Label29.Caption:=dmPanaderia.qryInvLookupIngredienteCODIGO_BARRA.Value;
  end;
end;

procedure TfrmCalcPrecioArticulo.SpeedButton1Click(Sender: TObject);
begin
  ComboBox1Change(Self);
  if (edtCodProd < 0) then Exit;

  if dmPanaderia.tblPrecioCuadrosNUMERO_MAST.IsNull then exit;
  
  if (dmPanaderia.tblIngredienteTrabCuadros.State = dsInactive) then
  dmPanaderia.tblIngredienteTrabCuadros.Open;
  if not dmPanaderia.tblIngredienteTrabCuadros.Locate('CODIGO_PROD_BASE;COD_PRODUCTO',
  vararrayof([dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value,edtCodProd]),[]) then
  begin
    dmPanaderia.tblIngredienteTrabCuadros.Append;
    dmPanaderia.tblIngredienteTrabCuadrosNUMERO.Value := dmPanaderia.tblPrecioCuadrosNUMERO.Value;
    dmPanaderia.tblIngredienteTrabCuadrosCODIGO_PROD_BASE.Value:=dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value;
    dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value:= dmPanaderia.qryInvLookupIngredienteCODIGO.Value;

    if chkBoxPLevel.Checked then
    begin
      dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value:= GetNivelPrecio(dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value);

      if dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value > 0 then
      dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value :=
      GetPrecioNivel(dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value,dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value);
    end;
    if dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value = 0 then
    //dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value := dmPanaderia.qryBuscarProdPRECIO.Value;
    dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value := dmPanaderia.qryInvLookupIngredientePRECIO.Value;

    dmPanaderia.tblIngredienteTrabCuadrosid.Value   := FsqlMaxNumero('Precio_Cuadros_det','id');
    dmPanaderia.tblIngredienteTrabCuadrosALTO.Value := 0;
    dmPanaderia.tblIngredienteTrabCuadrosCANT_MERMA.Value:= 0;
    if not dmPanaderia.qryInvLookupIngredienteANCHO.IsNull then
    begin
      dmPanaderia.tblIngredienteTrabCuadrosANCHO.Value:=dmPanaderia.qryInvLookupIngredienteANCHO.Value;
      dmPanaderia.tblIngredienteTrabCuadrosCANT_MERMA.Value:=dmPanaderia.qryInvLookupIngredienteDESPERDICIO.Value;
    end else
    dmPanaderia.tblIngredienteTrabCuadrosANCHO.Value:= 0;
    dmPanaderia.tblIngredienteTrabCuadrosESCANUELA.Value   := 0;
    dmPanaderia.tblIngredienteTrabCuadrosESPASTATU.Value   := 0;
    dmPanaderia.tblIngredienteTrabCuadrosid.Value := FsqlMaxNumero('Precio_Cuadros_det','id');
    GlbSalvarQuery(dmPanaderia.tblIngredienteTrabCuadros);
  end;
  btnModificarClick(Self);
  btnSalvarClick(Self);
  dmPanaderia.CalcularPrecio;
  {
  guardarRec := dmPanaderia.tblIngredienteTrabCuadros.GetBookmark;
  dmPanaderia.tblPrecioCuadros.Edit;
  dmPanaderia.CalcularPrecio;
  dmPanaderia.tblIngredienteTrabCuadros.close;
  dmPanaderia.tblIngredienteTrabCuadros.open;
  dmPanaderia.tblIngredienteTrabCuadros.GotoBookmark(guardarRec);
  dmPanaderia.tblIngredienteTrabCuadros.FreeBookmark(guardarRec);
  }
  edtCodProd:=-1;
end;

procedure TfrmCalcPrecioArticulo.btnInsertarClick(Sender: TObject);
begin
  //if (dmPanaderia.tblPrecioCuadrosMastSTATUS.Value = 'A') then
  //begin
  //  If MessageDlg('¿Desea cotizar otro servicio?',mtinformation,[mbyes,mbno],0) = mrno then
  //  Exit;
  //end;
  Label6.Visible :=True;
  DBEdit1.Visible:=True;
  if dmPanaderia.tblPrecioCuadrosMast.State = dsInactive then
  dmPanaderia.tblPrecioCuadrosMast.Open;

  if Not _EsGregarNuevo then
  begin
    dmPanaderia.tblPrecioCuadrosMast.Append;
    dmPanaderia.tblPrecioCuadrosMastSTATUS.Value:='A';
    dmPanaderia.tblPrecioCuadrosMastFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value:=0;
  end else
  begin
    dmPanaderia.tblPrecioCuadros.Append;
    dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value:= xcodCte;
    dmPanaderia.tblPrecioCuadrosFECHA.Value:= dmPanaderia.tblPrecioCuadrosMastFECHA.Value;
  end;
  _EsGregarNuevo:=False;

  if dmPanaderia.tblPrecioCuadrosMastNUMERO.IsNull then
  begin
    if dmPanaderia.tblPrecioCuadrosMast.State = dsBrowse then
    begin
      dmPanaderia.tblPrecioCuadrosMast.Append;
      dmPanaderia.tblPrecioCuadrosMastFecha.Value:= ExtraerFecha(GlbFechaTrnDiaria);
      dmPanaderia.tblPrecioCuadrosMastSTATUS.Value:='A';
    end;
    GlbSalvarQuery(dmPanaderia.tblPrecioCuadrosMast);
    if dmPanaderia.tblPrecioCuadros.State = dsBrowse then
    dmPanaderia.tblPrecioCuadros.Edit;
    dmPanaderia.tblPrecioCuadrosNUMERO_MAST.Value := dmPanaderia.tblPrecioCuadrosMastNUMERO.Value;

  end else
  begin
    dmPanaderia.tblPrecioCuadrosNUMERO_MAST.Value:=dmPanaderia.tblPrecioCuadrosMastNUMERO.Value;
    if dmPanaderia.tblPrecioCuadrosMast.state in [dsEdit, dsInsert] then
    dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value:=dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value;
  end;
  //dmPanaderia.tblPrecioCuadros.State
  if dmInventario.qryInvLookup.Locate('DESCRIPCION','ENMARCADO',[loCaseInsensitive]) then
  dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value  := dmInventario.qryInvLookupCODIGO.Value;
  dmPanaderia.tblPrecioCuadrosPORC_DESCUENTO.Value:= 0;
  dmPanaderia.tblPrecioCuadrosMONTODESCUENTO.Value:= 0;
  if dmPanaderia.tblPrecioCuadrosFECHA.IsNull then
  dmPanaderia.tblPrecioCuadrosFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmPanaderia.tblPrecioCuadrosCOD_USR.Value := VarUsuarioGlb;

  dmPanaderia.tblPrecioCuadrosSTATUS.Value  := 'A';
  dmPanaderia.tblPrecioCuadrosCON_CANVAS.Value := 0;
  dmPanaderia.tblPrecioCuadrosDOBLE_CANUELA.Value:=0;
  dmPanaderia.tblPrecioCuadrosDOBLEPASTATU.Value :=0;
  dmPanaderia.tblPrecioCuadrosCON_DOBLE_CRISTAL.Value:=0;
  if (xcodCte = 0) and (not chkCotizacion.Checked) then
  begin
    ProcBuscarCliente;
    dmPanaderia.tblPrecioCuadrosPORC_BENEFICIO.Value:=qryClientePORC_BENEFICIO.Value;
    dmPanaderia.tblPrecioCuadrosNIVELPRECIO.Value:= qryClienteUSARLEVELPRECIO.Value;
    dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value := xcodCte;
    //Label6.Visible:= False;
    //DBEdit1.Visible:=False;
  end else
  begin
    dmPanaderia.tblPrecioCuadrosPORC_BENEFICIO.Value:=10;
    dmPanaderia.tblPrecioCuadrosNIVELPRECIO.Value   :=1;
    if dmPanaderia.tblPrecioCuadrosCODIGO_CTE.IsNull then
    dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value    :=0;
    Label6.Visible :=True;
    DBEdit1.Visible:=True;
  end;
  edtCodCanuela.Text:= '';
  edtCodCanuela2.Text:= '';
  edtPastatu.Text:= '';
  RxDBLookupCombo2.SetFocus;
end;

procedure TfrmCalcPrecioArticulo.ProcBuscarCliente;
begin
  qryCliente.Close;
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    FrmBuscarClientesPersonas.CodigoCliente := -1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    begin
      qryCliente.Params[0].Value:= FrmBuscarClientesPersonas.CodigoCliente;
      xcodCte := qryCliente.Params[0].Value;
    end;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
  qryCliente.Open;
end;

procedure TfrmCalcPrecioArticulo.btnModificarClick(Sender: TObject);
begin
  dmPanaderia.tblPrecioCuadros.Edit;
end;

procedure TfrmCalcPrecioArticulo.btnSalvarClick(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadrosFecha.IsNull then exit;
  if dmPanaderia.tblPrecioCuadros.state in [dsInsert] then
  dmPanaderia.tblPrecioCuadrosNUMERO.Value := FsqlMaxNumero('Precio_Cuadros','Numero');

  if dmPanaderia.tblPrecioCuadros.state in [dsEdit, dsInsert] then
  begin
    if dmPanaderia.tblPrecioCuadrosALTO.IsNull or
       dmPanaderia.tblPrecioCuadrosANCHO.ISnull then
       begin
         if Showing then
         dbedit2.SetFocus;
       end;
    GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
  end;
  if dmPanaderia.tblPrecioCuadros.state in [dsInsert] then
  dmPanaderia.tblIngredienteTrabCuadrosid.Value := FsqlMaxNumero('Precio_Cuadros_det','id');

  if dmPanaderia.tblIngredienteTrabCuadros.State in [dsEdit, dsInsert] then
  begin
    if not dmPanaderia.tblIngredienteTrabCuadrosNUMERO.IsNull then
    GlbSalvarQuery(dmPanaderia.tblIngredienteTrabCuadros);
  end;
  if dmPanaderia.tblPrecioCuadrosALTO.IsNull or
     (dmPanaderia.tblPrecioCuadrosALTO.Value = 0) then
     dmPanaderia.tblPrecioCuadros.Edit;
  if  dmPanaderia.tblPrecioCuadrosANCHO.IsNull or
     (dmPanaderia.tblPrecioCuadrosANCHO.Value = 0) then
     dmPanaderia.tblPrecioCuadros.Edit;
  //if dmPanaderia.tblPrecioCuadrosMONTO_ABONADO.IsNull then
  //   begin
  //     dmPanaderia.tblPrecioCuadros.Edit;
  //     DBEdit6.Color:=clYellow;
  //   end;
  if dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.IsNull then
  dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value:= dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value;
  _EsGregarNuevo:=False;

  guardarRec := dmPanaderia.tblPrecioCuadrosMast.GetBookmark;
  ProcRefrescar;
  dmPanaderia.tblPrecioCuadrosMast.GotoBookmark(guardarRec);
  dmPanaderia.tblPrecioCuadrosMast.FreeBookmark(guardarRec);
end;

procedure TfrmCalcPrecioArticulo.btnCancelarClick(Sender: TObject);
begin
  dmPanaderia.tblPrecioCuadros.Cancel;
end;

procedure TfrmCalcPrecioArticulo.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadros.State in [dsInactive, dsBrowse] then
  begin
    dmPanaderia.tblPrecioCuadros.Close;
    dmPanaderia.tblPrecioCuadros.open;
    dmPanaderia.tblIngredienteTrabCuadros.Close;
    if dmPanaderia.tblPrecioCuadros.RecordCount > 0 then
    begin
      if not dmPanaderia.tblPrecioCuadrosNumero.IsNull then
      begin
        dmPanaderia.tblPrecioCuadros.Next;
        dmPanaderia.tblPrecioCuadros.Prior;
      end;
    end;
  end;
  dmPanaderia.qryBuscarProd.close;
  dmPanaderia.qryBuscarProd.open;
  dmPanaderia.qryInvMatDesc.close;
  dmPanaderia.qryInvMatDesc.open;
  edtCodCanuela.Text:= '';
  edtCodCanuela2.Text:=  '';
  edtPastatu.Text:=  '';
  dmPanaderia.qryTotalPrecioCuadros.Close;
  dmPanaderia.qryTotalPrecioCuadros.Params[0].Value:= dmPanaderia.tblPrecioCuadrosNUMERO_MAST.Value;
  dmPanaderia.qryTotalPrecioCuadros.Open;  
end;

procedure TfrmCalcPrecioArticulo.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('Desea eliminar record?',mtWarning,[mbyes,mbno],0) = mrYes then
  begin
    if dmPanaderia.tblIngredienteTrabCuadrosNUM_CANUELA.Value = 1 then
    begin
      if dmPanaderia.tblPrecioCuadros.State = dsBrowse then
      dmPanaderia.tblPrecioCuadros.Edit;
      dmPanaderia.tblPrecioCuadrosDOBLE_CANUELA.Value:=0;
    end;
    dmPanaderia.tblIngredienteTrabCuadros.Delete;
    GlbSalvarQuery(dmPanaderia.tblIngredienteTrabCuadros);
    btnSalvarClick(Self);
  end;
  dmPanaderia.CalcularPrecio;
end;

procedure TfrmCalcPrecioArticulo.BitBtn35Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      if dmPanaderia.tblPrecioCuadros.state in [dsEdit, dsInsert] then
      dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value:= frmConsultaInventario.ibquery1codigo.Value;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
  dmPanaderia.qryBuscarProd.Close;
  dmPanaderia.qryBuscarProd.open;  
end;

procedure TfrmCalcPrecioArticulo.edtCodCanuelaExit(Sender: TObject);
begin
  if (edtCodCanuela.Text = '') then exit;
  _Inserta:=True;
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);

  qryMateriales.Close;
  if qryInvTodos.Locate('CODIGO_BARRA', UpperCase(edtCodCanuela.Text),[loCaseInsensitive]) then
  begin
    qryMateriales.Params[0].Value:= '';
    qryMateriales.Params[1].Value:= qryInvTodosCODIGO.Value;
  end else
  begin
    if ('cañuela' = edtCodCanuela.Text) then
    qryMateriales.Params[0].Value:= uppercase('CAÑUELA%')
    else
    qryMateriales.Params[0].Value:= uppercase(edtCodCanuela.Text)+'%';
    qryMateriales.Params[1].Value:= -1;
  end;
  qryMateriales.open;
  if (qryMateriales.RecordCount > 0) then
  begin
    Panel1.Left:=10;
    Panel1.Top:=184;
    Panel1.Height:= 225;
    Panel1.Visible:=true;
    Panel1.BringToFront;
    RxDBGrid3.SetFocus;
    edtCodCanuela.Text:=qryMaterialesCODIGO_BARRA.Value;
  end;
  numCanuela:=1;
  EsCanuela:=1;
  areaX:=1;
end;

procedure TfrmCalcPrecioArticulo.edtPastatuExit(Sender: TObject);
begin
  if (edtPastatu.Text = '') then  exit;
  _Inserta:=True;
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);
  EsPastatu:=0;
  qryMateriales.Close;
  if qryInvTodos.Locate('CODIGO_BARRA', UpperCase(edtPastatu.Text),[loCaseInsensitive]) then
  begin
    qryMateriales.Params[0].Value:= '';
    qryMateriales.Params[1].Value:= qryInvTodosCODIGO.Value;
  end else
  begin
    qryMateriales.Params[0].Value:= UpperCase(edtPastatu.Text)+'%';
    qryMateriales.Params[1].Value:= -1;
  end;
  qryMateriales.open;
  if (qryMateriales.RecordCount > 0) then
  begin
    panel1.Left:=194;
    panel1.Top :=184;
    panel1.Height := 225;
    panel1.Visible:=true;
    panel1.BringToFront;
    RxDBGrid3.SetFocus;
    EsPastatu:=1;
    edtPastatu.Text:=qryMaterialesCODIGO_BARRA.Value;
  end;
  EsCanuela:=0;
  numCanuela:=0;
  //edtPastatu.Text:='';
  areaX:=3;
end;

procedure TfrmCalcPrecioArticulo.RxDBGrid3DblClick(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.IsNull then
  begin
    MessageDlg('No puedes agregar materiales '#13#10'sin darle a INSERTAR.',mtError,[mbok],0);
    exit;
  end;
  if not _Inserta then exit;
  if ProcC = False then Exit;
  if dmPanaderia.qryBuscarProd.Locate('CODIGO',qryMaterialesCODIGO_PROD.Value,[]) then
  begin
   dmPanaderia.qryDimensionProd.Close;
   dmPanaderia.qryDimensionProd.Params[0].Value:= qryMaterialesCODIGO_PROD.Value;
   dmPanaderia.qryDimensionProd.Open;
   if dmPanaderia.tblPrecioCuadrosNUMERO.IsNull
      and (dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsInsert]) then
   btnSalvarClick(Self);
   dmPanaderia.tblPrecioCuadros.edit;   
   //if not dmPanaderia.tblIngredienteTrabCuadros.Locate('CODIGO_PROD_BASE;COD_PRODUCTO',
   //vararrayof([dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value,qryMaterialesCODIGO_PROD.Value]),[]) then
   //begin
     dmPanaderia.tblIngredienteTrabCuadros.Append;
     dmPanaderia.tblIngredienteTrabCuadrosCODIGO_PROD_BASE.Value:= dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value;
     dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value := qryMaterialesCODIGO_PROD.Value;
     if areaX = 1 then
     edtCodCanuela.Text:= dmPanaderia.qryBuscarProdCODIGO_BARRA.Value
     else
     if areaX = 2 then
     edtCodCanuela2.Text:= dmPanaderia.qryBuscarProdCODIGO_BARRA.Value
     else
     if areaX = 3 then
     edtPastatu.Text:= dmPanaderia.qryBuscarProdCODIGO_BARRA.Value;
     areaX:=0;

     if chkBoxPLevel.Checked then
     begin
       dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value:= GetNivelPrecio(dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value);

       if dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value > 0 then
       dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value :=
       GetPrecioNivel( dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value,dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value);
     end;
     if dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value = 0 then
     dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value := qryMaterialesPRECIO.Value;

     dmPanaderia.tblIngredienteTrabCuadrosALTO.Value   := dmPanaderia.qryDimensionProdLARGO.Value;
     dmPanaderia.tblIngredienteTrabCuadrosANCHO.Value  := dmPanaderia.qryDimensionProdANCHO.Value;
     dmPanaderia.tblIngredienteTrabCuadrosCANT_MERMA.Value := dmPanaderia.qryDimensionProdDESPERDICIO.Value;
     dmPanaderia.tblIngredienteTrabCuadrosESCANUELA.Value:= EsCanuela;
     dmPanaderia.tblIngredienteTrabCuadrosESPASTATU.Value:= EsPastatu;
     dmPanaderia.tblIngredienteTrabCuadrosid.Value     := FsqlMaxNumero('Precio_Cuadros_det','id');
     dmPanaderia.tblIngredienteTrabCuadrosNUMERO.Value := dmPanaderia.tblPrecioCuadrosNUMERO.Value;
     if (numCanuela > 0) then
     dmPanaderia.tblIngredienteTrabCuadrosNUM_CANUELA.Value := numCanuela;
     if dmPanaderia.tblIngredienteTrabCuadrosNUM_CANUELA.Value = 2 then
     begin
       if dmPanaderia.tblPrecioCuadros.state = dsBrowse then
       dmPanaderia.tblPrecioCuadros.Edit;
       if dmPanaderia.tblPrecioCuadrosCON_CANVAS.Value = 0 then
       dmPanaderia.tblPrecioCuadrosDOBLE_CANUELA.Value:=1;
     end;
     
     GlbSalvarQuery(dmPanaderia.tblIngredienteTrabCuadros);
     dmPanaderia.tblIngredienteTrabCuadros.Edit;
     btnSalvarClick(Self);
     dmPanaderia.tblPrecioCuadros.Edit;
  end;
  _Inserta:=False;
  ProcC:=False;
  panel1.Visible:=false;
  //t edtCodCanuela.Text:='';
  //t edtCodCanuela2.Text:='';

end;

procedure TfrmCalcPrecioArticulo.RxDBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid3DblClick(Self) else
  if (key = 27) And (panel1.Visible) then
  begin
    _Inserta:= False;
    ProcC   := False;
    panel1.Visible:= False;
  end;  
end;

procedure TfrmCalcPrecioArticulo.RxDBGrid3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid3DblClick(Self);
end;

procedure TfrmCalcPrecioArticulo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsInsert] then
  begin
    if MessageDlg('Hay una transacción pendiente. Salir?', mtWarning,[mbyes,mbno],0) = mrNo then
    CanClose:=False;
  end else
  begin
    btnSalvarClick(Self);
    CanClose:= True;
  end;
end;

procedure TfrmCalcPrecioArticulo.BitBtn1Click(Sender: TObject);
begin
  if (dmPanaderia.tblPrecioCuadrosSTATUS.Value = 'R') then
  begin
    MessageDlg('Orden fue procesada, verifique.', mtError,[mbOk],0);
    exit;  
  end;
  if MessageDlg('¿Desea eliminar record con sus detalles?.', mtWarning,[mbyes, mbno],0) = mryes then
  begin
    dmPanaderia.tblPrecioCuadros.Delete;
    GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
  end;
end;

procedure TfrmCalcPrecioArticulo.BitBtn12Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    if not dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.IsNull then
    dmInventario.tblInventarioProd.Locate('codigo',dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value,[])
    else
    if not dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.IsNull then
    dmInventario.tblInventarioProd.Locate('codigo',dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value,[]);
    frminventarioprod.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;

  qryMateriales.Close;
  qryMateriales.Open;
  dmInventario.qryInvLookup.close;
  dmInventario.qryInvLookup.open;
  dmPanaderia.qryInvLookupIngrediente.Close;
  dmPanaderia.qryInvLookupIngrediente.Open;  
  qryInvTodos.close;
  qryInvTodos.open;
  dmPanaderia.qryInvMatDesc.close;
  dmPanaderia.qryInvMatDesc.open;
end;

procedure TfrmCalcPrecioArticulo.FormShow(Sender: TObject);
begin
  if frmCalcPrecioArticulo.chkCotizacion.Checked then
  BitBtn3.Enabled:=False
  else
  BitBtn3.Enabled:=True;
end;

procedure TfrmCalcPrecioArticulo.BitBtn17Click(Sender: TObject);
var
  codcte : integer;
begin
  frmClientes:=TfrmClientes.Create(Nil);
  try
    dmclientes.tblClientes.Tag:=-1;
    dmclientes.tblClientes.DisableControls;
    dmclientes.tblClientes.Locate('CODIGO_CTE', dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value,[]);
    dmclientes.tblClientes.Tag:=0;
    dmclientes.tblClientes.EnableControls;

    frmClientes.Showmodal;
    codcte := dmClientes.tblClientesCODIGO_CTE.Value;
  finally
  frmClientes.Free;
  frmClientes:=Nil;
  end;
  if dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsInsert] then
  begin
     dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value :=  codcte;
  end;
  dmventas.qryClientes.Close;
  dmventas.qryClientes.Open;
end;

procedure TfrmCalcPrecioArticulo.BitBtn4Click(Sender: TObject);
begin
  GetAnyDate1.Fecha := ExtraerFecha(GlbFechaTrnDiaria);
  GetAnyDate1.FechaCierre:=ExtraerFecha(GlbFechaTrnDiaria);
  GetAnyDate1.VFechaF:=false;
  if GetAnyDate1.Execute then
  begin
    dmPanaderia.tblIngredienteTrabCuadros.Close;
    {  
    dmPanaderia.tblPrecioCuadros.Close;
    dmPanaderia.tblPrecioCuadros.Params[0].Value:=ExtraerFecha(GetAnyDate1.Fecha);
    dmPanaderia.tblPrecioCuadros.Params[1].Value:=ExtraerFecha(GetAnyDate1.Fecha);
    dmPanaderia.tblPrecioCuadros.Params[2].Value:='A';
    dmPanaderia.tblPrecioCuadros.Params[3].Value:='A';
    dmPanaderia.tblPrecioCuadros.open;  }

    ProcAbridDatos(ExtraerFecha(GetAnyDate1.Fecha),'A');

  end;
  if dmPanaderia.tblPrecioCuadros.RecordCount > 0 then
  begin
    dmPanaderia.tblPrecioCuadros.Next;
    dmPanaderia.tblPrecioCuadros.Prior;
  end;
  edtCodCanuela.Text:= '';
  edtCodCanuela2.Text:=  '';
  edtPastatu.Text:=  '';  
end;

procedure TfrmCalcPrecioArticulo.RxSpeedButton1Click(Sender: TObject);
var
  flag: boolean;
begin
  if dmPanaderia.tblPrecioCuadros.State = dsEdit then
  GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);

  dmPanaderia.qryRepOrdenTrab.Close;
  dmPanaderia.qryRepOrdenTrab.Params[0].value:= dmPanaderia.tblPrecioCuadrosNUMERO.Value;
  dmPanaderia.qryRepOrdenTrab.Open;
  if dmPanaderia.qryRepOrdenTrab.RecordCount > 0 then
  begin
  qckRepOrdenComp:=TqckRepOrdenComp.Create(nil);
  try
    qckRepOrdenComp.hCImpreso:=False;
    if dmPanaderia.qryRepOrdenTrabCOMENTARIO.IsNull then
    begin
      qckRepOrdenComp.ChildBand3.Height:=0;
      qckRepOrdenComp.Page.Length:=qckRepOrdenComp.Page.Length - 1.10;
    end;
      qckRepOrdenComp.Prepare;
      repeat
          begin
            if (qckRepOrdenComp.PageNumber > 1) then
            begin
              qckRepOrdenComp.Page.Length:=qckRepOrdenComp.Page.Length + 0.26;
              qckRepOrdenComp.Prepare;
              flag:=False;
            end else
            if (qckRepOrdenComp.PageNumber = 1) then
            begin
              flag:=true;
              break;
            end;
         end;
         until flag = true;

    qckRepOrdenComp.Preview;
  finally
  qckRepOrdenComp.free;
  qckRepOrdenComp:=nil;
  end;
  end;
end;

procedure TfrmCalcPrecioArticulo.edtCodCanuela2Exit(Sender: TObject);
begin
  if (edtCodCanuela2.Text = '') then  exit;
  _Inserta:=True;
  if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);

  qryMateriales.Close;
  if qryInvTodos.Locate('CODIGO_BARRA', UpperCase(edtCodCanuela2.Text),[loCaseInsensitive]) then
  begin
    qryMateriales.Params[0].Value:= '';
    qryMateriales.Params[1].Value:= qryInvTodosCODIGO.Value;
  end else
  begin
    if ('cañuela' = UpperCase(edtCodCanuela2.Text)) then
    qryMateriales.Params[0].Value:= uppercase('CAÑUELA%')
    else
    qryMateriales.Params[0].Value:= uppercase(edtCodCanuela2.Text)+'%';
    qryMateriales.Params[1].Value:= -1;
  end;
  qryMateriales.open;
  if (qryMateriales.RecordCount > 0) then
  begin
    Panel1.Left:=102;
    Panel1.Top:=184;
    Panel1.Height:= 225;
    Panel1.Visible:=True;
    Panel1.BringToFront;
    RxDBGrid3.SetFocus;
    edtCodCanuela2.Text:=qryMaterialesCODIGO_BARRA.Value;
  end;
  EsCanuela:=1;
  numCanuela:=2;
  areaX:=2;
end;

procedure TfrmCalcPrecioArticulo.edtCodCanuelaEnter(Sender: TObject);
begin
  ProcC:=True;
end;

procedure TfrmCalcPrecioArticulo.edtCodCanuela2Enter(Sender: TObject);
begin
  ProcC:=True;
end;

procedure TfrmCalcPrecioArticulo.edtPastatuEnter(Sender: TObject);
begin
  ProcC:=True;
end;

procedure TfrmCalcPrecioArticulo.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = 27) And (panel1.Visible) then
  begin
    _Inserta:= False;
    ProcC   := False;
    panel1.Visible:= False;
  end else
  if (key = 113) then
  btnModificarClick(Self)
  else
  if (key = 116) then
  begin
    btnSalvarClick(Self);
  end;

end;

procedure TfrmCalcPrecioArticulo.btnFacturarClick(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadros.State = dsEdit then
  GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
  
  if (UpperCase(dmPanaderia.tblPrecioCuadrosSTATUS.Value) = 'R') then
  begin
    MessageDlg('Cotizacion Cerrada, veririque',mtWarning,[mbok],0);
    Exit;
  end;

  if MessageDlg('¿Desea generar facturas?',mtInformation,[mbyes,mbno],0)=mrNo then
  exit;
  if dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value = 0 then
  begin
    MessageDlg('Favor indicar cliente.', mtInformation,[mbok],0);
    exit;
  end;
  //t if (dmPanaderia.tblPrecioCuadrosFORMAPAGO_ABONO.IsNull) and
  //t   (dmPanaderia.tblPrecioCuadrosMONTO_ABONADO.Value > 0 ) then
  //t begin
  //t  MessageDlg('Favor indicar forma de pago del abono.',mtInformation,[mbok],0);
  //t  DBEdit6Exit(Self);
  //t  exit;
  //t end;
  btnSalvarClick(Self);

  dmPanaderia.qryDimensionProd.Close;
  dmPanaderia.qryDimensionProd.Params[0].Value:=dmPanaderia.tblPrecioCuadrosNumero.Value;
  dmPanaderia.qryDimensionProd.Open;
  dmCompania.tblcompania.Close;
  dmCompania.tblcompania.Open;
  dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);
  dmcxc.QrybalanceCtes.Close;
  dmcxc.QrybalanceCtes.Open;

  porcientoItbi := FGlbPorcItbi(ExtraerFecha(GlbFechaTrnDiaria),-1);

  try
    ProcCrearFacturas;
  except on E : Exception do
  begin
    WriteToLog('Error generando factura:'+''#13#10''+e.Message);
    end;
  end;
end;

procedure TfrmCalcPrecioArticulo.ProcCrearFacturas;
  var
  x: integer;
  truco : string;
  xc : integer;
begin
  xc:=dmPanaderia.tblPrecioCuadrosNUMERO.Value;
  _ShowImpFact:=False;
  GlbFactRecurrente:=True;

  FechaIniFct:= dmPanaderia.tblPrecioCuadrosFecha.Value;
  _ShowImpFact := true;
  UseFormVentas;
end;

procedure TfrmCalcPrecioArticulo.UseFormVentas;
  var
  serieDoc : Integer;
  valorNCF : String;
  MontoItbis : Extended;
  montoneto: Extended;
  flag : boolean;
  cont:integer;
  nummst : integer;
begin
  dmFactura.DataModuleCreate(self);
  
  GlbFacturaArtioffice:=0;
  btnFacturar.Enabled:=False;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  flag:=False;
  GlbCodDivInventario:= 1;
  frmProcVentaRapida := TfrmProcVentaRapida.Create(Nil);
  try

    dmFactura.tblPrepagoCte.Close;
    dmFactura.tblPrepagoCte.Params[0].Value:= dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value;
    dmFactura.tblPrepagoCte.Open;
    frmProcVentaRapida.DBEdit17.Visible:=False;
    if (dmFactura.tblPrepagoCte.RecordCount > 0) then
    begin
      if dmFactura.tblPrepagoCte.locate('NUMERO_TRN',dmPanaderia.tblPrecioCuadrosNumero.Value,[]) then
      begin
        if (dmFactura.tblPrepagoCteSTATUS.Value = 'A') then 
        frmProcVentaRapida._MontoPrepago:=dmFactura.tblPrepagoCteMONTO.Value
        else frmProcVentaRapida._MontoPrepago:=0;
        if frmProcVentaRapida.Totales.state = dsBrowse then
        frmProcVentaRapida.Totales.edit;
        frmProcVentaRapida.TotalesPreAbono.Value:=frmProcVentaRapida._MontoPrepago ;
        frmProcVentaRapida.DBEdit17.Visible := True;
        frmProcVentaRapida.DBEdit17.BringToFront;
      end;
    end;

    dmUsuarios.qryRoles.Close;
    dmUsuarios.qryRoles.Params[0].Value:= VarUsuarioGlb;
    dmUsuarios.qryRoles.Open;
    dmUsuarios.qryRoles.First;

    frmProcVentaRapida.lblInventario.Caption :='ALMACEN PRINCIPAL';

    ProcGlbSecuenciaNCF;//Chequea Disponibilidad de sec ncf
    GlbFactRecurrente:=True;
    frmProcVentaRapida.DescFactRecurrente:='Orden de Trabajo '+
    NombreMes[StrToInt(FormatDateTime('mm',dmPanaderia.tblPrecioCuadrosFECHA.Value))]+' '+
    FormatDateTime('yyyy',dmPanaderia.tblPrecioCuadrosFECHA.Value);

    begin
      frmProcVentaRapida._GenNCFFactR:=False;
      if not dmPanaderia.tblPrecioCuadrosMONTO_ABONADO.IsNull then
      frmProcVentaRapida._montoAbonoC:=dmPanaderia.tblPrecioCuadrosMONTO_ABONADO.Value //no usado por ahora
      else
      frmProcVentaRapida._montoAbonoC:=0;
      frmProcVentaRapida.tablaPropietario.EmptyTable;
      frmProcVentaRapida.tablaPropietario.Append;
      frmProcVentaRapida.tablaPropietarioCodigoPropietario.Value:=
      dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value;
      frmProcVentaRapida.tablaPropietario.Post;

      frmProcVentaRapida.xnumprogrec := dmPanaderia.tblPrecioCuadrosNUMERO.Value;
      frmProcVentaRapida.rxdbLookupCteExit(Self);

      frmProcVentaRapida.ProcSetNCFCliente;
      dmPanaderia.tblPrecioCuadros.first;
      //nuevo
      rxServFct.Close;
      rxServFct.Open;
      while not dmPanaderia.tblPrecioCuadros.Eof do
      begin
        rxServFct.Insert;
        rxServFctNumeroMast.Value:= dmPanaderia.tblPrecioCuadrosNUMERO.Value;
        rxServFct.Post;
        if frmProcVentaRapida.rxVenta.State = dsBrowse then
        frmProcVentaRapida.BitBtn1Click(Self);
        frmProcVentaRapida.rxVentaMonedaBase.Value := GetMonedaProducto(dmPanaderia.tblPrecioCuadrosCod_Producto.Value);
        frmProcVentaRapida.rxVentamonto_tasa.Value := GlbMontoTasa(frmProcVentaRapida.rxVentaMonedaBase.Value);
        FGlbPorcItbi(ExtraerFecha(frmProcVentaRapida.rxVentaFecha.Value), dmPanaderia.tblPrecioCuadrosCod_Producto.Value);

        frmProcVentaRapida.rxVentaFecha.Value := ExtraerFecha(dmPanaderia.tblPrecioCuadrosFecha.Value);
        frmProcVentaRapida.rxVentaCant.Value  := 1;
        frmProcVentaRapida.rxVentaPrecio.Value:= dmPanaderia.tblPrecioCuadrosMontoRestante.Value;
        //frmProcVentaRapida.rxVentaPrecio.ReadOnly:=true;
        if not (Pos(dmPanaderia.tblPrecioCuadrosALTO.AsString,UpperCase(dmInventario.qryInvLookupDESCRIPCION.Value)) > 0) then
        begin
          if (not dmPanaderia.tblPrecioCuadrosALTO.IsNull) and (not dmPanaderia.tblPrecioCuadrosANCHO.IsNull) then
          frmProcVentaRapida.rxVentaDescripcion.Value := dmInventario.qryInvLookupDESCRIPCION.Value +
          ' ' + dmPanaderia.tblPrecioCuadrosALTO.AsString +' X '+dmPanaderia.tblPrecioCuadrosANCHO.AsString
          else
          frmProcVentaRapida.rxVentaDescripcion.Value := dmInventario.qryInvLookupDESCRIPCION.Value
        end else
        frmProcVentaRapida.rxVentaDescripcion.Value := dmInventario.qryInvLookupDESCRIPCION.Value;
        
        frmProcVentaRapida.rxVentaTipoUnidad.Value  := 1;
        frmProcVentaRapida.rxVentaStatus.Value      := 'A';
        frmProcVentaRapida.rxVentaTipoVenta.Value   := 0;

        if not dmPanaderia.tblPrecioCuadrosComentario.IsNull then
        frmProcVentaRapida.rxVentaDescripcionEspecial.Value:= dmPanaderia.tblPrecioCuadrosComentario.Value ///+
        //''#13'Monto Abonado:'+InsertarComa(dmPanaderia.tblPrecioCuadrosMONTO_ABONADO.AsString)
        ;//else
        //frmProcVentaRapida.rxVentaDescripcionEspecial.Value:=
        //''#13'Monto Abonado:'+InsertarComa(dmPanaderia.tblPrecioCuadrosMONTO_ABONADO.AsString);

        frmProcVentaRapida.rxVentaCodArticulo.Value := dmPanaderia.tblPrecioCuadrosCod_Producto.Value;
        frmProcVentaRapida.edtCodigo.Text           := dmPanaderia.tblPrecioCuadrosCod_Producto.AsString;

        if frmProcVentaRapida.rxVenta.State in [dsBrowse] then
        frmProcVentaRapida.rxVenta.Edit;

        frmProcVentaRapida.rxVentaIDTasaITBIS.Value := GlbIDTasa;
        if (GlbIgI = 1) and (GlbCalcItbis = 0) then
        frmProcVentaRapida.rxVentaIDTasaITBIS.Value := 1;

        frmProcVentaRapida.edtCodigoExit(self);

        frmProcVentaRapida.DBEdit1Exit(Self);
        frmProcVentaRapida.DBEdit2Exit(Self);

        if frmProcVentaRapida.rxVenta.State in [dsInsert,dsEdit] then
        frmProcVentaRapida.rxVenta.Post;

        frmProcVentaRapida.BitBtn2Click(Self);
        dmPanaderia.tblPrecioCuadros.Next;//nuevo
      end;
      //frmProcVentaRapida.ShowModal;
      if frmProcVentaRapida.rxVenta.RecordCount > 0 then
      begin
         frmProcVentaRapida.CerrarVentana:=True;
         dmPanaderia.tblPrecioCuadros.First;
         while not dmPanaderia.tblPrecioCuadros.eof do
         begin
           if dmPanaderia.tblPrecioCuadrosFORMAPAGO_ABONO.IsNull then
           begin
             dmPanaderia.tblPrecioCuadros.Next;
             Continue;
           end;
           if not dmPanaderia.tblPrecioCuadrosFORMAPAGO_ABONO.IsNull then
           frmProcVentaRapida.FPagoFctR:= dmPanaderia.tblPrecioCuadrosFORMAPAGO_ABONO.Value
           else frmProcVentaRapida.FPagoFctR:= -1;
           frmProcVentaRapida.Label14.Caption:='Pre-Pago';
           dmPanaderia.tblPrecioCuadros.Next;
         end;
         frmProcVentaRapida.DBEdit10.Visible:=False;
         frmProcVentaRapida.DBEdit17.Visible:=True;
         frmProcVentaRapida.DBEdit17.BringToFront;
         frmProcVentaRapida.ShowModal;
      end;
      FLAG:= false;
      if not frmProcVentaRapida.ipStpInsertVentMast.Params[0].IsNull  then
      begin
        dmPanaderia.tblPrecioCuadros.Edit;
        dmPanaderia.tblPrecioCuadrosNUMERO_TRN_VTA.Value:= frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value;
        GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
        if frmProcVentaRapida.ipStpInsertVentMast.Params[0].Value > 0 then
        flag:=True else flag:= False;
        GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
        GlbFactRecurrente:=True;
      end;
    end;
  finally
  frmProcVentaRapida.Free;
  frmProcVentaRapida:= Nil;
  end;
  GlbCodDivInventario:= -1;
  GlbFactRecurrente:=False;
  btnFacturar.Enabled:=True;

  IF FLAG THEN
  begin
    if (dmPanaderia.tblPrecioCuadrosSTATUS.Value = 'A') then
    begin
      if dmPanaderia.rxMaterialUsado.State = dsBrowse then
      begin
        dmPanaderia.rxMaterialUsado.First;
        cont:=0;
        while not dmPanaderia.rxMaterialUsado.eof do
        begin
          if dmPanaderia.rxMaterialUsadoEsCanuela.Value = 1 then
          ProcActualizaInv(dmPanaderia.rxMaterialUsadoCanuela.Value,dmPanaderia.rxMaterialUsadoCodigo_prod.Value);
          if dmPanaderia.rxMaterialUsadoEsPaspatu.Value = 1 then
          ProcActualizaInv(dmPanaderia.rxMaterialUsadoPaspatu.Value,dmPanaderia.rxMaterialUsadoCodigo_prod.Value);
          inc(cont);
          if cont > 25 then break;
          dmPanaderia.rxMaterialUsado.Next;
        end;
      end;

    dmFactura.tblPrepagoCte.Close;
    dmFactura.tblPrepagoCte.Params[0].Value:= dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value;
    dmFactura.tblPrepagoCte.Open;

    if dmFactura.tblPrepagoCte.Locate('NUMERO_TRN',dmPanaderia.tblPrecioCuadrosNumero.Value,[]) then
    begin
      dmFactura.tblPrepagoCte.Edit;
      dmFactura.tblPrepagoCteSTATUS.Value:='R';
      GlbSalvarQuery(dmFactura.tblPrepagoCte);
    end;

    end;
    rxServFct.first;
    nummst:=rxServFctNumeroMast.Value;
    while not rxServFct.eof do
    begin
      if dmPanaderia.tblPrecioCuadros.locate('NUMERO',rxServFctNumeroMast.Value,[]) then
      begin
        if dmPanaderia.tblPrecioCuadros.State = dsBrowse then
        dmPanaderia.tblPrecioCuadros.Edit;
        dmPanaderia.tblPrecioCuadrosStatus.Value:='R';
        GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
      end;
      rxServFct.Next;
    end;
    GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);
    edtCodCanuela.Text:= '';
    edtCodCanuela2.Text:=  '';
    edtPastatu.Text:=  '';
    ProcAbridDatos(dmPanaderia.tblPrecioCuadrosFECHA.Value,'R');
    dmPanaderia.tblPrecioCuadrosMast.Locate('NUMERO',nummst,[]);
  end;
  GlbFactRecurrente:=False;
  Beep;
end;                                              //en pulgadas
procedure TfrmCalcPrecioArticulo.ProcActualizaInv(cantMaterial: currency; codProd:integer);
begin
  ibStpActualizaInvProd.Params[0].Value:= codProd;
  ibStpActualizaInvProd.Params[1].Value:= cantMaterial / 12; //llevarlo a pies

  ibStpActualizaInvProd.Params[2].Value     := 0;  //tipoTrn

  ibStpActualizaInvProd.Params[3].Value     := 1; //porCodigo

  try
    ibStpActualizaInvProd.ExecProc;   //ctualiza inventario
  except on E : Exception do
  WriteToLog('Error actualizando inventario:'+''#13#10''+e.Message);
  end;
end;
procedure TfrmCalcPrecioArticulo.RxDBGrid4GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmPanaderia.tblPrecioCuadrosSTATUS.Value = 'R') then
  BackGround:=clGreen;
end;

procedure TfrmCalcPrecioArticulo.BitBtn5Click(Sender: TObject);
begin
  GetAnyDate1.Fecha := ExtraerFecha(GlbFechaTrnDiaria);
  GetAnyDate1.FechaCierre:=ExtraerFecha(GlbFechaTrnDiaria);
  GetAnyDate1.UsaFechaCierre:=true;
  GetAnyDate1.VFechaF:=True;
  if GetAnyDate1.Execute then
  begin
    dmPanaderia.tblIngredienteTrabCuadros.Close;
    {dmPanaderia.tblPrecioCuadros.Close;
    dmPanaderia.tblPrecioCuadros.Params[0].Value:=ExtraerFecha(GetAnyDate1.Fecha);
    dmPanaderia.tblPrecioCuadros.Params[1].Value:=ExtraerFecha(GetAnyDate1.FechaFinal);
    dmPanaderia.tblPrecioCuadros.Params[2].Value:='A';
    dmPanaderia.tblPrecioCuadros.Params[3].Value:='R';
    dmPanaderia.tblPrecioCuadros.Open;}

    ProcAbridDatos(ExtraerFecha(GetAnyDate1.Fecha),'R');

  end;
  edtCodCanuela.Text:= '';
  edtCodCanuela2.Text:=  '';
  edtPastatu.Text:=  '';
end;

procedure TfrmCalcPrecioArticulo.BitBtn6Click(Sender: TObject);
begin
  edtCodCanuela.Text:= '';
  edtCodCanuela2.Text:=  '';
  edtPastatu.Text:=  '';
  if dmPanaderia.tblPrecioCuadros.State = dsEdit then
  GlbSalvarQuery(dmPanaderia.tblPrecioCuadros);

  dmPanaderia.tblIngredienteTrabCuadros.Close;
  dmPanaderia.tblIngredienteTrabCuadros.Params[0].Value:=-1;
  {
  dmPanaderia.tblPrecioCuadros.Close;
  dmPanaderia.tblPrecioCuadros.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmPanaderia.tblPrecioCuadros.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmPanaderia.tblPrecioCuadros.Params[2].Value:='A';
  dmPanaderia.tblPrecioCuadros.Params[3].Value:='A';
  dmPanaderia.tblPrecioCuadros.open;
  }

  ProcAbridDatos(GlbFechaTrnDiaria,'A');

  dmPanaderia.tblPrecioCuadros.first;
  if dmPanaderia.tblPrecioCuadros.RecordCount = 0 then
  begin
    dmPanaderia.tblIngredienteTrabCuadros.Close;
    dmPanaderia.tblIngredienteTrabCuadros.Params[0].Value:=-1;
    dmPanaderia.tblIngredienteTrabCuadros.Open;
  end else
  begin
    dmPanaderia.tblIngredienteTrabCuadros.Close;
    dmPanaderia.tblIngredienteTrabCuadros.Params[0].value:= dmPanaderia.tblPrecioCuadrosNumero.Value;
    dmPanaderia.tblIngredienteTrabCuadros.Open;
  end;
  btnCerarAbrirresClick(Self);

end;
procedure TfrmCalcPrecioArticulo.ProcAbridDatos(fecha:TDateTime; _st : string);
begin
    dmPanaderia.tblPrecioCuadrosMast.Close;
    dmPanaderia.tblPrecioCuadrosMast.Params[0].Value:=ExtraerFecha(fecha);
    dmPanaderia.tblPrecioCuadrosMast.Params[1].Value:=ExtraerFecha(fecha);
    dmPanaderia.tblPrecioCuadrosMast.Params[2].Value:='A';
    dmPanaderia.tblPrecioCuadrosMast.Params[3].Value:=_st;
    dmPanaderia.tblPrecioCuadrosMast.Open;

    dmPanaderia.tblPrecioCuadros.Close;
    dmPanaderia.tblPrecioCuadros.Params[0].Value:=ExtraerFecha(fecha);
    dmPanaderia.tblPrecioCuadros.Params[1].Value:=ExtraerFecha(fecha);
    dmPanaderia.tblPrecioCuadros.Params[2].Value:='A';
    dmPanaderia.tblPrecioCuadros.Params[3].Value:=_st;
    dmPanaderia.tblPrecioCuadros.Params[4].Value:=dmPanaderia.tblPrecioCuadrosMastNUMERO.Value;
    dmPanaderia.tblPrecioCuadros.Open;

    dmPanaderia.qryTotalPrecioCuadros.Close;
    dmPanaderia.qryTotalPrecioCuadros.Params[0].Value:= dmPanaderia.tblPrecioCuadrosNUMERO_MAST.Value;
    dmPanaderia.qryTotalPrecioCuadros.Open;
end;

procedure TfrmCalcPrecioArticulo.BitBtn7Click(Sender: TObject);
begin
  if not dmPanaderia.tblIngredienteTrabCuadrosID.IsNull then
  begin
    dmPanaderia.tblIngredienteTrabCuadros.Edit;
    DBEdit11.SetFocus;
  end;
end;

procedure TfrmCalcPrecioArticulo.SpeedButton3Click(Sender: TObject);
begin
  dmPanaderia.CalcularPrecio;
end;

procedure TfrmCalcPrecioArticulo.DBCheckBox2Click(Sender: TObject);
begin
 if dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsInsert] then
 begin
   if dmPanaderia.tblPrecioCuadrosDOBLE_CANUELA.Value = 1 then
   dmPanaderia.tblPrecioCuadrosDOBLEPASTATU.Value:=0;
   dmPanaderia.CalcularPrecio;
 end;
end;

procedure TfrmCalcPrecioArticulo.DBCheckBox1Click(Sender: TObject);
begin
 if dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsInsert] then
 begin
   if dmPanaderia.tblPrecioCuadrosDOBLEPASTATU.Value = 1 then
   dmPanaderia.tblPrecioCuadrosDOBLE_CANUELA.Value := 0;
   dmPanaderia.CalcularPrecio;
 end;
end;

procedure TfrmCalcPrecioArticulo.DBEdit7Exit(Sender: TObject);
begin
  SpeedButton3Click(Self);
end;

procedure TfrmCalcPrecioArticulo.DBEdit6Enter(Sender: TObject);
begin
  DBEdit6.Color:=clWindow;
end;

procedure TfrmCalcPrecioArticulo.RxDBGrid3Enter(Sender: TObject);
begin
  ProcC := True;
end;

procedure TfrmCalcPrecioArticulo.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key ='#27') And (panel1.Visible) then
  begin
    _Inserta:= False;
    ProcC   := False;
    panel1.Visible:= False;
  end;
end;

procedure TfrmCalcPrecioArticulo.BitBtn8Click(Sender: TObject);
begin
  _Inserta:= False;
  ProcC   := False;
  panel1.Visible:= False;
end;

procedure TfrmCalcPrecioArticulo.BitBtn10Click(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadros.state in [dsEdit, dsInsert] then exit;
  dmPanaderia.tblPrecioCuadrosMast.first;
end;

procedure TfrmCalcPrecioArticulo.BitBtn11Click(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadros.state in [dsEdit, dsInsert] then exit;
  dmPanaderia.tblPrecioCuadrosMast.Prior;
end;

procedure TfrmCalcPrecioArticulo.BitBtn13Click(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadros.state in [dsEdit, dsInsert] then exit;
  dmPanaderia.tblPrecioCuadrosMast.next;
end;

procedure TfrmCalcPrecioArticulo.BitBtn14Click(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadros.state in [dsEdit, dsInsert] then exit;
  dmPanaderia.tblPrecioCuadrosMast.last;
end;

procedure TfrmCalcPrecioArticulo.BitBtn9Click(Sender: TObject);
begin
  if (ProcC = false ) then exit;
  RxDBGrid3DblClick(Self);
  //edtCodCanuela.Text:='';
  //edtCodCanuela2.Text:='';
end;

procedure TfrmCalcPrecioArticulo.SpeedButton4Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    frmConsultaInventario.IBQuery1.SQL.Clear;
    frmConsultaInventario.IBQuery1.SQL.Add(
   'Select *  From inventario_producto  i');
   frmConsultaInventario.IBQuery1.SQL.Add('inner join TIPO_INVENTARIO t on t.CODIGO = i.TIPO');
   frmConsultaInventario.IBQuery1.SQL.Add('where UPPER(t.DESCRIPCION) like '+CHR(39)+'INGREDIENTE%'+CHR(39));
   frmConsultaInventario.IBQuery1.SQL.Add('ORDER BY T.DESCRIPCION');
   frmConsultaInventario.IBQuery1.Open;
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      ComboBox1.Text:=frmConsultaInventario.IBQuery1DESCRIPCION.Value;
      ComboBox1Change(Self);
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmCalcPrecioArticulo.DBCheckBox3Click(Sender: TObject);
begin
 if dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsInsert] then
 begin
   dmPanaderia.CalcularPrecio;
 end;
end;

procedure TfrmCalcPrecioArticulo.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (dmPanaderia.tblPrecioCuadrosSTATUS.Value = 'R') then
  begin
    Background:=$009CCC75;
    AFont.Color:= clBlack;
  end;
end;

procedure TfrmCalcPrecioArticulo.DBEdit6Exit(Sender: TObject);
begin
{temporal
  if dmPanaderia.tblPrecioCuadros.State in [dsInactive, dsBrowse] then exit;
  if dmPanaderia.tblPrecioCuadrosMONTO_ABONADO.Value <= 0 then exit;
  frmFormaPago:=TfrmFormaPago.Create(nil);
  try
    frmFormaPago.setEfectivo := 1;
    if frmFormaPago.Showmodal = mrOk then
    begin
      dmPanaderia.tblPrecioCuadrosFORMAPAGO_ABONO.Value:=dmVentas.TblFormaPagoCODIGO.Value;
    end
  finally
  frmFormaPago.Free;
  frmFormaPago:=Nil;
  end;
  }
end;

procedure TfrmCalcPrecioArticulo.DBCheckBox4Click(Sender: TObject);
begin
  if not DBCheckBox4.Checked then exit;
  if dmPanaderia.tblPrecioCuadrosFECHA.IsNull then exit;
 if not Assigned(dmPanaderia) then
  dmPanaderia:=TdmPanaderia.Create(nil);

  if dmPanaderia.tblPrecioCuadros.State in [dsInactive, dsBrowse] then exit;

  if dmPanaderia.qryBuscarProd.State in [dsInactive] then
  dmPanaderia.qryBuscarProd.Open;
  
  if qryInvTodos.state = dsInactive then qryInvTodos.Open;
  if dmPanaderia.qryBuscarProd.Locate('DESCRIPCION','CANVAS',[loCaseInsensitive,loPartialKey]) then
  begin
    dmPanaderia.qryDimensionProd.Close;
    dmPanaderia.qryDimensionProd.Params[0].Value:= dmPanaderia.qryBuscarProdCODIGO.Value;
    dmPanaderia.qryDimensionProd.Open;

    if dmPanaderia.qryDimensionProd.RecordCount = 0 then
    Exit;

    dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value:= dmPanaderia.qryBuscarProdCODIGO.Value;
    dmPanaderia.tblPrecioCuadrosCON_DOBLE_CRISTAL.Value:= 0;
    dmPanaderia.tblPrecioCuadrosDOBLEPASTATU.Value     := 0;
    dmPanaderia.tblPrecioCuadrosDOBLE_CANUELA.Value    := 0;

    qryMateriales.Close;

  if qryInvTodos.Locate('CODIGO', dmPanaderia.qryBuscarProdCODIGO.Value,[]) then
  begin
    qryMateriales.Params[0].Value:= '';
    qryMateriales.Params[1].Value:= qryInvTodosCODIGO.Value;
  end;
  qryMateriales.open;
  if (qryMateriales.RecordCount > 0) then
  begin
    if dmPanaderia.tblPrecioCuadros.State in [dsEdit, dsInsert] then
     dmPanaderia.tblPrecioCuadrosCON_CANVAS.Value:=1;
     btnSalvarClick(Self);
     if dmPanaderia.tblIngredienteTrabCuadros.State = dsInactive then
     dmPanaderia.tblIngredienteTrabCuadros.Open;
     if (dmPanaderia.tblPrecioCuadrosCON_CANVAS.Value = 1) then
     begin
       if dmPanaderia.tblIngredienteTrabCuadros.Locate('cod_producto', dmPanaderia.qryBuscarProdCODIGO.Value,[]) then
       begin
         dmPanaderia.tblIngredienteTrabCuadros.Edit;
         dmPanaderia.tblIngredienteTrabCuadrosCODIGO_PROD_BASE.Value:= dmPanaderia.qryBuscarProdCODIGO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value    := dmPanaderia.qryBuscarProdCODIGO.Value;

         dmPanaderia.tblIngredienteTrabCuadrosCODIGO_PROD_BASE.Value:= dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value := qryMaterialesCODIGO_PROD.Value;
         
         if chkBoxPLevel.Checked then
         begin
           dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value:= GetNivelPrecio(dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value);         
           if dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value > 0 then
           dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value :=
           GetPrecioNivel( dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value,dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value);
         end;
         if dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value = 0 then
         dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value := dmPanaderia.qryBuscarProdPRECIO.Value;

         //dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value := dmPanaderia.qryBuscarProdPRECIO.Value;

         dmPanaderia.tblIngredienteTrabCuadrosALTO.Value   := dmPanaderia.qryDimensionProdLARGO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosANCHO.Value  := dmPanaderia.qryDimensionProdANCHO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosCANT_MERMA.Value:= dmPanaderia.qryDimensionProdDESPERDICIO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosESCANUELA.Value := 0;
         dmPanaderia.tblIngredienteTrabCuadrosESPASTATU.Value := 0;
         dmPanaderia.tblIngredienteTrabCuadrosNUMERO.Value := dmPanaderia.tblPrecioCuadrosNUMERO.Value;
         GlbSalvarQuery(dmPanaderia.tblIngredienteTrabCuadros);
       end else
       begin
         dmPanaderia.tblIngredienteTrabCuadros.Append;
         dmPanaderia.tblIngredienteTrabCuadrosCODIGO_PROD_BASE.Value:= dmPanaderia.qryBuscarProdCODIGO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value := dmPanaderia.qryBuscarProdCODIGO.Value;
         //dmPanaderia.tblIngredienteTrabCuadrosCODIGO_BARRA.Value := qryMaterialesCODIGO_BARRA.Value;

         if chkBoxPLevel.Checked then
         begin
           dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value:= GetNivelPrecio(dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value);

           if dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value > 0 then
           dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value :=
           GetPrecioNivel( dmPanaderia.tblIngredienteTrabCuadrosCOD_PRODUCTO.Value,dmPanaderia.tblIngredienteTrabCuadrosLEVEL_PRECIO.Value);
         end;
         if dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value = 0 then
         dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value := dmPanaderia.qryBuscarProdPRECIO.Value;
                  
         //dmPanaderia.tblIngredienteTrabCuadrosPRECIO.Value := dmPanaderia.qryBuscarProdPRECIO.Value;

         dmPanaderia.tblIngredienteTrabCuadrosALTO.Value   := dmPanaderia.qryDimensionProdLARGO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosANCHO.Value  := dmPanaderia.qryDimensionProdANCHO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosCANT_MERMA.Value := dmPanaderia.qryDimensionProdDESPERDICIO.Value;
         dmPanaderia.tblIngredienteTrabCuadrosESCANUELA.Value:= 0;
         dmPanaderia.tblIngredienteTrabCuadrosESPASTATU.Value:= 0;
         dmPanaderia.tblIngredienteTrabCuadrosid.Value     := FsqlMaxNumero('Precio_Cuadros_det','id');
         dmPanaderia.tblIngredienteTrabCuadrosNUMERO.Value := dmPanaderia.tblPrecioCuadrosNUMERO.Value;
         GlbSalvarQuery(dmPanaderia.tblIngredienteTrabCuadros);
         dmPanaderia.tblIngredienteTrabCuadros.Edit;
         btnSalvarClick(Self);
         dmPanaderia.tblPrecioCuadros.Edit;
       end;
     end;
    end;
  end;
end;

function TfrmCalcPrecioArticulo.GetPrecioNivel(codProd:Integer; t : smallint) : Currency;
begin
  QryPrecios.Close;
  QryPrecios.Params[0].Value:= codProd;
  QryPrecios.Open;
  if QryPrecios.Locate('Codigo', codProd,[]) then
  begin
    case t Of
    1: begin
         if QryPreciosPRECIOVENTA1.Value > 0 then
         result := QryPreciosPRECIOVENTA1.Value;
       end;
    2: begin
        if QryPreciosPRECIOVENTA2.Value > 0 then
        result := QryPreciosPRECIOVENTA2.Value;
       end;
    3:begin
        if QryPreciosPRECIOVENTA3.Value > 0 then
        result := QryPreciosPRECIOVENTA3.Value;
      end;
    4: begin
         if QryPreciosPRECIOVENTA4.Value > 0 then
         result := QryPreciosPRECIOVENTA4.Value;
      end;
    end;//case
  end;
end;

function TfrmCalcPrecioArticulo.GetNivelPrecio(codcte: integer):smallint;
begin
  qryLevelPrecioCte.close;
  qryLevelPrecioCte.open;
  if qryLevelPrecioCte.Locate('CODIGO_CTE',codcte,[]) then
  result := qryLevelPrecioCteUSARLEVELPRECIO.Value
  else result := 0;
end;

procedure TfrmCalcPrecioArticulo.BitBtn15Click(Sender: TObject);
var
  xst : boolean;
begin
  if (dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value = 0) or (dmPanaderia.tblPrecioCuadrosCODIGO_CTE.IsNull) then
  begin
    MessageDlg('Favor indicar cliente.',mtWarning,[mbok],0);
    exit;
  end;

  frmProcesarPrepago:=TfrmProcesarPrepago.Create(nil);
  try
    frmProcesarPrepago._codigoCte:= dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value;
    dmFactura.tblPrepagoCte.Close;
    dmFactura.tblPrepagoCte.Params[0].Value:= frmProcesarPrepago._codigoCte;
    dmFactura.tblPrepagoCte.Open;
    xst:=false;
    if (dmFactura.tblPrepagoCte.RecordCount = 0) then
    xst:=true;

    if not dmFactura.tblPrepagoCte.Locate('NUMERO_TRN',dmPanaderia.tblPrecioCuadrosNumero.Value,[]) then
    xst:=true;
    
    if xst then
    begin
      dmFactura.tblPrepagoCte.Append;
      dmFactura.tblPrepagoCteCODIGO_USR_CAJA.Value:= VarUsuarioGlb;
      dmFactura.tblPrepagoCteCODIGO_CTE.Value:=frmProcesarPrepago._codigoCte;
      dmFactura.tblPrepagoCteNUMERO_TRN.Value:=dmPanaderia.tblPrecioCuadrosNumero.Value;
      dmFactura.tblPrepagoCteCODIGO_PROD.Value:=dmPanaderia.tblPrecioCuadrosCOD_PRODUCTO.Value;
      dmFactura.tblPrepagoCteFECHA.Value :=ExtraerFecha(now);
      dmFactura.tblPrepagoCteFPAGO.Value:=1;
      dmFactura.tblPrepagoCteSTATUS.Value:='A';
    end else
    begin
      if (dmFactura.tblPrepagoCteSTATUS.Value = 'R') then
      begin
        frmProcesarPrepago.DBEdit3.Enabled:= False;
        frmProcesarPrepago.DBDateEdit2.Enabled:= False;
        frmProcesarPrepago.RxDBLookupCombo2.Enabled:=False;
      end;
    end;
    frmProcesarPrepago.ShowModal;
  finally
  frmProcesarPrepago.free;
  frmProcesarPrepago:=Nil;
  end;
end;

procedure TfrmCalcPrecioArticulo.edtCodMatAdcChange(Sender: TObject);
begin
  if dmPanaderia.qryInvLookupIngrediente.Locate('CODIGO_BARRA',edtCodMatAdc.Text,[loCaseInsensitive,loPartialKey]) then
  begin
    Label29.Visible:=True;
    Label29.Caption:=dmPanaderia.qryInvLookupIngredienteCODIGO_BARRA.Value;
    edtCodProd:= dmPanaderia.qryInvLookupIngredienteCODIGO.Value;
    ComboBox1.Text:=dmPanaderia.qryInvLookupIngredienteDESCRIPCION.Value;
    ComboBox1Change(Self);
  end else
  Label29.Visible:=False;
end;

procedure TfrmCalcPrecioArticulo.edtCodMatAdcExit(Sender: TObject);
begin
  if (edtCodMatAdc.Text = '') then exit;
  if not dmPanaderia.qryInvLookupIngrediente.Locate('CODIGO_BARRA',edtCodMatAdc.Text,[loCaseInsensitive]) then
  begin
    MessageDlg('Codigo no existe, verifique.',mtWarning, [mbok],0);
    exit;
  end;
  if CheckBox1.Checked then
  SpeedButton1Click(Self);
  if showing then
  btnSalvar.SetFocus;
end;

procedure TfrmCalcPrecioArticulo.BitBtn16Click(Sender: TObject);
begin
  if (dmPanaderia.tblPrecioCuadrosMastSTATUS.Value = 'R') then exit;
  if dmPanaderia.tblPrecioCuadrosMast.state = dsInactive then
  dmPanaderia.tblPrecioCuadrosMast.Open;
  _EsGregarNuevo:=True;

  xcodCte:=dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value;
{  dmPanaderia.tblPrecioCuadrosMast.Append;
  dmPanaderia.tblPrecioCuadrosMastSTATUS.Value:='A';

  if dmPanaderia.tblPrecioCuadrosMastNUMERO.IsNull then
  begin
    dmPanaderia.tblPrecioCuadrosMast.Append;
    dmPanaderia.tblPrecioCuadrosMastSTATUS.Value:='A';
    GlbSalvarQuery(dmPanaderia.tblPrecioCuadrosMast);
    dmPanaderia.tblPrecioCuadrosNUMERO_MAST.Value:=dmPanaderia.tblPrecioCuadrosMastNUMERO.Value;
  end else
  dmPanaderia.tblPrecioCuadrosNUMERO_MAST.Value:=dmPanaderia.tblPrecioCuadrosMastNUMERO.Value;
 }
 btnInsertarClick(Self); 
end;



procedure TfrmCalcPrecioArticulo.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if dmPanaderia.tblPrecioCuadrosMast.state = dsbrowse then
  dmPanaderia.tblPrecioCuadrosMast.Edit;

  if (dmPanaderia.tblPrecioCuadrosMastSTATUS.Value = 'A') then
  dmPanaderia.tblPrecioCuadrosMastCODIGO_CTE.Value :=  dmPanaderia.tblPrecioCuadrosCODIGO_CTE.Value;

end;

procedure TfrmCalcPrecioArticulo.ProcRefrescar;
begin
  if dmPanaderia.tblPrecioCuadros.State in [dsInactive, dsBrowse] then
  begin
    dmPanaderia.tblPrecioCuadros.Close;
    dmPanaderia.tblPrecioCuadros.open;
    dmPanaderia.tblIngredienteTrabCuadros.Close;
    if dmPanaderia.tblPrecioCuadros.RecordCount > 0 then
    begin
      if not dmPanaderia.tblPrecioCuadrosNumero.IsNull then
      begin
        dmPanaderia.tblPrecioCuadros.Next;
        dmPanaderia.tblPrecioCuadros.Prior;
      end;
    end;
  end;
  dmPanaderia.qryBuscarProd.close;
  dmPanaderia.qryBuscarProd.open;
  dmPanaderia.qryInvMatDesc.close;
  dmPanaderia.qryInvMatDesc.open;
  dmPanaderia.qryTotalPrecioCuadros.Close;
  dmPanaderia.qryTotalPrecioCuadros.Params[0].Value:= dmPanaderia.tblPrecioCuadrosNUMERO_MAST.Value;
  dmPanaderia.qryTotalPrecioCuadros.Open;
end;

end.


