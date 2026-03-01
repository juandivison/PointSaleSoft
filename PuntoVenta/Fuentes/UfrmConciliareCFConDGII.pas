unit UfrmConciliareCFConDGII;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, WinSkinData, DB, ExtCtrls;
  
type
  TConcItem = record
    Trn: Integer;
    Fecha: string;
    Ncf: string;
  end;

type
  TConcItemExtra = record
    Trn: Integer;
    Fecha: string;
    Ncf: string;
    SerieEcf:Integer;
    NcfAnt:string;
  end;

type
  TfrmConciliareCFConDGII = class(TForm)
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    SkinData1: TSkinData;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    BitBtn4: TBitBtn;
    lblStatus: TLabel;
    BitBtn5: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    function ExtractTipoECF(const ENCF: string): string;
    Procedure updateSecNCF(ncfant:string;ncfCorrelativo:string;_serie:integer);
  public
    { Public declarations }
  end;

var
  frmConciliareCFConDGII: TfrmConciliareCFConDGII;

implementation

uses UDatModFacturaElectronica,UUtilecf,UGlobal;

{$R *.dfm}


procedure TfrmConciliareCFConDGII.BitBtn2Click(Sender: TObject);
var
  ds: TDataSet;
  items: array of TConcItem;
  i, total: Integer;
  _smg: string;
  canceled: Boolean;
begin
  _smg := '';
  canceled := False;
  ds := dmFactElectronica.qryEcfAconciliar;

  // === 1) SNAPSHOT: copia todo lo que necesitas a memoria ===
  ds.DisableControls;
  try
    ds.Close;
    ds.Open;
    if not ds.Active then
    begin
      ShowMessage('No hay registros para conciliar.');
      Exit;
    end;

    ds.Last; // para tener RecordCount real en algunas conexiones
    total := ds.RecordCount;
    SetLength(items, total);

    ds.First;
    i := 0;
    while not ds.Eof do
    begin
      // Si tu clave TRN es NUMERO:
      if not ds.FieldByName('NUMERO').IsNull then
      begin
        items[i].Trn   := ds.FieldByName('NUMERO').AsInteger;
        items[i].Fecha := ds.FieldByName('FECHA').AsString;
        items[i].Ncf   := ds.FieldByName('NUMERO_NCF').AsString;
        Inc(i);
      end;
      ds.Next;
    end;

    // Ajusta longitud si hubo nulos
    if i <> total then
      SetLength(items, i);

  finally
    ds.EnableControls;
  end;

  // === 2) UI inicial ===
  Memo1.Lines.Clear;
  LogInformacionTxt(PChar(' -Rutina Conciliar eCF- INICIO'));
  ProgressBar1.Position := 0;
  ProgressBar1.Max := Length(items);

  // === 3) PROCESO sobre snapshot (no dependes del dataset) ===
  for i := 0 to High(items) do
  begin
    Application.ProcessMessages;
    if (GetAsyncKeyState(VK_ESCAPE) <> 0) then
    begin
      canceled := True;
      Memo1.Lines.Add('Proceso cancelado por el usuario (ESC).');
      LogInformacionTxt(PChar(' -Rutina Conciliar eCF- CANCELADO POR USUARIO (ESC)'));
      Break;
    end;

    Memo1.Lines.Add(Format('#TRN:%d|%s|%s', [items[i].Trn, items[i].Fecha, items[i].Ncf]));
    LogInformacionTxt(PChar(' -Rutina Conciliar eCF- ' +
      Format('#TRN:%d|%s|%s', [items[i].Trn, items[i].Fecha, items[i].Ncf])));

    // Llamada externa (puede abrir/cerrar datasets en el DataModule sin afectarnos)
    if GlbValidarECF = 1 then
    begin
      if not UUtilecf.EjecutarECF_y_Mostrar(GlbRutaEcf, IntToStr(items[i].Trn), _smg) then
        LogInformacionTxt(PChar(' -Rutina Conciliar eCF- ' + _smg))
      else
      LogInformacionTxt(PChar(' -Rutina Conciliar eCF- ' + _smg));
    end;
    // Pequeño respiro para UI/IO
    Sleep(100);
    Application.ProcessMessages;

    ProgressBar1.StepIt;
    if CheckInternetWithRetries then
    begin
      lblStatus.Caption := 'Estado Internet: CONECTADO';
      lblStatus.Font.Color := clGreen;
    end
    else
    begin
      lblStatus.Caption := 'Estado Internet: DESCONECTADO (Tras 3 intentos)';
      lblStatus.Font.Color := clRed;
      canceled:=True;
    end;
  end;

  if not canceled then
  begin
    Memo1.Lines.Add(' -Rutina Conciliar eCF- Fin');
    LogInformacionTxt(PChar(' -Rutina Conciliar eCF- Fin'));
  end;
