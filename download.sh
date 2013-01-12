wget http://download.geonames.org/export/dump/allCountries.zip
wget http://download.geonames.org/export/dump/alternateNames.zip
wget http://download.geonames.org/export/dump/admin1Codes.txt
wget http://download.geonames.org/export/dump/admin1CodesASCII.txt
wget http://download.geonames.org/export/dump/featureCodes.txt
wget http://download.geonames.org/export/dump/timeZones.txt
wget http://download.geonames.org/export/dump/countryInfo.txt

unzip allCountries.zip
unzip alternateNames.zip
 
cat countryInfo.txt | grep -v "^#"|cut -f1-11,17 >countryInfo-n.txt


