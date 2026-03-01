unit UFrmFpDeviceInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, ActiveX;

type
  TFrmFpDeviceInfo = class(TForm)
    lblSdk: TLabel;
    lbSdkReaders: TListBox;
    lblWmi: TLabel;
    lbWmiDevices: TListBox;
    memoInfo: TMemo;
    btnRefresh: TButton;
    btnClose: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure lbSdkReadersClick(Sender: TObject);
    procedure lbWmiDevicesClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    FReaderItems: array of OleVariant;
    FWmiItems: array of OleVariant;
    procedure Log(const S: string);
    procedure RefreshAll;
    procedure CheckComAvailability;
    procedure LoadSdkReaders;
    procedure LoadWmiDevices;
    procedure DumpSdkReader(const R: OleVariant);
    procedure DumpWmiDevice(const D: OleVariant);
    procedure DumpDispatchPropertyGetters(const Title: string; const V: OleVariant);
  public
  end;

procedure ShowFingerprintDeviceInfo(AOwner: TComponent);

implementation

{$R *.dfm}

procedure ShowFingerprintDeviceInfo(AOwner: TComponent);
var
  F: TFrmFpDeviceInfo;
begin
  F := TFrmFpDeviceInfo.Create(AOwner);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TFrmFpDeviceInfo.Log(const S: string);
begin
  memoInfo.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' | ' + S);
end;

procedure TFrmFpDeviceInfo.FormShow(Sender: TObject);
begin
  Caption := 'Info del lector de huellas (DigitalPersona / Windows)';
  RefreshAll;
end;

procedure TFrmFpDeviceInfo.btnRefreshClick(Sender: TObject);
begin
  RefreshAll;
end;

procedure TFrmFpDeviceInfo.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmFpDeviceInfo.lbSdkReadersClick(Sender: TObject);
var
  idx: Integer;
begin
  idx := lbSdkReaders.ItemIndex;
  if (idx < 0) or (idx > High(FReaderItems)) then Exit;
  DumpSdkReader(FReaderItems[idx]);
end;

procedure TFrmFpDeviceInfo.lbWmiDevicesClick(Sender: TObject);
var
  idx: Integer;
begin
  idx := lbWmiDevices.ItemIndex;
  if (idx < 0) or (idx > High(FWmiItems)) then Exit;
  DumpWmiDevice(FWmiItems[idx]);
end;

