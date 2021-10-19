Alter table dublintrafficlocations add column sumoftrafficvolume INTEGER DEFAULT 0;
with traffic as(
	select site, sum(sumofsumvolume) from dublintrafficvolume
	where site is not null and month = 6 and day = 1
	group by site
)
update dublintrafficlocations 
set sumoftrafficvolume = traffic.sum
from traffic
where dublintrafficlocations.siteid = traffic.site

select * from dublintrafficlocations
ORDER BY trafficid