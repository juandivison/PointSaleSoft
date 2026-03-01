unit UFormConsultaVentaXRuta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmListadoVentasXRuta = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    edtCodRutaIni: TEditN;
    ComboBox2: TComboBox;
    Label2: TLabel;
    edtCodRutaFin: TEditN;
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
    procedure edtCodRutaIniExit(Sender: TObject);
    procedure edtCodRutaFinExit(Sender: TObject);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    labelCretrioRep : String;
    Procedure AbrirDatos;
  end;

var
  frmListadoVentasXRuta: TfrmListadoVentasXRuta;

implementation
uses uglobal, UDatModReportes, UQckRepListaFactura, UDatosVentas,
  UDatModComisiones, UDatModClientes;

{$R *.dfm}

procedure TfrmListadoVentasXRuta.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date   := ExtraerFecha(GlbFechaTrnDiaria);
  dmclientes.tblRutaVta.Close;
  dmclientes.tblRutaVta.Open;
  dmReportes.qryClientes.Close;
  dmReportes.qryClientes.Open;
  dmReportes.qryClientes.First;

  dmclientes.tblRutaVta.First;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  While Not dmclientes.tblRutaVta.Eof Do
  begin
    ComboBox1.Items.Add(dmclientes.tblRutaVtaDESCRIPCION.Value);
    ComboBox2.Items.Add(dmclientes.tblRutaVtaDESCRIPCION.Value);
    dmclientes.tblRutaVta.Next;
  end;
    //ComboBox1.Items.Add(dmVentas.qryEmpleadoNombreCompleto.Value);
    //ComboBox2.Items.Add(dmVentas.qryEmpleadoNombreCompleto.Value);
   
  //end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmListadoVentasXRuta.ComboBox1Change(Sender: TObject);
begin
  if dmclientes.tblRutaVta.Locate('DESCRIPCION',ComboBox1.Text,[]) then
  edtCodRutaIni.SetInteger(dmclientes.tblRutaVtaCODIGO.Value);
end;

procedure TfrmListadoVentasXRuta.ComboBox2Change(Sender: TObject);
begin
  if dmclientes.tblRutaVta.Locate('DESCRIPCION',ComboBox2.Text,[]) then
  edtCodRutaFin.SetInteger(dmclientes.tblRutaVtaCODIGO.Value);
end;

procedure TfrmListadoVentasXRuta.AbrirDatos;
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
       if (edtCodRutaIni.ValueInteger >=0) And (edtCodRutaFin.ValueInteger >=0) then
       dmReportes.qryViewVentasHist.SQL.Text:=
       dmReportes.qryViewVentasHist_base.SQL.Text + format(' Where Status in (%s,%s) and  RUTA between %d and  %d',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),edtCodRutaIni.ValueInteger, edtCodRutaFin.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde Ruta '+ edtCodRutaIni.Text + ' ' +' Hasta Ruta '+edtCodRutaFin.Text;
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
       format(' and RUTA between %d and  %d ',[edtCodRutaIni.ValueInteger, edtCodRutaFin.ValueInteger])+
       orderByText;
       labelCretrioRep:= ' Desde Ruta '+ edtCodRutaIni.Text + ' ' +' Hasta Ruta '+edtCodRutaFin.Text+'-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryViewVentasHist.Open;
end;

procedure TfrmListadoVentasXRuta.edtCodRutaIniExit(Sender: TObject);
begin
  if (edtCodRutaIni.Text <> '') then
  if dmclientes.tblRutaVta.Locate('CODIGO', edtCodRutaIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmclientes.tblRutaVtaDESCRIPCION.Value;
end;

procedure TfrmListadoVentasXRuta.edtCodRutaFinExit(Sender: TObject);
begin
  if (edtCodRutaFin.Text <> '') then
  if dmclientes.tblRutaVta.Locate('CODIGO', edtCodRutaFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmclientes.tblRutaVtaDESCRIPCION.Value;
end;

end.
