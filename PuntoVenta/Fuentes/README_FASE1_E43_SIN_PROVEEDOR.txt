FASE 1 - E43 SIN PROVEEDOR OBLIGATORIO
=======================================

BASE EXACTA UTILIZADA
---------------------
URegistrarTransOpeDiariaECF(20260812-030415).pas
URegistrarTransOpeDiariaECF(20260812-030415).dfm
UDatModRegOpeDiaria(2).pas/.dfm
ecfGastoMasterData(2).sql
UGastoTxtBuilder(1).pas

No se utilizó un snapshot anterior del formulario.

OBJETIVO
--------
Permitir registrar, reservar y enviar E43 con:

  TRANS_OPERACION_MASTER.COD_PROVEEDOR = 0

sin crear un registro ficticio en PROVEEDORES.

No se modifica la estructura de TRANS_OPERACION_MASTER.
No se modifica PROVEEDORES.
No se modifica C#.

REGLAS
------
E41:
- proveedor sigue obligatorio.
- validación RNC/Cédula/Pasaporte permanece.
- territorio permanece obligatorio cuando aplica.
- no cambia el flujo fiscal.

E43:
- proveedor interno es opcional.
- COD_PROVEEDOR=0 es válido.
- el XML E43 no envía comprador.
- si el usuario selecciona un proveedor, queda únicamente como dato interno.

CAMBIOS
-------
1. URegistrarTransOpeDiariaECF
   - ValidarCabecera exige proveedor únicamente para E41.
   - caption E43: "Beneficiario / proveedor interno (opcional)".
   - ayuda E43 aclara que el proveedor no se envía como comprador.
   - al crear E43 el foco va a Tipo de compra, no a Proveedor.
   - cuando COD_PROVEEDOR=0, la pantalla dice:
       "Proveedor interno: no seleccionado (opcional)".

2. ecfGastoMasterData.sql
   Antes:
     JOIN PROVEEDORES

   Ahora:
     LEFT JOIN PROVEEDORES

   Esto evita que un E43 con COD_PROVEEDOR=0 desaparezca del SELECT.

3. UGastoTxtBuilder
   Mismo cambio:
     JOIN PROVEEDORES -> LEFT JOIN PROVEEDORES

   BuildHeaderLine ya dejaba en blanco todos los campos del proveedor
   para E43, por lo que no se cambia el contrato GASTO1.

4. UDatModRegOpeDiaria
   Se incluye sin cambios.
   COD_PROVEEDOR tiene Required=True, pero COD_PROVEEDOR=0 satisface
   el NOT NULL de TRANS_OPERACION_MASTER.

VALIDACION ESTRUCTURAL
----------------------
PAS/DFM del formulario:
- mismos componentes
- mismos tipos
- cero componentes faltantes
- cero componentes extras
- cero handlers DFM sin implementación

PRUEBAS RECOMENDADAS
--------------------
A. E43 sin proveedor
   - Nuevo E43.
   - No seleccionar proveedor.
   - COD_PROVEEDOR debe permanecer 0.
   - Guardar cabecera.
   - Agregar detalle exento.
   - Reservar.
   - Enviar por --gasto.
   - Debe construir el documento sin Comprador.

B. E43 sin proveedor por --gasto-txt
   - Activar GlbUsarFacturaTxtECF=1.
   - Repetir caso A.
   - Gastos.txt debe contener vacíos los campos 10..16 del header.
   - El C# --gasto-txt no debe recibir datos de proveedor.

C. Regresión E41
   - Nuevo E41 sin proveedor debe continuar fallando validación:
       "Seleccione el proveedor para el E41."
   - E41 con proveedor debe conservar validaciones actuales.

D. E43 con proveedor opcional
   - Seleccionar proveedor.
   - Debe guardarse COD_PROVEEDOR real.
   - No debe enviarse comprador en XML E43.

NO IMPLEMENTADO EN ESTA FASE
----------------------------
Proveedor ocasional E41 sin alta en PROVEEDORES.
Eso corresponde a Fase 2 y requerirá snapshot fiscal independiente.
