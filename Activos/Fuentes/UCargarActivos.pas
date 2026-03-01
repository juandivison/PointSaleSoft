unit UCargarActivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBGrids, Db, IBCustomDataSet, Grids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  ComCtrls, Mask, DBTables, IBQuery;

type
  TfrmCargarActivos = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnCargar: TBitBtn;
    btnActualiza: TBitBtn;
    cargar: TStringGrid;
    dbgrid: TDBGrid;
    Abrir: TOpenDialog;
    DBNavigator1: TDBNavigator;
    BitBtn4: TBitBtn;
    ProgressBar1: TProgressBar;    Button2: TButton;
    Fixfecha: TBitBtn;
    Query1: TIBQuery;
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
  frmCargarActivos: TfrmCargarActivos;

implementation

uses UDatModConectar;

{$R *.DFM}

procedure TfrmCargarActivos.btnCargarClick(Sender: TObject);
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
          If Linea[i]= '*' Then
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

procedure TfrmCargarActivos.btnActualizaClick(Sender: TObject);
var
r,c:Integer;
begin
  c:=1;
  query1.open;
  query1.Edit;
  for r:=1 to Cargar.RowCount - 1 do
  Begin
    progressbar1.StepIt;
    query1.InsertRecord([(cargar.cells[c,r]),
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
    cargar.Cells[c+17,r],
    cargar.Cells[c+18,r],
    cargar.Cells[c+19,r],
    cargar.Cells[c+20,r],
    cargar.cells[c+21,r],
    cargar.cells[c+22,r],
    cargar.cells[c+23,r],
    cargar.cells[c+24,r]{,
    cargar.cells[c+25,r],
    cargar.cells[c+26,r],
    cargar.cells[c+27,r],
    now,'DIVISON'}]);
  end;
  progressbar1.Position:=0;
  fixfecha.Enabled:=false;
  btnActualiza.Enabled:=false;
end;

//cargar.Cells[ACol, ARow: Integer]: string;
procedure TfrmCargarActivos.BitBtn4Click(Sender: TObject);
var
col, fila : integer;
begin
  for col:=0 to cargar.ColCount -1 do
   for fila:=0 to cargar.RowCount -1 do
   Cargar.Cells[col,fila]:='';
end;

procedure TfrmCargarActivos.dbgridDblClick(Sender: TObject);
begin
  query1.Close;
  query1.Open;
end;

procedure TfrmCargarActivos.Button2Click(Sender: TObject);
begin
  if MessageDlg('Borrar todos los Datos de Maestro_Activos?',mtInformation,[mbyes,mbno],0) = mryes then
  begin
    query1.Close;
    query1.Open;
    query1.First;
    While Not query1.Eof do
    begin
      query1.Delete;
      progressbar1.StepIt;
    end;
    query1.Close;
    query1.Open;
    progressbar1.Position:=0;
  end;
end;

procedure TfrmCargarActivos.FixfechaClick(Sender: TObject);
var i : integer;
 Cadena : String;
begin
  for i := 1 to cargar.RowCount - 1 do
  begin
    cadena := Cargar.Cells[21,i];
    if cargar.Cells[21,i] = '2000-00-00' then
    Begin
      Cargar.Cells[21,i] := '';
    end;
  end;
end;

end.


