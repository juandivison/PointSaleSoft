unit UFormExportDBGridToHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ShellApi, RxDBCtrl,Dialogs, StdCtrls, Grids, DBGrids;

type
  TfrmExpToHTML = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    RxDBGrid1: TRxDBGrid;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    numFactDoc : string;
    function ColorToHtml(mColor: TColor): string;
    function StrToHtml(mStr: string; mFont: TFont = nil): string;
    function DBGridToHtmlTable(mDBGrid: TRxDBGrid; mStrings: TStrings; mCaption: TCaption = ''): Boolean;

  end;

var
  frmExpToHTML: TfrmExpToHTML;

implementation
  uses UGlobal;

//frmExpToHTML
{$R *.dfm}

{ TfrmExpToHTML }

function TfrmExpToHTML.ColorToHtml(mColor: TColor): string;
begin
  mColor := ColorToRGB(mColor);
  Result := Format('#%.2x%.2x%.2x', [GetRValue(mColor), GetGValue(mColor), GetBValue(mColor)]);
end;

function TfrmExpToHTML.DBGridToHtmlTable(mDBGrid: TRxDBGrid;
  mStrings: TStrings; mCaption: TCaption): Boolean;

const
  cAlignText: array[TAlignment] of string = ('LEFT', 'RIGHT', 'CENTER');
var
  vColFormat: string;
  vColText: string;
  vAllWidth: Integer;
  vWidths: array of Integer;
  vBookmark: string;
  I, J,z: Integer;
    var fuente:TFont;
begin
  Fuente:= TFont.Create;
  Result := False;
  if not Assigned(mStrings) then Exit;
  if not Assigned(mDBGrid) then Exit;
  if not Assigned(mDBGrid.DataSource) then Exit;
  if not Assigned(mDBGrid.DataSource.DataSet) then Exit;
  if not mDBGrid.DataSource.DataSet.Active then Exit;
  mStrings.Clear;
  vBookmark := mDBGrid.DataSource.DataSet.Bookmark;
  mDBGrid.DataSource.DataSet.DisableControls;
  Memo1.clear;
  memo1.lines.add('<html><body><center><table border=''1'' cellpadding=''0'' cellspacing=''0''>');
  memo1.lines.add('<tr>');
  Memo2.Clear;
  try
    J := 0;
    vAllWidth := 0;

    for I := 0 to mDBGrid.Columns.Count - 1 do
    begin
      Fuente.Style := [fsBold];
      Inc(J);
      SetLength(vWidths, J);
      vWidths[J - 1] := mDBGrid.Columns[I].Width;
      Inc(vAllWidth, mDBGrid.Columns[I].Width);
      Memo2.Lines.Text:= '<th>' +Memo2.Lines.Text + (StrToHtml(mDBGrid.Columns[I].DisplayName))+'</th>';
    end;

    memo1.lines.add('<tr>');
    Memo1.Lines.Add(Memo2.Text);
    memo1.lines.add('</tr>');
    Memo2.Clear;
    J := 0;
    for z:=0 to mDBGrid.Row do
    begin
      for I := 0 to mDBGrid.Columns.Count - 1 do
      begin
        if mDBGrid.Columns[I].Visible then
        begin
          Fuente.Style := [];
          try
            if not mDBGrid.Columns[I].Field.IsNull then
            Memo2.Lines.Text:=Memo2.Text + '<th>' +Memo2.Lines.Text + (StrToHtml(mDBGrid.Columns[I].Field.Value))+'</th>';
          except
          end;
        end;
      end; //for I := 0 
      memo1.lines.add('<tr>');
      Memo1.Lines.Add(Memo2.Text);
      memo1.lines.add('</tr>');
      Memo2.Clear;
    end;
  finally
  mDBGrid.DataSource.DataSet.Bookmark := vBookmark;
  mDBGrid.DataSource.DataSet.EnableControls;
  vWidths := nil;
  end;
  memo1.lines.add('</table></center></body></html>');
  Result := True;
end;

function TfrmExpToHTML.StrToHtml(mStr: string; mFont: TFont): string;
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

procedure TfrmExpToHTML.Button1Click(Sender: TObject);
begin
  DBGridToHtmlTable(RxDBGrid1, Memo1.Lines, Caption);
  Memo1.Lines.SaveToFile(GetRutaPrograma + 'FactEliminadaNum'+numFactDoc+'.html');
  ShellExecute(Handle, nil, PAnsichar(GetRutaPrograma + 'FactEliminadaNum'+numFactDoc+'.html'), nil, nil, SW_SHOW);
end;


end.
