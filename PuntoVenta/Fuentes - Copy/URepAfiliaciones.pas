unit URepAfiliaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, Buttons, ExtCtrls, EditNew, DB,
  IBCustomDataSet, IBQuery, WinSkinData, RxMemDS, Grids, DBGrids, RxDBCtrl,
  RxCtrls;

type
  TfrmRepInspecciones = class(TForm)
    dtpkFechaIni: TDateEdit;
    Label1: TLabel;
    dtpkFechaFin: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    edtCodVendedorIni: TEditN;
    ComboBox2: TComboBox;
    edtTipoAfiliado: TEditN;
    RadioGroup1: TRadioGroup;
    rdgTodos: TRadioButton;
    qryDatosBases: TIBQuery;
    Button1: TButton;
    qryEmpleado: TIBQuery;
    qryEmpleadoCODIGO: TIntegerField;
    qryEmpleadoNOMBRE: TIBStringField;
    qryEmpleadoAPELLIDO: TIBStringField;
    qryEmpleadoNOMBRECOMPLETO: TIBStringField;
    BitBtn5: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dsqryResumen: TDataSource;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    qryEmpleadoCARGO_EMPLEADO: TIBStringField;
    RadioButton1: TRadioButton;
    SkinData1: TSkinData;
    rdgVendedor: TRadioButton;
    qryRepInspecciones: TIBQuery;
    qryRepInspeccionesBase: TIBQuery;
    qryRepInspeccionesCODIGO: TIntegerField;
    qryRepInspeccionesCIA_KEY: TIntegerField;
    qryRepInspeccionesFECHA: TDateTimeField;
    qryRepInspeccionesNOMBRE: TIBStringField;
    qryRepInspeccionesAPELLIDO: TIBStringField;
    qryRepInspeccionesDIRECCION_CONT: TIBStringField;
    qryRepInspeccionesCIUDAD: TIBStringField;
    qryRepInspeccionesESTADO: TIBStringField;
    qryRepInspeccionesPAIS: TIBStringField;
    qryRepInspeccionesTELEF_CONTACTO: TIBStringField;
    qryRepInspeccionesMOVIL1: TIBStringField;
    qryRepInspeccionesEMAIL: TIBStringField;
    qryRepInspeccionesCOMENTARIO: TMemoField;
    qryRepInspeccionesCOD_VENDEDOR: TIntegerField;
    qryRepInspeccionesTIPO_AFILIADO: TSmallintField;
    qryRepInspeccionesMARCA: TIBStringField;
    qryRepInspeccionesMODELO: TIBStringField;
    qryRepInspeccionesANO_VEH: TIntegerField;
    qryRepInspeccionesCHASSIS: TIBStringField;
    qryRepInspeccionesCOLOR: TIBStringField;
    qryRepInspeccionesTIPO_SEGURO: TSmallintField;
    qryRepInspeccionesKILOMETRAJE: TIntegerField;
    qryRepInspeccionesINSERTADO_POR: TIBStringField;
    qryRepInspeccionesFECHA_INSERTADO: TDateTimeField;
    qryRepInspeccionesFECHA_MOD: TDateTimeField;
    qryRepInspeccionesUPD_POR: TIBStringField;
    qryRepInspeccionesSYNC_STATUS: TSmallintField;
    qryRepInspeccionesESTADO_INSPECCION: TSmallintField;
    qryTipoAfiliado: TIBQuery;
    qryTipoAfiliadoIDTIPO: TIntegerField;
    qryTipoAfiliadoDESCRIPCION: TIBStringField;
    qryTipoAfiliadoMONTOCOBERTURA: TFloatField;
    qryTipoAfiliadoDIASDECARENCIA: TIntegerField;
    qryTipoAfiliadoYEARANTIGUEDAD: TIntegerField;
    qryTipoAfiliadoSTATUS: TIBStringField;
    qryTipoAfiliadoRUTACARTABIENVENIDA: TIBStringField;
    qryResumen: TIBQuery;
    qryResumenTIPO_AFILIADO: TSmallintField;
    qryResumenESTATUS: TIBStringField;
    qryResumenCANT: TIntegerField;
    qryRepInspeccionesESTATUSINSPECCION: TIBStringField;
    BitBtn1: TBitBtn;
    qryRepInspeccionesCONCARENCIA: TSmallintField;
    qryRepInspeccionesNOMBREVENDEDOR: TIBStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure qryRepInspeccionesAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure PrepararDatos;
    procedure ActualizaResumen(st:string;cant:integer);

    procedure GeneraReporte(tipo: smallint; strCriterio: String);
  public
    { Public declarations }
  end;

