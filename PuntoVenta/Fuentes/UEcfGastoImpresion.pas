unit UEcfGastoImpresion;

interface

uses
  SysUtils, Classes, Forms;

function EjecutarImpresionEcfGasto(
  AOwner: TComponent;
  ATrn: Integer;
  out AMensaje: string): Boolean;

implementation

uses
  Printers, QuickRpt, UGlobal,
  UEcfGastoPrintData,
  UEcfGastoTimbre,
  UFormEnviarEmailEcfGasto,
  UOpcionesImpresionEcfGasto,
  UQREcfGastoTicket,
  UQREcfGastoCarta;

function NormalizarPdf(
  const AFileName: string): string;
begin
  Result := Trim(AFileName);

  if Result = '' then
    Exit;

  if CompareText(
       ExtractFileExt(Result),
       '.pdf') <> 0 then
    Result := ChangeFileExt(Result, '.pdf');
end;

procedure ConfigurarImpresora(
  AReport: TQuickRep;
  const AImpresora: string;
  ACopias: Integer);
var
  I: Integer;
begin
  if AReport = nil then
    Exit;

  if ACopias <= 0 then
    ACopias := 1;

  AReport.PrinterSettings.Copies := ACopias;

  I := Printer.Printers.IndexOf(AImpresora);

  if I >= 0 then
    AReport.PrinterSettings.PrinterIndex := I;
end;

procedure ExportarPdf(
  AReport: TQuickRep;
  const AFileName: string);
var
  Dir: string;
begin
  if AReport = nil then
    raise Exception.Create(
      'Reporte QuickReport no disponible.');

  Dir := ExtractFilePath(AFileName);

  if (Dir <> '') and
     not DirectoryExists(Dir) then
    ForceDirectories(Dir);

  {
    Rutina estandar de PointSaleSoft.
    ReportExportPDF prepara las paginas del QuickReport y genera
    el PDF mediante TPdfDocument.
  }
  UGlobal.ReportExportPDF(
    AReport,
    AFileName);

  {
    La rutina global maneja internamente sus errores; por eso
    validamos que realmente exista el archivo antes de continuar.
  }
  if not FileExists(AFileName) then
    raise Exception.Create(
      'No fue posible generar el PDF: ' +
      AFileName);
end;

function EjecutarImpresionEcfGasto(
  AOwner: TComponent;
  ATrn: Integer;
  out AMensaje: string): Boolean;
var
  Datos: TEcfGastoPrintData;
  Opciones: TOpcionesEcfGasto;
  UrlImage: string;
  CodigoSeguridad: string;
  FechaFDigital: string;
  EmailDefault: string;
  PdfFile: string;
  Ticket: TfrmQREcfGastoTicket;
  Carta: TfrmQREcfGastoCarta;
  Reporte: TQuickRep;
  MailMsg: string;
  Asunto: string;
  Cuerpo: string;
  EmailEnviado: Boolean;
