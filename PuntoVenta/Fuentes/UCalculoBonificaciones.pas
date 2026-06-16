unit UCalculoBonificaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids, RxMemDS, StdCtrls,
  Variants, EditNew, Buttons, RXDBCtrl, ComCtrls, IBCustomDataSet, IBQuery,
  IBUpdateSQL;

type
  TfrmCalculoBonificaciones = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    TSalarioA: TRxMemoryData;
    TSalarioATotal: TFloatField;
    dtqryDatosBoni: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    ValorUtilidad: TEditN;
    BitBtn2: TBitBtn;
    TabSheet2: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    Button1: TButton;
    edtAnio: TEditN;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    qryBoni: TIBQuery;
    qryBoniFechaSalidaCld: TDateTimeField;
    qryBoniSXDIA: TFloatField;
    qryBoniTOTALANIOS: TFloatField;
    qryBoniTOTALDIAS: TFloatField;
    qryBoniSDIARIOACUM: TFloatField;
    qryBoniFACTOR: TFloatField;
    qryBoniTBONO: TFloatField;
    qryBoniUTILIDAD: TFloatField;
    qryBoniBonificacionNeta: TFloatField;
    qryBoniCODIGO: TIntegerField;
    qryBoniCIA_KEY: TIntegerField;
    qryBoniNOMBRE: TIBStringField;
    qryBoniAPELLIDO: TIBStringField;
    qryBoniFECHA_LLEGADA: TDateTimeField;
    qryBoniFECHA_SALIDA: TDateTimeField;
    qryBoniSALARIO: TFloatField;
    qryBoniCEDULA_NUEVA: TIBStringField;
    qryBoniSTATUS_EMP: TIBStringField;
    qryBoniTIPO_EMPLEADO: TSmallintField;
    qryBoniDEPTO_EMP: TSmallintField;
    qryBoniSECCION_EMP: TSmallintField;
    qryBoniCARGO_EMP: TSmallintField;
    qryBoniDESCDEPTO: TIBStringField;
    qryBoniISR: TFloatField;
    qryBoniMONTO_BONIFIACION: TFloatField;
    qryDatosBoni: TIBQuery;
    IBUpdateSQL1: TIBUpdateSQL;
    qryDatosBoniCIA_KEY: TSmallintField;
    qryDatosBoniCODIGO: TIntegerField;
    qryDatosBoniFECHA: TDateTimeField;
    qryDatosBoniMONTO_BONIFIACION: TFloatField;
    qryDatosBoniISR: TFloatField;
    qryDatosBoniFECHAIN: TDateTimeField;
    qryDatosBoniNUMERO_CKS: TIntegerField;
    qryDatosBoniSTATUS: TIBStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure qryBoniCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CalculaTotalSalarios;

    function PeriodoInicio: TDateTime;
    function PeriodoFin: TDateTime;
    function FechaCorteEmpleado: TDateTime;
    function FondoLegalBonificacion: Double;

    function RoundMoney(AValue: Double): Double;
    function SalarioDiarioRD(ASalarioMensual: Double): Double;
    function DiasServicio(AFechaEntrada, AFechaCorte: TDateTime): Integer;
    function AniosServicio(AFechaEntrada, AFechaCorte: TDateTime): Double;
    function MesesServicio(AFechaEntrada, AFechaCorte: TDateTime): Double;
    function DiasBonificablesRD(AFechaEntrada, AFechaCorte: TDateTime): Double;
    function BonificacionTeoricaRD(ASalarioMensual: Double;
      AFechaEntrada, AFechaCorte: TDateTime): Double;
    function BonificacionFinalRD(ABonificacionTeorica,
      ATotalBonificacionTeorica, AFondoDisponible: Double): Double;
  public
    { Public declarations }
  end;

var
  frmCalculoBonificaciones: TfrmCalculoBonificaciones;

implementation

uses URepBonifica, UDatModConectar, UGlobal;

{$R *.DFM}

