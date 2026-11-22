unit UEcfGastoPresentacion;

interface

uses Windows, Dialogs;

type
  TDialogoGasto = function(AOwner: HWND; const ATexto, ATitulo: string;
    AFlags: UINT): Integer;

function MostrarAvisoGasto(AOwner: HWND; const ATexto: string;
  ATipo: TMsgDlgType; ADialogo: TDialogoGasto = nil): Integer;
function FormatearMensajeDgiiGasto(const AEstado, ATrackId, AEncf,
  AMensajeOriginal: string): string;
function SqlConsultaGastosEcf: string;

implementation

uses SysUtils, Classes;

function MostrarAvisoGasto(AOwner: HWND; const ATexto: string;
  ATipo: TMsgDlgType; ADialogo: TDialogoGasto): Integer;
var Flags: UINT;
begin
  Flags := MB_OK or MB_SETFOREGROUND or MB_TASKMODAL;
  case ATipo of
    mtError: Flags := Flags or MB_ICONERROR;
    mtWarning: Flags := Flags or MB_ICONWARNING;
  else Flags := Flags or MB_ICONINFORMATION;
  end;
  if Assigned(ADialogo) then
    Result := ADialogo(AOwner, ATexto, 'Estado del e-CF', Flags)
  else
  begin
    if IsWindow(AOwner) then
    begin
      if IsIconic(AOwner) then ShowWindow(AOwner, SW_RESTORE);
      BringWindowToTop(AOwner);
      SetForegroundWindow(AOwner);
    end;
    Result := Windows.MessageBox(AOwner, PChar(ATexto), 'Estado del e-CF', Flags);
  end;
end;

function CadenaJson(const S: string; var I: Integer): string;
var C: Char; Code: Integer;
begin
  Result := '';
  if (I > Length(S)) or (S[I] <> '"') then Exit;
  Inc(I);
  while I <= Length(S) do
  begin
    C := S[I]; Inc(I);
    if C = '"' then Exit;
    if C = '\' then
    begin
      if I > Length(S) then Exit;
      C := S[I]; Inc(I);
      case C of
        'n': Result := Result + #13#10;
        'r': ;
        't': Result := Result + ' ';
        'u': begin
          Code := StrToIntDef('$' + Copy(S,I,4), -1);
          if Code >= 0 then Result := Result + string(WideString(WideChar(Code)));
          Inc(I,4);
        end;
      else Result := Result + C;
      end;
    end
    else Result := Result + C;
  end;
end;

