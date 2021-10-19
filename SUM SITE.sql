DROP TABLE IF EXISTs dublintrafficvolume;
create table dublintrafficvolume(
	Year numeric,
	Month numeric,
	Day numeric,
	Site numeric,	
	SumOfSumVolume numeric
);

select * from dublintrafficvolume

select site, sum(sumofsumvolume) from dublintrafficvolume
where site is not null and month = 6 and day = 1
group by site