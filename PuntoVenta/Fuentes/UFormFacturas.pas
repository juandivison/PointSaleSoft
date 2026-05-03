unit UFormFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DBCtrls, EditNew,
  ShellAPI, db, ComCtrls, WinSkinData, Mask, IBCustomDataSet, IBQuery, IBSQL, Menus;

type
  TfrmConsultaFacturas = class(TForm)
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    EditN1: TEditN;
    DBText1: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cboxClientes: TComboBox;
    Label5: TLabel;
    edtCodCte: TEditN;
    Label6: TLabel;
    SkinData1: TSkinData;
    rdgContado: TRadioButton;
    rdgCredito: TRadioButton;
    lblFactTieneDevolucion: TLabel;
    DBEdit1: TDBEdit;
    BitBtn4: TBitBtn;
    chkExportaPDF: TCheckBox;
    BitBtn5: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    btnCrearNCR: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    rdgNotaCR: TRadioButton;
    btbtnEditaFactVocado: TBitBtn;
    Label7: TLabel;
    edtNumConduce: TEditN;
    CheckBox2: TCheckBox;
    BitBtn8: TBitBtn;
    qryUltFact: TIBQuery;
    qryUltFactNUMFACTMAX: TFloatField;
    BitBtn13: TBitBtn;
    ibsqlFacturas: TIBSQL;
    ibsqlUpdatDatosVeh: TIBSQL;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesCIA_KEY: TIntegerField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    BitBtn14: TBitBtn;
    qryEmpleado: TIBQuery;
    qryEmpleadoNOMBREVENDEDOR: TIBStringField;
    qryEmpleadoCODIGO: TIntegerField;
    qryLogoTipoAfiliado: TIBQuery;
    qryLogoTipoAfiliadoIDTIPO: TIntegerField;
    qryLogoTipoAfiliadoRUTA_LOGO: TIBStringField;
    qryLogoTipoAfiliadoDESCRIPCION: TIBStringField;
    BitBtn15: TBitBtn;
    MainMenu1: TMainMenu;
    Opciones1: TMenuItem;
    Consultarpago1: TMenuItem;
    DBText3: TDBText;
    Label8: TLabel;
    EditarMontoPagado1: TMenuItem;
    lblDetPago: TLabel;
    tblDetallePagos: TIBDataSet;
    tblDetallePagosSERIE: TIntegerField;
    tblDetallePagosFECHA: TDateTimeField;
    tblDetallePagosTIPO_TARJETA: TSmallintField;
    tblDetallePagosNUMERO_TARJETA_CRED: TIBStringField;
    tblDetallePagosANO_VENCE: TIntegerField;
    tblDetallePagosMES_VENCE: TSmallintField;
    tblDetallePagosMONTO_PAGADO: TFloatField;
    tblDetallePagosNUMERO_APROBACION: TIBStringField;
    tblDetallePagosTIPO: TSmallintField;
    tblDetallePagosCODIGO_PROVEEDOR: TSmallintField;
    tblDetallePagosTIPO_PAGO: TSmallintField;
    tblDetallePagosNUMERO_CHEQUE: TIntegerField;
    tblDetallePagosCOD_BANCO_CHEQUE: TIntegerField;
    tblDetallePagosSERIE_TRN: TIntegerField;
    tblDetallePagosAREA_TRANS: TSmallintField;
    tblDetallePagosNUMERO_CUPON: TIntegerField;
    tblDetallePagosPAGO: TSmallintField;
    AutoAutualizaFPago1: TMenuItem;
    Label9: TLabel;
    Button1: TButton;
    SolicitareCFDGII1: TMenuItem;
    ieneECF1: TMenuItem;
    ConsultaTimbreeCF1: TMenuItem;
    Label10: TLabel;
    AsignareCFSerieE1: TMenuItem;
    OpcioneseCF1: TMenuItem;
    Reenviar1: TMenuItem;
    ChequearCert1: TMenuItem;
    RefrescarCert1: TMenuItem;
    DBText4: TDBText;
    CambiarTipoECF1: TMenuItem;
    qryClientesRNC_NUMERO: TIBStringField;
    eNCFAsignados1: TMenuItem;
    edtMonto: TEdit;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn16: TBitBtn;
    CartadeRuta1: TMenuItem;
    CartadeSaldo1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboxClientesChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure RxDBGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure RxDBGrid2GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure btnCrearNCRClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btbtnEditaFactVocadoClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure Consultarpago1Click(Sender: TObject);
    procedure EditarMontoPagado1Click(Sender: TObject);
    procedure AutoAutualizaFPago1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SolicitareCFDGII1Click(Sender: TObject);
    procedure ieneECF1Click(Sender: TObject);
    procedure ConsultaTimbreeCF1Click(Sender: TObject);
    procedure AsignareCFSerieE1Click(Sender: TObject);
    procedure RefrescarCert1Click(Sender: TObject);
    procedure ChequearCert1Click(Sender: TObject);
    procedure Reenviar1Click(Sender: TObject);
    procedure CambiarTipoECF1Click(Sender: TObject);
    procedure eNCFAsignados1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure CartadeSaldo1Click(Sender: TObject);
  private
    { Private declarations }
    procedure VerificaVendedor;
    Function VerificaClave:Boolean;
    procedure ReimprimirFacturaNoFiscal(numTRN : Integer);
    procedure ProcSetPathlogoTipoServicio(tipo:smallint);
    procedure ProcInsertarDetEfectivo(numtrn: integer;fpago:integer;monto:currency);
    procedure DgiiSolicitareCF(numerotrn: integer);
    procedure DgiiReenviarECF(ANumeroTrn: Integer; const AEncf: string);
    procedure DgiiRefrescarCertificado(ANumeroTrn: Integer);
    procedure DgiiVerificarCertificado;
    function GetCurrentEcfEstado: string;
    procedure UpdateEcfUi;
    function CrearVentaCreditoDesdeConsumo(
    ATrnConsumo: Integer; const ARNC, ANombre: string;codcte:integer): Integer;
    function CrearNotaCreditoAnulacion(ATrnConsumo: Integer;codcte:integer): Integer;
    function CapturarRNCComprador(var ARNC, ANombre: string; var codcte:integer): Boolean;
  public
    { Public declarations }
    EsReimprimirContado : Boolean;
    EsActualizaConduce : Boolean;
    NumTrnVenta : Integer;
    procedure Convertir_Modo0_CambiarE32porE31(ds: TIBDataSet;codcte:integer);
    procedure Convertir_Modo1_NuevaE31_mas_NC(ds: TIBDataSet;codcte:integer;
    oldTrn: Integer;tipoEcf: string;rnc, nombre: string);
  end;

var
  FiltrarSoloMonto:Boolean = false;
  frmConsultaFacturas: TfrmConsultaFacturas;

implementation
USES UDatModFactura, uglobal, UDatModClientes, UFormCambiarCteFact,
  UProcVentaRapida, UFormCrearNotaCRVta, UDatmodDatosGenerales,
  UDatosVentas, UFormVocadosDet, UDatModVehiculo, UFormDatosVentaVeh,
  UDatModConectar, UFormEntreClave, UFormExportDBGridToHTML,
  UConvertirDBGridToHTML, UDatModCompania, UDatModReportes,
  UQckFactServ8_5_SAMNewM, UQckFactServ8_5_SAM, UQckFactServ8_5_SAMNew,
  UFormAsignarNCFAVenta, UDatModCxc, UFormPagosCombinados,
  UDatModPagoTarjeta, UFormUpdateMontopagado, UUtilecf, UUtilecftimbre,
  UfrmlECF_TIMBRE_LOG, UFormAsignareCFAVentasSineCF, UModoConsumoToCredito,
  UBuscarClientesPersonasP, UFormNCFAsignados, USetClaveMaestra,
  UFrmCartaRutaTemplate, UFrmCartaSaldoTemplate;
{$R *.dfm}

procedure TfrmConsultaFacturas.BitBtn1Click(Sender: TObject);
var
  edtMontoquery : string;
