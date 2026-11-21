/* CP13.10 / Firebird 2.5 - SOLO LECTURA.
   No ejecuta INSERT, UPDATE, DELETE, DDL, ni cambia estados fiscales.
   Ejecutar con permisos de lectura contra la misma base que usa PointSaleSoft.
*/

/* 1 - Comprobar si hay intentos duplicados por factura y emisor. */
SELECT RNC_EMISOR, NUMERO_TRN, COUNT(*) AS CANTIDAD
FROM ECF_API_INTENTO
GROUP BY RNC_EMISOR, NUMERO_TRN
HAVING COUNT(*) > 1;

/* 2 - Inspeccionar indices, unicidad y columnas (en orden). 
   Debe existir un indice unico ACTIVO con exactamente dos segmentos:
   RNC_EMISOR (posicion 0) y NUMERO_TRN (posicion 1).
   Analizar los resultados; no asumir que cualquier UNIQUE basta.
*/
SELECT TRIM(I.RDB$INDEX_NAME) AS INDICE,
       I.RDB$UNIQUE_FLAG AS UNICO,
       I.RDB$INDEX_INACTIVE AS INACTIVO,
       S.RDB$FIELD_POSITION AS POSICION,
       TRIM(S.RDB$FIELD_NAME) AS CAMPO
FROM RDB$INDICES I
JOIN RDB$INDEX_SEGMENTS S
  ON S.RDB$INDEX_NAME = I.RDB$INDEX_NAME
WHERE I.RDB$RELATION_NAME = 'ECF_API_INTENTO'
ORDER BY I.RDB$INDEX_NAME, S.RDB$FIELD_POSITION;

/* 3 - Configuracion de canal por RNC: no contiene secretos. */
SELECT RNC_EMISOR, CANAL_ENVIO, API_AMBIENTE
FROM ECF_CANAL_CONFIG
ORDER BY RNC_EMISOR;

/* 4 - Estados de intentos para determinar el plan de conciliacion. */
SELECT RNC_EMISOR, API_AMBIENTE, ESTADO_LOCAL, COUNT(*) AS CANTIDAD
FROM ECF_API_INTENTO
GROUP BY RNC_EMISOR, API_AMBIENTE, ESTADO_LOCAL
ORDER BY RNC_EMISOR, API_AMBIENTE, ESTADO_LOCAL;
