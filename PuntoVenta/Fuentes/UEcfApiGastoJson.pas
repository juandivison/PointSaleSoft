unit UEcfApiGastoJson;
interface
function ConstruirJsonGastoPublicV1(const AContenidoUtf8, ARncEmisor,
  AReferenciaExterna: string): string;
implementation
uses SysUtils, Classes;
function JsonTexto(const S: string): string;
var
  I, N: Integer;
  C: Char;
begin
  Result := '"';
  for I := 1 to Length(S) do
  begin
    C := S[I];
    N := Ord(C);
    case C of
      '"': Result := Result + '\"';
      '\': Result := Result + '\\';
      #8: Result := Result + '\b';
      #9: Result := Result + '\t';
      #10: Result := Result + '\n';
      #12: Result := Result + '\f';
      #13: Result := Result + '\r';
    else
      if N < 32 then
        Result := Result + '\u00' + IntToHex(N, 2)
      else
        Result := Result + C;
    end;
  end;
  Result := Result + '"';
end;

procedure SepararCamposTxt(const S: string; ADestino: TStrings);
var
  I, Inicio: Integer;
begin
  ADestino.Clear;
  Inicio := 1;
  I := 1;
  while I <= Length(S) - 1 do
  begin
    if (S[I] = '|') and (S[I + 1] = '|') then
    begin
      ADestino.Add(Copy(S, Inicio, I - Inicio));
      Inc(I, 2);
      Inicio := I;
    end
    else
      Inc(I);
  end;
  ADestino.Add(Copy(S, Inicio, Length(S) - Inicio + 1));
end;

procedure ExigirCampos(ALista: TStrings; ACantidad: Integer; const AContexto: string);
begin
  if ALista.Count <> ACantidad then
    raise Exception.CreateFmt(
      '%s: se esperaban %d campos y se encontraron %d.',
      [AContexto, ACantidad, ALista.Count]);
end;

function JsonNumero(const S, ACampo: string): string;
var
  I: Integer;
  TieneDigito, TienePunto: Boolean;
  T: string;
begin
  T := Trim(S);
  if T = '' then
    raise Exception.Create(ACampo + ': se requiere un numero fiscal.');
  TieneDigito := False;
  TienePunto := False;
  for I := 1 to Length(T) do
  begin
    if T[I] in ['0'..'9'] then
      TieneDigito := True
    else if (T[I] = '.') and (not TienePunto) then
      TienePunto := True
    else
      raise Exception.Create(ACampo + ': literal numerico invalido.');
  end;
  if (not TieneDigito) or (T[1] = '.') or (T[Length(T)] = '.') then
    raise Exception.Create(ACampo + ': literal numerico invalido.');
  Result := T;
end;

function JsonEntero(const S, ACampo: string; AMin, AMax: Integer): string;
var
  V: Integer;
  N: string;
begin
  N := JsonNumero(S, ACampo);
  if Pos('.', N) > 0 then
    raise Exception.Create(ACampo + ': se requiere un entero.');
  V := StrToIntDef(N, -1);
  if (V < AMin) or (V > AMax) then
    raise Exception.Create(ACampo + ': entero fuera de rango.');
  Result := IntToStr(V);
end;

function FechaIso(const S, ACampo: string): string;
var
  D, M, Y: Word;
  V: TDateTime;
begin
  if (Length(S) <> 10) or (S[3] <> '-') or (S[6] <> '-') then
    raise Exception.Create(ACampo + ': la fecha del TXT debe tener formato dd-mm-yyyy.');
  D := StrToIntDef(Copy(S, 1, 2), 0);
  M := StrToIntDef(Copy(S, 4, 2), 0);
  Y := StrToIntDef(Copy(S, 7, 4), 0);
  try
    V := EncodeDate(Y, M, D);
  except
    raise Exception.Create(ACampo + ': fecha invalida.');
  end;
  Result := FormatDateTime('yyyy"-"mm"-"dd', V);
end;

