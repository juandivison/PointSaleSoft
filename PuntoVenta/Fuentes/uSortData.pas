unit uSortData;

interface
uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
Dialogs, Menus, Grids, DBTables, IBQuery, DB, ExtCtrls, DBCtrls,
StdCtrls, DBGrids, RXDBCtrl, RXSwitch, IBSQL;

Type
TGridSort = Class(TObject)
Private
{Private Declarations}
Public
{Public Declarations}
procedure GridSort(Sender : TColumn; Direction : String);
end;

implementation

procedure TGridSort.GridSort(Sender: TColumn; Direction : String);
var
GridPos : integer;
sList : TStringList;
sSql : String; 
sStr : String; 
strIndex, 
strCount : integer; 
sSort : String; 
sDataSet : TIBQuery;
OriginalSQL : String; 
position : integer; 
intLength : Integer; 
begin 
  GridPos := TColumn(Sender).Index; // Get the active column for this grid
  if ((TColumn(Sender).Field.dataType <> ftMemo) and
  (TColumn(Sender).Field.dataType <> ftBlob) and
  (TColumn(Sender).Field.dataType <> ftgraphic)) then
  Begin
    OriginalSQL := TIBQuery(TColumn(sender).Grid.Datasource.Dataset).SQL.Text;
    {Pos(Substr: string; S: string): Integer;}
    Position := pos('order',OriginalSQL);
    intLength := Length(OriginalSQL);
    {Delete(var S: string; Index, Count:Integer);}
    delete(OriginalSQL,Position,(intLength-Position)-1);

    if UpperCase(Direction) = 'ASCENDING' then
    sSort := 'order by %s asc'
    Else
    if UpperCase(Direction) = 'DESCENDING' then
       sSort := 'order by %s desc';

    slist := Tstringlist.create;
    sDataSet := TIBQuery(TColumn(sender).Grid.Datasource.Dataset);
    sDataSet.Getfieldnames(sList);
    sStr := sList.strings[GridPos];
    sSql := sDataSet.sql.text;
    strIndex := pos(sStr, sSql);
    if strIndex <> 0 then
    begin // needed for select * type sql statements
      StrCount := strIndex;
      repeat dec(strIndex) until sSQL[strIndex] = ' ';
      strCount := (strCount + length(sStr)) - StrIndex;
      with sDataSet do
      begin
        close;
        sql.text := originalSQL + format(sSort,[copy
        (sSQL,strIndex,StrCount)]);
        open;
      end; // with sDataSet
    end // if..else statement
    else begin
    with sDataSet do
    begin
      close;
      sql.text := originalSQL + format(sSort,[sStr]);
      open;
    end;
  end;
  sList.free;
End
Else
MessageDlg('Cannot sort on this field', mtinformation, [mbOK], 0);
end; 
end.
