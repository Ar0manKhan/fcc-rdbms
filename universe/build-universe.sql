create table galaxy_type(
  galaxy_type_id serial primary key unique,
  name varchar(10) unique not null,
  shape varchar(10) not null 
);

insert into galaxy_type(name, shape) values ('SBbc', 'spiral'), ('Irr', 'irregular'), ('dSph', 'spherical'), ('dshp/E7', 'spherical');

create table galaxy(
  galaxy_id serial primary key unique,
  name varchar(30) unique not null,
  distance_from_earth_in_mil_ly numeric not null,
  notes text,
  diameter_in_light_year int,
  galaxy_type_id int references galaxy_type(galaxy_type_id)
);

insert into galaxy (name, distance_from_earth_in_mil_ly, notes, diameter_in_light_year, galaxy_type_id) values 
('Milky Way', 0.0265, 'Home galaxy of Earth Barred spiral galaxy', 100000, 1),
('Canis Major Dwarf', 0.025, 'Satelite of Milky Way', null, 2),
('Draco II', 0.0701, 'Satelite of Milky Way', 120, null),
('Tucana III', 0.0747, 'Satellite of Milky Way that is being tidally disrupted', 220, null),
('Segue 1', 0.075, 'Satelite of Milky Way', null, 3),
('Sagittarius Dwarf Sphr SagDEG', 0.075, 'Satellite of Milky Way', 10000, 4);

create table star(
  star_id serial primary key,
  name varchar(30) unique not null,
  mass_in_sm numeric not null,
  distance_in_ly numeric,
  galaxy_id int not null references galaxy(galaxy_id)
);

insert into star (name, mass_in_sm, distance_in_ly, galaxy_id) values
('Sun', 1, 0.0000158, 1),
('Proxima Centauri', 0.122, 4.2465, 1),
('Rigil Kentaurus', 1.079, 4.3441, 1),
('Toliman', 0.909, 4.3441, 1),
('Barnards Star', 0.144, 5.9629, 1),
('Luhman 16', 0.032, 6.5029, 1);

create table planet(
  planet_id serial primary key,
  name varchar(30) unique not null,
  is_dwarf_planet boolean not null,
  moon_counts int,
  has_rings boolean,
  star_id int not null references star(star_id)
);

insert into planet (name, is_dwarf_planet, moon_counts, has_rings, star_id) values 
('Mercury', false, 0, false, 1),
('Venus', false, 0, false, 1),
('Earth', false, 1, false, 1),
('Mars', false, 2, false, 1),
('Jupiter', false, 80, true, 1),
('Saturn', false, 83, true, 1),
('Uranus', false, 27, true, 1),
('Neptune', false, 14, true, 1),
('Ceres', true, 0, false, 1),
('Pluto', true, 5, false, 1),
('Haumea', true, 2, true, 1),
('Makemake', true, 1, null, 1);

create table moon(
  moon_id serial primary key,
  name varchar(30) unique not null,
  mean_radius_km numeric(10, 1),
  discovery_year int,
  planet_id int not null references planet(planet_id)
);

insert into moon (name, mean_radius_km, discovery_year, planet_id) values
('Moon', 1738, null, 3),
('Phobos', 11.267, 1877, 4),
('Deimos', 6.2, 1877, 4),
('Io', 1821.6, 1610, 5),
('Europa', 1560.8, 1610, 5),
('Ganymede', 2634.1, 1610, 5),
('Callisto', 2410.3, 1610, 5),
('Amalthea', 83.5, 1892, 5),
('Himalia', 69.8, 1904, 5),
('Elara', 43, 1905, 5),
('Pasiphae', 30, 1908, 5),
('Sinope', 19, 1914, 5),
('Mimas', 198.2, 1789, 6),
('Enceladus', 252.1, 1789, 6),
('Tethys', 533.1, 1684, 6),
('Dione', 561.4, 1684, 6),
('Rhea', 763.8, 1672, 6),
('Titan', 2574.73, 1655, 6),
('Ariel', 578.9, 1851, 7),
('Umbriel', 584.7, 1851, 7),
('Titania', 788.9, 1787, 7);
