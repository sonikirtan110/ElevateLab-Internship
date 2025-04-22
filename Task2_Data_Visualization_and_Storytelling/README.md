# 📊 Task 2 – Power BI Sales Dashboard: Data Visualization & Storytelling

![Sales Dashboard](./pic.png)

## 🎯 Objective
To create a compelling and interactive **Sales Performance Dashboard** using Power BI that emphasizes **data storytelling**, **business insights**, and **user-friendly design**.

---

## 🧰 Tools Used
- **Power BI Desktop**
- **Contoso Sales Dataset** (or Superstore/any other sales data)
- **DAX Calculations**
- **Power BI Visuals** (Bar, Line, Waterfall, KPI, Card, Table, Slicer)

---

## 🪜 Step-by-Step Process to Build This Dashboard

### 1️⃣ Load the Data
- Import your dataset (`Contoso.csv` or `Superstore.csv`) into Power BI using **Get Data → Text/CSV**.
- Inspect columns like `Sales`, `Quantity`, `Profit`, `Discount`, `Region`, etc.

### 2️⃣ Data Cleaning & Transformation
- Use **Power Query Editor** to:
  - Remove nulls and errors
  - Rename columns for clarity
  - Change data types
  - Create custom columns if needed

### 3️⃣ Create Measures Using DAX
Add meaningful KPIs using DAX, like:
```DAX
Net Profit = SUM(Sales[SalesAmount]) - SUM(Sales[CostOfGoods])
YOY Net Profit % = 
DIVIDE(
    [Net Profit] - [PY Net Profit],
    [PY Net Profit],
    0
)
```

### 4️⃣ Design the Dashboard Layout
Include the following visual sections:
- 📈 **Net Profit Over Time**: Combo chart showing current vs previous year profit with YOY%
- 💼 **Year Over Year Profit by Product Brand**: Waterfall chart for brand comparison
- 🌍 **Geography Table**: Matrix showing region-wise sales, expenses, and profits
- 🔢 **KPI Cards**: For Net Profit, Sales Quantity, Discount, Cost, etc.
- 🔎 **Slicers Panel**: For filtering by Year, Channel, Region, Store, Category

### 5️⃣ Enhance Visual Storytelling
- Use titles, tooltips, and data labels
- Highlight highest/lowest values using color formatting
- Arrange visuals in logical flow (top-down or left-right)

### 6️⃣ Final Touches
- Apply consistent font, spacing, and border styles
- Rename pages and visuals clearly
- Test interactivity and slicers

---

## 📌 Key Insights from the Dashboard
- 🔼 **Q4 Net Profit** saw the highest performance of the year
- 💰 **Contoso and Adventure Works** were top product brands by profit
- 🌍 **United States** contributed the most to overall sales and profit
- 📉 Mid-year dips suggest seasonal business fluctuations

---

## ✅ Best Practices Followed
- Minimal color usage to reduce clutter
- Strategic chart selection (bar, combo, waterfall)
- KPI cards for quick executive summaries
- Interactivity with slicers for flexible analysis
- Dashboard structured around business questions

---

## 🔗 Connect with Me
[📎 LinkedIn – Kirtan Soni](https://www.linkedin.com/in/kirtansoni02)
