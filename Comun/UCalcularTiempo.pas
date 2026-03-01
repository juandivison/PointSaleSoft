unit UCalcularTiempo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DateUtils, Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, RxMemDS, Grids,
  DBGrids, EditNew;

 type
   ValoresTipoTarifa = array[1..5] of integer;

type
  TfrmCalcularTiempoRenta = class(TForm)
    Button1: TButton;
    dtpkFechaIni: TDateTimePicker;
    dtpkHoraIni: TDateTimePicker;
    dtpkHoraFin: TDateTimePicker;
    dtpkFechaFin: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelDia: TLabel;
    LabelMes: TLabel;
    LabelAnio: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    RadioGroup1: TRadioGroup;
    rxTiempo: TRxMemoryData;
    rxTiempohora: TIntegerField;
    rxTiempodia: TIntegerField;
    rxTiemposemana: TIntegerField;
    rxTiempoquincena: TIntegerField;
    rxTiempomensual: TIntegerField;
    dsrxTiempo: TDataSource;
    DBGrid1: TDBGrid;
    rxTiempoTopeRentaxHora: TIntegerField;
    edtTopeRentHora: TEditN;
    Label29: TLabel;
    Label30: TLabel;
    rxTiempoCantHoraExtra: TFloatField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Function ExtraerFecha(fecha:TDatetime):TDatetime;
    Function ExtraerHora(fecha:TDatetime):TDatetime;
    FuncTion DiasEnElMes(anio : Integer; Mes : Integer) : Smallint;
    FuncTion GlbUltimoDiaMesAnt(glbfechaInicial:TDatetime):TDatetime;

  public
      LtipoTarifa : Smallint;
      Procedure ProcCalcularTiempo(FechaIni:TDatetime;FechaFin:TDatetime;Var Dias, Horas:Int64);
  end;

var
  frmCalcularTiempoRenta: TfrmCalcularTiempoRenta;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmCalcularTiempoRenta.ProcCalcularTiempo(FechaIni:TDatetime;FechaFin:TDatetime;Var Dias, Horas:Int64);
var
  anioIni, MesIni,  DiaIni,
  anioFin, MesFin,  DiaFin : Word;
  HoraIni, MinIni,  SegIni, SsIni,
  HoraFin, MinFin,  SegFin, SsFin : Word;

  tDias, tMes, tAnio : Word;
  TodoEnMinutos, TodoEnSegundos,
  TotalHoras,
  TotalDias,
  TotalSemana,
  TotalQuincena,
  TotalMeses : Int64;

  TodoEnDia  : Int64;
  TotalDiasConDec, SemanaConResto : Real;
  resto, totalresto : Real;
  strresto:string[6];
