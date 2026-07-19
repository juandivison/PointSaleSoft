# PointSaleSoft.XmlSalesImporter

Aplicación de consola para cargar el lote de 15 XML firmados E32, desde la secuencia
`E320000050907` hasta `E320000050921`, en PointSaleSoft / Firebird 2.5.

## Reglas implementadas

- Usa `GEN_NUM_VENTA_MAST` mediante `PROC_INS_VENTAS_MAST`.
- Compara el `TRN` del nombre del XML con `VENTAS_MAST.NUMERO` y genera una advertencia si difieren.
- No modifica la secuencia e-NCF de emisión.
- Inserta `NCF_ASIGNADOS` con estado `A` y `DGII_STATUS='ACEPTADO'`.
- Contado: XML `TipoPago=1`, `FormaPago=1`, `VENTAS_MAST.FORMA_PAGO=1`, `CODIGO_CTE=0`, obtiene `NUMERO_DOC_PAGO` ejecutando `PROC_SECUENCIA(1, 4)` e inserta `DETALLE_PAGOS`.
- Crédito: XML `TipoPago=2`, `FormaPago=4`, `VENTAS_MAST.FORMA_PAGO=7`, cliente `838`, `NUMERO_DOC_PAGO=NULL`, sin `DETALLE_PAGOS`, y ejecuta `PROC_ECF_POST_CXC`.
- `VENTAS_MAST.OBSERVACION='Venta a Credito'` para crédito y `'CONTADO'` para contado.
- `VENTAS_MAST.COMENTARIO` conserva el nombre del XML de origen.
- `VENTAS_MAST.COD_USR_CAJA=40`, `CODIGO_VENDEDOR=NULL` y `TIPONCFIFISCAL=2`.
- El generador `GEN_NUM_FACTURA` se consume únicamente para ventas a crédito. Las ventas al contado mantienen `NUMERO_FACTURA=NULL` y no incrementan ese generador.
- `VENTAS_MAST.STATUS='A'`, `VENTAS_DET.STATUS_DET='A'` y `TRANS_CXC.STATUS='R'`.
- `TIPO_UNIDAD=1`.
- `VENTAS_DET.VALOR_SERVICIO_DET` se carga igual a `VALOR_TOTAL_DET` para todos los ítems; PointSaleSoft lo utiliza como monto bruto persistido de la línea al reabrir o modificar una venta.
- `IDTASAITBIS`: 18 %=6, 16 %=5, exento/0 %=1.
- `LEVEL_PRECIO_VENTA`: compara `PrecioUnitarioItem` contra `PRECIOVENTA1..4`; si no coincide, usa 5.
- Usa `DescripcionItem` como descripción histórica de la venta.
- Cada XML se confirma en una transacción independiente.
- Antes del COMMIT puede ejecutar `PROC_VALIDA_VENTA_PERSISTIDA`.

## Generador de DETALLE_PAGOS.SERIE

Las ventas al contado obtienen la serie mediante:

```sql
SELECT GEN_ID(GEN_SERIE_DET_PAGO, 1)
FROM RDB$DATABASE;
```

La aplicación valida que `GEN_SERIE_DET_PAGO` exista antes de iniciar la carga.

## Secuencia de NUMERO_DOC_PAGO

Para cada venta al contado se ejecuta, dentro de la misma transacción del XML:

```sql
SELECT SECUENCIA
FROM PROC_SECUENCIA(1, 4);
```

El valor retornado se asigna a `VENTAS_MAST.NUMERO_DOC_PAGO`. Si la venta falla y se revierte la transacción, también se revierte la actualización realizada por `PROC_SECUENCIA`.

## Preparación

1. Ejecute `Sql/00_PROC_ECF_POST_CXC.sql` en la base de datos.
2. Copie los 15 XML en una carpeta.
3. Ajuste `ConnectionString` y `XmlFolder` en `appsettings.json`.
4. Confirme que existen `PROC_SECUENCIA` y el generador `GEN_SERIE_DET_PAGO`.
5. Compile con .NET 8 SDK.

```bash
dotnet restore
dotnet build -c Release
```

## Prueba con los dos XML de ejemplo

```bash
dotnet run -- --config appsettings.samples.json --dry-run
```

## Simulación obligatoria del lote completo

La configuración viene con `DryRun=true`.

```bash
dotnet run -- --dry-run
```

La simulación:

- Lee y valida los XML.
- Verifica rango, cantidad y continuidad de e-NCF.
- Consulta productos, precios, cliente y procedimientos.
- Comprueba que los e-NCF no existan.
- No ejecuta INSERT.
- No consume generadores.

## Carga real

```bash
dotnet run -- --commit
```

Opciones adicionales:

```bash
dotnet run -- --commit --folder "C:\\CargaEcf"
dotnet run -- --commit --continue-on-error
dotnet run -- --config "C:\\CargaEcf\\appsettings.json" --commit
```

## Resultado

