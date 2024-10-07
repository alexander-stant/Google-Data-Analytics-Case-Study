-- Data Cleaning Cyclistic removing null values and adding new table with "day_of_week" and "month"

DELETE FROM `2023_2024_TripData.2023_2024_combined_data`
WHERE ride_id IN 
      (SELECT ride_id
      FROM `2023_2024_TripData.2023_2024_combined_data`
      GROUP BY ride_id
      HAVING COUNT(ride_id) > 1);
-- Removed 1,799,684 rows 

DROP TABLE IF EXISTS `2023_2024_TripData.cleaned_trip_data`;

CREATE TABLE `2023_2024_TripData.cleaned_trip_data` AS (
  SELECT t1.ride_id, rideable_type, started_at, ended_at, ride_length_minutes,
  CASE EXTRACT(DAYOFWEEK FROM started_at)
  WHEN 1 THEN 'Sunday'
  WHEN 2 THEN 'Monday'
  WHEN 3 THEN 'Tuesday'
  WHEN 4 THEN 'Wednesday'
  WHEN 5 THEN 'Thursday'
  WHEN 6 THEN 'Friday'
  WHEN 7 THEN 'Saturday'
END AS day_of_week,
  CASE EXTRACT(MONTH FROM started_at)
  WHEN 1 THEN 'January'
  WHEN 2 THEN 'February'
  WHEN 3 THEN 'March'
  WHEN 4 THEN 'April'
  WHEN 5 THEN 'May'
  WHEN 6 THEN 'June'
  WHEN 7 THEN 'July'
  WHEN 8 THEN 'August'
  WHEN 9 THEN 'September'
  WHEN 10 THEN 'October'
  WHEN 11 THEN 'November'
  WHEN 12 THEN 'December'
END AS month,
start_station_name, end_station_name, start_lat, start_lng, end_lat, end_lng, member_casual
FROM `2023_2024_TripData.2023_2024_combined_data` AS t1
JOIN 
  (SELECT ride_id, (
    EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
    EXTRACT(MINUTE FROM (ended_at - started_at)) +
    EXTRACT(SECOND FROM (ended_at - started_at)) / 60) AS ride_length_minutes
  FROM `2023_2024_TripData.2023_2024_combined_data`) AS t2
ON t1.ride_id = t2.ride_id
WHERE 
start_station_name IS NOT NULL AND 
end_station_name IS NOT NULL AND 
end_lat IS NOT NULL AND
end_lng IS NOT NULL AND 
ride_length_minutes > 1 AND ride_length_minutes < 1440
);

ALTER TABLE `2023_2024_TripData.cleaned_trip_data`
ADD PRIMARY KEY(ride_id) NOT ENFORCED;

SELECT COUNT(ride_id) AS total_rows
FROM `2023_2024_TripData.cleaned_trip_data`;
-- 3,511,088 rows returned from the inital 6,615,324 rows, meaning 3,104,236 rows removed
