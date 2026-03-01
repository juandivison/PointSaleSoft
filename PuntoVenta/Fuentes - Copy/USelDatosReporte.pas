unit USelDatosReporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, ExtCtrls, Buttons, Mask, rxToolEdit,
  EditNew;

type
  TfrmDatosReporte = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    edtCodCteIni: TEditN;
    ComboBox2: TComboBox;
    edtCodCteFin: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    chboxExportarPDF: TCheckBox;
    edtNumFactura: TEditN;
    SkinData1: TSkinData;
    rdgMoneda: TRadioGroup;
    Label6: TLabel;
    edtNumTransf: TEditN;
    chkResumen: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure edtCodCteIniExit(Sender: TObject);
    procedure edtCodCteFinExit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    labelCretrioRep : String;
    Procedure AbrirDatos;
  end;

var
  frmDatosReporte: TfrmDatosReporte;

implementation

uses UDatModReportes, Uglobal;

{$R *.dfm}

procedure TfrmDatosReporte.FormCreate(Sender: TObject);
begin
  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date   := ExtraerFecha(GlbFechaTrnDiaria);
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
end;

procedure TfrmDatosReporte.edtCodCteIniExit(Sender: TObject);
begin
  if (edtCodCteIni.Text <> '') then
  if dmReportes.qryClientes.Locate('CODIGO_CTE', edtCodCteIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmReportes.qryClientesNOMBRE_FACTURAR.Value;
end;

procedure TfrmDatosReporte.edtCodCteFinExit(Sender: TObject);
begin
  if (edtCodCteFin.Text <> '') then
  if dmReportes.qryClientes.Locate('CODIGO_CTE', edtCodCteFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmReportes.qryClientesNOMBRE_FACTURAR.Value;
end;

procedure TfrmDatosReporte.ComboBox1Change(Sender: TObject);
begin
  if dmReportes.qryClientes.Locate('NOMBRE_FACTURAR',ComboBox1.Text,[]) then
  edtCodCteIni.SetInteger(dmReportes.qryClientesCODIGO_CTE .Value);
end;

procedure TfrmDatosReporte.ComboBox2Change(Sender: TObject);
begin
  if dmReportes.qryClientes.Locate('NOMBRE_FACTURAR',ComboBox2.Text,[]) then
  edtCodCteFin.SetInteger(dmReportes.qryClientesCODIGO_CTE .Value);
end;

procedure TfrmDatosReporte.AbrirDatos;
var
  orderByText : string;
  sqlBase : String;
begin
  //Reporte
  //qckListaFactXCteXProducto
  sqlBase := 'SELECT * FROM Proc_datos_venta_diaria(:Fechaini, :Fechafin,:ciakey) ';
  if RadioGroup1.ItemIndex = 0 then
  orderByText:= ' Order by CODIGO_EMPLEADO, TIPO_DOCUMENTO,CODIGO_CLIENTE,TIPO_DOCUMENTO,NUMERO_DOCUMENTO '
  else
  if RadioGroup1.ItemIndex = 1 then
  orderByText:= ' Order by CODIGO_EMPLEADO, TIPO_DOCUMENTO, FECHA, CODIGO_CLIENTE,NUMERO_DOCUMENTO'
  else
  if RadioGroup1.ItemIndex = 2 then
  orderByText:= ' Order by CODIGO_EMPLEADO, TIPO_DOCUMENTO, FECHA, CODIGO_CLIENTE,TIPO_DOCUMENTO,NUMERO_DOCUMENTO  ';

  dmReportes.qryDatosRepVentaDiaria.Close;
  dmReportes.qryDatosRepVentaDiaria.SQL.Clear;

  if (edtNumTransf.ValueInteger > 0) then
  begin
    dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
    dmReportes.qryDatosRepVentaDiaria.SQL.Text + ' Where NUM_TRANSFERENCIA = '+
    edtNumTransf.Text + orderByText;
  end else              
  begin
    Case RadioGroup1.ItemIndex Of
    0: begin
         if (edtCodCteIni.ValueInteger >=0) And (edtCodCteFin.ValueInteger >=0) then
         dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
         sqlBase + format(' Where codigo_cliente between %d and  %d',
         [edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+orderByText;
         labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta ' + edtCodCteFin.Text;
       end;
    1: begin
         dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
         sqlBase + format(' Where fecha between %s and %s',
         [chr(39)+FormatDateTime('mm/dd/yyyy', dbEditFechaInicial.Date)+chr(39),
          chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;
         labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
         + ' ' +' Hasta '+ FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date);
       end;                            
    2: begin
         dmReportes.qryDatosRepVentaDiaria.SQL.Text:=
         sqlBase + format(' Where codigo_cliente between %d and %d ',[edtCodCteIni.ValueInteger, edtCodCteFin.ValueInteger])+
         orderByText;
         labelCretrioRep:= ' Desde '+ edtCodCteIni.Text + ' ' +' Hasta '+edtCodCteFin.Text+'-.- Del '+
         FormatDateTime('dd/mm/yyyy', dbEditFechaInicial.Date)
          + ' ' +' Al '+FormatDateTime('dd/mm/yyyy', dbEditFechaFinal.Date)
       end;
    end;
  end;
  if dmReportes.qryDatosRepVentaDiaria.Params.Count = 3 then
  begin
    dmReportes.qryDatosRepVentaDiaria.Params[0].Value:= ExtraerFecha(frmDatosReporte.dbEditFechaInicial.Date);
    dmReportes.qryDatosRepVentaDiaria.Params[1].Value:= ExtraerFecha(frmDatosReporte.dbEditFechaFinal.Date);
    dmReportes.qryDatosRepVentaDiaria.Params[2].Value:= glbCia_Key; 
  end;
  dmReportes.qryDatosRepVentaDiaria.Open;
end;

end.
