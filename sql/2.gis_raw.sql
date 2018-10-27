-- ###########################################################################################################################################
-- ###########################################################################################################################################
-- 
--                                            SQL scripts for DATASET 1: shapefiles from old mapnik
-- 
-- ###########################################################################################################################################
-- ###########################################################################################################################################

-- ################################## PART 1: deduplicate for all tables. this is because imported shape files are previously cut by lat/lon and geometries crossing boundaries will exist in multiple shape files #########################

------------- streets_20121108 --------------
select count(*) from streets_20121108 group by link_id having count(*) > 1
with cte as ( select gid, row_number() over(partition by link_id order by gid desc) as rn from streets_20121108 )
  delete from streets_20121108 where gid in (select gid from cte where rn > 1)

------------- area_incorp --------------
select count(*) from area_incorp group by geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by geom order by gid desc) as rn from area_incorp )
  delete from area_incorp where gid in (select gid from cte where rn > 1)

------------- line_santiago_deleted_segments --------------
select count(*) from line_santiago_deleted_segments group by id having count(*) > 1
with cte as ( select gid, row_number() over(partition by id order by gid desc) as rn from line_santiago_deleted_segments )
  delete from line_santiago_deleted_segments where gid in (select gid from cte where rn > 1)

------------- line_santiago_segments --------------
select count(*) from line_santiago_segments group by id having count(*) > 1
with cte as ( select gid, row_number() over(partition by id order by gid desc) as rn from line_santiago_segments )
  delete from line_santiago_segments where gid in (select gid from cte where rn > 1)

------------- new_area_blkgrpy --------------
select count(*) from new_area_blkgrpy group by geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by geom order by gid desc) as rn from new_area_blkgrpy )
  delete from new_area_blkgrpy where gid in (select gid from cte where rn > 1)

------------- new_area_coastline --------------
select count(*) from new_area_coastline group by error,tile_x,tile_y,source,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by error,tile_x,tile_y,source,geom order by gid desc) as rn from new_area_coastline )
  delete from new_area_coastline where gid in (select gid from cte where rn > 1)

------------- new_area_elem --------------
select count(*) from new_area_elem group by loc_no,name,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by loc_no,name,geom order by gid desc) as rn from new_area_elem )
  delete from new_area_elem where gid in (select gid from cte where rn > 1)

------------- new_area_fa_parcel --------------
select count(*) from new_area_fa_parcel group by parcel_id,owner,addr,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by parcel_id,owner,addr,geom order by gid desc) as rn from new_area_fa_parcel )
  delete from new_area_fa_parcel where gid in (select gid from cte where rn > 1)

------------- new_area_high --------------
select count(*) from new_area_high group by loc_no,name,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by loc_no,name,geom order by gid desc) as rn from new_area_high )
  delete from new_area_high where gid in (select gid from cte where rn > 1)

------------- new_area_mid --------------
select count(*) from new_area_mid group by loc_no,name,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by loc_no,name,geom order by gid desc) as rn from new_area_mid )
  delete from new_area_mid where gid in (select gid from cte where rn > 1)

------------- new_area_prism --------------
select count(*) from new_area_prism group by annual_,annual_id,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by annual_,annual_id,geom order by gid desc) as rn from new_area_prism )
  delete from new_area_prism where gid in (select gid from cte where rn > 1)

------------- new_area_santiago_landmarks --------------
select count(*) from new_area_santiago_landmarks group by id,st_name,update_t,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by id,st_name,update_t,geom order by gid desc) as rn from new_area_santiago_landmarks )
  delete from new_area_santiago_landmarks where gid in (select gid from cte where rn > 1)

------------- point_bg_mhinc --------------
select count(*) from point_bg_mhinc group by state,county,tract,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by state,county,tract,geom order by gid desc) as rn from point_bg_mhinc )
  delete from point_bg_mhinc where gid in (select gid from cte where rn > 1)

------------- point_blk_pop --------------
select count(*) from point_blk_pop group by state,county,tract,block,cens_value,latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by state,county,tract,block,cens_value,latq,longq,labeltq,geom order by gid desc) as rn from point_blk_pop )
  delete from point_blk_pop where gid in (select gid from cte where rn > 1)

------------- point_flpropertiesowner --------------
select count(*) from point_flpropertiesowner group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_flpropertiesowner )
  delete from point_flpropertiesowner where gid in (select gid from cte where rn > 1)

------------- point_flpropertiessize --------------
select count(*) from point_flpropertiessize group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_flpropertiessize )
  delete from point_flpropertiessize where gid in (select gid from cte where rn > 1)

------------- point_flpropertiesvalue --------------
select count(*) from point_flpropertiesvalue group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_flpropertiesvalue )
  delete from point_flpropertiesvalue where gid in (select gid from cte where rn > 1)

------------- point_flpropertiesyear --------------
select count(*) from point_flpropertiesyear group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_flpropertiesyear )
  delete from point_flpropertiesyear where gid in (select gid from cte where rn > 1)

