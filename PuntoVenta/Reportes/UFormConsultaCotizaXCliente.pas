unit UFormConsultaCotizaXCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmListadoCotizaciones = class(TForm)
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
    edtNumCotizacion: TEditN;
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
    Procedure AbrirDatos;
  end;

var
  frmListadoCotizaciones: TfrmListadoCotizaciones;
  labelCretrioRep : String;
implementation
uses uglobal, UDatModReportes, UQckRepListaFactura;

{$R *.dfm}

procedure TfrmListadoCotizaciones.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmReportes.qryClientes.Close;
  dmReportes.qryClientes.Open;
  dmReportes.qryClientes.First;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
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
end;

procedure TfrmListadoCotizaciones.ComboBox1Change(Sender: TObject);
begin
  if dmReportes.qryClientes.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmReportes.qryClientesCODIGO_CTE.Value);
end;

procedure TfrmListadoCotizaciones.ComboBox2Change(Sender: TObject);
begin
  if dmReportes.qryClientes.Locate('NOMBRE_FACTURAR',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmReportes.qryClientesCODIGO_CTE.Value);
end;

procedure TfrmListadoCotizaciones.AbrirDatos;
var
  orderByText : string;
begin
  //Reporte
  //qckListaFactXCteXProducto
  if orderTipo = 0 then
  orderByText:= ' order by VIEW_COTIZACION_MASTER.codigo_cte, VIEW_COTIZACION_MASTER.numero, VIEW_COTIZACION_MASTER.fecha '
  else
  if orderTipo = 1 then
  orderByText:= ' order by VIEW_COTIZACION_MASTER.codigo_cte, VIEW_COTIZACION_MASTER.CODIGO_PROD, VIEW_COTIZACION_MASTER.numero, VIEW_COTIZACION_MASTER.fecha '
  else
  if orderTipo = 2 then
  orderByText:= ' order by VIEW_COTIZACION_MASTER.codigo_cte, VIEW_COTIZACION_MASTER.numero, VIEW_COTIZACION_MASTER.fecha ';


  dmReportes.qryRepCotizaciones.Close;
  dmReportes.qryRepCotizaciones.SQL.Clear;
  if (edtNumCotizacion.ValueInteger > 0) then
  begin
    dmReportes.qryRepCotizaciones.SQL.Text:=
    dmReportes.qryRepCotizacionesbase.SQL.Text + Format(' Where VIEW_COTIZACION_MASTER.Numero = %d ',
    [edtNumCotizacion.ValueInteger]) + orderByText;
    labelCretrioRep:= '';
  end else
  case RadioGroup1.ItemIndex of
  0: begin
       if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
       dmReportes.qryRepCotizaciones.SQL.Text:=
       dmReportes.qryRepCotizacionesbase.SQL.Text + format(' Where VIEW_COTIZACION_MASTER.Status in (%s,%s) and VIEW_COTIZACION_MASTER.codigo_cte between %d and  %d',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text;
     end;
  1: begin
       dmReportes.qryRepCotizaciones.SQL.Text:=
       dmReportes.qryRepCotizacionesbase.SQL.Text + format(' Where VIEW_COTIZACION_MASTER.Status in (%s,%s) and VIEW_COTIZACION_MASTER.fecha between %s and  %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;
       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date);
     end;
  2: begin
       dmReportes.qryRepCotizaciones.SQL.Text:=
       dmReportes.qryRepCotizacionesbase.SQL.Text + format(' Where VIEW_COTIZACION_MASTER.Status in (%s,%s) and VIEW_COTIZACION_MASTER.fecha between %s and %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
       format(' and VIEW_COTIZACION_MASTER.codigo_cte between %d and  %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
       orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text+'-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryRepCotizaciones.Open;
end;

procedure TfrmListadoCotizaciones.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmReportes.qryClientes.Locate('CODIGO_CTE', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmReportes.qryClientesNOMBRE_FACTURAR.Value;
end;

procedure TfrmListadoCotizaciones.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmReportes.qryClientes.Locate('CODIGO_CTE', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmReportes.qryClientesNOMBRE_FACTURAR.Value;
end;

end.
