--IMPORT dataset of world population--

SELECT * FROM `world_population`

--choosing ORDER BY function to make an ascending order of data by rank 
-- to know most ranked countries in population percent 

SELECT * FROM `world_population`
 ORDER BY Rank 

 --what about 2022 population? let us know most 3 countries in 2022 world population 

SELECT Country_Territory, _2022_Population FROM `world_population`
ORDER BY _2022_Population DESC
limit 3


--how does the population increase among years over the world
-- by using AVG() function to know the difference
SELECT AVG(_2022_Population) AS Average_population_in_2022,
AVG(_2020_Population) AS Average_population_in_2020,
AVG(_2015_Population) AS Average_population_in_2015,
AVG(_2010_Population) AS Average_population_in_2010,
AVG(_2000_Population) AS Average_population_in_2000,
AVG(_1990_Population) AS Average_population_in_1990,
AVG(_1980_Population) AS Average_population_in_1980,
AVG(_1970_Population) AS Average_population_in_1970,

FROM `eco-hangar-397203.world_population.world_population` 

/* growth rate minimum and maximum countries 
minimum : */
SELECT Country_Territory,Continent,Growth_Rate
 FROM `eco-hangar-397203.world_population.world_population`
 ORDER BY Growth_Rate
 limit 3 

 --maximum countries 
 SELECT  Continent,Country_Territory,World_Population_Percentage,
 FROM `eco-hangar-397203.world_population.world_population`
 ORDER BY World_Population_Percentage DESC
 LIMIT 3

-- comparing among continents in world population over 2000s from 2010 to 2022
 SELECT Continent, SUM(_2022_population) AS population22, SUM(_2020_Population) AS population20,
 SUM(_2015_Population) AS population15,SUM(_2010_Population) AS population10
 FROM `eco-hangar-397203.world_population.world_population`
 GROUP BY (Continent)
 ORDER BY SUM(_2022_population) DESC 

 /* how does every contininent share the world percentage population 
  the population percent of each continent
  Using GROUP BY function we can count the percent of any country to make it 
  of the one continent */

 SELECT Continent, SUM(World_Population_Percentage) AS world_population_percentage
  FROM `eco-hangar-397203.world_population.world_population`
  GROUP BY Continent
  ORDER BY world_population_percentage DESC 
  
  /* population density is the population over the area.
  let us get a relation between the three columns to know if it affects for every continent */
  
 SELECT continent ,SUM(Area__km___) AS AREA,
SUM(_2022_Population) AS population,SUM(Density__per_km___) AS density
 FROM `eco-hangar-397203.world_population.world_population`
 GROUP BY Continent
 ORDER BY SUM(Area__km___) DESC
