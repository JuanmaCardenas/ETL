-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2022-10-10 21:51:47 CEST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE arbitro (
    colegiados_n_colegiado INTEGER NOT NULL,
    internacional          VARCHAR2(255) NOT NULL,
    exfutbolista           VARCHAR2(255) NOT NULL,
    partido_resultado      VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX arbitro__idx ON
    arbitro (
        partido_resultado
    ASC );

ALTER TABLE arbitro ADD CONSTRAINT arbitro_pk PRIMARY KEY ( colegiados_n_colegiado );

CREATE TABLE colegiados (
    n_colegiado        INTEGER NOT NULL,
    nombre             VARCHAR2(255) NOT NULL,
    dni                VARCHAR2(255) NOT NULL,
    antiguedad         INTEGER NOT NULL,
    categoria_anterior VARCHAR2(255) NOT NULL
);

ALTER TABLE colegiados ADD CONSTRAINT colegiados_pk PRIMARY KEY ( n_colegiado );

CREATE TABLE consejeros (
    personal_dni  VARCHAR2(255) NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

ALTER TABLE consejeros ADD CONSTRAINT consejeros_pk PRIMARY KEY ( personal_dni );

CREATE TABLE director_deportivo (
    personal_dni  VARCHAR2(255) NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX director_deportivo__idx ON
    director_deportivo (
        equipo_nombre
    ASC );

ALTER TABLE director_deportivo ADD CONSTRAINT director_deportivo_pk PRIMARY KEY ( personal_dni );

CREATE TABLE entrenador (
    personal_dni  VARCHAR2(255) NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX entrenador__idx ON
    entrenador (
        equipo_nombre
    ASC );

ALTER TABLE entrenador ADD CONSTRAINT entrenador_pk PRIMARY KEY ( personal_dni );

CREATE TABLE entrenador_porteros (
    personal_dni  VARCHAR2(255) NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX entrenador_porteros__idx ON
    entrenador_porteros (
        equipo_nombre
    ASC );

ALTER TABLE entrenador_porteros ADD CONSTRAINT entrenador_porteros_pk PRIMARY KEY ( personal_dni );

CREATE TABLE equipo (
    nombre                           VARCHAR2(255) NOT NULL,
    n_socios                         INTEGER NOT NULL,
    campo                            VARCHAR2(255) NOT NULL,
    ciudad                           VARCHAR2(255) NOT NULL,
    fundacion                        DATE NOT NULL,
    anyos_primera                    INTEGER NOT NULL,
    fundador                         VARCHAR2(255) NOT NULL,
    partido_resultado                VARCHAR2(255) NOT NULL,
    partido_resultado2               VARCHAR2(255) NOT NULL,
    preparador_fisico_dni            VARCHAR2(255) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    entrenador_porteros_personal_dni VARCHAR2(255) NOT NULL,
    entrenador_personal_dni          VARCHAR2(255) NOT NULL,
    presidente_dni                   VARCHAR2(255) NOT NULL,
    medico_dni                       VARCHAR2(255) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    director_deportivo_personal_dni  VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX equipo__idx ON
    equipo (
        director_deportivo_personal_dni
    ASC );

CREATE UNIQUE INDEX equipo__idxv1 ON
    equipo (
        entrenador_personal_dni
    ASC );

CREATE UNIQUE INDEX equipo__idxv2 ON
    equipo (
        entrenador_porteros_personal_dni
    ASC );

CREATE UNIQUE INDEX equipo__idxv3 ON
    equipo (
        medico_dni
    ASC );

CREATE UNIQUE INDEX equipo__idxv4 ON
    equipo (
        partido_resultado
    ASC );

CREATE UNIQUE INDEX equipo__idxv5 ON
    equipo (
        partido_resultado2
    ASC );

CREATE UNIQUE INDEX equipo__idxv6 ON
    equipo (
        preparador_fisico_dni
    ASC );

CREATE UNIQUE INDEX equipo__idxv7 ON
    equipo (
        presidente_dni
    ASC );

ALTER TABLE equipo ADD CONSTRAINT equipo_pk PRIMARY KEY ( nombre );

CREATE TABLE futbolista (
    personal_dni  VARCHAR2(255) NOT NULL,
    apodo         VARCHAR2(255) NOT NULL,
    puesto        VARCHAR2(255) NOT NULL,
    fin_contrato  DATE NOT NULL,
    clausula      INTEGER NOT NULL,
    anyos_equipo  INTEGER NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

ALTER TABLE futbolista ADD CONSTRAINT futbolista_pk PRIMARY KEY ( personal_dni );

ALTER TABLE futbolista ADD CONSTRAINT futbolista_equipo_nombre_un UNIQUE ( equipo_nombre );

CREATE TABLE jornada (
    n_jornada             INTEGER NOT NULL,
    goles_cabeza          INTEGER NOT NULL,
    goles_propia          INTEGER NOT NULL,
    goles_penal           INTEGER NOT NULL,
    recaudacion_quinielas INTEGER NOT NULL
);

ALTER TABLE jornada ADD CONSTRAINT jornada_pk PRIMARY KEY ( n_jornada );

CREATE TABLE juez_de_linea (
    colegiados_n_colegiado INTEGER NOT NULL,
    arbitro_sig_temp       VARCHAR2(2) NOT NULL,
    edad                   INTEGER NOT NULL,
    partido_resultado      VARCHAR2(255) NOT NULL
);

ALTER TABLE juez_de_linea ADD CONSTRAINT juez_de_linea_pk PRIMARY KEY ( colegiados_n_colegiado );

CREATE TABLE medico (
    personal_dni  VARCHAR2(255) NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX medico__idx ON
    medico (
        equipo_nombre
    ASC );

ALTER TABLE medico ADD CONSTRAINT medico_pk PRIMARY KEY ( personal_dni );

CREATE TABLE partido (
    resultado                      VARCHAR2(255) NOT NULL,
    fecha                          DATE NOT NULL,
    hora                           VARCHAR2(255) NOT NULL,
    reacudacin                     INTEGER NOT NULL,
    espectadores                   INTEGER NOT NULL,
    equipo_nombre                  VARCHAR2(255) NOT NULL,
    equipo_nombre2                 VARCHAR2(255) NOT NULL,
    arbitro_colegiados_n_colegiado INTEGER NOT NULL,
    jornada_n_jornada              INTEGER NOT NULL
);

CREATE UNIQUE INDEX partido__idx ON
    partido (
        arbitro_colegiados_n_colegiado
    ASC );

CREATE UNIQUE INDEX partido__idxv1 ON
    partido (
        equipo_nombre
    ASC );

CREATE UNIQUE INDEX partido__idxv2 ON
    partido (
        equipo_nombre2
    ASC );

ALTER TABLE partido ADD CONSTRAINT partido_pk PRIMARY KEY ( resultado );

CREATE TABLE personal (
    dni              VARCHAR2(255) NOT NULL,
    nombre           VARCHAR2(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono         INTEGER NOT NULL,
    direccion        VARCHAR2(255) NOT NULL,
    sueldo           INTEGER NOT NULL
);

ALTER TABLE personal ADD CONSTRAINT personal_pk PRIMARY KEY ( dni );

CREATE TABLE preparador_fisico (
    personal_dni  VARCHAR2(255) NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX preparador_fisico__idx ON
    preparador_fisico (
        equipo_nombre
    ASC );

ALTER TABLE preparador_fisico ADD CONSTRAINT preparador_fisico_pk PRIMARY KEY ( personal_dni );

CREATE TABLE presidente (
    personal_dni  VARCHAR2(255) NOT NULL,
    equipo_nombre VARCHAR2(255) NOT NULL
);

CREATE UNIQUE INDEX presidente__idx ON
    presidente (
        equipo_nombre
    ASC );

ALTER TABLE presidente ADD CONSTRAINT presidente_pk PRIMARY KEY ( personal_dni );

ALTER TABLE arbitro
    ADD CONSTRAINT arbitro_colegiados_fk FOREIGN KEY ( colegiados_n_colegiado )
        REFERENCES colegiados ( n_colegiado );

ALTER TABLE arbitro
    ADD CONSTRAINT arbitro_partido_fk FOREIGN KEY ( partido_resultado )
        REFERENCES partido ( resultado );

ALTER TABLE consejeros
    ADD CONSTRAINT consejeros_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE consejeros
    ADD CONSTRAINT consejeros_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );

ALTER TABLE director_deportivo
    ADD CONSTRAINT director_deportivo_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE director_deportivo
    ADD CONSTRAINT director_deportivo_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );

ALTER TABLE entrenador
    ADD CONSTRAINT entrenador_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE entrenador
    ADD CONSTRAINT entrenador_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );

ALTER TABLE entrenador_porteros
    ADD CONSTRAINT entrenador_porteros_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE entrenador_porteros
    ADD CONSTRAINT entrenador_porteros_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_director_deportivo_fk FOREIGN KEY ( director_deportivo_personal_dni )
        REFERENCES director_deportivo ( personal_dni );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_entrenador_fk FOREIGN KEY ( entrenador_personal_dni )
        REFERENCES entrenador ( personal_dni );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_entrenador_porteros_fk FOREIGN KEY ( entrenador_porteros_personal_dni )
        REFERENCES entrenador_porteros ( personal_dni );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_medico_fk FOREIGN KEY ( medico_dni )
        REFERENCES medico ( personal_dni );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_partido_fk FOREIGN KEY ( partido_resultado )
        REFERENCES partido ( resultado );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_partido_fkv2 FOREIGN KEY ( partido_resultado2 )
        REFERENCES partido ( resultado );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_preparador_fisico_fk FOREIGN KEY ( preparador_fisico_dni )
        REFERENCES preparador_fisico ( personal_dni );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_presidente_fk FOREIGN KEY ( presidente_dni )
        REFERENCES presidente ( personal_dni );

ALTER TABLE futbolista
    ADD CONSTRAINT futbolista_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE futbolista
    ADD CONSTRAINT futbolista_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );

ALTER TABLE juez_de_linea
    ADD CONSTRAINT juez_de_linea_colegiados_fk FOREIGN KEY ( colegiados_n_colegiado )
        REFERENCES colegiados ( n_colegiado );

ALTER TABLE juez_de_linea
    ADD CONSTRAINT juez_de_linea_partido_fk FOREIGN KEY ( partido_resultado )
        REFERENCES partido ( resultado );

ALTER TABLE medico
    ADD CONSTRAINT medico_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE medico
    ADD CONSTRAINT medico_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );

ALTER TABLE partido
    ADD CONSTRAINT partido_arbitro_fk FOREIGN KEY ( arbitro_colegiados_n_colegiado )
        REFERENCES arbitro ( colegiados_n_colegiado );

ALTER TABLE partido
    ADD CONSTRAINT partido_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE partido
    ADD CONSTRAINT partido_equipo_fkv2 FOREIGN KEY ( equipo_nombre2 )
        REFERENCES equipo ( nombre );

ALTER TABLE partido
    ADD CONSTRAINT partido_jornada_fk FOREIGN KEY ( jornada_n_jornada )
        REFERENCES jornada ( n_jornada );

ALTER TABLE preparador_fisico
    ADD CONSTRAINT preparador_fisico_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE preparador_fisico
    ADD CONSTRAINT preparador_fisico_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );

ALTER TABLE presidente
    ADD CONSTRAINT presidente_equipo_fk FOREIGN KEY ( equipo_nombre )
        REFERENCES equipo ( nombre );

ALTER TABLE presidente
    ADD CONSTRAINT presidente_personal_fk FOREIGN KEY ( personal_dni )
        REFERENCES personal ( dni );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                            18
-- ALTER TABLE                             48
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   3
-- WARNINGS                                 0
