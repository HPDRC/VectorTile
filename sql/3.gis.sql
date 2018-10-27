-- ###########################################################################################################################################
-- ###########################################################################################################################################
-- 
--                                            SQL scripts for DATASET 2: shapefiles from old mapnik
-- 
-- ###########################################################################################################################################
-- ###########################################################################################################################################

-- ###################### PART 0: sql examples ######################################

-- Example 1: change SRID meta information (do not change the data)
-- select UpdateGeometrySRID('public', 'tableName', 'geom', 4326);

-- ###################### PART 1: generate simplified gis tables from gis_raw (only contain necessary records), then create index and cluster ######################################
-- Table: area_incorp
CREATE TABLE area_incorp
(
  name character varying(90),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO area_incorp(name,geom) (SELECT * from dblink('dbname=gis_raw','select name,geom from area_incorp') as rec(name character varying(90), geom geometry(MultiPolygon,4326)));

CREATE INDEX area_incorp_geom
  ON area_incorp
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER area_incorp using area_incorp_geom;

-- Table: line_santiago_deleted_segments
CREATE TABLE line_santiago_deleted_segments
(
  geom geometry(MultiLineString,4326)
) WITH (OIDS=FALSE);

INSERT INTO line_santiago_deleted_segments(geom) (SELECT * from dblink('dbname=gis_raw','select geom from line_santiago_deleted_segments') as rec(geom geometry(MultiLineString,4326)));

CREATE INDEX line_santiago_deleted_segments_geom
  ON line_santiago_deleted_segments
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER line_santiago_deleted_segments using line_santiago_deleted_segments_geom;

-- Table: new_area_fa_parcel
CREATE TABLE new_area_fa_parcel
(
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_fa_parcel(geom) (SELECT * from dblink('dbname=gis_raw','select geom from new_area_fa_parcel') as rec(geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_fa_parcel_geom
  ON new_area_fa_parcel
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_fa_parcel using new_area_fa_parcel_geom;

-- Table: line_santiago_segments
CREATE TABLE line_santiago_segments
(
  st_name character varying(40),
  geom geometry(MultiLineString,4326)
) WITH (OIDS=FALSE);

INSERT INTO line_santiago_segments(st_name,geom) (SELECT * from dblink('dbname=gis_raw','select st_name,geom from line_santiago_segments') as rec(st_name character varying(40), geom geometry(MultiLineString,4326)));

CREATE INDEX line_santiago_segments_geom
  ON line_santiago_segments
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER line_santiago_segments using line_santiago_segments_geom;

-- Table: new_area_blkgrpy
CREATE TABLE new_area_blkgrpy
(
  name character varying(90),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_blkgrpy(name,geom) (SELECT * from dblink('dbname=gis_raw','select name,geom from new_area_blkgrpy') as rec(name character varying(90), geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_blkgrpy_geom
  ON new_area_blkgrpy
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_blkgrpy using new_area_blkgrpy_geom;

-- Table: new_area_coastline
CREATE TABLE new_area_coastline
(
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_coastline(geom) (SELECT * from dblink('dbname=gis_raw','select geom from new_area_coastline') as rec(geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_coastline_geom
  ON new_area_coastline
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_coastline using new_area_coastline_geom;

-- Table: new_area_elem
CREATE TABLE new_area_elem
(
  name character varying(100),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_elem(name,geom) (SELECT * from dblink('dbname=gis_raw','select name,geom from new_area_elem') as rec(name character varying(100), geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_elem_geom
  ON new_area_elem
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_elem using new_area_elem_geom;

-- Table: new_area_high
CREATE TABLE new_area_high
(
  name character varying(40),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_high(name,geom) (SELECT * from dblink('dbname=gis_raw','select name,geom from new_area_high') as rec(name character varying(40), geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_high_geom
  ON new_area_high
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_high using new_area_high_geom;

-- Table: new_area_mid
CREATE TABLE new_area_mid
(
  name character varying(100),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_mid(name,geom) (SELECT * from dblink('dbname=gis_raw','select name,geom from new_area_mid') as rec(name character varying(100), geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_mid_geom
  ON new_area_mid
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_mid using new_area_mid_geom;

-- Table: new_area_prism
CREATE TABLE new_area_prism
(
  labeltq character varying(16),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_prism(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from new_area_prism') as rec(labeltq character varying(16), geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_prism_geom
  ON new_area_prism
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_prism using new_area_prism_geom;

-- Table: new_area_santiago_landmarks
CREATE TABLE new_area_santiago_landmarks
(
  st_name character varying(53),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO new_area_santiago_landmarks(st_name,geom) (SELECT * from dblink('dbname=gis_raw','select st_name,geom from new_area_santiago_landmarks') as rec(st_name character varying(53), geom geometry(MultiPolygon,4326)));

CREATE INDEX new_area_santiago_landmarks_geom
  ON new_area_santiago_landmarks
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER new_area_santiago_landmarks using new_area_santiago_landmarks_geom;

-- Table: point_bg_mhinc
CREATE TABLE point_bg_mhinc
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_bg_mhinc(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_bg_mhinc') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_bg_mhinc_geom
  ON point_bg_mhinc
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_bg_mhinc using point_bg_mhinc_geom;

-- Table: point_blk_pop
CREATE TABLE point_blk_pop
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_blk_pop(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_blk_pop') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_blk_pop_geom
  ON point_blk_pop
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_blk_pop using point_blk_pop_geom;

-- Table: point_flpropertiesowner
CREATE TABLE point_flpropertiesowner
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_flpropertiesowner(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_flpropertiesowner') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_flpropertiesowner_geom
  ON point_flpropertiesowner
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_flpropertiesowner using point_flpropertiesowner_geom;

-- Table: point_flpropertiessize
CREATE TABLE point_flpropertiessize
(
  labeltq character varying(254),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_flpropertiessize(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_flpropertiessize') as rec(labeltq character varying(254), geom geometry(Point,4326)));

CREATE INDEX point_flpropertiessize_geom
  ON point_flpropertiessize
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_flpropertiessize using point_flpropertiessize_geom;

-- Table: point_flpropertiesvalue
CREATE TABLE point_flpropertiesvalue
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_flpropertiesvalue(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_flpropertiesvalue') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_flpropertiesvalue_geom
  ON point_flpropertiesvalue
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_flpropertiesvalue using point_flpropertiesvalue_geom;

-- Table: point_flpropertiesyear
CREATE TABLE point_flpropertiesyear
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_flpropertiesyear(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_flpropertiesyear') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_flpropertiesyear_geom
  ON point_flpropertiesyear
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_flpropertiesyear using point_flpropertiesyear_geom;

-- Table: point_gnis
CREATE TABLE point_gnis
(
  name character varying(50),
  type character varying(20),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_gnis(name,type,geom) (SELECT * from dblink('dbname=gis_raw','select name,type,geom from point_gnis') as rec(name character varying(50), type character varying(20), geom geometry(Point,4326)));

CREATE INDEX point_gnis_geom
  ON point_gnis
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_gnis using point_gnis_geom;

-- Table: point_hotels
CREATE TABLE point_hotels
(
  name character varying(50),
  stars character varying(5),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_hotels(name,stars,geom) (SELECT * from dblink('dbname=gis_raw','select name,stars,geom from point_hotels') as rec(name character varying(50), stars character varying(5), geom geometry(Point,4326)));

CREATE INDEX point_hotels_geom
  ON point_hotels
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_hotels using point_hotels_geom;

-- Table: point_nv_restrnts
CREATE TABLE point_nv_restrnts
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_nv_restrnts(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_nv_restrnts') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_nv_restrnts_geom
  ON point_nv_restrnts
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_nv_restrnts using point_nv_restrnts_geom;

-- Table: point_nypages
CREATE TABLE point_nypages
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_nypages(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_nypages') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_nypages_geom
  ON point_nypages
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_nypages using point_nypages_geom;

-- Table: point_physicianspecialty
CREATE TABLE point_physicianspecialty
(
  labeltq character varying(30),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_physicianspecialty(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_physicianspecialty') as rec(labeltq character varying(30), geom geometry(Point,4326)));

CREATE INDEX point_physicianspecialty_geom
  ON point_physicianspecialty
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_physicianspecialty using point_physicianspecialty_geom;

-- Table: point_re1n
CREATE TABLE point_re1n
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_re1n(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_re1n') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_re1n_geom
  ON point_re1n
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_re1n using point_re1n_geom;

-- Table: point_re2n
CREATE TABLE point_re2n
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_re2n(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_re2n') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_re2n_geom
  ON point_re2n
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_re2n using point_re2n_geom;

-- Table: point_rinn
CREATE TABLE point_rinn
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_rinn(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_rinn') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_rinn_geom
  ON point_rinn
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_rinn using point_rinn_geom;

-- Table: point_rldn
CREATE TABLE point_rldn
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_rldn(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_rldn') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_rldn_geom
  ON point_rldn
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_rldn using point_rldn_geom;

-- Table: point_rntn
CREATE TABLE point_rntn
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_rntn(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_rntn') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_rntn_geom
  ON point_rntn
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_rntn using point_rntn_geom;

-- Table: point_santiago_nodes
CREATE TABLE point_santiago_nodes
(
  ref_id character varying(35),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_santiago_nodes(ref_id,geom) (SELECT * from dblink('dbname=gis_raw','select ref_id,geom from point_santiago_nodes') as rec(ref_id character varying(35), geom geometry(Point,4326)));

CREATE INDEX point_santiago_nodes_geom
  ON point_santiago_nodes
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_santiago_nodes using point_santiago_nodes_geom;

-- Table: point_santiago_streets
CREATE TABLE point_santiago_streets
(
  st_name character varying(64),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_santiago_streets(st_name,geom) (SELECT * from dblink('dbname=gis_raw','select st_name,geom from point_santiago_streets') as rec(st_name character varying(64), geom geometry(Point,4326)));

CREATE INDEX point_santiago_streets_geom
  ON point_santiago_streets
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_santiago_streets using point_santiago_streets_geom;

-- Table: zip
CREATE TABLE zip
(
  zip character varying(5),
  geom geometry(MultiPolygon,4326)
) WITH (OIDS=FALSE);

INSERT INTO zip(zip,geom) (SELECT * from dblink('dbname=gis_raw','select zip,geom from zip') as rec(zip character varying(5), geom geometry(MultiPolygon,4326)));

CREATE INDEX zip_geom
  ON zip
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER zip using zip_geom;

-- Table: point_wtown3
CREATE TABLE point_wtown3
(
  labeltq character varying(16),
  geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO point_wtown3(labeltq,geom) (SELECT * from dblink('dbname=gis_raw','select labeltq,geom from point_wtown3') as rec(labeltq character varying(16), geom geometry(Point,4326)));

CREATE INDEX point_wtown3_geom
  ON point_wtown3
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER point_wtown3 using point_wtown3_geom;

-- Table: streets_20121108
CREATE TABLE streets_20121108
(
  st_name character varying(240),
  func_class character varying(1),
  geom geometry(MultiLineString,4326)
) WITH (OIDS=FALSE);

INSERT INTO streets_20121108(st_name,func_class,geom) (SELECT * from dblink('dbname=gis_raw','select st_name,func_class,geom from streets_20121108') as rec(st_name character varying(240), func_class character varying(1), geom geometry(MultiLineString,4326)));

CREATE INDEX streets_20121108_geom
  ON streets_20121108
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER streets_20121108 using streets_20121108_geom;

-------------------- for wm tables, they're imported into gis directly so the copy is skipped ---------------------
CREATE INDEX wm_airports_geom ON wm_airports USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_airports USING wm_airports_geom;

CREATE INDEX wm_capitals_geom ON wm_capitals USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_capitals USING wm_capitals_geom;

CREATE INDEX wm_cities_75k_to_900k_geom ON wm_cities_75k_to_900k USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_cities_75k_to_900k USING wm_cities_75k_to_900k_geom;

CREATE INDEX wm_cities_greater_900k_geom ON wm_cities_greater_900k USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_cities_greater_900k USING wm_cities_greater_900k_geom;

CREATE INDEX wm_cities_unknownpop_geom ON wm_cities_unknownpop USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_cities_unknownpop USING wm_cities_unknownpop_geom;

CREATE INDEX wm_cultural_landmarks_geom ON wm_cultural_landmarks USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_cultural_landmarks USING wm_cultural_landmarks_geom;

CREATE INDEX wm_glacier_geom ON wm_glacier USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_glacier USING wm_glacier_geom;

CREATE INDEX wm_great_lakes_geom ON wm_great_lakes USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_great_lakes USING wm_great_lakes_geom;

CREATE INDEX wm_major_routes_geom ON wm_major_routes USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_major_routes USING wm_major_routes_geom;

CREATE INDEX wm_marine_ports_geom ON wm_marine_ports USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_marine_ports USING wm_marine_ports_geom;

CREATE INDEX wm_minor_routes_geom ON wm_minor_routes USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_minor_routes USING wm_minor_routes_geom;

CREATE INDEX wm_railroad_track_geom ON wm_railroad_track USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_railroad_track USING wm_railroad_track_geom;

CREATE INDEX wm_railway_stations_geom ON wm_railway_stations USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_railway_stations USING wm_railway_stations_geom;

CREATE INDEX wm_seas_bays_geom ON wm_seas_bays USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_seas_bays USING wm_seas_bays_geom;

CREATE INDEX wm_utilities_geom ON wm_utilities USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_utilities USING wm_utilities_geom;

CREATE INDEX wm_water_poly_geom ON wm_water_poly USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_water_poly USING wm_water_poly_geom;

CREATE INDEX wm_world_admin_geom ON wm_world_admin USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_world_admin USING wm_world_admin_geom;

CREATE INDEX wm_world_nations_geom ON wm_world_nations USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER wm_world_nations USING wm_world_nations_geom;

-- ###################### PART 2: fix some errors in the data ######################################

-- some tables contain out of boundary points
delete from point_flpropertiesowner where ST_Within(geom, ST_GeomFromText('POLYGON((-180 -90,180 -90, 180 90, -180 90,-180 -90))', 4326))=false;
delete from point_flpropertiessize where ST_Within(geom, ST_GeomFromText('POLYGON((-180 -90,180 -90, 180 90, -180 90,-180 -90))', 4326))=false;
delete from point_flpropertiesvalue where ST_Within(geom, ST_GeomFromText('POLYGON((-180 -90,180 -90, 180 90, -180 90,-180 -90))', 4326))=false;
delete from point_flpropertiesyear where ST_Within(geom, ST_GeomFromText('POLYGON((-180 -90,180 -90, 180 90, -180 90,-180 -90))', 4326))=false;
delete from point_wtown3 where ST_Within(geom, ST_GeomFromText('POLYGON((-180 -90,180 -90, 180 90, -180 90,-180 -90))', 4326))=false;

-- wm_world_admin table, remove invalid polygons, and pre-calculate centers
delete from wm_world_admin where ST_IsValid(geom)!=true;
ALTER TABLE wm_world_admin ADD center geometry(Point,900913);
UPDATE wm_world_admin SET center=ST_PointOnSurface(geom);

-- wm_world_nations table
delete from wm_world_nations where ST_IsValid(geom)!=true;
ALTER TABLE wm_world_nations ADD center geometry(Point,900913);
UPDATE wm_world_nations SET center=ST_PointOnSurface(geom);



-- ###################### PART 3: transform SRID from 4326 to 900913 ######################################
ALTER TABLE area_incorp ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_fa_parcel ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE line_santiago_deleted_segments ALTER COLUMN geom TYPE geometry(MultiLineString,900913) USING ST_Transform(geom,900913);
ALTER TABLE line_santiago_segments ALTER COLUMN geom TYPE geometry(MultiLineString,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_blkgrpy ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_coastline ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_elem ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_high ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_mid ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_prism ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE new_area_santiago_landmarks ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_bg_mhinc ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_blk_pop ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_flpropertiesowner ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_flpropertiessize ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_flpropertiesvalue ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_flpropertiesyear ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_gnis ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_hotels ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_nv_restrnts ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_nypages ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_physicianspecialty ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_re1n ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_re2n ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_rldn ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_rinn ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_rntn ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_santiago_nodes ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_santiago_streets ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE zip ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE point_wtown3 ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE streets_20121108 ALTER COLUMN geom TYPE geometry(MultiLineString,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_airports ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_capitals ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_cities_75k_to_900k ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_cities_greater_900k ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_cities_unknownpop ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_cultural_landmarks ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_glacier ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_great_lakes ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_major_routes ALTER COLUMN geom TYPE geometry(MultiLineString,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_marine_ports ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_minor_routes ALTER COLUMN geom TYPE geometry(MultiLineString,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_railroad_track ALTER COLUMN geom TYPE geometry(MultiLineString,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_railway_stations ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_seas_bays ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_utilities ALTER COLUMN geom TYPE geometry(MultiLineString,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_water_poly ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_world_admin ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);
ALTER TABLE wm_world_nations ALTER COLUMN geom TYPE geometry(MultiPolygon,900913) USING ST_Transform(geom,900913);



-- ###################### PART 4: create generalized tables for faster queries ######################################

-- Table: streets_20121108_high
CREATE TABLE streets_20121108_high
(
  st_name character varying(240),
  geom geometry(MultiLineString,900913)
) WITH (OIDS=FALSE);

INSERT INTO streets_20121108_high(st_name,geom) (SELECT st_name,geom from streets_20121108 WHERE func_class='1' OR func_class='2');

CREATE INDEX streets_20121108_high_geom
  ON streets_20121108_high
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER streets_20121108_high using streets_20121108_high_geom;

-- Table: streets_20121108_mid
CREATE TABLE streets_20121108_mid
(
  st_name character varying(240),
  geom geometry(MultiLineString,900913)
) WITH (OIDS=FALSE);

INSERT INTO streets_20121108_mid(st_name,geom) (SELECT st_name,geom from streets_20121108 WHERE func_class='3' OR func_class='4');

CREATE INDEX streets_20121108_mid_geom
  ON streets_20121108_mid
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER streets_20121108_mid using streets_20121108_mid_geom;

update streets_20121108_high set st_name='' where length(st_name) < 3;
update streets_20121108_mid set st_name='' where length(st_name) < 3;



-- ###########################################################################################################################################
-- ###########################################################################################################################################
-- 
--                                            SQL scripts for DATASET 2: firstamerican_points_2014
-- 
-- ###########################################################################################################################################
-- ###########################################################################################################################################

-- copy and simplify table firstamerican_points_2014
CREATE TABLE firstamerican_points_2014
(
    owner character varying(255),
    std_addr character varying(255),
    geom geometry(Point,4326)
) WITH (OIDS=FALSE);

INSERT INTO firstamerican_points_2014(owner,std_addr,geom) (SELECT * from dblink('dbname=gis_raw','select owner,std_addr,geom from firstamerican_points_2014') as rec(owner character varying(256), std_addr character varying(256), geom geometry(Point,4326)));
ALTER TABLE firstamerican_points_2014 ALTER COLUMN geom TYPE geometry(Point,900913) USING ST_Transform(geom,900913);

CREATE INDEX firstamerican_points_2014_geom
  ON firstamerican_points_2014
  USING gist(geom) WITH (FILLFACTOR=100);
CLUSTER firstamerican_points_2014 using firstamerican_points_2014_geom;