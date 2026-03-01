unit UFormParamsRepComTrab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmDatosRepComisiones = class(TForm)
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
    edtNumOrden: TEditN;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodCteIniExit(Sender: TObject);
    procedure edtCodCteFinExit(Sender: TObject);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    labelCretrioRep : String;    
    Procedure AbrirDatos;
  end;

var
  frmDatosRepComisiones: TfrmDatosRepComisiones;

implementation
uses uglobal, UDatModReportes, UDatModComisiones;

{$R *.dfm}

procedure TfrmDatosRepComisiones.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmComision.qryEmpleado.Close;
  dmComision.qryEmpleado.Open;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  dmComision.qryEmpleado.First;
  While Not dmComision.qryEmpleado.Eof Do
  begin
    if (dmComision.qryEmpleadoDESC_CARGO.Value = 'VENDEDOR') Then
    begin
      ComboBox1.Items.Add(dmComision.qryEmpleadoNOMBRECOMPLETO.Value);
      ComboBox2.Items.Add(dmComision.qryEmpleadoNombreCompleto.Value);
    end;
    dmComision.qryEmpleado.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmDatosRepComisiones.ComboBox1Change(Sender: TObject);
begin
  if dmComision.qryEmpleado.Locate('nombrecompleto',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmComision.qryEmpleadoCODIGO.Value);
end;

procedure TfrmDatosRepComisiones.ComboBox2Change(Sender: TObject);
begin
  if dmComision.qryEmpleado.Locate('nombrecompleto',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmComision.qryEmpleadoCODIGO.Value);
end;

procedure TfrmDatosRepComisiones.AbrirDatos;
var
  orderByText : string;
begin
  //Reporte
  //qckListaFactXCteXProducto
  if orderTipo = 0 then
  orderByText:= ' order by COMISION_TRABAJOS.CODIGO_OPERADOR, COMISION_TRABAJOS.NUMERO_FACT, COMISION_TRABAJOS.fecha_factura '
  else
  if orderTipo = 1 then
  orderByText:= ' order by COMISION_TRABAJOS.CODIGO_OPERADOR, TIPO_SERVICIO, COMISION_TRABAJOS.NUMERO_FACT, COMISION_TRABAJOS.fecha_factura '
  else
  if orderTipo = 2 then
  orderByText:= ' order by COMISION_TRABAJOS.CODIGO_OPERADOR, COMISION_TRABAJOS.NUMERO_FACT, COMISION_TRABAJOS.fecha_factura ';

  dmComision.qryListadoPagoComisiones.Close;
  dmComision.qryListadoPagoComisiones.SQL.Clear;
  if (edtNumOrden.ValueInteger > 0) then
  begin
    dmComision.qryListadoPagoComisiones.SQL.Text:=
    dmComision.qryListadoPagoComisionesbase.SQL.Text + format(' Where COMISION_TRABAJOS.Status in (%s,%s) And COMISION_TRABAJOS.NUMERO_FACT = %d',
    [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39), edtNumOrden.ValueInteger])+orderByText;
    labelCretrioRep:= ' Fact Número '+ edtNumOrden.Text;
  end else
  begin
    Case RadioGroup1.ItemIndex Of
    0: begin
         if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
         dmComision.qryListadoPagoComisiones.SQL.Text:=
         dmComision.qryListadoPagoComisionesbase.SQL.Text + format(' Where COMISION_TRABAJOS.Status In (%s,%s) and COMISION_TRABAJOS.CODIGO_OPERADOR between %d and  %d',
         [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39), edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+orderByText;
         labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta ' + edtCodCteFin.Text;
       end;
    1: begin
    {
    WHERE COMISION_TRABAJOS.FECHA_FACTURA BETWEEN :FECHAINI AND :FECHAFIN
    AND   COMISION_TRABAJOS.STATUS IN ('A','R')

    }
         dmComision.qryListadoPagoComisiones.SQL.Text:=
         dmComision.qryListadoPagoComisionesbase.SQL.Text + format(' Where COMISION_TRABAJOS.Status In (%s,%s) and  COMISION_TRABAJOS.FECHA_FACTURA between %s and  %s',
         [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39),
          chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;
         labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
         + ' ' +' Hasta '+ FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date);
       end;
    2: begin
         dmComision.qryListadoPagoComisiones.SQL.Text:=
         dmComision.qryListadoPagoComisionesbase.SQL.Text + format(' Where COMISION_TRABAJOS.Status In (%s,%s) and COMISION_TRABAJOS.FECHA_FACTURA between %s and %s',
         [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
         chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
         format(' and COMISION_TRABAJOS.CODIGO_OPERADOR between %d and  %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
         orderByText;
         labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text+'-.- Del '+
         FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
          + ' ' +' Al '+FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date)
       end;
    end;    
  end;
  dmComision.qryListadoPagoComisiones.Open;
end;


procedure TfrmDatosRepComisiones.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmComision.qryEmpleado.Locate('CODIGO', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text := dmComision.qryEmpleadoNombreCompleto.Value;
end;

procedure TfrmDatosRepComisiones.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmComision.qryEmpleado.Locate('CODIGO', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text := dmComision.qryEmpleadoNombreCompleto.Value;
end;

end.