begin
  dmFactura.qryVentaFactura.Close;
  edtMontoquery:='';
  if (edtMonto.Text <> '') and not FiltrarSoloMonto then
  begin
    edtMontoquery:=' and ventas_mast.VALOR_TOTAL_DET = '+edtMonto.Text;
  end else
  if FiltrarSoloMonto and (edtMonto.Text <> '') then
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryDatosDevolucionNCR_0.SQL.Text+
  ' Where ('+edtMonto.text+' >= (ventas_mast.VALOR_TOTAL_DET-1) and '+
  edtMonto.text+' <= (ventas_mast.VALOR_TOTAL_DET+1))'+
  ' order by ventas_mast.numero'
  else
  if rdgNotaCR.Checked then
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryDatosDevolucionNCR_0.SQL.Text+
  ' Where ventas_mast.FORMA_PAGO = 6 '+edtMontoquery+' order by ventas_mast.numero'
  else
  if rdgCredito.Checked then
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentaFactura_0.SQL.Text+
  ' Where facturas.NUMERO is not null and ventas_mast.FORMA_PAGO = 7'
  +edtMontoquery+' order by ventas_mast.numero'
  else
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text+
  ' Where VENTAS_MAST.NUMERO_DOC_PAGO is not null and '+
  ' ventas_mast.FORMA_PAGO <> 7 '+edtMontoquery+' order by ventas_mast.numero';

  if (EsActualizaConduce) then
  begin
    dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text +
      ' Where VENTAS_MAST.numero =:numero And ventas_mast.cia_key =:ciakey '+
      'and ventas_mast.FORMA_PAGO <> 7 ';

      dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
      ' order by ventas_mast.numero';
      //edtNumConduce
      dmFactura.qryVentaFactura.Params[0].AsInteger:= editn1.ValueInteger;
      dmFactura.qryVentaFactura.Params[1].AsInteger:= glbCia_Key;
      dmFactura.qryVentaFactura.Open;
  end else
  if CheckBox1.Checked then
  begin
    dmFactura.qryVentaFactura.Open;
  end else
  //buscar por conduce  ******
  if (edtNumConduce.ValueInteger > 0) then
  begin
    if (edtCodCte.Text = '') then
    begin
      if rdgNotaCR.Checked then
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryDatosDevolucionNCR_0.SQL.Text +
      ' Where VENTAS_MAST.numero =:numero and '+
      ' And ventas_mast.cia_key =:ciakey and ventas_mast.FORMA_PAGO = 6 '
      +edtMontoquery
      else
      if rdgCredito.Checked then
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text + ' Where facturas.NUMERO =:numero and ventas_mast.FORMA_PAGO = 7 '+
      ' And ventas_mast.cia_key =:ciakey'+edtMontoquery
      else
      dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text +
      ' Where VENTAS_MAST.numero =:numero And ventas_mast.cia_key =:ciakey '+
      'and ventas_mast.FORMA_PAGO <> 7 '+edtMontoquery;

      dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
      ' order by ventas_mast.numero';
      
      dmFactura.qryVentaFactura.Params[0].AsInteger:= edtNumConduce.ValueInteger;
      dmFactura.qryVentaFactura.Params[1].AsInteger:= glbCia_Key;
    end else
    begin
      if edtCodCte.ValueInteger > 0 then
      begin
        if rdgNotaCR.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryDatosDevolucionNCR_0.SQL.Text +
        ' Where VENTAS_MAST.numero =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
        ' and ventas_mast.FORMA_PAGO = 6 '+edtMontoquery
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.numero =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
        ' and ventas_mast.FORMA_PAGO = 7'+edtMontoquery
        else
        begin
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentacontado_0.SQL.Text + ' Where VENTAS_MAST.numero =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey '+
        ' and ventas_mast.FORMA_PAGO <> 7'+edtMontoquery;
        dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
        ' order by ventas_mast.numero';        
        dmFactura.qryVentaFactura.Params[0].AsInteger:= edtNumConduce.ValueInteger;
        dmFactura.qryVentaFactura.Params[1].AsInteger:= edtCodCte.ValueInteger;
        dmFactura.qryVentaFactura.Params[2].AsInteger:= glbCia_Key;

        end;
      end else
      begin
        if rdgNotaCR.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryDatosDevolucionNCR_0.SQL.Text + ' Where '+
        'VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey'+
        ' and ventas_mast.FORMA_PAGO = 6 '+edtMontoquery
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
        'VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey'+
        ' and ventas_mast.FORMA_PAGO = 7 '+edtMontoquery
        else
          dmFactura.qryVentaFactura.SQL.Text :=
          dmFactura.qryVentacontado_0.SQL.Text +
          ' Where VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey  '+
          ' and ventas_mast.FORMA_PAGO <> 7'+edtMontoquery;

          dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
          ' order by ventas_mast.numero';

        dmFactura.qryVentaFactura.Params[0].AsInteger := edtCodCte.ValueInteger;
        dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      end;
    end;
    dmFactura.qryVentaFactura.Open;
  end else
  if (EditN1.ValueInteger > 0) then
  begin
    if (edtCodCte.Text = '') then
    begin
      if rdgNotaCR.Checked then
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryDatosDevolucionNCR_0.SQL.Text +
      ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero and '+
      ' And ventas_mast.cia_key =:ciakey and ventas_mast.FORMA_PAGO = 6'+edtMontoquery
      else
      if rdgCredito.Checked then
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text +
      ' Where facturas.NUMERO =:numero and ventas_mast.FORMA_PAGO = 7 '+
      ' And ventas_mast.cia_key =:ciakey'+edtMontoquery
      else
      dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text +
      ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero And ventas_mast.cia_key =:ciakey '+
      'and ventas_mast.FORMA_PAGO <> 7 '+edtMontoquery;

      dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
      ' order by ventas_mast.numero';
      
      dmFactura.qryVentaFactura.Params[0].AsInteger:= editn1.ValueInteger;
      dmFactura.qryVentaFactura.Params[1].AsInteger:= glbCia_Key;
    end else
    begin
      if edtCodCte.ValueInteger > 0 then
      begin
        if rdgNotaCR.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryDatosDevolucionNCR_0.SQL.Text +
        ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
        ' and ventas_mast.FORMA_PAGO = 6'+edtMontoquery
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
        ' and ventas_mast.FORMA_PAGO = 7'+edtMontoquery
        else
        begin
          dmFactura.qryVentaFactura.SQL.Text:=
          dmFactura.qryVentacontado_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero '+
          ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey '+
          ' and ventas_mast.FORMA_PAGO <> 7'+edtMontoquery;
          dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
          ' order by ventas_mast.numero';
          dmFactura.qryVentaFactura.Params[0].AsInteger:= editn1.ValueInteger;
          dmFactura.qryVentaFactura.Params[1].AsInteger:= edtCodCte.ValueInteger;
          dmFactura.qryVentaFactura.Params[2].AsInteger:= glbCia_Key;
        end;
      end else
      begin
        if rdgNotaCR.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryDatosDevolucionNCR_0.SQL.Text + ' Where '+
        'VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey'+
        ' and ventas_mast.FORMA_PAGO = 6 '+edtMontoquery
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
        'VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey'+
        ' and ventas_mast.FORMA_PAGO = 7 '+edtMontoquery
        else
          dmFactura.qryVentaFactura.SQL.Text :=
          dmFactura.qryVentacontado_0.SQL.Text +
          ' Where VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey  '+
          ' and ventas_mast.FORMA_PAGO <> 7'+edtMontoquery;

          dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
          ' order by ventas_mast.numero';

        dmFactura.qryVentaFactura.Params[0].AsInteger := edtCodCte.ValueInteger;
        dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
      end;
    end;
    dmFactura.qryVentaFactura.Open;
  end else
  if edtCodCte.ValueInteger > 0 then
  begin
    if rdgNotaCR.Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryDatosDevolucionNCR_0.SQL.Text + ' Where '+
    'ventas_mast.FORMA_PAGO = 6 '+
    'And VENTAS_MAST.Codigo_cte =:codcte '+
    'And ventas_mast.cia_key =:ciakey'+edtMontoquery else
    if rdgCredito.Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
    'Facturas.NUMERO is not null and ventas_mast.FORMA_PAGO = 7'+
    ' and VENTAS_MAST.Codigo_cte =:codcte '+
    'And ventas_mast.cia_key =:ciakey'+edtMontoquery else
    dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text + ' Where '+
    'VENTAS_MAST.NUMERO_DOC_PAGO is not null and ventas_mast.FORMA_PAGO <> 7'+
    ' and VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey'+edtMontoquery;

    dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
    ' order by ventas_mast.numero';
    dmFactura.qryVentaFactura.Params[0].AsInteger := edtCodCte.ValueInteger;
    dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
    dmFactura.qryVentaFactura.Open;
  end else
  if (edtMonto.Text = '') then
  begin
    if rdgNotaCR.Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryDatosDevolucionNCR_0.SQL.Text + ' Where VENTAS_MAST.fecha =:fecha '+
    ' And ventas_mast.FORMA_PAGO = 6'+
    ' And ventas_mast.cia_key =:ciakey'+edtMontoquery else
    if rdgCredito.Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.fecha =:fecha '+
    ' And Facturas.NUMERO is not null and ventas_mast.FORMA_PAGO = 7'+
    ' And ventas_mast.cia_key =:ciakey'+edtMontoquery else
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryVentacontado_0.SQL.Text + ' Where VENTAS_MAST.fecha =:fecha '+
    ' And VENTAS_MAST.NUMERO_DOC_PAGO Is Not Null And ventas_mast.FORMA_PAGO <> 7'+
    ' And ventas_mast.cia_key =:ciakey'+edtMontoquery;

    dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
    ' order by ventas_mast.numero';
    dmFactura.qryVentaFactura.Params[0].AsDateTime := ExtraerFecha(DateTimePicker1.Date);
    dmFactura.qryVentaFactura.Params[1].AsInteger  := glbCia_Key;
    dmFactura.qryVentaFactura.Open;

  end;
  dmFactura.qryDatosTrncxc.Close;  //dmFactura.qryVentaFactura.RecordCount;

  if Assigned(frmProcVentaRapida) then
  begin
    if frmProcVentaRapida.esContado then
    dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
    else
    dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
  end else
  begin
    if rdgContado.Checked then
    dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 2
    else
    dmFactura.qryDatosTrncxc.Params[0].AsInteger:= 1;
  end;
  dmFactura.qryDatosTrncxc.Params[1].AsInteger:= dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
  //dmFactura.qryDatosTrncxc.Params[1].AsInteger:= glbCia_Key;
  dmFactura.qryDatosTrncxc.Open;
  NumTrnVenta:=dmfactura.qryVentaFacturaNUMERO.Value;

  dmFactura.qryFactTieneDevolucion.Close;
  dmFactura.qryFactTieneDevolucion.Params[0].Value:= EditN1.ValueInteger;//dmFactura.qryVentaFactura.sql.text
  dmFactura.qryFactTieneDevolucion.Params[1].Value:= dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
  dmFactura.qryFactTieneDevolucion.Open;

  if dmFactura.qryFactTieneDevolucion.RecordCount > 0 then
  lblFactTieneDevolucion.Visible := True
  else
  lblFactTieneDevolucion.Visible := False;
  if dmFactura.qryVentaFactura.State = dsInactive then
  dmFactura.qryVentaFactura.Open;
  dmFactura.qryVentaFactura.Last;
  dmfactura.qryDetPagos.Close;
  dmfactura.qryDetPagos.Params[0].value:=dmFactura.qryVentaFacturaNumero.value;
  dmfactura.qryDetPagos.Open;
end;

procedure TfrmConsultaFacturas.FormCreate(Sender: TObject);
begin
  if (GlbActivaECF = 0) then
  begin
    ieneECF1.Visible:=False;
    Button1.Visible:=False;
    OpcioneseCF1.Enabled:=False;
    AsignareCFSerieE1.Enabled:=false;
  end;
  
  if  glbSam = 0 then
  BitBtn14.Visible:=false;
  
  if (GlBLimao = 1) or (GlBInMobi = 1) then
  begin
    btbtnEditaFactVocado.Visible:=True;
  end;
  DateTimePicker1.Date := GlbFechaTrnDiaria;
  qryClientes.Close;
  qryClientes.Open;
  qryClientes.First;
  While Not qryClientes.Eof do
  begin
    cboxClientes.Items.Add(qryClientesNOMBRE_FACTURAR.Value);
    qryClientes.Next;
  end;
  if dmFactura.qryVentaFactura.State = dsbrowse then
  dmFactura.qryVentaFactura.Last;
  Refresh;
