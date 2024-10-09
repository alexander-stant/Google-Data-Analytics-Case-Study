## Google Data Analytics Capstone Project: Cyclistic Bike Share Study
From Course Assignment: [Google Data Analytics Capstone: How Does a Bike Share Navigate Speedy Success?](https://www.coursera.org/learn/google-data-analytics-capstone/supplement/7PGIT/case-study-1-how-does-a-bike-share-navigate-speedy-success)
## Introduction
The **Google Data Analytics Perfessional Certificate** through Coursera uses the **Cyclistic Bike Share Case Study** as a capstone project. Using analytic skills learned in this course, I wil act as a junior data analyst for the bike share company Cyclistic. The steps used to gain insightful information include **ask, prepare, process, analyze, share, and act.**
### Helpful Links:
Data: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) (accessed 08/29/24)

Queries:

[1. Combining Data](https://github.com/alexander-stant/Google-Data-Analytics-Case-Study/blob/main/Data%20Combining.sql)

[2. Exploring Data](https://github.com/alexander-stant/Google-Data-Analytics-Case-Study/blob/main/Data%20Exploration.sql)

[3. Cleaning Data](

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

The dataset '2023_2024_TripData' was created, and the 12 cvs files from August 2023 to July 2024 were added. The code above was used to create a combined dataset containing 6,615,324 rows
### Data Exploration
[Data Exploration SQL Query](https://github.com/alexander-stant/Google-Data-Analytics-Case-Study/blob/main/Data%20Exploration.sql)

1. Queried a table to show column names and data types.

<img width="382" alt="Screenshot 2024-10-04 at 12 13 23" src="https://github.com/user-attachments/assets/59537945-73cb-410f-9a51-1b2d028f52c8">

2. Queried a table to see total null values.

<img width="1141" alt="Screenshot 2024-10-04 at 12 41 10" src="https://github.com/user-attachments/assets/0525923a-b3d4-4e37-b7fd-216ad740ec14">

A couple columns have the same number of missing values, which is likely from missing information in these rows such as station name and id or latitude and longitude.

3. Queried ride_id length to use as primary key

<img width="360" alt="Screenshot 2024-10-04 at 13 01 33" src="https://github.com/user-attachments/assets/7d4b06e9-392e-48a8-81db-4758d489ba64">

All ride_id's have a length of 16 characters, can use as primary key.

4. Used ride_id as primary key to query for duplicates.

<img width="456" alt="Screenshot 2024-10-04 at 16 59 50" src="https://github.com/user-attachments/assets/b1f25b2d-4ff7-47e4-8802-75a90c7fd3ce">

899,842 duplicate ride_id found that can be excluded from analysis.

5. Used rideable_type to query types of bikes being used and in what quantity.
   
<img width="385" alt="Screenshot 2024-10-04 at 13 56 19" src="https://github.com/user-attachments/assets/bc1f5d0f-299b-4a86-bad4-a2e1ef3763c6">

6. Used started_at, ended_at to query TIMESTAMP format.

<img width="356" alt="Screenshot 2024-10-04 at 14 13 17" src="https://github.com/user-attachments/assets/086c1a76-c720-400a-ac80-97e8d8ee3c1c">

YYYY-MM-DD hh :mm :ss UTC format is used.

7. Queried outlier rides that can be excluded for analysis.

<img width="407" alt="Screenshot 2024-10-04 at 14 19 48" src="https://github.com/user-attachments/assets/83f3d587-2371-4926-9a8c-ddb8a91d860f">

<img width="432" alt="Screenshot 2024-10-04 at 14 20 28" src="https://github.com/user-attachments/assets/70386532-dd46-44ed-83a7-769d991601a1">

Found a total of 160,761 rides that can be romeved because they were shorter than a minute or longer than a day.

8. Queried null station id and locations that can be exluded from analysis.

<img width="451" alt="Screenshot 2024-10-04 at 16 47 28" src="https://github.com/user-attachments/assets/30591449-6400-4e79-aca0-b91f4d7a5f8e">

Found 1,086,440 rows missing start station name and id that can be excluded from analysis.

<img width="415" alt="Screenshot 2024-10-04 at 16 48 32" src="https://github.com/user-attachments/assets/72028435-8506-4648-8d82-43e80380bf1b">

Found 1,136,628 rows missing end station name and id that can be excluded from analysis.

9. Queried null ending latitude and longitude that can be excluded from analysis.

<img width="363" alt="Screenshot 2024-10-04 at 17 03 25" src="https://github.com/user-attachments/assets/e6f40316-7608-43dc-ab14-e54994d475aa">

Found 8,698 rows missing end latitude and longitude that can be excluded rom analysis.

10. Queried total of each type of rider.

<img width="481" alt="Screenshot 2024-10-04 at 17 05 03" src="https://github.com/user-attachments/assets/28e8c0fc-aae8-4b3a-a7fc-a99742d98bda">

Found 2,314,037 casual riders and 4,301,287 annual member riders.

### Data Cleaning
[Data Cleaning SQL Query](https://github.com/alexander-stant/Google-Data-Analytics-Case-Study/blob/main/Data%20Cleaning.sql)

1. Rows having missing values and duplicate rows are removed for analysis.
2. Removed trips with durations of less than a minute and longer than a day.
3. Added three columns: DAYOFWEEK, MONTH, and ride_length_minutes.
4. 3,511,088 rows returned from the inital 6,615,324 rows, meaning 3,104,236 rows removed.

## Analysis
[Data Analysis SQL Query](https://github.com/alexander-stant/Google-Data-Analytics-Case-Study/blob/main/Data%20Analysis.sql)

[Data Visualization](https://public.tableau.com/app/profile/alexander.stanton/viz/CyclisticCaseStudyGoogleDataAnalyticsCapstoneProject/Dashboard1#3)

Question for analysis: How do annual members and casual riders use Cyclistic bikes differently?

Tables were queried and then used to create charts to visualize the differences annual members and casual riders have.

The first chart shows the types of bikes casual riders and annual members use.

![Ride Type Chart](https://github.com/user-attachments/assets/a9c85feb-7424-4ffb-99a5-328dd8427b8d)

It is seen how members make up the most rides with 1,541,992 total on classic bikes. Casual riders are seen mostly riding classic bikes with 842,729 rides and the least on docked bikes 15,333. Annual members do not used docked bikes at all.

These next charts show trip totals for a twelve month period, a week, and a day.

![Monthly Ride Chart](https://github.com/user-attachments/assets/39de3223-3e9e-492e-a6b6-f96907a2786a)
__Monthly:__ Casual riders and annual members behave in the same way throughout the months, showing higher numbers of rides in the summer months and declining in the winter months. Annual member trips are always higher than casual riders, infering they ride to commute or exercise more regularly.
![Weekly Ride Chart](https://github.com/user-attachments/assets/6738a79b-a73a-4c88-9480-de3fc039a154)
__Daily:__ Casual riders and annual members behave differently throughout the week. While members usually have higher numbers of trips during the week, casual riders pick up during the weekends. This is interesting because members ride less during the weekend confirming they commute for their work via bike, and casual members ride more for recreation.
![Hourly Ride Chart](https://github.com/user-attachments/assets/e25975fa-8db8-4c32-abfd-d877d42c9374)
__Hourly:__ Casual riders seem to ride the most during the evening hours from 3PM-7PM. This is different than members who seem to have a burst of rides in the morning around 8AM and then again at 5PM. This again confirms that members ride to commute because they peak before and after work hours. Casual riders pick up after work, confirming they do it for their own pleasure after work.

Trip duration in minutes is then compared per month, week, and hour.

![Ride Duration Month Chart](https://github.com/user-attachments/assets/198b0cf7-0c2d-4955-bdf9-231b90f7e3db)
__Monthly:__ During the summer months (April-September), casual riders take the longest trips with a steady decline during the winter months (October-March). This differs from annual members who maintain the same trip duration throughout all months with a small increse is duration during the summer months (May-August).
![Ride Duration Week Chart](https://github.com/user-attachments/assets/ddc42bdc-3ff8-4286-bcf0-5bde5f171a66)
__Weekly:__ A similar trend can be seen in this chart, where casual rider durations peak on Saturday and Sunday and decline during the work week, but not significantly. Annual members still maintain similar durations throughout the week and weekend, with weekend trips lasting only a couple minutes longer.
![Ride Duration Hour Chart](https://github.com/user-attachments/assets/5383770f-5ef0-4b9f-bff4-de948b22c2e4)
__Hourly:__ Behavior in this chart shows something a little different. Casual riders peak ride durations happen between 10AM and 3PM with a steady trend for the rest of the day. Their shortest trips seem to be in the morning between 5AM and 8AM. Those who are annual members seem to travel the least before 7AM, but from 8AM-8PM there is a steady trend of trip durations.

This anlysis confirms the ideas that annual members primarily ride to commute to and from work. While casual members ride for longer periods of time, they do so less frequently than annual members. This confirms that they are riding for recreation, especially since their total trips pick up when the weather is warmer and more welcoming to cyclists.

The final part of the analysis is to compare start and end locations for casual and annual members.

![Start Station Chart](https://github.com/user-attachments/assets/8b176f2f-37e5-4a24-bc28-840bd298a70c)
Riders differ in start locations, where casual riders start near parks, museums, beaches, and other recreational facilities. Whereas members start near residential areas, schools, factories, train stations, and grocery stores.
![End Station Chart](https://github.com/user-attachments/assets/2c29af9a-1c28-4b6d-b8d2-59568cb72656)
This chart shows a similar trend with casual riders ending their trips near recreational facilities such as museums and harbors, and members ending their trips near commercial areas such as universities and residential areas. With all this data and information, our insights can be confirmed that casual riders use Cyclistic for recreation/leisure and annual members use it to commute for their daily lives.

### Similarities
1. Both annual members and casual riders prefer riding in the warmer months (May-August). They both decline after this time, as well.
2. Both types of riders primarily use the classic bikes over the electric ones.
3. Both types of riders take longer trips on the weekends than weekdays.

### Differences
1. Annual members ride more frequently than those who ride casually.
2. Casual riders take less trips, but their ride duration is almost double the annual members' duration.
3. Casual riders are most active on the weekends and annual members during the week.

## Act
Using this information, marketing strategies with the purpose of influencing casual riders to become members are created.
  __1. Reward Point System__
  A reward system where members can earn points for rides, and then use their points to   get discounted membership prices or free rides. Creates an incentive to ride more and   stay loyal to one company.

  __2. Seasonal Memberships__
  Offering special discounts during peak days of the week or months of the year to     
  encourage those using it during these times to sign up. Example: lowering membership    cost during summer months.

  __3. Social Media__
  Exploiting social media platforms to share testimonials and create content to         
  encourage casual riders to become members. Highlighting the benefits for casual 
  riders, and adding the benefits of saving money on gas or public transportation, can 
  influence casual users to want to get the membership.

  __4. Membership Offers__
  Offering more than an annual membership. Monthly or weekly memberships, priced 
  correctly, can influence casual riders to sign up for longer than a day. This can be 
  beneficial for those looking to ride in the spring and summer months without 
  committing to the whole year.

## Conclusion
The analysis of Cyclistic's trip data creates important insights into the behavior of Cyclistic users. Strategies can now be applied to actively convert casual riders to becoming potential members.








   



