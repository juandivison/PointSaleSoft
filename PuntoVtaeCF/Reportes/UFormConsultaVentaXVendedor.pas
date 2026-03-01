unit UFormConsultaVentaXVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmListadoVentasXVendedor = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodCteIniExit(Sender: TObject);
    procedure edtCodCteFinExit(Sender: TObject);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    Procedure AbrirDatos;
  end;

var
  frmListadoVentasXVendedor: TfrmListadoVentasXVendedor;
  labelCretrioRep : String;
implementation
uses uglobal, UDatModReportes, UQckRepListaFactura, UDatosVentas,
  UDatModComisiones;

{$R *.dfm}

procedure TfrmListadoVentasXVendedor.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmReportes.qryClientes.Close;
  dmReportes.qryClientes.Open;
  dmReportes.qryClientes.First;
  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  dmVentas.qryEmpleado.First;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  While Not dmVentas.qryEmpleado.Eof Do
  begin
    //if (dmVentas.qryEmpleadoDESC_CARGO.Value = 'VENDEDOR') Then
    begin
      ComboBox1.Items.Add(dmVentas.qryEmpleadoNOMBRECOMPLETO.Value);
      ComboBox2.Items.Add(dmVentas.qryEmpleadoNombreCompleto.Value);
    end;
    //ComboBox1.Items.Add(dmVentas.qryEmpleadoNombreCompleto.Value);
    //ComboBox2.Items.Add(dmVentas.qryEmpleadoNombreCompleto.Value);
    dmVentas.qryEmpleado.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmListadoVentasXVendedor.ComboBox1Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('nombrecompleto',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoVentasXVendedor.ComboBox2Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('nombrecompleto',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoVentasXVendedor.AbrirDatos;
var
  orderByText : string;
begin
  //Reporte
  if orderTipo = 0 then
  orderByText:= ' order by RUTA, CODIGO_VENDEDOR. numero_factura, fecha '
  else
  if orderTipo = 1 then
  orderByText:= ' order by RUTA, CODIGO_VENDEDOR, CODIGO_PROD, numero_factura, fecha '
  else
  if orderTipo = 2 then
  orderByText:= ' order by RUTA, CODIGO_VENDEDOR, numero_factura, fecha ';

  dmReportes.qryViewVentasHist.Close;
  dmReportes.qryViewVentasHist.SQL.Clear;
  case RadioGroup1.ItemIndex of
  0: begin
       if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
       dmReportes.qryViewVentasHist.SQL.Text:=
       dmReportes.qryViewVentasHist_base.SQL.Text + format(' Where Status in (%s,%s) and  CODIGO_VENDEDOR between %d and  %d',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde Ruta '+ edtCodCteIni.Text + ' ' +' Hasta Ruta '+edtCodCteFin.Text;
     end;
  1: begin
       dmReportes.qryViewVentasHist.SQL.Text:=
       dmReportes.qryViewVentasHist_base.SQL.Text + format(' Where Status in (%s,%s) and fecha between %s and  %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;
       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date);
     end;
  2: begin
       dmReportes.qryViewVentasHist.SQL.Text:=
       dmReportes.qryViewVentasHist_base.SQL.Text + format(' Where Status in (%s,%s) and  fecha between %s and %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
       format(' and CODIGO_VENDEDOR between %d and  %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
       orderByText;
       labelCretrioRep:= ' Desde CodVendedor '+ edtCodCteIni.Text + ' ' +' Hasta CodVendedor '+edtCodCteFin.Text+'-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryViewVentasHist.Open;
end;

procedure TfrmListadoVentasXVendedor.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmVentas.qryEmpleadoNOMBRECOMPLETO.Value;
end;

procedure TfrmListadoVentasXVendedor.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmVentas.qryEmpleadoNOMBRECOMPLETO.Value;
end;

end.
