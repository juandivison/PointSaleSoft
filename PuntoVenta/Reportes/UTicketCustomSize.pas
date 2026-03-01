unit UTicketCustomSize;

interface

uses
  SysUtils, Classes;

type
  TTicketCustomSize = class
  public
				 
    /// Construye el ticket ESC/POS de reimpresión usando los mismos datasets
    /// que el QuickReport de Surtidora.
				  
    class function BuildTicketReimpSurtidoraESCPos(
      const ATipoVenta, AValorNCF, ANombreCteGenerico, AStrCopia: string
    ): AnsiString;

				 
    /// Construye y envía el ticket ESC/POS crudo a la impresora indicada.
				  
    class function PrintTicketReimpSurtidoraESCPos(
      const APrinterName, ATipoVenta, AValorNCF,
            ANombreCteGenerico, AStrCopia: string
    ): Boolean;
  end;

implementation

uses
  Windows, WinSpool, DB, Graphics, JPEG,
  UDatModCompania, uDatModFactura, UDatModReportes,
  UGlobal, UUtilecftimbre;

const
  ESC            = #27;
  GS             = #29;
  CRLF           = #13#10;
  TICKET_COLUMNS = 42; // ancho lógico de texto del ticket

// -----------------------------------------------------------------------------
// Helpers de texto
// -----------------------------------------------------------------------------
function PadRight(const S: string; Len: Integer): string;
begin
  Result := S;
  if Length(Result) < Len then
    Result := Result + StringOfChar(' ', Len - Length(Result))
  else if Length(Result) > Len then
    SetLength(Result, Len);
end;

function PadLeft(const S: string; Len: Integer): string;
begin
  Result := S;
  if Length(Result) < Len then
    Result := StringOfChar(' ', Len - Length(Result)) + Result
  else if Length(Result) > Len then
    Result := Copy(Result, Length(Result) - Len + 1, Len);
end;

function FormatMonto(const ASimbolo: string; AMonto: Currency): string;
begin
  Result := FormatFloat(',0.00', AMonto);
  if ASimbolo <> '' then
    Result := ASimbolo + ' ' + Result;
end;

function FormatLineaTotal(const ATitulo: string; AMonto: Currency;
  const ASimbolo: string): string;
var
  sMonto: string;
begin
  sMonto := FormatMonto(ASimbolo, AMonto);
  Result := PadRight(ATitulo + ':', TICKET_COLUMNS - 1 - Length(sMonto)) +
            ' ' + sMonto;
end;

function FormatLineaDetalle(ACant: Double; const ADesc: string;
  AMonto: Currency; const ASimbolo: string): string;
const
  COL_CANT  = 5;
  COL_MONTO = 12;
var
  sCant, sMonto, sDesc: string;
  anchoDesc: Integer;
begin
  sCant  := PadLeft(FormatFloat('0.##', ACant), COL_CANT);
  sMonto := FormatMonto(ASimbolo, AMonto);
  if Length(sMonto) > COL_MONTO then
    sMonto := Copy(sMonto, Length(sMonto) - COL_MONTO + 1, COL_MONTO);
  sMonto    := PadLeft(sMonto, COL_MONTO);
  anchoDesc := TICKET_COLUMNS - COL_CANT - COL_MONTO - 2;
  sDesc     := Copy(ADesc, 1, anchoDesc);
  Result    := sCant + ' ' + PadRight(sDesc, anchoDesc) + ' ' + sMonto;
end;

// Lectura segura de campos (sin reventar si el campo no existe)
function GetStrField(ADataset: TDataSet; const AField: string): string;
var
  F: TField;
begin
  Result := '';
  if (ADataset = nil) or (AField = '') then
    Exit;
  F := ADataset.FindField(AField);
  if (F <> nil) and (not F.IsNull) then
    Result := F.AsString;
end;

function GetCurrField(ADataset: TDataSet; const AField: string): Currency;
var
  F: TField;
