apt-get update && apt-get install --yes software-properties-common
add-apt-repository --yes ppa:ubuntugis/ubuntugis-unstable
apt-get update && apt-get install --yes libxml2-dev libgdal-dev libgeos-dev libproj-dev libudunits2-dev liblwgeom-dev libv8-3.14-dev libprotobuf-dev protobuf-compiler
add-apt-repository -y ppa:opencpu/jq
apt-get update && apt-get install -y libjq-dev