end;
  //URepRecibo8x5_5
procedure TfrmConsultaFacturas.cboxClientesChange(Sender: TObject);
begin
  if qryClientes.Locate('NOMBRE_FACTURAR', cboxClientes.Text,[]) then
  edtCodCte.SetInteger(qryClientesCODIGO_CTE.Value);
end;

procedure TfrmConsultaFacturas.DBEdit1Change(Sender: TObject);
begin
  if (frmConsultaFacturas = nil)  then exit;
  if dmFactura.qryFactTieneDevolucion.Params.Count < 2 then exit;
  dmFactura.qryFactTieneDevolucion.Close;
  dmFactura.qryFactTieneDevolucion.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
  dmFactura.qryFactTieneDevolucion.Params[1].Value:= dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value;
  dmFactura.qryFactTieneDevolucion.Open;
  if dmFactura.qryFactTieneDevolucion.RecordCount > 0 then
    lblFactTieneDevolucion.Visible := True
  else
  lblFactTieneDevolucion.Visible := False;
end;

procedure TfrmConsultaFacturas.RxDBGrid1CellClick(Column: TColumn);
begin
  DBEdit1Change(Self);
end;

procedure TfrmConsultaFacturas.RxDBGrid1Enter(Sender: TObject);
begin
  DBEdit1Change(Self);
  UpdateEcfUi;
end;

procedure TfrmConsultaFacturas.RxDBGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DBEdit1Change(Self);
end;

procedure TfrmConsultaFacturas.BitBtn4Click(Sender: TObject);
begin
  if (dmFactura.qryVentaFacturaSTATUS.Value[1] in ['C','R']) then
  begin
    MessageDlg('Factura no está activa, verifique.',mtError,[mbok],0);
    Exit;
  end;
  
  if (Not dmFactura.qryVentaFacturaFORMA_PAGO.Value In [7,8] ) then
  begin
    MessageDlg('Solo aplica para facturas a crédito, verifique.', mtError, [mbOk], 0);
    Exit;
  end;
  frmCambiarCteFact:=TfrmCambiarCteFact.Create(Nil);
  try
    frmCambiarCteFact.labelNombreActual.Caption := dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value;
    frmCambiarCteFact.labelNumFactura.Caption   := dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString;
    if frmCambiarCteFact.Showmodal = mrOk  then
    begin
   { update VENTAS_MAST
     set
     CODIGO_CTE = :CODIGO_CTE
     where
     CODIGO_CTE = :OLD_CODIGO_CTE and
     MONEDA = :OLD_MONEDA and
    NUMERO_FACTURA = :OLD_NUMERO_FACTURA
   }
      //if dmfactura.qryUpdateVentasMast.Open then
      dmfactura.qryUpdateVentasMast.Close;
      dmfactura.qryUpdateVentasMast.Params[0].Value:=dmFactura.qryVentaFacturaCODIGO_CTE.Value;
      dmfactura.qryUpdateVentasMast.Params[1].Value:=dmFactura.qryVentaFacturaMONEDA.Value;
      dmfactura.qryUpdateVentasMast.Params[2].Value:=dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      dmfactura.qryUpdateVentasMast.Params[3].Value:=dmFactura.qryVentaFacturaNUMERO.Value;
      dmfactura.qryUpdateVentasMast.Open;
      if frmCambiarCteFact.edtCodCte.ValueInteger > 0 then
      begin
        if Not frmProcVentaRapida.VerificaLimiteCredito(
               frmCambiarCteFact.edtCodCte.ValueInteger,
               dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value) then
        begin
          if frmProcVentaRapida.NoTieneCredito then
          MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
          else
          MessageDlg('Balance CXC excede limite de crédito.', mtWarning, [mbOK], 0);
          Exit;
        end;

        if dmfactura.qryUpdateVentasMast.RecordCount > 0 then
        dmfactura.qryUpdateVentasMast.Edit;
        if (dmfactura.qryUpdateVentasMast.State = dsEdit) then
        begin
          dmfactura.qryUpdateVentasMastCODIGO_CTE.Value:=frmCambiarCteFact.edtCodCte.ValueInteger;
          GlbSalvarQuery(dmfactura.qryUpdateVentasMast);
          MessageDlg('Cliente cambiado, verifique.',mtInformation,[mbok],0);
          dmfactura.qryUpdateVentasMast.Close;
          dmclientes.qryClientes.Close;
          BitBtn1Click(Self);
        end else
        MessageDlg('Parametros no coinciden con ninguna factura, verifique.',mtInformation,[mbok],0);
      end;
    end;
  finally
  frmCambiarCteFact.Free;
  frmCambiarCteFact:=Nil;
  end;
end;

procedure TfrmConsultaFacturas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(frmProcVentaRapida) then
  frmProcVentaRapida.NoTieneCredito:=False;
  NumTrnVenta:=dmfactura.qryVentaFacturaNUMERO.Value;
  dmDatos.qryMembrete.Close;
  dmDatos.qryMembrete.Params[0].Value:= glbCia_Key;
  dmDatos.qryMembrete.Open;
end;

procedure TfrmConsultaFacturas.BitBtn5Click(Sender: TObject);
begin
  if (dmFactura.qryVentaFacturaSTATUS.Value[1] in ['C','R']) then
  begin
    MessageDlg('Factura no está activa, no puede ser modificada.',mtInformation,[mbok],0);
    exit;
  end;

  if MessageDlg('Desea cancelar factura?',mtWarning,[mbyes, mbno],0) = mrYes then
  begin
    dmfactura.qryVerificaFact.Close;
    dmfactura.qryVerificaFact.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
    dmfactura.qryVerificaFact.Params[1].Value:= dmfactura.qryVentaFacturaCODIGO_CTE.Value;
    dmfactura.qryVerificaFact.Open;

    if (dmfactura.qryVerificaFact.RecordCount > 1) then
    begin
      MessageDlg('Esta factura, tiene movimientos en CXC, no será cancelada, verifique.',mtWarning,[mbok],0);
      exit;
    end else
    begin
      dmFactura.ibStpCancelaFactura.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO_FACTURA.Value;
      dmFactura.ibStpCancelaFactura.ExecProc;
      try
        if not dmFactura.ibStpCancelaFactura.Transaction.InTransaction then
        dmFactura.ibStpCancelaFactura.Transaction.StartTransaction;
        
        dmFactura.ibStpCancelaFactura.Transaction.CommitRetaining;
      except
      dmFactura.ibStpCancelaFactura.Transaction.RollbackRetaining;
      end;
      MessageDlg('Factura Cancelada',mtWarning,[mbok],0);
      BitBtn1Click(Self);
    end;
    //PROC_CANCELA_FACTURA
  end;
end;

procedure TfrmConsultaFacturas.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  Label10.Visible:=False;
  if (dmfactura.qryDetPagos.params[0].Value <> dmfactura.qryVentaFacturaNUMERO.Value) then
  begin
    dmfactura.qryDetPagos.Close;
    dmfactura.qryDetPagos.Params[0].Value:=dmfactura.qryVentaFacturaNUMERO.Value;
    dmfactura.qryDetPagos.Open;
  end;
  if  (dmfactura.qryVentaFacturaSTATUS.Value = 'C') then
  Background:=clGray
  else
  if (GlbActivaECF = 1) and dmfactura.qryVentaFacturaSERIE_NCF_ASIGNADO.IsNull then
  begin
    //$0080FFFF  ---Amarillo
    BackGround:=$00CFAAA9;//gris //no tiene eCF-NCF
    Label10.Visible:=True;
  end
  else
     if (dmfactura.qryDetPagos.RecordCount = 0) and
     not (dmfactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,6] ) then
  begin
    if (GlbActivaECF = 1) and dmfactura.qryVentaFacturaSERIE_NCF_ASIGNADO.IsNull then
    begin
      BackGround:=$0080FFFF; //no tiene eCF-NCF
      Label10.Visible:=True;
    end else
    BackGround:=$0091F7F1;
    lblDetPago.Visible:=True;
    if (dmfactura.qryVentaFacturaFORMA_PAGO.Value = 1) then
    begin
      if AutoAutualizaFPago1.Checked then
      begin
        ProcInsertarDetEfectivo(dmfactura.qryVentaFacturanumero.Value,dmfactura.qryVentaFacturaFORMA_PAGO.Value,dmfactura.qryVentaFacturaVALOR_TOTAL_DET.Value);
        LogInformacionTxt('Pago Efectivo actualizado. #Trn:'+dmfactura.qryVentaFacturanumero.AsString+' Monto:'+dmfactura.qryVentaFacturaVALOR_TOTAL_DET.AsString);
      end;
    end;
  end
  else
  begin
    lblDetPago.Visible:=False;
    BackGround:=clWindow;
  end;
end;

procedure TfrmConsultaFacturas.RxDBGrid2GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  Label9.Visible:=False;
  if  (dmFactura.qryVentaFacturaDetSTATUS_DET.Value = 'C') then
  Background:=clGray
  else
  if (Field.FieldName = 'LEVEL_PRECIO_VENTA') And dmFactura.qryVentaFacturaDetLevel_precio_Venta.IsNull then
  begin
    background:=$00BDECE9;
    Label9.Visible:=True
  end;
end;

procedure TfrmConsultaFacturas.BitBtn9Click(Sender: TObject);
begin
  dmFactura.qryVentaFactura.First;
  UpdateEcfUi;
end;

procedure TfrmConsultaFacturas.BitBtn10Click(Sender: TObject);
begin
  if dmFactura.qryVentaFactura.State = dsBrowse then
  dmFactura.qryVentaFactura.Prior;
  UpdateEcfUi;
end;

procedure TfrmConsultaFacturas.BitBtn11Click(Sender: TObject);
begin
  dmFactura.qryVentaFactura.Next;
  UpdateEcfUi;
end;

procedure TfrmConsultaFacturas.BitBtn12Click(Sender: TObject);
begin
  if dmFactura.qryVentaFactura.State = dsBrowse then
  dmFactura.qryVentaFactura.Last;
  UpdateEcfUi;
end;

