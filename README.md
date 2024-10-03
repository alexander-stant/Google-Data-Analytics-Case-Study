# Google Data Analytics Capstone Project: Cyclistic Bike Share Study
From Course Assignment: [Google Data Analytics Capstone: How Does a Bike Share Navigate Speedy Success?](https://www.coursera.org/learn/google-data-analytics-capstone/supplement/7PGIT/case-study-1-how-does-a-bike-share-navigate-speedy-success)
## Introduction
The **Google Data Analytics Perfessional Certificate** through Coursera uses the **Cyclistic Bike Share Case Study** as a capstone project. Using analytic skills learned in this course, I wil act as a junior data analyst for the bike share company Cyclistic. The steps used to gain insightful information include **ask, prepare, process, analyze, share, and act.**
### Helpful Links:
Data: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) (accessed 08/29/24)

Queries:
[1. Combining Data]
[2. Exploring Data]
[3. Cleaning Data]
[4. Analyzing Data]

Visualizations By: [Tableau]
## Background
### Cyclistic
A bike-share company, named Cyclistic, is located in Chicago. This company launched in 2016, and has grown their fleet of bicycles over 5,800 bikes with over 650 stations throughout the city. They offer multiple bike options for those unable to use a standard two wheel such as reclining bikes and hand tricycles. Customers are able to rent bikes from one station and return the bikes to any other station once they are done riding. A trait that Cyclistic relies on to promote cycling as a way of transportation around the Chicago area.

The marketing strategy Cyclistic has used focused on creating awareness of their program and appealing to broad consumer segments. Part of this is flexible pricing plans for users that include single-ride passes, full-day passes, and annual memberships. The other part is offering bikes for all types of people including those who might have a hard time riding a standard two wheel bike. This is seen in the percentages of those who use their bikes to commute to work (30%) and users who opt for assistive bikes (8%).

Finance analysts at Cyclistic have learned that annual members produce more profit than casual riders. The marketing director believes that the key to future growth lies within turning casual riders to annual members. Insinuating that converting these users will be more beneficial than targeting completely new users.

A clear goal has been set to design marketing strategies that can help convert casual riders into annual members. This can be done by analyzing the difference between these types of riders and why someone would consider becoming an annual member. In order to do this, analysis of Cyclistic bike trip data will be done to identify trends and create insightful conclusions.
### Scenario
Cyclistic's director of marketing stands firm that the company's success in the future will come from increasing annual members from already casual riders. My team will delve into understanding how annual members and casual riders differ, and with these insights new strategies for casual rider transitions can be discussed. In order for these strategies to be applied, they must be backed with data insights and visualizations that highlight the information mined from the data.

## Ask
### Business Task
Formulate marketing strategies that target the conversion of casual riders to annual members.

### Analysis Questions
Questions to guide marketing strategies:
  1. How do annual members and casual riders use Cyclistic bikes differently?
  2. Why would casual riders buy Cyclistic annual membrships?
  3. How can Cyclistic use digital media to influence casual riders to become members?

## Prepare
### Data Source
Cyclistic's trip data from August 2023 to July 2024 was downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). This data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).
This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

## Process
In order to combine all twelve data tables from the last twelve months, BigQuery is used since there are over a total of 6.6 million rows.
### Data Combining
[Data Combining SQL Query](https://github.com/alexander-stant/Google-Data-Analytics-Case-Study/blob/main/Data%20Combining.sql)
The dataset '2023_2024_TripData was created, and the 12 cvs files from August 2023 to July 2024 were added. The code above was used to create a combined dataset containing 6,615,324 rows
### Data Exploration
[Data Exploration SQL Query](https://github.com/alexander-stant/Google-Data-Analytics-Case-Study/blob/main/Data%20Exploration.sql)

