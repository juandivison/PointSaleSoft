unit UFrmFpEnroll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComObj, DB, IBDatabase, DPFPCtlXLib_TLB,
  IBQuery, IB, UVarBytes;

type
  TFrmFpEnroll = class(TForm)
    lblInfo: TLabel;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCodUsuario: Integer;
    FDB: TIBDatabase;
    FEnrollCtl: TDPFPEnrollmentControl;
    procedure SaveTemplateBytesToDb(DedoMask: Integer; const TemplateBytes: OleVariant);
    procedure EnsureEnrollmentControl;
    procedure DPFPEnrollmentControlEnroll(Sender: TObject; lFingerMask: Integer;
      const pTemplate, pStatus: IDispatch);
  public
    procedure Init(ADB: TIBDatabase; ACodUsuario: Integer);
  end;

implementation

{$R *.dfm}

procedure TFrmFpEnroll.FormCreate(Sender: TObject);
begin
  Caption := 'Enrolamiento de huella';

  // El IDE puede abrir el form aunque DigitalPersona no esté instalado.
  if csDesigning in ComponentState then Exit;

  EnsureEnrollmentControl;
end;

procedure TFrmFpEnroll.EnsureEnrollmentControl;
begin
  if Assigned(FEnrollCtl) then Exit;

  try
    FEnrollCtl := TDPFPEnrollmentControl.Create(Self);
    FEnrollCtl.Parent := Self;
    FEnrollCtl.Left := 8;
    FEnrollCtl.Top := 8;
    FEnrollCtl.Width := 1;
    FEnrollCtl.Height := 1;
    FEnrollCtl.Visible := True;
    FEnrollCtl.TabOrder := 1;

    // Hook events y parámetros
    FEnrollCtl.OnEnroll := DPFPEnrollmentControlEnroll;
    FEnrollCtl.MaxEnrollFingerCount := 10;
  except
    // Si el OCX no está registrado/instalado, el form no debe reventar.
    lblInfo.Caption := 'DigitalPersona no disponible (OCX no registrado).';
    btnClose.Caption := 'Cerrar';
    FEnrollCtl := nil;
  end;
end;

procedure TFrmFpEnroll.Init(ADB: TIBDatabase; ACodUsuario: Integer);
begin
  FDB := ADB;
  FCodUsuario := ACodUsuario;
end;

procedure TFrmFpEnroll.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmFpEnroll.SaveTemplateBytesToDb(DedoMask: Integer; const TemplateBytes: OleVariant);
var
  TR: TIBTransaction;
  Q: TIBQuery;
  MS: TMemoryStream;
begin
  if FDB = nil then
    raise Exception.Create('DB no asignada en TFrmFpEnroll.Init.');

  TR := TIBTransaction.Create(nil);
  Q := TIBQuery.Create(nil);
  MS := TMemoryStream.Create;
  try
    TR.DefaultDatabase := FDB;
    TR.StartTransaction;

    Q.Database := FDB;
    Q.Transaction := TR;

    VarBytesToStream(TemplateBytes, MS);

    // Intento INSERT sin preguntar; si existe (UQ), hacemos UPDATE.
    Q.SQL.Text :=
      'insert into SEC_USUARIO_HUELLA (ID, COD_USUARIO, DEDO_MASK, TEMPLATE, ACTIVA, CREATED_AT) ' +
      'values (gen_id(GEN_SEC_USUARIO_HUELLA,1), :COD_USUARIO, :DEDO_MASK, :TEMPLATE, 1, current_timestamp)';
    Q.ParamByName('COD_USUARIO').AsInteger := FCodUsuario;
    Q.ParamByName('DEDO_MASK').AsInteger := DedoMask;
    Q.ParamByName('TEMPLATE').DataType := ftBlob;
    Q.ParamByName('TEMPLATE').LoadFromStream(MS, ftBlob);

    try
      Q.ExecSQL;
    except
      on E: Exception do
      begin
        // Delphi 7 + IBX: evitamos depender de SQLCode.
        // Si falla (típicamente UNIQUE), intentamos UPDATE.
        try
          Q.Close;
          MS.Position := 0;
          Q.SQL.Text :=
            'update SEC_USUARIO_HUELLA set TEMPLATE=:TEMPLATE, ACTIVA=1, CREATED_AT=current_timestamp ' +
            'where COD_USUARIO=:COD_USUARIO and DEDO_MASK=:DEDO_MASK';
          Q.ParamByName('COD_USUARIO').AsInteger := FCodUsuario;
          Q.ParamByName('DEDO_MASK').AsInteger := DedoMask;
          Q.ParamByName('TEMPLATE').DataType := ftBlob;
          Q.ParamByName('TEMPLATE').LoadFromStream(MS, ftBlob);
          Q.ExecSQL;
        except
          raise E;
        end;
      end;
    end;

    TR.Commit;
  except
    if TR.InTransaction then
      TR.Rollback;
    raise;
  end;

  MS.Free;
  Q.Free;
  TR.Free;
end;

procedure TFrmFpEnroll.DPFPEnrollmentControlEnroll(Sender: TObject; lFingerMask: Integer;
  const pTemplate, pStatus: IDispatch);
var
  St: IDPFPEventHandlerStatus;
  VTemplate: OleVariant;
  Raw: OleVariant; // varByte[]
begin
  if Supports(pStatus, IDPFPEventHandlerStatus, St) then
    St.Status := EventHandlerStatusSuccess;

  if pTemplate = nil then Exit;

  VTemplate := pTemplate;
  Raw := VTemplate.Serialize; // bytes

  SaveTemplateBytesToDb(lFingerMask, Raw);

  lblInfo.Caption := 'Huella guardada. Puede registrar otra o cerrar.';
end;

end.
