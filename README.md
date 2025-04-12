This project is a data warehouse created in Microsoft SQL Server, that allows for storing, analyzing, and reporting student data, expenses, income, activity, and demographics.

The database includes fact and dimension tables. The data relates to:

Fact Tables:
Student Expenses – data on student spending, payment methods, categories, and amounts.
Student Income – sources of income, amount, and frequency.
Activities – students' physical activities: location, time, calories burned.

Dimension Tables:
Person – demographic data: gender, education level, place of residence and study.
Time (of activity)– time dimension: date, hour, year, month, season.
City – city information, type (urban/rural).
Payment Method, Expense Category, Income Type, Activity Type, Place, Hour – supporting lookup dictionaries.
