unit UNcrCliPayload;

interface

uses
  SysUtils, Classes;

type
  TNcrCliPayload = class
  public
    class function JsonEscape(const S: string): string;
    class function BoolToJson(const B: Boolean): string;
    class function FloatToJson(const V: Double): string;
    class function CurrencyToJson(const V: Currency): string;
    class function SaveJsonToTempFile(const APrefix, AJson: string): string;
  end;

implementation

class function TNcrCliPayload.JsonEscape(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  begin
    case S[I] of
      '"': Result := Result + '\"';
      '\': Result := Result + '\\';
      '/': Result := Result + '\/';
      #8: Result := Result + '\b';
      #9: Result := Result + '\t';
      #10: Result := Result + '\n';
      #12: Result := Result + '\f';
      #13: Result := Result + '\r';
    else
      if Ord(S[I]) < 32 then
        Result := Result + Format('\u%.4x', [Ord(S[I])])
      else
        Result := Result + S[I];
    end;
  end;
end;

class function TNcrCliPayload.BoolToJson(const B: Boolean): string;
begin
  if B then
    Result := 'true'
  else
    Result := 'false';
end;

class function TNcrCliPayload.FloatToJson(const V: Double): string;
begin
  Result := StringReplace(FormatFloat('0.####', V), ',', '.', [rfReplaceAll]);
end;

class function TNcrCliPayload.CurrencyToJson(const V: Currency): string;
begin
  Result := StringReplace(FormatFloat('0.00####', V), ',', '.', [rfReplaceAll]);
end;

class function TNcrCliPayload.SaveJsonToTempFile(const APrefix,
  AJson: string): string;
var
  SL: TStringList;
  BaseName: string;
begin
  BaseName := IncludeTrailingPathDelimiter(GetEnvironmentVariable('TEMP')) +
    APrefix + '_' + FormatDateTime('yyyymmdd_hhnnss_zzz', Now) + '.json';

  SL := TStringList.Create;
  try
    SL.Text := AJson;
    SL.SaveToFile(BaseName);
  finally
    SL.Free;
  end;

  Result := BaseName;
end;

end.
