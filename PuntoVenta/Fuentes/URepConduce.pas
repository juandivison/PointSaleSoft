unit URepConduce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RxToolEdit, Buttons, ExtCtrls, EditNew, DB,
  IBCustomDataSet, IBQuery, WinSkinData, RxMemDS, Grids, DBGrids, RxDBCtrl,
  RxCtrls;

type
  TfrmRepConduce = class(TForm)
    dtpkFechaIni: TDateEdit;
    Label1: TLabel;
    dtpkFechaFin: TDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    edtCodVendedorIni: TEditN;
    ComboBox2: TComboBox;
    edtCodVendedorFin: TEditN;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox3: TComboBox;
    edtCodChoferIni: TEditN;
    ComboBox4: TComboBox;
    edtCodChoferFin: TEditN;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox5: TComboBox;
    edtCodDespIni: TEditN;
    ComboBox6: TComboBox;
    edtCodDespFin: TEditN;
    RadioGroup1: TRadioGroup;
    BitBtn4: TBitBtn;
    rdgVendedor: TRadioButton;
    rdgChofer: TRadioButton;
    rdgDespachador: TRadioButton;
    rdgTodos: TRadioButton;
    qryDatosReporte: TIBQuery;
    qryDatosBases: TIBQuery;
    Button1: TButton;
    qryEmpleado: TIBQuery;
    qryEmpleadoCODIGO: TIntegerField;
    qryEmpleadoNOMBRE: TIBStringField;
    qryEmpleadoAPELLIDO: TIBStringField;
    qryEmpleadoNOMBRECOMPLETO: TIBStringField;
    BitBtn5: TBitBtn;
    rxResumen: TRxMemoryData;
    rxResumenstatus: TStringField;
    rxResumencant: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    dsrxResumen: TDataSource;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    qryEmpleadoCARGO_EMPLEADO: TIBStringField;
    qryDatosReporteCODIGO_CTE: TIntegerField;
    qryDatosReporteNOMBRE_FACTURAR: TIBStringField;
    qryDatosReporteFECHA: TDateTimeField;
    qryDatosReporteNUMERO: TIntegerField;
    qryDatosReporteVALOR_TOTAL_DET: TFloatField;
    qryDatosReporteCODIGO_VENDEDOR: TIntegerField;
    qryDatosReporteCODIGO_CHOFER: TIntegerField;
    qryDatosReporteCHOFER: TIBStringField;
    qryDatosReporteCODIGO_DESPACHADOR: TIntegerField;
    qryDatosReporteDESPACHADOPOR: TIBStringField;
    qryDatosReporteVENDEDOR: TIBStringField;
    qryDatosReporteSTATUS_DET: TIBStringField;
    qryDatosReporteNUMERO_FACTURA: TIntegerField;
    qryDatosReporteNUMERO_DOC_PAGO: TIBStringField;
    Label10: TLabel;
    ComboBox7: TComboBox;
    edtCodCte: TEditN;
    qryClientes: TIBQuery;
    qryClientesCODIGO_CTE: TIntegerField;
    qryClientesCIA_KEY: TIntegerField;
    qryClientesTIPO_CLIENTE: TSmallintField;
    qryClientesFOTO: TBlobField;
    qryClientesNOMBRE_CTE: TIBStringField;
    qryClientesNOMBRE_ABREV: TIBStringField;
    qryClientesMONEDA_FACT: TIBStringField;
    qryClientesNOMBRE_FACTURAR: TIBStringField;
    qryClientesCONTACTO: TIBStringField;
    qryClientesDIRECCION_CONT: TIBStringField;
    qryClientesTELEF_CONTACTO: TIBStringField;
    qryClientesFAX_CONTACTO: TIBStringField;
    qryClientesFORMA_PAGO: TSmallintField;
    qryClientesCODIGO_AGENCIA: TSmallintField;
    qryClientesSTATUS_CLIENTE: TIBStringField;
    qryClientesINSERTADO_POR: TIBStringField;
    qryClientesFECHA_INSERTADO: TDateTimeField;
    qryClientesFECHA_MOD: TDateTimeField;
    qryClientesMODI_POR: TIBStringField;
    qryClientesLIMITE_CREDITO: TFloatField;
    qryClientesEMAIL: TIBStringField;
    qryClientesWEBSITE: TIBStringField;
    qryClientesPAIS: TIBStringField;
    qryClientesCIUDAD: TIBStringField;
    qryClientesCEDULA: TIBStringField;
    qryClientesRNC: TIBStringField;
    qryClientesREFERENCIA: TIBStringField;
    qryClientesTELEF_REFERENCIA: TIBStringField;
    qryClientesOTRO_TELEFONO: TIBStringField;
    qryClientesCANT_DIAS_CREDITO: TSmallintField;
    qryClientesTIPO_NCF: TIBStringField;
    qryClientesOBSERVACION: TMemoField;
    qryClientesLUGAR_DE_TRABAJO: TIBStringField;
    qryClientesAPODO: TIBStringField;
    qryClientesCODIGO_USUARIO: TIntegerField;
    qryClientesRNC_NUMERO: TIBStringField;
    qryClientesCOMENTARIO: TMemoField;
    qryClientesCONDICION: TIntegerField;
    qryClientesPRECIO_ID: TIntegerField;
    qryClientesRUTA_FOTO: TIBStringField;
    qryClientesTIPO_CF: TIBStringField;
    qryClientesMOVIL1: TIBStringField;
    qryClientesMOVIL2: TIBStringField;
    qryClientesCODIGO_TEXTO: TIBStringField;
    qryClientesUSARLEVELPRECIO: TSmallintField;
    qryClientesCOD_VENDEDOR: TIntegerField;
    qryClientesFECHA_NACIMIENTO: TDateTimeField;
    qryClientesCODZONA: TIntegerField;
    qryClientesRUTA: TIntegerField;
    qryClientesCOD_CIUDAD: TIntegerField;
    qryClientesDIA_RUTA: TIBStringField;
    RadioButton1: TRadioButton;
    SkinData1: TSkinData;
    qryDatosReporteCOD_USR_CAJA: TIntegerField;
    qryDatosReporteNOMBRECOMPLETO: TIBStringField;
    qryDatosReporteIN_POR: TIBStringField;
    qryDatosReporteMOD_POR: TIBStringField;
    Label11: TLabel;
    ComboBox8: TComboBox;
    edtCodUsrCaja: TEditN;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure qryDatosReporteAfterOpen(DataSet: TDataSet);
    procedure qryDatosReporteAfterClose(DataSet: TDataSet);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
  private
    { Private declarations }
    procedure PrepararDatos;
    procedure ActualizaResumen(st:string;cant:integer);

    procedure GeneraRepConduce(tipo: smallint; strCriterio: String);
  public
    { Public declarations }
  end;