begin
  Result := 0;
  if (ADataset = nil) or (AField = '') then
    Exit;
  F := ADataset.FindField(AField);
  if (F <> nil) and (not F.IsNull) then
    Result := F.AsCurrency;
end;

function GetIntField(ADataset: TDataSet; const AField: string): Integer;
var
  F: TField;
begin
  Result := 0;
  if (ADataset = nil) or (AField = '') then
    Exit;
  F := ADataset.FindField(AField);
  if (F <> nil) and (not F.IsNull) then
    Result := F.AsInteger;
end;

function GetDateField(ADataset: TDataSet; const AField: string;
  out ADate: TDateTime): Boolean;
var
  F: TField;
begin
  Result := False;
  ADate  := 0;
  if (ADataset = nil) or (AField = '') then
    Exit;
  F := ADataset.FindField(AField);
  if (F <> nil) and (not F.IsNull) then
  begin
    ADate  := F.AsDateTime;
    Result := True;
  end;
end;

// -----------------------------------------------------------------------------
// Envío RAW a impresora
// -----------------------------------------------------------------------------
function RawPrintToPrinter(const APrinterName: string;
  const AData: AnsiString): Boolean;
var
  hPrinter    : THandle;
  DocInfo     : DOC_INFO_1;
  BytesWritten: DWORD;
begin
  Result := False;
  if Trim(APrinterName) = '' then
    Exit;

  if not OpenPrinter(PChar(APrinterName), hPrinter, nil) then
    Exit;
  try
    FillChar(DocInfo, SizeOf(DocInfo), 0);
    DocInfo.pDocName    := 'Ticket Surtidora ESC/POS';
    DocInfo.pOutputFile := nil;
    DocInfo.pDatatype   := 'RAW';

    if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
      Exit;
    try
      if not StartPagePrinter(hPrinter) then
        Exit;
      try
        if WritePrinter(hPrinter, PAnsiChar(AData),
                        Length(AData), BytesWritten) then
          Result := BytesWritten = DWORD(Length(AData));
      finally
        EndPagePrinter(hPrinter);
      end;
    finally
      EndDocPrinter(hPrinter);
    end;
  finally
    ClosePrinter(hPrinter);
  end;
end;

// -----------------------------------------------------------------------------
// Carga de imagen (BMP o JPG) a TBitmap
// -----------------------------------------------------------------------------
function LoadBitmapFromImageFile(const AFileName: string): TBitmap;
var
  ext: string;
  jpg: TJPEGImage;
begin
  Result := TBitmap.Create;
  ext := LowerCase(ExtractFileExt(AFileName));

  if (ext = '.jpg') or (ext = '.jpeg') then
  begin
    jpg := TJPEGImage.Create;
    try
      jpg.LoadFromFile(AFileName);
      Result.Assign(jpg); // convierte JPG -> Bitmap
    finally
      jpg.Free;
    end;
  end
  else
  begin
    // BMP u otros formatos soportados por TBitmap directamente
    Result.LoadFromFile(AFileName);
  end;

  // Nos aseguramos de trabajar en 24 bits para leer RGB
  Result.PixelFormat := pf24bit;
end;

// -----------------------------------------------------------------------------
// Construcción de imagen QR ESC/POS usando ESC * (modo 24-dot, m = 33)
// -----------------------------------------------------------------------------
function BuildQrRasterEscPosFromFile(const AFileName: string): AnsiString;
const
  // Ajusta estos valores según el ancho de papel:
  // 58 mm  ˜ 384 dots, 80 mm ˜ 576 dots
  MAX_QR_WIDTH_DOTS  = 384;
  MAX_QR_HEIGHT_DOTS = 384;