end;



procedure TfrmConciliareCFConDGII.BitBtn1Click(Sender: TObject);
begin
  dmFactElectronica.qryEcfAconciliar.Close;
  dmFactElectronica.qryEcfAconciliar.Open;
  dmFactElectronica.qryEcfAconciliar.last;
  if dmFactElectronica.qryEcfAconciliar.Recordcount > 0 then
  begin
    BitBtn2.Enabled:=True;
    Label1.Caption:='Cantidad Ventas: '+IntToStr(dmFactElectronica.qryEcfAconciliar.Recordcount);
    Memo1.Lines.Clear;
    dmFactElectronica.qryEcfAconciliar.first;
    While Not dmFactElectronica.qryEcfAconciliar.eof do
    begin
      Memo1.Lines.Add('#TRN:'+dmFactElectronica.qryEcfAconciliarNUMERO.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarFECHA.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarNUMERO_NCF.AsString);
      LogInformacionTxt(Pchar(' -Rutina Conciliar eCF- '+
      '#TRN:'+dmFactElectronica.qryEcfAconciliarNUMERO.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarFECHA.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarNUMERO_NCF.AsString));
      dmFactElectronica.qryEcfAconciliar.next;
    end;
  end;
end;

procedure TfrmConciliareCFConDGII.BitBtn3Click(Sender: TObject);
var
  ds: TDataSet;
  items: array of TConcItemExtra;
  i, total: Integer;
  _smg: string;
  sTipo: string;
  canceled: Boolean;
