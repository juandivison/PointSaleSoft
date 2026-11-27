# CP7 — Checkpoint de continuidad (2026-11-26)

## Alcance
Gestor centralizado de secuencias e-NCF entre Principal y sucursales de PointSaleSoft.
Delphi 7 / Firebird 2.5 + PHP 5.6 / MySQL 5.6, HTTPS, entorno TEST.
El catálogo incluye **E31, E32, E33, E34, E41, E43, E44, E45, E46 y E47**;
**solo E31/E32** tienen integración de asignación REMOTA prevista en este hito.
La configuración de un tipo no equivale a tener permiso fiscal para emitirlo.

## Evidencia técnica confirmada
- Rama de trabajo `feature/cp7-secuencias-ecf-e31-e47-20261123` existente.
- Ocho archivos CP7 preparados en `qa/pointsalesoft-secuencias/cp7/`, más esta nota.
- Usuario ejecutó con éxito el aplicador en modo `--verificar --aceptar-reemplazo-formulario`
  y reportó `CP7 VERIFICACION PASS: no se escribio ningun archivo`.
- Dicha ejecución **NO** aplicó cambios en su PC.
- No hay confirmación documental de aplicación del parche, compilación DCC32, instalación
  MySQL/PHP QA ni prueba integral Principal ↔ sucursal.
- 2026-11-26: comparativa de GitHub frente a `consolidacion/pointsalesoft-20261121`:
  CP7 diverge (12 commits a favor de CP7 y 5 commits nuevos en consolidación al consultar).
  Cambios nuevos de consolidación afectan mayoritariamente PointSaleSoft.Sync e inventario,
  no los ocho archivos CP7. **No fusionar sin comparar los cambios actuales.**

## Seguridad y bloqueos explícitos
1. Los tokens CP7 provienen de aprobación de la Principal y deben guardarse protegidos;
   no generar autorizaciones locales independientes.
2. El formulario actual permite escribir `UrlActivacion` manualmente. HTTPS no acredita
   por sí solo que ese servidor pertenezca a la Principal. Se requiere mecanismo confiable
   de entrega/vinculación de la URL antes de desplegar.
3. DPAPI CURRENT_USER solo permite recuperar credenciales con el mismo usuario Windows;
   cajas con varios usuarios requieren mecanismo seguro por equipo con ACL.
4. Una vez REMOTO, **no** hacer fallback automático a LOCAL; mantener identidad de solicitud,
   preservar pendientes y evitar duplicidad de e-NCF.
5. El respaldo local no equivale a prueba de compilar o QA. No instalar ni activar
   servicios de producción. PHP 5.6/MySQL 5.6 exigen mitigaciones adicionales por su antigüedad.
6. Verificar el enlace entre la autenticación dinámica CP7 y el reservador CP4 sin
   tocar lotes de producción. E33–E47 no pueden consumir numeración remota aún.
7. En el roadmap histórico `docs/operacion/ROADMAP-POINTSALESOFT-SECUENCIAS-ECF-MULTISUCURSAL-20261115.md`,
   el nombre `CP7` corresponde a QA de concurrencia. Este subhito de activación
   fue nombrado también CP7 en la conversación: conservar la distinción en los reportes.

## Siguiente checkpoint (solo lectura en PC)
Desde la raíz del repositorio:

```powershell
cd C:\Proyectos\PointSaleSoftResp
git status --short -- PuntoVenta/Fuentes/UfrmEcfSecuenciasConfig.pas PuntoVenta/Fuentes/UEcfSecuenciaVenta.pas PuntoVenta/Fuentes/UEcfSecuenciaRemota.pas
Select-String -Path .\PuntoVenta\Fuentes\UfrmEcfSecuenciasConfig.pas -Pattern 'CP7 QA|TIPOS_CANTIDAD|RutaRemoteImplementada'
Get-ChildItem .\PuntoVenta\Fuentes -Directory -Filter 'backup-ecf-cp7-*' | Select-Object Name
```

Interpretación:
- Si aparece `CP7 QA`, hay indicios del formulario nuevo instalado; verificar los
  otros dos fuentes y respaldo antes de dar la aplicación por cerrada.
- Si no aparece, NO volver a aplicar a ciegas; verificar primero el estado local y
  confirmar que el parche de E31/E32 precedente ya fue integrado.
- Si los fuentes están instalados, compilar Delphi 7 y abrir formulario con base TEST,
  sin activar REMOTO. Registrar error/resultado, NO declarar PASS sin prueba.
- Después: instalar esquema y endpoints solo en MySQL/PHP QA (con backup y credenciales
  fuera de Git), probar autorización; por último probar reintentos/idempotencia y
  no-duplicación de reserva antes de piloto.

## Criterios de salida para CP7 activación
- [ ] Delphi 7 compila y muestra diez tipos
- [ ] No habilita E33–E47 para reservar secuencias
- [ ] Solicitud durable y autorización exclusiva de Principal en TEST
- [ ] Credenciales protegidas y asociadas al equipo/RNC/sucursal/tipo/ambiente
- [ ] URL central autorizada, sin aceptar destino arbitrario en configuración de usuario
- [ ] Activación/revocación y reintento tras timeout comprobados
- [ ] LOCAL sin regresión, REMOTO sin fallback y pendientes sin pérdida
- [ ] Regresión de numeración y concurrencia QA; ninguna prueba PROD

Estado final documentado: **NO-GO para producción**.
