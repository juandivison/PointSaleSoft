# PointSaleSoft.Sync — piloto Prosesur

Ventana prevista: domingo 22 de noviembre de 2026 por la noche, República Dominicana.

Catálogo y precios viajan de la principal a las sucursales. Las existencias,
costos, compras, ventas, pagos, Kardex y controles fiscales permanecen locales.
La base original no tiene instalado el puente; las pruebas y la carga limpia
se hicieron exclusivamente en copias dentro de artifacts.

## Evidencia local

- Paquete de producto: 11 controles, incluido rollback conjunto de producto/precios.
- Transporte con paquete completo y archivo QA: 18 controles; p95 1,012 ms, 20 cambios.
- MySQL 8.0.16 aislado: cola real y transporte HTTP/WebSocket comprobados.
  Consultar evidence/mysql-qa-result.json y mysql-integration.log para el conteo final.
- Integridad de instalación: 7 controles, incluidos triggers inactivos y rechazo de READY.
- Delphi 7: nueva unidad y programa de pruebas compilados; 11 controles del selector.
- Par limpio: 18,398 productos y 16,946 precios por unidad; 446 tablas locales
  vacías, existencias/costos en cero y 153 generadores locales en cero.
  GEN_NUM_INV_PROD coincide con el máximo de productos. Sin fixtures de QA.

Las latencias son mediciones locales. Cloudflare y la conexión real entre
oficinas aún requieren un piloto. El paquete no contiene bases, respaldos,
contraseñas, archivos privados DPAPI ni configuración activa del túnel.
La configuración de empresa y usuarios queda a cargo del usuario desde Delphi/ERP.

## Requisitos y configuración

Agentes Windows: .NET 10 y acceso al Firebird local 2.5. Relay: .NET 10 ASP.NET
Core y MySQL en base independiente pointsale_sync_*. No usar idesimysql_qa,
CP4_API_QA ni las cuentas del control de secuencias eCF.

La versión del paquete es para Windows y requiere el runtime instalado.
Para un VPS Linux se debe publicar específicamente para su sistema antes de instalar.
El relay escucha solo en loopback. Se publica con un hostname de catálogo separado
a través del túnel existente, conservando la API fiscal y sus rutas.
No habilitar cache; permitir WebSocket; no incluir tokens en URLs o registros.

Los JSON públicos no contienen secretos. Los agentes leen PSSYNC_FIREBIRD y
PSSYNC_TOKEN; el relay lee PSSYNC_MYSQL. tools/Protect-SyncSecrets.ps1 guarda
SecureString mediante DPAPI en un directorio privado nuevo. Solo el mismo usuario
de Windows en el mismo equipo puede descifrarlo. Crear secretos por separado en
cada equipo; los archivos DPAPI del piloto local no sirven para trasladarlos.
tools/Start-Sync.ps1 los carga únicamente al entorno del proceso y los restaura
al terminar. La tarea debe ejecutarse bajo ese mismo usuario.

tools/New-LocalPilotConfiguration.ps1 genera tokens aleatorios, hashes de
identidad y archivos privados para el ensayo en esta PC. No instala tareas.
Su relay.json escucha por defecto en 127.0.0.1:5195; ajustar el puerto loopback
del relay y la URL HTTPS de agentes al preparar el servidor definitivo.

## Carga inicial y diagnóstico

Ejecutable: app/PointSaleSoft.Sync.exe. Cada modo recibe un JSON de configuración.
Los comandos administrativos usan PSSYNC_FIREBIRD como conexión privada.
El JSON administrativo contiene Tenant, Role, Directory y, después de instalar
la principal, Epoch y Policy. Directory identifica el contrato o snapshot.

1. `init-source`: instala captura transaccional en la principal seleccionada y
   escribe Directory/source.json. Requiere directorio nuevo; verificar la ruta
   de la base antes de ejecutar. Respaldar y detener escrituras durante la preparación.
2. `export`: desde el contrato de principal, con Directory nuevo, exporta snapshot
   consistente y manifiesto de conteos/hashes. El manifiesto se escribe al final.
