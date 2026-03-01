/*
Alter table TRNCNT_MASTER
add reconcile smallint,
add sync_type smallint,
add sync_status integer;


Alter table TRNCNT_DETALLE
add reconcile smallint,
add sync_type smallint,
add sync_status integer;

Alter table TRNCNT_DETALLE
add sycDate date;

Alter table TRNCNT_MASTER
add sycDate date;

alter table TRNCNT_DETALLE
add SENTTODATACENTER num_smallint
*/