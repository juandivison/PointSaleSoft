unit UFingerprintTaskAuth;

interface

uses
  Windows, SysUtils, Classes, Variants, ComObj, Forms, Controls, StdCtrls, DB,
  DPFPCtlXLib_TLB;

type
  TFpCandidate = record
    CodUsuario: Integer;
    TemplateBytes: OleVariant; // varByte[] listo para Deserialize
  end;

function AutorizarTareaPorHuella(
  const TaskCode: string;
  QryCandidatos: TDataSet;      // debe estar OPEN y ya filtrado por TaskCode
  out CodUsuario: Integer;
  out FAR: Integer
): Boolean;

implementation

function TryCreateOleObject(const ProgIds: array of string; out Obj: OleVariant): Boolean;
var
  i: Integer;
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
      // intenta siguiente
    end;
  end;
end;

function BlobFieldToVarBytes(B: TBlobField): OleVariant;
var
  MS: TMemoryStream;
  P: Pointer;
begin
  Result := VarArrayCreate([0, -1], varByte);
  if (B = nil) or B.IsNull then Exit;

  MS := TMemoryStream.Create;
  try
    B.SaveToStream(MS);
    if MS.Size <= 0 then Exit;

    Result := VarArrayCreate([0, MS.Size - 1], varByte);
    P := VarArrayLock(Result);
    try
      Move(MS.Memory^, P^, MS.Size);
    finally
      VarArrayUnlock(Result);
    end;
  finally
    MS.Free;
  end;
end;

type
  TFpVerifyForm = class(TForm)
  private
    lbl: TLabel;
    btnCancel: TButton;
    VerCtl: TDPFPVerificationControl;

    FCandidates: array of TFpCandidate;
    FMatchedUser: Integer;
    FMatchedFar: Integer;

    FVerifier: OleVariant; // DPFPEngX.DPFPVerification
    procedure BtnCancelClick(Sender: TObject);
    procedure VerCtlComplete(Sender: TObject; const pFeatureSet, pStatus: IDispatch);

  public
    constructor CreateVerify(AOwner: TComponent; const Candidates: array of TFpCandidate);
    function Execute(out CodUsuario: Integer; out FAR: Integer): Boolean;
  end;

constructor TFpVerifyForm.CreateVerify(AOwner: TComponent; const Candidates: array of TFpCandidate);
var
  i: Integer;
begin
  inherited CreateNew(AOwner);
  BorderStyle := bsDialog;
  Position := poScreenCenter;
  Caption := 'Autorización por huella';
  Width := 420;
  Height := 160;

  lbl := TLabel.Create(Self);
  lbl.Parent := Self;
  lbl.Left := 12;
  lbl.Top := 16;
  lbl.Width := 390;
  lbl.Caption := 'Coloque el dedo en el lector para autorizar la operación...';

  btnCancel := TButton.Create(Self);
  btnCancel.Parent := Self;
  btnCancel.Caption := 'Cancelar';
  btnCancel.Left := Width - 110;
  btnCancel.Top := Height - 70;
  btnCancel.Width := 90;
  btnCancel.OnClick := BtnCancelClick;

  VerCtl := TDPFPVerificationControl.Create(Self);
  VerCtl.Parent := Self;
  VerCtl.Left := 0;
  VerCtl.Top := 0;
  VerCtl.Width := 1;
  VerCtl.Height := 1;
  VerCtl.Visible := True;
  VerCtl.OnComplete := VerCtlComplete;

  SetLength(FCandidates, Length(Candidates));
  for i := 0 to High(Candidates) do
    FCandidates[i] := Candidates[i];

  FMatchedUser := 0;
  FMatchedFar := 0;

  if not TryCreateOleObject(['DPFPEngX.DPFPVerification', 'DPFPEngX.DPFPVerification.1'], FVerifier) then
    raise Exception.Create('No se pudo crear DPFPEngX.DPFPVerification. Verifique instalación/registro COM de DigitalPersona (x86).');
end;

procedure TFpVerifyForm.BtnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFpVerifyForm.VerCtlComplete(Sender: TObject; const pFeatureSet, pStatus: IDispatch);
var
  St: IDPFPEventHandlerStatus;
  Tmpl: OleVariant; // DPFPShrX.DPFPTemplate
  Res: OleVariant;  // DPFPVerificationResult
  i: Integer;
begin
  if Supports(pStatus, IDPFPEventHandlerStatus, St) then
    St.Status := EventHandlerStatusSuccess;

  // Recorrer candidatos (solo autorizados a la tarea)
  for i := 0 to High(FCandidates) do
  begin
    if VarIsEmpty(FCandidates[i].TemplateBytes) then
      Continue;

    if not TryCreateOleObject(['DPFPShrX.DPFPTemplate', 'DPFPShrX.DPFPTemplate.1'], Tmpl) then
      raise Exception.Create('No se pudo crear DPFPShrX.DPFPTemplate. Verifique instalación/registro COM de DigitalPersona (x86).');

    // Cargar template desde bytes
    try
      Tmpl.Deserialize(FCandidates[i].TemplateBytes);
    except
      Continue; // template corrupto/incompatible, no rompe el flujo
    end;

    // Verificar
    try
      Res := FVerifier.Verify(pFeatureSet, Tmpl);
      if (not VarIsEmpty(Res)) and (Res.Verified = True) then
      begin
        FMatchedUser := FCandidates[i].CodUsuario;
        try
          FMatchedFar := Integer(Res.FARAchieved);
        except
          FMatchedFar := 0;
        end;
        ModalResult := mrOk;
        Exit;
      end;
    except
      // si algo falla en Verify para este candidato, sigue con el próximo
    end;
  end;

  // no match
  ModalResult := mrCancel;
end;

function TFpVerifyForm.Execute(out CodUsuario: Integer; out FAR: Integer): Boolean;
begin
  Result := (ShowModal = mrOk) and (FMatchedUser > 0);
  if Result then
  begin
    CodUsuario := FMatchedUser;
    FAR := FMatchedFar;
  end
  else
  begin
    CodUsuario := 0;
    FAR := 0;
  end;
end;

function AutorizarTareaPorHuella(
  const TaskCode: string;
  QryCandidatos: TDataSet;
  out CodUsuario: Integer;
  out FAR: Integer
): Boolean;
var
  Candidates: array of TFpCandidate;
  B: TBlobField;
  idx: Integer;
  Frm: TFpVerifyForm;
begin
  Result := False;
  CodUsuario := 0;
  FAR := 0;

  if (QryCandidatos = nil) or (not QryCandidatos.Active) then
    Exit;

  // Construir candidatos desde dataset (COD_USUARIO + TEMPLATE blob)
  QryCandidatos.First;
  SetLength(Candidates, 0);
  while not QryCandidatos.Eof do
  begin
    idx := Length(Candidates);
    SetLength(Candidates, idx + 1);

    Candidates[idx].CodUsuario := QryCandidatos.FieldByName('COD_USUARIO').AsInteger;

    B := QryCandidatos.FieldByName('TEMPLATE') as TBlobField;
    Candidates[idx].TemplateBytes := BlobFieldToVarBytes(B);

    QryCandidatos.Next;
  end;

  if Length(Candidates) <= 0 then
    Exit;

  Frm := TFpVerifyForm.CreateVerify(Application, Candidates);
  try
    Result := Frm.Execute(CodUsuario, FAR);
  finally
    Frm.Free;
  end;
end;

end.
