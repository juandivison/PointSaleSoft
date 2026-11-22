# Pendiente: Pagos Combinados / Cuadre de Caja

**Estado: TODO — pendiente de retomar.** Registrado el 21 de noviembre de 2026.

## Antecedentes

Checkpoint aportado por el propietario:

- Identificada la causa de la diferencia de **RD$3,000** en la venta **128562**.
- Confirmado que los pagos mixtos se reflejan correctamente cuando `DETALLE_PAGOS` contiene los datos adecuados.
- Cuadre conciliado: tarjetas **RD$64,230.52**.
- Pendiente revisar el formulario Pagos Combinados, tanto `.pas` como `.dfm`.

Estos antecedentes no constituyen una nueva verificación de la base. El detalle de la causa identificada no fue incluido en el checkpoint: recuperarlo del diagnóstico previo antes de implementar una corrección.

## Próxima intervención

Revisar el flujo completo de captura, validación y persistencia en:

- `PuntoVenta/Fuentes/UFormPagosCombinados.pas`
- `PuntoVenta/Fuentes/UFormPagosCombinados.dfm`

## Criterios de aceptación

- [ ] Los pagos en efectivo y tarjeta se registran correctamente.
- [ ] Las tarjetas tienen un proveedor válido.
- [ ] No se pueden confirmar pagos con datos obligatorios incompletos.
- [ ] La persistencia es íntegra y el Cuadre de Caja detecta inconsistencias.
- [ ] Los cambios son mínimos, compatibles con **Delphi 7 y Firebird 2.5**, sin degradar funcionalidades existentes.

## Seguimiento

No se ha implementado este ajuste. Este registro no autoriza reparaciones de datos históricos ni inicia la intervención pendiente.

Se intentó crear un issue mediante la conexión de GitHub, pero respondió `403: Resource not accessible by integration`. Se conserva este pendiente versionado en el repositorio para no perderlo; no equivale a un issue creado.
