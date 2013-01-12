## remember to first run sh download.sh

 CREATE TABLE geoname (
 geonameid int PRIMARY KEY,
 name varchar(200),
 asciiname varchar(200),
 alternatenames varchar(4000),
 latitude decimal(10,7),
 longitude decimal(10,7),
 fclass char(1),
 fcode varchar(10),
 country varchar(2),
 cc2 varchar(60),
 admin1 varchar(20),
 admin2 varchar(80),
 admin3 varchar(20),
 admin4 varchar(20),
 population int,
 elevation int,
 gtopo30 int,
 timezone varchar(40),
 moddate date
 ) CHARACTER SET utf8;
 
 
 CREATE TABLE alternatename (
 alternatenameId int PRIMARY KEY,
 geonameid int,
 isoLanguage varchar(7),
 alternateName varchar(200),
 isPreferredName boolean,
 isShortName boolean,
 isColloquial boolean,
 isHistoric boolean
 ) CHARACTER SET utf8;
 
 
 CREATE TABLE countryinfo (
 iso_alpha2 char(2),
 iso_alpha3 char(3),
 iso_numeric integer,
 fips_code varchar(3),
 name varchar(200),
 capital varchar(200),
 areainsqkm double,
 population integer,
 continent char(2),
 tld char(3),
 currency char(3),
 currencyName char(20),
 Phone char(10),
 postalCodeFormat char(20),
 postalCodeRegex char(20),
 geonameId int,
 languages varchar(200),
 neighbours char(20),
 equivalentFipsCode char(10)
 ) CHARACTER SET utf8; 
 
 
 CREATE TABLE iso_languagecodes(
 iso_639_3 CHAR(4),
 iso_639_2 VARCHAR(50),
 iso_639_1 VARCHAR(50),
 language_name VARCHAR(200)
 ) CHARACTER SET utf8;
 
 
 CREATE TABLE admin1Codes (
 code CHAR(6),
 name TEXT
 ) CHARACTER SET utf8;
 
 
 CREATE TABLE admin1CodesAscii (
 code CHAR(6),
 name TEXT,
 nameAscii TEXT,
 geonameid int
 ) CHARACTER SET utf8;
 
 
 CREATE TABLE featureCodes (
 code CHAR(7),
 name VARCHAR(200),
 description TEXT
 ) CHARACTER SET utf8;
 
 
 CREATE TABLE timeZones (
 timeZoneId VARCHAR(200),
 GMT_offset DECIMAL(3,1),
 DST_offset DECIMAL(3,1)
 ) CHARACTER SET utf8;
 
 
 CREATE TABLE continentCodes (
 code CHAR(2),
 name VARCHAR(20),
 geonameid INT
 ) CHARACTER SET utf8;
 
 
 LOAD DATA LOCAL INFILE 'allCountries.txt' INTO TABLE geoname CHARACTER SET 'UTF8' (geonameid,name,asciiname,alternatenames,latitude,longitude,fclass,fcode,country,cc2, admin1,admin2,admin3,admin4,population,elevation,gtopo30,timezone,moddate);
 
 LOAD DATA LOCAL INFILE 'alternateNames.txt' INTO TABLE alternatename CHARACTER SET 'UTF8' (alternatenameid,geonameid,isoLanguage,alternateName,isPreferredName,isShortName,isColloquial,isHistoric);
 
 LOAD DATA LOCAL INFILE 'iso-languagecodes.txt' INTO TABLE iso_languagecodes CHARACTER SET 'UTF8' (iso_639_3, iso_639_2, iso_639_1, language_name);
 
 LOAD DATA LOCAL INFILE 'admin1Codes.txt' INTO TABLE admin1Codes CHARACTER SET 'UTF8' (code, name);
 
 LOAD DATA LOCAL INFILE 'admin1CodesAscii.txt' INTO TABLE admin1CodesAscii CHARACTER SET 'UTF8' (code, name, nameAscii, geonameid);
 
 LOAD DATA LOCAL INFILE 'featureCodes.txt' INTO TABLE featureCodes CHARACTER SET 'UTF8' (code, name, description);
 
 LOAD DATA LOCAL INFILE 'timeZones.txt' INTO TABLE timeZones CHARACTER SET 'UTF8' IGNORE 1 LINES  (timeZoneId, GMT_offset, DST_offset);
 
 LOAD DATA LOCAL INFILE 'countryInfo-n.txt' INTO TABLE countryInfo CHARACTER SET 'UTF8' IGNORE 1 LINES  (iso_alpha2,iso_alpha3,iso_numeric,fips_code,name,capital,areaInSqKm,population,continent,languages,currency,geonameId);
 
 LOAD DATA LOCAL INFILE 'continentCodes.txt' INTO TABLE continentCodes CHARACTER SET 'UTF8' FIELDS TERMINATED BY ',' (code, name, geonameId); 
