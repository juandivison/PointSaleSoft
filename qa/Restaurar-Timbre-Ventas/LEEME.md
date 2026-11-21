# Restauración del timbre de ventas en Delphi

Cambios: UUtilecf.pas, UUtilecftimbre.pas y nueva UEcfTimbreVentaLocal.pas.
No modifica, compila ni publica IdesiToolECF. No hace POST fiscal ni reserva secuencias.
El usuario compila PointSaleSoft desde Delphi 7 con sus componentes habituales.

## Comportamiento

- El lector captura D7 y D7T independientemente del orden. Corrige el desplazamiento
  del prefijo D7T y acepta fecha/monto tanto posicionales como con etiquetas.
- Delphi valida RNC/e-NCF de la venta y coherencia del código, monto y URL DGII.
  Completa una fila de ECF_TIMBRE_LOG con nulos, sin insertar otra por existir
  un registro incompleto. No inventa fecha actual ni monto cero ante campos ausentes.
- Usa transacción propia para no confirmar o revertir cambios pendientes de pantalla.
  El resultado D7 se persiste y comprueba en NCF_ASIGNADOS mediante
  SP_ECF_UPDATE_ESTADO: estado fiscal, TrackId, mensaje y auditoría del procedimiento.
  Conserva TrackId cuando la respuesta lo omite, rechaza otro e-NCF/TrackId y evita
  retroceder una aceptación confirmada. No reserva ni reasigna números.
  Un fallo local se devuelve como persistencia pendiente y se muestra en el ERP;
  nunca se declara rechazado el e-CF aceptado ni se fuerza reemisión.
- Si falta el retorno del timbre, puede recuperarlo desde el XML local de la
  factura aceptada: revisa identidad, monto, firma presente y fecha/hora.
  Esta es validación de contenido y coherencia, no verificación criptográfica XMLDSig.
- La impresión lee FECHA_EMISION, código y URL del registro validado; Delphi genera
  el JPEG QR desde esa URL. La consulta de impresión rechaza URL de otro documento.
- Un fallo del timbre posterior a ACEPTADO se informa como pendiente de reparación;
  no transforma la aceptación en rechazo ni provoca reemisión.

## Nombre de nuevas descargas

Formato pedido: **Factura_TRN2_E310000000803.xml**.

TRN real y e-NCF completo una sola vez; sin segundo E31 ni sufijo signed.
Después del proceso normal o --QRDown se consideran exclusivamente archivos
modificados desde el inicio de esa invocación. Se valida el contenido antes de
normalizar; un destino diferente se conserva para conciliación, sin sobrescribirlo.
Los XML anteriores no se renombran ni reorganizan. La lectura para impresión
puede consultarlos, pero no cambia sus nombres. No se cambió el contenido firmado.

El alcance instalado es el flujo legacy local de ventas y descarga QR/XML del
ERP. No cambia el servicio remoto ni los nombres que produzca una ejecución
directa de IdesiToolECF fuera de Delphi, ni las rutas separadas de API/gastos.

## Verificación y uso en Ferrecentro

Verificar.ps1 compila las unidades con dependencias de pantalla sustituidas en un
programa de prueba; no compila el ERP completo. Resultado: 70 controles en Firebird
aislado, con proveedor simulado, HTTP=0 y base comercial sin escrituras.
Build/test.log conserva el resultado.

Corrección posterior del aviso «Timbre pendiente: Timbre pendiente de recuperación»:
la fecha de modificación limita qué archivos pueden renombrarse, pero no cuáles
pueden leerse. Un XML existente se puede validar para reparar el timbre sin cambiar
su nombre ni su fecha. Si no existe XML, el aviso indica la carpeta exacta revisada
y pide no reenviar. Incluye cinco pruebas adicionales de este caso.

Tras compilar desde Delphi y llevar las unidades/EXE al equipo operativo, probar
una nueva descarga de la misma factura aceptada y reimprimirla. Revisar
ECF_TIMBRE_LOG: código, fecha y hora, monto y URL completos. No usar reenviar para
recuperar un timbre. La fila de la captura del usuario y sus XML están en otro
equipo; no se afirma que ya se hayan reparado allí.

Instalar.ps1 comprueba hashes y conserva respaldo antes de copiar tres fuentes.
instalacion.json registra respaldo y resultado. Restaurar esos archivos respaldados
para rollback; retirar la nueva unidad solo después de restaurar sus referencias.