var
  frmRepConduce: TfrmRepConduce;
  strC : string;
  strNombre : string;
implementation

uses UDatModConectar, UGlobal, URepDatosConduce;

{$R *.dfm}

{ TfrmRepConduce }

procedure TfrmRepConduce.PrepararDatos;
var
  strQuery : string;
begin
  rxResumen.Close;
  rxResumen.Open;
  qryDatosReporte.Close;
  qryDatosReporte.Sql.Text:=qryDatosBases.SQL.Text +
  Format(' Where Fecha Between %s and  %s',
  [chr(39)+FormatDateTime('mm/dd/yyyy', dtpkFechaIni.Date)+chr(39),
   chr(39)+FormatDateTime('mm/dd/yyyy', dtpkFechaFin.Date)+chr(39)]);

  if RadioGroup1.ItemIndex = 0 then
  strQuery:=' And STATUS_DET between '+chr(39)+'A'+chr(39)+' and '+chr(39)+'A'+chr(39)
  else if RadioGroup1.ItemIndex = 1 then
  strQuery:=' And STATUS_DET between '+chr(39)+'R'+chr(39)+' and '+chr(39)+'R'+chr(39)
  else if RadioGroup1.ItemIndex = 2 then
  strQuery:=' And STATUS_DET between '+chr(39)+'C'+chr(39)+' and '+chr(39)+'C'+chr(39)
  else if RadioGroup1.ItemIndex = 3 then
  strQuery:=' And STATUS_DET in ('+chr(39)+'A'+chr(39)+','+chr(39)+'C'+chr(39)
  +','+chr(39)+'R'+chr(39)+')';

  strNombre:='';
  if RadioButton1.Checked then //cliente
  begin
    strNombre:='Cliente: ' + ComboBox7.Text;
    strQuery:=strQuery + format(' And CODIGO_CTE between %s and %s ',
    [edtCodCte.Text,edtCodCte.Text]);
  end else
  if rdgVendedor.Checked then  //Vendedor
  begin
    strNombre:='Vendedor: ' + ComboBox1.Text;
    strQuery:=strQuery + format(' And CODIGO_VENDEDOR between %s and %s ',
    [edtCodVendedorIni.Text,edtCodVendedorFin.Text]);
  end else
  if rdgChofer.Checked then  //Chofer
  begin
    strNombre:='Chofer: ' + ComboBox3.Text;
    strQuery:=strQuery + format(' And codigo_Chofer between %s and %s ',
    [edtCodChoferIni.Text,edtCodChoferFin.Text]);
  end  else
  if rdgDespachador.Checked then  //Despachador
  begin
    strNombre:='Despachador: ' + ComboBox5.Text;
    strQuery:=strQuery + format(' And CODIGO_DESPACHADOR between %s and %s ',
    [edtCodDespIni.Text,edtCodDespFin.Text]);
  end;

  if (edtCodUsrCaja.Text <> '') then
  begin
    strQuery:=strQuery + format(' And COD_USR_CAJA Between %s and %s ',
    [edtCodUsrCaja.Text,edtCodUsrCaja.Text]);
    strNombre:=strNombre + '  '+'Usuario:'+ComboBox8.Text;
  end;
  qryDatosReporte.Sql.Text := qryDatosReporte.Sql.Text +  strQuery;
  qryDatosReporte.Sql.Add('Order by fecha, numero');
  qryDatosReporte.Open;
  if qryDatosReporte.RecordCount = 0 then
  MessageDlg('No existen datos con el criterio de busqueda seleccionado.',mtInformation,[mbOk],0);

  strC:='';
  case RadioGroup1.ItemIndex of
  0:strC:='Abiertos';
  1:strC:='Cerrados';
  2:strC:='Cancelados';
  else
    strC:='...';
  end;

  if rdgVendedor.Checked then  //Vendedor
  begin
    strC:=strC + ' por Vendedor';
  end else
  if rdgChofer.Checked then  //Chofer
  begin
    strC:=strC + ' por Chofer';
  end  else
  if rdgDespachador.Checked then  //Despachador
  begin
    strC:=strC + ' por Despachador';
  end;

