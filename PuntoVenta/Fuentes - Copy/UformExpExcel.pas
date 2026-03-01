unit UformExpExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ComCtrls, IBQuery, IBSQL, Dialogs, StdCtrls, OleServer, ExcelXP, Buttons,
  ShellApi, Excel97;

type
  TfrmExportarExcel = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Excel: TExcelApplication;
    Memo1: TMemo;

  private
    function SetMergeCells (sheet:variant;cel1:variant;cel2:variant;
    MergeCells:boolean):boolean;

    { Private declarations }
  public
    { Public declarations }
    rangoFecha : String;
    Procedure ExporToExcel(mTabla : TIBQuery; NombreArchivo : String);overload;
    Procedure ExporToExcel(NombreArchivo : String);overload;
  end;

var
  frmExportarExcel: TfrmExportarExcel;
  Hoja: _WorkSheet;

implementation

uses UGlobal;

{$R *.dfm}


{ TfrmExportarExcel }


procedure TfrmExportarExcel.ExporToExcel(mTabla: TIBQuery;
  NombreArchivo: String);
  Var fila : Integer;
  rangoExcel : OleVariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
  i : Integer;
  fIni : integer;
  fFin : Integer;
begin
  frm := TForm.Create(Nil);
  //frm.OnKeyPress := my;
  ProgressBar1:= TProgressBar.Create(Nil);
  ProgressBar2:= TProgressBar.Create(Nil);
  try
  With Frm Do
  begin
    Frm.Color := clCream;
    Frm.Position:= poOwnerFormCenter;
    Frm.BorderStyle := bsNone;
    Caption:= 'Creado en ejecución';
    Height:= 100;
    Width := 800;
    With TLabel.Create(Nil) Do
    begin
      Caption:='Generando reporte...espere.';
      Left:= 8;
      Top:= 8;
      Height:= 25;
      Width:= 200;
      Parent:= Frm;
    end;

    //With TProgressBar.Create(Nil) Do
    //begin
      ProgressBar1.Left:= 8;
      ProgressBar1.Top := 22;
      ProgressBar1.width:= 600;
      ProgressBar1.Max:= mTabla.RecordCount;
      ProgressBar1.StepBy(1);
      ProgressBar1.Position:=0;
      ProgressBar1.Parent:= Frm;

      ProgressBar2.Left:= 8;
      ProgressBar2.Top := 56;
      ProgressBar2.width:= 600;
      ProgressBar2.Max:=  mTabla.Fields.Count;
      ProgressBar2.StepBy(1);
      ProgressBar2.Parent:= Frm;
  end;

  //Abrimos excel
  Excel.Connect;

  // Creamos un nuevo libro con tres hojas (predeterminado)
  Excel.Workbooks.Add( NULL, 0 );

  //3º A la primera hoja del libro la llamamos Presupuesto:

  // Apuntamos a la primera hoja y le cambiamos el nombre
  Hoja := Excel.Worksheets.Item[1] as _WorkSheet;
  Hoja.Name := 'Sheet1';

  //4º Creamos los títulos de las columnas:
  //Encabezado
  // Títulos de los datos
  Hoja.Range['A1','A4'].ColumnWidth := 64;
  Hoja.Range['A1','A1'].Value2 := 'CONDOMINIO RESIDENCIAL ' ;//+ GlbJunta;
  Hoja.Range['A2','A2'].Value2 := 'ESTADO DE RESULTADO Y FLUJO DE EFECTIVO';

  Hoja.Range['A3','A3'].Value2 :=  rangoFecha;
  Hoja.Range['A4','A4'].Value2 := 'Valores en RD$';

  Hoja.Range['A7','A7'].Value2 := 'INGRESOS';
  Hoja.Range['B7','B7'].Value2 := 'MONTO';
  Hoja.Range['A1','B7'].Font.Bold := True;

  SetMergeCells(Hoja.Name,'A1','B4',True);
  //5º Introducimos los datos dentro de las columnas:
  fila := 8;
  mTabla.first;
  fIni:=fila;
  //'INGRESOS'
  While Not mTabla.Eof do
  begin
    if uppercase(TRIM(mTabla.FieldByName('TRANS').AsString)) = 'GASTOS' then
    begin
      mTabla.Next;
      Continue;
    end;
    rangoExcel := Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];

    ProgressBar2.Position:=0;
    for i := 0 to mTabla.Fields.Count - 1 do
    begin
      IF (uPPERCASE(mTabla.Fields[i].FieldName) = 'TRANS') then
      continue;
      rangoExcel.Value := mTabla.Fields[i].AsString;
      rangoExcel := rangoExcel.Next;
      ProgressBar2.StepIt;
    end;
    ProgressBar1.StepIt;
    mTabla.Next;
    Inc(fila);
    Application.ProcessMessages;
  end;
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;
  rangoExcel.Value := '';
  rangoExcel := rangoExcel.Next;
  //Hoja.Range['B2','B2'].Formula := '=A2*C2';
  fFin:=Fila;
  Hoja.Range['A' + IntToStr(fila+1), 'A' + IntToStr(fila+1)].Value2 := 'Total Ingresos';
  Hoja.Range['B' + '8', 'B' + InttoStr(fila+1)].NumberFormat := '0,00';
  Hoja.Range['B' + IntToStr(fila+1), 'B' + IntToStr(fila+1)].Formula := '=sum(B'+inttostr(fini)+':B'+inttostr(ffin)+')';
  Hoja.Range['A' + IntToStr(fila+1), 'B' + IntToStr(fila+1)].Font.Bold := True;

  Inc(fila,4);

  Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)].Value2 := 'EGRESOS';
  Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)].Font.Bold := True;
  inc(fila,1);
  //rangoExcel.Value := mTabla.Fields[0].AsString;
  //rangoExcel := rangoExcel.Next;
  mTabla.First;
  fIni:=fila;
  While Not mTabla.Eof do
  begin
    if uppercase(TRIM(mTabla.FieldByName('TRANS').AsString)) = 'INGRESOS' then
    begin
      mTabla.Next;
      Continue;
    end;
    rangoExcel := Hoja.Range['A' + IntToStr(fila), 'A' + IntToStr(fila)];

    ProgressBar2.Position:=0;
    for i := 0 to mTabla.Fields.Count - 1 do
    begin
      If (UPPERCASE(mTabla.Fields[i].FieldName) = 'TRANS') then
      continue;
      rangoExcel.Value := mTabla.Fields[i].AsString;
      rangoExcel := rangoExcel.Next;
      ProgressBar2.StepIt;
    end;
    ProgressBar1.StepIt;
    mTabla.Next;
    Inc(fila);
    Application.ProcessMessages;
  end;

  //7º Damos formato decimal a las columnas del precio y los totales y para ésta última columna le cambiamos los colores:

  // Formato decimal
  fFin := fila;
  Hoja.Range['A' + IntToStr(fila+1), 'A' + IntToStr(fila+1)].Value2 := 'Total Egresos';
  Hoja.Range['B' + '8', 'B' +InttoStr(fila+1)].NumberFormat := '0,00';
  Hoja.Range['B' + IntToStr(fila+1), 'B' + IntToStr(fila+1)].Formula := '=sum(B'+inttostr(fini)+':B'+inttostr(ffin)+')';
  Hoja.Range['A' + IntToStr(fila+1), 'B' + IntToStr(fila+1)].Font.Bold := True;
  
  //8º Por último guardamos la hoja de cálculo y desconectamos de Excel:

  // Lo primero que hacemos es guardarlo
  Excel.ActiveWorkbook.SaveAs(NombreArchivo,
  EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, xlNoChange,
  EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, 0);

  Excel.Quit;
  Excel.Disconnect;
  finally
  frm.Hide;
  FreeAndNil(frm);
  end;
  ShellExecute(Handle, 'open', PChar(NombreArchivo) ,nil ,nil, SW_SHOW);
end;

procedure TfrmExportarExcel.ExporToExcel(NombreArchivo: String);
Var fila : Integer;
  rangoExcel : OleVariant;
  frm: TForm;
  ProgressBar1: TProgressBar;
  ProgressBar2: TProgressBar;
  targetFile : string;
  i,idx : Integer;
  fIni : integer;
  fFin : Integer;
begin
  
end;

Function TfrmExportarExcel.SetMergeCells(sheet:variant;cel1:variant;cel2:variant;
MergeCells:boolean):boolean;
begin
  SetMergeCells:=true;
  try
    Hoja.Range[cel1, cel2].Merge(MergeCells);
    Hoja.Range[cel1, cel2].HorizontalAlignment := xlCenter;
  except
  SetMergeCells:=False;
  end;
End;

end.
