# Pewlett-Hackard-Analysis

## Overview of Project

Pewlett Hackard is a large comapny with several thousands employees and it is facing to large amount of retiring request in near future. Headquarter of the company need some supportive report and data to manage this rapid change as much better as they can. Hewlett Packart has two strategies as below:

  * Offering retirement package
  * Study to find which position need to be filled in the future 

In this study we generate some usefull information like the employees who will be retired soon and the employees who are eligible for retirement package.

In Data report files you can find bellow report which is help the manager to make a proper decision according to company srategies:

Background
Now that Bobby has proven his SQL chops, his manager has given both of you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

What You're Creating
This new assignment consists of two technical analysis deliverables and a written report. You will submit the following:

Deliverable 1: The Number of Retiring Employees by Title
Deliverable 2: The Employees Eligible for the Mentorship Program
Deliverable 3: A written report on the employee database analysis (README.md)

###   Louise’s play Fever came close to its fundraising goal in a short amount of time. Now, she wants to know how different campaigns fared in relation to their launch dates and their funding goals. We analysed crowdfunding campaigns data for period of 2010 to 2017 in order to find a meaningfull trend and help Louise for running her fundraising campaign with the high confidence in the best time and with the proper goal.

## Analysis and Challenges
### In this study I classified the campaign outcomes based on their launch date and their funding goals, in order to find a meaningfull relation between the launch time and goals. Louise want to run a campaign for theater category so I just focused on this category to analyse the data. This study goes in two ways:

   * Compare campaign outcomes by the launch time
   * Compare campaign outcomes by the defined goals


### Analysis of Outcomes Based on Launch Date
  - In below graph you can see the trend of outcomes in monthly manner. The grapgh shows the number of successful, failed and canceled campaigns for theater in different month of the year.
![Outcomes Based on Launch Time](https://github.com/reza-ya57/Kickstarter-Analysis/blob/main/Resources/Theater_Outcomes_vs_Launch.png)

### Analysis of Outcomes Based on Goals
  - In order to analyse the outcomes based on goals, I defined 12 range of goals amount to make the study more reasonable and meaningfull, then I calculated the percentage of successful, failed and canceled project over those range.
> Goal Range Table

![Goal Range](https://user-images.githubusercontent.com/79761400/109898598-8b431280-7c62-11eb-9940-cf006653f3d4.png)


 - Below chart shows the effect of goals amount on the campaigns outcomes.
![Outcomes vs Goals](https://github.com/reza-ya57/Kickstarter-Analysis/blob/main/Resources/Outcomes_vs_Goals.png)

### Challenges and Difficulties Encountered

There was a challenge for using the date info in this dataset because of the format of the dates which was based on unix timestamp. So before using date information I had to convert it into the readable format. Check [Unix Timestamp Convertor](https://www.epochconverter.com) for more information about Unix timestamp or Epoch.

## Results

- What are two conclusions you can draw about the Outcomes based on Launch Date?
1. According to the graph I can say best time to lunch a new campaign would be May and June and you can see the declining trend of successfull campaign through the end of the year. 
2. There is no meaningfull trend for failed or canceled campaign compare to the launch time.


- What can you conclude about the Outcomes based on Goals?
  - We can see over 80% of the all campaign goals defined in the first third range of the above goal range table. It means their goal is below $10,000.
  - Based on the graph, it can be said that projects that have set goals below $5,000 have been over 70% succeed.
  - One more important point is that we should not just look at the percentage of successful or failed alone, we have to consider the number of define project in each level of range goal. If you check the grapgh you can see in the range of $35,000 to $50,000 goals amount 67% percent of the campaign was succeed, but on the other hand total launched campaigns in this range is 9 out of 1046 total campaing in our study. So it is not safe to just looking to percentage and make a decision. 
- What are some limitations of this dataset?
  - Size of dataset
  - Source of data not specified
  - Method of gathering the data is not mentioned

- What are some other possible tables and/or graphs that we could create?
  - Outcomes based on pledged
  - Outcomes based on country
  - Averarage backer amount per each campaign 
