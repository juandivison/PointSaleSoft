unit UConvertirDBGridToHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellApi,Dialogs, StdCtrls, Grids, DBGrids, RxDBCtrl, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmConvertirDbGridToHTML = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    RxDBGrid1: TRxDBGrid;
    procedure Button1Click(Sender: TObject);
  private
    function ColorToHtml(mColor: TColor): string;
    function DBGridToHtmlTable(mDBGrid: TDBGrid; mStrings: TStrings;
      mCaption: TCaption): Boolean;
    function StrToHtml(mStr: string; mFont: TFont): string;
        Procedure EnviaEmail(_archivoZip :string);

    { Private declarations }
  public
    procedure exportarGridExcel(_headerData:string; mtabla:TIBQuery; var NombreArchivo:String);
  end;

var
  frmConvertirDbGridToHTML: TfrmConvertirDbGridToHTML;

implementation
       uses uglobal, UDatmodDatosGenerales, UDatModCompania;
{$R *.dfm}

function TfrmConvertirDbGridToHTML.ColorToHtml(mColor: TColor): string;

begin

  mColor := ColorToRGB(mColor);

  Result := Format('#%.2x%.2x%.2x', [GetRValue(mColor), GetGValue(mColor), GetBValue(mColor)]);

end;



function TfrmConvertirDbGridToHTML.DBGridToHtmlTable(mDBGrid: TDBGrid; mStrings: TStrings;

  mCaption: TCaption): Boolean;

const

  cAlignText: array[TAlignment] of string = ('LEFT', 'RIGHT', 'CENTER');

var

  vColFormat: string;

  vColText: string;

  vAllWidth: Integer;

  vWidths: array of Integer;

  vBookmark: string;

  I, J: Integer;

begin

  Result := False;

  if not Assigned(mStrings) then Exit;

  if not Assigned(mDBGrid) then Exit;

  if not Assigned(mDBGrid.DataSource) then Exit;

  if not Assigned(mDBGrid.DataSource.DataSet) then Exit;

  if not mDBGrid.DataSource.DataSet.Active then Exit;

  vBookmark := mDBGrid.DataSource.DataSet.Bookmark;

  mDBGrid.DataSource.DataSet.DisableControls;

  try

    J := 0;

    vAllWidth := 0;

    for I := 0 to mDBGrid.Columns.Count - 1 do

      if mDBGrid.Columns[I].Visible then

      begin

        Inc(J);

        SetLength(vWidths, J);

        vWidths[J - 1] := mDBGrid.Columns[I].Width;

        Inc(vAllWidth, mDBGrid.Columns[I].Width);

      end;

    if J <= 0 then Exit;

    mStrings.Clear;

     //t mStrings.Add(Format('');

  finally

    mDBGrid.DataSource.DataSet.Bookmark := vBookmark;

    mDBGrid.DataSource.DataSet.EnableControls;

    vWidths := nil;

  end;

  Result := True;

end;

 

function TfrmConvertirDbGridToHTML.StrToHtml(mStr: string; mFont: TFont): string;

var

  vLeft, vRight: string;

begin

  Result := mStr;

  Result := StringReplace(Result, '&', '&', [rfReplaceAll]);

  Result := StringReplace(Result, '<', '<', [rfReplaceAll]);

  Result := StringReplace(Result, '>', '>', [rfReplaceAll]);

  if not Assigned(mFont) then Exit;

  vLeft := Format('',

    [mFont.Name, ColorToHtml(mFont.Color)]);

  vRight := '';

  if fsBold in mFont.Style then

  begin

    vLeft := vLeft + '';

    vRight := '' + vRight;

  end;

  if fsItalic in mFont.Style then

  begin

    vLeft := vLeft + '';

    vRight := '' + vRight;

  end;

  if fsUnderline in mFont.Style then

  begin

    vLeft := vLeft + '';

    vRight := '' + vRight;

  end;

  if fsStrikeOut in mFont.Style then

  begin

    vLeft := vLeft + '';

    vRight := '' + vRight;

  end;

  Result := vLeft + Result + vRight;

end;

///////Begin Demo
procedure TfrmConvertirDbGridToHTML.Button1Click(Sender: TObject);
begin
  //DBGridToHtmlTable(RxDBGrid1, Memo1.Lines, Caption);
  //Memo1.Lines.SaveToFile('c:\tempf.htm');
  ShellExecute(Handle, nil, 'c:\tempf.htm', nil, nil, SW_SHOW);
end;
///////End Demo


procedure TfrmConvertirDbGridToHTML.exportarGridExcel(_headerData:string;
  mtabla: TIBQuery; var NombreArchivo: String);
//const
//  xlWBATWorksheet = -4167;

var
  //rangoExcel : Variant;
  i : integer;
  mMarcador : Tbookmarkstr;
  linea: string;
  tmp : string;
  //aplicacionExcel : Olevariant;