begin
  Result := False;
  AMensaje := '';

  Datos := TEcfGastoPrintData.Create;
  try
    try
      Datos.Cargar(ATrn);

      if not Datos.EsAceptado then
      begin
        AMensaje :=
          'Solo se permite imprimir/exportar el e-CF cuando ' +
          'ECF_GASTO_ENVIO indica estado ACEPTADO.';
        Exit;
      end;

      EmailDefault := '';

      if (Datos.Master.FindField(
            'EMAIL_PROVEEDOR') <> nil) and
         not Datos.Master.FieldByName(
               'EMAIL_PROVEEDOR').IsNull then
        EmailDefault :=
          Trim(
            Datos.Master.FieldByName(
              'EMAIL_PROVEEDOR').AsString);

      if not TfrmOpcionesImpresionEcfGasto.Ejecutar(
               AOwner,
               ATrn,
               Datos.Master.FieldByName(
                 'ENCF').AsString,
               EmailDefault,
               Opciones) then
      begin
        AMensaje := 'Operacion cancelada.';
        Exit;
      end;

      UrlImage := '';
      CodigoSeguridad := '';
      FechaFDigital := '';

      UrlImage := GetUrlImageTimbreGasto(
        ATrn,
        CodigoSeguridad,
        FechaFDigital);

      Ticket := nil;
      Carta := nil;
      Reporte := nil;

      try
        if Opciones.Formato = fiegTicket80 then
        begin
          Ticket :=
            TfrmQREcfGastoTicket.Create(AOwner);

          Ticket.Cargar(Datos);
          Reporte := Ticket;
        end
        else
        begin
          Carta :=
            TfrmQREcfGastoCarta.Create(AOwner);

          Carta.Cargar(Datos);
          Reporte := Carta;
        end;

        // SetQrUrlAsJpgToQRImage utiliza PrinterIndex.
        // Configurar la impresora antes de construir el QR.
        if Opciones.Accion = aiegImprimir then
          ConfigurarImpresora(
            Reporte,
            Opciones.Impresora,
            Opciones.Copias)
        else if Printer.PrinterIndex >= 0 then
          Reporte.PrinterSettings.PrinterIndex :=
            Printer.PrinterIndex;

        if Ticket <> nil then
          Ticket.AplicarTimbreQr(
            UrlImage,
            CodigoSeguridad,
            FechaFDigital)
        else if Carta <> nil then
          Carta.AplicarTimbreQr(
            UrlImage,
            CodigoSeguridad,
            FechaFDigital);

        case Opciones.Accion of
          aiegVistaPrevia:
            begin
              Reporte.Preview;
              Result := True;
            end;

          aiegImprimir:
            begin
              Reporte.Print;
              Result := True;
            end;

          aiegPdf:
            begin
              PdfFile :=
                NormalizarPdf(
                  Opciones.ArchivoPdf);

              ExportarPdf(
                Reporte,
                PdfFile);

              AMensaje :=
                'PDF generado: ' + PdfFile;

              Result := True;
            end;

          aiegEmail:
            begin
              PdfFile :=
                NormalizarPdf(
                  Opciones.ArchivoPdf);

              ExportarPdf(
                Reporte,
                PdfFile);

              {
                El usuario vera estos valores en el formulario
                y podra revisarlos/modificarlos antes del envio.
              }
              Asunto :=
                Datos.TipoEcfTexto +
                ' - ' +
                Datos.Master.FieldByName(
                  'ENCF').AsString +
                ' - ' +
                Datos.Master.FieldByName(
                  'EMPRESA').AsString;

              Cuerpo :=
                'Adjunto representacion impresa del comprobante fiscal ' +
                'electronico ' +
                Datos.Master.FieldByName(
                  'ENCF').AsString +
                '.' + #13#10 + #13#10 +
                'Puede verificar el codigo QR y los datos fiscales ' +
                'incluidos en el documento adjunto.';

              MailMsg := '';
              EmailEnviado := False;

              {
                IMPORTANTE:
                No se envia automaticamente despues de generar el PDF.

                Primero se abre el formulario de revision:
                - destinatario
                - subject
                - mensaje
                - archivo PDF
                - boton Ver archivo adjunto

                Se utiliza la configuracion de email ya existente
                de PointSaleSoft mediante GlbIDTipoEmail.
              }
              Result :=
                TfrmEnviarEmailEcfGasto.Ejecutar(
                  AOwner,
                  PdfFile,
                  Opciones.Email,
                  Asunto,
                  Cuerpo,
                  GlbIDTipoEmail,
                  EmailEnviado);

              if not Result then
              begin
                AMensaje := 'Envio de email cancelado.';
                Exit;
              end;

              if EmailEnviado then
              begin
                AMensaje :=
                  'Email procesado con el PDF adjunto: ' +
                  PdfFile;
                Result := True;
              end
              else
              begin
                AMensaje :=
                  'El formulario se cerro sin enviar el email.';
                Result := False;
              end;
            end;
        end;
      finally
        Carta.Free;
        Ticket.Free;
      end;
    except
      on E: Exception do
      begin
        AMensaje := E.Message;
        Result := False;
      end;
    end;
  finally
    Datos.Free;
  end;
end;

end.
