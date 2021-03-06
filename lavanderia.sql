
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ID_CLIENTE
--------------------------------------------------------

   CREATE SEQUENCE  "LAVANDERIA"."ID_CLIENTE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ID_DOMICILIO
--------------------------------------------------------

   CREATE SEQUENCE  "LAVANDERIA"."ID_DOMICILIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ID_PRENDA
--------------------------------------------------------

   CREATE SEQUENCE  "LAVANDERIA"."ID_PRENDA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ID_PRENDA_DOMICILIO
--------------------------------------------------------

   CREATE SEQUENCE  "LAVANDERIA"."ID_PRENDA_DOMICILIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ID_SERVICIO
--------------------------------------------------------

   CREATE SEQUENCE  "LAVANDERIA"."ID_SERVICIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 31 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ID_SERVICIO_DOMICILIO
--------------------------------------------------------

   CREATE SEQUENCE  "LAVANDERIA"."ID_SERVICIO_DOMICILIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 71 CACHE 10 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRENDAS_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "LAVANDERIA"."PRENDAS_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CLIENTES
--------------------------------------------------------

  CREATE TABLE "LAVANDERIA"."CLIENTES" 
   (	"ID_CLIENTE" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"IDENTIFICACION" VARCHAR2(50 BYTE), 
	"DIRECCION" VARCHAR2(100 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE), 
	"UBICACION" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DOMICILIOS
--------------------------------------------------------

  CREATE TABLE "LAVANDERIA"."DOMICILIOS" 
   (	"ID_DOMICILIO" NUMBER(*,0), 
	"NOMBRE_CLIENTE" VARCHAR2(200 BYTE), 
	"DIRECCION" VARCHAR2(200 BYTE), 
	"TELEFONO" VARCHAR2(20 BYTE), 
	"EDIFICIO_UNIDAD" VARCHAR2(200 BYTE), 
	"FECHA_ENTREGA" VARCHAR2(20 BYTE), 
	"FECHA_RECOGIDA" VARCHAR2(20 BYTE), 
	"PRENDAS" VARCHAR2(256 BYTE), 
	"ESTADO" VARCHAR2(50 BYTE), 
	"TURNO" NUMBER(*,0), 
	"FECHA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRENDAS
--------------------------------------------------------

  CREATE TABLE "LAVANDERIA"."PRENDAS" 
   (	"ID_PRENDA" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"ESTADO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRENDAS_DOMICILIO
--------------------------------------------------------

  CREATE TABLE "LAVANDERIA"."PRENDAS_DOMICILIO" 
   (	"ID_PRENDA_DOMICILIO" NUMBER(*,0), 
	"ID_DOMICILIO" NUMBER(*,0), 
	"ID_PRENDA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SERVICIOS_DOMICILIO
--------------------------------------------------------

  CREATE TABLE "LAVANDERIA"."SERVICIOS_DOMICILIO" 
   (	"ID_SERVICIO_DOMICILIO" NUMBER(*,0), 
	"ID_DOMICILIO" NUMBER(*,0), 
	"ID_TIPO_SERVICIO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TIPO_SERVICIOS
--------------------------------------------------------

  CREATE TABLE "LAVANDERIA"."TIPO_SERVICIOS" 
   (	"ID_SERVICIO" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(200 BYTE), 
	"ESTADO" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into LAVANDERIA.CLIENTES
SET DEFINE OFF;
REM INSERTING into LAVANDERIA.DOMICILIOS
SET DEFINE OFF;
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('42','Silvia Gomez','Carrera 45','3158748966','Tuya','2020-06-26','2020-06-25',null,'En espera','5',null);
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('53','Julian Yepez','Calle 7890','9663355','Santillana','2020-07-02','2020-07-01',null,'En Espera','3',null);
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('26','Juan Diego Martinez S','Castilla','4775773','WERWER','2020-06-30','2020-06-25',null,'En espera','1',null);
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('38','Julian Perez','Calle 789 # 45 - 16','4448411','Edicicio Marriott','2020-06-28','2020-06-26',null,'Entregado','1',null);
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('35','Daniela Ortiz','Calle 456','4567789','Tuya','2020-06-25','2020-06-24',null,'En espera','3',null);
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('41','Cristina Molina','Calle 6789','5226699','Santillana','2020-06-25','2020-06-25',null,'En Espera','4',null);
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('52','William Duque','Carrera56','2558963','Santillana','2020-07-02','2020-07-01',null,'En Espera','2',null);
Insert into LAVANDERIA.DOMICILIOS (ID_DOMICILIO,NOMBRE_CLIENTE,DIRECCION,TELEFONO,EDIFICIO_UNIDAD,FECHA_ENTREGA,FECHA_RECOGIDA,PRENDAS,ESTADO,TURNO,FECHA) values ('44','Wilson Perez','Calle 7892','4448411','Plaza colon','2020-07-02','2020-07-01',null,'En Espera','1',null);
REM INSERTING into LAVANDERIA.PRENDAS
SET DEFINE OFF;
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('13','Cortinas','activo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('15','Mantel','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('17','Mantel','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('6','prueba','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('7','prueba2','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('4','Pantalones','activo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('2','Chaqueta','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('5','Buzos','activo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('3','Chaquetas de cuero','activo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('14','Tendido','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('16','Mantel','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('12','Mantel','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('11','Camisas','activo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('18','Sabana','inactivo');
Insert into LAVANDERIA.PRENDAS (ID_PRENDA,NOMBRE,ESTADO) values ('19','Mantel','activo');
REM INSERTING into LAVANDERIA.PRENDAS_DOMICILIO
SET DEFINE OFF;
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('35','41','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('37','41','5');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('38','41','11');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('36','41','4');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('52','53','3');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('53','53','4');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('14','26','4');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('15','26','2');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('16','26','5');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('46','44','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('47','44','5');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('41','44','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('42','44','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('34','41','3');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('43','44','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('30','35','3');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('45','44','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('50','52','11');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('51','52','4');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('44','44','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('39','44','13');
Insert into LAVANDERIA.PRENDAS_DOMICILIO (ID_PRENDA_DOMICILIO,ID_DOMICILIO,ID_PRENDA) values ('40','44','5');
REM INSERTING into LAVANDERIA.SERVICIOS_DOMICILIO
SET DEFINE OFF;
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('26','26','4');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('44','41','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('45','41','7');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('60','53','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('61','53','12');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('42','41','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('43','41','4');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('48','44','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('49','44','12');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('50','44','20');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('54','44','12');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('55','44','20');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('41','41','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('51','44','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('53','44','12');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('58','52','12');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('59','52','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('52','44','12');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('46','44','1');
Insert into LAVANDERIA.SERVICIOS_DOMICILIO (ID_SERVICIO_DOMICILIO,ID_DOMICILIO,ID_TIPO_SERVICIO) values ('47','44','7');
REM INSERTING into LAVANDERIA.TIPO_SERVICIOS
SET DEFINE OFF;
Insert into LAVANDERIA.TIPO_SERVICIOS (ID_SERVICIO,NOMBRE,ESTADO) values ('12','Planchado',null);
Insert into LAVANDERIA.TIPO_SERVICIOS (ID_SERVICIO,NOMBRE,ESTADO) values ('1','Lavado','activo');
Insert into LAVANDERIA.TIPO_SERVICIOS (ID_SERVICIO,NOMBRE,ESTADO) values ('22','Secado',null);
--------------------------------------------------------
--  DDL for Index CLIENTES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LAVANDERIA"."CLIENTES_PK" ON "LAVANDERIA"."CLIENTES" ("ID_CLIENTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index DOMICILIOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LAVANDERIA"."DOMICILIOS_PK" ON "LAVANDERIA"."DOMICILIOS" ("ID_DOMICILIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PRENDAS_DOMICILIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LAVANDERIA"."PRENDAS_DOMICILIO_PK" ON "LAVANDERIA"."PRENDAS_DOMICILIO" ("ID_PRENDA_DOMICILIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SERVICIOS_DOMICILIO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LAVANDERIA"."SERVICIOS_DOMICILIO_PK" ON "LAVANDERIA"."SERVICIOS_DOMICILIO" ("ID_SERVICIO_DOMICILIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SERVICIOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "LAVANDERIA"."SERVICIOS_PK" ON "LAVANDERIA"."TIPO_SERVICIOS" ("ID_SERVICIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007751
--------------------------------------------------------

  CREATE UNIQUE INDEX "LAVANDERIA"."SYS_C007751" ON "LAVANDERIA"."PRENDAS" ("ID_PRENDA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CLIENTES
--------------------------------------------------------

  ALTER TABLE "LAVANDERIA"."CLIENTES" MODIFY ("ID_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."CLIENTES" ADD CONSTRAINT "CLIENTES_PK" PRIMARY KEY ("ID_CLIENTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DOMICILIOS
--------------------------------------------------------

  ALTER TABLE "LAVANDERIA"."DOMICILIOS" MODIFY ("ID_DOMICILIO" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."DOMICILIOS" MODIFY ("NOMBRE_CLIENTE" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."DOMICILIOS" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."DOMICILIOS" ADD CONSTRAINT "DOMICILIOS_PK" PRIMARY KEY ("ID_DOMICILIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRENDAS
--------------------------------------------------------

  ALTER TABLE "LAVANDERIA"."PRENDAS" MODIFY ("ID_PRENDA" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."PRENDAS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."PRENDAS" ADD PRIMARY KEY ("ID_PRENDA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRENDAS_DOMICILIO
--------------------------------------------------------

  ALTER TABLE "LAVANDERIA"."PRENDAS_DOMICILIO" MODIFY ("ID_PRENDA_DOMICILIO" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."PRENDAS_DOMICILIO" ADD CONSTRAINT "PRENDAS_DOMICILIO_PK" PRIMARY KEY ("ID_PRENDA_DOMICILIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SERVICIOS_DOMICILIO
--------------------------------------------------------

  ALTER TABLE "LAVANDERIA"."SERVICIOS_DOMICILIO" MODIFY ("ID_SERVICIO_DOMICILIO" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."SERVICIOS_DOMICILIO" ADD CONSTRAINT "SERVICIOS_DOMICILIO_PK" PRIMARY KEY ("ID_SERVICIO_DOMICILIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TIPO_SERVICIOS
--------------------------------------------------------

  ALTER TABLE "LAVANDERIA"."TIPO_SERVICIOS" MODIFY ("ID_SERVICIO" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."TIPO_SERVICIOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "LAVANDERIA"."TIPO_SERVICIOS" ADD CONSTRAINT "SERVICIOS_PK" PRIMARY KEY ("ID_SERVICIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
