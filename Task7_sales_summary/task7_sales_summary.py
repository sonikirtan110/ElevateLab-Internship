import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

# Connect to SQLite database
conn = sqlite3.connect("sales_data.db")

# SQL query to summarize sales
query = """
SELECT 
    product, 
    SUM(quantity) AS total_qty, 
    SUM(quantity * price) AS revenue
FROM sales
GROUP BY product
"""

# Load query result into pandas DataFrame
df = pd.read_sql_query(query, conn)

# Print results
print("Sales Summary:")
print(df)

# Plot bar chart of revenue by product
df.plot(kind='bar', x='product', y='revenue', legend=False, color='skyblue')
plt.title("Revenue by Product")
plt.ylabel("Revenue ($)")
plt.xlabel("Product")
plt.tight_layout()

# Save the chart
plt.savefig("sales_chart.png")
plt.show()

# Close database connection
conn.close()