begin
  dmFactElectronica.qryListaEcfAVerificar.Close;
  if RadioGroup1.ItemIndex = 0 then
  dmFactElectronica.qryListaEcfAVerificar.Params[0].Value:='PENDIENTE'
  else
  if RadioGroup1.ItemIndex = 0 then
  dmFactElectronica.qryListaEcfAVerificar.Params[0].Value:='RECHAZADO';
  dmFactElectronica.qryListaEcfAVerificar.Open;
    _smg := '';
  canceled := False;
  ds := dmFactElectronica.qryListaEcfAVerificar;

  // === 1) SNAPSHOT: copia todo lo que necesitas a memoria ===
  ds.DisableControls;
  try
    ds.Close;
    ds.Open;
    if not ds.Active then
    begin
      ShowMessage('No hay registros para conciliar.');
      Exit;
    end;

    ds.Last; // para tener RecordCount real en algunas conexiones
    total := ds.RecordCount;
    SetLength(items, total);

    ds.First;
    i := 0;
    while not ds.Eof do
    begin
      // Si tu clave TRN es NUMERO:
      if not ds.FieldByName('NUMERO').IsNull then
      begin
        items[i].Trn   := ds.FieldByName('NUMERO').AsInteger;
        items[i].Fecha := ds.FieldByName('FECHA').AsString;
        items[i].Ncf   := ds.FieldByName('NUMERO_NCF').AsString;
        items[i].SerieEcf:=ds.FieldByName('SERIE_ECF_ASIGNADO').AsInteger;
        items[i].NcfAnt  :=ds.FieldByName('NCF_ANTERIOR').AsString;
        Inc(i);
      end;
      ds.Next;
    end;

    // Ajusta longitud si hubo nulos
    if i <> total then
      SetLength(items, i);

  finally
    ds.EnableControls;
  end;

  // === 2) UI inicial ===
  Memo1.Lines.Clear;
  LogInformacionTxt(PChar(' -Rutina Conciliar eCF- INICIO'));
  ProgressBar1.Position := 0;
  ProgressBar1.Max := Length(items);

  // === 3) PROCESO sobre snapshot (no dependes del dataset) ===
  for i := 0 to High(items) do
  begin
    Application.ProcessMessages;
    if (GetAsyncKeyState(VK_ESCAPE) <> 0) then
    begin
      canceled := True;
      Memo1.Lines.Add('Proceso cancelado por el usuario (ESC).');
      LogInformacionTxt(PChar(' -Rutina Conciliar eCF- CANCELADO POR USUARIO (ESC)'));
      Break;
    end;
    sTipo := frmConciliareCFConDGII.ExtractTipoECF(items[i].NcfAnt);
    dmFactElectronica.qrySecEcf.Close;
    dmFactElectronica.qrySecEcf.Params[0].AsSTring:= sTipo;
    dmFactElectronica.qrySecEcf.Open;

    Memo1.Lines.Add(Format('#TRN:%d|%s|%s|NuevaSec|%s', [items[i].Trn, items[i].Fecha, items[i].Ncf,
    dmFactElectronica.qrySecEcfECFNUM.AsVariant]));
    LogInformacionTxt(PChar(' -Rutina Conciliar eCF- ' +
      Format('#TRN:%d|%s|%s', [items[i].Trn, items[i].Fecha, items[i].Ncf])));


    updateSecNCF(items[i].NcfAnt,dmFactElectronica.qrySecEcfECFNUM.AsString,items[i].SerieEcf);
    if not UUtilecf.EjecutarECF_CLI( GlbRutaEcf, IntToStr(items[i].Trn), items[i].NcfAnt, _smg) then
    LogInformacionTxt(PChar('Resend fallo: ' + _smg))
    else
    LogInformacionTxt(PChar('Resend OK: ' + _smg));

    // Llamada externa (puede abrir/cerrar datasets en el DataModule sin afectarnos)
    //if not UUtilecf.EjecutarECF_y_Mostrar(GlbRutaEcf, IntToStr(items[i].Trn), _smg) then
    //  LogInformacionTxt(PChar(' -Rutina Conciliar eCF- ' + _smg))
    //else
    //  LogInformacionTxt(PChar(' -Rutina Conciliar eCF- ' + _smg));

    // Pequeño respiro para UI/IO
    Sleep(100);
    Application.ProcessMessages;

    ProgressBar1.StepIt;
  end;

  if not canceled then
  begin
    Memo1.Lines.Add(' -Rutina Conciliar eCF- Fin');
    LogInformacionTxt(PChar(' -Rutina Conciliar eCF- Fin'));
  end;
end;

function tfrmConciliareCFConDGII.ExtractTipoECF(const ENCF: string): string;
var
  s: string;
begin
  s := Trim(UpperCase(ENCF));
  if Length(s) >= 3 then
  begin
    s := Copy(s, 1, 3);      // "E31","E32",...
    if s[1] = 'E' then
      Delete(s, 1, 1);       // "31","32"
  end
  else
    s := '';
  Result := s;
end;

//Asignar el valor correcto a dmFactElectronica.tblCambiarNCFNUMERO_NCF.Value:=
//Ejemplo si ncfant= 320000000244, dmFactElectronica.tblCambiarNCFNUMERO_NCF.Value
//será igual a 320000000280 suponiendo que dmFactElectronica.qrySecEcfECFNUM.Value es igual a 280;


// Helper: devuelve el string 'head' (parte fija) y la longitud de la cola numérica
procedure SplitHeadAndNumericTail(const S: string; out Head: string; out TailLen: Integer);
var
  i: Integer;