var
  frmRepInspecciones: TfrmRepInspecciones;
  strC : string;
  strNombre : string;
implementation

uses UDatModConectar, UGlobal, URepInspecciones;

{$R *.dfm}

{ frmRepInspecciones }

procedure TfrmRepInspecciones.PrepararDatos;
var
  strQuery : string;
begin
  qryRepInspecciones.Close;
  qryRepInspecciones.Sql.Text:=qryRepInspeccionesBase.SQL.Text +
  Format(' Where r.Fecha Between %s and  %s',
  [chr(39)+FormatDateTime('mm/dd/yyyy', dtpkFechaIni.Date)+chr(39),
   chr(39)+FormatDateTime('mm/dd/yyyy', dtpkFechaFin.Date)+chr(39)]);

  if RadioGroup1.ItemIndex = 0 then
  strQuery:=' And r.ESTADO_INSPECCION between '+chr(39)+'1'+chr(39)+' and '+chr(39)+'1'+chr(39)
  else if RadioGroup1.ItemIndex = 1 then
  strQuery:=' And r.ESTADO_INSPECCION between '+chr(39)+'2'+chr(39)+' and '+chr(39)+'2'+chr(39)
  else if RadioGroup1.ItemIndex = 2 then
  strQuery:=' And r.ESTADO_INSPECCION between '+chr(39)+'3'+chr(39)+' and '+chr(39)+'3'+chr(39)
  else if RadioGroup1.ItemIndex = 3 then
  strQuery:=' And r.ESTADO_INSPECCION between '+chr(39)+'4'+chr(39)+' and '+chr(39)+'4'+chr(39)
  else if RadioGroup1.ItemIndex = 4 then
  //strQuery:=' And r.ESTADO_INSPECCION between '+chr(39)+'5'+chr(39)+' and '+chr(39)+'5'+chr(39)
  strQuery:=' ';
  //else if RadioGroup1.ItemIndex = 5 then
  //strQuery:=' And r.ESTADO_INSPECCION between '+chr(39)+'1'+chr(39)+' and '+chr(39)+'5'+chr(39);

  strNombre:='';
  {if RadioButton1.Checked then //cliente
  begin
    strNombre:='Cliente: ' + ComboBox7.Text;
    strQuery:=strQuery + format(' And CODIGO_CTE between %s and %s ',
    [edtCodCte.Text,edtCodCte.Text]);
  end else}
  if rdgVendedor.Checked then  //Vendedor
  begin
    strNombre:='Vendedor: ' + ComboBox1.Text;
    strQuery:=strQuery + format(' And r.COD_VENDEDOR between %s and %s ',
    [edtCodVendedorIni.Text,edtCodVendedorIni.Text]);
  end else
  if RadioButton1.Checked then  //Chofer
  begin
    strNombre:='TipoAfiliado: ' + ComboBox2.Text;
    strQuery:=strQuery + format(' And r.TIPO_AFILIADO  = %s ',
    [edtTipoAfiliado.Text]);
  end;
  qryRepInspecciones.Sql.Text := qryRepInspecciones.Sql.Text +  strQuery;
  qryRepInspecciones.Sql.Add('Order by r.TIPO_AFILIADO, r.fecha, r.codigo');
  qryRepInspecciones.Open;
  if qryRepInspecciones.RecordCount = 0 then
  MessageDlg('No existen datos con el criterio de búsqueda seleccionado.',mtInformation,[mbOk],0);

  strC:='';
  case RadioGroup1.ItemIndex of
  0:strC:='Solicitado';
  1:strC:='Revisión';
  2:strC:='Denegada';
  3:strC:='Aprobado';
  else
    strC:='...';
  end;

  if rdgVendedor.Checked then  //Vendedor
  begin
    strC:=strC + ' por Vendedor';
  end else
  if RadioButton1.Checked then  //tipo afiliado
  begin
    strC:=strC + ' por tipo afiliado';
  end;
