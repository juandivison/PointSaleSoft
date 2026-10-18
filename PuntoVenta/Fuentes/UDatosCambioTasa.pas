unit UDatosCambioTasa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, EditNew, Buttons, WinSkinData;

type
  TfrmDatosCambioTasa = class(TForm)
    Label1: TLabel;
    dtpkFechaInicia: TDateTimePicker;
    edtValorTasa: TEditN;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ActualizaTasa(const ACodigo: String);
    function ObtenerPeriodoActivo(const ACodigo: string;
      AFecha: TDateTime; var ASerie: Integer;
      var AFechaInicial, AFechaFinal: TDateTime): Boolean;
    function ObtenerSiguienteFechaInicial(const ACodigo: string;
      AFechaInicialActual: TDateTime;
      var AFechaSiguiente: TDateTime): Boolean;
    function SiguienteSerieMonedaDet: Integer;
  public
    { Public declarations }
  end;

var
  frmDatosCambioTasa: TfrmDatosCambioTasa;

implementation

uses
  UTasaDolar, Uglobal, UDatModConectar, IBSQL, DateUtils;

{$R *.DFM}

function AjustarTextoCampo(const AValor: string; AMaxLen: Integer): string;
begin
  Result := Trim(AValor);

  if (AMaxLen > 0) and (Length(Result) > AMaxLen) then
    Result := Copy(Result, 1, AMaxLen);
end;

function TfrmDatosCambioTasa.ObtenerPeriodoActivo(const ACodigo: string;
  AFecha: TDateTime; var ASerie: Integer;
  var AFechaInicial, AFechaFinal: TDateTime): Boolean;
var
  Q       : TIBSQL;
  VCount  : Integer;
begin
  Result := False;
  ASerie := 0;
  AFechaInicial := 0;
  AFechaFinal := 0;
  VCount := 0;

  Q := TIBSQL.Create(nil);
  try
    Q.Database := dmConectar.IBDatabase1;
    Q.Transaction := dmConectar.IBTransaction1;
    Q.SQL.Text :=
      'select SERIE, FECHA_INICIAL, FECHA_FINAL ' +
      'from MONEDA_DET ' +
      'where CODIGO = :CODIGO ' +
      'and :FECHA between FECHA_INICIAL and FECHA_FINAL ' +
      'order by FECHA_INICIAL, SERIE';

    Q.ParamByName('CODIGO').AsString := Trim(ACodigo);
    Q.ParamByName('FECHA').AsDateTime := Trunc(AFecha);
    Q.ExecQuery;

    while not Q.Eof do
    begin
      Inc(VCount);

      if VCount = 1 then
      begin
        ASerie := Q.FieldByName('SERIE').AsInteger;
        AFechaInicial :=
          Trunc(Q.FieldByName('FECHA_INICIAL').AsDateTime);
        AFechaFinal :=
          Trunc(Q.FieldByName('FECHA_FINAL').AsDateTime);
      end;

      Q.Next;
    end;

    if VCount = 0 then
      raise Exception.Create(
        'Moneda ' + ACodigo + ': no existe un rango vigente para la fecha ' +
        FormatDateTime('dd/mm/yyyy',Trunc(AFecha)) + '.');

    if VCount > 1 then
      raise Exception.Create(
        'Moneda ' + ACodigo + ': existen ' + IntToStr(VCount) +
        ' rangos vigentes para la fecha ' +
        FormatDateTime('dd/mm/yyyy',Trunc(AFecha)) +
        '. Hay solapamiento y el cambio fue cancelado.');

    Result := True;
  finally
    Q.Free;
  end;
end;

function TfrmDatosCambioTasa.ObtenerSiguienteFechaInicial(
  const ACodigo: string; AFechaInicialActual: TDateTime;
  var AFechaSiguiente: TDateTime): Boolean;
var
  Q : TIBSQL;
begin
  Result := False;
  AFechaSiguiente := 0;

  Q := TIBSQL.Create(nil);
  try
    Q.Database := dmConectar.IBDatabase1;
    Q.Transaction := dmConectar.IBTransaction1;
    Q.SQL.Text :=
      'select first 1 FECHA_INICIAL ' +
      'from MONEDA_DET ' +
      'where CODIGO = :CODIGO ' +
      'and FECHA_INICIAL > :FECHA_INICIAL ' +
      'order by FECHA_INICIAL, SERIE';

    Q.ParamByName('CODIGO').AsString := Trim(ACodigo);
    Q.ParamByName('FECHA_INICIAL').AsDateTime :=
      Trunc(AFechaInicialActual);
    Q.ExecQuery;

    if not Q.Eof then
    begin
      if Q.FieldByName('FECHA_INICIAL').IsNull then
        raise Exception.Create(
          'Moneda ' + ACodigo +
          ': el siguiente rango tiene Fecha Inicial vacía.');

      AFechaSiguiente :=
        Trunc(Q.FieldByName('FECHA_INICIAL').AsDateTime);
      Result := True;
    end;
  finally
    Q.Free;
  end;
