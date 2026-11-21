# Mapa de puntos fiscales en los fuentes originales

Fuente: archivos adjuntados por el usuario, sin modificar. La numeracion de linea es
aproximada para las versiones cargadas. No deducir reglas de negocio de solo el nombre de un boton.

| Ubicacion | Operacion | Llamada actual |
|---|---|---|
| `UProcVentaRapida(3).pas:4228` | F5 venta contado | `DgiiSolicitareCF` |
| `UProcVentaRapida(3).pas:9825` | Facturar a credito | `DgiiSolicitareCF` |
| `UProcVentaRapida(3).pas:28489` | Devolucion E34 | `DgiiSolicitareCF` |
| `UProcVentaRapida(3).pas:29508` | Validacion desde otra accion | `DgiiSolicitareCF` |
| `UFormFacturas.pas:1406` | Validar e-CF existente | `EjecutarECF_y_Mostrar` |
| `UFormFacturas.pas:1502` | Reenvio explicito | `EjecutarECF_Reenviar` |
| `UFormFacturas.pas:1518` | Renovacion certificado | `EjecutarECF_RefreshCert` |
| `UFormFacturas.pas:1532` | Verificacion de certificado | `EjecutarECF_CheckCertOnly` |
| `UfrmConciliareCFConDGII.pas:138` | Conciliar pendientes | `EjecutarECF_y_Mostrar` |
| `UfrmConciliareCFConDGII.pas:284` | Reenvio CLI legado | `EjecutarECF_CLI` |
| `UfrmConciliareCFConDGII.pas:589` | Descarga QR/XML | `EjecutarECF_DownQRXML` |

## Restriccion de activacion

La rama IDESI_API de `UProcVentaRapida.DgiiSolicitareCF` sigue en modo
CP12-H3B (TEST E31 sin POST). NO reemplazar por llamada inmediata a CP13.9
sin comprobar si `IBTransaction1` esta activa en cada flujo de entrada.
Los formularios de consulta/conciliacion actualmente invocan `UUtilecf` directamente;
la seleccion historica del intento debe prevalecer sobre la configuracion nueva del RNC.

Un documento con intento `TRANSMITIENDO`, `HTTP_RECIBIDO`, `AMBIGUO` o similar
se consulta, nunca se vuelve a transmitir desde el mismo gesto del usuario.

La lectura de salud/certificado puede seguir siendo una accion administrativa
separada solo si NO modifica ni consulta el documento fiscal por el proveedor equivocado.
