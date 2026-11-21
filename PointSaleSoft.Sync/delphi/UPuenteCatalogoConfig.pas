unit UPuenteCatalogoConfig;

interface

uses IBDatabase;

function PuenteCatalogoActivo: Boolean;
procedure VerificarPuenteCatalogo(ADB: TIBDatabase; ATx: TIBTransaction);

implementation

uses SysUtils, IniFiles, IBQuery;

function PuenteCatalogoActivo: Boolean;
var Ini: TIniFile; Modo: string;
begin
  Ini := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'repconf_cr.ini');
  try Modo := UpperCase(Trim(Ini.ReadString('CATALOGO_SYNC','Modo','DIRECTO')));
  finally Ini.Free; end;
  if (Modo<>'DIRECTO') and (Modo<>'PUENTE') then
    raise Exception.Create('Modo de sincronizacion de catalogo invalido. Use DIRECTO o PUENTE.');
  Result := Modo='PUENTE';
end;

procedure VerificarPuenteCatalogo(ADB: TIBDatabase; ATx: TIBTransaction);
var Q: TIBQuery; Rol: string;
begin
  if not PuenteCatalogoActivo then Exit;
  Q := TIBQuery.Create(nil);
  try
    Q.Database := ADB; Q.Transaction := ATx;
    if not ATx.InTransaction then ATx.StartTransaction;
    Q.SQL.Text := 'SELECT NODE_ROLE,READY FROM PSSYNC_META WHERE ID=1';
    try Q.Open;
    except
      raise Exception.Create('El puente de catalogo no esta preparado en esta base. Revise la instalacion antes de guardar.');
    end;
    if Q.Eof then raise Exception.Create('No existe la configuracion del puente de catalogo.');
    Rol := LowerCase(Trim(Q.FieldByName('NODE_ROLE').AsString));
    if not ((Rol='source') or (Rol='branch')) then
      raise Exception.Create('El rol de esta base no corresponde al puente de catalogo.');
    if Q.FieldByName('READY').AsInteger<>1 then
      raise Exception.Create('La carga inicial del catalogo no ha terminado.');
  finally Q.Free; end;
end;

end.
