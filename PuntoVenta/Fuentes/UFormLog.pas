unit UFormLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, Grids, DBGrids, RXDBCtrl, StdCtrls, WinSkinData;

type
  TfrmLogError = class(TForm)
    rxLog: TRxMemoryData;
    rxLogid: TIntegerField;
    rxLogHora: TDateTimeField;
    rxLogfecha: TDateTimeField;
    rxLogMetodo: TStringField;
    rxLogQuery: TStringField;
    RxDBGrid1: TRxDBGrid;
    dsrxLog: TDataSource;
    rxLogGlbNumeroPos: TIntegerField;
    rxLogSerie: TIntegerField;
    rxLogItbis: TCurrencyField;
    rxLogValortotal: TCurrencyField;
    rxLogSourceLIne: TIntegerField;
    rxLogOnChageUnit: TSmallintField;
    rxLogOnChangeCant: TSmallintField;
    rxLogOnChangePrecio: TSmallintField;
    rxLogOnExitPrecio: TSmallintField;
    rxLogCant: TCurrencyField;
    rxLogPrecio: TCurrencyField;
    Button1: TButton;
    rxLogOnEnterPrecio: TSmallintField;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    CheckBox1: TCheckBox;
    rxLogMarca: TIntegerField;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure rxLogFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurrenLN:integer;
    Cant:real;
    Precio:real;
    Marca:Integer;
    Procedure LogSteps(gNumPos:Integer;Serie:Integer;Hora:TDateTime;fecha:TDateTime;Metodo:String;Query:String);
    Procedure LogMarca(gNumPos:Integer;Serie:Integer;Hora:TDateTime;fecha:TDateTime;fname:string;fvalor:smallint);
  end;

var
  frmLogError: TfrmLogError;

implementation
  uses  uGlobal, UDatModCalculos;
{$R *.dfm}

{ TfrmLogError }

Procedure TfrmLogError.LogSteps(gNumPos:Integer;Serie:Integer;Hora:TDateTime;fecha:TDateTime;Metodo:String;Query:String);
var
  num:Integer;
begin
  Exit;
  rxLog.Last;
  if Not rxLogId.IsNull then
  num:=rxLogId.Value + 1
  else num:=1;
  rxLog.Append;
  rxLogid.value:=num;
  if Marca > 0 then
  rxLogMarca.Value:=Marca;
  rxLogHora.Value:=now;
  rxLogfecha.Value:=ExtraerFecha(now);
  rxLogMetodo.Value:=metodo;
  rxLogQuery.Value:=query;
  rxLogGlbNumeroPos.Value:=gNumPos;
  rxLogSerie.Value:=serie;
  rxlogCant.value:=cant;
  rxlogprecio.value:=precio;
  rxLogItbis.Value:=dmCalculos.tmpValorItbis;
  rxLogValortotal.Value:= dmCalculos.tmpValorTotal;
  rxLogSourceLIne.Value:= CurrenLN;
  try
    rxLog.Post;
  except
  end;
  Marca:=-1;
end;

procedure TfrmLogError.FormCreate(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  if rxLog.State = dsInactive then
  rxLog.Open;
end;

procedure TfrmLogError.LogMarca(gNumPos:Integer;Serie:Integer;Hora:TDateTime;fecha:TDateTime;fname:string;fvalor:smallint);
var
  num:Integer;
begin
  Exit;
  rxLog.Last;
  if Not rxLogId.IsNull then
  num:=rxLogId.Value+1
  else num:=1;
  rxLog.Append;
  rxLogid.Value:= num;
  rxLog.FieldByName(fname).Value := fvalor;
  rxLogHora.Value:=now;
  rxLogfecha.Value:=ExtraerFecha(now);
  //rxLogMetodo.Value:=metodo;
  //rxLogQuery.Value:=query;
  rxLogGlbNumeroPos.Value:=gNumPos;
  rxLogSerie.Value:=serie;
  rxLogSourceLIne.Value:= CurrenLN;
  try
    rxLog.Post;
  except
  end;
end;

procedure TfrmLogError.Button1Click(Sender: TObject);
begin
  rxLog.EmptyTable;
end;

procedure TfrmLogError.Button2Click(Sender: TObject);
begin
  rxLog.Filtered:= False;
  rxLog.Filtered:= True;
  CheckBox1.Checked:= True;
  CheckBox1.Color:=clGreen;
end;

procedure TfrmLogError.rxLogFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  rxLog.Filter:=edit1.Text+'='+chr(39)+edit2.Text+chr(39);
end;

procedure TfrmLogError.CheckBox1Click(Sender: TObject);
begin
  rxLog.Filtered:= False;
  CheckBox1.Color:=clWindow;
end;

end.
