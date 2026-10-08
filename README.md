# E-Learning-Platform-Purchase-Analysis-SQL
This project analyses learner purchases, course sales, and category-wise revenue for a small e-learning platform using MySQL.

**Project Overview**
The database shows a basic e‑learning setup with learners, courses, and purchases.  
The main questions are:
- Which learners spend the most?
- Which courses and categories generate the highest revenue?
- Which courses and categories have lower sales or revenue?

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
- Calculated total spend per learner, revenue and quantity sold by course and category, number of unique learners per category, and identified courses with no purchases.

**Insights**
- Some learners recorded higher total spending than others based on their purchase quantities and course prices.
- SQL for Beginners and Excel for Business recorded higher unit sales than the Programming course in the analysed dataset. 
- The analysis showed differences in revenue and learner participation across course categories.