3. `bootstrap`: Role=branch y Directory del snapshot; comprueba todos los paquetes
   antes de escribir. Una base nueva debe estar totalmente vacía; nunca vacía una
   base con datos. Instala guardas, aplica paquetes y habilita READY tras validar
   conteos y triggers. Reintentar el mismo snapshot conserva UUIDs y es idempotente.
4. `status`: verifica rol, epoch, contrato, triggers y READY; presenta conteos y
   pendientes de principal o confirmaciones locales de sucursal, sin secretos.
5. `verify-clean`: solo para el par nuevo antes de configurar la empresa o vender;
   exige todas las tablas locales vacías y las numeraciones locales en cero.

No usar los ejecutables de tests como provisionador. No exportar de las copias
QA con fixtures. El par limpio local está señalado en artifacts/clean-pilot.json
del workspace; no se incluye en el ZIP para evitar entregar datos del cliente.

## Delphi y activación

tools/Install-DelphiBridge.ps1 -PlanOnly verifica hashes de los dos candidatos
y de las fuentes actuales. Sin PlanOnly realiza respaldo antes de copiar y
revierte si falla. SourceDirectory permite indicar el directorio de fuentes.
Si las fuentes cambiaron desde la preparación, rechaza sobrescribirlas.
El usuario compila el ERP desde Delphi. No compilar el proyecto completo automáticamente.

Sin una sección nueva en repconf_cr.ini, el comportamiento sigue siendo DIRECTO.
Solo después de completar configuración ERP, carga inicial, agentes y cola:

```ini
[CATALOGO_SYNC]
Modo=PUENTE
```

PUENTE evita los viajes directos desde la ventana de inventario hacia IBDatabase2.
Las guardas Firebird impiden que una sucursal altere el catálogo central,
permitiendo sus movimientos de stock/costo. DIRECTO conserva el camino anterior.

tools/Register-SyncTask.ps1 prepara una tarea de agente al iniciar sesión del
usuario actual, con privilegios limitados y reinicio por fallos. No es un servicio:
no funciona con la sesión cerrada. Instalarla solo tras validar el agente manualmente.
El relay definitivo requiere servicio/supervisor del VPS y entorno de secretos propios.

## Retención y recuperación

`maintenance relay.json` requiere PSSYNC_MYSQL y compacta el detalle de entregas
confirmadas hace más de 30 días. Nunca retira pendientes. Conserva hashes y lista
de destinatarios compacta para impedir que un reenvío antiguo resucite la entrega,
y mantiene la fecha de última confirmación. Los UUIDs/hashes no se borran por edad:
su retirada requiere retirar el epoch completo mediante un nuevo bootstrap
controlado. Respaldar esa metadata junto con la cola. Vigilar crecimiento de
recibos compactos además de la cuota de 32 MiB de contenido pendiente por cliente.

Ante caída HTTP/relay, la principal conserva outbox y la sucursal conserva sus
operaciones locales. Restaurar conectividad y revisar status; no resetear UUIDs,
epoch ni versiones. No restaurar una sucursal anterior sobre movimientos recientes.

Rollback de la integración Delphi: detener sus agentes/tareas; conservar la cola;
poner Modo=DIRECTO y restaurar las fuentes respaldadas, compilando desde Delphi.
Las guardas de catálogo de una sucursal siguen activas al cambiar el INI. Antes
de volver al sincronizador directo hay que retirarlas de forma controlada en ESA
sucursal, tras respaldo y conciliación. No desactivar triggers por patrón global
ni ejecutar escrituras simultáneas por ambos caminos.

## Puerta previa al despliegue

Revisar paquete/hashes y elegir SO del VPS, hostname y ruta de base MySQL separada.
Preparar credenciales por nodo y validar empresa/usuarios de la sucursal en ERP.
Luego realizar piloto por el túnel: alta de producto con precios, cambio de precio,
oficina desconectada/reconexión, reinicio relay y confirmación con stock local intacto.
Medir la latencia allí. No se han creado hostname, servicio, tarea ni rutas públicas.
