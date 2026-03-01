unit UQrJpgHelper;

interface

uses
  Windows, SysUtils, Classes, Graphics, JPEG, QRCtrls, Printers,
  DelphiZXIngQRCode; // <-- el unit del repo (ojo: "Ing" en el nombre del archivo)

procedure SetQrUrlAsJpgToQRImage(
  const AUrl: string;
  ATarget: TQRImage;
  ASizeMm: Integer = 45;        // tamaño del QR en mm (para 3" recomiendo 40..55)
  AQuietZone: Integer = 4;      // estándar típico
  AJpegQuality: Integer = 100;  // JPG al máximo para no dañar el QR
  XPrinterIndex:Integer = -1
);

implementation

function GetPrinterDpi(_printerIndex:Integer): Integer;
var
  dx, dy: Integer;
begin
  Result := 203; // fallback típico
  try
    Printer.PrinterIndex := _printerIndex; // fuerza init suave
    dx := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
    dy := GetDeviceCaps(Printer.Handle, LOGPIXELSY);
    if (dx > 0) and (dy > 0) then
      Result := (dx + dy) div 2;
  except
    // deja fallback
  end;
end;

function MmToPx(AMm, ADpi: Integer): Integer;
begin
  // px = mm / 25.4 * dpi
  Result := Round((AMm / 25.4) * ADpi);
end;

procedure SetQrUrlAsJpgToQRImage(
  const AUrl: string;
  ATarget: TQRImage;
  ASizeMm: Integer;
  AQuietZone: Integer;
  AJpegQuality: Integer;
  XPrinterIndex:Integer
);
var
  QR: TDelphiZXIngQRCode;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  Row, Col: Integer;
  R: TRect;
  dpi, targetPx, modulePx: Integer;
begin
  if (ATarget = nil) then Exit;

  if (ASizeMm < 20) then ASizeMm := 20;
  if (AQuietZone < 0) then AQuietZone := 0;
  if (AJpegQuality < 1) then AJpegQuality := 1 else
  if (AJpegQuality > 100) then AJpegQuality := 100;

  dpi := GetPrinterDpi(XPrinterIndex);
  targetPx := MmToPx(ASizeMm, dpi);

  QR := TDelphiZXIngQRCode.Create;
  Bmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    QR.Data := AUrl;
    QR.QuietZone := AQuietZone;

    // Calcula el tamaño de módulo para aproximar targetPx
    modulePx := targetPx div QR.Rows;
    if modulePx < 4 then modulePx := 4; // mejora lectura en térmicas/JPG

    Bmp.PixelFormat := pf24bit;
    Bmp.Width  := QR.Columns * modulePx;
    Bmp.Height := QR.Rows    * modulePx;

    Bmp.Canvas.Pen.Style := psClear;

    // Fondo blanco
    Bmp.Canvas.Brush.Color := clWhite;
    Bmp.Canvas.FillRect(Rect(0, 0, Bmp.Width, Bmp.Height));

    // Módulos negros
    Bmp.Canvas.Brush.Color := clBlack;
    for Row := 0 to QR.Rows - 1 do
      for Col := 0 to QR.Columns - 1 do
        if QR.IsBlack[Row, Col] then
        begin
          R := Rect(
            Col * modulePx,
            Row * modulePx,
            (Col + 1) * modulePx,
            (Row + 1) * modulePx
          );
          Bmp.Canvas.FillRect(R);
        end;

    // Bitmap -> JPG
    Jpg.Assign(Bmp);
    Jpg.CompressionQuality := AJpegQuality;
    Jpg.ProgressiveEncoding := False;
    Jpg.Compress;

    // Asignar a QuickReport
    ATarget.Picture.Assign(Jpg);
  finally
    Jpg.Free;
    Bmp.Free;
    QR.Free;
  end;
end;

end.