const
  FACTOR_DIAS_MES_RD = 23.83;
  PORC_BONIFICACION_LEGAL = 0.10;
  DIAS_BONIFICACION_1_A_3 = 45.0;
  DIAS_BONIFICACION_MAS_3 = 60.0;

function TfrmCalculoBonificaciones.RoundMoney(AValue: Double): Double;
begin
  if AValue >= 0 then
    Result := Int(AValue * 100 + 0.5) / 100
  else
    Result := -Int(Abs(AValue) * 100 + 0.5) / 100;
end;

function TfrmCalculoBonificaciones.PeriodoInicio: TDateTime;
begin
  Result := EncodeDate(edtAnio.ValueInteger, 1, 1);
end;

function TfrmCalculoBonificaciones.PeriodoFin: TDateTime;
begin
  Result := EncodeDate(edtAnio.ValueInteger, 12, 31);
end;

function TfrmCalculoBonificaciones.FondoLegalBonificacion: Double;
begin
  { ValorUtilidad debe contener la utilidad neta anual de la empresa.
    La participacion legal disponible para empleados es el 10% de esa utilidad.
    Si en tu operacion el usuario ya digita el fondo a distribuir, cambia esta
    funcion para retornar ValorUtilidad.ValueFloat directamente.
  Result := RoundMoney(ValorUtilidad.ValueFloat * PORC_BONIFICACION_LEGAL);}
  Result := RoundMoney(ValorUtilidad.ValueFloat);
end;

function TfrmCalculoBonificaciones.FechaCorteEmpleado: TDateTime;
begin
  Result := PeriodoFin;

  if (qryBoniSTATUS_EMP.Value = 'I') and
     (not qryBoniFECHA_SALIDA.IsNull) then
    Result := qryBoniFECHA_SALIDA.Value;

  if Result > PeriodoFin then
    Result := PeriodoFin;
end;

function TfrmCalculoBonificaciones.SalarioDiarioRD(
  ASalarioMensual: Double): Double;
begin
  if ASalarioMensual <= 0 then
    Result := 0
  else
    Result := ASalarioMensual / FACTOR_DIAS_MES_RD;
end;

function TfrmCalculoBonificaciones.DiasServicio(AFechaEntrada,
  AFechaCorte: TDateTime): Integer;
begin
  if AFechaCorte < AFechaEntrada then
    Result := 0
  else
    Result := Trunc(AFechaCorte - AFechaEntrada) + 1;
end;

function TfrmCalculoBonificaciones.AniosServicio(AFechaEntrada,
  AFechaCorte: TDateTime): Double;
begin
  Result := DiasServicio(AFechaEntrada, AFechaCorte) / 365.0;
end;

function TfrmCalculoBonificaciones.MesesServicio(AFechaEntrada,
  AFechaCorte: TDateTime): Double;
begin
  { Meses proporcionales. Esto evita saltos bruscos por dias sueltos y
    permite que empleados con menos de un anio reciban proporcional real. }
  Result := DiasServicio(AFechaEntrada, AFechaCorte) / (365.0 / 12.0);

  if Result < 0 then
    Result := 0;

  if Result > 12 then
    Result := 12;
end;

function TfrmCalculoBonificaciones.DiasBonificablesRD(AFechaEntrada,
  AFechaCorte: TDateTime): Double;
var
  Anios: Double;
  Meses: Double;
begin
  Anios := AniosServicio(AFechaEntrada, AFechaCorte);

  if Anios > 3.0 then
    Result := DIAS_BONIFICACION_MAS_3
  else if Anios >= 1.0 then
    Result := DIAS_BONIFICACION_1_A_3
  else
  begin
    Meses := MesesServicio(AFechaEntrada, AFechaCorte);
    Result := DIAS_BONIFICACION_1_A_3 * (Meses / 12.0);
  end;

  if Result < 0 then
    Result := 0;
end;

function TfrmCalculoBonificaciones.BonificacionTeoricaRD(
  ASalarioMensual: Double; AFechaEntrada,
  AFechaCorte: TDateTime): Double;
var
  SalarioDiario: Double;
  DiasBonificables: Double;
