CREATE TABLE retenciones_dgii
(
   idRetencion Integer Not Null,
   fechaini Date,
   fechafinal Date,
   porciento Numeric(15,2),
   Descripcion varchar(80),
   status char(1)
);

CREATE TABLE retenciones_dgiiMaster
(
  numero Integer Not null,
  codigo_cte Integer Not null  
);
CREATE TABLE retenciones_dgiiDet
(
  idserie Integer Not Null,
  numero Integer Not Null,
  idRetencion Integer  
);
