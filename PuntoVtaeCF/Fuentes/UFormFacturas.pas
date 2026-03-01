unit UFormFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DBCtrls, EditNew,
  db, ComCtrls, WinSkinData, Mask, IBCustomDataSet, IBQuery, IBSQL, Menus;

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
  private
    { Private declarations }
    procedure VerificaVendedor;
    Function VerificaClave:Boolean;
    procedure ReimprimirFacturaNoFiscal(numTRN : Integer);
    procedure ProcSetPathlogoTipoServicio(tipo:smallint);
    procedure ProcInsertarDetEfectivo(numtrn: integer;fpago:integer;monto:currency);
  public
    { Public declarations }
    EsReimprimirContado : Boolean;
    EsActualizaConduce : Boolean;
    NumTrnVenta : Integer;
  end;

var
  frmConsultaFacturas: TfrmConsultaFacturas;

implementation
USES UDatModFactura, uglobal, UDatModClientes, UFormCambiarCteFact,
  UProcVentaRapida, UFormCrearNotaCRVta, UDatmodDatosGenerales,
  UDatosVentas, UFormVocadosDet, UDatModVehiculo, UFormDatosVentaVeh,
  UDatModConectar, UFormEntreClave, UFormExportDBGridToHTML,
  UConvertirDBGridToHTML, UDatModCompania, UDatModReportes,
  UQckFactServ8_5_SAMNewM, UQckFactServ8_5_SAM, UQckFactServ8_5_SAMNew,
  UFormAsignarNCFAVenta, UDatModCxc, UFormPagosCombinados,
  UDatModPagoTarjeta, UFormUpdateMontopagado;
{$R *.dfm}

procedure TfrmConsultaFacturas.BitBtn1Click(Sender: TObject);
begin
  dmFactura.qryVentaFactura.Close;
  if rdgNotaCR.Checked then
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryDatosDevolucionNCR_0.SQL.Text+
  ' Where ventas_mast.FORMA_PAGO = 6 order by ventas_mast.numero'
  else 
  if rdgCredito.Checked then
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentaFactura_0.SQL.Text+
  ' Where facturas.NUMERO is not null and ventas_mast.FORMA_PAGO = 7 order by ventas_mast.numero' 
  else
  dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text+
  ' Where VENTAS_MAST.NUMERO_DOC_PAGO is not null and ventas_mast.FORMA_PAGO <> 7 order by ventas_mast.numero';

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
      ' And ventas_mast.cia_key =:ciakey and ventas_mast.FORMA_PAGO = 6'
      else
      if rdgCredito.Checked then
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text + ' Where facturas.NUMERO =:numero and ventas_mast.FORMA_PAGO = 7 '+
      ' And ventas_mast.cia_key =:ciakey'
      else
      dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text +
      ' Where VENTAS_MAST.numero =:numero And ventas_mast.cia_key =:ciakey '+
      'and ventas_mast.FORMA_PAGO <> 7 ';

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
        ' and ventas_mast.FORMA_PAGO = 6'
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.numero =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
        ' and ventas_mast.FORMA_PAGO = 7'
        else
        begin
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentacontado_0.SQL.Text + ' Where VENTAS_MAST.numero =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey '+
        ' and ventas_mast.FORMA_PAGO <> 7';
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
        ' and ventas_mast.FORMA_PAGO = 6 '
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
        'VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey'+
        ' and ventas_mast.FORMA_PAGO = 7 '
        else
          dmFactura.qryVentaFactura.SQL.Text :=
          dmFactura.qryVentacontado_0.SQL.Text +
          ' Where VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey  '+
          ' and ventas_mast.FORMA_PAGO <> 7';

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
      ' And ventas_mast.cia_key =:ciakey and ventas_mast.FORMA_PAGO = 6'
      else
      if rdgCredito.Checked then
      dmFactura.qryVentaFactura.SQL.Text:=
      dmFactura.qryVentaFactura_0.SQL.Text + ' Where facturas.NUMERO =:numero and ventas_mast.FORMA_PAGO = 7 '+
      ' And ventas_mast.cia_key =:ciakey'
      else
      dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text +
      ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero And ventas_mast.cia_key =:ciakey '+
      'and ventas_mast.FORMA_PAGO <> 7 ';

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
        ' and ventas_mast.FORMA_PAGO = 6'
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_FACTURA =:numero '+
        ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey' +
        ' and ventas_mast.FORMA_PAGO = 7'
        else
        begin
          dmFactura.qryVentaFactura.SQL.Text:=
          dmFactura.qryVentacontado_0.SQL.Text + ' Where VENTAS_MAST.NUMERO_DOC_PAGO =:numero '+
          ' and VENTAS_MAST.Codigo_cte =:codcte  And ventas_mast.cia_key =:ciakey '+
          ' and ventas_mast.FORMA_PAGO <> 7';
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
        ' and ventas_mast.FORMA_PAGO = 6 '
        else
        if rdgCredito.Checked then
        dmFactura.qryVentaFactura.SQL.Text:=
        dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
        'VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey'+
        ' and ventas_mast.FORMA_PAGO = 7 '
        else
          dmFactura.qryVentaFactura.SQL.Text :=
          dmFactura.qryVentacontado_0.SQL.Text +
          ' Where VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey  '+
          ' and ventas_mast.FORMA_PAGO <> 7';

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
    'And ventas_mast.cia_key =:ciakey' else
    if rdgCredito.Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryVentaFactura_0.SQL.Text + ' Where '+
    'Facturas.NUMERO is not null and ventas_mast.FORMA_PAGO = 7'+
    ' and VENTAS_MAST.Codigo_cte =:codcte '+
    'And ventas_mast.cia_key =:ciakey' else
    dmFactura.qryVentaFactura.SQL.Text:=dmFactura.qryVentacontado_0.SQL.Text + ' Where '+
    'VENTAS_MAST.NUMERO_DOC_PAGO is not null and ventas_mast.FORMA_PAGO <> 7'+
    ' and VENTAS_MAST.Codigo_cte =:codcte And ventas_mast.cia_key =:ciakey';

    dmFactura.qryVentaFactura.SQL.Text := dmFactura.qryVentaFactura.SQL.Text +
    ' order by ventas_mast.numero';
    dmFactura.qryVentaFactura.Params[0].AsInteger := edtCodCte.ValueInteger;
    dmFactura.qryVentaFactura.Params[1].AsInteger := glbCia_Key;
    dmFactura.qryVentaFactura.Open;
  end else
  begin
    if rdgNotaCR.Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryDatosDevolucionNCR_0.SQL.Text + ' Where VENTAS_MAST.fecha =:fecha '+
    ' And ventas_mast.FORMA_PAGO = 6'+
    ' And ventas_mast.cia_key =:ciakey' else
    if rdgCredito.Checked then
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryVentaFactura_0.SQL.Text + ' Where VENTAS_MAST.fecha =:fecha '+
    ' And Facturas.NUMERO is not null and ventas_mast.FORMA_PAGO = 7'+
    ' And ventas_mast.cia_key =:ciakey' else
    dmFactura.qryVentaFactura.SQL.Text:=
    dmFactura.qryVentacontado_0.SQL.Text + ' Where VENTAS_MAST.fecha =:fecha '+
    ' And VENTAS_MAST.NUMERO_DOC_PAGO Is Not Null And ventas_mast.FORMA_PAGO <> 7'+
    ' And ventas_mast.cia_key =:ciakey';

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
  dmFactura.qryVentaFactura.Last;
  dmfactura.qryDetPagos.Close;
  dmfactura.qryDetPagos.Params[0].value:=dmFactura.qryVentaFacturaNumero.value;
  dmfactura.qryDetPagos.Open;