Se genera un CSV en `logs` con:

- e-NCF.
- forma de pago.
- monto.
- TRN del archivo.
- `VENTAS_MAST.NUMERO` generado.
- número local de factura.
- resultado y advertencias.

Después de la carga ejecute `Sql/01_VERIFICACION_POST_CARGA.sql`.

Si el lote ya fue cargado con una versión anterior que dejó `VALOR_SERVICIO_DET=0`, revise y ejecute de forma controlada `Sql/02_REPARAR_VALOR_SERVICIO_Y_BRUTO.sql`.

## Decisiones técnicas

- El número local de factura se obtiene con `GEN_NUM_FACTURA` solamente para ventas a crédito.
- En ventas al contado, `VENTAS_MAST.NUMERO_FACTURA` y `VENTAS_DET.NUM_FACTURA` quedan `NULL`; `VENTAS_MAST.NUMERO_DOC_PAGO` se obtiene mediante `PROC_SECUENCIA(1, 4)`, que incrementa y sincroniza la secuencia contra `VENTAS_MAST.NUMERO_DOC_PAGO`.
- Los generadores Firebird no se ejecutan durante el modo simulación.
- La descripción se conserva desde el XML.
- La aplicación intenta localizar automáticamente columnas de código de barra y costo en `INVENTARIO_PRODUCTO`. Si no existen, deja los valores en cero/vacío y lo informa.
- La firma XML debe estar presente. Esta versión no realiza validación criptográfica de la firma; carga documentos ya firmados y previamente aceptados.

# Reporte Excel por período — XML vs PointSaleSoft

Se conserva intacto el proceso de carga y se agrega un modo de reporte que cruza
cada XML firmado con la venta registrada en Firebird.

Este modo:

- Usa `XmlFolder` de `appsettings.json` como ruta de búsqueda.
- Puede buscar en subcarpetas mediante `ReportSearchSubdirectories`.
- Filtra por `FechaEmision` del XML, incluyendo ambos extremos del rango.
- Lee únicamente archivos cuyo nombre contiene `signed` o `firmado` y confirma el nodo `Signature`.
- Localiza la venta en `VENTAS_MAST` mediante `NCF_ASIGNADOS.NUMERO_NCF` y, como respaldo, por el TRN del nombre del archivo.
- Lee `VENTAS_MAST.VALOR_TOTAL_DET` y `VENTAS_MAST.MONTO_PAGADO`.
- Compara los montos del XML contra los montos registrados en PointSaleSoft.
- Marca cada fila como `OK`, `DIFIERE MONTO VENTA`, `DIFIERE MONTO PAGO`, `DIFIERE VENTA Y PAGO` o `NO ENCONTRADO EN POS`.
- Presenta las notas de crédito E34 con importes negativos.
- Deja en blanco los montos de pago para las notas de crédito.
- Genera una tabla Excel con filtros y una fila final de total general por columna.

Configuración mínima:

```json
{
  "ConnectionString": "database=...;user=...;password=...;",
  "XmlFolder": "C:\Ruta\XMLFirmados",
  "ReportOutputFolder": ".\reports",
  "ReportSearchSubdirectories": true
}
```

Ejecución usando fechas numéricas:

```bat
PointSaleSoft.XmlSalesImporter.exe --excel-report --from "01/06/2026" --to "30/06/2026"
```

También acepta fechas con mes abreviado en español:

```bat
PointSaleSoft.XmlSalesImporter.exe --excel-report --from "01/jun/2026" --to "30/jun/2026"
PointSaleSoft.XmlSalesImporter.exe --excel-report --from "01/jul/2026" --to "31/jul/2026"
```

Alias en español:

```bat
PointSaleSoft.XmlSalesImporter.exe --reporte-excel --desde "01/jun/2026" --hasta "30/jun/2026"
```

Para indicar un archivo o directorio de salida diferente:

```bat
PointSaleSoft.XmlSalesImporter.exe --excel-report --from "01/jun/2026" --to "30/jun/2026" --output "C:\Reportes\VentasJunio.xlsx"
```

Si no se especifica `--output`, se genera:

```text
ReportOutputFolder\Ventas_XML_YYYYMMDD_YYYYMMDD.xlsx
```

La hoja `Resumen` contiene:

- TRN real registrado en PointSaleSoft; si no se encuentra, usa el TRN del archivo.
- Fecha de emisión.
- Tipo de documento: venta o nota de crédito.
- e-NCF.
- Monto venta XML.
- Monto venta POS (`VENTAS_MAST.VALOR_TOTAL_DET`).
- Monto pago XML.
- Monto pagado POS (`VENTAS_MAST.MONTO_PAGADO`).
- Resultado de la comparación.
- Suma de detalles al 18 %.
- Suma de detalles al 16 %.
- Suma de detalles exentos.
- Otros conceptos.
- Total de detalles.

Las columnas monetarias tienen total general al final. Las notas de crédito se
restan automáticamente de esos totales.