begin
  totalHoras:=0;  totalDias:=0;  totalSemana:=0;  totalMeses:=0;
  DecodeDate(FechaIni,AnioIni,MesIni,DiaIni);
  DecodeDate(FechaFin,AnioFin,MesFin,DiaFin);

  TodoEnSegundos  := SecondsBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                       ExtraerHora(dtpkHoraIni.DateTime),
                                       ExtraerFecha(dtpkfechaFin.DateTime)+
                                       ExtraerHora(dtpkHoraFin.DateTime));

  //ShowMessage(Formatdatetime('yyyy-mm-dd HH:MM',(ExtraerFecha(dtpkfechaIni.DateTime)+ ExtraerHora(dtpkHoraIni.DateTime))));
  //ShowMessage(Formatdatetime('yyyy-mm-dd HH:MM',(ExtraerFecha(dtpkfechaFin.DateTime)+ ExtraerHora(dtpkHoraFin.DateTime))));

  Label23.Caption := IntToStr(TodoEnSegundos);
  TotalHoras      := HoursBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                  ExtraerHora(dtpkHoraIni.DateTime),
                                  ExtraerFecha(dtpkfechaFin.DateTime)+
                                  ExtraerHora(dtpkHoraFin.DateTime));
  Label25.Caption := IntToStr(TotalHoras);
  TodoEnMinutos   := MinutesBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                    ExtraerHora(dtpkHoraIni.DateTime),
                                    ExtraerFecha(dtpkfechaFin.DateTime)+
                                    ExtraerHora(dtpkHoraFin.DateTime));
  Label21.Caption := IntToStr(TodoEnMinutos);
  TodoEnDia       := DaysBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                 ExtraerHora(dtpkHoraIni.DateTime),
                                 ExtraerFecha(dtpkfechaFin.DateTime)+
                                 ExtraerHora(dtpkHoraFin.DateTime));
  SemanaConResto := WeekSPan(ExtraerFecha(dtpkfechaIni.DateTime)+
                                   ExtraerHora(dtpkHoraIni.DateTime),
                                   ExtraerFecha(dtpkfechaFin.DateTime)+
                                   ExtraerHora(dtpkHoraFin.DateTime));
  label30.Caption := FloatToStr(semanaconresto);
  TotalSemana     := WeeksBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                   ExtraerHora(dtpkHoraIni.DateTime),
                                   ExtraerFecha(dtpkfechaFin.DateTime)+
                                   ExtraerHora(dtpkHoraFin.DateTime));
  TotalMeses      := MonthsBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                   ExtraerHora(dtpkHoraIni.DateTime),
                                   ExtraerFecha(dtpkfechaFin.DateTime)+
                                   ExtraerHora(dtpkHoraFin.DateTime));
  TotalDiasConDec :=DaysPan(ExtraerFecha(dtpkfechaIni.DateTime)+
                                 ExtraerHora(dtpkHoraIni.DateTime),
                                 ExtraerFecha(dtpkfechaFin.DateTime)+
                                 ExtraerHora(dtpkHoraFin.DateTime));
  Label12.Caption := IntToStr(TodoEnDia);
  //aqui voy
  {TotalQuincena   := TodoEnDia Div 15;
  TodoEnDia       := TodoEnDia - (TotalQuincena * 15);
  TotalSemana     := TodoEnDia Div 7;

  if TodoEnDia > 6 then
  TotalDias := TodoEnDia - (TotalSemana * 7)
  else TotalDias:= TodoEnDia;}

  Label8.Caption:= IntToStr(TotalDias);
  Label9.Caption:= IntToStr(TotalSemana);
  Label10.Caption:= IntToStr(TotalQuincena);
  Label11.Caption:= IntToStr(TotalMeses);

  LabelDia.Caption  := IntToStr(tDias);
  LabelMes.Caption  := IntToStr(tMes);
  LabelAnio.Caption := IntToStr(tAnio);
  Dias := TotalDias;
  Horas:= TotalHoras; //temporal - (TotalDias * 24);

  {if (Horas = 0) and (TotalDiasConDec < 1 ) then
  Horas:= StrToInt(Trim(Format('%8f', [TotalDiasConDec * 1440])));}

  Label18.caption := FloatToStr(TotalDiasConDec);
  Label26.Caption := 'Dias ' + IntToStr(TotalDias) +
                    ' Total Horas ' + IntTosTr((TotalHoras  - (TotalDias * 24)));
  rxTiempo.close;
  rxTiempo.open;
  rxTiempo.Insert;
  {if edtTopeRentHora.ValueInteger = 0 then
  MessageDlg('Ficha no tiene tope hora extra registrado, verifique',mtInformation, [mbOK], 0);}
  rxTiempoTopeRentaxHora.Value := edtTopeRentHora.ValueInteger;
  Case LtipoTarifa Of
  1: begin //Hora
       if TotalHoras > rxTiempoTopeRentaxHora.Value then
       begin
         if Totalhoras <= 24 then
         begin
            rxTiempohora.Value:=0;
            rxTiempoDia.Value:=1;
         end else
         begin
           rxTiempoDia.Value:= Totalhoras Div 24;
           rxTiempohora.Value:= TotalHoras - (rxTiempoDia.Value * 24);
         end;
       end else rxTiempohora.Value:= TotalHoras;
     end;
  2: begin //Diaria
       if (TotalDiasConDec < 1) And  (TotalDiasConDec > 0) then
       rxTiempoDia.Value := 1
       else
       begin
         rxTiempoDia.Value :=  TodoEnDia;
         resto := Frac(TotalDiasConDec);
         totalresto:=( resto * 1440) / 60;
         if Int(totalresto) <= rxTiempoTopeRentaxHora.Value then
         rxTiempoCantHoraExtra.Value := Int(totalresto) else
         begin
           rxTiempoDia.Value:=rxTiempoDia.Value + 1;
         end;
       end;
     end;
  3: begin //Semana
       rxTiemposemana.Value := TotalSemana;
       rxTiempodia.AsFloat  := TodoEnDia  Mod 7;

       resto := Frac(TotalDiasConDec);
       totalresto:=( resto * 1440) / 60;
       if Int(totalresto) <= rxTiempoTopeRentaxHora.Value then
       rxTiempoCantHoraExtra.Value := Int(totalresto) else
       begin
         rxTiempoDia.Value:=rxTiempoDia.Value + 1;
       end;
       if rxtiempoDia.Value = 7 then
       begin
         rxTiempoSemana.Value := rxTiempoSemana.Value + 1;
         rxTiempoDia.Value    := 0;
       end;
     end;
  4: begin //Quincena
       if TodoEnDia <= 15 then
       rxTiempoquincena.Value := 1
       else
       begin
         rxTiempoquincena.Value := TodoEnDia Div 15;
         rxTiempoDia.Value      :=  TodoEnDia - (rxTiempoquincena.Value * 15);
         resto := Frac(TotalDiasConDec);
         totalresto:=( resto * 1440) / 60;

         if Int(totalresto) <= rxTiempoTopeRentaxHora.Value then
         rxTiempoCantHoraExtra.Value := Int(totalresto) else
         begin
           rxTiempoDia.Value:=rxTiempoDia.Value + 1;
         end;

       end;
     end;
  5: begin //Mensual
       rxTiempomensual.Value := TodoEnDia Div 30;
       rxTiempoDia.Value      :=  TodoEnDia - (rxTiempomensual.Value * 30);
       resto := Frac(TotalDiasConDec);
       totalresto:=( resto * 1440) / 60;
       if Int(totalresto) <= rxTiempoTopeRentaxHora.Value then
       rxTiempoCantHoraExtra.Value := Int(totalresto) else
       begin
         rxTiempoDia.Value:=rxTiempoDia.Value + 1;
       end;
     end;
  end;
  rxTiempo.Post;
