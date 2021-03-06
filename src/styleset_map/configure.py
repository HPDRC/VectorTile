#!/usr/bin/env python
# -*- coding: utf-8 -*-

from os import path, getcwd
from collections import defaultdict
config = defaultdict(defaultdict)

config["importer"] = "imposm" # either 'imposm' or 'osm2pgsql'

# The name given to the style. This is the name it will have in the TileMill
# project list, and a sanitized version will be used as the directory name
# in which the project is stored
config["name"] = "map"

# The absolute path to your MapBox projects directory. You should 
# not need to change this unless you have configured TileMill specially
config["path"] = "/tileservice/run"

# PostGIS connection setup
# Leave empty for Mapnik defaults. The only required parameter is dbname.
config["postgis"]["host"]     = "localhost"
config["postgis"]["port"]     = ""
config["postgis"]["dbname"]   = "osm"
config["postgis"]["user"]     = "mapnik"
config["postgis"]["password"] = "mapnik"

# Increase performance if you are only rendering a particular area by
# specifying a bounding box to restrict queries. Format is "XMIN,YMIN,XMAX,YMAX"
# in the same units as the database (probably spherical mercator meters). The
# whole world is "-20037508.34 -20037508.34 20037508.34 20037508.34".
# Leave blank to let Mapnik estimate.
config["postgis"]["extent"] = "-20037508.34,-20037508.34,20037508.34,20037508.34"

# Land shapefiles required for the style. If you have already downloaded
# these or wish to use different versions, specify their paths here.
# You will need to unzip these files before running make.py
# These OSM land shapefiles are updated daily and can be downloaded at: 
# - http://data.openstreetmapdata.com/simplified-land-polygons-complete-3857.zip
# - http://data.openstreetmapdata.com/land-polygons-split-3857.zip

config["land-high"] = "/tileservice/data/shp/land-polygons-split-3857/land_polygons.shp"
config["land-low"] = "/tileservice/data/shp/simplified-land-polygons-complete-3857/simplified_land_polygons.shp"

