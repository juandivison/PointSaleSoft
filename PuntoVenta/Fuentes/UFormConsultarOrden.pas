unit UFormConsultarOrden;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit,
  EditNew;

type
  TfrmConsultaOrdenes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    edtCodCteIni: TEditN;
    ComboBox2: TComboBox;
    edtAsignadoA: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    SkinData1: TSkinData;
    Label5: TLabel;
    edtOrdenIni: TEditN;
    Label6: TLabel;
    edtOrdenFin: TEditN;
    RadioGroup2: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodCteIniChange(Sender: TObject);
    procedure edtAsignadoAChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    orderTipo : integer;
    labelCretrioRep : String;

    Procedure Abrir;
  end;

var
  frmConsultaOrdenes: TfrmConsultaOrdenes;

implementation

uses UDatModReportes;

{$R *.dfm}

{ TfrmConsultaOrdenes }

procedure TfrmConsultaOrdenes.Abrir;
var
  orderByText : string;
  _statusF, _statusI : string;
begin
  orderByText:='';
  //Reporte
  //qckListaFactXCteXProducto
{  if orderTipo = 0 then
  orderByText:= ' order by NOMBRE_VENDEDOR, numero_factura, fecha '
  else
  if orderTipo = 1 then
  orderByText:= ' order by NOMBRE_VENDEDOR, CODIGO_PROD, numero_factura, fecha '
  else
  if orderTipo = 2 then
  orderByText:= ' order by NOMBRE_VENDEDOR, numero_factura, fecha ';
 }
  if RadioGroup2.ItemIndex = 0 then
  begin
    _statusF:='A';
    _statusI:='A';
  end else
  if RadioGroup2.ItemIndex = 1 then
  begin
    _statusF:='R';
    _statusI:='R';
  end else
  begin
    _statusF:='R';
    _statusI:='A';
  end;

  dmReportes.qryReporteOrdenes.Close;
  dmReportes.qryReporteOrdenes.SQL.Clear;

  if edtOrdenIni.ValueInteger > 0 then
  begin
    if (edtCodCteIni.ValueInteger >=0) then
    dmReportes.qryReporteOrdenes.SQL.Text:=
    dmReportes.qryReporteOrdenes_base.SQL.Text + format(' Where status in (%s,%s) and NUM_ORDEN Between %d and %d',
    [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39),edtOrdenIni.ValueInteger, edtOrdenFin.ValueInteger])+orderByText;
    labelCretrioRep:= ' Desde #Orden '+ edtOrdenIni.Text + ' ' +' Hasta '+edtOrdenFin.Text;
    dmReportes.qryReporteOrdenes.Open;
    Exit;
  end;
  case RadioGroup1.ItemIndex of
  0: begin
       if (edtCodCteIni.ValueInteger >=0) then
       dmReportes.qryReporteOrdenes.SQL.Text:=
       dmReportes.qryReporteOrdenes_base.SQL.Text + format(' Where status in (%s,%s) and codigo_cte Between %d and %d',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39),edtCodCteIni.ValueInteger, edtCodCteIni.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteIni.Text;
     end;
  1: begin
       dmReportes.qryReporteOrdenes.SQL.Text:=
       dmReportes.qryReporteOrdenes_base.SQL.Text + format(' Where Status in (%s,%s) and fecha between %s and  %s',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39),chr(39)+
       FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),chr(39)+
       FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;

       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date);
     end;
  2: begin
       dmReportes.qryReporteOrdenes.SQL.Text:=
       dmReportes.qryReporteOrdenes_base.SQL.Text + format(' Where Status in (%s,%s) ',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39)])+
       //,chr(39)+
       Format(' and ASIGNADO_A between %d and  %d ',[edtAsignadoA.ValueInteger, edtAsignadoA.ValueInteger])+
       orderByText;

       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteIni.Text+
       '-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
       + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  3: begin
       dmReportes.qryReporteOrdenes.SQL.Text:=
       dmReportes.qryReporteOrdenes_base.SQL.Text + format(' Where Status in (%s,%s) ',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39)])+
       //,chr(39)+
       Format(' and FECHA_ENTREGA between %s and  %s ',[
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
       chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaFinal.Date)+chr(39)])+
       orderByText;

       labelCretrioRep:= ' Desde '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
       + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  4: begin
       dmReportes.qryReporteOrdenes.SQL.Text:=
       dmReportes.qryReporteOrdenes_base.SQL.Text + format(' Where Status in (%s,%s) ',
       [chr(39)+_statusI+chr(39),chr(39)+_statusF+chr(39)])+
       orderByText;

       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteIni.Text+
       '-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
       + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryReporteOrdenes.Open;
end;

procedure TfrmConsultaOrdenes.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date:=now;
  dbEditFechaFinal.Date:=now;
  dmreportes.qryClientes.Close;
  dmreportes.qryClientes.Open;
  dmreportes.qryClientes.First;
  ComboBox1.Clear;
  ComboBox1.Text:=dmreportes.qryClientesNOMBRE_CTE.Value;
  While not dmreportes.qryClientes.Eof do
  begin
    ComboBox1.Items.Add(dmreportes.qryClientesNOMBRE_CTE.Value);
    dmreportes.qryClientes.Next;
  end;
  ComboBox1Change(Self);

  dmreportes.qryUsuarios.Close;
  dmreportes.qryUsuarios.Open;
  dmreportes.qryUsuarios.First;
  ComboBox2.Clear;
  ComboBox2.Text:=dmreportes.qryUsuariosNOMBRECOMPLETO.Value;
  While not dmreportes.qryUsuarios.Eof do
  begin
    ComboBox2.Items.Add(dmreportes.qryUsuariosNOMBRECOMPLETO.Value);
    dmreportes.qryUsuarios.Next;
  end;
  ComboBox2Change(Self);
end;

procedure TfrmConsultaOrdenes.ComboBox1Change(Sender: TObject);
begin
  if dmreportes.qryClientes.Locate('NOMBRE_CTE',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmreportes.qryClientesCODIGO_CTE.Value)
  else
  edtCodCteIni.Text:='';
end;

procedure TfrmConsultaOrdenes.ComboBox2Change(Sender: TObject);
begin
  if dmreportes.qryUsuarios.Locate('NOMBRECOMPLETO',ComboBox2.Text,[]) then
  edtAsignadoA.SetInteger(dmreportes.qryUsuariosCODIGO_EMPLEADO.Value)
  else
  edtAsignadoA.Text:='';
end;

procedure TfrmConsultaOrdenes.edtCodCteIniChange(Sender: TObject);
begin
  if dmreportes.qryClientes.Locate('codigo_cte',edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=dmreportes.qryClientesNOMBRE_CTE.Value;
end;

procedure TfrmConsultaOrdenes.edtAsignadoAChange(Sender: TObject);
begin
  if dmreportes.qryUsuarios.Locate('CODIGO_EMPLEADO',edtAsignadoA.ValueInteger,[]) then
  ComboBox2.Text :=dmreportes.qryUsuariosNOMBRECOMPLETO.Value;
end;

end.