function ValorJson(const S, Key: string): string;
var P,I,J,Depth: Integer; Quoted,Escaped: Boolean; Needle: string;
begin
  Result := ''; Needle := '"'+Key+'"'; P := Pos(Needle,S);
  if P = 0 then Exit;
  I := P + Length(Needle);
  while (I<=Length(S)) and (S[I] in [#9,#10,#13,' ']) do Inc(I);
  if (I>Length(S)) or (S[I]<>':') then Exit;
  Inc(I);while (I<=Length(S)) and (S[I] in [#9,#10,#13,' ']) do Inc(I);
  if I>Length(S) then Exit;
  if S[I]='"' then begin Result:=CadenaJson(S,I);Exit;end;
  if S[I]='[' then
  begin
    Inc(I);Depth:=1;
    while (I<=Length(S)) and (Depth>0) do
    begin
      if S[I]='"' then
      begin
        if Result<>'' then Result:=Result+#13#10;
        Result:=Result+CadenaJson(S,I);
      end
      else begin if S[I]=']'then Dec(Depth) else if S[I]='['then Inc(Depth);Inc(I);end;
    end;
    Exit;
  end;
  J:=I;Depth:=0;Quoted:=False;Escaped:=False;
  while I<=Length(S) do
  begin
    if not Quoted and (Depth=0) and (S[I] in [',','}',#13,#10])then Break;
    if Quoted then begin if Escaped then Escaped:=False else if S[I]='\'then Escaped:=True else if S[I]='"'then Quoted:=False;end
    else if S[I]='"'then Quoted:=True else if S[I] in ['{','[']then Inc(Depth) else if S[I] in ['}',']']then Dec(Depth);
    Inc(I);
  end;
  Result:=Trim(Copy(S,J,I-J));if SameText(Result,'null')then Result:='';
end;

function FormatearMensajeDgiiGasto(const AEstado, ATrackId, AEncf,
  AMensajeOriginal: string): string;
var L,Parts:TStringList;Body,Code,Status,Msg,Errors:string;I:Integer;
begin
  L:=TStringList.Create;Parts:=TStringList.Create;
  try
    L.Add('Estado actual: '+Trim(AEstado));
    if Trim(AEncf)<>''then L.Add('e-NCF: '+Trim(AEncf));
    if Trim(ATrackId)<>''then L.Add('TrackId: '+Trim(ATrackId));
    Body:=Trim(AMensajeOriginal);
    if Pos('D7G|',Body)=1 then
    begin
      Parts.Text:=StringReplace(Body,'|',#13#10,[rfReplaceAll]);
      if Parts.Count>=3 then Body:=Parts[2];
    end;
    Body:=StringReplace(Body,'%7C','|',[rfReplaceAll,rfIgnoreCase]);
    if Pos('{',Body)>0 then
    begin
      Body:=Copy(Body,Pos('{',Body),MaxInt);
      Code:=ValorJson(Body,'codigo');if Code=''then Code:=ValorJson(Body,'code');
      Status:=ValorJson(Body,'estado');if Status=''then Status:=ValorJson(Body,'status');
      Msg:=ValorJson(Body,'mensaje');if Msg=''then Msg:=ValorJson(Body,'message');
      Errors:=ValorJson(Body,'mensajes');if Errors=''then Errors:=ValorJson(Body,'errors');
      if(Code<>'')or(Status<>'')or(Msg<>'')or(Errors<>'')then
      begin
        L.Add('');L.Add('Detalle de la respuesta recibida:');
        if Code<>''then L.Add('Codigo de respuesta: '+Code);
        if Status<>''then L.Add('Estado reportado: '+Status);
        if Msg<>''then L.Add(Msg);
        if(Errors<>'')and(Errors<>Msg)then L.Add(Errors);
        if(Pos('ACEPTADO',UpperCase(AEstado))>0)and(Status<>'')and(Pos('ACEPT',UpperCase(Status))=0)then
        begin L.Add('');L.Add('El estado actual es ACEPTADO. El detalle puede corresponder a una respuesta anterior del proceso.');end;
      end
      else begin L.Add('');L.Add('El detalle tecnico esta disponible en el historial del documento.');end;
    end
    else if Body<>''then begin L.Add('');L.Add(Body);end;
    Result:=TrimRight(L.Text);
    // La presentacion no cambia estados, mensajes originales ni persistencia.
    for I:=0 to Parts.Count-1 do Parts[I]:='';
  finally Parts.Free;L.Free;end;
end;

function SqlConsultaGastosEcf: string;
begin
  Result:=
    'select m.NUMERO, m.FECHA, m.TIPO_CF, m.ECF, m.COD_PROVEEDOR,'+#13#10+
    ' p.DESCRIPCION as PROVEEDOR, m.MONTO, m.STATUS,'+#13#10+
    ' coalesce('+#13#10+
    '  (select first 1 nullif(trim(g.ESTADO), '''') from ECF_GASTO_ENVIO g'+#13#10+
    '   where g.CIA_KEY=m.CIA_KEY and g.TRN=m.NUMERO and g.ENCF=m.ECF'+#13#10+
    '   order by coalesce(g.FECHA_UPDATE,g.FECHA_CREACION) desc, g.ID desc),'+#13#10+
    '  (select first 1 nullif(trim(r.ESTADO), '''') from ECF_RESERVA r'+#13#10+
    '   where r.NCF=m.ECF and r.HASH_DOC='+#13#10+
    '    ''GASTO|CIA=''||trim(cast(m.CIA_KEY as varchar(11)))||'+#13#10+
    '    ''|TRN=''||trim(cast(m.NUMERO as varchar(11)))||'+#13#10+
    '    ''|TIPO=''||trim(cast(m.TIPO_CF as varchar(2)))'+#13#10+
    '   order by r.ID desc)) as ESTADO_ECF'+#13#10+
    'from TRANS_OPERACION_MASTER m'+#13#10+
    'left join PROVEEDORES p on p.CODIGO_CTE=m.COD_PROVEEDOR'+#13#10+
    'where m.CIA_KEY=:CIA_KEY'+#13#10+
    ' and m.FECHA>=:FECHA_DESDE and m.FECHA<:FECHA_HASTA'+#13#10+
    ' and m.TIPO_CF in (''41'',''43'')'+#13#10+
    'order by m.FECHA desc,m.NUMERO desc';
end;

end.
