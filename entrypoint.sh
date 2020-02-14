#!/bin/bash

#export WPS_INPUT_RedBand="http://thor.sage.ieat.ro/~marian/pilot/T34TDT_20190701T093041_B04_10m.jp2"
#export WPS_INPUT_GreenBand="http://thor.sage.ieat.ro/~marian/pilot/T34TDT_20190701T093041_B03_10m.jp2"
#export WPS_INPUT_BlueBand="http://thor.sage.ieat.ro/~marian/pilot/T34TDT_20190701T093041_B02_10m.jp2"

gdalbuildvrt -separate rgb.vrt /vsicurl/${WPS_INPUT_RedBand} /vsicurl/${WPS_INPUT_GreenBand} /vsicurl/${WPS_INPUT_BlueBand}

echo "Saving output to: ${WPS_OUTPUT_Image}"

mkdir -p "${WPS_OUTPUT_Image}"

gdal_translate rgb.vrt "${WPS_OUTPUT_Image}"/rgb.tif