end;

procedure TfrmRepInspecciones.Button1Click(Sender: TObject);
begin
  PrepararDatos;
end;

procedure TfrmRepInspecciones.FormCreate(Sender: TObject);
begin
  qryTipoAfiliado.Close;
  qryTipoAfiliado.Open;
  qryTipoAfiliado.First;
  while not qryTipoAfiliado.eof do
  begin
    ComboBox1.Items.Add(qryTipoAfiliadoDESCRIPCION.Value);//vendedor
    qryTipoAfiliado.Next;
  end;
  qryEmpleado.Close;
  qryEmpleado.Open;
  qryEmpleado.First;
  while not qryEmpleado.eof do
  begin
    if qryEmpleadoCARGO_EMPLEADO.Value = UpperCase('VENDEDOR') then
    begin
      ComboBox1.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);//vendedor
    end;
    qryEmpleado.Next;
  end;
  dtpkFechaIni.Date := GlbFechaTrnDiaria;
  dtpkFechaFin.Date := GlbFechaTrnDiaria;
end;

procedure TfrmRepInspecciones.ComboBox1Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',combobox1.Text,[]) then
  begin
    edtCodVendedorIni.SetInteger(qryEmpleadoCODIGO.Value);
  end;
end;

procedure TfrmRepInspecciones.ComboBox2Change(Sender: TObject);
begin
  if qryTipoAfiliado.Locate('DESCRIPCION',combobox2.Text,[]) then
  begin
    edtTipoAfiliado.SetInteger(qryTipoAfiliadoIDTIPO.Value);
  end;
end;

procedure TfrmRepInspecciones.GeneraReporte(tipo:smallint;strCriterio:String);
begin
  if not Assigned(qckRepInspecciones) then
  qckRepInspecciones:=TqckRepInspecciones.Create(nil);
  qckRepInspecciones.qrlabelFecha.Caption:=
  'De ' +FormatDateTime('dd/mmm/yyyy', dtpkFechaIni.Date)+ ' a '+
  FormatDateTime('/mmm/yyyy', dtpkFechaFin.Date);

  //qckRepInspecciones.qrNombre.Caption:= strNombre;
  qckRepInspecciones.qrcriterioReporte.Caption:= strCriterio;
  case tipo of
  1:Begin
      try
        qckRepInspecciones.qrcriterioReporte.Caption:= strCriterio;
        qckRepInspecciones.Preview;
      finally
      qckRepInspecciones.Free;
      qckRepInspecciones:=Nil;
      end;
    end;
  2:Begin
      try
        qckRepInspecciones.qrcriterioReporte.Caption:= strCriterio;
        qckRepInspecciones.Preview;
      finally
      qckRepInspecciones.Free;
      qckRepInspecciones:=Nil;
      end;
    end;
  3:Begin
      try
        qckRepInspecciones.qrcriterioReporte.Caption:= strCriterio;
        qckRepInspecciones.Preview;
      finally
      qckRepInspecciones.Free;
      qckRepInspecciones:=Nil;
      end;
    end;
  4:Begin
      try
        qckRepInspecciones.qrcriterioReporte.Caption:= strCriterio;
        qckRepInspecciones.Preview;
      finally
      qckRepInspecciones.Free;
      qckRepInspecciones:=Nil;
      end;
    end;
  end;
end;   

procedure TfrmRepInspecciones.BitBtn5Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:begin
        Button1Click(Self);
        GeneraReporte(1,strC);
      end;
    1:begin
        Button1Click(Self);
        GeneraReporte(2,strC);
      end;
    2:begin
        Button1Click(Self);
        GeneraReporte(3,strC);
      end;
    3:begin
        Button1Click(Self);
        GeneraReporte(4,strC);
      end;
  end;
end;

procedure TfrmRepInspecciones.ActualizaResumen(st: string; cant: integer);
begin
end;

procedure TfrmRepInspecciones.qryRepInspeccionesAfterOpen(
  DataSet: TDataSet);
begin
  qryResumen.Close;
  qryResumen.params[0].Value:= ExtraerFecha(dtpkFechaIni.Date);
  qryResumen.params[1].Value:= ExtraerFecha(dtpkFechaFin.Date);
  qryResumen.Open;
end;

end.