end;

function TfrmCalcularTiempoRenta.DiasEnElMes(anio, Mes: Integer): Smallint;
begin
  Result := MonthDays[IsLeapYear(anio), mes];
end;

function TfrmCalcularTiempoRenta.ExtraerFecha(fecha: TDatetime): TDatetime;
begin
  Result:=StrToDate(FormatDatetime(ShortDateFormat,fecha));
end;

function TfrmCalcularTiempoRenta.ExtraerHora(fecha: TDatetime): TDatetime;
begin
  Result:=StrToTime(FormatDatetime(shortTimeFormat,fecha));
end;

procedure TfrmCalcularTiempoRenta.Button1Click(Sender: TObject);
var
  xValores : ValoresTipoTarifa;
  x : Real;
  dias, hora:int64;
begin
  label27.Caption:= formatdatetime('yyyy-mmm-dd',dtpkfechaini.date) +'  ' + formatdatetime('HH:MM',dtpkhoraini.time);
  label28.Caption:= formatdatetime('yyyy-mmm-dd',dtpkfechafin.date) +'  ' + formatdatetime('HH:MM',dtpkhorafin.time);
  ProcCalcularTiempo(dtpkfechaini.Date + dtpkHoraIni.Time,
                 dtpkFechaFin.Date + dtpkHoraFin.Time, dias,hora);
end;


function TfrmCalcularTiempoRenta.GlbUltimoDiaMesAnt(glbfechaInicial: TDatetime): TDatetime;
var
  a,m,d:Word;
begin
  DecodeDate(GlbfechaInicial,a,m,d);
  if (m = 1) then
  begin
    m:=12;
    Dec(a);
  end else Dec(m);
  Result:=EncodeDate(a,m,DiasEnElMes(a,m));
end;

procedure TfrmCalcularTiempoRenta.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add(IntToStr(SecondsBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                       ExtraerHora(dtpkHoraIni.DateTime),
                                       ExtraerFecha(dtpkfechaFin.DateTime)+
                                       ExtraerHora(dtpkHoraFin.DateTime))));
end;

procedure TfrmCalcularTiempoRenta.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

procedure TfrmCalcularTiempoRenta.Button3Click(Sender: TObject);
begin
  Memo1.Lines.Add(IntToStr(MinutesBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                       ExtraerHora(dtpkHoraIni.DateTime),
                                       ExtraerFecha(dtpkfechaFin.DateTime)+
                                       ExtraerHora(dtpkHoraFin.DateTime))));
end;

procedure TfrmCalcularTiempoRenta.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Add(IntToStr(HoursBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                       ExtraerHora(dtpkHoraIni.DateTime),
                                       ExtraerFecha(dtpkfechaFin.DateTime)+
                                       ExtraerHora(dtpkHoraFin.DateTime))));
end;

procedure TfrmCalcularTiempoRenta.Button5Click(Sender: TObject);
begin
  Memo1.Lines.Add(IntToStr(DaysBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                       ExtraerHora(dtpkHoraIni.DateTime),
                                       ExtraerFecha(dtpkfechaFin.DateTime)+
                                       ExtraerHora(dtpkHoraFin.DateTime))));
end;

procedure TfrmCalcularTiempoRenta.Button6Click(Sender: TObject);
begin
  Memo1.Lines.Add(IntToStr(WeeksBetween(ExtraerFecha(dtpkfechaIni.DateTime)+
                                       ExtraerHora(dtpkHoraIni.DateTime),
                                       ExtraerFecha(dtpkfechaFin.DateTime)+
                                       ExtraerHora(dtpkHoraFin.DateTime))));
end;

procedure TfrmCalcularTiempoRenta.RadioGroup1Click(Sender: TObject);
begin
  Case radiogroup1.ItemIndex of
    0 : LtipoTarifa := 1;
    1 : LtipoTarifa := 2;
    2 : LtipoTarifa := 3;
    3 : LtipoTarifa := 4;
    4 : LtipoTarifa := 5;
  end;
end;

procedure TfrmCalcularTiempoRenta.FormShow(Sender: TObject);
begin
  label27.Caption:= FormatDateTime('yyyy-mmm-dd',dtpkFechaIni.Date) +'  ' + FormatDateTime('HH:MM',dtpkhoraini.time);
  label28.Caption:= FormatDateTime('yyyy-mmm-dd',dtpkFechaFin.Date) +'  ' + FormatDateTime('HH:MM',dtpkhorafin.time);
end;

end.
