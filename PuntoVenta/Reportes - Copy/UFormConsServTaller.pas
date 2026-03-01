unit UFormConsServTaller;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Mask, rxToolEdit, EditNew,
  ExtCtrls;

type
  TfrmListadoServTaller = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    edtCodEmpIni: TEditN;
    ComboBox2: TComboBox;
    Label2: TLabel;
    edtCodEmpFin: TEditN;
    dbEditFechaInicial: TDateEdit;
    dbEditFechaFinal: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox3: TComboBox;
    edtCodigoCteIni: TEditN;
    ComboBox4: TComboBox;
    edtCodigoCteFin: TEditN;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure edtCodEmpIniExit(Sender: TObject);
    procedure edtCodEmpFinExit(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure edtCodigoCteIniExit(Sender: TObject);
    procedure edtCodigoCteFinExit(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);

  private
    { Private declarations }
  public
    orderTipo : smallint;
    Procedure AbrirDatos;
  end;

var
  frmListadoServTaller: TfrmListadoServTaller;
  labelCretrioRep : String;
implementation
uses uglobal, UDatModReportes, UQckRepListaFactura, UDatosVentas;

{$R *.dfm}

procedure TfrmListadoServTaller.FormCreate(Sender: TObject);
begin
  dmReportes.qryClientes.Close;
  dmReportes.qryClientes.Open;

  dbEditFechaInicial.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dbEditFechaFinal.Date := ExtraerFecha(GlbFechaTrnDiaria);
  dmReportes.qryClientes.First;
  ComboBox3.Items.Clear;
  While Not dmReportes.qryClientes.Eof Do
  begin
    ComboBox3.Items.Add(dmReportes.qryClientesNOMBRE_CTE.Value);
    dmReportes.qryClientes.Next;
  end;

  dmVentas.qryEmpleado.Close;
  dmVentas.qryEmpleado.Open;
  dmVentas.qryEmpleado.First;
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  While Not dmVentas.qryEmpleado.Eof Do
  begin
    ComboBox1.Items.Add(dmVentas.qryEmpleadoNombreCompleto.Value);
    ComboBox2.Items.Add(dmVentas.qryEmpleadoNombreCompleto.Value);
    dmVentas.qryEmpleado.Next;
  end;
  ComboBox1.ItemIndex:=0;
  ComboBox1Change(Self);
  ComboBox2.ItemIndex:=0;
  ComboBox2Change(Self);
end;

procedure TfrmListadoServTaller.ComboBox1Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('nombrecompleto',ComboBox1.Text,[]) then
  edtCodEmpIni.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoServTaller.ComboBox2Change(Sender: TObject);
begin
  if dmVentas.qryEmpleado.Locate('nombrecompleto',ComboBox2.Text,[]) then
  edtCodEmpIni.SetInteger(dmVentas.qryEmpleadoCODIGO.Value);
end;

procedure TfrmListadoServTaller.AbrirDatos;
var
  orderByText : string;
begin
  //Reporte
  //qckListaFactXCteXProducto
  if orderTipo = 0 then
  orderByText:= ' order by CODIGO_EMP, SERVICIOS_MASTER.fecha_entrada '
  else
  if orderTipo = 1 then
  orderByText:= ' order by CODIGO_EMP, SERVICIOS_MASTER.fecha_entrada '
  else
  if orderTipo = 2 then
  orderByText:= ' order by CODIGO_EMP ';

  dmReportes.qryRepServTallerM.Close;
  dmReportes.qryRepServTallerM.SQL.Clear;
  case RadioGroup1.ItemIndex of
  0: begin //rango vendedor
       if (edtCodEmpIni.ValueInteger >=0) And (edtCodEmpFin.ValueInteger >=0) then
       dmReportes.qryRepServTallerM.SQL.Text:=
       dmReportes.qryRepServTallerM_base.SQL.Text + format(' Where SERVICIOS_MASTER.Status in (%s,%s) and  '+
                                                           'SERVICIOS_MASTER.CODIGO_EMP between %d and  %d',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),edtCodEmpIni.ValueInteger, edtCodEmpFin.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde '+ edtCodEmpIni.Text + ' ' +' Hasta '+edtCodEmpFin.Text;
     end;
  1: begin  //Fecha
       dmReportes.qryRepServTallerM.SQL.Text:=
       dmReportes.qryRepServTallerM_base.SQL.Text + format(' Where SERVICIOS_MASTER.Status in (%s,%s) and '+
                                         'SERVICIOS_MASTER.fecha_entrada between %s and  %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+orderByText;
       labelCretrioRep:= ' Desde '+ FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Hasta '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date);
     end;
  2: begin  //Cliente
       if (edtCodigoCteIni.ValueInteger >=0) And (edtCodigoCteFin.ValueInteger >=0) then
       dmReportes.qryRepServTallerM.SQL.Text:=
       dmReportes.qryRepServTallerM_base.SQL.Text + format(' Where SERVICIOS_MASTER.Status in (%s,%s) and  '+
                                                           'SERVICIOS_MASTER.CODIGO_CTE between %d and  %d',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),edtCodigoCteIni.ValueInteger, edtCodigoCteFin.ValueInteger])+orderByText;
       labelCretrioRep:= ' Desde '+ edtCodigoCteIni.Text + ' ' +' Hasta '+edtCodigoCteFin.Text;
     end;
  3: begin //Todo
       dmReportes.qryRepServTallerM.SQL.Text:=
       dmReportes.qryRepServTallerM_base.SQL.Text + format(' Where SERVICIOS_MASTER.Status in (%s,%s) and  SERVICIOS_MASTER.fecha_entrada Between %s and %s',
       [chr(39)+'A'+chr(39),chr(39)+'R'+chr(39),chr(39)+FormatDateTime('mm/dd/yyyy',dbEditFechaInicial.Date)+chr(39),
        chr(39)+FormatDateTime('mm/dd/yyyy',  dbEditFechaFinal.Date)+chr(39)])+
       format(' and SERVICIOS_MASTER.CODIGO_EMP Between %d and  %d ',[edtCodEmpIni.ValueInteger, edtCodEmpFin.ValueInteger])+
       format(' and SERVICIOS_MASTER.CODIGO_CTE Between %d and  %d ',[edtCodigoCteIni.ValueInteger, edtCodigoCteFin.ValueInteger])+
       orderByText;
       labelCretrioRep:=
       ' Desde Cte '+ edtCodigoCteIni.Text + ' ' +' Hasta Cte '+edtCodigoCteFin.Text+
       ' -.- Desde Emp '+ edtCodEmpIni.Text + ' ' +' Hasta Emp'+edtCodEmpFin.Text+'-.- Del '+
       FormatDateTime('dd/mm/yyyy',dbEditFechaInicial.Date)
        + ' ' +' Al '+FormatDateTime('dd/mm/yyyy',dbEditFechaFinal.Date)
     end;
  end;
  dmReportes.qryRepServTallerDet.Close;
  dmReportes.qryRepServTallerDet.Params[0].Value:= ExtraerFecha(dbEditFechaInicial.Date);
  dmReportes.qryRepServTallerDet.Params[1].Value:= ExtraerFecha(dbEditFechaFinal.Date);
  dmReportes.qryRepServTallerM.Open;
  dmReportes.qryRepServTallerM.Sql.Text

