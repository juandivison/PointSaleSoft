unit UEcfApiV1Json;

{
  PointSaleSoft / Delphi 7
  Convierte un Factura.txt V2 YA GENERADO en un JSON publico IDESI API v1.
  Primer alcance: E31 exclusivamente. No emite ni recalcula datos fiscales.
  Se preservan literales numericos y el contenido UTF-8 del TXT.
  No modificar la fuente Factura.txt, ni intentar enviar con este modulo.
}

interface

uses
  SysUtils, Classes;

function ConstruirJsonE31PublicV1(
  const ARutaFacturaTxt, ARncEmisor, AReferenciaExterna: string): string;

implementation

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

function ConstruirJsonE31PublicV1(
  const ARutaFacturaTxt, ARncEmisor, AReferenciaExterna: string): string;
var
  Archivo, Campos, H: TStringList;
  I, Metodo, NumeroItems, NumeroTotales: Integer;
  Linea, Ecf, ItemsJson, AjustesJson, PagosJson, TotalesJson: string;
  BuyerJson, DocJson, Rnc: string;
begin
  if Trim(ARncEmisor) = '' then
    raise Exception.Create('companyRnc es obligatorio.');
  if Trim(AReferenciaExterna) = '' then
    raise Exception.Create('externalReference es obligatoria.');
  if not FileExists(ARutaFacturaTxt) then
    raise Exception.Create('No existe el Factura.txt: ' + ARutaFacturaTxt);

  Archivo := TStringList.Create;
  Campos := TStringList.Create;
  H := TStringList.Create;
  try
    Archivo.LoadFromFile(ARutaFacturaTxt);
    if Archivo.Count < 3 then
      raise Exception.Create('Factura.txt debe contener cabecera, detalle y totales.');
    SepararCamposTxt(Archivo[0], H);
    ExigirCampos(H, 27, 'Cabecera Factura.txt');
    if H[0] <> '2' then
      raise Exception.Create('El registro inicial debe ser cabecera tipo 2.');

    Ecf := Trim(H[1]);
    if (Length(Ecf) <> 13) or (Copy(Ecf, 1, 3) <> 'E31') then
      raise Exception.Create('UEcfApiV1Json solo admite E31 con 13 caracteres.');
    for I := 4 to Length(Ecf) do
      if not (Ecf[I] in ['0'..'9']) then
        raise Exception.Create('e-NCF E31 contiene caracteres invalidos.');
    if Trim(H[4]) <> '' then
      raise Exception.Create('E31 no debe tener NCFReferencia.');
    if (Trim(H[2]) = '') or (Trim(H[3]) = '') then
      raise Exception.Create('E31 requiere nombre y RNC del comprador.');

    Rnc := Trim(ARncEmisor);
    BuyerJson := '';
    if Trim(H[2]) <> '' then
      BuyerJson := CampoTexto('name', H[2]);
    if Trim(H[3]) <> '' then
    begin
      if BuyerJson <> '' then BuyerJson := BuyerJson + ',';
      BuyerJson := BuyerJson + CampoTexto('rnc', H[3]);
    end;
    if Trim(H[22]) <> '' then
    begin
      if BuyerJson <> '' then BuyerJson := BuyerJson + ',';
      BuyerJson := BuyerJson + CampoTexto('municipalityCode', H[22]);
    end;
    if Trim(H[23]) <> '' then
    begin
      if BuyerJson <> '' then BuyerJson := BuyerJson + ',';
      BuyerJson := BuyerJson + CampoTexto('provinceCode', H[23]);
    end;

    PagosJson := '';
    for Metodo := 1 to 8 do
    begin
      if Trim(H[8 + Metodo]) <> '' then
      begin
        if PagosJson <> '' then PagosJson := PagosJson + ',';
        PagosJson := PagosJson + '{"method":' + IntToStr(Metodo) +
          ',"amount":' + JsonNumero(H[8 + Metodo], 'payments.amount') + '}';
      end;
    end;

    ItemsJson := '';
    AjustesJson := '';
    TotalesJson := '';
    NumeroItems := 0;
    NumeroTotales := 0;

    for I := 1 to Archivo.Count - 1 do
    begin
      Linea := Archivo[I];
      SepararCamposTxt(Linea, Campos);
      if Campos.Count = 0 then
        raise Exception.Create('Linea fiscal vacia.');
      if Campos[0] = '1' then
      begin
        ExigirCampos(Campos, 12, 'Item Factura.txt V2');
        Inc(NumeroItems);
        if NumeroItems > 100 then
          raise Exception.Create('API publica v1 admite maximo 100 items.');
        if (Trim(Campos[4]) <> '0.00') and
           (Trim(Campos[4]) <> '16.00') and
           (Trim(Campos[4]) <> '18.00') then
          raise Exception.Create('items.taxRate: v1 permite solamente 0, 16 o 18.');
        if ItemsJson <> '' then ItemsJson := ItemsJson + ',';
        ItemsJson := ItemsJson + '{' +
          CampoTexto('description', Campos[2]) + ',' +
          CampoNumero('quantity', Campos[1], 'items.quantity') + ',' +
          CampoNumero('unitPrice', Campos[3], 'items.unitPrice') + ',' +
          CampoNumero('taxRate', Campos[4], 'items.taxRate') + ',' +
          '"billingIndicator":' + JsonEntero(Campos[7], 'items.billingIndicator', 0, 4) + ',' +
          CampoNumero('lineAmount', Campos[8], 'items.lineAmount') + ',' +
          CampoNumero('itbisAmount', Campos[11], 'items.itbisAmount');
        if Trim(Campos[5]) <> '' then
          ItemsJson := ItemsJson + ',' + CampoTexto('code', Campos[5]);
        if Trim(Campos[6]) <> '' then
          ItemsJson := ItemsJson + ',' + CampoTexto('unit', Campos[6]);
        if Trim(Campos[9]) <> '' then
          ItemsJson := ItemsJson + ',' + CampoNumero('discountAmount', Campos[9], 'items.discountAmount');
        if Trim(Campos[10]) <> '' then
          ItemsJson := ItemsJson + ',' + CampoNumero('discountPercent', Campos[10], 'items.discountPercent');
        ItemsJson := ItemsJson + '}';
      end
      else if Campos[0] = '3' then
      begin
        ExigirCampos(Campos, 8, 'Ajuste Factura.txt V2');
        if (Campos[1] <> 'D') and (Campos[1] <> 'R') then
          raise Exception.Create('adjustments.type debe ser D o R.');
        if AjustesJson <> '' then AjustesJson := AjustesJson + ',';
        AjustesJson := AjustesJson + '{' +
          CampoTexto('type', Campos[1]) + ',' +
          '"billingIndicator":' + JsonEntero(Campos[2], 'adjustments.billingIndicator', 1, 4) + ',' +
          CampoTexto('valueType', Campos[3]) + ',' +
          CampoNumero('value', Campos[4], 'adjustments.value') + ',' +
          CampoNumero('sourceAmount', Campos[5], 'adjustments.sourceAmount') + ',' +
          CampoNumero('fiscalAmount', Campos[6], 'adjustments.fiscalAmount');
        if Trim(Campos[7]) <> '' then
          AjustesJson := AjustesJson + ',' + CampoTexto('description', Campos[7]);
        AjustesJson := AjustesJson + '}';
      end
      else if Campos[0] = '4' then
      begin
        ExigirCampos(Campos, 7, 'Totales Factura.txt V2');
        Inc(NumeroTotales);
        if NumeroTotales <> 1 then
          raise Exception.Create('Solo debe existir un bloque fiscal de totales.');
        TotalesJson := '{' + CampoNumero('totalAmount', Campos[1], 'totals.totalAmount');
        if Trim(Campos[2]) <> '' then
          TotalesJson := TotalesJson + ',' + CampoNumero('totalItbis', Campos[2], 'totals.totalItbis');
        if Trim(Campos[3]) <> '' then
          TotalesJson := TotalesJson + ',' + CampoNumero('exoneratedItbisAmount', Campos[3], 'totals.exoneratedItbisAmount');
        if Trim(Campos[4]) <> '' then
          TotalesJson := TotalesJson + ',' + CampoNumero('exemptAmount', Campos[4], 'totals.exemptAmount');
        if Trim(Campos[5]) <> '' then
          TotalesJson := TotalesJson + ',' + CampoNumero('taxableAmount', Campos[5], 'totals.taxableAmount');
        if Trim(Campos[6]) <> '' then
          TotalesJson := TotalesJson + ',' + CampoNumero('nonBillableAmount', Campos[6], 'totals.nonBillableAmount');
        TotalesJson := TotalesJson + '}';
      end
      else
        raise Exception.Create('Tipo de registro Factura.txt no soportado: ' + Campos[0]);
    end;

    if NumeroItems = 0 then
      raise Exception.Create('El documento E31 no tiene items.');
    if NumeroTotales <> 1 then
      raise Exception.Create('El documento E31 no tiene totales fiscales tipo 4.');

    DocJson := '{' +
      CampoTexto('type', 'E31') + ',' +
      CampoTexto('eNcf', Ecf) + ',' +
      CampoTexto('sequenceExpirationDate', FechaIso(H[17], 'sequenceExpirationDate')) + ',' +
      CampoTexto('issueDate', FechaIso(H[19], 'issueDate')) + ',' +
      CampoTexto('incomeType', H[18]) + ',' +
      '"paymentCondition":' + JsonEntero(H[20], 'paymentCondition', 1, 3);

    if Trim(H[21]) <> '' then
      DocJson := DocJson + ',"taxIncludedIndicator":' +
        JsonEntero(H[21], 'taxIncludedIndicator', 0, 1);
    if Trim(H[26]) <> '' then
      DocJson := DocJson + ',' +
        CampoTexto('paymentDueDate', FechaIso(H[26], 'paymentDueDate'));
    if BuyerJson <> '' then
      DocJson := DocJson + ',"buyer":{' + BuyerJson + '}';
    if PagosJson <> '' then
      DocJson := DocJson + ',"payments":[' + PagosJson + ']';
    if Trim(H[8]) <> '' then
      DocJson := DocJson + ',' + CampoTexto('comments', H[8]);
    if Trim(H[7]) <> '' then
      DocJson := DocJson + ',' + CampoNumero('legalTipAmount', H[7], 'legalTipAmount');
    DocJson := DocJson + ',"items":[' + ItemsJson + ']';
    if AjustesJson <> '' then
      DocJson := DocJson + ',"adjustments":[' + AjustesJson + ']';
    DocJson := DocJson + ',"totals":' + TotalesJson + '}';

    Result := '{' +
      CampoTexto('companyRnc', Rnc) + ',' +
      CampoTexto('externalReference', AReferenciaExterna) + ',' +
      '"document":' + DocJson + '}';
  finally
    H.Free;
    Campos.Free;
    Archivo.Free;
  end;
end;

end.
