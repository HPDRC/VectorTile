-- ##################### PART 1: fix the bug that SRID is missing for some tables. This is important to prevent mapnik from super slow start up ##################################
DROP VIEW osm_roads;
DROP VIEW osm_roads_gen0;
DROP VIEW osm_roads_gen1;
ALTER TABLE osm_landusages_gen0 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_landusages_gen1 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_mainroads_gen0 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_mainroads_gen1 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_motorways_gen0 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_motorways_gen1 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_railways_gen0 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_railways_gen1 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_waterareas_gen0 ALTER geometry SET DATA TYPE geometry(Geometry,900913);
ALTER TABLE osm_waterareas_gen1 ALTER geometry SET DATA TYPE geometry(Geometry,900913);

-- View: osm_roads

CREATE OR REPLACE VIEW osm_roads AS 
 SELECT osm_motorways.id,
    osm_motorways.osm_id,
    osm_motorways.geometry,
    osm_motorways.name,
    osm_motorways."name:en",
    osm_motorways.bridge,
    osm_motorways.ref,
    osm_motorways.tunnel,
    osm_motorways.oneway,
    osm_motorways.layer,
    osm_motorways.z_order,
    osm_motorways.access,
    osm_motorways.type,
    'motorways'::text AS class
   FROM osm_motorways
UNION ALL
 SELECT osm_mainroads.id,
    osm_mainroads.osm_id,
    osm_mainroads.geometry,
    osm_mainroads.name,
    osm_mainroads."name:en",
    osm_mainroads.bridge,
    osm_mainroads.ref,
    osm_mainroads.tunnel,
    osm_mainroads.oneway,
    osm_mainroads.layer,
    osm_mainroads.z_order,
    osm_mainroads.access,
    osm_mainroads.type,
    'mainroads'::text AS class
   FROM osm_mainroads
UNION ALL
 SELECT osm_minorroads.id,
    osm_minorroads.osm_id,
    osm_minorroads.geometry,
    osm_minorroads.name,
    osm_minorroads."name:en",
    osm_minorroads.bridge,
    osm_minorroads.ref,
    osm_minorroads.tunnel,
    osm_minorroads.oneway,
    osm_minorroads.layer,
    osm_minorroads.z_order,
    osm_minorroads.access,
    osm_minorroads.type,
    'minorroads'::text AS class
   FROM osm_minorroads
UNION ALL
 SELECT osm_railways.id,
    osm_railways.osm_id,
    osm_railways.geometry,
    osm_railways.name,
    osm_railways."name:en",
    osm_railways.bridge,
    NULL::character varying AS ref,
    osm_railways.tunnel,
    0 AS oneway,
    osm_railways.layer,
    osm_railways.z_order,
    osm_railways.access,
    osm_railways.type,
    'railways'::text AS class
   FROM osm_railways;
  
-- View: osm_roads_gen0

CREATE OR REPLACE VIEW osm_roads_gen0 AS 
 SELECT osm_railways_gen0.id,
    osm_railways_gen0.osm_id,
    osm_railways_gen0.geometry,
    osm_railways_gen0.name,
    osm_railways_gen0."name:en",
    osm_railways_gen0.bridge,
    NULL::character varying AS ref,
    osm_railways_gen0.tunnel,
    0 AS oneway,
    osm_railways_gen0.z_order,
    osm_railways_gen0.access,
    osm_railways_gen0.type,
    'railways_gen1'::text AS class
   FROM osm_railways_gen0
UNION ALL
 SELECT osm_mainroads_gen0.id,
    osm_mainroads_gen0.osm_id,
    osm_mainroads_gen0.geometry,
    osm_mainroads_gen0.name,
    osm_mainroads_gen0."name:en",
    osm_mainroads_gen0.bridge,
    osm_mainroads_gen0.ref,
    osm_mainroads_gen0.tunnel,
    osm_mainroads_gen0.oneway,
    osm_mainroads_gen0.z_order,
    osm_mainroads_gen0.access,
    osm_mainroads_gen0.type,
    'mainroads_gen1'::text AS class
   FROM osm_mainroads_gen0
UNION ALL
 SELECT osm_motorways_gen0.id,
    osm_motorways_gen0.osm_id,
    osm_motorways_gen0.geometry,
    osm_motorways_gen0.name,
    osm_motorways_gen0."name:en",
    osm_motorways_gen0.bridge,
    osm_motorways_gen0.ref,
    osm_motorways_gen0.tunnel,
    osm_motorways_gen0.oneway,
    osm_motorways_gen0.z_order,
    osm_motorways_gen0.access,
    osm_motorways_gen0.type,
    'motorways_gen1'::text AS class
   FROM osm_motorways_gen0;
  
