------------ number of bins in each postcode

Alter table dublinpostcode add column numberpublicbins INTEGER DEFAULT 0;
with bins as (
	select p.postcode,count(*) as numberofbins from dublinpostcode as p, dublinpublicbin as b
	where st_contains(st_transform(p.pgeom,4326),b.bgeom)
	group by p.postcode
)
update dublinpostcode
set numberpublicbins = bins.numberofbins
from bins
where dublinpostcode.postcode = bins.postcode



---------------  Density of bins

Alter table dublinpostcode add column densitypublicbins float(3) DEFAULT 0.0;

with dbins as (
	select p.postcode,p.numberpublicbins/(st_area(p.pgeom)/1000000) as densityofbins from dublinpostcode as p, dublinpublicbin as b
	where st_contains(st_transform(p.pgeom,4326),b.bgeom)
)
update dublinpostcode
set densitypublicbins = dbins.densityofbins
from dbins
where dublinpostcode.postcode = dbins.postcode
