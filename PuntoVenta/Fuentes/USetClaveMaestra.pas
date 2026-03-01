unit USetClaveMaestra;

interface

 Uses Forms,Dbtables, db, Sysutils, windows, Dialogs, Controls,Printers,Classes,
    ShellApi, DateUtils, Messages, Graphics,IniFiles, Variants,
    StrUtils,ExtCtrls,  Shlobj,
    Math, StdCtrls, Registry, comObj, ComCtrls;

     const
    {C1 y C2 are used for encryption of Master Password string}
    {C1 y C2 aon usadas para encriptar la cadena de la clave}
        C1 = 52845;
        C2 = 11719;

type
  TfrmConfClaveMaestra = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    btnDesencriptar: TButton;
    Edit3: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure btnDesencriptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Desencriptar(const S: String; Key: Int64): String;
    function Encriptar(const S: String; Key: Int64): String;
    function Convertir : string;
    function DesencriptarHex(const Hex: AnsiString;
      Key: Longword): AnsiString;
    function DesencriptarRaw(const S: AnsiString;
      Key: Longword): AnsiString;
    function EncriptarHex(const S: AnsiString; Key: Longword): AnsiString;
    function EncriptarRaw(const S: AnsiString; Key: Longword): AnsiString;
    
  end;

var
  frmConfClaveMaestra: TfrmConfClaveMaestra;

implementation

{$R *.dfm}

procedure TfrmConfClaveMaestra.Button1Click(Sender: TObject);
begin
  //edit2.Text := Convertir;
  // guardar
  edit2.Text := EncriptarHex(Trim(Edit1.Text), 2005);
end;

//C1 = 52845;
//C2 = 11719;
function TfrmConfClaveMaestra.Encriptar(const S: String; Key: Int64): String;
var
  I: Integer;
begin
  SetLength(Result, Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := Char(Byte(S[I]) xor ((Key shr 8) and $FF));
    Key := ((Byte(Result[I]) + Key) * C1 + C2) mod $7FFFFFFF;
  end;
end;

function TfrmConfClaveMaestra.Desencriptar(const S: String; Key: Int64): String;//Word
var
  I: byte;
begin
  if (s = '') then result:='';
  SetLength(Result,Length(S));
  for I := 1 to Length(S) do
  begin
    Result[I] := char(byte(S[I]) xor (Key shr 8));
    Key := (byte(S[I]) + Key) * C1 + C2;
  end;
end;

function TfrmConfClaveMaestra.Convertir: string;
var
  valor : string;
begin
  result:= Encriptar(Trim(Edit1.Text),2005);
end;

procedure TfrmConfClaveMaestra.btnDesencriptarClick(Sender: TObject);
begin
   //edit3.Text := Desencriptar(edit2.Text,2005);
   Edit3.Text := DesencriptarHex(edit2.Text, 2005);
end;
function TfrmConfClaveMaestra.EncriptarRaw(const S: AnsiString; Key: Longword): AnsiString;
var
  i: Integer;
  b: Byte;
  k: Int64;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;

  SetLength(Result, Length(S));

  for i := 1 to Length(S) do
  begin
    b := Byte(S[i]) xor Byte((Key shr 8) and $FF);
    Result[i] := AnsiChar(b);

    k := Int64(b) + Int64(Key);
    k := (k * Int64(C1) + Int64(C2)) mod $7FFFFFFF;
    Key := Longword(k);
  end;
end;

function TfrmConfClaveMaestra.DesencriptarRaw(const S: AnsiString; Key: Longword): AnsiString;
var
  i: Integer;
  bCipher, bPlain: Byte;
  k: Int64;
begin
  if S = '' then
  begin
    Result := '';
    Exit;
  end;

  SetLength(Result, Length(S));

  for i := 1 to Length(S) do
  begin
    bCipher := Byte(S[i]);
    bPlain  := bCipher xor Byte((Key shr 8) and $FF);
    Result[i] := AnsiChar(bPlain);

    k := Int64(bCipher) + Int64(Key);
    k := (k * Int64(C1) + Int64(C2)) mod $7FFFFFFF;
    Key := Longword(k);
  end;
end;

function TfrmConfClaveMaestra.EncriptarHex(const S: AnsiString; Key: Longword): AnsiString;
var
  raw: AnsiString;
begin
  raw := EncriptarRaw(S, Key);
  if raw = '' then
  begin
    Result := '';
    Exit;
  end;

  SetLength(Result, Length(raw) * 2);
  BinToHex(PAnsiChar(raw), PAnsiChar(Result), Length(raw)); // ASCII puro
  Result := UpperCase(Result);
end;

function TfrmConfClaveMaestra.DesencriptarHex(const Hex: AnsiString; Key: Longword): AnsiString;
var
  raw: AnsiString;
  rawLen: Integer;
begin
  if Hex = '' then
  begin
    Result := '';
    Exit;
  end;

  if (Length(Hex) and 1) <> 0 then
    raise Exception.Create('Hex inválido (longitud impar).');

  rawLen := Length(Hex) div 2;
  SetLength(raw, rawLen);

  if HexToBin(PAnsiChar(Hex), PAnsiChar(raw), rawLen) <> rawLen then
    raise Exception.Create('Hex inválido (caracteres no hex).');

  Result := DesencriptarRaw(raw, Key);
end;

end.