end;

procedure TfrmConsultaFacturas.FormCreate(Sender: TObject);
begin
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
  if (dmfactura.qryDetPagos.params[0].Value <> dmfactura.qryVentaFacturaNUMERO.Value) then
  begin
    dmfactura.qryDetPagos.Close;
    dmfactura.qryDetPagos.Params[0].Value:=dmfactura.qryVentaFacturaNUMERO.Value;
    dmfactura.qryDetPagos.Open;
  end;
  if  (dmfactura.qryVentaFacturaSTATUS.Value = 'C') then
  Background:=clGray
  else
     if (dmfactura.qryDetPagos.RecordCount = 0) and
     not (dmfactura.qryVentaFacturaFORMA_PAGO.Value in [7,8,6] ) then
  begin
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
  if  (dmFactura.qryVentaFacturaDetSTATUS_DET.Value = 'C') then
  Background:=clGray;
end;

procedure TfrmConsultaFacturas.BitBtn9Click(Sender: TObject);
begin
  dmFactura.qryVentaFactura.First;
end;

procedure TfrmConsultaFacturas.BitBtn10Click(Sender: TObject);
begin
  if dmFactura.qryVentaFactura.State = dsBrowse then
  dmFactura.qryVentaFactura.Prior;
end;

procedure TfrmConsultaFacturas.BitBtn11Click(Sender: TObject);
begin
  dmFactura.qryVentaFactura.Next;
end;

procedure TfrmConsultaFacturas.BitBtn12Click(Sender: TObject);
begin
  if dmFactura.qryVentaFactura.State = dsBrowse then
  dmFactura.qryVentaFactura.Last;
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
  BitBtn8.Visible:=True
  else BitBtn8.Visible:=False;
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
begin
  frmEntrreClave:=TfrmentrreClave.Create(nil);
  if frmEntrreClave.showmodal=mrOk then
  Clave:= frmEntrreClave.Edit1.Text
  else Result := False;
  frmentrreClave.Free;
  frmentrreClave:=Nil;
  if GlbClaveSup <> Encriptar(Trim(clave), 2005) then
  begin
    MessageDlg('Clave incorrecta, verifique', mtError, [mbOK], 0);
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

end.
