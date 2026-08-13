unit UEcfGastoQR;

interface

uses
  SysUtils, Classes, Forms;

type
  TGeneradorQrEcfGasto = function(
    const ATexto, AArchivoDestino: string): Boolean;

procedure RegistrarGeneradorQrEcfGasto(
  AGenerador: TGeneradorQrEcfGasto);

function PrepararQrEcfGasto(
  ATrn: Integer;
  const AEncf, AExeEcf: string;
  out AArchivoQr, AMensaje: string): Boolean;

implementation

uses
  UUtilecf, UGlobal, UEcfGastoTimbre;

var
  FGeneradorQr: TGeneradorQrEcfGasto = nil;

procedure RegistrarGeneradorQrEcfGasto(
  AGenerador: TGeneradorQrEcfGasto);
begin
  FGeneradorQr := AGenerador;
end;

function EsImagenQr(
  const AFileName, AEncf: string; ATrn: Integer): Boolean;
var
  E, N: string;
begin
  E := UpperCase(ExtractFileExt(AFileName));
  if (E <> '.JPG') and (E <> '.JPEG') and
     (E <> '.BMP') and (E <> '.PNG') then
  begin
    Result := False;
    Exit;
  end;

  N := UpperCase(ExtractFileName(AFileName));

  Result :=
    (Pos('QR_' + IntToStr(ATrn), N) > 0) or
    ((Trim(AEncf) <> '') and
     (Pos(UpperCase(Trim(AEncf)), N) > 0));
end;

function BuscarQrRecursivo(
  const ARoot, AEncf: string;
  ATrn, AProfundidad: Integer): string;
var
  SR: TSearchRec;
  R: Integer;
  P: string;
begin
  Result := '';

  if (AProfundidad < 0) or not DirectoryExists(ARoot) then
    Exit;

  P := IncludeTrailingPathDelimiter(ARoot);
  R := FindFirst(P + '*.*', faAnyFile, SR);
  try
    while R = 0 do
    begin
      if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if (SR.Attr and faDirectory) <> 0 then
        begin
          Result := BuscarQrRecursivo(
            P + SR.Name, AEncf, ATrn, AProfundidad - 1);
          if Result <> '' then
            Exit;
        end
        else if EsImagenQr(P + SR.Name, AEncf, ATrn) then
        begin
          Result := P + SR.Name;
          Exit;
        end;
      end;

      R := FindNext(SR);
    end;
  finally
    FindClose(SR);
  end;
end;

function BuscarQrExistente(
  ATrn: Integer;
  const AEncf, AExeEcf: string): string;
var
  Candidate: string;
  Root: string;
begin
  Result := '';

  if Trim(GlbRutaQREcf) <> '' then
  begin
    Candidate := StringReplace(
      GlbRutaQREcf,
      '[numerotrn]',
      IntToStr(ATrn),
      [rfReplaceAll, rfIgnoreCase]);

    if FileExists(Candidate) then
    begin
      Result := Candidate;
      Exit;
    end;

    Root := ExtractFilePath(GlbRutaQREcf);
    Result := BuscarQrRecursivo(Root, AEncf, ATrn, 5);
    if Result <> '' then
      Exit;
  end;

  if Trim(AExeEcf) <> '' then
  begin
    Root :=
      IncludeTrailingPathDelimiter(
        ExtractFilePath(AExeEcf)) + 'QR_ECF';

    Result := BuscarQrRecursivo(Root, AEncf, ATrn, 6);
    if Result <> '' then
      Exit;

    Root :=
      IncludeTrailingPathDelimiter(
        ExtractFilePath(AExeEcf)) + 'out';

    Result := BuscarQrRecursivo(Root, AEncf, ATrn, 6);
  end;
end;

function PrepararQrEcfGasto(
  ATrn: Integer;
  const AEncf, AExeEcf: string;
  out AArchivoQr, AMensaje: string): Boolean;
var
  Destino: string;
  MsgCli: string;
  UrlTimbre: string;
  CodigoSeguridad: string;
  FechaTimbre: string;
begin
  Result := False;
  AArchivoQr := '';
  AMensaje := '';

  {
    Patron equivalente al usado por INGRESOS con GetUrlImageTimbre,
    pero aislado para GASTOS.
  }
  CodigoSeguridad := '';
  FechaTimbre := '';

  UrlTimbre := GetUrlImageTimbreGasto(
    ATrn,
    CodigoSeguridad,
    FechaTimbre);

  if Trim(UrlTimbre) = '' then
  begin
    AMensaje :=
      'El e-CF de gastos no tiene URL de timbre ACEPTADA en ' +
      'ECF_GASTO_ENVIO. No se puede construir el QR.';
    Exit;
  end;

  AArchivoQr :=
    BuscarQrExistente(ATrn, AEncf, AExeEcf);

  if AArchivoQr <> '' then
  begin
    Result := True;
    Exit;
  end;

  { Integracion con la rutina QR Delphi existente de PointSaleSoft.
    Registrar una funcion una sola vez con RegistrarGeneradorQrEcfGasto. }
  if Assigned(FGeneradorQr) then
  begin
    if Trim(GlbRutaQREcf) <> '' then
      Destino := StringReplace(
        GlbRutaQREcf,
        '[numerotrn]',
        IntToStr(ATrn),
        [rfReplaceAll, rfIgnoreCase])
    else
      Destino :=
        IncludeTrailingPathDelimiter(
          ExtractFilePath(Application.ExeName)) +
        'QR_ECF_GASTOS\QR_' +
        IntToStr(ATrn) + '.jpg';

    ForceDirectories(ExtractFilePath(Destino));

    if FGeneradorQr(UrlTimbre, Destino) and
       FileExists(Destino) then
    begin
      AArchivoQr := Destino;
      Result := True;
      Exit;
    end;
  end;

  { Fallback al modo --QRDown que PointSaleSoft ya puede invocar.
    No se consulta ECF_TIMBRE_LOG ni NCF_ASIGNADOS. }
  if (Trim(AExeEcf) <> '') and
     (Trim(AEncf) <> '') then
  begin
    MsgCli := '';

    UUtilecf.EjecutarECF_DownQRXML(
      AExeEcf,
      AEncf,
      MsgCli);

    AArchivoQr :=
      BuscarQrExistente(ATrn, AEncf, AExeEcf);

    if AArchivoQr <> '' then
    begin
      Result := True;
      Exit;
    end;

    if Trim(MsgCli) <> '' then
      AMensaje := MsgCli;
  end;

  if AMensaje = '' then
    AMensaje :=
      'No fue posible generar o localizar la imagen QR del e-CF ' +
      Trim(AEncf) + '.';

  Result := False;
end;

end.