procedure TfrmConsultaFacturas.btnCrearNCRClick(Sender: TObject);
begin
  //no en uso

  {if RxDBGrid2.SelectedRows.Count = 0 then
  begin
    if MessageDlg('Desea crear NCR a todos los productos?',mtInformation,[mbyes, mbno], 0) = mryes then
    RxDBGrid2.SelectAll;
  end;
  frmCrearNotaCreditoVta:=TfrmCrearNotaCreditoVta.Create(Nil);
  try
    frmCrearNotaCreditoVta.AsignarSqlText('','','');
    frmCrearNotaCreditoVta.CargarDatos;
    frmCrearNotaCreditoVta.ShowModal;
  finally
  frmCrearNotaCreditoVta.Free;
  frmCrearNotaCreditoVta:=Nil;
  end;}
end;

procedure TfrmConsultaFacturas.BitBtn6Click(Sender: TObject);
begin
  DateTimePicker1.Date := DateTimePicker1.Date + 1;
  BitBtn1Click(Self);
end;

procedure TfrmConsultaFacturas.BitBtn7Click(Sender: TObject);
begin
  DateTimePicker1.Date := DateTimePicker1.Date - 1;
    BitBtn1Click(Self);
end;

procedure TfrmConsultaFacturas.btbtnEditaFactVocadoClick(Sender: TObject);
begin
  if (GlBLimao = 0) and (GlBInMobi = 0) then Exit;

  if not (dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8]) then Exit;
  dmVentas.tblVentaVocados.Close;
  dmVentas.tblVentaVocados.Params[0].Value:= dmFactura.qryVentaFacturaNUMERO.Value;
  dmVentas.tblVentaVocados.Open;
  if dmVentas.tblVentaVocadosNUMERO_TRN.Isnull then
  begin
    dmVentas.tblVentaVocados.Append;
    dmVentas.tblVentaVocadosNUMERO_TRN.Value:= dmFactura.qryVentaFacturaNUMERO.Value;
    //GlbSalvarQuery(dmVentas.tblVentaVocados);
  end;
  frmVocadoDet:=TfrmVocadoDet.Create(Nil);
  try
  frmVocadoDet.ShowModal;
  finally
  frmVocadoDet.Free;
  frmVocadoDet:=Nil;
  end;
end;

procedure TfrmConsultaFacturas.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  RxDBGrid2.SelectAll
  else RxDBGrid2.UnselectAll;
end;

procedure TfrmConsultaFacturas.VerificaVendedor;
begin
  if dmFactura.qryVentaFactura.State = dsInactive then exit;
   dmFactura.qryClientesVendedor.Close;
   dmFactura.qryClientesVendedor.Open;
   if dmFactura.qryClientesVendedor.Locate('numero',
   dmFactura.qryVentaFacturaNUMERO.Value,[]) then
   begin
     if (dmFactura.qryClientesVendedorCODVENDEDORCTE.Value <>
         dmFactura.qryClientesVendedorCODVENDEDORDC.Value) then
     begin
       MessageDlg('Codigo vendedor en conduce es diferente al asignado en clientes.',
       mtWarning,[mbok],0);
     end;
   end;
end;

procedure TfrmConsultaFacturas.BitBtn8Click(Sender: TObject);
begin
  if (GlbSolicitaDVeh = 1) then
  begin
    dmVehiculo.qryVerificaVehTVta.Close;
    dmVehiculo.qryVerificaVehTVta.Params[0].Value:=dmFactura.qryVentaFacturaNumero.Value;
    dmVehiculo.qryVerificaVehTVta.Open;
    dmVehiculo.qryVerificaVehTVta.First;
    if dmVehiculo.qryVerificaVeh.RecordCount > 0 then
    begin
      MessageDlg('Vehículo/Motor ya esta asignado en otra venta, verifique', mtinformation,[mbok],0);
      exit;
    end;

    if Assigned(frmProcVentaRapida) then
    begin
      frmProcVentaRapida.tblDatosVentaVehiculos.Close;
      frmProcVentaRapida.tblDatosVentaVehiculos.Open;
      frmDatosVentaVehiculos := TfrmDatosVentaVehiculos.Create(Nil);
      try
        frmProcVentaRapida.tblDatosVentaVehiculos.Params[0].Value := dmFactura.qryVentaFacturaNumero.Value;
        frmProcVentaRapida.tblDatosVentaVehiculos.Append;
        frmDatosVentaVehiculos.NumeroVenta := dmFactura.qryVentaFacturaNumero.Value;
        frmProcVentaRapida.tblDatosVentaVehiculosMONTO_INICIAL.Value:= dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value;
        frmDatosVentaVehiculos.Showmodal;
      finally
      frmDatosVentaVehiculos.Free;
      frmDatosVentaVehiculos := Nil;
      end;
    end;
  end;
end;

procedure TfrmConsultaFacturas.FormShow(Sender: TObject);
begin
  if GlbMutur = 1 then
  begin
    BitBtn16.Visible:=True;
    CartadeRuta1.Visible:=True;
    CartadeSaldo1.Visible:=True;
    BitBtn8.Visible:=True
  end else
  begin
    BitBtn16.Visible:=False;
    CartadeRuta1.Visible:=False;
    CartadeSaldo1.Visible:=False;
    BitBtn8.Visible:=False;
  end;
end;

procedure TfrmConsultaFacturas.BitBtn13Click(Sender: TObject);
var
  nF : string;
