# Day 1: Excel Data Cleaning and Analysis

## 1. Project Overview and Data Cleaning Documentation
The purpose of this analysis is to transform raw sales records into actionable business intelligence by cleaning messy operational data, calculating core commercial metrics, and identifying performance drivers across products, regions, and sales personnel.

### Data Cleaning Log
*   **Duplication:** The initial raw dataset contained 1,214 records. A comprehensive duplicate check across all fields identified 14 fully identical duplicate entries sharing identical Order IDs (e.g., duplicate entries for Order IDs `O00006` and `O00007`). Removing these data entry duplicates reduced the dataset to exactly 1,200 unique records, eliminating GHS 55,080.3100 in artificial revenue inflation.
*   **Column Calculations & Field Validation:** Evaluated the calculated column `Total Revenue (GHS)` against the product of `Quantity` and `Unit Price (Ghs)` across all rows to verify the revenue from each transaction.
*   **Structural Normalization:** Standardized date formats, numeric data types, and geographic categorizations to ensure error-free aggregation in Pivot Tables.

---

## 2. Key Performance Indicators (KPIs)
*   **Total Orders:** 1,200 unique transactions
*   **Total Revenue:** GHS 4,731,304.0200
*   **Average Order Value (AOV):** GHS 3,942.7533
---

## 3. Core Business Findings

1.  **Performance & Transaction Value:**
    *   *Finding:* The business achieved 1,200 closed transactions, generating GHS 4,731,304.0200 in total gross revenue with an Average Order Value (AOV) of GHS 3,942.7533.
    *   *Business Implication:* An AOV near GHS 4,000 indicates that commercial performance is accelerated by multi-unit purchases or capital equipment rather than micro-accessories.

2.  **Top Performing Product (Performance Laptop):**
    *   *Finding:* The Performance Laptop is the individual top revenue generator across the business, generating GHS 1,452,562.1600 (30.70% of total enterprise sales) and outpacing the second-ranked Office Laptop (GHS 992,991.1300).
    *   *Business Implication:* Nearly a third of gross earnings relies on a single hardware model, making overall cash flow sensitive to inventory availability and supply chain shocks for this model.

3.  **Category Performance:**
    *   *Finding:* Each category is headlined by a standout flagship product:
        *   **Computers:** Performance Laptop — GHS 1,452,562.1600
        *   **Displays:** 27-Inch Monitor — GHS 390,588.3100
        *   **Furniture:** Standing Desk — GHS 218,909.1700
        *   **Power:** UPS — GHS 102,553.4900
        *   **Storage:** External SSD 1TB — GHS 84,254.2700
        *   **Networking:** Wi-Fi Router — GHS 58,454.4900
        *   **Audio:** Bluetooth Speaker — GHS 50,657.0800
        *   **Accessories:** Mechanical Keyboard — GHS 26,440.1900
    *   *Business Implication:* Customer demand in non-computer segments converges on premium setup gear (monitors and standing desks), highlighting an addressable home-office/workstation upgrade market.

4.  **Market Concentration:**
    *   *Finding:* Greater Accra represents the largest regional market with GHS 1,558,419.2000 (32.9385%), closely followed by Ashanti with GHS 1,422,383.9200 (30.06%). Combined, these two territories contribute 63.00% of total sales.
    *   *Business Implication:* Revenue generation is clustered within two economic hubs, providing stable demand but leaving the firm vulnerable to regional economic shifts.

5.  **Underperforming Regional Markets (Volta & Northern):**
    *   *Finding:* Volta region generated the lowest regional revenue at GHS 232,144.9800 (4.91%), with the Northern region also lagging at GHS 288,906.6400 (6.11%).
    *   *Business Implication:* Underdeveloped market penetration points to either brand awareness gaps, distribution bottlenecks, or regional product misalignment.

6.  **Sales Representative Performance Distribution:**
    *   *Finding:* Esther is the top-performing salesperson, delivering GHS 747,277.7800 (15.79% of total revenue), followed by Henry at GHS 674,444.9000 (14.25%), while Bernard generated the lowest total at GHS 468,078.7000 (9.89%).
    *   *Business Implication:* The difference between the highest and lowest representative is GHS 279,199.0800, demonstrating noticeable variance in closing capability and account handling across the sales team.

---

## 4. Strategic Business Recommendations

1.  **Optimize Resource and Inventory Allocation in Greater Accra and Ashanti:**
    *   *Action:* Direct at least 65% of marketing expenditure, inventory stocking, and logistics resources into Greater Accra and Ashanti.
    *   *Expected Impact:* Prevents stockouts of core computing equipment in peak-demand zones while securing the core revenue stream that sustains business operations.

2.  **Product Bundling to Lift Average Order Value (AOV):**
    *   *Action:* Create packaged bundles pairing the top-selling Performance Laptop with lower-volume, high-margin accessories (such as USB-C Hubs, Wireless Mice, or Mechanical Keyboards) at a bundled discount.
    *   *Expected Impact:* Leverages the high conversion rate of the primary hardware driver to clear peripheral inventory and elevate the Average Order Value.

3.  **Cross-Category "Complete Workspace" Campaigns:**
    *   *Action:* Utilize the top category performers outside of Computers—specifically the 27-Inch Monitor and the Standing Desk to market an integrated "Executive Ergonomic Suite".
    *   *Expected Impact:* Broadens customer shopping baskets beyond laptops, diversifying top-line revenue across adjacent categories and capitalizing on commercial office upgrade budgets.

---

## 5. Visualizations & Analytical Rationale

### Chart 1: Total Revenue by Region
*   **Chart Type:** Vertical Column Chart (Clustered Column)
*   **Design & Placement:** Positioned on the left side of the `Sales Dashboard` worksheet; sorted from largest to smallest revenue with horizontal gridlines removed and field buttons hidden.
*   **Analytical Rationale:** Column charts provide visual benchmarking across discrete categorical dimensions, highlighting the commercial dominance of Greater Accra and Ashanti against smaller territories.

### Chart 2: Top 10 Products by Revenue
*   **Chart Type:** Horizontal Bar Chart
*   **Design & Placement:** Positioned at the top-right of the dashboard; filtered to the Top 10 items via PivotTable value filters and sorted descending.
*   **Analytical Rationale:** Product descriptions (such as "Performance Laptop" and "Mechanical Keyboard") require longer label strings. Horizontal bars keep text labels legible without vertical tilting or clipping, making ranking comparisons intuitive.

### Chart 3: Total Revenue by Salesperson
*   **Chart Type:** Sorted Vertical Column Chart
*   **Design & Placement:** Positioned at the bottom-right of the dashboard; sorted in descending order of performance with direct data callouts.
*   **Analytical Rationale:** This shows individual representative performance and identify weak sales reps for improvements in the future.