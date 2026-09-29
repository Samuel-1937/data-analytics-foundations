# Day 2: PostgreSQL Sales Analysis Findings

**1. How many orders are in the data?**
* **SQL Output:** 1200
* **Business Explanation:** This figure represents the total transaction volume for the period. It serves as the baseline measure of the operational activity and sales velocity. 

**2. What is total revenue?**
* **SQL Output:** GHS 4,731,304.02
* **Business Explanation:** This is the total income from all sales. It shows the overall size and financial performance of the business during this period.

**3. How many unique customers are there?**
* **SQL Output:** 180
* **Business Explanation:** This shows the number of active customers. Comparing it with the total number of orders helps to identify whether customers return to buy again or make only one purchase.

**4. What is the average order value?**
* **SQL Output:** GHS 3,942.75
* **Business Explanation:** The average order value shows how much a customer usually spends in one order. Product bundles and volume discounts could increase this amount without the cost of finding new customers.

**5. Which five products generate the most revenue?**
* **SQL Output:** 
  1. Performance Laptop: GHS 1,452,562.16
  2. Office Laptop: GHS 992,991.13
  3. Mini Pc: GHS 830,370.59
  4. 27-Inch Monitor: GHS 390,588.31
  5. Standing Desk: GHS 218,909.17
* **Business Explanation:** These products bring in the most money. Enough stock of them should be keptnand make them a main focus of future marketing.

**6. What is revenue by region?**
* **SQL Output:** 
  * Greater Accra: GHS 1,558,419.20
  * Ashanti: GHS 1,422,383.92
* **Business Explanation:** This shows where sales are strongest. It also helps to identify regions that may need more marketing or sales support.

**7. What is revenue by category?**
* **SQL Output:** 
  * Computers: GHS 3,275,923.88
  * Displays: GHS 604,339.37
* **Business Explanation:** This shows which product categories sell best. This information can be used to decide which products to develop and which categories to expand.

**8. How does revenue change by month?**
* **Business Explanation:** Monthly sales brings out seasonal patterns and whether the business is growing. This supports planning for cash flow, stock, and promotions.

**9. Which salesperson generates the most revenue?**
* **SQL Output:** Esther - GHS 747,277.78
* **Business Explanation:** Esther generated the most sales.Her approach could be studied and used to help set targets and improve the rest of the sales team.

**10. Which customers spend the most?**
* **SQL Output:** 
  1. Priscilla Owusu: GHS 143,462.35
  2. Daniel Osei: GHS 129,150.74
* **Business Explanation:** These customers spend the most. They can be given extra attention through loyalty benefits, personal support, and early access to new products.

**11. Which categories exceed a chosen revenue threshold?**
* **SQL Output:** (Threshold: GHS 50,000.00)
  * Computers: GHS 3,275,923.88
  * Displays: GHS 604,339.37
* **Business Explanation:** This identifies the categories that earned more than GHS 50,000. These are the main product categories supporting the business.

**12. What additional business question can you answer from the data?**
* **Business Question:** What is the average quantity of items purchased per transaction across the different product categories?
* **SQL Output:** 
  * Audio: 2.09
  * Power: 2.07
* **Business Explanation:** This shows whether customers usually buy one item or several items at a time. This can be used to plan packaging and shipping, and to consider bulk discounts for categories with higher quantities.

*Note: The sql file containng the queries and the answers can be found in the day2-sql folder with the file name "analysis_queries.sql"*