begin
  if (not VerificaClave) then
  begin
    MessageDlg('Venta no será eliminada, verifique.', mtWarning, [mbOk], 0);
    exit;
  end;
  qryUltFact.Close;
  qryUltFact.Open;
  if rdgCredito.Checked then
  begin
    if (qryUltFactNUMFACTMAX.Value > dmFactura.qryVentaFacturaNUMERO_FACTURA.Value ) then
    begin
      MessageDlg('Existe(n) secuencia(s) de factura mayor, operación no procede.', mtError,[mbOk],0);
      Exit;
    end;

    if MessageDlg('Realmente deseas eliminar la factura numero: '+
    dmFactura.qryVentaFacturaNUMERO_FACTURA.AsString+'.'
    +''#13#10'Un email de notificación será enviado.', mtError,[mbNo, mbYes],0) = mryes then
    begin
//{ temporal
      frmConvertirDbGridToHTML:=TfrmConvertirDbGridToHTML.Create(nil);
      try
        frmConvertirDbGridToHTML.RxDBGrid1:=RxDBGrid2;
        nf:=GlbRutaInformes+'FactCanceladaNumTrn'+dmFactura.qryVentaFacturanumero.AsString+'.htm';
        frmConvertirDbGridToHTML.exportarGridExcel(
        '<br>'+
        'Codigo Cte: '+dmFactura.qryVentaFacturaCODIGO_CTE.AsString+
        '<br>'+
        'Cliente: '+dmFactura.qryVentaFacturaNOMBRE_FACTURAR.Value+','+
        '<br>'+
        'Fecha Factura: '+FormatDateTime('dd/mmm/yyyy', dmFactura.qryVentaFacturaFECHA.Value)+
        '<br>'+
        'Numero Factura: '+dmFactura.qryVentaFacturaNUMEROFACTURA.AsString+
        '<br>'+
        'PC: '+GetPCName+' '+GetOSVersion+
        '<br>'
        ,dmFactura.qryVentaFacturaDet,nf);
      finally
      frmConvertirDbGridToHTML.free;
      frmConvertirDbGridToHTML:=nil;
      end;

      // Exit;//Temporal

      ibsqlFacturas.Params[0].Value:=dmFactura.qryVentaFacturaNUMERO_FACTURA.Value;
      ibsqlFacturas.ExecQuery;

      if Not ibsqlFacturas.Transaction.InTransaction then
         ibsqlFacturas.Transaction.StartTransaction;
         
      try
        ibsqlFacturas.Transaction.CommitRetaining;
      except
      ibsqlFacturas.Transaction.RollbackRetaining;
      end;

      ibsqlUpdatDatosVeh.Close;
      //ibsqlUpdatDatosVeh.Params[0].Value:= indicar chassis
      ibsqlUpdatDatosVeh.ExecQuery;
      try
        if not ibsqlUpdatDatosVeh.Transaction.InTransaction then
        ibsqlUpdatDatosVeh.Transaction.StartTransaction;
        ibsqlUpdatDatosVeh.Transaction.CommitRetaining;
      except
      ibsqlUpdatDatosVeh.Transaction.RollbackRetaining;
      end;
      
      try
      dmVentas.Proc_InsertarKardexDet(
      glbCia_Key,
      1, //TIPO SMALLINT,  --1-Entradas 2-Salida
      3, //TIPO_OPE SMALLINT,--1-Orden Compra 2-Venta 3-Devolucion 4-Transferencia 5-Dañado 6-Donacion 7-Otro
      ExtraerFecha(GlbFechaTrnDiaria),
      dmFactura.qryVentaFacturaDetCODIGO_PROD.AsInteger, //CODIGO_PRODUCTO :integer;
      dmFactura.qryVentaFacturaDetcantidad.Value,
      dmFactura.qryVentaFacturaDetPRECIO_COMPRA.Value, //COSTO_PRODUCTO :real;
      dmFactura.qryVentaFacturaDetPrecio.Value, // PRECIO_VENTA :real;
      VarUsuarioGlb, //CODIGO_USUARIO :integer;
      dmFactura.qryVentaFacturaDetNumero.Value,// NUMERO_TRN_VTA: integer;
      'A' //STATUS :string;
      ,'Venta Cancelada');
      except
      end;
      BitBtn1Click(Self);
    end;
  end;
end;

function TfrmConsultaFacturas.VerificaClave: Boolean;
var
 valorE:String;
begin
  frmEntrreClave:=TfrmentrreClave.Create(nil);
  if frmEntrreClave.showmodal=mrOk then
  Clave:= frmEntrreClave.Edit1.Text
  else Result := False;
  frmentrreClave.Free;
  frmentrreClave:=Nil;
  frmConfClaveMaestra:=TfrmConfClaveMaestra.Create(nil);
   try
     frmConfClaveMaestra.Edit1.Text:=clave;
     //frmConfClaveMaestra.Edit2.Text:=clave;
     frmConfClaveMaestra.Button1Click(self);
     valorE :=frmConfClaveMaestra.Edit2.Text;

   finally
   freeAndNil(frmConfClaveMaestra);
   end;

  if (GlbClaveSup <> valorE) then
  begin
    MessageDlg('Clave incorrecta, verifique', mtError, [mbOK], 0);
    //LogProcedure('Clave incorrecta: GlbClaveSup='+GlbClaveSup+'Input Clave='+Encriptar(Trim(clave), 2005));
    Result := False;
  end else Result := True;
end;

procedure TfrmConsultaFacturas.BitBtn14Click(Sender: TObject);
begin
  qryEmpleado.close;
  qryEmpleado.open;
  qryLogoTipoAfiliado.Close;
  qryLogoTipoAfiliado.Open;

  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
    GlbRutaLogoDoc:='';
    if GetFormatoTipoDoc(1,GlbRutaLogoDoc) then  //2	1	Factura Contado 8.5 Estandar
    GlbDocStandar:=1
    else
    GlbDocStandar:=0;
  dmReportes.qryViewVentasMast.Close;
  dmReportes.qryViewVentasMast.Params[0].Value:=dmfactura.qryVentaFacturaNUMERO.Value;
  dmReportes.qryViewVentasMast.Open;

  ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
                               
  ReimprimirFacturaNoFiscal(dmfactura.qryVentaFacturaNUMERO.Value);

end;

procedure TfrmConsultaFacturas.ReimprimirFacturaNoFiscal(numTRN: Integer);
begin
if (GlBSAM = 1) then
      begin
        dmreportes.qryViewVentasMast.Close;
        dmreportes.qryViewVentasMast.Params[0].Value:= dmfactura.qryVentaFacturaNUMERO.Value;
        dmreportes.qryViewVentasMast.Open;
        ProcSetPathlogoTipoServicio(dmReportes.qryViewVentasMastTIPO_AFILIADO.Value);
        if (GlbUsaFctMexico = 1) then
        begin
          qckFactServ_8_5SAMNewM:=TqckFactServ_8_5SAMNewM.Create(Nil);
          try
            qckFactServ_8_5SAMNewM.rxVendedor.Close;
            qckFactServ_8_5SAMNewM.rxVendedor.Open;
            if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
            begin
              if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
              begin
                qckFactServ_8_5SAMNewM.rxVendedor.Append;
                qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:=
                qryEmpleadoNOMBREVENDEDOR.Value;
                qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
            end else
            begin
              qckFactServ_8_5SAMNewM.rxVendedor.Close;
              qckFactServ_8_5SAMNewM.rxVendedor.Open;
              qckFactServ_8_5SAMNewM.rxVendedor.Append;
              qckFactServ_8_5SAMNewM.rxVendedorNombreVendedor.Value:='';
              qckFactServ_8_5SAMNewM.rxVendedor.Post;
              end;
              qckFactServ_8_5SAMNewM.TPag.Caption:=
              IntToStr(qckFactServ_8_5SAMNewM.PageNumber);
              qckFactServ_8_5SAMNewM.xtipoVenta := TipoVenta;
              //qckFactServ_8_5SAMNewM.valorNCF:= valorNCF;
              if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
              begin
                qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS Exonerado';
              end  else
              qckFactServ_8_5SAMNewM.QRLabel25.Caption :='ITBIS';

              if (GlbImpReciboSinPreg = 1) then
              qckFactServ_8_5SAMNewM.Print
              else
              if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
              begin
                //qckFactServ_8_5SAMNewM.QRImage2.Enabled:= False;
                qckFactServ_8_5SAMNewM.PrinterSetup;
                qckFactServ_8_5SAMNewM.Print;
              end else
              qckFactServ_8_5SAMNewM.Preview;

              //if (GlbImpReciboSinPreg = 0) then
              //if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
              //begin
              //  qckFactServ_8_5SAMNewM.Preview;
              //end;
             if GlbImpPDF and chkExportaPDF.Checked then
             begin
               if not dmReportes.qryViewVentasMastNUMERO_FACTURA.IsNull then
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaRecibos+'\ReciboNum'+IntToStr(dmReportes.qryViewVentasMastNUMERO_FACTURA.Value)+'.pdf')
               else
               ReportExportPDF(qckFactServ_8_5SAMNewM,GlbRutaFacturas+'\FacturaNum'+IntToStr(dmReportes.qryViewVentasMastNUMERO_DOC_PAGO.AsInteger)+'.pdf')
             end;
          finally
          qckFactServ_8_5SAMNewM.Free;
          qckFactServ_8_5SAMNewM:=Nil;
          end;
        end else
        if (GLBFORMATOFACTPREIMP = 0) then
        begin
        qckFactServ_8_5SAM:=TqckFactServ_8_5SAM.Create(Nil);
        try
          qckFactServ_8_5SAM.rxVendedor.Close;
          qckFactServ_8_5SAM.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAM.rxVendedor.Append;
              qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:=
              qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAM.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAM.rxVendedor.Close;
            qckFactServ_8_5SAM.rxVendedor.Open;
            qckFactServ_8_5SAM.rxVendedor.Append;
            qckFactServ_8_5SAM.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAM.rxVendedor.Post;
          end;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAM.QRLabel25.Caption :='ITBIS';
        //qckFactServ8_5SAM.TPag.Caption:=
        //IntToStr(qckFactServ8_5SAM.PageNumber);
        if GlbEsCopia then
        qckFactServ_8_5SAM.xtipoVenta := TipoVenta +' (Copia)'
        else qckFactServ_8_5SAM.xtipoVenta := TipoVenta;
        qckFactServ_8_5SAM.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5SAM.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ_8_5SAM.QRImage2.Enabled:= False;
          qckFactServ_8_5SAM.PrinterSetup;
          qckFactServ_8_5SAM.Print;
        end else
        qckFactServ_8_5SAM.Preview;

        if GlbImpPDF and chkExportaPDF.Checked then
        begin
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\FacturaNum'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckFactServ_8_5SAM,GlbRutaFacturas+'\ReciboNum'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5SAM.Free;
        qckFactServ_8_5SAM:=Nil;
        end;
        end else
        begin
          //formatosamenew
        qckFactServ_8_5SAMNew:=TqckFactServ_8_5SAMNew.Create(Nil);
        try
          qckFactServ_8_5SAMnew.rxVendedor.Close;
          qckFactServ_8_5SAMNew.rxVendedor.Open;
          if dmreportes.qryCantVendedoresSamCANTVENDEDORES.Value = 1 then
          begin
            if qryEmpleado.Locate('codigo', dmreportes.qryViewVentasDetCodigo_Vendedor.Value,[]) then
            begin
              qckFactServ_8_5SAMnew.rxVendedor.Append;
              qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:=
              qryEmpleadoNOMBREVENDEDOR.Value;
              qckFactServ_8_5SAMNew.rxVendedor.Post;
            end;
          end else
          begin
            //rxVendedorNombreVendedor
            qckFactServ_8_5SAMNew.rxVendedor.Close;
            qckFactServ_8_5SAMNew.rxVendedor.Open;
            qckFactServ_8_5SAMNew.rxVendedor.Append;
            qckFactServ_8_5SAMNew.rxVendedorNombreVendedor.Value:='';
            qckFactServ_8_5SAMNew.rxVendedor.Post;
          end;
          if dmReportes.qryViewVentasMastMONTO_EXONERADO_ITBIS.Value > 0 then
          begin
            //qckFactServ8_5Ayaco.QRLabel25.left:=505;
            qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS Exonerado';
          end  else
          qckFactServ_8_5SAMNew.QRLabel25.Caption :='ITBIS';
        //qckFactServ8_5SAM.TPag.Caption:=
        //IntToStr(qckFactServ8_5SAM.PageNumber);
        if GlbEsCopia then
        qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta +' (Copia)'
        else qckFactServ_8_5SAMNew.xtipoVenta := TipoVenta;
        qckFactServ_8_5SAMNew.valorNCF:= dmFactura.qryVentaFacturaNUMERO_NCF.Value;
        if (GlbImpReciboSinPreg = 1) then
           qckFactServ_8_5SAMNew.Print
        else
        if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
        begin
          qckFactServ_8_5SAMNew.QRImage2.Enabled:= False;
          qckFactServ_8_5SAMNew.PrinterSetup;
          qckFactServ_8_5SAMNew.Print;
        end else
        qckFactServ_8_5SAMNew.Preview;

        //if (GlbImpReciboSinPreg = 0) then
        //if MessageDlg('Re-imprimir', mtInformation, [mbNo, mbYes], 0) = mrYes then
        //begin
        //  qckFactServ_8_5SAMNew.Preview;
        //end;
        if GlbImpPDF and chkExportaPDF.Checked then
        begin
        if not dmFactura.qryVentaFacturaNUMERO_FACTURA.IsNull then
        ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_FACTURA.Value)+'.pdf')
        else
        if not dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.IsNull then
        ReportExportPDF(qckFactServ_8_5SAMNew,GlbRutaFacturas+'\Facturas'+IntToStr(dmFactura.qryVentaFacturaNUMERO_DOC_PAGO.AsInteger)+'.pdf')
        end;
        finally
        qckFactServ_8_5SAMNew.Free;
        qckFactServ_8_5SAMNew:=Nil;
        end;
        end;
      end
end;

procedure TfrmConsultaFacturas.ProcSetPathlogoTipoServicio(tipo: smallint);
begin
  if (GLBSAM = 0) then Exit;
  if qryLogoTipoAfiliado.Locate('IDTIPO', tipo,[]) then
  GlbLogoServSam:=qryLogoTipoAfiliadoruta_logo.Value
  else
  if qryLogoTipoAfiliado.Locate('IDTIPO', 1,[]) then
  GlbLogoServSam:=qryLogoTipoAfiliadoruta_logo.Value;
end;

procedure TfrmConsultaFacturas.BitBtn15Click(Sender: TObject);
begin
  if GetVerificaTieneeCF(dmFactura.qryVentaFacturaNUMERO.Value) then
  begin
    MessageDlg('Venta tiene un eCF/NCF asignado. Verifique.',mtInformation,[mbok],0);
    Exit;
  end;
  frmAsignarNCFAVenta:=TfrmAsignarNCFAVenta.Create(nil);
  try         
    frmAsignarNCFAVenta._totalnetoValue:=dmFactura.qryVentaFacturaVALOR_TOTAL_DET.Value;
    frmAsignarNCFAVenta._numerotrnvta  :=dmFactura.qryVentaFacturaNUMERO.Value;
    frmAsignarNCFAVenta.BitBtn1Click(Self);
    BitBtn14Click(Self);
  finally
  frmAsignarNCFAVenta.free;
  frmAsignarNCFAVenta:=nil;
  end;
