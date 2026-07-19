PATCH TSS DB - 2026-05-20

Archivos modificados:
- UFrmTssExportCenter.pas
- UFrmTssExportCenter.dfm

Objetivo:
- Quitar la carga dummy del prototipo.
- Usar datos reales de Firebird para el reporte mensual por empleado.
- Reutilizar la idea/query historica de UImportarDatosTSS: EMPLEADO + NOMINA agrupado por empleado y periodo.

Funcionamiento:
1. Abrir el formulario Centro de Exportacion TSS / SUIR Plus.
2. Indicar Periodo en formato MMAAAA, ejemplo 052026.
3. Elegir pestana:
   - Autodeterminacion
   - Novedades NV
   - Bonificacion INFOTEP
   - Dependientes Adicionales
   - Rectificativa IR-3
4. Presionar Cargar DB.
5. Revisar preview en el DBGrid.
6. Presionar Validar.
7. Presionar Generar TXT.

Mapeo implementado:

AUTODETERMINACION:
- Fuente: EMPLEADO + NOMINA.
- Filtro: NOMINA.FECHA_NOMINA between periodo inicial/final.
- Filtro: EMPLEADO.PAGA_AFP = 1.
- Salario cotizable, salario ISR y salario INFOTEP usan SUM(NOMINA.SALARIO_BRUTO).

NOVEDADES:
- IN: empleados con FECHA_ENTRADA dentro del periodo.
- SA: empleados con FECHA_SALIDA dentro del periodo.
- Esto cubre el caso indicado: si FECHA_SALIDA tiene valor, se reporta en Novedades.

BONIFICACION INFOTEP:
- Carga empleados activos desde EMPLEADO.
- MONTO_BONIFICACION queda 0.00 porque no fue suministrada tabla/campo de bonificacion.
- Requiere mapear la tabla real de bonificaciones.

DEPENDIENTES ADICIONALES:
- No se carga aun porque falta tabla de dependientes.
- Campos minimos requeridos: cedula titular, tipo novedad ID/SD, cedula dependiente, nombres/apellidos.

RECTIFICATIVA IR-3:
- Fuente base: EMPLEADO + NOMINA.
- Salario ISR usa SUM(NOMINA.SALARIO_BRUTO).
- Otros campos fiscales quedan 0.00 hasta recibir campos de ISR/retenciones/saldos.

Pendiente importante:
Para detectar aumentos salariales correctamente se necesita una tabla historica o bitacora de cambios salariales, por ejemplo:

CREATE TABLE EMPLEADO_SALARIO_HIST (
  ID INTEGER,
  CODIGO_EMP INTEGER,
  FECHA_CAMBIO DATE,
  SALARIO_ANTERIOR NUMERIC(15,2),
  SALARIO_NUEVO NUMERIC(15,2),
  USUARIO VARCHAR(30),
  FECHA_REGISTRO TIMESTAMP
);

Sin historico no es confiable inferir aumentos solo desde EMPLEADO.SALARIO, porque ese campo contiene el valor actual y no necesariamente el salario vigente en meses anteriores.
