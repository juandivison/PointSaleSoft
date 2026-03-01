unit TestMainUnit;

interface

uses
  Forms, Classes, SysUtils, DB, RxMemDS, Dialogs, Controls, StdCtrls, ExtCtrls,
  IBCustomDataSet, IBStoredProc;

type

  TDetalleVenta = record
    SERIE: Integer;
    FECHA: TDateTime;
    IDTasaITBIS: Integer;
    PorcTasaItbis: Double;
    CANTIDAD: Double;
    PRECIO: Double;
    CodArticulo: Integer;
    PorcDescItem: Double;
    ItbisExento: Integer;
    TipoVenta: Integer;
  end;

  TVentaMaster = record
    NUMERO: string;
    MONTO_TOTAL_ITBIS: Double;
    PORC_DESCUENTO: Double;
    MONTO_DESCUENTO: Double;
    MONTO_RECARGO: Double;
    MONTO_BRUTO: Double;
    VALOR_TOTAL_DET: Double;
  end;
  TTestForm = class(TForm)
    rxVenta: TRxMemoryData;
    Totales: TRxMemoryData;
    MemoLog: TMemo;
    btnRunTest: TButton;
    MemoLogError: TMemo;
    IBStoredProc1: TIBStoredProc;
    procedure btnRunTestClick(Sender: TObject);
  private
    procedure RunTestAutomatico;
    procedure CargarDatosEnRxVenta(rxVenta: TRxMemoryData;Detalles: TStrings;Log: TStrings);

    procedure CargarDatosEnTotales(Totales: TRxMemoryData; Master: TVentaMaster);
    procedure VerificarTotales(Totales: TRxMemoryData; Master: TVentaMaster; const Numero: string; ErrorLog: TStringList);
    function GetCampo(const S, Campo: string; Def: string = ''): string;
  public
    { Public declarations }
  end;


function ExtraerValor(Campo: string): string;
function ParseDetalleLinea(const Linea: string): TDetalleVenta;
function ParseMasterLinea(const Linea: string): TVentaMaster;

var
  TestForm: TTestForm;
   Log: TStrings;
implementation

{$R *.dfm}

uses StrUtils, UDatModConectar, UProcVentaRapida, UGlobal;

function ExtraerValor(Campo: string): string;
begin
  Result := Copy(Campo, Pos('=', Campo)+1, MaxInt);
end;

function ParseDetalleLinea(const Linea: string): TDetalleVenta;
var
  Campos: TStringList;
begin
  Campos := TStringList.Create;
  try
    Campos.Delimiter := '|';
    Campos.DelimitedText := Linea;
    try
    Result.SERIE          := StrToInt(ExtraerValor(Campos[2]));
    Result.IDTasaITBIS    := StrToInt(ExtraerValor(Campos[7]));
    Result.PorcTasaItbis  := 0;
    Result.CANTIDAD       := StrToFloat(ExtraerValor(Campos[4]));
    Result.PRECIO         := StrToFloat(ExtraerValor(Campos[5]));
    Result.CodArticulo    := 0;
    Result.PorcDescItem   := StrToFloat(ExtraerValor(Campos[8]));
    Result.ItbisExento    := StrToInt(ExtraerValor(Campos[10]));
    Result.TipoVenta      := StrToInt(ExtraerValor(Campos[3]));
    except
    end;
  finally
    Campos.Free;
  end;
end;

function ParseMasterLinea(const Linea: string): TVentaMaster;
var
  Campos: TStringList;
begin
  Campos := TStringList.Create;
  try
    Campos.Delimiter := '|';
    Campos.DelimitedText := Linea;
    Result.NUMERO          := ExtraerValor(Campos[1]);
    Result.MONTO_TOTAL_ITBIS := StrToFloat(ExtraerValor(Campos[4]));
    Result.PORC_DESCUENTO  := StrToFloat(ExtraerValor(Campos[6]));
    Result.MONTO_DESCUENTO := StrToFloat(ExtraerValor(Campos[7]));
    Result.MONTO_RECARGO   := StrToFloat(ExtraerValor(Campos[8]));
    Result.MONTO_BRUTO     := StrToFloat(ExtraerValor(Campos[9]));
    Result.VALOR_TOTAL_DET := StrToFloat(ExtraerValor(Campos[10]));
  finally
    Campos.Free;
  end;
