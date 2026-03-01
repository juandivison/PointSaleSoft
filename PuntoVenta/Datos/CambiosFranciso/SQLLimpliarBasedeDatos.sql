delete from SECUENCIA; --lleva control de devoluciones y venta cash
delete from adicional_regalia;
delete from balance_cnt;
delete from BALANCE_CTE;
--insertar balance inicial hasta sep 18
--t insert into balance_cte
--t select * from BALANCE_CTE_TRANSJM_INI;

delete from BALANCE_CXC_RECIBO;
delete from balance_cxp;

--insertar balance inicial hasta sep 18
--t insert into balance_cxp
--t select * from BALANCE_CXP_TRANSJM;

--temp delete from BALANCE_CXP_HISTORICO;
delete from BALANCE_DESPACHO;
delete from BALANCE_SEGUN_BCO;
delete from BCEORDDESP_EMP;
delete from BCE_CAJA_CHICA;
--temp delete from BLCE_CTE_HISTORICO;
delete from BLC_PLAN_FUNERARIO;
delete from CAFE_MASTER;
delete from CAFE_MASTER_DET;
delete from CAJA_TRN;
delete from CHEQUES;
delete from CHEQUES_DANADOS;
delete from CHEQUES_DET;
delete from CHEQUES_DET_NOMINA;
Delete From CHEQUES_ISR;
delete from CHEQUES_NOMINA;
delete from CHEQUES_PROG;
delete from CHEQUES_PROG_HIST;
--delete from CHEQUES_PTIPOCTA;
--Delete from CLIENTES where CLIENTES.CODIGO_CTE > 0;
--Delete From CLIENTES_CONTACTOS;
--Delete From CLIENTES_T;
Delete from CUADRE_RUTA;
--delete from EMPLEADO where EMPLEADO.CODIGO <> 8;
--delete from USUARIO WHERE codigo_empleado <> 8;
DELETE FROM COSTO_PRODUCTO;
delete from VENTAS_MAST;
delete from VENTAS_DET;
delete from COTIZACION_DET;
delete from COTIZACION_MAST;
Delete from VENTAS_DET_PREVENTA;
delete from VENTAS_DET_RECOVER;
delete from VENTAS_MAST_PREVENTA;
--delete from VENDEDORES;
delete from TRNCNT_DETALLE;
delete from TRNCNT_MASTER;
delete from TRANS_CXC;
delete from TRANS_CXP;
delete from TRANSAC_BANCARIA;
delete from TRANS_CXC_DET;
delete from ORDEN_COMP_DET;
delete from ORDEN_COMP_MAST;
--delete from  INVENTARIO_PRODUCTO_T;
--delete from INVENTARIO_PRODUCTO_ENTER;
--delete from INVENTARIO_PRODUCTO
delete from FACTURAS;
delete from FACTURAS_CXP_PENDIENTES;
delete from FACTURAS_PENDIENTES;
delete from FCTINGRESOS;
delete from FCTPAGOSCXCP;
delete from ESTUDIANTES_MASTER;
delete from ESTUDIANTE_DET;
delete from DESPACHO;
delete from DESPACHO_MASTER;
delete from NCF_ASIGNADOS;

delete From TRANS_CXC;
delete from BALANCE_CTE;
delete from FACTURAS;
delete from FACTURAS_PENDIENTES;
delete from TRANS_CXP;
delete from BALANCE_CXP;
delete From FACTURAS_CXP_PENDIENTES;
delete from VENTAS_DET;
delete from VENTAS_MAST;
delete from DETALLE_CAMIONES_VIAJE;
delete from DETALLE_CAMIONES_VIAJE_COT;
delete from DETALLE_PAGO_TARJETA;
delete from TRANS_COSTOS_MAST;
delete from TRANS_COSTOS_DET;
delete from VIAJE_CXPCHOFERES;
delete from VENTAS_DET_FULGONES;
SET GENERATOR GEN_SERIE_TRN_CXP TO 0;

SET GENERATOR GEN_SERIE_CXPCHOFER TO 0;
SET GENERATOR GEN_SERIE_DETFULGONES TO 0;
SET GENERATOR gen_num_transcostosmast TO 0;
SET GENERATOR GEN_NUM_TRANSCOSTOSDET TO 0;
SET GENERATOR GEN_NUMERO_TRNCNT_DETALLE TO 0;
SET GENERATOR GEN_NUMERO_TRNCNT_MASTER TO 0;
SET GENERATOR GEN_NUM_DESPACHOMASTER TO 0;
SET GENERATOR GEN_NUM_COTIZA_MAST TO 0;
SET GENERATOR GEN_NUM_COTIZA_DET TO 0;
--SET GENERATOR GEN_CODIGO_CTE TO 0;
SET GENERATOR GEN_NUM_VENTA_MAST_PREVENTA TO 0;
SET GENERATOR GEN_NUM_VENTA_MAST TO 0;
SET GENERATOR GEN_NUM_VENTA_DET_PREVENTA TO 0;
SET GENERATOR GEN_NUM_VENTA_DET_PREVENTA TO 0;
SET GENERATOR GEN_NUM_ORDEN_MAST TO 0;
SET GENERATOR GEN_NUM_ORDEN_DET TO 0;
SET GENERATOR GEN_SERIE_TRN_CXC TO 0;
SET GENERATOR GEN_SERIE_DESPACHODET TO 0;
SET GENERATOR GEN_SERIE_FACTURA TO 0;
SET GENERATOR GEN_NUM_FACTURA TO 0;
SET GENERATOR gen_serie_ncf_asig to 0;




--update REGISTRO
--set clave = 19702005,
--serial = null,
--fecha_registro = '08/01/2013',
--cantcorrida = 50,
--mod_financ = 0;




COMMIT;




SOFTWARE PARA CONTROL DE TRANSPORTE, COMBUSTIBLE Y RRHH