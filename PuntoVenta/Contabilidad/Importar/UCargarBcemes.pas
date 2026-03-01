unit UCargarBcemes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBGrids, Db, DBTables, Grids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  ComCtrls, Mask, GetAnyDate;

type
  TfrmCargarctlgoblce = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnCargar: TBitBtn;
    btnActualiza: TBitBtn;
    cargar: TStringGrid;
    dbgrid: TDBGrid;
    Abrir: TOpenDialog;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    ProgressBar1: TProgressBar;
    Button2: TButton;
    tBalance: TTable;
    dBalance: TDataSource;
    Timer1: TTimer;
    FechaDatos: TGetAnyDate;
    procedure btnCargarClick(Sender: TObject);
    procedure btnActualizaClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgridDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargarctlgoblce: TfrmCargarctlgoblce;

implementation

uses UDatamodulocnt1;

{$R *.DFM}

procedure TfrmCargarctlgoblce.btnCargarClick(Sender: TObject);
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
end;
CloseFile(MiArchivo);
btnCargar.Enabled:=false;
cargar.SetFocus;
end;

procedure TfrmCargarctlgoblce.btnActualizaClick(Sender: TObject);
var
r,c:Integer;
begin
c:=1;
tbalance.open;
tBalance.Edit;
progressbar1.Max:=cargar.RowCount;
  for r:=1 to Cargar.RowCount - 1 do
  Begin
    progressbar1.StepIt;
    {showmessage(cargar.cells[c,r]+' 0 '+
    cargar.cells[c+1,r]+' 1 '+
    cargar.cells[c+2,r]+' 2 '+
    cargar.cells[c+3,r]+' 3 '+
    cargar.cells[c+4,r]+' 4 '+
    cargar.cells[c+5,r]+' 5 '+
    cargar.cells[c+6,r]+' 6 '+
    cargar.cells[c+7,r]+' 7 '+
    cargar.cells[c+8,r]+' 8 '+
    cargar.cells[c+9,r]+' 9 '+
    cargar.cells[c+10,r]+' 10 '+
    cargar.cells[c+11,r]+' 11 ');}
    tBalance.InsertRecord([cargar.cells[c,r],
    cargar.cells[c+1,r],
    cargar.cells[c+2,r],
    cargar.cells[c+3,r],//fecha_bce usado en lugar de mes_balance
    cargar.cells[c+4,r],
    cargar.cells[c+5,r],
    cargar.cells[c+6,r],
//    cargar.cells[c+7,r],//mes_balance descartado
    cargar.cells[c+8,r],
    cargar.cells[c+9,r],
    cargar.cells[c+10,r],
    cargar.cells[c+11,r]]);
  end;
  progressbar1.Position:=0;
  btnActualiza.Enabled:=false;
end;

//cargar.Cells[ACol, ARow: Integer]: string;
procedure TfrmCargarctlgoblce.BitBtn4Click(Sender: TObject);
var
col, fila : integer;
begin
  for col:=0 to cargar.ColCount -1 do
   for fila:=0 to cargar.RowCount -1 do
   begin
     progressbar1.stepit;
     Cargar.Cells[col,fila]:='';
   end;
   progressbar1.position:=0;
end;

procedure TfrmCargarctlgoblce.dbgridDblClick(Sender: TObject);
begin
  tBalance.Close;
  tBalance.open;
end;

procedure TfrmCargarctlgoblce.Button2Click(Sender: TObject);
var
  qryBorra : TQUERY;
begin
  if fechaDatos.Execute then
  Begin
    tBalance.Close;
    tBalance.open;
    timer1.Enabled:=true;
    progressbar1.Max:=tbalance.RecordCount;
    qryBorra := tquery.Create(nil);
    qryborra.DatabaseName:=dm.dbdatos.DatabaseName;
    qryborra.sql.Clear;
    qryborra.sql.add('Delete from BALANCE_CNT ');
    qryborra.sql.add('where fecha_blc = :fecha');
    qryborra.Params[0].AsDate := fechaDatos.fecha;
    qryborra.ExecSQL;
    qryborra.close;
    qryborra.free;
    tBalance.Close;
    tBalance.open;
    timer1.Enabled:=false;
    progressbar1.position:=0;
  end;
end;

procedure TfrmCargarctlgoblce.Timer1Timer(Sender: TObject);
begin
  progressbar1.StepIt;
end;

end.