end;

procedure TfrmRepConduce.Button1Click(Sender: TObject);
begin
  PrepararDatos;
end;

procedure TfrmRepConduce.FormCreate(Sender: TObject);
begin
  qryClientes.Close;
  qryClientes.Params[0].Value:=glbCia_Key;
  qryClientes.Open;
  rxResumen.Close;
  rxResumen.Open;
  qryEmpleado.Close;
  qryEmpleado.Open;
  qryEmpleado.First;
  while not qryEmpleado.eof do
  begin
    if qryEmpleadoCARGO_EMPLEADO.Value = UpperCase('VENDEDOR') then
    begin
      ComboBox1.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);//vendedor
      ComboBox2.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);//vendedor
    end;
    if qryEmpleadoCARGO_EMPLEADO.Value = UpperCase('CHOFER') then
    begin
      ComboBox3.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);//chofer
      ComboBox4.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);//chofer
    end;
    if qryEmpleadoCARGO_EMPLEADO.Value = UpperCase('DESPACHADOR') then
    begin
      ComboBox5.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);//despacho
      ComboBox6.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);//despacho
    end;
    if (qryEmpleadoCARGO_EMPLEADO.Value <> UpperCase('VENDEDOR'))
       Or (qryEmpleadoCARGO_EMPLEADO.Value <> UpperCase('CHOFER'))
       Or (qryEmpleadoCARGO_EMPLEADO.Value <> UpperCase('DESPACHADOR')) then
    ComboBox8.Items.Add(qryEmpleadoNOMBRECOMPLETO.Value);
    qryEmpleado.Next;
  end;
  qryClientes.First;
  ComboBox7.Items.Clear;
  while not qryClientes.Eof do
  begin
    ComboBox7.Items.Add(qryClientesNOMBRE_FACTURAR.Value);
    qryClientes.Next;
  end;
  qryclientes.First;
  ComboBox7.text:=qryClientesNOMBRE_FACTURAR.Value;
  ComboBox7Change(self);
  dtpkFechaIni.Date := GlbFechaTrnDiaria;
  dtpkFechaFin.Date := GlbFechaTrnDiaria;
end;

procedure TfrmRepConduce.ComboBox1Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',combobox1.Text,[]) then
  begin
    edtCodVendedorIni.SetInteger(qryEmpleadoCODIGO.Value);
    edtCodVendedorFin.SetInteger(qryEmpleadoCODIGO.Value);
  end;
end;

procedure TfrmRepConduce.ComboBox2Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',combobox2.Text,[]) then
  begin
    edtCodVendedorFin.SetInteger(qryEmpleadoCODIGO.Value);
  end;
end;

procedure TfrmRepConduce.ComboBox3Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',combobox3.Text,[]) then
  begin
    edtCodChoferIni.SetInteger(qryEmpleadoCODIGO.Value);
    edtCodChoferFin.SetInteger(qryEmpleadoCODIGO.Value);
  end;
end;

procedure TfrmRepConduce.ComboBox4Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',combobox4.Text,[]) then
  edtCodChoferFin.SetInteger(qryEmpleadoCODIGO.Value);
