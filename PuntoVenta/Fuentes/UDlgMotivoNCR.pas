unit UDlgMotivoNCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmMotivoNCR = class(TForm)
    lblTitulo: TLabel;
    rgMotivo: TRadioGroup;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure rgMotivoDblClick(Sender: TObject);
  private
    function SelectedCode: Integer;
    procedure BuildMotivos(const ATipoECF: string; ADefault: Integer);
  public
    { Devuelve True si el usuario confirma; AMotivo recibe el Código de
      Modificación (1..5) según DGII.
      ADefault: código sugerido al abrir (1..5), por omisión 3: "Corrige montos".
      ACaption: título opcional de la ventana. }
    class function Execute(var AMotivo: Integer; ADefault: Integer = 3;
      const ACaption: string = ''): Boolean;
    { Variante que permite ajustar la lista de motivos según el tipo de e-CF.
      Por ejemplo, para E34 (Nota de Crédito Electrónica) solo se ofrecen
      los códigos 1, 2 y 3. }
    class function ExecuteForECF(const ATipoECF: string; var AMotivo: Integer;
      ADefault: Integer = 3; const ACaption: string = ''): Boolean;
  end;

implementation

{$R *.dfm}

procedure TfrmMotivoNCR.FormCreate(Sender: TObject);
begin
  Caption := 'Motivo de Nota (NC/ND)';
  lblTitulo.Caption := 'Seleccione el motivo de la Nota de crédito o débito:';

  btnOK.Caption := 'Aceptar';
  btnCancel.Caption := 'Cancelar';
  btnOK.Default := True;      // Enter
  btnCancel.Cancel := True;   // Esc

  rgMotivo.ItemIndex := 0;
end;

procedure TfrmMotivoNCR.btnOKClick(Sender: TObject);
begin
  if rgMotivo.ItemIndex < 0 then
  begin
    MessageDlg('Debe seleccionar un motivo.', mtWarning, [mbOK], 0);
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmMotivoNCR.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMotivoNCR.rgMotivoDblClick(Sender: TObject);
begin
  // Doble clic confirma si hay selección
  if rgMotivo.ItemIndex >= 0 then
    btnOKClick(btnOK);
end;

procedure TfrmMotivoNCR.BuildMotivos(const ATipoECF: string; ADefault: Integer);
const
  C_MIN_CODE = 1;
  C_MAX_CODE = 5;
  // Textos oficiales para los códigos de modificación DGII:
  // 1: Anula NCF modificado
  // 2: Corrige texto
  // 3: Corrige montos
  // 4: Reemplazo NCF contingencia
  // 5: Referencia Factura Consumo (solo E31)
  COD_TEXT: array[C_MIN_CODE..C_MAX_CODE] of string = (
    '1 - Anula el NCF modificado',
    '2 - Corrige texto del comprobante fiscal modificado',
    '3 - Corrige montos (precios/cantidades) del NCF modificado',
    '4 - Reemplazo de NCF emitido en contingencia',
    '5 - Referencia Factura Consumo Electrónica'
  );
var
  i: Integer;
  tipo: string;
  defCode: Integer;
  codeStr: string;
begin
  tipo := UpperCase(Trim(ATipoECF));

  // Normalizar código por defecto
  defCode := ADefault;
  if (defCode < C_MIN_CODE) or (defCode > C_MAX_CODE) then
    defCode := 3; // Corrige montos

  rgMotivo.Items.BeginUpdate;
  try
    rgMotivo.Items.Clear;

    for i := C_MIN_CODE to C_MAX_CODE do
    begin
      // Para E34 (Nota de Crédito Electrónica) solo códigos 1..3
      if (tipo = 'E34') and (i > 3) then
        Continue;

      rgMotivo.Items.Add(COD_TEXT[i]);
    end;

    // Seleccionar el motivo por defecto, si está visible
    rgMotivo.ItemIndex := -1;
    codeStr := IntToStr(defCode) + ' ';

    for i := 0 to rgMotivo.Items.Count - 1 do
    begin
      if Pos(codeStr, rgMotivo.Items[i]) = 1 then
      begin
        rgMotivo.ItemIndex := i;
        Break;
      end;
    end;
  finally
    rgMotivo.Items.EndUpdate;
  end;
end;

function TfrmMotivoNCR.SelectedCode: Integer;
var
  S: string;
  P: Integer;
  codeStr: string;
begin
  Result := 0;
  if (rgMotivo.ItemIndex < 0) or (rgMotivo.ItemIndex >= rgMotivo.Items.Count) then
    Exit;

  S := Trim(rgMotivo.Items[rgMotivo.ItemIndex]);

  // Esperamos un formato 'X - ...' (X ? [1..5])
  P := Pos(' ', S);  // primera separación
  if P <= 0 then
    codeStr := S
  else
    codeStr := Copy(S, 1, P - 1);

  Result := StrToIntDef(codeStr, 0);

  // Fallback por si el texto fue modificado y no tiene prefijo numérico
  if Result = 0 then
    Result := rgMotivo.ItemIndex + 1;
end;

class function TfrmMotivoNCR.Execute(var AMotivo: Integer; ADefault: Integer;
  const ACaption: string): Boolean;
var
  F: TfrmMotivoNCR;
begin
  Result := False;
  F := TfrmMotivoNCR.Create(nil);
  try
    if Trim(ACaption) <> '' then
      F.Caption := ACaption;

    // Lista genérica (no se filtra por tipo de e-CF)
    F.BuildMotivos('', ADefault);

    if F.ShowModal = mrOk then
    begin
      AMotivo := F.SelectedCode; // Código de modificación 1..5
      Result := True;
    end;
  finally
    F.Free;
  end;
end;

class function TfrmMotivoNCR.ExecuteForECF(const ATipoECF: string;
  var AMotivo: Integer; ADefault: Integer; const ACaption: string): Boolean;
var
  F: TfrmMotivoNCR;
begin
  Result := False;
  F := TfrmMotivoNCR.Create(nil);
  try
    if Trim(ACaption) <> '' then
      F.Caption := ACaption;

    // Lista filtrada según tipo de e-CF (por ejemplo E34 => solo 1,2,3)
    F.BuildMotivos(ATipoECF, ADefault);

    if F.ShowModal = mrOk then
    begin
      AMotivo := F.SelectedCode; // Código de modificación válido para el tipo
      Result := True;
    end;
  finally
    F.Free;
  end;
end;

end.
