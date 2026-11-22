# Traslado verificable del PR #3 de IdesiToolECF

22/11/2026, America/Santo_Domingo. Destino: consolidacion/pointsalesoft-20261121.
Origen: https://github.com/juandivison/IdesiToolECF/pull/3
SHA inmutable: 08cfda5daf10c161baea522409c2a6c1d11c76b4.
Rama origen: docs/roadmap-pointsalesoft-secuencias-ecf-20261115.

## Integridad y alcance

Se verificaron los 24 nombres del PR contra GitHub y los blobs del SHA de origen.
Se trasladan 21 archivos byte por byte a las mismas rutas relativas de PointSaleSoft.
Las tres unidades UEcfSecuenciaCola, UEcfSecuenciaRemota y UEcfSecuenciaVenta
ya existen en PuntoVenta/Fuentes y coinciden normalizando solo CRLF.
inventario.json registra una correspondencia individual y el SHA-256 de cada blob.
No se aplica ningun parche historico sobre los fuentes actuales.
El archivo original de cada parche conserva tambien sus pruebas y cambios embebidos.
La recuperacion documental completa no acredita despliegue ni equivalencia funcional
de todos los cambios historicos del motor.

## Revision de efectos de los parches

La comparacion de lineas es orientativa, no una prueba de equivalencia semantica.
auditoria-lineas.json registra los resultados completos y las lineas divergentes.

- CP5-VENTAS-PENDIENTES: los nueve literales que difieren corresponden a la
  sustitucion por PrepararSecuenciaRemotaVenta y la lista uses posterior.
  El parche HTTPS de UProcVentaRapida contiene 56/56 lineas agregadas presentes
  en el fuente actual; se conserva el sucesor en vez de restaurar el paso antiguo.
- HTTPS UFacturaTxtBuilder: 48/48 lineas agregadas presentes; incluye fecha de
  vencimiento obtenida de ECF_SEC_SOLICITUD y conciliacion con la venta.
- HTTPS UEcfApiCredencialesIni: las dos declaraciones publicas DPAPI existen.
- AUDITORIA-GASTOS: persistencia/guardado Delphi activos. UEcfEnvioGastos 15/15,
  UGastoTxtEcfFlow 5/5, UGastoTxtBuilder 9/9 y UEcfGuardarDataset 24/24.
  La lista uses de URegistrarTransOpeDiariaECF es posterior (24/25 literales).
  UEcfReservaGastos conserva la proteccion REMOTO con codigo posterior; las
  tres diferencias son uses, acceso al INI y texto del aviso, no motivo para
  aplicar otra vez un parche anterior.
- PARIDAD-GASTOS: sus adiciones Delphi de envio/flow estan presentes (12/12 y
  1/1). Los cambios C#/SQL del motor y pruebas historicas se preservan dentro
  del parche; NO se instalaron ni se declararon equivalentes al motor actual.
- XML-FIRMADO-DEFAULT: se preserva completo como propuesta historica del CLI.
  Helpers y pruebas alli contenidos no se dan por activos en la auditoria actual.
- BANCO-AYACO-TAPICERIA: 38/38 lineas de reporte y 34/34 del helper presentes.
  La prueba BancoAyacoQA permanece recuperable dentro del parche.

## Validacion

Las tres unidades existentes coinciden con origen; los 21 archivos nuevos se
verifican por SHA-256 antes/despues de instalar y en el commit publicado.
CP5ColaQA, CP5HttpsLocalQA y CP5ConexionDelphiQA compilan aisladamente con Delphi 7.
No se ejecutaron: algunos ensayos historicos apuntan a una base fija y/o HTTPS.
SQL/PHP/INI/roadmap se preservan; no se ejecuta DDL, no se configura REMOTO y
no se acredita despliegue MySQL/PHP/HTTPS. PHP no esta disponible para lint local.
No se compilo el ERP ni se modifico el arbol de trabajo del motor.
Pagos Combinados / Cuadre de Caja permanece TODO.

## Retiro del origen

Cerrar el PR sin merge y retirar solo su rama remota exige comprobar que este
inventario y todos sus destinos existen en el commit publicado de consolidacion.
Ese cierre es limpieza del alojamiento temporal; no declara el milestone
CP5/CP6 terminado ni instala los parches C# en el motor bajo auditoria.
No fusionar este PR a IntegracionSaaS. No borrar otras ramas ni reescribir historia.