begin
  SalarioDiario := SalarioDiarioRD(ASalarioMensual);
  DiasBonificables := DiasBonificablesRD(AFechaEntrada, AFechaCorte);
  Result := RoundMoney(SalarioDiario * DiasBonificables);
end;

function TfrmCalculoBonificaciones.BonificacionFinalRD(
  ABonificacionTeorica, ATotalBonificacionTeorica,
  AFondoDisponible: Double): Double;
begin
  if (ABonificacionTeorica <= 0) or
     (ATotalBonificacionTeorica <= 0) or
     (AFondoDisponible <= 0) then
  begin
    Result := 0;
    Exit;
  end;

  if ATotalBonificacionTeorica <= AFondoDisponible then
    Result := ABonificacionTeorica
  else
    Result := (ABonificacionTeorica / ATotalBonificacionTeorica) *
      AFondoDisponible;

  Result := RoundMoney(Result);
end;

procedure TfrmCalculoBonificaciones.CalculaTotalSalarios;
var
  TotalTeorico: Double;
  BonoTeorico: Double;
  FechaCorte: TDateTime;
  Bmk: TBookmark;
begin
  if not qryBoni.Active then
    Exit;

  if not TSalarioA.Active then
    TSalarioA.Open;

  if TSalarioA.RecordCount = 0 then
    TSalarioA.Insert
  else
    TSalarioA.Edit;

  TotalTeorico := 0;
  Bmk := nil;

  qryBoni.DisableControls;
  try
    if not qryBoni.IsEmpty then
      Bmk := qryBoni.GetBookmark;

    qryBoni.First;
    while not qryBoni.Eof do
    begin
      FechaCorte := FechaCorteEmpleado;
      BonoTeorico := BonificacionTeoricaRD(qryBoniSALARIO.Value,
        qryBoniFECHA_LLEGADA.Value, FechaCorte);
      TotalTeorico := TotalTeorico + BonoTeorico;
      qryBoni.Next;
    end;

    TSalarioATOTAL.Value := RoundMoney(TotalTeorico);
    TSalarioA.Post;

    if Bmk <> nil then
      qryBoni.GotoBookmark(Bmk)
    else
      qryBoni.First;
  finally
    if Bmk <> nil then
      qryBoni.FreeBookmark(Bmk);
    qryBoni.EnableControls;
  end;
end;

procedure TfrmCalculoBonificaciones.BitBtn1Click(Sender: TObject);
begin
  qckboni := Tqckboni.Create(Nil);
  try
    qckboni.QRLabel15.Caption:=edtAnio.Text;
    qckboni.Preview;
  finally
    qckboni.Free;
    qckboni := Nil;
  end;
end;

procedure TfrmCalculoBonificaciones.BitBtn2Click(Sender: TObject);
begin
  {
  qryDatosBoni.Close;
  qryDatosBoni.Params[0].Value := edtAnio.ValueInteger;
  qryDatosBoni.Open;  }
  BitBtn3Click(Self);

  qryBoni.First;
  while not qryBoni.Eof do
  begin
    if qryDatosBoni.Locate('CIA_KEY;CODIGO',
       VarArrayOf([qryBoniCIA_KEY.Value, qryBoniCODIGO.Value]), []) then
    begin
      if qryDatosBoniNUMERO_CKS.IsNull and (qryDatosBoniSTATUS.Value = 'A') then
      begin
        qryDatosBoni.Edit;
        qryDatosBoniMONTO_BONIFIACION.Value := qryBoniTBONO.Value;
        qryDatosBoni.Post;
      end;
    end
    else
    begin
      with qryBoni do
        qryDatosBoni.InsertRecord([
          FieldByName('CIA_KEY').Value,
          FieldByName('CODIGO').Value,
          ExtraerFecha(qryBoni.Params[1].Value),
          FieldByName('TBONO').Value,
          0,
          Date,
          Null,
          'A']);
      qryDatosBoni.ApplyUpdates;
    end;
    qryBoni.Next;
  end;

  if not qryBoni.Transaction.InTransaction then
    qryBoni.Transaction.StartTransaction;

  try
    qryBoni.Transaction.CommitRetaining;
  except
    qryBoni.Transaction.RollbackRetaining;
    raise;
  end;

  if not qryDatosBoni.Transaction.InTransaction then
    qryDatosBoni.Transaction.StartTransaction;

  try
    qryDatosBoni.Transaction.CommitRetaining;
  except
    qryDatosBoni.Transaction.RollbackRetaining;
    raise;
  end;

  BitBtn3Click(Self);
