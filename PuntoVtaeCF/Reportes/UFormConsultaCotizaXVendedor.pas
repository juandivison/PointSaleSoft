unit UFormConsultaCotizaXVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmListadoCotizacionesXVendedor = class(TForm)
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
  frmListadoCotizacionesXVendedor: TfrmListadoCotizacionesXVendedor;
  labelCretrioRep : String;
implementation
uses uglobal, UDatModReportes, UQckRepListaFactura, UDatmodDatosGenerales,
  UDatosVentas;

{$R *.dfm}

procedure TfrmListadoCotizacionesXVendedor.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  dmVentas.qryEmpleado.First;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  While Not dmVentas.qryEmpleado.Eof Do
  begin
    ComboBox1.Items.Add(dmVentas.qryEmpleadonombrecompleto.Value);
    ComboBox2.Items.Add(dmVentas.qryEmpleadonombrecompleto.Value);
    dmVentas.qryEmpleado.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmListadoCotizacionesXVendedor.ComboBox1Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('NOMBRECOMPLETO',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoCotizacionesXVendedor.ComboBox2Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('NOMBRECOMPLETO',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoCotizacionesXVendedor.AbrirDatos;
var
  orderByText : string;
begin
  //Reporte
  //qckListaFactXCteXProducto
  if orderTipo = 0 then
  orderByText:= ' order by VIEW_COTIZACION_MASTER.codigo_vendedor, VIEW_COTIZACION_MASTER.numero, VIEW_COTIZACION_MASTER.fecha '
  else
  if orderTipo = 1 then
  orderByText:= ' order by VIEW_COTIZACION_MASTER.codigo_vendedor, VIEW_COTIZACION_MASTER.CODIGO_PROD, VIEW_COTIZACION_MASTER.numero, VIEW_COTIZACION_MASTER.fecha '
  else
  if orderTipo = 2 then
  orderByText:= ' order by VIEW_COTIZACION_MASTER.codigo_vendedor, VIEW_COTIZACION_MASTER.numero, VIEW_COTIZACION_MASTER.fecha ';


  dmReportes.qryRepCotizaciones.Close;
  dmReportes.qryRepCotizaciones.SQL.Clear;
  case RadioGroup1.ItemIndex of
  0: begin
       if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
       dmReportes.qryRepCotizaciones.SQL.Text:=
       dmReportes.qryRepCotizacionesbase.SQL.Text + format(' Where VIEW_COTIZACION_MASTER.Status in (%s,%s) and VIEW_COTIZACION_MASTER.codigo_vendedor between %d and  %d',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text;
     end;
  1: begin
       dmReportes.qryRepCotizaciones.SQL.Text:=
       dmReportes.qryRepCotizacionesbase.SQL.Text + format(' Where VIEW_COTIZACION_MASTER.Status in (%s,%s) and  VIEW_COTIZACION_MASTER.fecha between %s and  %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;
       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date);
     end;
  2: begin
       dmReportes.qryRepCotizaciones.SQL.Text:=
       dmReportes.qryRepCotizacionesbase.SQL.Text + format(' Where VIEW_COTIZACION_MASTER.Status in (%s,%s) and  VIEW_COTIZACION_MASTER.fecha between %s and %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
       format(' and VIEW_COTIZACION_MASTER.codigo_vendedor between %d and  %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
       orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text+'-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryRepCotizaciones.Open;
end;

procedure TfrmListadoCotizacionesXVendedor.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmVentas.qryEmpleadoNOMBREcompleto.Value;
end;

procedure TfrmListadoCotizacionesXVendedor.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmVentas.qryEmpleadoNOMBREcompleto.Value;
end;

end.
