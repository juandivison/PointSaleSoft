unit UfrmDescargaMasivaECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  WinSkinData;

type
  TLogInformacionProc = procedure(AMensaje: PChar);

  TfrmDescargaMasivaECF = class(TForm)
    pnlTop: TPanel;
    lblTitulo: TLabel;
    lblInstruccion: TLabel;
    lblRuta: TLabel;
    edtRutaEcf: TEdit;
    pnlEntrada: TPanel;
    lblEntrada: TLabel;
    memENCF: TMemo;
    Splitter1: TSplitter;
    pnlResultado: TPanel;
    lblResultado: TLabel;
    memResultado: TMemo;
    pnlEstadisticas: TPanel;
    lblEntradas: TLabel;
    lblValidos: TLabel;
    lblDuplicados: TLabel;
    lblInvalidos: TLabel;
    lblProcesados: TLabel;
    lblDescargados: TLabel;
    lblSinDescarga: TLabel;
    ProgressBar1: TProgressBar;
    pnlBotones: TPanel;
    btnProcesar: TButton;
    btnCancelar: TButton;
    btnLimpiar: TButton;
    btnCerrar: TButton;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnLimpiarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    FRutaEcf: string;
    FOnLogInformacion: TLogInformacionProc;
    FProcesando: Boolean;
    FCancelar: Boolean;

    FTotalEntradas: Integer;
    FTotalValidos: Integer;
    FTotalDuplicados: Integer;
    FTotalInvalidos: Integer;
    FTotalProcesados: Integer;
    FTotalDescargados: Integer;
    FTotalSinDescarga: Integer;

    procedure SetRutaEcf(const Value: string);
    procedure ReiniciarEstadisticas;
    procedure ActualizarEstadisticas;
    procedure CambiarEstadoControles(AProcesando: Boolean);
    procedure PrepararListaENCF(AListaValidos: TStrings);
    procedure RegistrarResultado(const AMensaje: string);
    procedure RegistrarLogExterno(const AMensaje: string);
    function NormalizarENCF(const AValor: string): string;
    function EsENCFValido(const AENCF: string): Boolean;
    function CrearResumenFinal(ACancelado: Boolean): string;
  public
    procedure AgregarENCF(const AENCF: string);

    property RutaEcf: string read FRutaEcf write SetRutaEcf;
    property OnLogInformacion: TLogInformacionProc
      read FOnLogInformacion write FOnLogInformacion;
  end;

implementation

uses
  UUtilecf;

{$R *.dfm}

procedure TfrmDescargaMasivaECF.FormCreate(Sender: TObject);
begin
  FProcesando := False;
  FCancelar := False;
  FRutaEcf := '';
  FOnLogInformacion := nil;

  memENCF.Clear;
  memResultado.Clear;
  edtRutaEcf.Clear;

  ReiniciarEstadisticas;
  CambiarEstadoControles(False);
end;

procedure TfrmDescargaMasivaECF.FormCloseQuery(
  Sender: TObject;
  var CanClose: Boolean
);
begin
  CanClose := not FProcesando;

  if FProcesando then
  begin
    FCancelar := True;
    MessageDlg(
      'La descarga está en proceso. Se solicitó la cancelación; espere a que termine la descarga actual.',
      mtInformation,
      [mbOK],
      0
    );
  end;
end;

procedure TfrmDescargaMasivaECF.SetRutaEcf(const Value: string);
begin
  FRutaEcf := Trim(Value);
  edtRutaEcf.Text := FRutaEcf;
end;

procedure TfrmDescargaMasivaECF.AgregarENCF(const AENCF: string);
var
  LENCF: string;
begin
  LENCF := NormalizarENCF(AENCF);
  if LENCF <> '' then
    memENCF.Lines.Add(LENCF);
end;

procedure TfrmDescargaMasivaECF.ReiniciarEstadisticas;
begin
  FTotalEntradas := 0;
  FTotalValidos := 0;
  FTotalDuplicados := 0;
  FTotalInvalidos := 0;
  FTotalProcesados := 0;
  FTotalDescargados := 0;
  FTotalSinDescarga := 0;

  ProgressBar1.Min := 0;
  ProgressBar1.Max := 1;
  ProgressBar1.Position := 0;

  ActualizarEstadisticas;
end;

