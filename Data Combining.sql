-- Data Combining Cyclistic August 2023 to July 2024 as a single table

DROP TABLE IF EXISTS `2023_2024_TripData.2023_2024_combined_data`;

CREATE TABLE IF NOT EXISTS `2023_2024_TripData.2023_2024_combined_data` AS ( 
  SELECT * FROM `2023_2024_TripData.aug_2023_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.sep_2023_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.oct_2023_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.nov_2023_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.oct_2023_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.nov_2023_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.dec_2023_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.jan_2024_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.feb_2024_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.mar_2024_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.apr_2024_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.may_2024_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.jun_2024_data`
  UNION ALL
  SELECT * FROM `2023_2024_TripData.jul_2024_data`
  );