-- View: osm_roads_gen1

CREATE OR REPLACE VIEW osm_roads_gen1 AS 
 SELECT osm_railways_gen1.id,
    osm_railways_gen1.osm_id,
    osm_railways_gen1.geometry,
    osm_railways_gen1.name,
    osm_railways_gen1."name:en",
    osm_railways_gen1.bridge,
    NULL::character varying AS ref,
    osm_railways_gen1.tunnel,
    0 AS oneway,
    osm_railways_gen1.z_order,
    osm_railways_gen1.access,
    osm_railways_gen1.type,
    'railways'::text AS class
   FROM osm_railways_gen1
UNION ALL
 SELECT osm_mainroads_gen1.id,
    osm_mainroads_gen1.osm_id,
    osm_mainroads_gen1.geometry,
    osm_mainroads_gen1.name,
    osm_mainroads_gen1."name:en",
    osm_mainroads_gen1.bridge,
    osm_mainroads_gen1.ref,
    osm_mainroads_gen1.tunnel,
    osm_mainroads_gen1.oneway,
    osm_mainroads_gen1.z_order,
    osm_mainroads_gen1.access,
    osm_mainroads_gen1.type,
    'mainroads'::text AS class
   FROM osm_mainroads_gen1
UNION ALL
 SELECT osm_motorways_gen1.id,
    osm_motorways_gen1.osm_id,
    osm_motorways_gen1.geometry,
    osm_motorways_gen1.name,
    osm_motorways_gen1."name:en",
    osm_motorways_gen1.bridge,
    osm_motorways_gen1.ref,
    osm_motorways_gen1.tunnel,
    osm_motorways_gen1.oneway,
    osm_motorways_gen1.z_order,
    osm_motorways_gen1.access,
    osm_motorways_gen1.type,
    'motorways'::text AS class
   FROM osm_motorways_gen1;

   
-- ##################### PART 2: create generalized tables for faster queries ##################################

----------------------------------------- area_label ------------------------------------------------------
-- use: ( SELECT type, name, area, stylegroup, geometry\n  FROM osm_area_label\n  WHERE geometry && !bbox! ORDER BY area DESC\n) AS data
-- create table: osm_area_label