end;

procedure TfrmListadoServTaller.edtCodEmpIniExit(Sender: TObject);
begin
  if (edtCodEmpIni.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodEmpIni.ValueInteger,[]) then
  ComboBox1.Text :=  dmVentas.qryEmpleadoNOMBRECOMPLETO.Value;
end;

procedure TfrmListadoServTaller.edtCodEmpFinExit(Sender: TObject);
begin
  if (edtCodEmpFin.Text <> '') then
  if dmVentas.qryEmpleado.Locate('CODIGO', edtCodEmpFin.ValueInteger,[]) then
  ComboBox2.Text :=  dmVentas.qryEmpleadoNOMBRECOMPLETO.Value;
end;

procedure TfrmListadoServTaller.ComboBox3Change(Sender: TObject);
begin
  //ComboBox3.Items.Add(dmReportes.qryClientesNOMBRE_CTE.Value);
  if dmReportes.qryClientes.Locate('NOMBRE_CTE', ComboBox3.Text,[]) then
  edtCodigoCteIni.SetInteger(dmReportes.qryClientesCODIGO_CTE.Value);
end;

procedure TfrmListadoServTaller.edtCodigoCteIniExit(Sender: TObject);
begin
  if (edtCodigoCteIni .Text <> '') then
  if dmReportes.qryClientes.Locate('CODIGO', edtCodigoCteIni.ValueInteger,[]) then
  ComboBox3.Text :=  dmReportes.qryClientesNOMBRE_CTE.Value;
end;

procedure TfrmListadoServTaller.edtCodigoCteFinExit(Sender: TObject);
begin
  if (edtCodigoCteFin.Text <> '') then
  if dmreportes.qryClientes.Locate('CODIGO', edtCodigoCteFin.ValueInteger,[]) then
  ComboBox4.Text := dmreportes.qryClientesNOMBRE_CTE.Value;
end;

procedure TfrmListadoServTaller.ComboBox4Change(Sender: TObject);
begin
  if dmReportes.qryClientes.Locate('NOMBRE_CTE', ComboBox4.Text,[]) then
  edtCodigoCteFin.SetInteger(dmReportes.qryClientesCODIGO_CTE.Value);
end;

end.