procedure TfrmDescargaMasivaECF.ActualizarEstadisticas;
begin
  lblEntradas.Caption := 'Entradas detectadas: ' +
    IntToStr(FTotalEntradas);
  lblValidos.Caption := 'e-NCF válidos únicos: ' +
    IntToStr(FTotalValidos);
  lblDuplicados.Caption := 'Duplicados omitidos: ' +
    IntToStr(FTotalDuplicados);
  lblInvalidos.Caption := 'Entradas inválidas: ' +
    IntToStr(FTotalInvalidos);
  lblProcesados.Caption := 'Procesados: ' +
    IntToStr(FTotalProcesados);
  lblDescargados.Caption := 'Descarga exitosa: ' +
    IntToStr(FTotalDescargados);
  lblSinDescarga.Caption := 'Sin descarga / error: ' +
    IntToStr(FTotalSinDescarga);
end;

procedure TfrmDescargaMasivaECF.CambiarEstadoControles(
  AProcesando: Boolean
);
begin
  FProcesando := AProcesando;

  btnProcesar.Enabled := not AProcesando;
  btnCancelar.Enabled := AProcesando;
  btnLimpiar.Enabled := not AProcesando;
  btnCerrar.Enabled := not AProcesando;
  memENCF.ReadOnly := AProcesando;
end;

function TfrmDescargaMasivaECF.NormalizarENCF(
  const AValor: string
): string;
begin
  Result := UpperCase(Trim(AValor));
  Result := StringReplace(Result, '"', '', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '', [rfReplaceAll]);
end;

function TfrmDescargaMasivaECF.EsENCFValido(
  const AENCF: string
): Boolean;
var
  I: Integer;
begin
  Result := False;

  if Length(AENCF) <> 13 then
    Exit;

  if AENCF[1] <> 'E' then
    Exit;

  for I := 2 to Length(AENCF) do
  begin
    if not (AENCF[I] in ['0'..'9']) then
      Exit;
  end;

  Result := True;
end;

procedure TfrmDescargaMasivaECF.PrepararListaENCF(
  AListaValidos: TStrings
);
var
  LTextoNormalizado: string;
  LEntradas: TStringList;
  LVistos: TStringList;
  LENCF: string;
  I: Integer;
begin
  AListaValidos.Clear;

  LEntradas := TStringList.Create;
  LVistos := TStringList.Create;
  try
    LVistos.Sorted := True;
    LVistos.Duplicates := dupIgnore;

    LTextoNormalizado := memENCF.Text;
    LTextoNormalizado := StringReplace(
      LTextoNormalizado,
      ',',
      #13#10,
      [rfReplaceAll]
    );
    LTextoNormalizado := StringReplace(
      LTextoNormalizado,
      ';',
      #13#10,
      [rfReplaceAll]
    );
    LTextoNormalizado := StringReplace(
      LTextoNormalizado,
      #9,
      #13#10,
      [rfReplaceAll]
    );
    LTextoNormalizado := StringReplace(
      LTextoNormalizado,
      '|',
      #13#10,
      [rfReplaceAll]
    );
    LTextoNormalizado := StringReplace(
      LTextoNormalizado,
      ' ',
      #13#10,
      [rfReplaceAll]
    );

    LEntradas.Text := LTextoNormalizado;

    for I := 0 to LEntradas.Count - 1 do
    begin
      LENCF := NormalizarENCF(LEntradas[I]);

      if LENCF = '' then
        Continue;

      Inc(FTotalEntradas);

      if not EsENCFValido(LENCF) then
      begin
        Inc(FTotalInvalidos);
        RegistrarResultado('[INVÁLIDO] ' + LENCF);
        Continue;
      end;

      if LVistos.IndexOf(LENCF) >= 0 then
      begin
        Inc(FTotalDuplicados);
        RegistrarResultado('[DUPLICADO OMITIDO] ' + LENCF);
        Continue;
      end;

      LVistos.Add(LENCF);
      AListaValidos.Add(LENCF);
      Inc(FTotalValidos);
    end;
  finally
    LVistos.Free;
    LEntradas.Free;
  end;
end;

procedure TfrmDescargaMasivaECF.RegistrarLogExterno(
  const AMensaje: string
);
begin
  if Assigned(FOnLogInformacion) then
    FOnLogInformacion(PChar(AMensaje));
end;

procedure TfrmDescargaMasivaECF.RegistrarResultado(
  const AMensaje: string
);
begin
  memResultado.Lines.Add(
    FormatDateTime('hh:nn:ss', Now) + '  ' + AMensaje
  );
  memResultado.SelStart := Length(memResultado.Text);
  memResultado.Perform(EM_SCROLLCARET, 0, 0);
end;

