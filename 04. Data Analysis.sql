-- DATA ANALYSIS

-- What are the bikes types used by riders?

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;

-- What are the no. of trips a riders takes per month

SELECT month, member_casual, COUNT(ride_id) AS no_of_trips
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY month, member_casual
ORDER BY member_casual,no_of_trips;

-- What are the no. of trips a riders takes per day of the week

SELECT day_of_week, member_casual, COUNT(ride_id) AS no_of_trips
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY day_of_week, member_casual
ORDER BY member_casual, no_of_trips;

-- What is the number of trips riders takes per hour?

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, COUNT(ride_id) AS no_of_trips
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY hour_of_day, member_casual
ORDER BY member_casual, hour_of_day DESC;

-- What is the mean of ride length used by riders

SELECT member_casual, AVG(ride_duration_minutes) AS avg_ride_length_min
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY member_casual;

-- What is the maximum ride length by riders

SELECT member_casual, MAX(ride_duration_minutes)/60 AS max_ride_length_hour
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY member_casual;

-- What is the average ride_length per month by riders

SELECT month, member_casual, AVG(ride_duration_minutes) AS avg_ride_length_min
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY month, member_casual
ORDER BY avg_ride_length_min;

--  What is the average ride_length per day of week

SELECT day_of_week, member_casual, AVG(ride_duration_minutes) AS avg_ride_length_min
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY day_of_week, member_casual
ORDER BY avg_ride_length_min;

-- What is the average ride_length per hour

SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, 
AVG(ride_duration_minutes) AS avg_ride_duration
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY hour_of_day, member_casual
ORDER BY avg_ride_duration DESC;

-- What are the starting station locations

SELECT start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY start_station_name, member_casual
ORDER BY total_trips DESC;

-- What are the ending station locations

SELECT end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `mainproject-393509.bike_dataset.tripdata_cleaned_combined_data`
GROUP BY end_station_name, member_casual
ORDER BY total_trips DESC;
