unit UTssTypes;

interface

uses
  SysUtils;

type
  TTssExportKind = (
    tekAutodeterminacion,
    tekNovedades,
    tekBonificacionInfotep,
    tekDependientesAdicionales,
    tekRectificativaIR3
  );

function TssExportKindToText(AKind: TTssExportKind): string;
function TssExportKindToFilePrefix(AKind: TTssExportKind): string;

implementation

function TssExportKindToText(AKind: TTssExportKind): string;
begin
  case AKind of
    tekAutodeterminacion:
      Result := 'Autodeterminacion';
    tekNovedades:
      Result := 'Novedades';
    tekBonificacionInfotep:
      Result := 'Bonificacion INFOTEP';
    tekDependientesAdicionales:
      Result := 'Dependientes Adicionales';
    tekRectificativaIR3:
      Result := 'Rectificativa IR-3';
  else
    Result := 'Desconocido';
  end;
end;

function TssExportKindToFilePrefix(AKind: TTssExportKind): string;
begin
  case AKind of
    tekAutodeterminacion:
      Result := 'TSS_AUTODETERMINACION';
    tekNovedades:
      Result := 'TSS_NOVEDADES';
    tekBonificacionInfotep:
      Result := 'TSS_BONIFICACION_INFOTEP';
    tekDependientesAdicionales:
      Result := 'TSS_DEPENDIENTES_ADICIONALES';
    tekRectificativaIR3:
      Result := 'TSS_RECTIFICATIVA_IR3';
  else
    Result := 'TSS_EXPORT';
  end;
end;

end.