var
  bmp        : TBitmap;
  x, y       : Integer;
  widthDots  : Integer;
  heightDots : Integer;
  band       : Integer;
  bands      : Integer;
  b1, b2, b3 : Byte;
  gray       : Integer;
  color      : TColor;
  n          : Integer;
  nL, nH     : Byte;
  yPix       : Integer;

  function IsBlackPixel(AX, AY: Integer): Boolean;
  begin
    if (AX < 0) or (AX >= widthDots) or (AY < 0) or (AY >= heightDots) then
    begin
      Result := False;
      Exit;
    end;
    color := bmp.Canvas.Pixels[AX, AY];
    gray  := (GetRValue(color) + GetGValue(color) + GetBValue(color)) div 3;
    Result := gray < 128; // oscuro = negro
  end;

  procedure ScaleBitmapIfNeeded;
  var
    tmp   : TBitmap;
    scale : Double;
    newW,
    newH  : Integer;
  begin
    if (bmp.Width  <= MAX_QR_WIDTH_DOTS) and
       (bmp.Height <= MAX_QR_HEIGHT_DOTS) then
      Exit;

    tmp := TBitmap.Create;
    try
      tmp.PixelFormat := pf24bit;

      // Mantener proporción
      if bmp.Width >= bmp.Height then
        scale := MAX_QR_WIDTH_DOTS / bmp.Width
      else
        scale := MAX_QR_HEIGHT_DOTS / bmp.Height;

      newW := Round(bmp.Width  * scale);
      newH := Round(bmp.Height * scale);

      // Asegurar múltiplo de 8 en ancho (más amigable para ESC *)
      if newW < 8 then
        newW := 8;
      newW := (newW div 8) * 8;

      tmp.Width  := newW;
      tmp.Height := newH;

      tmp.Canvas.Brush.Color := clWhite;
      tmp.Canvas.FillRect(Rect(0, 0, tmp.Width, tmp.Height));

      SetStretchBltMode(tmp.Canvas.Handle, HALFTONE);
      StretchBlt(
        tmp.Canvas.Handle, 0, 0, tmp.Width, tmp.Height,
        bmp.Canvas.Handle, 0, 0, bmp.Width, bmp.Height,
        SRCCOPY
      );

      bmp.Assign(tmp);
    finally
      tmp.Free;
    end;
  end;

begin
  Result := '';
  if (Trim(AFileName) = '') or (not FileExists(AFileName)) then
    Exit;

  bmp := LoadBitmapFromImageFile(AFileName);
  try
    bmp.PixelFormat := pf24bit;

    // Escalar antes de convertir a ESC/POS
    ScaleBitmapIfNeeded;

    widthDots  := bmp.Width;
    heightDots := bmp.Height;

    if (widthDots <= 0) or (heightDots <= 0) then
      Exit;

    // n = número de columnas (cada columna son 24 puntos verticales => 3 bytes)
    n  := widthDots;
    nL := Byte(n and $FF);
    nH := Byte((n shr 8) and $FF);

    // Número de bandas de 24 puntos de alto
    bands := (heightDots + 23) div 24;

    for band := 0 to bands - 1 do
    begin
      // ESC * 33 nL nH  (24-dot, double density)
      Result := Result + ESC + '*' + AnsiChar(33) + AnsiChar(nL) + AnsiChar(nH);

      // Recorremos columnas horizontales
      for x := 0 to widthDots - 1 do
      begin
        b1 := 0;
        b2 := 0;
        b3 := 0;

        // 1er bloque de 8 puntos (0..7)
        for y := 0 to 7 do
        begin
          yPix := band * 24 + y;
          if IsBlackPixel(x, yPix) then
            b1 := b1 or (1 shl (7 - y));
        end;

        // 2do bloque de 8 puntos (8..15)
        for y := 0 to 7 do
        begin
          yPix := band * 24 + 8 + y;
          if IsBlackPixel(x, yPix) then
            b2 := b2 or (1 shl (7 - y));
        end;

        // 3er bloque de 8 puntos (16..23)
        for y := 0 to 7 do
        begin
          yPix := band * 24 + 16 + y;
          if IsBlackPixel(x, yPix) then
            b3 := b3 or (1 shl (7 - y));
        end;

        // Enviamos los 3 bytes de esta columna
        Result := Result + AnsiChar(b1) + AnsiChar(b2) + AnsiChar(b3);
      end;

      // Salto de línea después de cada banda (importante)
      Result := Result + CRLF;
    end;
  finally
    bmp.Free;
  end;
