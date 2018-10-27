#!/bin/sh

./import.sh data/area/incorp gis_raw area_incorp 
./import.sh data/line/santiago_deleted_segments gis_raw line_santiago_deleted_segments 
./import.sh data/line/santiago_segments gis_raw line_santiago_segments 
./import.sh data/new_area/blkgrpy gis_raw new_area_blkgrpy 
./import.sh data/new_area/coastline gis_raw new_area_coastline 
./import.sh data/new_area/elem gis_raw new_area_elem 
./import.sh data/new_area/FA_Parcel gis_raw new_area_FA_Parcel 
./import.sh data/new_area/FLA_District gis_raw new_area_FLA_District 
./import.sh data/new_area/high gis_raw new_area_high 
./import.sh data/new_area/mid gis_raw new_area_mid 
./import.sh data/new_area/prism gis_raw new_area_prism 
./import.sh data/new_area/referenciaLimite gis_raw new_area_referenciaLimite 
./import.sh data/new_area/santiago_landmarks gis_raw new_area_santiago_landmarks 
./import.sh data/point/bg_mhinc gis_raw point_bg_mhinc 
./import.sh data/point/blk_pop gis_raw point_blk_pop 
./import.sh data/point/flpropertiesowner gis_raw point_flpropertiesowner 
./import.sh other_data/flpropertiessize.shp gis_raw point_flpropertiessize
./import.sh data/point/flpropertiesvalue gis_raw point_flpropertiesvalue 
./import.sh data/point/flpropertiesyear gis_raw point_flpropertiesyear 
./import.sh data/point/gnis gis_raw point_gnis 
./import.sh data/point/hotels gis_raw point_hotels 
./import.sh data/point/nv_restrnts gis_raw point_nv_restrnts 
./import.sh data/point/nypages gis_raw point_nypages 
./import.sh data/point/physicianspecialty gis_raw point_physicianspecialty 
./import.sh data/point/re1n gis_raw point_re1n 
./import.sh data/point/re2n gis_raw point_re2n 
./import.sh data/point/rinn gis_raw point_rinn 
./import.sh data/point/rldn gis_raw point_rldn 
./import.sh data/point/rntn gis_raw point_rntn 
./import.sh data/point/santiago_nodes gis_raw point_santiago_nodes 
./import.sh data/point/santiago_streets gis_raw point_santiago_streets 
./import.sh data/point/wtown3 gis_raw point_wtown3 -latin
./import.sh data/streets_20121108 gis_raw streets_20121108
./import.sh data/zip gis_raw zip

./import.sh data/wm/wm_Airports.shp gis wm_airports
./import.sh data/wm/wm_Capitals.shp gis wm_capitals -latin
./import.sh data/wm/wm_Cities_75K_to_900K.shp gis wm_cities_75k_to_900k -latin
./import.sh data/wm/wm_Cities_Greater_900K.shp gis wm_cities_greater_900k -latin
./import.sh data/wm/wm_Cities_Unknownpop.shp gis wm_cities_unknownpop -latin
./import.sh data/wm/wm_Cultural_Landmarks.shp gis wm_cultural_landmarks
./import.sh data/wm/wm_Glacier.shp gis wm_glacier
./import.sh data/wm/wm_Great_Lakes.shp gis wm_great_lakes
./import.sh data/wm/wm_Major_Routes.shp gis wm_major_routes
./import.sh data/wm/wm_Marine_Ports.shp gis wm_marine_ports
./import.sh data/wm/wm_Minor_Routes.shp gis wm_minor_routes
./import.sh data/wm/wm_Railroad_Track.shp gis wm_railroad_track
./import.sh data/wm/wm_Railway_Stations.shp gis wm_railway_stations
./import.sh data/wm/wm_Seas_Bays.shp gis wm_seas_bays
./import.sh data/wm/wm_Utilities.shp gis wm_utilities
./import.sh data/wm/wm_Water_Poly.shp gis wm_water_poly
./import.sh data/wm/wm_World_Admin.shp gis wm_world_admin -latin
./import.sh data/wm/wm_World_Nations.shp gis wm_world_nations

