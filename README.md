# AdevntureWorks2019 Analysis

## Table of Contents

- [Project Overview](#project-overview)
- [Data Analysis](#data-analysis)
- [Results](#results)

### Project Overview

This data analyst project aims to answer a set of questions using the AdventureWorks dataset, a demo dataset maintained by Microsoft. I will use my combined knowledge of SQL, Python, and data analytics to investigate the dataset and answer the following question:
1) What is the relationship between sick leave and job title?

### Tools

- SQL Server
  - I used the HumanResources.Employee table in the AdventureWorks2019 database which is part of the HumanResources schema. This table stores employee information such as job title, birth date, vacation hours and sick leave hours
- Python
  - Libraries: Pandas / Matplotlib / Numpy / pyodbc

### Data Analysis

To start off, I located the fields that I need to answer this question which are “SickLeaveHours” and “JobTitle” in the HumanResources.Employee table. The code below was used to confirm this.
```sql
SELECT *
FROM HumanResources.Employee
```
<br>
<br>
Now that I have confirmed the table I need, I am going to narrow it down to just the fields and records that are relevant to my question with this code:

```sql
SELECT JobTitle, SickLeaveHours
FROM HumanResources.Employee
```
<br>
This gave me a table of multiple people who have the same job title who each have different sick leave hours. To make this table more useful, I am going to group by the JobTitle and create an average for the SickLeaveHours field for each unique JobTitle.

```sql
SELECT JobTitle, AVG(SickLeaveHours) AS Average_SickLeaveHours
FROM HumanResources.Employee
GROUP BY JobTitle;
```
<br>
<br>
I ordered by Average_SickLeaveHours so the bar graph I create will be easier to read as the data will be in ascending order.

```sql 
SELECT JobTitle, AVG(SickLeaveHours) AS Average_SickLeaveHours
FROM HumanResources.Employee
GROUP BY JobTitle
ORDER BY Average_SickLeaveHours;
```
<br>
<br>

I imported the code to Python within a jupyter notebook and created a bar chart visual. The job titles were on the x-axis, and they were vertical which made it very difficult to read as there was so many. I chose to use a bar plot as I had a categorical variable, and I wanted a count for each category of sick leave.

![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/8f2ec2fd-a313-4410-9e32-3d95a1dabdca)

To solve this, I used the code plt.tight_layout() to make sure the whole image was saved. The plt.tight_layout() function automatically adjusts subplot parameters so that the subplot(s) fits into the figure area. This solves the problem of cut-off labels.
I also used figsize=(12, 6) to make some extra space between each bar as the text on the x-axis was squashed together. The first attribute is for the width and the second is for the height.<br>
<br>
<br>
 
Next, I will write code to create two horizontal bar charts which will include the top 10 sick leave hours and the bottom 10 sick leave hours respectively. This will help me get a better understanding of the data and make it a lot more easier to read.

![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/934089fc-9544-47f4-a711-584343b1251c)
![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/8eaf5800-66b8-4f6a-9ad8-939aba9eb146)
![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/5059a5d9-8216-4415-8b7b-ae203500858d)<br>
<br>
<br>
 
I used the head() and tail() functions to get the top 10 and last 10 data values. I used a horizontal bar chart to plot the data points. This visual gives you a clearer view of the extreme ends of the average sick hours taken by different job titles. I also got rid of the legend as it was blocking the bar in the bar chart using the code; legend=False

![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/5892a2e7-6562-4c9f-bb4a-90094fac827e)
![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/f438ad76-06a9-41f2-9151-f518532fdc84)

  
<br>
<br> 
To answer the question in more detail I will use the organisation field to sort the job titles into organisational level. I will then see which organisation level has the highest average sick leave hours by using a bar chart. This will allow me to see if there is a correlation or not. I will write SQL code to achieve this.

![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/06c531bd-d222-4380-8327-d8063cb3a0fc)
Does organisation level mean job ranking/responsibility, or does it mean the business as a whole? I think it’s the second one. I did some research, and this this column represents the depth of the employee in the corporate hierarchy. An organisational level of 1 would be at the top level of the hierarchy, while an employee with an organisational of 2 would be one level below the top level, and so on. There is a total of four organisation levels.<br>
<br>
<br>
Next, I will import the SQL query into visual studio code and write code that will group the organisation level into four parts with each part having the mean of the average sick leave hours. I will then create a list and plot this data using a bar chart.

![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/33b2bdef-1de0-4d14-a29c-d4022425ce58)
<br>
<br>
<br>
I used the mean values calculated in visual studio code to create a manual list of values that will be plotted.
![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/e0b3a8a1-daeb-45c9-94dd-4d47750b1d37)
<br>
<br>
<br>
### Results

![image](https://github.com/faray003/Data-Analyst-Project-1/assets/167533153/87295e59-fe79-40ba-a8bd-015562ea3f91)
 
The final bar chart shows organisation levels 1, 2, 3, and 4 on the x-axis and average sick leave hours on the y-axis. 1 is the highest seniority within the company and 4 is the lowest. The graph shows that as the seniority decreases, the average sick leave hours increase. The more responsibility the job title has, the less average sick leave hours that person takes. There is a positive correlation between organization level and the average sick leave hours. As the organization level increases from 1 (most senior) to 4, the average sick leave hours also increase.

Specific observations:
-	Level 1: The most senior employees take an average of 34.83 hours of sick leave.
-	Level 2: Employees at this level take an average of 44.06 hours of sick leave.
-	Level 3: Employees at this level take an average of 49.77 hours of sick leave.
-	Level 4: The least senior employees take the most sick leave, with an average of 50.94 hours.

This could suggest that less senior employees tend to take more sick leave. It could be influenced by various factors such as job stress, physical demands of the job, working conditions, etc.