begin
  TailLen := 0;
  // Recorre desde el final contando dígitos consecutivos
  for i := Length(S) downto 1 do
  begin
    if (S[i] in ['0'..'9']) then
      Inc(TailLen)
    else
      Break;
  end;

  if TailLen > 0 then
    Head := Copy(S, 1, Length(S) - TailLen)
  else
  begin
    Head := S;
    TailLen := 0;
  end;
end;

// Helper: formatea un entero con ceros a la izquierda a un ancho determinado
function PadLeftZeros(const N: Integer; const Width: Integer): string;
var
  tmp: string;
begin
  tmp := IntToStr(N);
  while Length(tmp) < Width do
    tmp := '0' + tmp;
  Result := tmp;
end;

// Extrae "tipo" para parametrizar la consulta (por ejemplo de "E320000..." -> "32"; de "320000..." -> "32")
{function ExtractTipoECF(const ENCF: string): string;
var
  s: string;
begin
  s := Trim(UpperCase(ENCF));
  if (Length(s) >= 3) and (s[1] = 'E') then
    Result := Copy(s, 2, 2)           // "E32..." -> "32"
  else if Length(s) >= 2 then
    Result := Copy(s, 1, 2)           // "32..."  -> "32"
  else
    Result := '';
end;   }



procedure TfrmConciliareCFConDGII.BitBtn4Click(Sender: TObject);
begin
  dmFactElectronica.qryListaEcfAVerificar.Close;
  if RadioGroup1.ItemIndex = 0 then
  dmFactElectronica.qryListaEcfAVerificar.Params[0].Value:='PENDIENTE'
  else
  if RadioGroup1.ItemIndex = 0 then
  dmFactElectronica.qryListaEcfAVerificar.Params[0].Value:='RECHAZADO';
  dmFactElectronica.qryListaEcfAVerificar.Open;
  dmFactElectronica.qryListaEcfAVerificar.Last;
  BitBtn2.Enabled:=True; 
  Label1.Caption:='Cantidad Ventas: '+IntToStr(dmFactElectronica.qryListaEcfAVerificar.Recordcount);

  dmFactElectronica.qryListaEcfAVerificar.First;
  While Not dmFactElectronica.qryListaEcfAVerificar.eof do
  begin
      Memo1.Lines.Add('#TRN:'+dmFactElectronica.qryListaEcfAVerificarNUMERO.AsString+
      '|FECHA:'+dmFactElectronica.qryListaEcfAVerificarFECHA.AsString+
      '|NCF_ACTUAL:'+dmFactElectronica.qryListaEcfAVerificarNUMERO_NCF.AsString+
      '|NCF_ANTERIOR:'+dmFactElectronica.qryListaEcfAVerificarNCF_ANTERIOR.AsString);
      LogInformacionTxt(Pchar(' -Rutina Conciliar eCF- '+
      '#TRN:'+dmFactElectronica.qryListaEcfAVerificarNUMERO.AsString+
      '|'+dmFactElectronica.qryListaEcfAVerificarFECHA.AsString+
      '|'+dmFactElectronica.qryListaEcfAVerificarNUMERO_NCF.AsString));
      dmFactElectronica.qryListaEcfAVerificar.next;
  end;

  BitBtn3.Enabled:=True;
end;

