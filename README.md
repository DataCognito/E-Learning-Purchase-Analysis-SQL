# E-Learning-Platform-Purchase-Analysis-SQL
This project analyses learner purchases, course performance, and category-wise revenue for a small e-learning platform using MySQL. It explores who spends the most, which courses perform well, and which categories are weaker.

**Project Overview**
The database shows a basic e‑learning setup with learners, courses, and purchases.  
The main questions are:
- Which learners spend the most?
- Which courses and categories generate the highest revenue?
- Are there any courses or categories that need attention?

The analysis uses three tables:
- learners – learner id, full name, country  
- courses – course id, course name, category, unit price  
- purchases – purchase id, learner id, course id, quantity, purchase date

**Tools Used** 
- MySQL Workbench
- MySQL Server

**What I Did**
- Designed the database with primary and foreign keys to link learners, courses, and purchases.  
- Added sample transaction data and wrote SQL queries with joins, aggregations, GROUP BY, HAVING and filters where needed.  
- Calculated total spend per learner, revenue and quantity by course and category, number of unique learners per category, and found courses with no purchases.

**Insights**
- A small group of high‑value learners accounts for most of the revenue.  
- Beginner SQL and Excel courses perform the best, while Programming has the weakest results.  
- Every course has at least one purchase, but some categories clearly attract more interest than others.

**Recommendations**
- Create a clear “Data Analyst Path” bundle (SQL → Excel → Power BI → basic ML) for learners who want a structured track.  
- Refresh and reposition Programming courses to make them more appealing.  
- Use targeted offers and suggestions for learners who already buy from multiple categories.