begin
  //rangoExcel:= ExcelXp.xlRange;
  //aplicacionExcel := CreateOleObject('Excel.Application');
  //aplicacionExcel.Visible:= true;
  //aplicacionExcel.workbooks.add(xlWBATWorksheet);
  //rangoExcel := aplicacionExcel.ActiveCell;
  memo1.Clear;
  memo1.Lines.add('<!DOCTYPE html>');
  memo1.Lines.add('<html>');
  memo1.Lines.add('<head>');
 
  //memo1.Lines.add('<style>');
  //memo1.Lines.add('table, th, td { border: 1px solid red;}');
  //memo1.Lines.add('</style>');
    memo1.Lines.Add('<style>');
    memo1.Lines.Add('table {');
    memo1.Lines.Add('  font-family: arial, sans-serif;');
    memo1.Lines.Add('  border-collapse: collapse;');
    memo1.Lines.Add('  width: 50%;');
    memo1.Lines.Add('}');
    memo1.Lines.Add('');
    memo1.Lines.Add('td, th {');
    memo1.Lines.Add('  border: 1px solid #dddddd;');
    memo1.Lines.Add('  text-align: left;');
    memo1.Lines.Add('  padding: 8px;');
    memo1.Lines.Add('}');
    memo1.Lines.Add('');
    memo1.Lines.Add('tr:nth-child(even) {');
    memo1.Lines.Add('  background-color: #dddddd;');
    memo1.Lines.Add('}');
    memo1.Lines.Add('</style>');
  memo1.Lines.add('</head>');
  memo1.Lines.add('<body>');

  if (_headerData <> '') then
  begin
    memo1.Lines.Add('<div>');
    memo1.Lines.Add('<h3>');
    memo1.Lines.Add('<table style="width:50%">');
    memo1.Lines.Add('<th>');
    memo1.Lines.Add('Datos Factura Cancelada');    
    memo1.Lines.Add('</th>');
    memo1.Lines.Add('<td>');
    memo1.Lines.Add('<p style="background-color:silver;">');
    memo1.Lines.Add(_headerData);
    memo1.Lines.Add('</p>');
    memo1.Lines.Add('</td>');
    memo1.Lines.Add('</tr>');
    memo1.Lines.Add('</table>');
    memo1.Lines.Add('</h3>');
    memo1.Lines.Add('</div>');
    memo1.Lines.Add('<hr>');

  end;

  memo1.Lines.Add('<table style="width:50%">');

  {memo1.Lines.Add('<tr>');
  for i:= 0 to mTabla.Fields.Count - 1 do
  begin
    memo1.Lines.Add('<th>'+mTabla.Fields[i].FieldName+'</th>');
  end;
  memo1.Lines.Add('</tr>');
  }

  memo1.Lines.Add('<tr>');
  memo1.Lines.Add('<th>'+'Columna'+'</th>');
  memo1.Lines.Add('<th>'+'Valor'+'</th>');
  memo1.Lines.Add('</tr>');

  linea:='';
  mTabla.DisableControls;
  try
    mMarcador := mTabla.Bookmark;
    try
      mTabla.First;

      while not mTabla.Eof do
      begin
        //rangoExcel := aplicacionExcel.Range['A' + inttostr(fila), 'A' + inttostr(fila)];

        for i := 0 to mTabla.Fields.Count - 1 do
        begin
          memo1.Lines.Add('<tr>');
          memo1.Lines.Add('<td>'+mTabla.Fields[i].FieldName+'</td>');
          memo1.Lines.Add('<td>'+mTabla.Fields[i].AsString+'</td>');
          memo1.Lines.Add(linea+'</tr>');          
        end;

        mTabla.Next;
      end;

      finally
        mTabla.Bookmark := mMarcador;
      end;
    finally
      mTabla.EnableControls;
    end;
    memo1.Lines.Add('</table>');
    memo1.Lines.Add('</body>');
    memo1.Lines.Add('</html>');
    //NombreArchivo:=NombreArchivo +FormatDateTime('ddmmyy_hhmm',Now)+'.xls';
    Memo1.Lines.SaveToFile(NombreArchivo);
    ShellExecute(Handle, nil, Pchar(NombreArchivo), nil, nil, SW_SHOW);
    //Temporal
    //Exit;
    GlbEnviaEmail:=True;

    EnviaEmail(NombreArchivo)

    //aplicacionExcel.Workbooks[1].SaveAs(NombreArchivo);
    //aplicacionExcel.Quit;

end;

procedure TfrmConvertirDbGridToHTML.EnviaEmail(_archivoZip: string);
begin
  GlbIDTipoEmail := 100; //Estandar
  Application.ProcessMessages;
  dmdatos.qryEmailProceso.Close;
  dmdatos.qryEmailProceso.Params[0].Value := GlbIDTipoEmail;
  dmdatos.qryEmailProceso.Open;
  dmdatos.qryEmailProceso.First;
  if dmdatos.qryEmailProceso.RecordCount = 1 then
  begin
    if (dmdatos.qryEmailProcesoSTATUS.Value = 'A') then
    begin
      if (GlbEnviaEmail) then
      begin
        //if ProcZipFile(aFileName, targetFile) then
        if FileExists(_archivoZip) then
        begin
          if dmCompania.tblCompania.State = dsInactive then
          dmCompania.tblCompania.open;
          dmCompania.tblCompania.Locate('codigo', glbCia_Key,[]);

          ProcLogTrackingEmail(GlbIDTipoEmail,dmdatos.qryEmailProcesoEMAIL_SERVER.Value,
          dmdatos.qryEmailProcesoPORT.AsString,dmdatos.qryEmailProcesoUSER_EMAIL.Value,
          Desencriptar(dmdatos.qryEmailProcesoUSER_PASSWORD.Value,2005),
          now,dmdatos.qryEmailProcesoTOEMAIL.Value,dmdatos.qryEmailProcesoFROMEMAIL.Value,
          'Factura Cancelada -CIA:'+
          dmCompania.tblCompaniaNOMBRE.Value+
          ' Sucursal:'+dmCompania.tblCompaniaNUM_SUCURSAL.AsString +' '+FormatDateTime('dd/mm/yy HH:MM',now),
          'Factura Cancelada. '#13''+memo1.Text+'.',
          VarUsuarioGlb,'A','',now,strusername,FormatDateTime('dd/mm/yyyy hh:mm a/p', Now), strusername,_archivoZip,dmCompania.tblCompaniaEMAIL.Value,dmCompania.tblCompaniaNOMBRE.Value);
        end;
        GlbEnviaEmail:=False;
      end;
    end;
  end;
end;

end.
