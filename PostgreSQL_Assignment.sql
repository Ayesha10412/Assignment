-- Active: 1748327936941@@127.0.0.1@5432@Conservation_db@public
create table rangers(
    ranger_id serial primary key,
    name varchar(50) not null,
    region varchar(50) not null
);
create table species(
    species_id serial primary key,
    common_name varchar(50) not null,
    scientific_name varchar(50) not null,
    discovery_date date,
    conservation_status varchar(50) not null
);
create table sightings(
    sighting_id serial primary key,
    ranger_id integer references rangers(ranger_id),
    species_id integer references species(species_id),
    sighting_time timestamp without time zone,
    location varchar(50) not null,
    notes text 
);


INSERT INTO rangers (ranger_id, name, region) VALUES
(1, 'Alice Green', 'Northern Hills'),
(2, 'Bob White', 'River Delta'),
(3, 'Carol King', 'Mountain Range');

select * from rangers;

INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(1, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(2, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(3, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(4, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

select *  from species;

INSERT INTO sightings (sighting_id, species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(4, 1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

select * from sightings;

----problem1
INSERT INTO rangers (ranger_id, name, region) VALUES
(4, 'Derek Fox', 'Coastal Plains')

---problem2
select count(distinct species_id) as unique_species_count
 from sightings;

----problem3
select * from sightings where location like '%Pass%' ;

---problem4
select name,count(*) as total_sightings from rangers 
join sightings on rangers.ranger_id=sightings.ranger_id group by name;

--problem5
select common_name from
species left join sightings on 
species.species_id=sightings.species_id 
where sightings.species_id is null;

---problem6

select common_name,sighting_time,name from sightings JOIN
species on sightings.species_id=species.species_id
join rangers on sightings.ranger_id=rangers.ranger_id
order by sighting_time DESC limit 2 ;

---problem7
update species set conservation_status='Historic'
where extract(year from discovery_date)<1800;

---problem8
select sighting_id,
CASE 
    WHEN extract(hour from sighting_time)<12 THEN 'Morning' 
    when extract(hour from sighting_time) between 12 and 17 then 'Afternoon'
    ELSE  'Evening'
END as time_of_day from sightings;

---problem9

delete from rangers where ranger_id in(select rangers.ranger_id from
 rangers left join sightings
  on rangers.ranger_id=sightings.ranger_id
   where sightings.ranger_id is null);
   