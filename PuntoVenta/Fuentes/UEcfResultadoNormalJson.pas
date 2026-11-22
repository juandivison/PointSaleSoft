unit UEcfResultadoNormalJson;

interface

// Contrato exacto de PrintFinal/SendInvoiceResultDto. No interpreta texto libre.
function LeerResultadoNormalJson(const Salida: string;
  out Estado, Mensaje, TrackId, Encf: string): Boolean;

implementation
uses SysUtils, Classes;

function LeerDto(const S: string; out Estado, Mensaje, TrackId, Encf: string): Boolean;
var P, I, Mask, Bit: Integer; K, V, Err, Used: string;
  procedure Espacios;
  begin
    while (P<=Length(S)) and (S[P] in [#9,#10,#13,' ']) do Inc(P);
  end;
  procedure Exigir(C: Char);
  begin
    Espacios;
    if (P>Length(S)) or (S[P]<>C) then raise Exception.Create('JSON invalido');
    Inc(P);
  end;
  function Texto: string;
  var Raw: string; W: WideString; C: Char; N, J: Integer;
  begin
    Exigir('"'); Raw:=''; W:='';
    while P<=Length(S) do begin
      C:=S[P]; Inc(P);
      if C='"' then begin W:=W+UTF8Decode(Raw); Result:=string(W); Exit; end;
      if Ord(C)<32 then raise Exception.Create('Control JSON');
      if C<>'\' then Raw:=Raw+C else begin
        W:=W+UTF8Decode(Raw); Raw:='';
        if P>Length(S) then raise Exception.Create('Escape JSON');
        C:=S[P]; Inc(P);
        case C of
          '"','\','/': W:=W+WideChar(C);
          'b': W:=W+#8;
          'f': W:=W+#12;
          'n': W:=W+#10;
          'r': W:=W+#13;
          't': W:=W+#9;
          'u': begin
            if P+3>Length(S) then raise Exception.Create('Unicode incompleto');
            for J:=P to P+3 do
              if not (S[J] in ['0'..'9','a'..'f','A'..'F']) then raise Exception.Create('Unicode invalido');
            N:=StrToInt('$'+Copy(S,P,4)); Inc(P,4); W:=W+WideChar(N);
          end;
        else raise Exception.Create('Escape desconocido'); end;
      end;
    end;
    raise Exception.Create('Texto JSON incompleto');
  end;
begin
  Result:=False; Estado:=''; Mensaje:=''; TrackId:=''; Encf:='';
  P:=1; Mask:=0; Err:=''; Used:='';
  try
    Exigir('{');
    repeat
      K:=Texto; Exigir(':'); Bit:=0;
      if K='Estado' then Bit:=1 else if K='Mensaje' then Bit:=2
      else if K='TrackId' then Bit:=4 else if K='Encf' then Bit:=8
      else if K='Error' then Bit:=16 else if K='SecuenciaUtilizada' then Bit:=32;
      if (Bit=0) or ((Mask and Bit)<>0) then Exit;
      Mask:=Mask or Bit; Espacios;
      if Bit=32 then begin
        if Copy(S,P,4)='true' then begin Used:='true'; Inc(P,4); end
        else if Copy(S,P,5)='false' then begin Used:='false'; Inc(P,5); end
        else Exit;
      end else begin
        V:=Texto;
        case Bit of
          1: Estado:=V; 2: Mensaje:=V; 4: TrackId:=V; 8: Encf:=V; 16: Err:=V;
        end;
      end;
      Espacios;
      if (P<=Length(S)) and (S[P]='}') then Break;
      Exigir(',');
    until False;
    Exigir('}'); Espacios;
    if (P<=Length(S)) or (Mask<>63) then Exit;
    if (Estado<>'ACEPTADO') and (Estado<>'RECHAZADO') and
       (Estado<>'IN_PROCESS') and (Estado<>'PENDIENTE') then Exit;
    if (Length(Encf)<>13) or (Encf[1]<>'E') then Exit;
    for I:=2 to 13 do if not (Encf[I] in ['0'..'9']) then Exit;
    if (Length(TrackId)>80) or (Length(Mensaje)>1024) then Exit;
    for I:=1 to Length(TrackId) do if Ord(TrackId[I])<32 then Exit;
    if (Estado='ACEPTADO') and (Err<>'') then Exit;
    Result:=True;
  except Result:=False; end;
end;

function LeerResultadoNormalJson(const Salida: string;
  out Estado, Mensaje, TrackId, Encf: string): Boolean;
var L: TStringList; I, Count: Integer; S, E, M, T, N: string;
begin
  Result:=False; Estado:=''; Mensaje:=''; TrackId:=''; Encf:=''; Count:=0;
  L:=TStringList.Create;
  try
    L.Text:=Salida;
    for I:=0 to L.Count-1 do begin
      S:=Trim(L[I]);
      // Solo un DTO completo en una linea, tal como lo imprime PrintFinal.
      if (S<>'') and (S[1]='{') then begin
        if not LeerDto(S,E,M,T,N) then Exit;
        Inc(Count); if Count>1 then Exit;
        Estado:=E; Mensaje:=M; TrackId:=T; Encf:=N;
      end;
    end;
    Result:=Count=1;
  finally
    L.Free;
    if not Result then begin Estado:=''; Mensaje:=''; TrackId:=''; Encf:=''; end;
  end;
end;
end.
