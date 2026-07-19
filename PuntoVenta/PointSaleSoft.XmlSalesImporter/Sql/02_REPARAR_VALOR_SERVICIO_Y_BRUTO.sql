/*
  Reparación puntual para el lote E320000050907 - E320000050921.

  Revise primero las consultas de Sql/01_VERIFICACION_POST_CARGA.sql.
  Ejecute este script dentro de una transacción controlada y confirme
  solamente después de verificar los resultados.
*/

UPDATE VENTAS_DET D
   SET D.VALOR_SERVICIO_DET = D.VALOR_TOTAL_DET
 WHERE EXISTS
       (
         SELECT 1
           FROM VENTAS_MAST V
           JOIN NCF_ASIGNADOS N
             ON N.SERIE = V.SERIE_NCF_ASIGNADO
          WHERE V.NUMERO = D.NUMERO
            AND CAST(SUBSTRING(N.NUMERO_NCF FROM 4 FOR 10) AS INTEGER)
                BETWEEN 50907 AND 50921
       )
   AND ABS(COALESCE(D.VALOR_SERVICIO_DET, 0) -
           COALESCE(D.VALOR_TOTAL_DET, 0)) > 0.01;

UPDATE VENTAS_MAST V
   SET V.MONTO_BRUTO =
       (
         SELECT SUM(COALESCE(D.VALOR_SERVICIO_DET, 0))
           FROM VENTAS_DET D
          WHERE D.NUMERO = V.NUMERO
       )
 WHERE EXISTS
       (
         SELECT 1
           FROM NCF_ASIGNADOS N
          WHERE N.SERIE = V.SERIE_NCF_ASIGNADO
            AND CAST(SUBSTRING(N.NUMERO_NCF FROM 4 FOR 10) AS INTEGER)
                BETWEEN 50907 AND 50921
       )
   AND ABS
       (
         COALESCE(V.MONTO_BRUTO, 0) -
         COALESCE
         (
           (
             SELECT SUM(COALESCE(D.VALOR_SERVICIO_DET, 0))
               FROM VENTAS_DET D
              WHERE D.NUMERO = V.NUMERO
           ),
           0
         )
       ) > 0.01;