end;

procedure TfrmRepConduce.ComboBox6Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',combobox6.Text,[]) then
  edtCodDespFin.SetInteger(qryEmpleadoCODIGO.Value);
end;

procedure TfrmRepConduce.ComboBox5Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',combobox5.Text,[]) then
  begin
    edtCodDespIni.SetInteger(qryEmpleadoCODIGO.Value);
    edtCodDespFin.SetInteger(qryEmpleadoCODIGO.Value);
  end;
end;

procedure TfrmRepConduce.GeneraRepConduce(tipo:smallint;strCriterio:String);
begin
  if not Assigned(qckReporteConduce) then
  qckReporteConduce:=TqckReporteConduce.Create(nil);
  qckReporteConduce.qrlabelFecha.Caption:=
  'De ' +FormatDateTime('mm/dd/yyyy', dtpkFechaIni.Date)+ ' a '+
  FormatDateTime('mm/dd/yyyy', dtpkFechaFin.Date);

  qckReporteConduce.qrNombre.Caption:= strNombre;
  qckReporteConduce.qrcriterioReporte.Caption:= strCriterio;
  case tipo of
  1:Begin
      try
        qckReporteConduce.qrcriterioReporte.Caption:= strCriterio;
        qckReporteConduce.Preview;
      finally
      qckReporteConduce.Free;
      qckReporteConduce:=Nil;
      end;
    end;
  2:Begin
      try
        qckReporteConduce.qrcriterioReporte.Caption:= strCriterio;
        qckReporteConduce.Preview;
      finally
      qckReporteConduce.Free;
      qckReporteConduce:=Nil;
      end;
    end;
  3:Begin
      try
        qckReporteConduce.qrcriterioReporte.Caption:= strCriterio;
        qckReporteConduce.Preview;
      finally
      qckReporteConduce.Free;
      qckReporteConduce:=Nil;
      end;
    end;
  4:Begin
      try
        qckReporteConduce.qrcriterioReporte.Caption:= strCriterio;
        qckReporteConduce.Preview;
      finally
      qckReporteConduce.Free;
      qckReporteConduce:=Nil;
      end;
    end;
  end;
end;

procedure TfrmRepConduce.BitBtn5Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:begin
        Button1Click(Self);
        GeneraRepConduce(2,strC);
      end;
    1:begin
        Button1Click(Self);
        GeneraRepConduce(3,strC);
      end;
    2:begin
        Button1Click(Self);
        GeneraRepConduce(2,strC);
      end;
    3:begin
        Button1Click(Self);
        GeneraRepConduce(4,strC);
      end;
  end;
end;

procedure TfrmRepConduce.qryDatosReporteAfterOpen(DataSet: TDataSet);
begin
  qryDatosReporte.First;
  While Not qryDatosReporte.Eof Do
  begin
    if (qryDatosReporteSTATUS_DET.Value = 'A') then
    ActualizaResumen('Abiertos',1)
    else if (qryDatosReporteSTATUS_DET.Value = 'C') then
    ActualizaResumen('Cancelados',1)
    else if (qryDatosReporteSTATUS_DET.Value = 'R') then
    ActualizaResumen('Cerrados',1);
    qryDatosReporte.Next;
  end;
end;

procedure TfrmRepConduce.ActualizaResumen(st: string; cant: integer);
begin
  if rxResumen.Locate('status',st,[loCaseInsensitive]) then
  begin
    rxResumen.Edit;
    rxResumencant.Value := rxResumencant.Value + cant;
    rxResumen.Post;
  end else
  begin
    rxResumen.Append;
    rxResumencant.Value := cant;
    rxResumenstatus.Value:= st;
    rxResumen.Post;  
  end;
end;

procedure TfrmRepConduce.qryDatosReporteAfterClose(DataSet: TDataSet);
begin
  rxResumen.Close;
  rxResumen.Open;
end;

procedure TfrmRepConduce.ComboBox7Change(Sender: TObject);
begin
  if (combobox7.Text <> '') then
  if qryClientes.Locate('NOMBRE_FACTURAR',ComboBox7.Text,[]) then
  edtCodCte.SetInteger(qryClientesCODIGO_CTE.Value);
end;

procedure TfrmRepConduce.ComboBox8Change(Sender: TObject);
begin
  if qryEmpleado.Locate('NOMBRECOMPLETO',ComboBox8.Text,[]) then
  begin
    edtCodUsrCaja.SetInteger(qryEmpleadoCODIGO.Value);
    edtCodUsrCaja.SetInteger(qryEmpleadoCODIGO.Value);
  end;
end;

end.