end;

function TfrmDatosCambioTasa.SiguienteSerieMonedaDet: Integer;
var
  Q : TIBSQL;
begin
  Result := 1;

  Q := TIBSQL.Create(nil);
  try
    Q.Database := dmConectar.IBDatabase1;
    Q.Transaction := dmConectar.IBTransaction1;
    Q.SQL.Text :=
      'select coalesce(max(SERIE),0) + 1 as NUEVA_SERIE ' +
      'from MONEDA_DET';
    Q.ExecQuery;

    if not Q.Eof then
      Result := Q.FieldByName('NUEVA_SERIE').AsInteger;
  finally
    Q.Free;
  end;
end;

procedure TfrmDatosCambioTasa.ActualizaTasa(const ACodigo: String);
var
  Q                  : TIBSQL;
  VSerieActual       : Integer;
  VNuevaSerie        : Integer;
  VFechaCambio       : TDateTime;
  VFechaIniActual    : TDateTime;
  VFechaFinActual    : TDateTime;
  VNuevaFechaFinal   : TDateTime;
  VFechaSiguiente    : TDateTime;
  VTieneSiguiente    : Boolean;
  VValor             : Double;
begin
  VFechaCambio := Trunc(ExtraerFecha(dtpkFechaInicia.Date));

  ObtenerPeriodoActivo(
    ACodigo,
    VFechaCambio,
    VSerieActual,
    VFechaIniActual,
    VFechaFinActual);

  if ACodigo = '1' then
    VValor := 1
  else
    VValor := edtValorTasa.ValueFloat;

  { Si la fecha coincide exactamente con el inicio del período vigente,
    no se crea un período duplicado. Se trata como corrección del valor. }
  if VFechaCambio = VFechaIniActual then
  begin
    Q := TIBSQL.Create(nil);
    try
      Q.Database := dmConectar.IBDatabase1;
      Q.Transaction := dmConectar.IBTransaction1;
      Q.SQL.Text :=
        'update MONEDA_DET set ' +
        'VALOR = :VALOR, MOD_POR = :MOD_POR, FECHA_UPD = :FECHA_UPD ' +
        'where SERIE = :SERIE and CODIGO = :CODIGO';

      Q.ParamByName('VALOR').AsDouble := VValor;
      Q.ParamByName('MOD_POR').AsString := AjustarTextoCampo(StrUserName, 10);
      Q.ParamByName('FECHA_UPD').AsDateTime := Now;
      Q.ParamByName('SERIE').AsInteger := VSerieActual;
      Q.ParamByName('CODIGO').AsString := Trim(ACodigo);
      Q.ExecQuery;
    finally
      Q.Free;
    end;
    Exit;
  end;

  if VFechaCambio < VFechaIniActual then
    raise Exception.Create(
      'La fecha efectiva no puede ser anterior al inicio del rango vigente.');

  { Regla solicitada: una nueva vigencia automática inicia en la fecha
    seleccionada y termina en la misma fecha del próximo año. }
  VNuevaFechaFinal := Trunc(IncYear(VFechaCambio, 1));

  { Si ya existe un período futuro, Cambiar Tasa no debe inventar un
    intervalo que lo solape ni dejar un hueco. Ese escenario se maneja
    manualmente desde el histórico. }
  VTieneSiguiente := ObtenerSiguienteFechaInicial(
    ACodigo,
    VFechaIniActual,
    VFechaSiguiente);

  if VTieneSiguiente then
  begin
    if VNuevaFechaFinal >= VFechaSiguiente then
      raise Exception.Create(
        'Moneda ' + ACodigo +
        ': el cambio automático crearía un solapamiento.' + #13#10 +
        'La nueva vigencia sería ' +
        FormatDateTime('dd/mm/yyyy',VFechaCambio) + ' - ' +
        FormatDateTime('dd/mm/yyyy',VNuevaFechaFinal) + ',' + #13#10 +
        'pero existe otro rango que inicia ' +
        FormatDateTime('dd/mm/yyyy',VFechaSiguiente) + '.' + #13#10 +
        'Use el histórico para insertar/modificar el intervalo manualmente.');

    if VNuevaFechaFinal + 1 <> VFechaSiguiente then
      raise Exception.Create(
        'Moneda ' + ACodigo +
        ': el cambio automático dejaría un hueco de fechas.' + #13#10 +
        'La nueva vigencia terminaría ' +
        FormatDateTime('dd/mm/yyyy',VNuevaFechaFinal) + ',' + #13#10 +
        'pero el siguiente rango inicia ' +
        FormatDateTime('dd/mm/yyyy',VFechaSiguiente) + '.' + #13#10 +
        'Para mantener continuidad, el siguiente rango tendría que iniciar ' +
        FormatDateTime('dd/mm/yyyy',VNuevaFechaFinal + 1) + '.' + #13#10 +
        'Use el histórico para resolver el intervalo manualmente.');
  end;

  Q := TIBSQL.Create(nil);
  try
    Q.Database := dmConectar.IBDatabase1;
    Q.Transaction := dmConectar.IBTransaction1;

    { 1. Cerrar el rango actual exactamente el día anterior. }
    Q.SQL.Text :=
      'update MONEDA_DET set ' +
      'FECHA_FINAL = :FECHA_FINAL, MOD_POR = :MOD_POR, FECHA_UPD = :FECHA_UPD ' +
      'where SERIE = :SERIE and CODIGO = :CODIGO';

    Q.ParamByName('FECHA_FINAL').AsDateTime := VFechaCambio - 1;
    Q.ParamByName('MOD_POR').AsString := AjustarTextoCampo(StrUserName, 10);
    Q.ParamByName('FECHA_UPD').AsDateTime := Now;
    Q.ParamByName('SERIE').AsInteger := VSerieActual;
    Q.ParamByName('CODIGO').AsString := Trim(ACodigo);
    Q.ExecQuery;

    { 2. Crear la nueva vigencia. }
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Text :=
      'insert into MONEDA_DET ' +
      '(SERIE, CODIGO, FECHA_INICIAL, FECHA_FINAL, VALOR, ' +
      ' INSERTADO_POR, FECHA_IN, MOD_POR, FECHA_UPD) ' +
      'values ' +
      '(:SERIE, :CODIGO, :FECHA_INICIAL, :FECHA_FINAL, :VALOR, ' +
      ' :INSERTADO_POR, :FECHA_IN, :MOD_POR, :FECHA_UPD)';

    VNuevaSerie := SiguienteSerieMonedaDet;

    Q.ParamByName('SERIE').AsInteger := VNuevaSerie;
    Q.ParamByName('CODIGO').AsString := Trim(ACodigo);
    Q.ParamByName('FECHA_INICIAL').AsDateTime := VFechaCambio;
    Q.ParamByName('FECHA_FINAL').AsDateTime := VNuevaFechaFinal;
    Q.ParamByName('VALOR').AsDouble := VValor;
    Q.ParamByName('INSERTADO_POR').AsString := AjustarTextoCampo(StrUserName, 10);
    Q.ParamByName('FECHA_IN').AsDateTime := Now;
    Q.ParamByName('MOD_POR').Clear;
    Q.ParamByName('FECHA_UPD').Clear;
    Q.ExecQuery;
  finally
    Q.Free;
  end;
