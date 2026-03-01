unit USetuptranscnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  FileCtrl, Inifiles, StdCtrls, Buttons, ExtCtrls, RXSpin, ComCtrls,
  WinSkinData ;

type
  TfrmSetup = class(TForm)
    Label1: TLabel;
    RxSpinEdit1: TRxSpinEdit;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup4: TRadioGroup;
    dtpkProchora: TDateTimePicker;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EjecutarCadaMinutos : Integer;
    MostrarVentanaDatos : Smallint;
    GuardaLogfile       : Smallint;
    ProcesarhoraFija    : Smallint; 
    GlbProcHora         : String;

    PermiteMultipleInstancia : Smallint;
    AppCorriendo : Smallint;
    procedure DatosConfiguracion;
    procedure ProcGuardarDatos;

  end;

var
  frmSetup: TfrmSetup;
  
implementation
uses uglobal;

{$R *.dfm}

{ TfrmSetup }

procedure TfrmSetup.DatosConfiguracion;
var
  Ini: TIniFile;
  NombArchivo : String;
  x: integer;
begin
  NombArchivo := ExtractFilePath(Application.ExeName)+'\'+'Transcnt.ini';
  Ini := TIniFile.Create(NombArchivo);
  try
    EjecutarCadaMinutos:= Ini.ReadInteger( 'TransCnt', 'EjecutarCadaMinutos', 1);
    MostrarVentanaDatos := Ini.ReadInteger( 'TransCnt', 'MostrarVentanaDatos',1 );
    GuardaLogfile := Ini.ReadInteger('TransCnt', 'GuardaLogfile',0);
    PermiteMultipleInstancia := Ini.ReadInteger('TransCnt', 'PermiteMultipleInstancia',0);
    AppCorriendo := Ini.ReadInteger('TransCnt', 'AppCorriendo',0);
    if AppCorriendo = 0 then
    Ini.WriteInteger('Aplicacion', 'AppCorriendo', 1);

    ProcesarhoraFija    := Ini.ReadInteger('TransCnt', 'ProcesarhoraFija', 0);
    GlbProcHora         := Ini.ReadString('TransCnt', 'GlbProcHora', '');

  finally
  Ini.Free;
  end;

  //if EjecutarCadaMinutos = 1 then
  RxSpinEdit1.Value:= EjecutarCadaMinutos; 

  if MostrarVentanaDatos = 1 then
  RadioGroup1.ItemIndex := 0
  else
  RadioGroup1.ItemIndex := 1;

  if GuardaLogfile = 1 then
  RadioGroup2.ItemIndex:=0
  else RadioGroup2.ItemIndex:=1;

  if PermiteMultipleInstancia = 1 then
  RadioGroup3.ItemIndex:=0
  else
  RadioGroup3.ItemIndex:=1;
end;

procedure TfrmSetup.ProcGuardarDatos;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'\'+'Transcnt.ini' );
  try

  if RxSpinEdit1.Value >= 1 then
    Ini.WriteInteger( 'TransCnt', 'EjecutarCadaMinutos', RxSpinEdit1.AsInteger)
  else
  Ini.WriteInteger( 'TransCnt', 'EjecutarCadaMinutos', 30);
  GlbProcHora:= TimeToStr(dtpkProchora.DateTime);
  Ini.WriteInteger('TransCnt', 'ProcesarhoraFija', ProcesarhoraFija);
  Ini.WriteString('TransCnt', 'GlbProcHora', GlbProcHora);


  if RadioGroup1.ItemIndex = 0 then
  MostrarVentanaDatos:=1
  else MostrarVentanaDatos:=0;

  if RadioGroup2.ItemIndex = 0 then
  GuardaLogfile:=1
  else GuardaLogfile:=0;

  if RadioGroup3.ItemIndex = 0 then
  PermiteMultipleInstancia:=1
  else PermiteMultipleInstancia:=0;

  if RadioGroup4.ItemIndex = 0 then
  ProcesarhoraFija:=1
  else ProcesarhoraFija:=0;

  if (ProcesarhoraFija = 1) then
  GlbProcHora:=TimeToStr(dtpkProchora.DateTime)
  else GlbProcHora:='';
  finally
  Ini.Free;
  end;

end;

procedure TfrmSetup.BitBtn1Click(Sender: TObject);
begin
  ProcGuardarDatos;
end;

procedure TfrmSetup.FormCreate(Sender: TObject);
begin
  DatosConfiguracion;
end;

procedure TfrmSetup.RadioGroup4Click(Sender: TObject);
begin
  if  RadioGroup4.ItemIndex = 0 then
  ProcesarhoraFija:=1
  else ProcesarhoraFija:=0;
end;

end.
