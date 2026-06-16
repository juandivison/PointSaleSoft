unit UImportarDatosTSS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Mask, RxSpin, StdCtrls,
  ComBoxMeses, ComCtrls, Buttons, ExtCtrls;

type
  TfrmExportarDatosTSS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rdgTipoEmp: TRadioGroup;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox2: TCheckBox;
    Button1: TButton;
    combomeses: TComBoxMeses;
    RxSpinEdit1: TRxSpinEdit;
    OpenDialog1: TOpenDialog;
    qryListEmp: TIBQuery;
    qryListEmpTipoSalario: TStringField;
    qryListEmpTIPODOCUMENTO: TIBStringField;
    qryListEmpCEDULA_NUEVA: TIBStringField;
    qryListEmpNOMBRE: TIBStringField;
    qryListEmpAPELLIDO: TIBStringField;
    qryListEmpFECHA_NAC: TDateTimeField;
    qryListEmpTIPO_EMPLEADO: TSmallintField;
    qryListEmpCODIGOIDSS: TIBStringField;
    qryListEmpSALARIO: TFloatField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure combomesesChange(Sender: TObject);
    procedure qryListEmpCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure ActualizaDatos;
    procedure ProcesaAutodeterminacion;
    procedure AbrirArchivo(strFile:string);
    procedure ProcesarDatos;
    function ExtraerStr(What,Where:String):String;
    Function DivideApellido(x:Integer):String;//Divide en dos los apellidos
    Function Salario25Pos(Longitud:Smallint;Valor:Real):String;
    Function CantRecord(Longitud: Smallint): String;
  public
    { Public declarations }
  end;

var
  frmExportarDatosTSS: TfrmExportarDatosTSS;
  var
    LogFile : TextFile;
  StrCopiar : TStringlist;
  FFileName : String;
  

implementation
uses UDatModConectar;


{$R *.dfm}



procedure TfrmExportarDatosTSS.AbrirArchivo(strFile: string);
begin
  AssignFile(LogFile,StrFile);
  Rewrite(Logfile);
  CloseFile(LogFile);
  if FileExists(FFileName) then
  StrCopiar.LoadFromFile(FFileName);
end;

procedure TfrmExportarDatosTSS.ActualizaDatos;
var
  strLinea : String;
begin
  qryListEmp.First;
  While Not qryListEmp.Eof do
  begin
    strLinea:=qryListEmpTIPODOCUMENTO.AsString+';'+
    ExtraerStr('-',qryListEmpCEDULA_NUEVA.AsString)+';'+
    qryListEmpNOMBRE.AsString+';'+
    DivideApellido(0)+';'+
    DivideApellido(1)+';'+
    FormatDateTime('ddmmyyyy',qryListEmpFECHA_NAC.Value)+';'+
    qryListEmpCODIGOIDSS.AsString+';'+
    Format('%9.2f',[qryListEmpSALARIO.Value])+';'+
    qryListEmpTIPOSALARIO.AsString;
    Memo1.Lines.Add(StrLinea);
    qryListEmp.Next;
    ProgressBar1.StepIt;
  end;
  ProgressBar1.Position := 0;
end;

procedure TfrmExportarDatosTSS.BitBtn1Click(Sender: TObject);
begin
  Memo1.Visible:=False;
  qryListEmp.Close;
  case rdgTipoEmp.ItemIndex of
  0:begin
      qryListEmp.Params[0].Value := 'A';
      qryListEmp.Params[1].Value := 'A';
    end;
  1:begin
      qryListEmp.Params[0].Value := 'D';
      qryListEmp.Params[1].Value := 'I';
    end;
  2:begin
      qryListEmp.Params[0].Value := 'A';
      qryListEmp.Params[1].Value := 'I';
    end;
  end;
  combomeses.FechaInicial:=EncodeDate(RxSpinEdit1.AsInteger,1,1);
  combomeses.FechaFinal:=EncodeDate(RxSpinEdit1.AsInteger,1,1);
  combomeses.AsignaDiaMes;
  qryListEmp.Params[2].Value := combomeses.fechainicial;
  qryListEmp.Params[3].Value := combomeses.Fechafinal;
  qryListEmp.Open;
  ProgressBar1.Position := 0 ;
  ProgressBar1.Max:= qryListEmp.RecordCount;
  ProcesarDatos;
