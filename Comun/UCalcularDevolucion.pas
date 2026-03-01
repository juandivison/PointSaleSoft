unit UCalcularDevolucion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, RxMemDS;

type
  TForm1 = class(TForm)
    Cal: TRxMemoryData;
    CalMontoADepositar: TFloatField;
    CalConsumoReal: TFloatField;
    CalDepositoEfectivo: TFloatField;
    CalDepositoTarjeta: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    CalDevolucionEfectivo: TFloatField;
    CalDevolucionTarjeta: TFloatField;
    CalDiferencia: TFloatField;
    Button3: TButton;
    edtDeTj: TEdit;
    edtDevEfe: TEdit;
    edtDevTj: TEdit;
    edtMD: TEdit;
    edtCons: TEdit;
    edtDEf: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit7: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CalCalcFields(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if cal.state in [dsedit, dsinsert] then cal.Post;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  x: smallint;
begin
  cal.Close;
  cal.Open;
  for x:=1 to 5 do
  begin
  Cal.Insert;
  CalMontoADepositar.Value   := 3200;
  CalConsumoReal.Value       := 3100;
  CalDepositoEfectivo.Value  := 2000;
  CalDepositoTarjeta.Value   := 1200;
  case x of
  1:CalConsumoReal.Value:=3100;
  2:CalConsumoReal.Value:=3100;
  3:CalConsumoReal.Value:=3100;
  4:CalConsumoReal.Value:=0;
  5:CalConsumoReal.Value:=1000;
  end;

  case x of
  1:CalDepositoEfectivo.Value:=2000;
  2:CalDepositoEfectivo.Value:=1000;
  3:CalDepositoEfectivo.Value:=3000;
  4:CalDepositoEfectivo.Value:=3200;
  5:CalDepositoEfectivo.Value:=2600;
  end;
  case x of
  1:CalDepositoTarjeta.Value:=1200;
  2:CalDepositoTarjeta.Value:=2200;
  3:CalDepositoTarjeta.Value:=2000;
  4:CalDepositoTarjeta.Value:=0;
  5:CalDepositoTarjeta.Value:=600;
  end;

  Cal.Post;
  end;
end;

procedure TForm1.CalCalcFields(DataSet: TDataSet);
var
  Dif : Real;
  EfectivoMasTarjeta:Real;
begin
  EfectivoMasTarjeta:= CalDepositoEfectivo.Value + CalDepositoTarjeta.Value;
  if CalConsumoReal.Value < EfectivoMasTarjeta then
  begin
    if (CalConsumoReal.Value - CalDepositoEfectivo.Value) < CalConsumoReal.Value then
    begin
      if (CalConsumoReal.Value - CalDepositoEfectivo.Value) < CalDepositoTarjeta.Value then
     CalDevolucionTarjeta.Value:= CalConsumoReal.Value -( CalDepositoEfectivo.Value + CalDepositoTarjeta.Value);
    end;
  end else
  if (CalConsumoReal.Value - EfectivoMasTarjeta) < CalConsumoReal.Value then
  if (CalConsumoReal.Value - CalDepositoTarjeta.Value) < CalDepositoTarjeta.Value then
  CalDevolucionEfectivo.Value:=CalConsumoReal.Value + CalDepositoTarjeta.Value - CalDepositoEfectivo.Value;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Cal.Edit;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Consumido, Depositado, Efectivo, Tarjeta, DevEfe, DevTarj:Integer;
  Resto : Integer;
begin
  edtMd.Text   := CalMontoADepositar.AsString;
  edtcons.Text := CalConsumoReal.AsString;
  edtdef.Text  := CalDepositoEfectivo.AsString;
  edtdetj.Text := CalDepositoTarjeta.AsString;

  Depositado := StrToInt(edtMD.Text);             //3,200
  Consumido  := StrToInt(edtCons.Text);           //3,100
  Efectivo  := StrToInt(edtDef.Text);             //2600
  Tarjeta   := StrToInt(edtDeTj.Text);            //600
  DevEfe    := 0;//StrToInt(edtDevEfe.Text);      //
  DevTarj   := 0;//StrToInt(edtDevTj.Text);       //
  edtDevEfe.Text:='';
  edtDevTj.Text :='';

  if Consumido < Depositado then
  begin
    if Consumido < Efectivo then //proceder a usar el efectivo
    begin
      Resto := Efectivo - Consumido;
      DevEfe:=Resto;
      edtDevEfe.Text := IntToStr(DevEfe);
      DevTarj:=Tarjeta;
      edtDevTj.Text := IntToStr(DevTarj);
    end
    else
    begin
      Resto := Consumido - Efectivo;
      Resto := Tarjeta - Resto;
      DevTarj:=Resto;
      edtDevTj.Text := IntToStr(DevTarj);
    end
  end;
end;

end.
