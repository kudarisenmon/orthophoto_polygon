# Generate GeoJSONs from the OpenStreetMap XML source files

# Directory containing source (OpenStreetMap XML) files
source := src

# Directory containing GeoJSON files
output := geojson

# All OpenStreetMap XML files in src/ are considered sources
sources := $(wildcard $(source)/*.osm)

# Convert the list of source files (OpenStreetMap XML files in directory src/)
# into a list of output files (GeoJSONs in directory geojson/).
objects := $(patsubst %.osm,%.geojson,$(subst $(source),$(output),$(sources)))

all: $(objects)

# Recipe for converting a OpenStreetMap XML file into GeoJSON using osmtogeojson
$(output)/%.geojson: $(source)/%.osm
	osmtogeojson $< > $@
