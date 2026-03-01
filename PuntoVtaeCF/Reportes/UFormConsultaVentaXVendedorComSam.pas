unit UFormConsultaVentaXVendedorComSam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmListadoVentasXVendedorComSam = class(TForm)
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
    Label5: TLabel;
    ComboBox3: TComboBox;
    edtCategoria: TEditN;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodCteIniExit(Sender: TObject);
    procedure edtCodCteFinExit(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    labelCretrioRep : string;
    Procedure AbrirDatos;
  end;

var
  frmListadoVentasXVendedorComSam: TfrmListadoVentasXVendedorComSam;
  
implementation
uses uglobal, UDatModReportes, UQckRepListaFactura, UDatosVentas,
  UDatModComisiones;

{$R *.dfm}

procedure TfrmListadoVentasXVendedorComSam.FormCreate(Sender: TObject);
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
  ComboBox3.Items.Clear;
  dmVentas.qryInvCategoria.close;
  dmVentas.qryInvCategoria.open;
  While Not dmVentas.qryInvCategoria.Eof Do
  begin
    ComboBox3.Items.Add(dmVentas.qryInvCategoriaDESCRIPCION.Value);
    dmVentas.qryInvCategoria.Next;
  end;
  dmVentas.qryInvCategoria.First;
  ComboBox3.Text:= dmVentas.qryInvCategoriaDESCRIPCION.Value;
  ComboBox3Change(Self);
end;

procedure TfrmListadoVentasXVendedorComSam.ComboBox1Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('nombrecompleto',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoVentasXVendedorComSam.ComboBox2Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('nombrecompleto',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoVentasXVendedorComSam.AbrirDatos;
var
  orderByText : string;
begin
  //Reporte
  //qckListaFactXCteXProducto
  if orderTipo = 0 then
  orderByText:= ' order by codigo_vendedor, codcategoria '
  else
  if orderTipo = 1 then
  orderByText:= ' order by codigo_vendedor, codcategoria '
  else
  if orderTipo = 2 then
  orderByText:= ' order by codigo_vendedor, codcategoria ';


  dmReportes.qryRepComisionSAM.Close;
  dmReportes.qryRepComisionSAM.Filtered := false;
  
  dmReportes.qryRepComisionSAM.SQL.Clear;
  case RadioGroup1.ItemIndex of
  0: begin
       if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
       dmReportes.qryRepComisionSAM.SQL.Text:=
       dmReportes.qryRepComisionSAM_base.SQL.Text + format(' Where CODIGO_VENDEDOR between %d and  %d',
       [edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde '+ FormatDatetime('dd/mm/yyyy', dbEditFechaInicial.Date) + ' ' +
                         ' Hasta '+FormatDatetime('dd/mm/yyyy', dbEditFechaFinal.Date);
     end;
  1: begin
       if (edtCategoria.ValueInteger >=0)  then
       dmReportes.qryRepComisionSAM.SQL.Text:=
       dmReportes.qryRepComisionSAM_base.SQL.Text + format(' Where CODCATEGORIA between %d and  %d',
       [edtCategoria.ValueInteger, edtCategoria.ValueInteger])+orderByText;
       labelCretrioRep:= 'Cateogria '+ ComboBox3.text+'. Desde '+ FormatDatetime('dd/mm/yyyy', dbEditFechaInicial.Date) + ' ' +
                         ' Hasta '+FormatDatetime('dd/mm/yyyy', dbEditFechaFinal.Date);
     end;
  2: begin
       dmReportes.qryRepComisionSAM.SQL.Text:=
       dmReportes.qryRepComisionSAM_base.SQL.Text;
       // + format(' Where Status in (%s,%s) and fecha between %s and  %s',
       //[chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
       // chr(39)+FormatDateTime('dd/mm/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;
       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date);
     end;
  {2: begin
       dmReportes.qryRepComisionSAM.SQL.Text:=
       dmReportes.qryRepComisionSAM_base.SQL.Text + format(' Where Status in (%s,%s) and  fecha between %s and %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
       format(' and CODIGO_VENDEDOR between %d and  %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
       orderByText;
       labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+ edtCodCteFin.Text+'-.- Del '+
       FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
        + ' ' +' Al '+FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date)
     end;}
  end;
  //dmReportes.qryRepComisionSAM.Database.DatabaseName;
  dmReportes.qryRepComisionSAM.params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
  dmReportes.qryRepComisionSAM.params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
  dmReportes.qryRepComisionSAM.Open;//.qryRepComisionSAM.SQL.Text
  dmReportes.qryRepComisionSAM.First;
end;

procedure TfrmListadoVentasXVendedorComSam.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmVentas.qryEmpleadoNOMBRECOMPLETO.Value;
end;

procedure TfrmListadoVentasXVendedorComSam.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmVentas.qryEmpleadoNOMBRECOMPLETO.Value;
end;

procedure TfrmListadoVentasXVendedorComSam.ComboBox3Change(
  Sender: TObject);
begin
  if dmventas.qryInvCategoria.Locate('DESCRIPCION',ComboBox3.Text,[]) then
  edtCategoria.SetInteger(dmventas.qryInvCategoriaCODCATEGORIA.Value)
  else
  begin
    edtCategoria.SetInteger(0);
    edtCategoria.Text:='';
  end;
end;

end.
