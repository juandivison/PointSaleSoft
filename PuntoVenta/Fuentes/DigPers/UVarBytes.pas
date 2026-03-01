unit UVarBytes;

interface

uses
  SysUtils, Variants, Classes, DB;

function BlobFieldToVarBytes(B: TBlobField): OleVariant;
procedure VarBytesToStream(const V: OleVariant; MS: TMemoryStream);

implementation

function BlobFieldToVarBytes(B: TBlobField): OleVariant;
var
  MS: TMemoryStream;
  P: Pointer;
begin
  Result := VarArrayCreate([0, -1], varByte);
  if (B = nil) or B.IsNull then Exit;

  MS := TMemoryStream.Create;
  try
    B.SaveToStream(MS);
    if MS.Size <= 0 then Exit;

    Result := VarArrayCreate([0, MS.Size - 1], varByte);
    P := VarArrayLock(Result);
    try
      Move(MS.Memory^, P^, MS.Size);
    finally
      VarArrayUnlock(Result);
    end;
  finally
    MS.Free;
  end;
end;

procedure VarBytesToStream(const V: OleVariant; MS: TMemoryStream);
var
  P: Pointer;
  L, H, N: Integer;
begin
  MS.Size := 0;
  if VarIsEmpty(V) or VarIsNull(V) then Exit;
  if not VarIsArray(V) then Exit;

  L := VarArrayLowBound(V, 1);
  H := VarArrayHighBound(V, 1);
  N := (H - L) + 1;
  if N <= 0 then Exit;

  MS.Size := N;
  P := VarArrayLock(V);
  try
    Move(P^, MS.Memory^, N);
  finally
    VarArrayUnlock(V);
  end;

  MS.Position := 0;
end;

end.