procedure TfrmConciliareCFConDGII.FormCreate(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

// Procedimiento principal solicitado
procedure TfrmConciliareCFConDGII.updateSecNCF(ncfant,
  ncfCorrelativo: string;_serie:integer);
var
  sTipo, head: string;
  tailLen: Integer;
  newSeq: Integer;
  newTail, newNCF: string;
begin

  // 1) Obtener el "tipo" (32, 31, 33, 34, 45, etc.) desde el NCF anterior
  sTipo := frmConciliareCFConDGII.ExtractTipoECF(ncfAnt);
  dmFactElectronica.qrySecEcf.Close;
  dmFactElectronica.qrySecEcf.Params[0].AsInteger := StrToIntDef(sTipo, 0);
  dmFactElectronica.qrySecEcf.Open;

  // 2) Determinar el nuevo correlativo:
  //    - Si te pasaron ncfCorrelativo (string) lo usamos con prioridad.
  //    - Si viene vacío, tomamos el valor del dataset (ECFNUM).
  if Trim(ncfCorrelativo) <> '' then
    newSeq := StrToIntDef(ncfCorrelativo, 0)
  else
    newSeq := dmFactElectronica.qrySecEcfECFNUM.AsInteger;

  // 3) Separar el NCF anterior en "head" + "cola numérica"
  SplitHeadAndNumericTail(ncfAnt, head, tailLen);

  // 4) Construir la nueva cola con el mismo ancho de dígitos que la anterior (relleno con ceros)
  if tailLen <= 0 then
  begin
    // Si por alguna razón el NCF no termina en dígitos, asumimos 3 dígitos por defecto
    tailLen := 3;
  end;
  newTail := PadLeftZeros(newSeq, tailLen);

  // 5) Recombinar
  newNCF := head + newTail;

  // 6) Asignar el valor final al campo
  dmFactElectronica.tblCambiarNCF.close;
  dmFactElectronica.tblCambiarNCF.params[0].value:=_serie;
  dmFactElectronica.tblCambiarNCF.Open;
  dmFactElectronica.tblCambiarNCF.First;
  if dmFactElectronica.tblCambiarNCFSERIE.IsNull then exit;
  
  dmFactElectronica.tblCambiarNCF.Edit;
  try
    dmFactElectronica.tblCambiarNCF.Edit;
    dmFactElectronica.tblCambiarNCFNUMERO_NCF.AsString := 'E'+newNCF;
    GlbSalvarQuery(dmFactElectronica.tblCambiarNCF);
    dmFactElectronica.tblUpdateNCF.Close;
    dmFactElectronica.tblUpdateNCF.Params[0].Value:=sTipo;
    dmFactElectronica.tblUpdateNCF.Open;
    dmFactElectronica.tblUpdateNCF.Edit;
    dmFactElectronica.tblUpdateNCFNCF.AsInteger:= StrToInt(ncfCorrelativo);
    GlbSalvarQuery(dmFactElectronica.tblUpdateNCF);

  except
    dmFactElectronica.tblCambiarNCF.Cancel;
    raise;
  end;

end;

procedure TfrmConciliareCFConDGII.BitBtn5Click(Sender: TObject);
var
  ds: TDataSet;
  items: array of TConcItem;
  i, total: Integer;
  _smg: string;
  canceled: Boolean;
begin                     
  dmFactElectronica.qryEcfAconciliar.close;
  dmFactElectronica.qryEcfAconciliarQRXML.Close;
  dmFactElectronica.qryEcfAconciliarQRXML.Open;
  dmFactElectronica.qryEcfAconciliarQRXML.last;
  if dmFactElectronica.qryEcfAconciliarQRXML.Recordcount > 0 then
  begin
    //BitBtn2.Enabled:=True;
    Label1.Caption:='Cantidad Ventas: '+IntToStr(dmFactElectronica.qryEcfAconciliarQRXML.Recordcount);
    Memo1.Lines.Clear;
    dmFactElectronica.qryEcfAconciliarQRXML.first;
    While Not dmFactElectronica.qryEcfAconciliarQRXML.eof do
    begin
      Memo1.Lines.Add('#TRN:'+dmFactElectronica.qryEcfAconciliarQRXMLNUMERO.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarQRXMLFECHA.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarQRXMLNUMERO_NCF.AsString);
      LogInformacionTxt(Pchar(' -Rutina Descargar QR y XML Firmado- '+
      '#TRN:'+dmFactElectronica.qryEcfAconciliarQRXMLNUMERO.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarQRXMLFECHA.AsString+
      '|'+dmFactElectronica.qryEcfAconciliarQRXMLNUMERO_NCF.AsString));
      dmFactElectronica.qryEcfAconciliarQRXML.next;
    end;
  end;
  if RadioGroup1.ItemIndex < 2 then
  exit;

  _smg := '';
  canceled := False;
  ds := dmFactElectronica.qryEcfAconciliarQRXML;

  // === 1) SNAPSHOT: copia todo lo que necesitas a memoria ===
  ds.DisableControls;
  try
    ds.Close;
    ds.Open;
    if not ds.Active then
    begin
      ShowMessage('No hay registros para conciliar.');
      Exit;
    end;

    ds.Last; // para tener RecordCount real en algunas conexiones
    total := ds.RecordCount;
    SetLength(items, total);

    ds.First;
    i := 0;
    while not ds.Eof do
    begin
      // Si tu clave TRN es NUMERO:
      if not ds.FieldByName('NUMERO').IsNull then
      begin
        if (Trim(ds.FieldByName('NUMERO_NCF').AsString) = '') or
         (Length(ds.FieldByName('NUMERO_NCF').AsString) < 13) then
        begin
         ds.Next; 
         continue;
        end;
        items[i].Trn   := ds.FieldByName('NUMERO').AsInteger;
        items[i].Fecha := ds.FieldByName('FECHA').AsString;
        items[i].Ncf   := ds.FieldByName('NUMERO_NCF').AsString;
        Inc(i);
      end;
      ds.Next;
    end;

    // Ajusta longitud si hubo nulos
    if i <> total then
      SetLength(items, i);

  finally
    ds.EnableControls;
  end;

  // === 2) UI inicial ===
  Memo1.Lines.Clear;
  LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado- INICIO'));
  ProgressBar1.Position := 0;
  ProgressBar1.Max := Length(items);

  // === 3) PROCESO sobre snapshot (no dependes del dataset) ===
  for i := 0 to High(items) do
  begin
    Application.ProcessMessages;
    if (GetAsyncKeyState(VK_ESCAPE) <> 0) then
    begin
      canceled := True;
      Memo1.Lines.Add('Proceso cancelado por el usuario (ESC).');
      LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado- CANCELADO POR USUARIO (ESC)'));
      Break;
    end;

    if GlbValidarECF = 0 then
    Memo1.Lines.Add(Format('#TRN:%d|%s|%s|GlbValidarECF=0', [items[i].Trn, items[i].Fecha, items[i].Ncf]))
    else
    Memo1.Lines.Add(Format('#TRN:%d|%s|%s', [items[i].Trn, items[i].Fecha, items[i].Ncf]));
    LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado- ' +
      Format('#TRN:%d|%s|%s', [items[i].Trn, items[i].Fecha, items[i].Ncf])));

    // Llamada externa (puede abrir/cerrar datasets en el DataModule sin afectarnos)
    if GlbValidarECF = 1 then
    begin
      if not UUtilecf.EjecutarECF_DownQRXML(GlbRutaEcf, items[i].Ncf, _smg) then
        LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado- ' + _smg))
      else
      LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado- ' + _smg));
    end;
    // Pequeño respiro para UI/IO
    Sleep(100);
    Application.ProcessMessages;

    ProgressBar1.StepIt;
    if CheckInternetWithRetries then
    begin
      lblStatus.Caption := 'Estado Internet: CONECTADO';
      lblStatus.Font.Color := clGreen;
    end
    else
    begin
      lblStatus.Caption := 'Estado Internet: DESCONECTADO (Tras 3 intentos)';
      lblStatus.Font.Color := clRed;
      canceled:=True;
    end;
  end;

  if not canceled then
  begin
    Memo1.Lines.Add(' -Rutina Descargar QR y XML Firmado eCF- Fin');
    LogInformacionTxt(PChar(' -Rutina Descargar QR y XML Firmado eCF- Fin'));
  end;
end;

end.
