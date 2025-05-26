------# -> Table Creation Code <--------
--rangers table
CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);
---species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(100) UNIQUE NOT NULL,
    discovery_date DATE,
    conservation_status VARCHAR(50)
);
----sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER NOT NULL,
    species_id INTEGER NOT NULL,
    sighting_time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    location VARCHAR(100),
    notes TEXT,
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);
-----------Table Creation Code End----------

---------# Insert Data -----------------

--rangers data
INSERT INTO rangers (name, region) VALUES
('Alice Smith', 'Northern Forest'),
('Bob Johnson', 'Western Mountains'),
('Carol White', 'Eastern Plains');

----species data
INSERT INTO species 
(common_name, scientific_name, discovery_date, conservation_status)
VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


---sightings  data
INSERT INTO sightings 
(species_id, ranger_id, location, sighting_time, notes) 
VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

-------------------Insert Data End---------------

-----#1. Insert a new ranger with provided data name = 'Derek Fox' and region = 'Coastal Plains'----------
INSERT INTO rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-----#------#---

----- #2. Count unique species ever sighted
SELECT COUNT(DISTINCT species_id) AS unique_species_sighted
FROM sightings;

----#-----#---

----#3. Find all sightings where the location includes "Pass".
select * from sightings where location ILIKE '%Pass%';

-----#----------#----

------#4. List each ranger's name and their total number of sightings.
SELECT
    r.name AS ranger_name,
    COUNT(s.sighting_id) AS total_sightings
FROM rangers r
    JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY
    r.name
ORDER BY r.name;

------#--------------#--

-----#5. List species that have never been sighted.
SELECT s.common_name
FROM species s
WHERE
    NOT EXISTS (
        SELECT *
        FROM sightings si
        WHERE
            si.species_id = s.species_id);
---------#---------------#--------

-----#6. Show the most recent 2 sightings.
SELECT
    s.common_name,
    si.sighting_time,
    r.name
FROM
    sightings si
JOIN
    species s ON si.species_id = s.species_id
JOIN
    rangers r ON si.ranger_id = r.ranger_id
ORDER BY
    si.sighting_time DESC
LIMIT 2;

--------------#-----------------------#--------

---------#7. Update all species discovered before year 1800 to have status 'Historic'
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

--------#---------------#-----
-------#8. Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'
----1st alter table add column name time_of_day---> 
ALTER TABLE sightings
ADD COLUMN time_of_day VARCHAR(50) DEFAULT 'Morning';

-----2nd multi update command of 'Morning', 'Afternoon', 'Evening'

-- Update Morning 
UPDATE sightings
SET time_of_day = 'Morning'
WHERE EXTRACT(HOUR FROM sighting_time) < 12;

-- Update Afternoon 
UPDATE sightings
SET time_of_day = 'Afternoon'
WHERE EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17;

-- Update Evening 
UPDATE sightings
SET time_of_day = 'Evening'
WHERE EXTRACT(HOUR FROM sighting_time) > 17;

---run the query to show result
SELECT sighting_id,time_of_day
FROM sightings
ORDER BY sighting_id;

-----------# End of  # Q/8 ---------

--------#9. Delete rangers who have never sighted any species

-- first select deleted ranger for confirm
SELECT
    *
FROM
    rangers
WHERE
    ranger_id NOT IN (SELECT ranger_id FROM sightings);


--- then Delete command
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT ranger_id FROM sightings);    
-----------End of # 9 ------------



