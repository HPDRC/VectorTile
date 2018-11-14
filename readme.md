# About this project
This project is meant to replace the old mapnik project with the following enhancements:
- Faster rendering speed
- Faster serving speed for cached tiles
- Allow precache of certain levels
- Use standardized mapnik.xml to define styles / datasources.

Some open source projects are used to build the service:
- PostgreSQL database + PostGIS plugin for data storing and querying
- osm2pgsql as a tool to import osm data into PostGIS database.
- Apache as the web server
- Mapnik as the core rendering engine
- mod_tile / renderd as the tile serving and cache managing tool

After installed, these programs already provide the basic on the fly tile rendering/caching service.
However, it doesn't allow user to choose any combination of layers to render.
This project did some work on top of mod_tile/renderd so that it's possible to render layers dynamically without much compromise in performance.