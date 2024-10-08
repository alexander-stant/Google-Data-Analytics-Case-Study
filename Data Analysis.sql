-- Data Analysis Cyclistic Cleaned Data

-- finding what types of bikes members and casual users use

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips DESC;
-- most trips come from members on classic bikes (2,796,628) and fewest trips come from casual users on docked bikes (15,333)

-- finding total trips per month

SELECT month, member_casual, COUNT (ride_id) AS total_trips
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY month, member_casual
ORDER BY member_casual;
-- members had the most rides the most in July (307,409) and the least in January (93,507)
-- casual users had the most rides in July (230,035) and the least in January (17,367)

-- finding total trips per day

SELECT day_of_week, member_casual, COUNT (ride_id) AS total_trips
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY day_of_week, member_casual
ORDER BY member_casual;
-- members ride the most on Wednesday (378,370) and the least on Sunday (242,397)
-- casual users ride the most on Saturday (270,770) and the least on Monday (138,671)

-- finding total trips per hour

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, COUNT(ride_id) AS total_trips
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual;
-- members ride the most around 5PM (244,986) and the least around 3AM (3,537)
-- casual users ride the most around 5PM (124,129) and the least around 4AM (2,930)

-- finding average ride length per month

SELECT month, member_casual, AVG(ride_length_minutes) AS avg_duration_month
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY month, member_casual
ORDER BY member_casual DESC;
-- members ride the longest in June (13.7 mins) and the least in December (10.9 mins)
--casual users ride the longest in May (27.2 mins) and the least in January (15.6 mins)

-- finding average ride length per day of week

SELECT day_of_week, member_casual, AVG(ride_length_minutes) AS avg_duration_day
FROM`2023_2024_TripData.cleaned_trip_data`
GROUP BY day_of_week, member_casual
ORDER BY member_casual DESC;
-- members ride the longest on Saturdays (14.5 mins) and the least on Thursdays (12.2 mins)
-- casual users ride the longest on Sundays (28.4 mins) and the least on Tuesdays (21.6 mins)

-- finding average ride length per hour

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, AVG(ride_length_minutes) AS avg_duration_hour
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual DESC;
-- members ride the longest around 5PM (13.7 mins) and the least around 6AM (10.9 mins)
-- casual users ride the longest around 11AM (30.1 mins) and the 5AM (16.3 mins)

-- finding start station locations

SELECT start_station_name, member_casual, AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng, COUNT(ride_id) AS total_trips
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY start_station_name, member_casual; 

-- finding end station locations

SELECT end_station_name, member_casual, AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng, COUNT(ride_id) AS total_trips
FROM `2023_2024_TripData.cleaned_trip_data`
GROUP BY end_station_name, member_casual;
