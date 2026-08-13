ECF_RESERVA - UNIFICACION DE ID POSITIVO
========================================

OBJETIVO
--------
Dejar de almacenar IDs negativos para reservas de GASTOS.

NUEVA REGLA
------------
INGRESOS y GASTOS consumen el mismo generador:

  ECF_RESERVA_GEN

Los nuevos IDs de GASTOS son positivos.

No se usa el signo del ID para identificar el origen de la reserva.
El origen de GASTOS se identifica por el HASH_DOC canonico:

  GASTO|CIA=<CIA>|TRN=<TRN>|TIPO=<41/43>

CAMBIOS
-------
1) UEcfReservaGastos.pas
   Antes:
     GEN_ID(GEN_ECF_RESERVA_GASTO_ID, 1)
     Result := -Secuencia

   Ahora:
     GEN_ID(ECF_RESERVA_GEN, 1)
     Result := Secuencia

2) GastoEcfValidator.cs
   Se elimina la regla:
     IdReserva >= 0 => no es GASTOS

   Ahora solo ID=0 es invalido.
   Esto permite:
   - nuevas reservas positivas;
   - reservas negativas historicas, sin romper operaciones anteriores.

3) ecfGastoMasterData.sql
   La reserva de GASTOS ya no se identifica por signo.
   El JOIN exige:
     HASH_DOC canonico de GASTOS
     +
     mismo e-NCF

   Esto evita depender de ID positivo/negativo y excluye reservas
   historicas renombradas con |OLD=.

HISTORICOS NEGATIVOS
--------------------
NO se renumeran.
No hay beneficio funcional en modificar PKs historicas y podria existir
alguna referencia externa no inventariada.

GEN_ECF_RESERVA_GASTO_ID
------------------------
Puede permanecer en la base por compatibilidad/rollback, pero el codigo
nuevo no lo consume. No se recomienda DROP en esta entrega.

ANTES DE PRODUCCION
-------------------
Ejecutar Audita_ECF_RESERVA_ID.sql y confirmar:

1. ECF_RESERVA_GEN devuelve valor > 0.
2. El generador comun es el mismo que utiliza INGRESOS.
3. MAX(ID) positivo no supera de forma anomala el estado del generador.

PRUEBAS
-------
A. Nueva reserva E43:
   - Debe guardar ECF_RESERVA.ID > 0.
   - HASH_DOC debe iniciar GASTO|.
   - Fase 1 (COD_PROVEEDOR=0) debe seguir funcionando.

B. Nueva reserva E41:
   - Debe guardar ECF_RESERVA.ID > 0.
   - C# --gasto debe encontrar IdReserva sin error.

C. Reasignacion:
   - Reserva retirada conserva su ID.
   - Nueva reserva canonica recibe otro ID positivo desde ECF_RESERVA_GEN.

D. Historico negativo:
   - Un E41/E43 ya reservado con ID < 0 debe seguir siendo legible.
   - GastoEcfValidator no debe rechazarlo solo por el signo.

E. Ingresos:
   - Generar una reserva de INGRESOS y una de GASTOS.
   - IDs deben ser positivos y distintos.

VALIDACION REALIZADA AQUI
-------------------------
Validacion estatica de referencias y flujo.
No se compilo Delphi 7 ni el proyecto .NET en este entorno.