end;

// -----------------------------------------------------------------------------
// Implementación de TTicketCustomSize
// -----------------------------------------------------------------------------
class function TTicketCustomSize.BuildTicketReimpSurtidoraESCPos(
  const ATipoVenta, AValorNCF, ANombreCteGenerico, AStrCopia: string
): AnsiString;
var
  s          : AnsiString;
  linea      : string;
  simMoneda  : string;
  total      : Currency;
  pagado     : Currency;
  cambio     : Currency;
  fechaDoc   : TDateTime;
  fechaVence : TDateTime;
  tieneVence : Boolean;
  valorNCFUp : string;
  formaPago  : string;
  descNCF    : string;
  // para ECF / QR
  rutaQR     : string;
  codSeg     : string;
  fEmision   : string;
  qrData     : AnsiString;
begin
  s := '';

  // Inicialización ESC/POS
  s := s + ESC + '@';        // Reset
  s := s + ESC + 'M' + #0;   // Fuente normal

  // Asegurar datasets abiertos
  if dmCompania.tblCompania.State = dsInactive then
    dmCompania.tblCompania.Open;
  if dmFactura.qryVentaFactura.State = dsInactive then
    dmFactura.qryVentaFactura.Open;
  if dmFactura.qryVentaFacturaDet.State = dsInactive then
    dmFactura.qryVentaFacturaDet.Open;

  // Símbolo de moneda (mismo criterio que en el reporte)
  simMoneda := '';
  if GetStrField(dmFactura.qryVentaFactura, 'MONEDA') <> '' then
    simMoneda := SimboloMoneda(dmFactura.qryVentaFactura.FieldByName('MONEDA').AsString);

  // ---------------------------------------------------------------------------
  // 1. ENCABEZADO COMPAÑÍA (centrado)
  // ---------------------------------------------------------------------------
  s := s + ESC + 'a' + #1; // centrar

  linea := Trim(GetStrField(dmCompania.tblCompania, 'NOMBRE'));
  if linea <> '' then
    s := s + AnsiString(UpperCase(linea)) + CRLF;

  linea := Trim(GetStrField(dmCompania.tblCompania, 'CALLEYNUMERO'));
  if linea <> '' then
    s := s + AnsiString(linea) + CRLF;

  linea := Trim(GetStrField(dmCompania.tblCompania, 'TELEFONO'));
  if linea <> '' then
    s := s + AnsiString('Tel: ' + linea) + CRLF;

  linea := Trim(GetStrField(dmCompania.tblCompania, 'RNC_NUMERO'));
  if linea <> '' then
    s := s + AnsiString('RNC: ' + linea) + CRLF;

  s := s + CRLF;

  // ---------------------------------------------------------------------------
  // 2. TIPO DE VENTA / COPIA / DESCRIPCIÓN NCF
  // ---------------------------------------------------------------------------
  s := s + ESC + 'a' + #0; // izquierda

  // Tipo de venta + (COPIA) (igual lógica QRLabel24Print)
  if Trim(ATipoVenta) <> '' then
  begin
    if GlbEsCopia then
      linea := ATipoVenta + ' (COPIA)'
    else
      linea := ATipoVenta + AStrCopia;
    s := s + AnsiString(linea) + CRLF;
  end;

  // Descripción del NCF / ECF: GlbDescNCF suele tener "Factura de Consumo", etc.
  descNCF := Trim(GlbDescNCF);
  if descNCF <> '' then
  begin
    s := s + ESC + 'a' + #1; // centrar
    s := s + AnsiString(descNCF) + CRLF;
    s := s + ESC + 'a' + #0;
  end;

  // ---------------------------------------------------------------------------
  // 3. FECHA, FECHA VENCIMIENTO (E31), NCF / e-NCF
  // ---------------------------------------------------------------------------
  if GetDateField(dmFactura.qryVentaFactura, 'FECHA', fechaDoc) then
  begin
    linea := 'Fecha: ' + FormatDateTime('dd/mm/yyyy hh:nn', fechaDoc);
    // E31: suele tener fecha de vencimiento del comprobante
    tieneVence := GetDateField(dmFactura.qryVentaFactura, 'FECHAVENCENCF', fechaVence);
    if tieneVence then
      linea := linea + '  Valida Hasta: ' +
               FormatDateTime('dd/mm/yyyy', fechaVence);
    s := s + AnsiString(linea) + CRLF;
  end;

  // NCF / e-NCF (igual a QRLabel20Print)
  valorNCFUp := Trim(AValorNCF);
  if valorNCFUp <> '' then
  begin
    if (Length(valorNCFUp) > 0) and (valorNCFUp[1] = 'E') then
      linea := 'e-NCF: ' + valorNCFUp
    else
      linea := 'NCF: ' + valorNCFUp;
    s := s + AnsiString(linea) + CRLF;
  end;

  // ---------------------------------------------------------------------------
  // 4. RNC CLIENTE / NOMBRE CLIENTE
  // ---------------------------------------------------------------------------
  linea := Trim(GetStrField(dmFactura.qryVentaFactura, 'RNC_NUMERO'));
  if linea <> '' then
    s := s + AnsiString('RNC-' + linea) + CRLF;

  if Trim(ANombreCteGenerico) <> '' then
    linea := 'NOMBRE CLIENTE: ' + ANombreCteGenerico
  else if GLBCodigoCteFct = 1 then
    linea := 'NOMBRE O RAZON SOCIAL: ' +
             GetStrField(dmFactura.qryVentaFactura, 'CODIGO_CTE') + '-' +
             GetStrField(dmFactura.qryVentaFactura, 'NOMBRE_FACTURAR')
  else
    linea := 'NOMBRE O RAZON SOCIAL: ' +
             GetStrField(dmFactura.qryVentaFactura, 'NOMBRE_FACTURAR');

  s := s + AnsiString(linea) + CRLF;

  // #Trn y número de factura
  linea := '';
  if GetIntField(dmFactura.qryVentaFactura, 'NUMERO_FACTURA') <> 0 then
    linea := 'Factura: ' +
             Format('%.6d', [GetIntField(dmFactura.qryVentaFactura, 'NUMERO_FACTURA')]);
  if GetIntField(dmFactura.qryVentaFactura, 'NUMERO') <> 0 then
  begin
    if linea <> '' then
      linea := linea + '  ';
    linea := linea + Format('#Trn:%.6d',
               [GetIntField(dmFactura.qryVentaFactura, 'NUMERO')]);
  end;
  if linea <> '' then
    s := s + AnsiString(linea) + CRLF;

  // Cajero (VarNombreUsuario)
  if Trim(VarNombreUsuario) <> '' then
    s := s + AnsiString('Cajero: ' + VarNombreUsuario) + CRLF;

  s := s + CRLF;

  // ---------------------------------------------------------------------------
  // 5. CABECERA DETALLE
  // ---------------------------------------------------------------------------
  s := s + AnsiString(StringOfChar('-', TICKET_COLUMNS)) + CRLF;
  s := s + AnsiString('Cant  Descripcion                 Importe') + CRLF;
  s := s + AnsiString(StringOfChar('-', TICKET_COLUMNS)) + CRLF;

  // ---------------------------------------------------------------------------
  // 6. DETALLE
  // ---------------------------------------------------------------------------
  dmFactura.qryVentaFacturaDet.First;
  while not dmFactura.qryVentaFacturaDet.Eof do
  begin
					   
    linea := FormatLineaDetalle(
      dmFactura.qryVentaFacturaDet.FieldByName('CANTIDAD').AsFloat,
      dmFactura.qryVentaFacturaDet.FieldByName('DESCRIPCION').AsString,
      dmFactura.qryVentaFacturaDet.FieldByName('VALOR_SERVICIO_DET').AsCurrency,
      simMoneda
    );
    s := s + AnsiString(linea) + CRLF;

							 
    if (dmFactura.qryVentaFacturaDet.FindField('DESCRIPCIONADICIONAL') <> nil) and
       (not dmFactura.qryVentaFacturaDet.FieldByName('DESCRIPCIONADICIONAL').IsNull) and
       (Trim(dmFactura.qryVentaFacturaDet.FieldByName('DESCRIPCIONADICIONAL').AsString) <> '') then
    begin
      s := s + AnsiString('      ' +
        Trim(dmFactura.qryVentaFacturaDet.FieldByName('DESCRIPCIONADICIONAL').AsString)) + CRLF;
    end;

						
    if (dmFactura.qryVentaFacturaDet.FindField('SERIE_PROD') <> nil) and
       (not dmFactura.qryVentaFacturaDet.FieldByName('SERIE_PROD').IsNull) and
       (Trim(dmFactura.qryVentaFacturaDet.FieldByName('SERIE_PROD').AsString) <> '') then
    begin
      s := s + AnsiString('      Serie: ' +
        Trim(dmFactura.qryVentaFacturaDet.FieldByName('SERIE_PROD').AsString)) + CRLF;
    end;

    dmFactura.qryVentaFacturaDet.Next;
  end;

  // Línea de separación antes de totales
  s := s + AnsiString(StringOfChar('-', TICKET_COLUMNS)) + CRLF;

  // ---------------------------------------------------------------------------
  // 7. TOTALES
  // ---------------------------------------------------------------------------
  total  := GetCurrField(dmFactura.qryVentaFactura, 'VALOR_TOTAL_DET');
  pagado := GetCurrField(dmFactura.qryVentaFactura, 'MONTO_PAGADO');
  cambio := GetCurrField(dmFactura.qryVentaFactura, 'MONTO_CAMBIO');

  s := s + AnsiString(FormatLineaTotal('TOTAL NETO', total, simMoneda)) + CRLF;

  if pagado <> 0 then
    s := s + AnsiString(FormatLineaTotal('MONTO RECIBIDO', pagado, simMoneda)) + CRLF;

  if cambio <> 0 then
    s := s + AnsiString(FormatLineaTotal('CAMBIO', cambio, simMoneda)) + CRLF;

  // ---------------------------------------------------------------------------
  // 8. FORMAS DE PAGO
  // ---------------------------------------------------------------------------
  dmReportes.qryFPagoTicket.Close;
  if dmReportes.qryFPagoTicket.Params.Count > 0 then
    dmReportes.qryFPagoTicket.Params[0].Value :=
      GetIntField(dmFactura.qryVentaFactura, 'NUMERO');
  dmReportes.qryFPagoTicket.Open;

  if not dmReportes.qryFPagoTicket.IsEmpty then
  begin
    s := s + CRLF + AnsiString('Formas de pago:') + CRLF;
    dmReportes.qryFPagoTicket.First;
    while not dmReportes.qryFPagoTicket.Eof do
    begin
      if (dmReportes.qryFPagoTicket.FindField('MONTOPAGADODET') <> nil) and
         (not dmReportes.qryFPagoTicket.FieldByName('MONTOPAGADODET').IsNull) and
         (dmReportes.qryFPagoTicket.FieldByName('MONTOPAGADODET').AsCurrency <> 0) then
      begin
        formaPago := GetStrField(dmReportes.qryFPagoTicket, 'DESCRIPCIONDGII');
        if formaPago = '' then
          formaPago := GetStrField(dmReportes.qryFPagoTicket, 'DESCRIPCION');

																							
        if SameText(Trim(formaPago), 'OTROS 1') then
          formaPago := 'CXC';

        linea := FormatLineaTotal(
          formaPago,
          dmReportes.qryFPagoTicket.FieldByName('MONTOPAGADODET').AsCurrency,
          simMoneda
        );
        s := s + AnsiString(linea) + CRLF;
      end;
      dmReportes.qryFPagoTicket.Next;
    end;
  end;

    // ---------------------------------------------------------------------------
  // 9. ECF / QR (texto + imagen ESC/POS)
  // ---------------------------------------------------------------------------
  if GlbActivaECF = 1 then
  begin
    codSeg   := '';
    fEmision := '';
    rutaQR   := UUtilecftimbre.GetRutaTimbre(
                  GetIntField(dmFactura.qryVentaFactura, 'NUMERO'),
                  codSeg,
                  fEmision);

    if Trim(codSeg) <> '' then
      s := s + CRLF + AnsiString('Cod. Seguridad: ' + codSeg) + CRLF;

    if Trim(fEmision) <> '' then
      s := s + AnsiString('Fecha Firma: ' + fEmision) + CRLF;
    //TODO -COMPLETAR
    {qrData := BuildQrRasterEscPosFromFile(rutaQR);
    if qrData <> '' then
    begin
      s := s + CRLF;
      // un poco menos de interlineado para que el QR no se separe demasiado
      s := s + ESC + '3' + AnsiChar(24); // line spacing = 24 dots aprox
      s := s + ESC + 'a' + #1;           // centrar (si la impresora lo respeta)
      s := s + qrData;
      s := s + ESC + 'a' + #0;           // volver a izquierda
      s := s + ESC + '2';                // restaurar line spacing por defecto
    end;}
  end;


  // ---------------------------------------------------------------------------
  // 10. Mensaje de observación + pie
  // ---------------------------------------------------------------------------
  if Trim(GetStrField(dmCompania.tblCompania, 'OBSERVACION')) <> '' then
  begin
    s := s + CRLF;
    s := s + ESC + 'a' + #1; // centrar
    s := s + AnsiString(Trim(GetStrField(dmCompania.tblCompania, 'OBSERVACION'))) + CRLF;
    s := s + ESC + 'a' + #0;
  end;

  s := s + ESC + 'a' + #1;
  s := s + AnsiString('*** GRACIAS POR SU COMPRA ***') + CRLF;
  s := s + ESC + 'a' + #0;

													
  if GlbEsCopia then
    linea := 'Copia: Vendedor'
  else
    linea := 'Original: Cliente';
  s := s + AnsiString(linea) + CRLF;

							 
  s := s + AnsiString('Imp.: ' +
        FormatDateTime('dd/mm/yyyy hh:nn', Now)) + CRLF;

													 
  s := s + AnsiString('Total items: ' +
       IntToStr(dmFactura.qryVentaFacturaDet.RecordCount)) + CRLF;
    				
  s := s + CRLF + CRLF + CRLF;
  s := s + GS + 'V' + #66 + #0;

  Result := s;
end;

class function TTicketCustomSize.PrintTicketReimpSurtidoraESCPos(
  const APrinterName, ATipoVenta, AValorNCF,
        ANombreCteGenerico, AStrCopia: string
): Boolean;
var
  datos: AnsiString;
  xCopias,x:integer;

begin
  datos := BuildTicketReimpSurtidoraESCPos(
             ATipoVenta, AValorNCF, ANombreCteGenerico, AStrCopia);
  if datos <> '' then
  begin
    if (AStrCopia = '') then xCopias:=1 else
    xCopias:=StrToInt(AStrCopia);
    for x:=1 to xCopias do
    begin
      Result := RawPrintToPrinter(APrinterName, datos);
    end;
  end else
    Result := False;
end;

end.

