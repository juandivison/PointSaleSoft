unit UFrmFpVerify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, DPFPCtlXLib_TLB, UFingerprintTypes;

type
  TFrmFpVerify = class(TForm)
    lblInfo: TLabel;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCandidates: TFpCandidateArray;
    FMatchedUser: Integer;
    FMatchedFar: Integer;
    FVerifier: OleVariant; // DPFPEngX.DPFPVerification
    FVerifyCtl: TDPFPVerificationControl;

    function TryCreateOleObject(const ProgIds: array of string; out Obj: OleVariant): Boolean;
    procedure EnsureVerificationControl;
    procedure DPFPVerificationControlComplete(Sender: TObject; const pFeatureSet, pStatus: IDispatch);
  public
    procedure SetCandidates(const Candidates: TFpCandidateArray);
    function Execute(out CodUsuario: Integer; out FAR: Integer): Boolean;
  end;

implementation

{$R *.dfm}

function TFrmFpVerify.TryCreateOleObject(const ProgIds: array of string; out Obj: OleVariant): Boolean;
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
    end;
  end;
end;

procedure TFrmFpVerify.FormCreate(Sender: TObject);
begin
  Caption := 'Autorizacion por huella';
  FMatchedUser := 0;
  FMatchedFar := 0;

  if csDesigning in ComponentState then Exit;

  if not TryCreateOleObject(['DPFPEngX.DPFPVerification', 'DPFPEngX.DPFPVerification.1'], FVerifier) then
    raise Exception.Create('No se pudo crear DPFPEngX.DPFPVerification. Verifique instalacion/registro DigitalPersona (x86).');

  EnsureVerificationControl;
end;

procedure TFrmFpVerify.EnsureVerificationControl;
begin
  if Assigned(FVerifyCtl) then Exit;

  try
    FVerifyCtl := TDPFPVerificationControl.Create(Self);
    FVerifyCtl.Parent := Self;
    FVerifyCtl.Left := 8;
    FVerifyCtl.Top := 8;
    FVerifyCtl.Width := 1;
    FVerifyCtl.Height := 1;
    FVerifyCtl.Visible := True;
    FVerifyCtl.TabOrder := 1;

    FVerifyCtl.OnComplete := DPFPVerificationControlComplete;
  except
    lblInfo.Caption := 'DigitalPersona no disponible (OCX no registrado).';
    FVerifyCtl := nil;
  end;
end;

procedure TFrmFpVerify.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmFpVerify.SetCandidates(const Candidates: TFpCandidateArray);
var
  i: Integer;
begin
  SetLength(FCandidates, Length(Candidates));
  for i := 0 to High(Candidates) do
    FCandidates[i] := Candidates[i];
end;

procedure TFrmFpVerify.DPFPVerificationControlComplete(Sender: TObject;
  const pFeatureSet, pStatus: IDispatch);
var
  St: IDPFPEventHandlerStatus;
  Tmpl: OleVariant; // DPFPShrX.DPFPTemplate
  Res: OleVariant;  // DPFPVerificationResult
  i: Integer;
begin
  if Supports(pStatus, IDPFPEventHandlerStatus, St) then
    St.Status := EventHandlerStatusSuccess;

  for i := 0 to High(FCandidates) do
  begin
    if VarIsEmpty(FCandidates[i].TemplateBytes) then
      Continue;

    if not TryCreateOleObject(['DPFPShrX.DPFPTemplate', 'DPFPShrX.DPFPTemplate.1'], Tmpl) then
      raise Exception.Create('No se pudo crear DPFPShrX.DPFPTemplate. Verifique instalacion/registro DigitalPersona (x86).');

    try
      Tmpl.Deserialize(FCandidates[i].TemplateBytes);
    except
      Continue;
    end;

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
    end;
  end;

  ModalResult := mrCancel;
end;

function TFrmFpVerify.Execute(out CodUsuario: Integer; out FAR: Integer): Boolean;
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

end.
