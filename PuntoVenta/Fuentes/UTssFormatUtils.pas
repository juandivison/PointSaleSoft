unit UTssFormatUtils;

interface

uses
  SysUtils, Classes, DB;

const
  // Prototipo: TAB-delimited. Si el instructivo exige pipe, cambie a '|'.
  TSS_DEFAULT_DELIMITER = #9;

function TssOnlyDigits(const S: string): string;
function TssCleanText(const S: string): string;
function TssFieldStr(ADataSet: TDataSet; const AFieldName: string): string;
function TssFieldMoney(ADataSet: TDataSet; const AFieldName: string): string;
function TssFieldDateDDMMYYYY(ADataSet: TDataSet; const AFieldName: string): string;
function TssJoinFields(const AValues: array of string; const ADelimiter: string): string;
function TssEnsureFolder(const AFolder: string): Boolean;
function TssAddSlash(const APath: string): string;

implementation

function TssOnlyDigits(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function TssCleanText(const S: string): string;
begin
  Result := Trim(S);
  Result := StringReplace(Result, #9, ' ', [rfReplaceAll]);
  Result := StringReplace(Result, '|', ' ', [rfReplaceAll]);
  Result := StringReplace(Result, #13, ' ', [rfReplaceAll]);
  Result := StringReplace(Result, #10, ' ', [rfReplaceAll]);
end;

function TssFieldStr(ADataSet: TDataSet; const AFieldName: string): string;
begin
  Result := '';
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) then
    Result := TssCleanText(ADataSet.FieldByName(AFieldName).AsString);
end;

function TssFieldMoney(ADataSet: TDataSet; const AFieldName: string): string;
var
  V: Double;
begin
  V := 0;
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    V := ADataSet.FieldByName(AFieldName).AsFloat;

  Result := FormatFloat('0.00', V);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

function TssFieldDateDDMMYYYY(ADataSet: TDataSet; const AFieldName: string): string;
begin
  Result := '';
  if (ADataSet <> nil) and (ADataSet.FindField(AFieldName) <> nil) and
     (not ADataSet.FieldByName(AFieldName).IsNull) then
    Result := FormatDateTime('dd/mm/yyyy', ADataSet.FieldByName(AFieldName).AsDateTime);
end;

function TssJoinFields(const AValues: array of string; const ADelimiter: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := Low(AValues) to High(AValues) do
  begin
    if I > Low(AValues) then
      Result := Result + ADelimiter;
    Result := Result + AValues[I];
  end;
end;

function TssAddSlash(const APath: string): string;
begin
  Result := Trim(APath);
  if Result = '' then
    Exit;
  if Result[Length(Result)] <> '\' then
    Result := Result + '\';
end;

function TssEnsureFolder(const AFolder: string): Boolean;
begin
  Result := True;
  if Trim(AFolder) = '' then
    Exit;
  if not DirectoryExists(AFolder) then
    Result := ForceDirectories(AFolder);
end;

end.