end;

procedure TfrmConsultaFacturas.Consultarpago1Click(Sender: TObject);
begin
  if dmFactura.qryVentaFacturaNumero.IsNull then Exit;
  if not (dmFactura.qryVentaFacturaFORMA_PAGO.Value in [7,8]) then
  begin
    dmPagosTarjeta.tblDetallePagos.Close;
    dmPagosTarjeta.tblDetallePagos.params[0].Value:= dmFactura.qryVentaFacturaNumero.Value;
    dmPagosTarjeta.tblDetallePagos.params[1].Value:= 1;
    dmPagosTarjeta.tblDetallePagos.Open;
    dmPagosTarjeta.tblDetallePagos.First;
    if dmPagosTarjeta.tblDetallePagos.RecordCount > 0 then
    begin
      frmPagosCombinados:=TfrmPagosCombinados.Create(Nil);
      frmPagosCombinados.BitBtn18.Enabled:=False;
      try
        frmPagosCombinados.PermiteEditar:=True;
        frmPagosCombinados.Showmodal;
      finally
      frmPagosCombinados.free;
      frmPagosCombinados:=Nil;
      end;
    end else
    MessageDlg('No se encuentra pago registrado para esta venta.',mtInformation,[mbOk],0);
  end else
  MessageDlg('Venta es a crédito, verifique.',mtInformation,[mbOk],0);
end;

procedure TfrmConsultaFacturas.EditarMontoPagado1Click(Sender: TObject);
begin
  if dmFactura.qryVentaFacturaNumero.IsNull then exit;
  frmUpdateMontopago:=TfrmUpdateMontopago.Create(nil);
  try
    frmUpdateMontopago.tblVentasMast.Close;
    frmUpdateMontopago.tblVentasMast.Params[0].Value:=dmFactura.qryVentaFacturaNumero.Value;
    frmUpdateMontopago.tblVentasMast.Open;  
    frmUpdateMontopago.ShowModal;
  finally
  frmUpdateMontopago.free;
  frmUpdateMontopago:=nil;
  end;
end;

procedure TfrmConsultaFacturas.ProcInsertarDetEfectivo(numtrn,
  fpago: integer; monto: currency);
begin
  tblDetallePagos.Close;
  tblDetallePagos.params[0].Value:= numtrn;
  tblDetallePagos.Open;
  tblDetallePagos.first;
  if tblDetallePagos.RecordCount > 0 then exit;
  tblDetallePagos.Append;
  tblDetallePagosFECHA.Value            :=GlbFechaTrnDiaria;
  tblDetallePagosTIPO.Value             := 1;//CONTADO
  tblDetallePagosTIPO_PAGO.Value        := fpago;
  tblDetallePagosAREA_TRANS.Value       := 1;//Ventas

  tblDetallePagosSERIE_TRN.Value        := numtrn;
  //No es necesario
  //tblDetallePagosGlbNumVtaPOS.Value  := GlbNumVtaPOS;
  
  tblDetallePagosAREA_TRANS.Value       := 1;//Ventas
  tblDetallePagosMONTO_PAGADO.value     := monto;
  tblDetallePagos.Post;
  tblDetallePagos.ApplyUpdates;
  if not tblDetallePagos.Transaction.InTransaction then
  tblDetallePagos.Transaction.StartTransaction;
  try
    tblDetallePagos.Transaction.CommitRetaining;
  except
  tblDetallePagos.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmConsultaFacturas.AutoAutualizaFPago1Click(Sender: TObject);
begin
  AutoAutualizaFPago1.Checked:=not AutoAutualizaFPago1.Checked;
end;

procedure TfrmConsultaFacturas.DgiiSolicitareCF(numerotrn: integer);
 var Json, Args: string; Code: Cardinal;
 var
 _smg : string;
 smtemp: TMemo;
begin
  _smg:='';
  //smtemp := TMemo.Create(self);
  //smtemp.Lines.Add('D7|m7p++G|E310000000010|fechaEmision=02-10-2025 17:19:43|montoTotal=4500.00|urlImage=https://eCF.dgii.gov.do/TesteCF/ConsultaTimbre?RncEmisor=130177092&RncComprador=130189171&ENCF=E310000000010&FechaEmision=01-10-2025&MontoTotal=4500.00&FechaFirma=02-10-2025%2017:19:43&CodigoSeguridad=m7p++G|qrFile=C:\\Proyectos\\PointSaleSoftResp\\QR_ECF\\QR_97168.jpg');
  //smtemp.Lines.Add('D7|m7p++G|E310000000010|fechaEmision=02-10-2025 17:19:43|montoTotal=4500.00|urlImage=&CodigoSeguridad=m7p++G|qrFile=C:\\Proyectos\\PointSaleSoftResp\\QR_ECF\\QR_97168.jpg');
  //UUtilecftimbre.GuardarTimbreEjemplo(numerotrn,smtemp.Text);
  //exit;//temporal
  if GlbValidarECF = 0 then
  begin                                                                                             
   MessageBox(0, Pchar('Parametro esta desactivado, verifique.'), 'Parametro para Validar DGII', MB_ICONWARNING or MB_OK);
   exit;
  end;
  if numerotrn = 0 then exit;
  if GlbValidarECF = 0 then exit;
  if UUtilecf.EjecutarECF_y_Mostrar(GlbRutaEcf, IntToStr(numerotrn),_smg) then
    MessageBox(0, Pchar(_smg), 'Facturación Electrónica', MB_ICONINFORMATION or MB_OK)
  else
  MessageBox(0, Pchar(_smg), 'Facturación Electrónica', MB_ICONINFORMATION or MB_OK);
end;

procedure TfrmConsultaFacturas.Button1Click(Sender: TObject);
begin
  if GlbActivaECF = 0 then
  begin
    MessageDlg('No estas en modo eCF Activo',mtInformation,[mbOk],0);
    exit;
  end;
  if (dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.IsNull Or
    (dmFactura.qryVentaFacturaSERIE_NCF_ASIGNADO.Value = 0)) And (GlbActivaECF = 1) then
  begin
    if MessageDlg('¿Asignar eCF a esta venta?',mtInformation,[mbyes, mbno],0) = mryes then
       DgiiSolicitareCF(dmFactura.qryVentaFacturaNumero.Value);
  end else
  MessageDlg('Venta ya tiene e-CF asignado',mtInformation,[mbOk],0);
end;

procedure TfrmConsultaFacturas.SolicitareCFDGII1Click(Sender: TObject);
begin
  if GlbActivaECF = 0 then
  begin
    MessageDlg('No estas en modo eCF Activo',mtInformation,[mbOk],0);
    exit;
  end;
  if not GetVerificaeCF(dmFactura.qryVentaFacturaNumero.Value) then
  begin
    if MessageDlg('¿Validar e-CF con DGII?',mtInformation,[mbyes, mbno],0) = mryes then
       DgiiSolicitareCF(dmFactura.qryVentaFacturaNumero.Value);
    BitBtn1Click(Self);
  end;
end;

procedure TfrmConsultaFacturas.ieneECF1Click(Sender: TObject);
begin
  if GlbActivaECF = 0 then
  begin
    MessageDlg('No estas en modo eCF Activo',mtInformation,[mbOk],0);
    exit;
  end;
  if not GetVerificaeCF(dmFactura.qryVentaFacturaNumero.Value) then
  MessageDlg('Venta no tiene e-CF asignado o validado.',mtInformation,[mbOk],0)
  else MessageDlg('Venta tiene e-CF asignado.',mtInformation,[mbOk],0);
end;              

procedure TfrmConsultaFacturas.ConsultaTimbreeCF1Click(Sender: TObject);
begin
  frmConsultaTimbreEcf:=TfrmConsultaTimbreEcf.Create(nil);
  try
    frmConsultaTimbreEcf.showmodal;
  finally
  FreeAndNil(frmConsultaTimbreEcf);
  end;
end;

procedure TfrmConsultaFacturas.AsignareCFSerieE1Click(Sender: TObject);
begin
  frmAsignareCFAVtasGen:=TfrmAsignareCFAVtasGen.Create(Nil);
  try
   frmAsignareCFAVtasGen.Showmodal;
  finally
  FreeAndNil(frmAsignareCFAVtasGen);
  end;
end;

procedure TfrmConsultaFacturas.DgiiReenviarECF(ANumeroTrn: Integer; const AEncf: string);
var
  LMsg: string;
begin
  LMsg := '';
  if GlbValidarECF = 0 then
    Exit;

  if Trim(AEncf) = '' then
  begin
    MessageBox(0, 'No hay e-CF asignado a esta factura para reenviar.', 'Facturación Electrónica',
      MB_ICONWARNING or MB_OK);
    Exit;
  end;

  if not UUtilecf.EjecutarECF_Reenviar(GlbRutaEcf, IntToStr(ANumeroTrn), Trim(AEncf), LMsg) then
    MessageBox(0, PChar(LMsg), 'Reenvío e-CF', MB_ICONERROR or MB_OK)
  else
    MessageBox(0, PChar(LMsg), 'Reenvío e-CF', MB_ICONINFORMATION or MB_OK);
  //dmFactura.dsqryVentaFactura.DataSet.Refresh;
  UpdateEcfUi;
end;

procedure TfrmConsultaFacturas.DgiiRefrescarCertificado(ANumeroTrn: Integer);
var
  LMsg: string;
begin
  LMsg := '';
  if GlbValidarECF = 0 then
    Exit;

  if not UUtilecf.EjecutarECF_RefreshCert(GlbRutaEcf, IntToStr(ANumeroTrn), LMsg) then
    MessageBox(0, PChar(LMsg), 'Refrescar Certificado / Enviar e-CF', MB_ICONERROR or MB_OK)
  else
    MessageBox(0, PChar(LMsg), 'Refrescar Certificado / Enviar e-CF', MB_ICONINFORMATION or MB_OK);
  //dmFactura.dsqryVentaFactura.DataSet.Refresh;
  UpdateEcfUi;     