end;

procedure TfrmDatosCambioTasa.BitBtn1Click(Sender: TObject);
var
  VError : string;
begin
  { El botón es bkOK en el DFM. Neutralizamos el cierre automático:
    solo asignamos mrOK después de validar, actualizar y confirmar. }
  ModalResult := mrNone;

  if edtValorTasa.ValueFloat <= 0 then
  begin
    MessageDlg('Valor tasa no puede ser cero, verifique',
      mtError,[mbOK],0);
    Exit;
  end;

  OutputDebugString(PChar(
    'MONEDA_DET AUDIT: UserLen=' + IntToStr(Length(Trim(StrUserName))) +
    ' MOD_POR.Size=' + IntToStr(frmMoneda.qryMonedaDetMOD_POR.Size) +
    ' INSERTADO_POR.Size=' + IntToStr(frmMoneda.qryMonedaDetINSERTADO_POR.Size)));

  if not dmConectar.IBTransaction1.InTransaction then
    dmConectar.IBTransaction1.StartTransaction;

  try
    { No continuar sobre una cronología ya inconsistente. }
    VError := '';
    if not frmMoneda.ValidarCadenaMoneda('1', VError) then
      raise Exception.Create(VError);

    VError := '';
    if not frmMoneda.ValidarCadenaMoneda('2', VError) then
      raise Exception.Create(VError);

    { Pesos y dólar se modifican dentro de UNA sola transacción. }
    ActualizaTasa('1');
    ActualizaTasa('2');

    { Guardia final: la operación solamente se confirma si las dos cadenas
      quedan sin solapamientos y sin huecos. }
    VError := '';
    if not frmMoneda.ValidarCadenaMoneda('1', VError) then
      raise Exception.Create(VError);

    VError := '';
    if not frmMoneda.ValidarCadenaMoneda('2', VError) then
      raise Exception.Create(VError);

    dmConectar.IBTransaction1.CommitRetaining;
    ModalResult := mrOK;
  except
    on E: Exception do
    begin
      if dmConectar.IBTransaction1.InTransaction then
        dmConectar.IBTransaction1.RollbackRetaining;

      MessageDlg(
        'No se realizó el cambio de tasa.' + #13#10 +
        E.Message,
        mtError,[mbOK],0);

      ModalResult := mrNone;
    end;
  end;
end;

procedure TfrmDatosCambioTasa.FormCreate(Sender: TObject);
begin
  dtpkFechaInicia.Date := Date;

  { BitBtn1 tiene Kind=bkOK en el DFM. La decisión de cerrar el formulario
    la controla BitBtn1Click después de completar la transacción. }
  BitBtn1.ModalResult := mrNone;
end;

end.