end;

procedure TfrmCalculoBonificaciones.Button1Click(Sender: TObject);
var
  FI, FF: TDateTime;
begin
  FI := PeriodoInicio;
  FF := PeriodoFin;

  qryBoni.Close;
  qryBoni.Params[0].Value := FI;
  qryBoni.Params[1].Value := FF;
  qryBoni.Open;

  TSalarioA.Close;
  TSalarioA.EmptyTable;
  TSalarioA.Open;

  CalculaTotalSalarios;

  { Fuerza recalc visual de campos calculados luego de conocer el total teorico. }
  if not qryBoni.IsEmpty then
  begin
    qryBoni.DisableControls;
    try
      qryBoni.First;
      while not qryBoni.Eof do
        qryBoni.Next;
      qryBoni.First;
    finally
      qryBoni.EnableControls;
    end;
  end;
end;

procedure TfrmCalculoBonificaciones.BitBtn3Click(Sender: TObject);
var
  FF: TDateTime;
begin
  FF := PeriodoFin;
  qryDatosBoni.Close;
  qryDatosBoni.Params[0].Value := ExtraerFecha(FF);
  qryDatosBoni.Open;
end;

procedure TfrmCalculoBonificaciones.qryBoniCalcFields(DataSet: TDataSet);
var
  FechaCorte: TDateTime;
  SalarioDiario: Double;
  Anios: Double;
  DiasBonificables: Double;
  BonoTeorico: Double;
  TotalTeorico: Double;
  FondoDisponible: Double;
  BonoFinal: Double;
begin
  if qryBoniFECHA_LLEGADA.IsNull then
    Exit;

  FechaCorte := FechaCorteEmpleado;

  if qryBoniSTATUS_EMP.Value = 'I' then
    qryBoniFechaSalidaCld.Value := FechaCorte;

  SalarioDiario := SalarioDiarioRD(qryBoniSALARIO.Value);
  Anios := AniosServicio(qryBoniFECHA_LLEGADA.Value, FechaCorte);
  DiasBonificables := DiasBonificablesRD(qryBoniFECHA_LLEGADA.Value,
    FechaCorte);
  BonoTeorico := BonificacionTeoricaRD(qryBoniSALARIO.Value,
    qryBoniFECHA_LLEGADA.Value, FechaCorte);

  TotalTeorico := TSalarioATOTAL.Value;
  FondoDisponible := FondoLegalBonificacion;
  BonoFinal := BonificacionFinalRD(BonoTeorico, TotalTeorico,
    FondoDisponible);

  qryBoniUTILIDAD.Value := ValorUtilidad.ValueFloat;
  qryBoniSXDIA.Value := RoundMoney(SalarioDiario);
  qryBoniTOTALANIOS.Value := Anios;
  qryBoniTOTALDIAS.Value := DiasBonificables;
  qryBoniFACTOR.Value := BonoTeorico;
  qryBoniSDIARIOACUM.Value := TotalTeorico;
  qryBoniTBONO.Value := BonoFinal;

  qryBoniBonificacionNeta.Value := RoundMoney(BonoFinal - qryBoniISR.Value);
  if qryBoniBonificacionNeta.Value < 0 then
    qryBoniBonificacionNeta.Value := 0;
end;

procedure TfrmCalculoBonificaciones.FormCreate(Sender: TObject);
begin
  edtAnio.Text:= InttoStr(StrToInt(FormatDateTime('yyyy',now))-1);

  if (edtAnio.Text <> '') then
  edtAnio.SetInteger(StrToInt(edtAnio.text));
end;

end.