end;
function TTestForm.GetCampo(const S, Campo: string; Def: string = ''): string;
var P, Q: Integer;
begin
  P := Pos(Campo + '=', S);
  if P > 0 then
  begin
    Inc(P, Length(Campo) + 1);
    Q := PosEx('|', S, P);
    if Q = 0 then Q := Length(S) + 1;
    Result := Copy(S, P, Q - P);
  end
  else
    Result := Def;
end;

procedure TTestForm.CargarDatosEnRxVenta(rxVenta: TRxMemoryData; Detalles: TStrings; Log: TStrings);
var
  i: Integer;
  Linea, v: string;
begin
  rxVenta.EmptyTable;
  for i := 0 to Detalles.Count-1 do
  begin
    Linea := Detalles[i];
    frmProcVentaRapida.edtCodigo.Text:=GetCampo(Linea, 'CODIGO_PROD');
    if (frmProcVentaRapida.edtCodigo.Text = '') then
    continue;
    frmProcVentaRapida.edtCodigoExit(nil);
    rxVenta.Append;
    v := GetCampo(Linea, 'SERIE');
    v := GetCampo(Linea, 'CODIGO_PROD');
    if v <> '' then rxVenta.FieldByName('CodArticulo').AsInteger := StrToIntDef(v, 0);

    if v <> '' then rxVenta.FieldByName('Serie').AsInteger := StrToIntDef(v, 0);

    v := GetCampo(Linea, 'TIPO_VENTA');
    if v <> '' then rxVenta.FieldByName('TipoVenta').AsInteger := StrToIntDef(v, 0);

    v := GetCampo(Linea, 'CANTIDAD');
    if v <> '' then rxVenta.FieldByName('Cant').AsFloat := StrToFloatDef(v, 0);

    v := GetCampo(Linea, 'PRECIO');
    if v <> '' then rxVenta.FieldByName('Precio').AsCurrency := StrToFloatDef(v, 0);

    v := GetCampo(Linea, 'IDTASAITBIS');
    if v <> '' then rxVenta.FieldByName('IDTasaITBIS').AsInteger := Trunc(StrToFloatDef(v, 0));

    v := GetCampo(Linea, 'PORC_DESC_DET');
    if v <> '' then rxVenta.FieldByName('PorcDescItem').AsCurrency := StrToFloatDef(v, 0);

    v := GetCampo(Linea, 'ITBIS_EXENTO');
    if v <> '' then rxVenta.FieldByName('ItbisExento').AsInteger := StrToIntDef(v, 0);

    v := GetCampo(Linea, 'DESCRIPCION');
    rxVenta.FieldByName('Descripcion').AsString := v;

    rxVenta.Post;
  end;
end;

procedure TTestForm.CargarDatosEnTotales(Totales: TRxMemoryData; Master: TVentaMaster);
begin
  frmProcVentaRapida.Totales.EmptyTable;
  frmProcVentaRapida.Totales.Append;
  try

  if frmProcVentaRapida.TotalesTipoNCFIFiscal.IsNull then
  frmProcVentaRapida.TotalesTipoNCFIFiscal.Value:= 0;
  if frmProcVentaRapida.TotalesTipoNCF.IsNull then
  begin
    if GlbActivaECF = 1 then
    frmProcVentaRapida.TotalesTipoNCF.Value:='32' else
    frmProcVentaRapida.TotalesTipoNCF.Value:='02';//Consumidor Final
  end;
  //frmProcVentaRapida.Totales.state
  frmProcVentaRapida.Totales.Tag := 609;
  frmProcVentaRapida.LlenandoDatos:=True;
  if Master.PORC_DESCUENTO > 0 then
  frmProcVentaRapida.Totales.FieldByName('PorcDesAdicional').AsFloat := Master.PORC_DESCUENTO;
  if Master.MONTO_RECARGO > 0 then
  frmProcVentaRapida.Totales.FieldByName('Recargo').AsCurrency := Master.MONTO_RECARGO;
  frmProcVentaRapida.Totales.FieldByName('Itbis').AsFloat := Master.MONTO_TOTAL_ITBIS;
  if Master.MONTO_DESCUENTO > 0 then
  frmProcVentaRapida.Totales.FieldByName('MontoDescItems').AsFloat := Master.MONTO_DESCUENTO;
  if Master.MONTO_DESCUENTO > 0 then
  frmProcVentaRapida.Totales.FieldByName('MontoDescAdicional').AsFloat := Master.MONTO_DESCUENTO;
  frmProcVentaRapida.Totales.FieldByName('TotalNeto').AsFloat := Master.VALOR_TOTAL_DET;
  except
  end;
  if frmProcVentaRapida.Totales.State in [dsedit, dsInsert] then
  frmProcVentaRapida.Totales.Post;
  frmProcVentaRapida.Totales.Tag := 0;
  frmProcVentaRapida.LlenandoDatos:=False;
