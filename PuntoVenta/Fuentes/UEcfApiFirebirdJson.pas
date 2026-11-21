unit UEcfApiFirebirdJson;

{
  CP13.7: Firebird persistido -> fiscal in-memory -> JSON publico v1 UTF-8.
  No usa IdesiToolECF.exe, no escribe Factura.txt y no realiza HTTP.
  Generar despues de persistir la venta; los intentos API son gestionados
  por otro orquestador. Respeta la transaccion IBX recibida.
}

interface

uses
  IBDatabase;

function ConstruirJsonIngresosDesdeFirebird(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const ARncEmisor, AReferenciaExterna: string;
  out AENcf, ATipoEcf: string; out AJsonUtf8: AnsiString): Boolean;

implementation

uses
  SysUtils, UFacturaTxtBuilder, UEcfApiV1Json, UDatModConectar;

function ConstruirJsonIngresosDesdeFirebird(
  ADatabase: TIBDatabase; ATransaction: TIBTransaction;
  ANumeroTrn: Integer; const ARncEmisor, AReferenciaExterna: string;
  out AENcf, ATipoEcf: string; out AJsonUtf8: AnsiString): Boolean;
var
  Builder: TFacturaTxtBuilder;
  Contenido: string;
  ConteoDetalle: Integer;
  ContenidoUtf8: UTF8String;
begin
  Result := False;
  AENcf := '';
  ATipoEcf := '';
  AJsonUtf8 := '';
  if (dmConectar = nil) or (ADatabase <> dmConectar.IBDatabase1) or
     (ATransaction <> dmConectar.IBTransaction1) or
     (not ADatabase.Connected) then
    raise Exception.Create('JSON API: requiere IBDatabase1/IBTransaction1 globales.');
  if ANumeroTrn <= 0 then
    raise Exception.Create('JSON API: numero de transaccion invalido.');

  Builder := TFacturaTxtBuilder.Create(ADatabase, ATransaction);
  try
    Contenido := Builder.BuildFacturaTxtContent(ANumeroTrn,
      AENcf, ATipoEcf, ConteoDetalle);
  finally
    Builder.Free;
  end;
  if (ConteoDetalle <= 0) or (AENcf = '') then
    raise Exception.Create('JSON API: factura persistida sin detalle o e-NCF.');
  ContenidoUtf8 := UTF8Encode(Contenido);
  AJsonUtf8 := AnsiString(ConstruirJsonIngresosPublicV1DesdeContenido(
    string(ContenidoUtf8), ARncEmisor, AReferenciaExterna));
  Result := True;
end;

end.
