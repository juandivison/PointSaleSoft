unit UFormConsultaVentaXCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmListadoVentas = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    edtCodCteIni: TEditN;
    ComboBox2: TComboBox;
    Label2: TLabel;
    edtCodCteFin: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    RadioGroup1: TRadioGroup;
    chboxExportarPDF: TCheckBox;
    chkNoIncluyeDevoluciones: TCheckBox;
    edtNumFactura: TEditN;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    Label6: TLabel;
    cboxCodigoVendedor: TComboBox;
    edtCodVendedor: TEditN;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodCteIniExit(Sender: TObject);
    procedure edtCodCteFinExit(Sender: TObject);
    procedure cboxCodigoVendedorChange(Sender: TObject);
    procedure edtCodVendedorExit(Sender: TObject);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    Procedure AbrirDatos;
  end;

var
  frmListadoVentas: TfrmListadoVentas;
  labelCretrioRep : String;
implementation
uses uglobal, UDatModReportes, UQckRepListaFactura, UDatosVentas;

{$R *.dfm}

procedure TfrmListadoVentas.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmReportes.qryClientes.Close;
  dmReportes.qryClientes.Open;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  dmReportes.qryClientes.First;
  While Not dmReportes.qryClientes.Eof Do
  begin
    ComboBox1.Items.Add(dmReportes.qryClientesNOMBRE_FACTURAR.Value);
    ComboBox2.Items.Add(dmReportes.qryClientesNOMBRE_FACTURAR.Value);
    dmReportes.qryClientes.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);

  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  dmVentas.qryEmpleado.First;
  cboxCodigoVendedor.Items.Clear;
  While Not dmVentas.qryEmpleado.Eof Do
  begin
    cboxCodigoVendedor.Items.Add(dmVentas.qryEmpleadoNOMBRECOMPLETO.Value);
    dmVentas.qryEmpleado.Next;
  end;
  cboxCodigoVendedor.Text :='';
  //cboxCodigoVendedorChange(Self);

end;

procedure TfrmListadoVentas.ComboBox1Change(Sender: TObject);
begin
  if dmReportes.qryClientes.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmReportes.qryClientesCODIGO_CTE.Value);
end;

procedure TfrmListadoVentas.ComboBox2Change(Sender: TObject);
begin
  if dmReportes.qryClientes.Locate('NOMBRE_FACTURAR',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmReportes.qryClientesCODIGO_CTE.Value);
end;

procedure TfrmListadoVentas.AbrirDatos;
var
  orderByText : string;
  noDevoluciones : string;
  strCodVd : string;
begin
  if (edtCodVendedor.Text <> '') then
  strCodVd := ' And (CODIGO_VENDEDOR = '+edtCodVendedor.Text+') '
  else
  strCodVd := '';
  //Reporte
  //qckListaFactXCteXProducto
  noDevoluciones := ' And (Forma_Pago <> 6) ';
  if not chkNoIncluyeDevoluciones.Checked then
  noDevoluciones:='';
  if orderTipo = 0 then
  orderByText:= ' Order By codigo_cte, numero_factura, fecha '
  else
  if orderTipo = 1 then
  orderByText:= ' Order By codigo_cte, CODIGO_PROD, numero_factura, fecha '
  else
  if orderTipo = 2 then
  orderByText:= ' Order By codigo_cte, numero_factura, fecha ';

  dmReportes.qryViewVentasHist.Close;
  dmReportes.qryViewVentasHist.SQL.Clear;
  if (edtNumFactura.ValueInteger > 0) then
  begin
    dmReportes.qryViewVentasHist.SQL.Text:=
    dmReportes.qryViewVentasHist_base.SQL.Text + Format(' Where VIEW_HIST_VENTA.Numero_Factura = %d ',
    [edtNumFactura.ValueInteger]) + orderByText + strCodVd;
    labelCretrioRep:= '';
  end else
  case RadioGroup1.ItemIndex of
  0: begin
       if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
       dmReportes.qryViewVentasHist.SQL.Text:=
       dmReportes.qryViewVentasHist_base.SQL.Text + format(' Where Status in (%s,%s) and codigo_cte Between %d And  %d',
       [chr(39) + 'A'+chr(39),chr(39)+'R'+chr(39),edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger]) + noDevoluciones
        + strCodVd + orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text;
     end;
  1: begin
       dmReportes.qryViewVentasHist.SQL.Text:=
       dmReportes.qryViewVentasHist_base.SQL.Text + format(' Where Status in (%s,%s) and  fecha Between %s And  %s',
       [chr(39) + 'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39),
        chr(39) + FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)]) + noDevoluciones +
        strCodVd + orderByText;
       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date);
     end;
  2: begin
       dmReportes.qryViewVentasHist.SQL.Text:=
       dmReportes.qryViewVentasHist_base.SQL.Text + format(' Where Status in (%s,%s) and fecha between %s and %s',
       [chr(39) + 'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39) + FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
       format(' And codigo_cte Between %d And  %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
       noDevoluciones + strCodVd + orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta ' + edtCodCteFin.Text+'-.- Del '+
       FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
        + ' ' +' Al '+ FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryViewVentasHist.Open;
end;

procedure TfrmListadoVentas.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmReportes.qryClientes.Locate('CODIGO_CTE', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text := dmReportes.qryClientesNOMBRE_FACTURAR.Value;
end;

procedure TfrmListadoVentas.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmReportes.qryClientes.Locate('CODIGO_CTE', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text := dmReportes.qryClientesNOMBRE_FACTURAR.Value;
end;

procedure TfrmListadoVentas.cboxCodigoVendedorChange(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('nombrecompleto', cboxCodigoVendedor.Text,[]) then
  edtCodVendedor.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoVentas.edtCodVendedorExit(Sender: TObject);
begin
  if (edtCodVendedor.Text <> '') then
  if dmVentas.qryEmpleado.Locate('Codigo', edtCodVendedor.ValueInteger,[]) then
  edtCodVendedor.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

end.
