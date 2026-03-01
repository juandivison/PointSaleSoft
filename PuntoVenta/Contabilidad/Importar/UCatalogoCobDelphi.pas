unit UCatalogoCobDelphi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBGrids, Db, DBTables, Grids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  ComCtrls, Mask;

type
  TfrmCargarcuentas = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnCargar: TBitBtn;
    btnActualiza: TBitBtn;
    cargar: TStringGrid;
    tBalance: TTable;
    dbgrid: TDBGrid;
    Abrir: TOpenDialog;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    ProgressBar1: TProgressBar;    Button2: TButton;
    dbalance: TDataSource;
    Fixfecha: TBitBtn;
    tBalanceCUENTA1: TStringField;
    tBalanceCUENTA2: TStringField;
    tBalanceCUENTA3: TStringField;
    tBalanceNOMBRE_CTA: TStringField;
    tBalanceNIVEL_CTA: TSmallintField;
    tBalanceTIPO_CTA: TStringField;
    tBalanceCTA_CTRL1: TStringField;
    tBalanceCTA_CTRL2: TStringField;
    tBalanceCTA_CTRL3: TStringField;
    tBalanceCTACIE1: TStringField;
    tBalanceCTACIE2: TStringField;
    tBalanceCTACIE3: TStringField;
    tBalanceSIGNO_CTA: TSmallintField;
    tBalanceBALANCE_ACT: TFloatField;
    tBalanceBALANCE_ANT: TFloatField;
    tBalanceCREDITO_ACT: TFloatField;
    tBalanceDEBITO_ACT: TFloatField;
    tBalanceCREDITO_ACM: TFloatField;
    tBalanceDEBITO_ACM: TFloatField;
    tBalanceFECHA_APE: TDateTimeField;
    tBalanceFECHA_ACT: TDateTimeField;
    tBalanceFECHA_ULT_TR: TDateTimeField;
    tBalanceTIPO: TStringField;
    tBalanceCTA_CONS1: TStringField;
    tBalanceCTA_CONS2: TStringField;
    tBalanceCTA_CONS3: TStringField;
    tBalanceCLASIFICACION_CTA: TIntegerField;
    tBalanceSTATUS: TStringField;
    tBalanceFECHA_IN: TDateTimeField;
    tBalanceIN_POR: TStringField;
    tBalanceFECHA_MOD: TDateTimeField;
    tBalanceMOD_POR: TStringField;
    procedure btnCargarClick(Sender: TObject);
    procedure btnActualizaClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgridDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FixfechaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargarcuentas: TfrmCargarcuentas;

implementation

{$R *.DFM}

procedure TfrmCargarcuentas.btnCargarClick(Sender: TObject);
var
i,c,r     : Integer;
Linea     : String;
MiArchivo : TextFile;
Salir     : Char;
begin
  i:=0;
  r:=1;
  c:=1;
  if Abrir.Execute then
  Begin
    progressbar1.Enabled:=true;
    AssignFile(Miarchivo,Abrir.FileName);
    Reset(MiArchivo);
while not Eof(MiArchivo) do
    begin
      Readln(MiArchivo,Linea);
      Repeat
        Begin
          if c > (Cargar.ColCount - 1) then
             Cargar.ColCount:=Cargar.ColCount + 1;
          if r > (Cargar.RowCount - 1) then
             Cargar.RowCount:=Cargar.RowCount + 1;
          inc(i);
          if linea[i] in ['a'..'z','A'..'Z','0'..'9','.',' ','-'] then
                Cargar.Cells[c,r]:=Cargar.Cells[c,r]+ Linea[i];
          If Linea[i] = '|' Then inc(c);
          If Linea[i]= '!' Then
           Begin
             Salir:='S';
             inc(r);
             i:=0;c:=1;
           End Else
           salir:= 'N';
        end;//repeat
      Until Salir = 'S';
      progressbar1.StepIt;
    end;
    progressbar1.Enabled:=false;
    progressbar1.Position:=0;
    CloseFile(MiArchivo);
end;
btnCargar.Enabled:=false;
cargar.SetFocus;
end;

procedure TfrmCargarcuentas.btnActualizaClick(Sender: TObject);
var
r,c:Integer;
begin
c:=1;
tBalance.open;
tBalance.Edit;
  for r:=1 to Cargar.RowCount - 1 do
  Begin
    progressbar1.StepIt;
    tBalance.InsertRecord([(cargar.cells[c,r]),
    cargar.cells[c+1,r],
    cargar.cells[c+2,r],
    cargar.cells[c+3,r],
    cargar.cells[c+4,r],
    cargar.cells[c+5,r],
    cargar.cells[c+6,r],
    cargar.cells[c+7,r],
    cargar.cells[c+8,r],
    cargar.cells[c+9,r],
    cargar.cells[c+10,r],
    cargar.cells[c+11,r],
    cargar.cells[c+12,r],
    cargar.cells[c+13,r],
    cargar.cells[c+14,r],
    cargar.cells[c+15,r],
    cargar.cells[c+16,r],
    cargar.cells[c+17,r],
    cargar.cells[c+18,r],
    cargar.cells[c+19,r],
    cargar.cells[c+20,r],
    cargar.cells[c+21,r],
    cargar.cells[c+22,r],
    cargar.cells[c+23,r],
    cargar.cells[c+24,r],
    cargar.cells[c+25,r],
    cargar.cells[c+26,r]]);
  end;
  progressbar1.Position:=0;
  fixfecha.Enabled:=false;
  FixfechaClick(self);
  btnActualiza.Enabled:=false;
end;

//cargar.Cells[ACol, ARow: Integer]: string;
procedure TfrmCargarcuentas.BitBtn4Click(Sender: TObject);
var
col, fila : integer;
begin
  for col:=0 to cargar.ColCount -1 do
   for fila:=0 to cargar.RowCount -1 do
   Cargar.Cells[col,fila]:='';
end;

procedure TfrmCargarcuentas.dbgridDblClick(Sender: TObject);
begin
tBalance.open;
end;

procedure TfrmCargarcuentas.Button2Click(Sender: TObject);
begin
tBalance.close;
tBalance.open;
tBalance.first;
while not tBalance.Eof do
begin
  tBalance.delete;
  progressbar1.StepIt;
end;
tBalance.Close;
tBalance.open;
progressbar1.position:=0;
end;

procedure TfrmCargarcuentas.FixfechaClick(Sender: TObject);
begin
  with tBalance do
  begin
    Filtered:=false;
    Filter:='fecha_ult_tr <70-10-10';
    Filtered:=true;
    while not eof do
    begin
      edit;
      tBalanceFECHA_ULT_TR.AsVariant:=Null;
      post;
      progressbar1.StepIt;
    end;
    first;
  end;
  tBalance.Filtered:=false;
  tBalance.close;
  tBalance.open;
  progressbar1.Position:=0;
end;

end.
