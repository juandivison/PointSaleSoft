unit UFingerprintIBX;

interface

uses
  SysUtils, Variants, Classes, DB, Forms,
  IBDatabase, IBQuery,
  UFingerprintTypes;

function EnrolarHuellaUsuarioIBX(CodUsuario: Integer; DB: TIBDatabase): Boolean;

function AutorizarTareaPorHuellaIBX(
  const TaskCode: string;
  DB: TIBDatabase;
  out CodUsuario: Integer;
  out FAR: Integer
): Boolean;

function HuellaEnroladaIBX(
  DB: TIBDatabase;
  out CodUsuario: Integer;
  out FAR: Integer
): Boolean;

function HuellaEnroladaBoolIBX(DB: TIBDatabase): Boolean;

implementation

uses
  UFrmFpEnroll, UFrmFpVerify, UVarBytes;

function FetchCandidatesForTaskIBX(const TaskCode: string; DB: TIBDatabase): TFpCandidateArray;
var
  TR: TIBTransaction;
  Q: TIBQuery;
  idx: Integer;
  BF: TBlobField;
begin
  SetLength(Result, 0);
  if DB = nil then Exit;

  TR := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    TR.DefaultDatabase := DB;
    TR.StartTransaction;

    Q.Database := DB;
    Q.Transaction := TR;
    Q.SQL.Text :=
      'select a.cod_usuario, h.template '+
      'from sec_tarea t '+
      'join sec_tarea_autoriza a on a.tarea_id = t.id '+
      'join sec_usuario_huella h on h.cod_usuario = a.cod_usuario and h.activa = 1 '+
      'where t.codigo = :taskcode and t.activa = 1';
    Q.ParamByName('taskcode').AsString := TaskCode;
    Q.Open;

    while not Q.Eof do
    begin
      idx := Length(Result);
      SetLength(Result, idx + 1);
      Result[idx].CodUsuario := Q.FieldByName('COD_USUARIO').AsInteger;
      BF := Q.FieldByName('TEMPLATE') as TBlobField;
      Result[idx].TemplateBytes := BlobFieldToVarBytes(BF);
      Q.Next;
    end;

    TR.Commit;
  except
    if TR.InTransaction then TR.Rollback;
    raise;
  end;
  Q.Free;
  TR.Free;
end;


function FetchCandidatesAnyIBX(DB: TIBDatabase): TFpCandidateArray;
var
  TR: TIBTransaction;
  Q: TIBQuery;
  idx: Integer;
  BF: TBlobField;
begin
  SetLength(Result, 0);
  if DB = nil then Exit;

  TR := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  try
    TR.DefaultDatabase := DB;
    TR.StartTransaction;

    Q.Database := DB;
    Q.Transaction := TR;
    Q.SQL.Text :=
      'select h.cod_usuario, h.template ' +
      'from sec_usuario_huella h ' +
      'where h.activa = 1';
    Q.Open;

    while not Q.Eof do
    begin
      idx := Length(Result);
      SetLength(Result, idx + 1);
      Result[idx].CodUsuario := Q.FieldByName('COD_USUARIO').AsInteger;
      BF := Q.FieldByName('TEMPLATE') as TBlobField;
      Result[idx].TemplateBytes := BlobFieldToVarBytes(BF);
      Q.Next;
    end;

    TR.Commit;
  except
    if TR.InTransaction then TR.Rollback;
    raise;
  end;
  Q.Free;
  TR.Free;
end;

function HuellaEnroladaIBX(
  DB: TIBDatabase;
  out CodUsuario: Integer;
  out FAR: Integer
): Boolean;
var
  Candidates: TFpCandidateArray;
  Frm: TFrmFpVerify;
begin
  Result := False;
  CodUsuario := 0;
  FAR := 0;

  if DB = nil then Exit;

  Candidates := FetchCandidatesAnyIBX(DB);
  if Length(Candidates) = 0 then Exit;

  Frm := TFrmFpVerify.Create(Application);
  try
    Frm.Caption := 'Validar huella enrolada';
    Frm.lblInfo.Caption := 'Coloque el dedo en el lector para validar la huella registrada...';
    Frm.SetCandidates(Candidates);
    Result := Frm.Execute(CodUsuario, FAR);
  finally
    Frm.Free;
  end;
end;

function HuellaEnroladaBoolIBX(DB: TIBDatabase): Boolean;
var
  u, far: Integer;
begin
  Result := HuellaEnroladaIBX(DB, u, far);
end;


function EnrolarHuellaUsuarioIBX(CodUsuario: Integer; DB: TIBDatabase): Boolean;
var
  Frm: TFrmFpEnroll;
begin
  Result := False;
  if DB = nil then Exit;

  Frm := TFrmFpEnroll.Create(Application);
  try
    Frm.Init(DB, CodUsuario);
    Frm.ShowModal;
    Result := True;
  finally
    Frm.Free;
  end;
end;

function AutorizarTareaPorHuellaIBX(
  const TaskCode: string;
  DB: TIBDatabase;
  out CodUsuario: Integer;
  out FAR: Integer
): Boolean;
var
  Candidates: TFpCandidateArray;
  Frm: TFrmFpVerify;
begin
  Result := False;
  CodUsuario := 0;
  FAR := 0;

  if DB = nil then Exit;

  Candidates := FetchCandidatesForTaskIBX(TaskCode, DB);
  if Length(Candidates) = 0 then Exit;

  Frm := TFrmFpVerify.Create(Application);
  try
    Frm.SetCandidates(Candidates);
    Result := Frm.Execute(CodUsuario, FAR);
  finally
    Frm.Free;
  end;
end;

end.