function CampoTexto(const ANombre, AValor: string): string;
begin
  Result := JsonTexto(ANombre) + ':' + JsonTexto(AValor);
end;

function CampoNumero(const ANombre, AValor, AContexto: string): string;
begin
  Result := JsonTexto(ANombre) + ':' + JsonNumero(AValor, AContexto);
end;

function SoloDigitos(const S: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function FormatoIdentificacionAceptable(const S: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 1 to Length(S) do
    if not (S[I] in ['0'..'9', '-', ' ', '.']) then
    begin
      Result := False;
      Exit;
    end;
end;

function MontoFiscal(const S: string): Currency;
var
  V: Extended;
  Code: Integer;
begin
  Val(JsonNumero(S, 'totals.totalAmount'), V, Code);
  if Code <> 0 then
    raise Exception.Create('totals.totalAmount: importe fiscal invalido.');
  if (V < 0) or (V > 999999999999.99) then
    raise Exception.Create('totals.totalAmount: importe fuera de rango.');
  Result := V;
end;

function ConstruirJsonGastoPublicV1(const AContenidoUtf8, ARncEmisor,
  AReferenciaExterna: string): string;
var L,H,F:TStringList; I,J,N:Integer; Items,Pagos,Doc,Tot,Tipo,S:string;
  Base,Itbis,RetI,RetR,Exento,Gravado,Total,Neto,V:Currency;
  function Num(const X:string):Currency;
  begin Result:=MontoFiscal(X); end;
  function Money(X:Currency):string;
  var FS:string;
  begin FS:=FormatCurr('0.00',X);Result:=StringReplace(FS,DecimalSeparator,'.',[rfReplaceAll]);end;
begin
  if (Trim(ARncEmisor)='') or (Trim(AReferenciaExterna)='') then
    raise Exception.Create('Identidad API de gasto incompleta.');
  L:=TStringList.Create;H:=TStringList.Create;F:=TStringList.Create;
  try
    L.Text:=AContenidoUtf8;
    if L.Count=0 then raise Exception.Create('Gastos.txt vacio.');
    SepararCamposTxt(L[0],H);ExigirCampos(H,19,'Cabecera GASTO1');
    for J:=0 to H.Count-1 do begin
      H[J]:=StringReplace(H[J],'%7C','|',[rfReplaceAll,rfIgnoreCase]);
      H[J]:=StringReplace(H[J],'%25','%',[rfReplaceAll,rfIgnoreCase]);
    end;
    if (H[0]<>'2') or (H[1]<>'GASTO1') or
       ((H[3]<>'41') and (H[3]<>'43')) or
       (Length(H[2])<>13) or (Copy(H[2],1,3)<>'E'+H[3]) then
      raise Exception.Create('Cabecera o tipo de gasto invalido.');
    for J:=4 to 13 do if not(H[2][J] in ['0'..'9']) then
      raise Exception.Create('e-NCF de gasto invalido.');
    Tipo:='E'+H[3];Items:='';Pagos:='';N:=0;
    Itbis:=0;RetI:=0;RetR:=0;Exento:=0;Gravado:=0;Total:=0;
    for I:=1 to L.Count-1 do begin
      if Trim(L[I])='' then Continue;
      SepararCamposTxt(L[I],F);
      for J:=0 to F.Count-1 do begin
        F[J]:=StringReplace(F[J],'%7C','|',[rfReplaceAll,rfIgnoreCase]);
        F[J]:=StringReplace(F[J],'%25','%',[rfReplaceAll,rfIgnoreCase]);
      end;
      if F[0]='1' then begin
        ExigirCampos(F,12,'Detalle GASTO1');Inc(N);
        if N>100 then raise Exception.Create('Gasto excede 100 lineas.');
        S:='{'+CampoTexto('code',F[1])+','+CampoTexto('description',F[2])+','+
          '"goodsServiceIndicator":'+JsonEntero(F[3],'goodsServiceIndicator',1,2)+','+
          CampoNumero('quantity',F[4],'quantity')+','+CampoNumero('unitPrice',F[5],'unitPrice')+','+
          CampoNumero('lineAmount',F[6],'lineAmount')+','+
          '"billingIndicator":'+JsonEntero(F[7],'billingIndicator',1,4)+','+
          CampoNumero('itbisAmount',F[8],'itbisAmount')+','+
          CampoNumero('withheldItbisAmount',F[9],'withheldItbisAmount')+','+
          CampoNumero('withheldIsrAmount',F[10],'withheldIsrAmount')+'}';
        if Items<>'' then Items:=Items+',';Items:=Items+S;
        Base:=Num(F[6]);V:=Num(F[8]);
        if (Tipo='E41') and (H[8]='1') then Base:=Base-V;
        if F[7]='4' then Exento:=Exento+Base else Gravado:=Gravado+Base;
        Total:=Total+Base+V;Itbis:=Itbis+V;
        RetI:=RetI+Num(F[9]);RetR:=RetR+Num(F[10]);
      end else if F[0]='3' then begin
        ExigirCampos(F,3,'Pago GASTO1');
        if Pagos<>'' then Pagos:=Pagos+',';
        Pagos:=Pagos+'{"method":'+JsonEntero(F[1],'payment.method',1,8)+','+
          CampoNumero('amount',F[2],'payment.amount')+'}';
      end else raise Exception.Create('Registro GASTO1 desconocido.');
    end;
    if N=0 then raise Exception.Create('Gasto sin detalle.');
    Neto:=Total-RetI-RetR;
    if Abs(Neto-Num(H[9]))>0.01 then raise Exception.Create('El neto del gasto no cuadra con el pago registrado.');
    Tot:='"totalAmount":'+Money(Total)+',"totalItbis":'+Money(Itbis)+
      ',"taxableAmount":'+Money(Gravado)+',"exemptAmount":'+Money(Exento)+
      ',"withheldItbisAmount":'+Money(RetI)+',"withheldIsrAmount":'+Money(RetR)+
      ',"netPayableAmount":'+Money(Neto);
    Doc:=CampoTexto('type',Tipo)+','+CampoTexto('eNcf',H[2])+','+
      CampoTexto('issueDate',FechaIso(H[4],'issueDate'))+','+
      CampoTexto('sequenceExpirationDate',FechaIso(H[5],'sequenceExpirationDate'))+','+
      CampoNumero('supplierPaymentAmount',H[9],'supplierPaymentAmount');
    if Tipo='E41' then begin
      Doc:=Doc+',"paymentCondition":'+JsonEntero(H[6],'paymentCondition',1,2);
      if H[7]<>'' then Doc:=Doc+','+CampoTexto('paymentDueDate',FechaIso(H[7],'paymentDueDate'));
      if H[8]<>'' then Doc:=Doc+',"taxIncludedIndicator":'+JsonEntero(H[8],'taxIncludedIndicator',0,1);
      Doc:=Doc+',"supplier":{"documentType":'+JsonEntero(H[10],'documentType',1,3)+','+
        CampoTexto('name',H[13])+','+CampoTexto('address',H[14])+','+
        CampoTexto('municipalityCode',H[15])+','+CampoTexto('provinceCode',H[16]);
      if H[10]='3' then Doc:=Doc+','+CampoTexto('foreignId',H[12])
      else Doc:=Doc+','+CampoTexto('documentNumber',H[11]);
      Doc:=Doc+'}';
    end;
    if H[17]<>'' then Doc:=Doc+','+CampoTexto('comments',H[17]);
    Doc:=Doc+',"items":['+Items+'],"payments":['+Pagos+'],"totals":{'+Tot+'}';
    Result:='{'+CampoTexto('companyRnc',ARncEmisor)+','+
      CampoTexto('externalReference',AReferenciaExterna)+',"document":{'+Doc+'}}';
  finally F.Free;H.Free;L.Free;end;
end;
end.