function TfrmDescargaMasivaECF.CrearResumenFinal(
  ACancelado: Boolean
): string;
begin
  Result :=
    'Resumen de descarga masiva de XML Firmados' + #13#10 + #13#10 +
    'Entradas detectadas: ' + IntToStr(FTotalEntradas) + #13#10 +
    'e-NCF válidos únicos: ' + IntToStr(FTotalValidos) + #13#10 +
    'Duplicados omitidos: ' + IntToStr(FTotalDuplicados) + #13#10 +
    'Entradas inválidas: ' + IntToStr(FTotalInvalidos) + #13#10 +
    'Procesados: ' + IntToStr(FTotalProcesados) + #13#10 +
    'Descarga exitosa: ' + IntToStr(FTotalDescargados) + #13#10 +
    'Sin descarga / error: ' + IntToStr(FTotalSinDescarga);

  if ACancelado then
    Result := Result + #13#10 + #13#10 +
      'El proceso fue cancelado por el usuario.';
end;

procedure TfrmDescargaMasivaECF.btnProcesarClick(Sender: TObject);
var
  LListaENCF: TStringList;
  LENCF: string;
  LMensaje: string;
  LMensajeLog: string;
  LExito: Boolean;
  LCancelado: Boolean;
  I: Integer;
begin
  if FProcesando then
    Exit;

  if Trim(FRutaEcf) = '' then
  begin
    MessageDlg(
      'No se ha indicado la ruta de e-CF. Asigne GlbRutaEcf a la propiedad RutaEcf antes de mostrar el formulario.',
      mtWarning,
      [mbOK],
      0
    );
    Exit;
  end;

  if Trim(memENCF.Text) = '' then
  begin
    MessageDlg(
      'Copie o escriba por lo menos un e-NCF en la lista.',
      mtInformation,
      [mbOK],
      0
    );
    memENCF.SetFocus;
    Exit;
  end;

  LListaENCF := TStringList.Create;
  try
    memResultado.Clear;
    ReiniciarEstadisticas;
    PrepararListaENCF(LListaENCF);
    ActualizarEstadisticas;

    if LListaENCF.Count = 0 then
    begin
      MessageDlg(
        'No se encontraron e-NCF válidos para procesar.',
        mtWarning,
        [mbOK],
        0
      );
      Exit;
    end;

    FCancelar := False;
    LCancelado := False;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := LListaENCF.Count;
    ProgressBar1.Position := 0;
    CambiarEstadoControles(True);

    RegistrarResultado(
      '[INICIO] Descarga masiva. Ruta: ' + FRutaEcf
    );

    try
      for I := 0 to LListaENCF.Count - 1 do
      begin
        Application.ProcessMessages;

        if FCancelar then
        begin
          LCancelado := True;
          Break;
        end;

        LENCF := LListaENCF[I];
        LMensaje := '';
        LExito := False;

        try
          LExito := UUtilecf.EjecutarECF_DownQRXML(
            FRutaEcf,
            LENCF,
            LMensaje
          );
        except
          on E: Exception do
          begin
            LExito := False;
            LMensaje := E.Message;
          end;
        end;

        Inc(FTotalProcesados);

        if LExito then
        begin
          Inc(FTotalDescargados);
          if Trim(LMensaje) = '' then
            LMensaje := 'Descarga completada.';

          RegistrarResultado(
            '[DESCARGADO] ' + LENCF + ' - ' + LMensaje
          );
        end
        else
        begin
          Inc(FTotalSinDescarga);
          if Trim(LMensaje) = '' then
            LMensaje := 'La rutina no confirmó la descarga.';

          RegistrarResultado(
            '[SIN DESCARGA] ' + LENCF + ' - ' + LMensaje
          );
        end;

        LMensajeLog :=
          ' -Rutina Descargar QR y XML Firmado- ' +
          LENCF + ' - ' + LMensaje;
        RegistrarLogExterno(LMensajeLog);

        ProgressBar1.Position := I + 1;
        ActualizarEstadisticas;
      end;
    finally
      CambiarEstadoControles(False);
    end;

    if LCancelado then
      RegistrarResultado('[CANCELADO] Proceso cancelado por el usuario.')
    else
      RegistrarResultado('[FINALIZADO] Proceso completado.');

    ShowMessage(CrearResumenFinal(LCancelado));
  finally
    LListaENCF.Free;
  end;
end;

procedure TfrmDescargaMasivaECF.btnCancelarClick(Sender: TObject);
begin
  if not FProcesando then
    Exit;

  FCancelar := True;
  btnCancelar.Enabled := False;
  RegistrarResultado(
    '[CANCELACIÓN SOLICITADA] Se detendrá después de la descarga actual.'
  );
end;

procedure TfrmDescargaMasivaECF.btnLimpiarClick(Sender: TObject);
begin
  if FProcesando then
    Exit;

  memENCF.Clear;
  memResultado.Clear;
  ReiniciarEstadisticas;
  memENCF.SetFocus;
end;

procedure TfrmDescargaMasivaECF.btnCerrarClick(Sender: TObject);
begin
  Close;
end;

end.