------------- point_gnis --------------
select count(*) from point_gnis group by latq,longq,name,type,inoteq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,name,type,inoteq,geom order by gid desc) as rn from point_gnis )
  delete from point_gnis where gid in (select gid from cte where rn > 1)

------------- point_hotels --------------
select count(*) from point_hotels group by shortname,name,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by shortname,name,geom order by gid desc) as rn from point_hotels )
  delete from point_hotels where gid in (select gid from cte where rn > 1)

------------- point_nv_restrnts --------------
select count(*) from point_nv_restrnts group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_nv_restrnts )
  delete from point_nv_restrnts where gid in (select gid from cte where rn > 1)

------------- point_nypages --------------
select count(*) from point_nypages group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_nypages )
  delete from point_nypages where gid in (select gid from cte where rn > 1)

------------- point_physicianspecialty --------------
select count(*) from point_physicianspecialty group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_physicianspecialty )
  delete from point_physicianspecialty where gid in (select gid from cte where rn > 1)

------------- point_re1n --------------
select count(*) from point_re1n group by latq,longq,labeltq,label1tq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,label1tq,geom order by gid desc) as rn from point_re1n )
  delete from point_re1n where gid in (select gid from cte where rn > 1)

------------- point_re2n --------------
select count(*) from point_re2n group by latq,longq,labeltq,label1tq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,label1tq,geom order by gid desc) as rn from point_re2n )
  delete from point_re2n where gid in (select gid from cte where rn > 1)

------------- point_rinn --------------
select count(*) from point_rinn group by latq,longq,labeltq,label1tq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,label1tq,geom order by gid desc) as rn from point_rinn )
  delete from point_rinn where gid in (select gid from cte where rn > 1)

------------- point_rldn --------------
select count(*) from point_rldn group by latq,longq,labeltq,label1tq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,label1tq,geom order by gid desc) as rn from point_rldn )
  delete from point_rldn where gid in (select gid from cte where rn > 1)

------------- point_rntn --------------
select count(*) from point_rntn group by latq,longq,labeltq,label1tq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,label1tq,geom order by gid desc) as rn from point_rntn )
  delete from point_rntn where gid in (select gid from cte where rn > 1)

------------- point_santiago_nodes --------------
select count(*) from point_santiago_nodes group by id,update_t,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by id,update_t,geom order by gid desc) as rn from point_santiago_nodes )
  delete from point_santiago_nodes where gid in (select gid from cte where rn > 1)

------------- point_santiago_streets --------------
select count(*) from point_santiago_streets group by id,st_name,city_id,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by id,st_name,city_id,geom order by gid desc) as rn from point_santiago_streets )
  delete from point_santiago_streets where gid in (select gid from cte where rn > 1)

------------- point_wtown3 --------------
select count(*) from point_wtown3 group by latq,longq,labeltq,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by latq,longq,labeltq,geom order by gid desc) as rn from point_wtown3 )
  delete from point_wtown3 where gid in (select gid from cte where rn > 1)

------------- zip --------------
select count(*) from zip group by area,zip,po_name,sumblkpop,pop1999,geom having count(*) > 1
with cte as ( select gid, row_number() over(partition by area,zip,po_name,sumblkpop,pop1999,geom order by gid desc) as rn from zip )
  delete from zip where gid in (select gid from cte where rn > 1)



-- ###########################################################################################################################################
-- ###########################################################################################################################################
-- 
--                                            SQL scripts for DATASET 2: blkgrpy, firstamerican_points_2014
-- 
-- ###########################################################################################################################################
-- ###########################################################################################################################################

--------------------- import firstamerican_points_2014 ---------------------------
-- first, create table contains ALL columns in the dataset (mandatory because postgres COPY command won't skip any column)
CREATE TABLE firstamerican_points_2014
(
    gid serial NOT NULL,
    parcel_id character varying(255),
    state_code character varying(255),
    cnty_code character varying(255),
    apn character varying(255),
    apn2 character varying(255),
    owner character varying(255),
    addr character varying(255),
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    plus character varying(255),
    std_addr character varying(255),
    std_city character varying(255),
    std_state character varying(255),
    std_zip character varying(255),
    std_plus character varying(255),
    type_code character varying(255),
    latitude double precision,
    longitude double precision,
    geom geometry(Point,4326),
    CONSTRAINT firstamerican_points_2014_pkey PRIMARY KEY (gid)
) WITH (OIDS=FALSE);

-- then, execute the following command in linux server
-- `sudo -u postgres -i`
-- `psql -d gis_raw`
-- `COPY firstamerican_points_2014(parcel_id,state_code,cnty_code,apn,apn2,owner,addr,city,state,zip,plus,std_addr,std_city,std_state,std_zip,std_plus,type_code,latitude,longitude) FROM '/tileservice/import/other_data/firstamerican_points_2014.asc' DELIMITERS E'\t' CSV;`

-- then, translate latlon into point geometry
UPDATE firstamerican_points_2014 SET geom = ST_GeomFromText('POINT(' || longitude || ' ' || latitude || ')',4326);

-- at last, analyze
analyze firstamerican_points_2014;