end;

procedure TfrmExportarDatosTSS.ProcesarDatos;
var
  StrFileToCopy : String;
begin
  StrCopiar := TStringList.Create;
  FFileName:='C:\DatosAsc\ListEmp.txt';
  if Not DirectoryExists('C:\DatosAsc') then
  begin
    if not CreateDir('C:\DatosAsc') then
    begin
      Raise Exception.Create('Directorio no puede ser creado C:\DatosAsc');
    end;
  end;

  AbrirArchivo('C:\DatosAsc\ListEmp.txt');
  if not CheckBox2.Checked then
  ActualizaDatos //generar archivo siren
  else 
  ProcesaAutodeterminacion; //generar archivo autodeterminacion  
  With StrCopiar do
  Begin
    AddStrings(Memo1.Lines);
  end;
  FFilename:='C:\DatosAsc\ListEmp.txt';
  StrCopiar.SaveToFile(FFilename);
  StrCopiar.Free;
  Beep;
  if CheckBox1.Checked then
  Memo1.Visible:=True;
end;

procedure TfrmExportarDatosTSS.FormCreate(Sender: TObject);
Var
  MesesEsp: Array[1..12] of String;
  y,m,d:word;
begin
  DecodeDate(now,y,m,d);
  RxSpinEdit1.MaxValue:=y;
  RxSpinEdit1.MinValue:=2000;
  RxSpinEdit1.Value:=y;
  MesesEsp[1]:='Enero';
  MesesEsp[2]:='Febrero';
  MesesEsp[3]:='Marzo';
  MesesEsp[4]:='Abril';
  MesesEsp[5]:='Mayo';
  MesesEsp[6]:='Junio';
  MesesEsp[7]:='Julio';
  MesesEsp[8]:='Agosto';
  MesesEsp[9]:='Septiembre';
  MesesEsp[10]:='Octubre';
  MesesEsp[11]:='Noviembre';
  MesesEsp[12]:='Diciembre';;
  Memo1.Lines.Clear;
  combomeses.Text:= MesesEsp[StrToInt(FormatDatetime('mm',now))];
end;

function TfrmExportarDatosTSS.DivideApellido(x: Integer): String;
var
  y:Integer;
  cadena,apellido:String;
begin
  Apellido:='';
  Cadena:=qryListEmpAPELLIDO.Value;
  for y:=1 to Length(Cadena) do
  begin
    if (Ord(Cadena[y]) = 32) and (y >=5)  then Break else
    Apellido:=Apellido + Cadena[y];
  end;
  case x of
  0:Result :=Apellido;
  1:Result :=Copy(Cadena,Length(Apellido)+2,Length(Cadena));
  end;
end;

function TfrmExportarDatosTSS.ExtraerStr(What, Where: String): String;
var x:integer;
begin
  Result:='';
  for x:=1 to Length(where) do
  begin
    if where[x] <> '-' then
    Result:=Result + where[x];
  end;
end;

procedure TfrmExportarDatosTSS.Memo1Change(Sender: TObject);
begin
  BitBtn2.Visible:=True;
end;

procedure TfrmExportarDatosTSS.BitBtn2Click(Sender: TObject);
begin
  StrCopiar := TStringList.Create;
  With StrCopiar do
  Begin
    AddStrings(Memo1.Lines);
  end;
  FFilename:='C:\DatosAsc\ListEmp.txt';
  StrCopiar.SaveToFile(FFilename);
  StrCopiar.Free;
  Beep;  
end;

procedure TfrmExportarDatosTSS.BitBtn3Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    memo1.Lines.Clear;
    memo1.Visible:=True;
    memo1.Lines.LoadFromFile(opendialog1.filename);
  end;
