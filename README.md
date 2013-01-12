geonames
========

Importing *all* geonames tables to mysql (db with all the cities of the world)

Taken from:
http://forum.geonames.org/gforum/posts/list/732.page



TO INSTALL GEONAMES TABLE
====

1) run;
sh download.sh
this will download the data files

2) create the schema to put the data in, then use the import script, here is an example
mysql -u root -p123456 geonames<import.sql


