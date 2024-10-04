-- Data Exploration Cyclistic

-- querying data types of columns in data

SELECT column_name,data_type
FROM `2023_2024_TripData`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '2023_2024_combined_data';

-- checking total null values in all columns

SELECT COUNT(*) - COUNT(ride_id) ride_id,
COUNT(*) - COUNT(rideable_type) rideable_type,
COUNT(*) - COUNT(started_at) started_at,
COUNT(*) - COUNT(ended_at) ended_at,
COUNT(*) - COUNT(start_station_name) start_station_name,
COUNT(*) - COUNT(start_station_id) start_station_id,
COUNT(*) - COUNT(end_station_name) end_station_name,
COUNT(*) - COUNT(end_station_id) end_station_id,
COUNT(*) - COUNT(start_lat) start_lat,
COUNT(*) - COUNT(start_lng) start_lng,
COUNT(*) - COUNT(end_lat) end_lat,
COUNT(*) - COUNT(end_lng) end_lng,
COUNT(*) - COUNT(member_casual) member_casual
FROM `2023_2024_TripData.2023_2024_combined_data`;

-- ride_id: are characters consistent for each ride_id?

SELECT LENGTH(ride_id) AS id_characters
FROM `2023_2024_TripData.2023_2024_combined_data`
GROUP BY LENGTH(ride_id);
-- all ride_id's are 16 characters in length

-- are there any duplicate rows?

SELECT * EXCEPT(row_number)
FROM (SELECT*,ROW_NUMBER() OVER (PARTITION BY ride_id) row_number
FROM `2023_2024_TripData.2023_2024_combined_data`)
WHERE row_number = 10;
-- no duplicate ride_id's detected

-- rideable_type: what bikes are available to ride?

SELECT rideable_type, COUNT(rideable_types) AS trips
FROM `2023_2024_TripData.2023_2024_combined_data`
GROUP BY rideable_type;
-- three types (electric, classic, docked)

-- what TIMESTAMP format is being used?

SELECT started_at, ended_at
FROM `2023_2024_TripData.2023_2024_combined_data`
LIMIT 10;
-- YYYY-MM-DD hh:mm:ss UTC format is used

-- are there outlier ride lengths: less than 1 minute or longer than 1440 minutes(24 hours)?

SELECT COUNT(*) AS less_than_a_minute
FROM `2023_2024_TripData.2023_2024_combined_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at-started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at-started_at)) +
  EXTRACT(SECOND FROM (ended_at-started_at)) / 60) <= 1;
-- 151,791 rides are less than 1 minute (can be removed)

SELECT COUNT (*) AS more_than_a_day
FROM `2023_2024_TripData.2023_2024_combined_data`
WHERE (
  EXTRACT(HOUR FROM (ended_at-started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at-started_at)) +
  EXTRACT(SECOND FROM (ended_at-started_at)) / 60) >= 1440;
-- 8,970 rides are more than 24 hours (can be removed)

-- are there null values within station id and location that require row removal?

SELECT DISTINCT start_station_name
FROM `2023_2024_TripData.2023_2024_combined_data`
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_start_station_null
FROM `2023_2024_TripData.2023_2024_combined_data`
WHERE start_station_name IS NULL AND start_station_id IS NULL;
-- detected 1,086,440 rows with missing start station name and id

SELECT DISTINCT end_station_name
FROM `2023_2024_TripData.2023_2024_combined_data`
ORDER BY end_station_name;

SELECT COUNT(ride_id) AS rows_with_null_end_station
FROM `2023_2024_TripData.2023_2024_combined_data`
WHERE end_station_name IS NULL OR end_station_id IS NULL;
-- detected 1,136,628 rows with missing end station name and id

SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM `2023_2024_TripData.2023_2024_combined_data`
WHERE end_lat IS NULL OR end_lng IS NULL;
-- detected 8,698 rows with missing end latitude and longitude

-- how many of each type of riders are there (member and casual)?

SELECT DISTINCT member_casual, COUNT(member_casual) AS total_trips
FROM `2023_2024_TripData.2023_2024_combined_data`
GROUP BY member_casual;
-- detected 2,314,037 casual riders, and 4,301,287 member riders