end;

procedure TfrmConsultaFacturas.DgiiVerificarCertificado;
var
  LMsg: string;
begin
  LMsg := '';
  // El TRN no se usa para nada crítico en --check-cert-only, se puede mandar '0'
  if not UUtilecf.EjecutarECF_CheckCertOnly(GlbRutaEcf, '0', LMsg) then
    MessageBox(0, PChar(LMsg), 'Verificar Certificado DGII', MB_ICONERROR or MB_OK)
  else
    MessageBox(0, PChar(LMsg), 'Verificar Certificado DGII', MB_ICONINFORMATION or MB_OK);
  //dmFactura.dsqryVentaFactura.DataSet.Refresh;
  UpdateEcfUi;
end;

procedure TfrmConsultaFacturas.RefrescarCert1Click(Sender: TObject);
begin
  DgiiRefrescarCertificado(dmFactura.qryVentaFacturanumero.Value);
end;

procedure TfrmConsultaFacturas.ChequearCert1Click(Sender: TObject);
begin
  DgiiVerificarCertificado;
end;

procedure TfrmConsultaFacturas.Reenviar1Click(Sender: TObject);
begin
  DgiiReenviarECF(dmFactura.qryVentaFacturanumero.Value, dmFactura.qryVentaFacturaNUMERO_NCF.Value);
end;

function TfrmConsultaFacturas.GetCurrentEcfEstado: string;
begin
  if (dmFactura.dsqryVentaFactura.DataSet = nil) or dmFactura.dsqryVentaFactura.DataSet.IsEmpty then
    Result := ''
  else
    // AJUSTA ESTE CAMPO: aquí va el estado que guarda IdesiToolECF
    // Posibles valores: 'PENDIENTE','ACEPTADO','RECHAZADO','RECH_LOCAL',
    //                   'NOT_FOUND','IN_PROCESS','ERROR'
    Result := Trim(dmFactura.dsqryVentaFactura.DataSet.FieldByName('DGII_STATUS').AsString);
end;

procedure TfrmConsultaFacturas.UpdateEcfUi;
var
  hasRow   : Boolean;
  trn      : Integer;
  encf     : string;
  estado   : string;
  canSend  : Boolean;
  canResend: Boolean;
  canRefresh: Boolean;
begin
  hasRow := (dmFactura.dsqryVentaFactura.DataSet <> nil) and (not dmFactura.dsqryVentaFactura.DataSet.IsEmpty);
  trn    := dmFactura.qryVentaFacturanumero.value;
  encf   := dmFactura.qryVentaFacturaNUMERO_NCF.Value;
  estado := UpperCase(GetCurrentEcfEstado);

  // Por seguridad, si no hay registro: todo deshabilitado excepto CheckCert
  if not hasRow or (trn = 0) then
  begin
    SolicitareCFDGII1.Enabled := True;
    Reenviar1.Enabled     := False;
    RefrescarCert1.Enabled:= True;
    ChequearCert1.Enabled := True;

    {btnECFEnviar.Enabled       := mnuECFEnviar.Enabled;
    btnECFReenviar.Enabled     := mnuECFReenviar.Enabled;
    btnECFRefreshCert.Enabled  := mnuECFRefreshCert.Enabled;
    btnECFCheckCert.Enabled    := mnuECFCheckCert.Enabled; }
    Exit;
  end;

  // Siempre se puede verificar certificado
  //mnuECFCheckCert.Enabled   := True;
  //btnECFCheckCert.Enabled   := True;

  // Estados que consideramos "candidatos a envío" (sin aceptar / sin proceso activo)
  canSend :=
    (estado = '') or
    (estado = 'PENDIENTE') or
    (estado = 'RECHAZADO') or
    (estado = 'RECH_LOCAL') or
    (estado = 'NOT_FOUND') or
    (estado = 'ERROR');

  // Reenviar: solo si hay ENCF y NO está aceptado ni "En proceso"
  canResend :=
    (encf <> '') and
    (estado <> 'ACEPTADO') and
    (estado <> 'IN_PROCESS');

  // RefreshCert: igual que enviar, pero no exigimos que encf esté vacío
  canRefresh :=
    (estado <> 'ACEPTADO') and
    (estado <> 'IN_PROCESS');

  // Aplicar GlbValidarECF
  if GlbValidarECF = 0 then
  begin
    canSend    := False;
    canResend  := False;
    canRefresh := False;
  end;

  // Reglas finales
  //SolicitareCFDGII1.Enabled:= canSend   and (not GetVerificaeCF(trn));  // Enviar normal solo si aún no tiene ENCF
  Reenviar1.Enabled     := canResend;
  RefrescarCert1.Enabled:= canRefresh;

  // Sincronizar botones con menús
  {btnECFEnviar.Enabled      := mnuECFEnviar.Enabled;
  btnECFReenviar.Enabled    := mnuECFReenviar.Enabled;
  btnECFRefreshCert.Enabled := mnuECFRefreshCert.Enabled;}
end;

procedure TfrmConsultaFacturas.CambiarTipoECF1Click(Sender: TObject);
var
  Modo: Integer;
  RNC, Nombre: string;
  Trn: Integer;
  TipoECF, NCF: string;
  Fecha: TDateTime;
  Monto: Currency;
  codcte : integer;
  xflag:boolean;
  frmModoConsumoToCredito : TfrmModoConsumoToCredito;
begin
  if dmFactura.qryVentaFactura.IsEmpty then
    Exit;   
  if (dmFactura.qryVentaFacturaFORMA_PAGO.Value <> 1) then
  begin
    MessageDlg('Solo aplica para ventas al contado.',mtWarning,[mbOk],0);
    Exit;
  end;
  Trn     := dmFactura.qryVentaFacturaNUMERO.Value;
  TipoECF := Trim(dmFactura.qryVentaFactura.FieldByName('TIPO_NCF').AsString);
  NCF     := Trim(dmFactura.qryVentaFactura.FieldByName('NUMERO_NCF').AsString);
  Fecha   := dmFactura.qryVentaFactura.FieldByName('FECHA').AsDateTime;
  Monto   := dmFactura.qryVentaFactura.FieldByName('VALOR_TOTAL_DET').AsCurrency;

  RNC     := Trim(dmFactura.qryVentaFactura.FieldByName('RNC_NUMERO').AsString);
  Nombre  := Trim(dmFactura.qryVentaFactura.FieldByName('NOMBRE_FACTURAR').AsString);
  if dmFactura.qryVentaFactura.FieldByName('RNC_NUMERO').IsNull then
  begin
    FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
    try
      if (RNC <> '') then
      begin
        FrmBuscarClientesPersonas.chkBoxFiltrar.Checked:=True;
        FrmBuscarClientesPersonas.RadioGroup1.ItemIndex:=1;
        FrmBuscarClientesPersonas.Edit1.Text:=RNC;
      end;
      FrmBuscarClientesPersonas.CodigoCliente := -1;
      if FrmBuscarClientesPersonas.Showmodal = mrOk then
      begin
        qryClientes.Close;
        qryClientes.Open;
        if qryClientes.Locate('CODIGO_CTE',FrmBuscarClientesPersonas.CodigoCliente,[]) then
        begin
          Nombre:= qryClientesNOMBRE_FACTURAR.Value;
          //Result := Trim(Nombre) <> '';
          RNC   := qryClientesRNC_NUMERO.Value;
          codcte := FrmBuscarClientesPersonas.CodigoCliente;
        end;
      end;
    finally
    FrmBuscarClientesPersonas.Free;
    FrmBuscarClientesPersonas:=Nil;
    end;
  end;
  if dmFactura.qryVentaFactura.FieldByName('RNC_NUMERO').IsNull and (Nombre = '') then
  begin
    if not CapturarRNCComprador(rnc, nombre,codcte) then
    Exit;
  end;
  frmModoConsumoToCredito := TfrmModoConsumoToCredito.Create(Application);
  try
    if frmModoConsumoToCredito.Execute(
       Trn, TipoECF, NCF, Fecha, Monto,
       RNC, Nombre,
       Modo, RNC, Nombre) then
    begin
      // usuario aceptó ? Modo, RNC y Nombre vienen actualizados
      xflag := False;
    end else
    xflag := True;
  finally
  frmModoConsumoToCredito.Free;
  end;

  if xflag then Exit;


    // Aquí usas "Modo", "RNC" y "Nombre" para ejecutar el flujo real:
    if Modo = 0 then
    begin
      // MODO 0: cambiar E32 -> E31 en la misma venta
      dmFactura.tblUpdateVenta.Close;
      dmFactura.tblUpdateVenta.Params[0].Value:=trn;
      dmFactura.tblUpdateVenta.Open;
      if dmFactura.tblUpdateVentanumero.IsNull then
      begin
        MessageDlg('Transacción no existe.',mtinformation,[mbok],0);
        exit;
      end;
      Convertir_Modo0_CambiarE32porE31(dmFactura.tblUpdateVenta,codcte);
    end
    else
    begin
      // MODO 1: nueva E31 + NC E34
      dmFactura.tblUpdateVenta.close;
      dmFactura.tblUpdateVenta.params[0].value:=trn;
      dmFactura.tblUpdateVenta.open;
      if dmFactura.tblUpdateVentanumero.IsNull then
      begin
        MessageDlg('Transacción no existe.',mtinformation,[mbok],0);
        exit;
      end;
      Convertir_Modo1_NuevaE31_mas_NC(dmFactura.tblUpdateVenta,codcte,trn,'E32',RNC,Nombre);
    end;
    BitBtn1Click(Self);
end;

procedure TfrmConsultaFacturas.Convertir_Modo0_CambiarE32porE31(ds: TIBDataSet;codcte:integer);
var
  oldTrn: Integer;
  oldNcf, oldEstado: string;
  oldFecha: TDateTime;
  rnc, nombre: string;