BEGIN;
CREATE TABLE osm_area_label
(
  id serial NOT NULL,
  type character varying(255),
  name character varying(255),
  "name:en" character varying(255),
  area real,
  stylegroup character varying(255),
  geometry geometry(Point,900913),
  CONSTRAINT osm_area_label_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
COMMIT;

BEGIN;
INSERT INTO osm_area_label(type,name,"name:en",area,stylegroup,geometry) (SELECT type, name, "name:en", area, 'land' AS stylegroup, ST_PointOnSurface(geometry) AS geometry
  FROM osm_landusages
  WHERE (name IS NOT NULL OR "name:en" IS NOT NULL)
    AND type IN ('cemetery', 'college', 'commercial', 'common', 'garden', 'golf_course',
              'hospital', 'industrial', 'library', 'park', 'pedestrian', 'place_of_worship',
              'playground', 'school', 'sports_center', 'stadium', 'theatre', 'university' )
    AND ST_IsValid(geometry));

INSERT INTO osm_area_label(type,name,"name:en",area,stylegroup,geometry) (SELECT type, name, "name:en", area, 'water' AS stylegroup, ST_PointOnSurface(geometry) AS geometry
  FROM osm_waterareas
  WHERE (name IS NOT NULL OR "name:en" IS NOT NULL)
    AND type IN ( 'water', 'basin' )
    AND ST_IsValid(geometry));

INSERT INTO osm_area_label(type,name,"name:en",area,stylegroup,geometry) (SELECT type, name, "name:en", area, 'building' AS stylegroup, ST_PointOnSurface(geometry) AS geometry
  FROM osm_buildings
  WHERE (name IS NOT NULL OR "name:en" IS NOT NULL)
    AND ST_IsValid(geometry));
COMMIT;

BEGIN;
CREATE INDEX osm_area_label_geom
  ON osm_area_label
  USING gist(geometry) WITH (FILLFACTOR=100);
CLUSTER osm_area_label using osm_area_label_geom;
COMMIT;

ANALYZE osm_area_label;

----------------------------------------- building ------------------------------------------------------
-- Use: ( SELECT * FROM ( SELECT geometry, type, name, area\n FROM osm_buildings\n WHERE !scale_denominator!<15000 AND geometry && !bbox! \n UNION ALL\n SELECT geometry, type, name, area\n FROM osm_buildings_g1\n WHERE !scale_denominator!>15000 AND !scale_denominator!<50000 AND geometry && !bbox!\n UNION ALL\n SELECT geometry, type, name, area\n FROM osm_buildings_g2\n WHERE !scale_denominator!>50000 AND !scale_denominator!<200000 AND geometry && !bbox!\n) AS tmp ORDER BY ST_YMin(ST_Envelope(geometry)) DESC ) AS data
-- create table: osm_buildings_g1, simplify:10, area:200

BEGIN;
CREATE TABLE osm_buildings_g1
(
  id serial NOT NULL,
  name character varying(255),
  "name:en" character varying(255),
  type character varying(255),
  area real,
  geometry geometry(Geometry,900913),
  CONSTRAINT osm_buildings_g1_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
COMMIT;

BEGIN;
INSERT INTO osm_buildings_g1(name,"name:en",type,area,geometry) (SELECT name,"name:en",type,area,ST_SimplifyPreserveTopology(geometry, 10) as geometry
  FROM osm_buildings WHERE ST_Area(geometry)>200);
COMMIT;

BEGIN;
CREATE INDEX osm_buildings_g1_geom
  ON osm_buildings_g1
  USING gist(geometry) WITH (FILLFACTOR=100);
CLUSTER osm_buildings_g1 using osm_buildings_g1_geom;
COMMIT;

ANALYZE osm_buildings_g1;

-- create table: osm_buildings_g2, simplify:20, area:1600

BEGIN;
CREATE TABLE osm_buildings_g2
(
  id serial NOT NULL,
  name character varying(255),
  "name:en" character varying(255),
  type character varying(255),
  area real,
  geometry geometry(Geometry,900913),
  CONSTRAINT osm_buildings_g2_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
COMMIT;

BEGIN;
INSERT INTO osm_buildings_g2(name,"name:en",type,area,geometry) (SELECT name,"name:en",type,area,ST_SimplifyPreserveTopology(geometry, 20) as geometry
  FROM osm_buildings WHERE ST_Area(geometry)>1600);
COMMIT;

BEGIN;
CREATE INDEX osm_buildings_g2_geom
  ON osm_buildings_g2
  USING gist(geometry) WITH (FILLFACTOR=100);
CLUSTER osm_buildings_g2 using osm_buildings_g2_geom;
COMMIT;

ANALYZE osm_buildings_g2;

----------------------------------------- places ------------------------------------------------------
-- Use: ( SELECT * FROM (SELECT geometry, type, name, z_order, population FROM osm_places WHERE !scale_denominator!<200000\n  UNION ALL\n  SELECT geometry, type, name, z_order, population FROM osm_places_g1 WHERE !scale_denominator!>200000 ) AS tmp\n  ORDER BY z_order, population DESC NULLS LAST\n) AS data
-- create table osm_places_g1
BEGIN;
CREATE TABLE osm_places_g1
(
  id serial NOT NULL,
  name character varying(255),
  "name:en" character varying(255),
  type character varying(255),
  z_order smallint,
  population integer,
  geometry geometry(Point,900913),
  CONSTRAINT osm_places_g1_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
COMMIT;

BEGIN;
INSERT INTO osm_places_g1(name,"name:en",type,z_order,population,geometry) (SELECT name,"name:en",type,z_order,population,geometry FROM osm_places WHERE type IN ('country','state','county','city','town'));
COMMIT;

BEGIN;
CREATE INDEX osm_places_g1_geom
  ON osm_places_g1
  USING gist(geometry) WITH (FILLFACTOR=100);
CLUSTER osm_places_g1 using osm_places_g1_geom;
COMMIT;

ANALYZE osm_places_g1;

----------------------------------------- waterway ------------------------------------------------------
-- Use: ( SELECT geometry, type FROM osm_waterways_g1 WHERE !scale_denominator!<2500000 AND !scale_denominator!>100000\n  UNION ALL\n  SELECT geometry, type FROM osm_waterways WHERE type IN ('river', 'canal', 'stream') AND !scale_denominator!<100000 AND !scale_denominator!>25000\n  UNION ALL\n  SELECT geometry, type FROM osm_waterways WHERE type IN ('river', 'canal', 'stream', 'ditch', 'drain') AND !scale_denominator!<25000) AS data
-- create table osm_waterways_g1

BEGIN;
CREATE TABLE osm_waterways_g1
(
  id serial NOT NULL,
  name character varying(255),
  "name:en" character varying(255),
  type character varying(255),
  geometry geometry(LineString,900913),
  CONSTRAINT osm_waterways_g1_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
COMMIT;

BEGIN;
INSERT INTO osm_waterways_g1(name,"name:en",type,geometry) (SELECT name,"name:en",type,ST_SimplifyPreserveTopology(geometry, 50) as geometry FROM osm_waterways WHERE type IN ('river', 'canal'));
COMMIT;

BEGIN;
CREATE INDEX osm_waterways_g1_geom
  ON osm_waterways_g1
  USING gist(geometry) WITH (FILLFACTOR=100);
CLUSTER osm_waterways_g1 using osm_waterways_g1_geom;
COMMIT;

ANALYZE osm_waterways_g1;

----------------------------------------- admin ------------------------------------------------------
-- Use: ( SELECT geometry,name,type FROM osm_admin_g1 WHERE !scale_denominator!>25000000\n  UNION ALL\n  SELECT geometry,name,type FROM osm_admin_g2 WHERE !scale_denominator!<25000000 AND !scale_denominator!>5000000 AND admin_level>=4\n  UNION ALL\n  SELECT geometry,name,type FROM osm_admin WHERE !scale_denominator!<5000000 AND admin_level>=4) AS data
-- create table osm_admin_g1

BEGIN;
CREATE TABLE osm_admin_g1
(
  id serial NOT NULL,
  name character varying(255),
  "name:en" character varying(255),
  type character varying(255),
  admin_level smallint,
  geometry geometry(Geometry,900913),
  CONSTRAINT osm_admin_g1_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
COMMIT;

BEGIN;
INSERT INTO osm_admin_g1(name,"name:en",type,admin_level,geometry) (SELECT name,"name:en",type,admin_level,geometry FROM osm_admin WHERE admin_level<=3);
COMMIT;

BEGIN;
CREATE INDEX osm_admin_g1_geom ON osm_admin_g1 USING gist(geometry) WITH (FILLFACTOR=100);
CLUSTER osm_admin_g1 using osm_admin_g1_geom;
COMMIT;

ANALYZE osm_admin_g1;

-- create table osm_admin_g2

BEGIN;
CREATE TABLE osm_admin_g2
(
  id serial NOT NULL,
  name character varying(255),
  "name:en" character varying(255),
  type character varying(255),
  admin_level smallint,
  geometry geometry(Geometry,900913),
  CONSTRAINT osm_admin_g2_pkey PRIMARY KEY (id)
) WITH (OIDS=FALSE);
COMMIT;

BEGIN;
INSERT INTO osm_admin_g2(name,"name:en",type,admin_level,geometry) (SELECT name,"name:en",type,admin_level,geometry FROM osm_admin WHERE admin_level<=5);
COMMIT;

BEGIN;
CREATE INDEX osm_admin_g2_geom ON osm_admin_g2 USING gist(geometry) WITH (FILLFACTOR=100);
CLUSTER osm_admin_g2 using osm_admin_g2_geom;
COMMIT;


-------------------------------- Grant access --------------------------------
GRANT SELECT ON ALL TABLES IN SCHEMA public TO mapnik;

-------------------------------- !!! Execute the following as pgscript !!! --------------------------------

----------------------------------------- landuse ------------------------------------------------------
-- Use: (SELECT * FROM (SELECT geometry,type,area FROM osm_landusages_gen0 WHERE !scale_denominator!<50000000 AND !scale_denominator!>750000\n  UNION ALL\n  SELECT geometry,type,area FROM osm_landusages_gen1 WHERE !scale_denominator!<750000 AND !scale_denominator!>50000\n  UNION ALL\n  SELECT geometry,type,area FROM osm_landusages WHERE !scale_denominator!<50000) AS tmp ORDER BY area DESC\n) AS data

-- Clean table osm_landusages
DELETE FROM osm_landusages WHERE type NOT IN ('college','commercial','common','forest','hospital','industrial','parking','pedestrian','residential','school','university','wood','nature_reserve','wetland',
'park','cemetery','grass','sports_center','golf_course','stadium','pitch');
VACUUM FULL osm_landusages;
CLUSTER osm_landusages using osm_landusages_geom;
ANALYZE osm_landusages;

-- Clean table osm_landusages_gen1
DELETE FROM osm_landusages_gen1 WHERE type NOT IN ('college','commercial','common','forest','hospital','industrial','parking','pedestrian','residential','school','university','wood','nature_reserve','wetland',
'park','cemetery','grass','sports_center','golf_course','stadium','pitch');
VACUUM FULL osm_landusages_gen1;
CLUSTER osm_landusages_gen1 using osm_landusages_gen1_geom;
ANALYZE osm_landusages_gen1;

-- Clean table osm_landusages_gen0
DELETE FROM osm_landusages_gen0 WHERE type NOT IN ('college','commercial','common','forest','hospital','industrial','parking','pedestrian','residential','school','university','wood','nature_reserve','wetland');
VACUUM FULL osm_landusages_gen0;
CLUSTER osm_landusages_gen0 using osm_landusages_gen0_geom;
ANALYZE osm_landusages_gen0;