end;

procedure TTestForm.VerificarTotales(Totales: TRxMemoryData; Master: TVentaMaster; const Numero: string; ErrorLog: TStringList);
var
  Ok: Boolean;
begin
  Ok := True;
  if Abs(Totales.FieldByName('TotalNeto').AsFloat - Master.VALOR_TOTAL_DET) > 0.01 then
  begin
    ErrorLog.Add('ERROR en venta ' + Numero + ': TotalNeto Esperado=' +
      FloatToStr(Master.VALOR_TOTAL_DET) + ' Calculado=' + 
      FloatToStr(Totales.FieldByName('TotalNeto').AsFloat));
    Ok := False;
  end;
  if Abs(Totales.FieldByName('Itbis').AsFloat - Master.MONTO_TOTAL_ITBIS) > 0.01 then
  begin
    ErrorLog.Add('ERROR en venta ' + Numero + ': ITBIS Esperado=' +
      FloatToStr(Master.MONTO_TOTAL_ITBIS) + ' Calculado=' + 
      FloatToStr(Totales.FieldByName('Itbis').AsFloat));
    Ok := False;
  end;
  if (Abs(Totales.FieldByName('MontoDescItems').AsFloat - Master.MONTO_DESCUENTO) > 0.01)
     and (Abs(Totales.FieldByName('MontoDescAdicional').AsFloat - Master.MONTO_DESCUENTO) > 0.01) then
  begin
    ErrorLog.Add('ERROR en venta ' + Numero + ': MONTO_DESCUENTO Esperado=' +
      FloatToStr(Master.MONTO_DESCUENTO) + ' Calculado=' + 
      FloatToStr(Totales.FieldByName('MontoDescItems').AsFloat) +
      ' / ' +
      FloatToStr(Totales.FieldByName('MontoDescAdicional').AsFloat));
    Ok := False;
  end;
  if Ok then
    ErrorLog.Add('OK venta ' + Numero);
end;

procedure TTestForm.RunTestAutomatico;
var
  MasterSL, DetalleSL, DetallesVenta: TStringList;
  i, j: Integer;
  Venta: TVentaMaster;
  Numero: string;
  ErrorLog: TStringList;
begin
  MasterSL := TStringList.Create;
  DetalleSL := TStringList.Create;
  ErrorLog := TStringList.Create;
  if not Assigned(Log) then
  Log:=TStrings.Create;
  try
    MasterSL.LoadFromFile('text_ejemplovtamaster.txt');
    DetalleSL.LoadFromFile('text_ejemplovtadetalle.txt');

    for i := 0 to MasterSL.Count-1 do
    begin
      frmProcVentaRapida.LlenandoDatos:=True;
      Venta := ParseMasterLinea(MasterSL[i]);
      Numero := Venta.NUMERO;
      DetallesVenta := TStringList.Create;
      try
        for j := 0 to DetalleSL.Count-1 do
          if Pos('NUMERO='+Numero, DetalleSL[j]) > 0 then
            DetallesVenta.Add(DetalleSL[j]);
        CargarDatosEnRxVenta(frmProcVentaRapida.rxVenta, DetallesVenta, Log);
        CargarDatosEnTotales(frmProcVentaRapida.Totales, Venta);
        // Aqui puedes llamar el metodo real de calculo de tu sistema si es necesario
        frmProcVentaRapida.LlenandoDatos:=False;
        frmProcVentaRapida.DiferirCalculoTotales;

        VerificarTotales(frmProcVentaRapida.Totales, Venta, Numero, ErrorLog);

      finally
        DetallesVenta.Free;
      end;
    end;
    ErrorLog.SaveToFile('TestFacturaReporte.txt');
    MemoLogError.Lines := ErrorLog;
    MemoLog.Lines.LoadFromFile('TestFacturaReporte.txt');
    MemoLog.Lines.Add('');

    frmProcVentaRapida.Edit1.SetFocus;
    ShowMessage('Testing completado. Revisa TestFacturaReporte.txt');
    //ShellExecute(0, 'open', 'notepad', PChar('TestFacturaReporte.txt'), nil, SW_HIDE);
  finally
    MasterSL.Free;
    DetalleSL.Free;
    ErrorLog.Free;
  end;
end;

procedure TTestForm.btnRunTestClick(Sender: TObject);
begin
  RunTestAutomatico;
end;

end.
