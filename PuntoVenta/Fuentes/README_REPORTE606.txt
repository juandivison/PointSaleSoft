REPORTE 606 EXCEL - POINTSALESOFT
=================================

Archivos:
- UReporte606Excel.pas
- UReporte606Excel.dfm

LLAMADA DESDE MENU PRINCIPAL
----------------------------
Agregar UReporte606Excel al uses del formulario principal y ejecutar:

  TfrmReporte606Excel.Ejecutar(Self);

El formulario permite seleccionar Fecha Desde / Fecha Hasta y utiliza
UGlobal.ExporToExcel para generar:

  C:\Electronico\Reportes\606\Reporte606_<desde>_<hasta>_<timestamp>.xls

REGLAS IMPLEMENTADAS
--------------------
1. No incluye TRANS_OPERACION_MASTER con STATUS='C'.
2. No suma TRANS_OPERACION_DET con STATUS='C'.
3. No incluye NCF_ASIGNADOS_COMPRA cancelados.
4. Si TRANS_OPERACION_MASTER.ECF tiene valor, exige que el E41/E43 tenga
   un registro ACEPTADO en ECF_GASTO_ENVIO.
5. E43/B13 y E47/B17 usan el RNC de la propia compañía para el campo
   RNC/Cédula del 606.
6. E41 toma RNC/Cédula del proveedor cuando TIPODOC es 1 o 2.
7. Se separan bases de Bienes y Servicios con IND_BIEN_SERVICIO.
8. Para E41 con IND_MONTO_GRAVADO=1 se reconstruye la base fiscal:
   - indicador 1: divide entre 1.18
   - indicador 2: divide entre 1.16
9. Incluye ITBIS facturado, ITBIS retenido e ISR retenido.
10. Agrega TOTAL GENERAL al final.
11. Agrega Revision Contable para no inventar datos que PointSaleSoft
    todavía no captura con certeza.

CAMPOS 606 QUE NO SE INVENTAN
-----------------------------
El sistema actualmente no tiene evidencia suficiente para determinar
automáticamente en todos los casos:
- Tipo de Retención ISR 606.
- ITBIS sujeto a proporcionalidad.
- ITBIS llevado al costo.
- ITBIS percibido en compras.
- ISR percibido.
- ISC.
- Otros impuestos/tasas.
- Propina legal.
- Fecha real de pago de una compra a crédito.

Esos campos salen en cero/blanco y la columna Revision Contable avisa
cuando se necesita intervención del contable.

Tipo Retención ISR:
- Si IDTIPO_COMPRA=3 (Arrendamientos) y existe ISR, se propone código 1.
- Para los demás casos con ISR se deja vacío y se marca REVISAR.

FORMA DE PAGO 606
-----------------
Mapeo actual:
IDCODIGO_TPAGODGII 1  -> 606 1 Efectivo
IDCODIGO_TPAGODGII 2  -> 606 3 Tarjeta
IDCODIGO_TPAGODGII 3  -> 606 2 Cheque/Transferencia/Depósito
IDCODIGO_TPAGODGII 7  -> 606 4 Compra a crédito
IDCODIGO_TPAGODGII 12 -> 606 3 Tarjeta
IDCODIGO_TPAGODGII 18 -> 606 2 Transferencia
IDCODIGO_TPAGODGII 19 -> 606 2 Depósito
IDCODIGO_TPAGODGII 22 -> 606 5 Permuta

Los otros códigos se dejan para revisión contable.

IMPORTANTE
----------
Este reporte es un REPORTE DE APOYO / AUDITORÍA para el contador.
No es todavía el TXT oficial 606 listo para subir a la DGII.

La DGII mantiene 23 campos operativos en el Formato 606 y exige validar
el archivo antes de remitirlo. Este reporte expone esos datos y además
incluye campos internos útiles como TRN, Proveedor, Tipo CF, Estado e-CF,
Monto Pagado Proveedor y Revision Contable.