procedure TFrmFpDeviceInfo.RefreshAll;
begin
  Screen.Cursor := crHourGlass;
  try
    memoInfo.Clear;
    lbSdkReaders.Items.Clear;
    lbWmiDevices.Items.Clear;
    SetLength(FReaderItems, 0);
    SetLength(FWmiItems, 0);

    CheckComAvailability;
    LoadSdkReaders;
    LoadWmiDevices;

    if lbSdkReaders.Items.Count > 0 then
    begin
      lbSdkReaders.ItemIndex := 0;
      DumpSdkReader(FReaderItems[0]);
    end;

    if lbWmiDevices.Items.Count > 0 then
    begin
      lbWmiDevices.ItemIndex := 0;
      DumpWmiDevice(FWmiItems[0]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmFpDeviceInfo.CheckComAvailability;
  function CanCreate(const ProgId: string): Boolean;
  var V: OleVariant;
  begin
    Result := False;
    try
      V := CreateOleObject(ProgId);
      Result := True;
    except
      Result := False;
    end;
  end;
begin
  Log('--- COM Availability ---');
  Log('DPFPShrX.DPFPTemplate: ' + BoolToStr(CanCreate('DPFPShrX.DPFPTemplate') or CanCreate('DPFPShrX.DPFPTemplate.1'), True));
  Log('DPFPEngX.DPFPVerification: ' + BoolToStr(CanCreate('DPFPEngX.DPFPVerification') or CanCreate('DPFPEngX.DPFPVerification.1'), True));
  Log('DPFPDevX (enumeracion de lectores): ' + BoolToStr(
        CanCreate('DPFPDevX.DPFPReadersCollection') or
        CanCreate('DPFPDevX.DPFPReaders') or
        CanCreate('DPFPDevX.DPFPReaders.1'), True));
  Log('WMI (WbemScripting.SWbemLocator): ' + BoolToStr(CanCreate('WbemScripting.SWbemLocator'), True));
end;

procedure TFrmFpDeviceInfo.LoadSdkReaders;
  function TryCreateOleObject(const ProgIds: array of string; out Obj: OleVariant): Boolean;
  var i: Integer;
  begin
    Result := False;
    Obj := Unassigned;
    for i := Low(ProgIds) to High(ProgIds) do
    begin
      try
        Obj := CreateOleObject(ProgIds[i]);
        Result := True;
        Exit;
      except
      end;
    end;
  end;

  function GetCountSafe(const Obj: OleVariant): Integer;
  begin
    Result := -1;
    try Result := Integer(Obj.Count); Exit; except end;
    try Result := Integer(Obj.Length); Exit; except end;
  end;

  function GetItemSafe(const Obj: OleVariant; Index0: Integer): OleVariant;
  begin
    Result := Unassigned;
    try Result := Obj.Item(Index0); Exit; except end;
    try Result := Obj.Items(Index0); Exit; except end;
    try Result := Obj.Reader(Index0); Exit; except end;
    { try Result := Obj(Index0); Exit; except end; } // removed: Delphi parser error
    try Result := Obj[Index0]; Exit; except end;
  end;

  function BestName(const R: OleVariant): string;
  begin
    Result := '';
    try Result := VarToStr(R.ProductName); except end;
    if Result = '' then try Result := VarToStr(R.Description); except end;
    if Result = '' then try Result := VarToStr(R.Name); except end;
    if Result = '' then try Result := VarToStr(R.ReaderName); except end;
    if Result = '' then try Result := VarToStr(R.SerialNumber); except end;
    if Result = '' then Result := '<Reader>';
  end;

var
  Readers: OleVariant;
  C, i: Integer;
  R: OleVariant;
  display: string;
begin
  Log('--- DigitalPersona SDK / DPFPDevX ---');

  if not TryCreateOleObject(
      ['DPFPDevX.DPFPReadersCollection','DPFPDevX.DPFPReaders','DPFPDevX.DPFPReaders.1'],
      Readers) then
  begin
    Log('DPFPDevX no disponible (no se pudo crear ReadersCollection/Readers).');
    Exit;
  end;

  C := GetCountSafe(Readers);
  if C < 0 then
  begin
    Log('No se pudo leer Count del objeto Readers. (API/SDK distinto).');
    Exit;
  end;

  if C = 0 then
  begin
    Log('No hay lectores detectados por DPFPDevX.');
    Exit;
  end;

  SetLength(FReaderItems, C);
  for i := 0 to C - 1 do
  begin
    R := GetItemSafe(Readers, i);
    FReaderItems[i] := R;
    display := IntToStr(i+1) + ') ' + BestName(R);
    lbSdkReaders.Items.Add(display);
  end;

  Log('Lectores detectados (DPFPDevX): ' + IntToStr(C));
end;


procedure TFrmFpDeviceInfo.DumpDispatchPropertyGetters(const Title: string; const V: OleVariant);
var
  Disp: IDispatch;
  TI: ITypeInfo;
  TA: PTypeAttr;
  FD: PFuncDesc;
  NameW: WideString;
  Res: OleVariant;
  DP: TDispParams;
  Ex: TExcepInfo;
  ArgErr: Integer;
  Cnt: Integer;
  i: Integer;
  s: string;
begin
  try
    Disp := IDispatch(V);
  except
    Exit;
  end;

  if Disp = nil then Exit;

  try
    OleCheck(Disp.GetTypeInfoCount(Cnt));
    if Cnt = 0 then
    begin
      Log('TypeInfo no disponible para ' + Title + ' (GetTypeInfoCount=0).');
      Exit;
    end;

    OleCheck(Disp.GetTypeInfo(0, 0, TI));
    if TI = nil then Exit;

    OleCheck(TI.GetTypeAttr(TA));
    try
      Log('--- ' + Title + ' (TypeInfo dump) ---');

      for i := 0 to TA.cFuncs - 1 do
      begin
        TI.GetFuncDesc(i, FD);
        try
          if (FD.invkind = INVOKE_PROPERTYGET) and (FD.cParams = 0) then
          begin
            NameW := '';
            try
              TI.GetDocumentation(FD.memid, @NameW, nil, nil, nil);
            except
              NameW := '';
            end;

            if NameW = '' then
              Continue;

            FillChar(DP, SizeOf(DP), 0);
            FillChar(Ex, SizeOf(Ex), 0);
            Res := Null;
            ArgErr := 0;

            try
              Disp.Invoke(FD.memid, GUID_NULL, LOCALE_SYSTEM_DEFAULT, DISPATCH_PROPERTYGET, DP, @Res, @Ex, @ArgErr);

              if VarIsEmpty(Res) or VarIsNull(Res) then
                Continue;

              // Mostrar valores simples; si es objeto, se marca
              if VarType(Res) = varDispatch then
                s := '<object>'
              else
                s := VarToStr(Res);

              if s <> '' then
                Log(string(NameW) + ': ' + s);
            except
              // ignora propiedades que fallen
            end;
          end;
        finally
          try TI.ReleaseFuncDesc(FD); except end;
        end;
      end;
    finally
      try TI.ReleaseTypeAttr(TA); except end;
    end;
  except
    on E: Exception do
      Log('TypeInfo dump error (' + Title + '): ' + E.Message);
  end;
end;

procedure TFrmFpDeviceInfo.DumpSdkReader(const R: OleVariant);
  procedure AddKV(const K: string; const V: OleVariant);
  var s: string;
  begin
    try
      s := VarToStr(V);
      if s <> '' then Log(K + ': ' + s);
    except
    end;
  end;
begin
  Log('--- Reader (DPFPDevX) details ---');
  try Log('VarType: ' + IntToStr(VarType(R))); except end;
  try Log('AsString: ' + VarToStr(R)); except end;
  AddKV('Name', R.Name);
  AddKV('ReaderName', R.ReaderName);
  AddKV('Description', R.Description);
  AddKV('ProductName', R.ProductName);
  AddKV('Vendor', R.Vendor);
  AddKV('VendorName', R.VendorName);
  AddKV('Manufacturer', R.Manufacturer);
  AddKV('SerialNumber', R.SerialNumber);
  AddKV('ReaderSerialNumber', R.ReaderSerialNumber);
  AddKV('DeviceID', R.DeviceID);
  AddKV('DeviceName', R.DeviceName);
  AddKV('Status', R.Status);
  AddKV('State', R.State);
  AddKV('IsConnected', R.IsConnected);
  AddKV('Connected', R.Connected);
  AddKV('Online', R.Online);
  AddKV('Capabilities', R.Capabilities);
  AddKV('Technology', R.Technology);
  DumpDispatchPropertyGetters('Reader', R);

end;

procedure TFrmFpDeviceInfo.LoadWmiDevices;
var
  Locator, Svc, Items: OleVariant;
  Enum: IEnumVariant;
  Item: OleVariant;
  Fetched: LongWord;
  query: string;
  name, manu, status: string;
  idx: Integer;
begin
  Log('--- Windows / WMI PnP ---');
  try
    Locator := CreateOleObject('WbemScripting.SWbemLocator');
    Svc := Locator.ConnectServer('.', 'root\cimv2');

    query :=
      'SELECT Name, Manufacturer, Status, PNPDeviceID FROM Win32_PnPEntity ' +
      'WHERE Name LIKE ''%Fingerprint%'' OR Name LIKE ''%DigitalPersona%'' ' +
      'OR Manufacturer LIKE ''%DigitalPersona%'' OR Name LIKE ''%U.are.U%''';
    Items := Svc.ExecQuery(query);

    Enum := IUnknown(Items._NewEnum) as IEnumVariant;
    idx := 0;
    while Enum.Next(1, Item, Fetched) = S_OK do
    begin
      name := ''; manu := ''; status := '';
      try name := VarToStr(Item.Name); except end;
      try manu := VarToStr(Item.Manufacturer); except end;
      try status := VarToStr(Item.Status); except end;

      if name = '' then
        name := '<Device>';

      SetLength(FWmiItems, idx + 1);
      FWmiItems[idx] := Item;
      lbWmiDevices.Items.Add(IntToStr(idx+1) + ') ' + name + ' | ' + manu + ' | ' + status);
      Inc(idx);
    end;

    Log('Dispositivos encontrados (WMI): ' + IntToStr(idx));
  except
    on E: Exception do
      Log('WMI error: ' + E.Message);
  end;
end;

procedure TFrmFpDeviceInfo.DumpWmiDevice(const D: OleVariant);
  procedure AddKV(const K: string; const V: OleVariant);
  var s: string;
  begin
    try
      s := VarToStr(V);
      if s <> '' then Log(K + ': ' + s);
    except
    end;
  end;
begin
  Log('--- Device (WMI) details ---');
  AddKV('Name', D.Name);
  AddKV('Manufacturer', D.Manufacturer);
  AddKV('Status', D.Status);
  AddKV('PNPDeviceID', D.PNPDeviceID);
  AddKV('ClassGuid', D.ClassGuid);
  AddKV('Service', D.Service);
  AddKV('ConfigManagerErrorCode', D.ConfigManagerErrorCode);
end;

end.