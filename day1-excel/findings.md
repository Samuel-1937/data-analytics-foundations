# Day 1: Excel Data Cleaning and Analysis Findings

## Data Cleaning Documentation
*   **Duplicate Removal:** Identified and removed exactly 14 completely identical rows (data entry errors sharing the same Order IDs, such as O00006 and O00007) across all columns to prevent artificial revenue inflation. The dataset was reduced from 1,214 to 1,200 unique records.
*   **Calculated Column Verification:** Verified that the existing `Total` column accurately reflects `Quantity` multiplied by `Unit Price (Ghs)` for all remaining rows.

## Key Performance Indicators
*   **Total Orders:** 1,200
*   **Total Revenue:** GHS 4,731,304.0200
*   **Average Order Value (AOV):** GHS 3,942.7533

## 6 Business Findings
1.  **Overall Volume:** The business processed 1,200 unique orders, establishing a baseline Average Order Value of GHS 3,942.7533.
2.  **Top Product:** The Performance Laptop is the most significant revenue driver overall, generating GHS 1,452,562.1600 and outperforming the second-place product (Office Laptop at GHS 992,991.1300).
3.  **Category Leaders:** Revenue is highly concentrated in specific products within each category: the Performance Laptop leads Computers (GHS 1,452,562.1600), the 27-Inch Monitor leads Displays (GHS 390,588.3100), and the Standing Desk leads Furniture (GHS 218,909.1700).
4.  **Strongest Regions:** Greater Accra leads all territories with GHS 1,558,419.2000 in total sales, closely followed by the Ashanti region at GHS 1,422,383.9200.
5.  **Lowest Performing Region:** The Volta region is the weakest territory, contributing only GHS 232,144.9800 to overall revenue.
6.  **Top Salesperson:** Esther is the strongest sales representative, securing GHS 747,277.7800 in total revenue.

## 3 Business Recommendations
1.  **Target High-Performing Regions:** Because Greater Accra and Ashanti account for the vast majority of sales volume, prioritize inventory allocation and regional marketing spend in these two territories to maximize returns.
2.  **Implement Product Bundling:** Capitalize on the high demand for the Performance Laptop by bundling it with lower-performing accessories (such as the Mechanical Keyboard) to consistently push the Average Order Value above the current GHS 3,942.7533 threshold.
3.  **Category-Specific Cross-Selling:** Since the 27-Inch Monitor and the Standing Desk dominate their respective non-computer categories, launch a "Premium Workspace" cross-selling promotion that pairs these category leaders together to stimulate revenue growth outside of the core laptop segment.