end;
//******

procedure TfrmExportarDatosTSS.ProcesaAutodeterminacion;
var
  strLinea     :String;
  strNumRec    :String[5];
  strR, StrComp:String[25];
  strRecord:String[5];
  x,y:Integer;
  SumSalario : Real;
begin
  qryListEmp.First;
  StrComp:='';
  Memo1.Lines.Add('ENVRF101164484'+
                   FormatDateTime('mmyyyy',combomeses.fechainicial){062003'});
  SumSalario:=0;
  While Not qryListEmp.Eof do
  begin
    SumSalario:=SumSalario + qryListEmpSALARIO.Value;
    strR:=Salario25Pos(25,qryListEmpSALARIO.Value);
    //StrComp:=Salario25Pos(25,0.00);
    strLinea:='D'+ExtraerStr('-',qryListEmpCEDULA_NUEVA.AsString)+
    '001' + strR;
    Memo1.Lines.Add(TrimRight(StrLinea));
    strR:='';
    qryListEmp.Next;
    ProgressBar1.StepIt;
  end;
  Label3.Caption:=Format('%9.2m',[SumSalario]);
  strRecord:=CantRecord(qryListEmp.RecordCount);
  Memo1.Lines.Add('S'+strRecord);
  ProgressBar1.Position := 0;
end;

procedure TfrmExportarDatosTSS.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then CheckBox2.Caption:='Txt Autodeterminacion' 
  else CheckBox2.Caption:='Archivo Txt para TSS';
end;

function TfrmExportarDatosTSS.Salario25Pos(Longitud:Smallint;Valor: Real): String;
var
     Salario : String;
  strSalario : String[25];
  strMonto   : String;
  LongitudA,LongitudB,x,y:Integer;
begin  //Format('%8.2f', [123.456])
  SetLength(strSalario, Longitud);
  FillChar(strSalario,SizeOf(strSalario),'0');
  Salario:=Format('%10.2f', [Valor]);
  Salario:=Trim(Salario);
  LongitudA:=Length(Trim(Salario));
  LongitudB:=Longitud - LongitudA;
  For x:=1 to LongitudB do
  strSalario[x]:='0';
  y:=1;
  Inc(LongitudB);
  for x:=LongitudB to Longitud do
  begin
    strSalario[x]:=Salario[y];
    Inc(y);
 end;
  Result:=strSalario;
end;

procedure TfrmExportarDatosTSS.Button1Click(Sender: TObject);
begin
  ShowMessage(Salario25Pos(25,13200));
end;

function TfrmExportarDatosTSS.CantRecord(Longitud: Smallint): String;
var
  strRecord: String[5];
  NoRecord : String;
  LongitudA,LongitudB,x,y:Integer;
begin
  NoRecord:=Format('%5d',[Longitud]);
  NoRecord:=Trim(NoRecord);
  LongitudA:=Length(Trim(NoRecord));
  LongitudB:=5 - LongitudA;
  For x:=1 to LongitudB do
  strRecord[x]:='0';
  y:=1;
  Inc(LongitudB);
  for x:=LongitudB to 5 do
  begin
    strRecord[x]:=NoRecord[y];
    Inc(y);
 end;
 Result:=strRecord;
end;

procedure TfrmExportarDatosTSS.combomesesChange(Sender: TObject);
begin
  combomeses.FechaInicial:=EncodeDate(RxSpinEdit1.AsInteger,1,1);
  combomeses.FechaFinal:=EncodeDate(RxSpinEdit1.AsInteger,1,1);
  combomeses.AsignaDiaMes;
end;

procedure TfrmExportarDatosTSS.qryListEmpCalcFields(DataSet: TDataSet);
begin
  if qryListEmpTIPO_EMPLEADO.Value = 1 then
  qryListEmpTipoSalario.Value:='F' else
  qryListEmpTipoSalario.Value:='V';
end;


end.