begin
  oldTrn    := ds.FieldByName('NUMERO').AsInteger;
  oldNcf    := Trim(ds.FieldByName('NUMERO_NCF').AsString);
  oldEstado := Trim(ds.FieldByName('ESTADO_VENTA').AsString);
  oldFecha  := ds.FieldByName('FECHA').AsDateTime;

  // Capturar RNC/NOMBRE del comprador para convertir a crédito fiscal
  if (rnc = '') then
  begin
    if not CapturarRNCComprador(rnc, nombre,codcte) then
      Exit;
  end;

  if MessageDlg(Format(
      'Se va a convertir la factura de consumo E32 (TRN %d) en una factura de crédito fiscal E31.'#13#10 +
      'No se creará nueva venta ni nota de crédito.'#13#10#13#10 +
      '¿Desea continuar?', [oldTrn]),
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  ds.Edit;
  try
    // Guardar "huella" de lo que era antes
    if ds.FindField('REF_TRN_ORIGEN') <> nil then
      ds.FieldByName('REF_TRN_ORIGEN').AsInteger := oldTrn;

    if ds.FindField('REF_NCF_ORIGEN') <> nil then
      ds.FieldByName('REF_NCF_ORIGEN').AsString := oldNcf;

    if ds.FindField('REF_FECHA_ORIGEN') <> nil then
      ds.FieldByName('REF_FECHA_ORIGEN').AsDateTime := oldFecha;

    if ds.FindField('REF_ESTADO_ORIGEN') <> nil then
      ds.FieldByName('REF_ESTADO_ORIGEN').AsString := oldEstado;

    // Actualizar a E31
    ds.FieldByName('TIPO_ECF').AsString := 'E31';

    // En este escenario, normalmente NO se usa CodigoModificacion = 5,
    // porque la E32 nunca llega a DGII como e-CF independiente.
    if ds.FindField('IDDGII_MOTIVO_NCR') <> nil then
      ds.FieldByName('IDDGII_MOTIVO_NCR').Clear;

    // Actualizar datos del comprador
    if ds.FindField('RNC_COMPRADOR') <> nil then
      ds.FieldByName('RNC_COMPRADOR').AsString := rnc;

    if ds.FindField('NOMBRE_COMPRADOR') <> nil then
      ds.FieldByName('NOMBRE_COMPRADOR').AsString := nombre;

    // Si manejas ESTADO_VENTA, puedes dejarlo igual o marcarlo como 'MODIF'
    if ds.FindField('ESTADO_VENTA') <> nil then
      ds.FieldByName('ESTADO_VENTA').AsString := 'VIG'; // o 'MODIF', como acuerdes

    GlbSalvarQuery(dmFactura.tblUpdateVenta);
    ShowMessage('Factura convertida a E31 en la misma venta (Modo 0).');
  except
    ds.Cancel;
    raise;
  end;
end;


procedure TfrmConsultaFacturas.Convertir_Modo1_NuevaE31_mas_NC(ds: TIBDataSet;codcte:integer;
    oldTrn: Integer;tipoEcf: string;rnc, nombre: string);
var
  newTrnE31, ncTrnE34 : integer;
begin
  oldTrn := ds.FieldByName('NUMERO').AsInteger;

  if (rnc = '') then
  begin
    if not CapturarRNCComprador(rnc, nombre,codcte) then
      Exit;
  end;
  if MessageDlg(Format(
      'Se creará una NUEVA factura de Crédito Fiscal (E31) copiando los ítems de la factura de consumo E32 (TRN %d).'#13#10 +
      'Luego se generará automáticamente una Nota de Crédito (E34) que anulará la E32.'#13#10#13#10 +
      '¿Desea continuar?', [oldTrn]),
      mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  // Aquí delegamos la lógica de clonación/NC a helpers (que a su vez
  // pueden llamar SPs en Firebird para mantener integridad).
  newTrnE31 := CrearVentaCreditoDesdeConsumo(oldTrn, rnc, nombre,codcte);
  if newTrnE31 = 0 then
    raise Exception.Create('No se pudo crear la nueva factura E31.');
  //-TODOs -> CrearNotaCreditoAnulacion 
  ncTrnE34 := CrearNotaCreditoAnulacion(oldTrn,codcte);
  if ncTrnE34 = 0 then
    raise Exception.Create('No se pudo crear la Nota de Crédito E34 que anula la E32.')
  else
  begin
    ds.Edit;
    ds.FieldByName('ESTADO_VENTA').AsVariant:='ANU';
    GlbSalvarQuery(ds);
  end;

  ShowMessage(Format(
    'Conversión completada (Modo 1):'#13#10 +
    '- Nueva factura E31 TRN %d'#13#10 +
    '- Nota de Crédito E34 TRN %d (anula la E32 TRN %d)',
    [newTrnE31, ncTrnE34, oldTrn]));
end;


function TfrmConsultaFacturas.CapturarRNCComprador(var ARNC, ANombre: string; var codcte:integer): Boolean;
begin
  // REEMPLAZA esto por tu formulario real de captura de cliente / RNC.
  //ARNC := InputBox('RNC del Comprador', 'Digite el RNC:', '');
  if (codcte > 0) then
  begin
    qryClientes.Close;
    qryClientes.Open;
    if qryClientes.Locate('CODIGO_CTE',codcte,[]) then
    begin
      ANombre:= qryClientesNOMBRE_FACTURAR.Value;
      Result := Trim(ANombre) <> '';
      ARNC   := qryClientesRNC_NUMERO.Value;
    end;
    Result:= True;
    Exit;
  end;

  if (Trim(ARNC) = '') and (codcte <= 0) then
  begin
    Result := False;
    Exit;
  end;

  //ANombre := InputBox('Nombre / Razón Social', 'Digite el nombre del comprador:', '');
  //Result := Trim(ANombre) <> '';

  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if (codcte <=0) or (ARNC = '') then
    begin
      FrmBuscarClientesPersonas.CodigoCliente := -1;
      if FrmBuscarClientesPersonas.Showmodal = mrOk then
      begin
        qryClientes.Close;
        qryClientes.Open;
        if qryClientes.Locate('CODIGO_CTE',FrmBuscarClientesPersonas.CodigoCliente,[]) then
        begin
          ANombre:= qryClientesNOMBRE_FACTURAR.Value;
          Result := Trim(ANombre) <> '';
          ARNC   := qryClientesRNC_NUMERO.Value;
          codcte := FrmBuscarClientesPersonas.CodigoCliente;
       end;
      end;
    end else
    Result:= Trim(ANombre) <> '';
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

function TfrmConsultaFacturas.CrearVentaCreditoDesdeConsumo(ATrnConsumo: Integer;
  const ARNC, ANombre: string;codcte:integer): Integer;
var
  q           : TIBQuery;
  LCodigoCte  : Integer;
  LNumDocPago : Integer;
begin
  // 1. Resolver cliente para E31
  //    Aquí usas tu lógica existente: buscar por RNC, o crear si no existe.
  LCodigoCte := codcte; //BuscarOCrearClientePorRNC(ARNC, ANombre);

  q := TIBQuery.Create(nil);
  try
    q.Database    := dmConectar.IBDatabase1;      // ajusta al DataModule real
    q.Transaction := dmConectar.IBTransaction1;   // idem

    q.SQL.Text :=
      'SELECT O_NUMERO, O_NUMERO_DOC_PAGO ' +
      'FROM SP_REINSERT_VENTA_CONTADO(' +
      '  :A_TRN_NUMERO, :A_TIPO_DOC_PAGO, :A_COD_USUARIO, :A_CODIGO_CTE, :A_TIPONCFIFISCAL, :A_TIPONCF)';

    q.ParamByName('A_TRN_NUMERO').AsInteger    := ATrnConsumo;
    q.ParamByName('A_TIPO_DOC_PAGO').AsInteger := 1;            // código que uses para E31
    q.ParamByName('A_COD_USUARIO').AsInteger   := 4; // codigo fijo
    q.ParamByName('A_CODIGO_CTE').AsInteger    := LCodigoCte;
    q.ParamByName('A_TIPONCFIFISCAL').AsInteger:= 1;//E31
    q.ParamByName('A_TIPONCF').AsString:= '31';//E31
    q.Open;

    Result      := q.FieldByName('O_NUMERO').AsInteger;
    LNumDocPago := q.FieldByName('O_NUMERO_DOC_PAGO').AsInteger;

    // Si necesitas usar LNumDocPago en el flujo de UI, lo guardas donde toque.
  finally
    q.Free;
  end;
end;


function TfrmConsultaFacturas.CrearNotaCreditoAnulacion(
  ATrnConsumo: Integer;codcte:integer): Integer;
var
  q: TIBQuery;
begin   
 //todo
 result:=-1;
end;

procedure TfrmConsultaFacturas.eNCFAsignados1Click(Sender: TObject);
begin
  frmNCFAsignados:=TfrmNCFAsignados.Create(Nil);
  try
    frmNCFAsignados.ShowModal;
  finally
  frmNCFAsignados.Free;
  frmNCFAsignados:=Nil;
  end;
end;

procedure TfrmConsultaFacturas.SpeedButton1Click(Sender: TObject);
begin
  FiltrarSoloMonto:=True;
  BitBtn1Click(Self);
end;

procedure TfrmConsultaFacturas.BitBtn16Click(Sender: TObject);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  dmDatos.qryMembrete.Open;
with TfrmCartaRutaTemplate.Create(nil) do
try
  Database := dmConectar.IBDatabase1;
  Transaction := dmConectar.IBTransaction1;
  CIAKey := 1;
  Usuario := strUserName;
  _numtrn:=dmFactura.qryVentaFacturaNUMERO.Value;
  edtNumeroTransaccion.Text:=dmFactura.qryVentaFacturaNUMERO.AsString;
  ShowModal;
finally
  Free;
end;
end;
//UQckRepCartaRutaVeh
procedure TfrmConsultaFacturas.CartadeSaldo1Click(Sender: TObject);
begin
  if dmDatos.qryMembrete.state = dsInactive then
  dmDatos.qryMembrete.Open;
  with TfrmCartaSaldoTemplate.Create(nil) do
  try
    Database := dmConectar.IBDatabase1;
    Transaction := dmConectar.IBTransaction1;
    CIAKey := 1;
    Usuario := strUserName;
    _numtrn:=dmFactura.qryVentaFacturaNUMERO.Value;
    edtNumeroTransaccion.Text:=dmFactura.qryVentaFacturaNUMERO.AsString;
    ShowModal;
  finally
  Free;
  end;
end;

end.
