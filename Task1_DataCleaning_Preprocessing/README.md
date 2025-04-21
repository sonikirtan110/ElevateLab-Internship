# Task 1: Data Cleaning & Preprocessing

**Objective**: Use Pandas in Jupyter to clean and prepare the provided raw dataset so it’s analysis‑ready.

---

## 📂 Files in this folder

- `Task1_DataCleaning_Preprocessing.csv`  
  • **Raw dataset**: 5 columns (CustomerID, Gender, Age, Annual Income (k$), Spending Score) and 10 rows.

- `Task1_DataPreprocessing.ipynb`  
  • **Jupyter notebook** containing step‑by‑step Pandas code to:
  1. Load the CSV
  2. Identify & handle missing values
  3. Remove duplicate records
  4. Standardize text fields (e.g., capitalize Gender)
  5. Rename columns to snake_case
  6. Convert data types (e.g., Age → int)
  7. (Optional) Filter outliers via IQR
  8. Save the cleaned DataFrame to `Task1_DataCleaning_Preprocessing.csv`


---

## ⚡ How to run

1. Launch Jupyter and open `Task1_DataPreprocessing.ipynb`.
2. Ensure the raw CSV is in the same folder.
3. Run all cells in order.  
   - The final cell writes the cleaned DataFrame to your local drive as `Task1_DataCleaning_Preprocessing.csv`.

4. Inspect `cleaned_data.csv` to verify your cleaning steps.

---

## 📝 Summary of Steps in Notebook

1. **Load data**: `pd.read_csv('Task1_DataCleaning_Preprocessing.csv')`
2. **Missing values**: `df.isnull().sum()`, then `dropna()` or `fillna()`
3. **Duplicates**: `df.drop_duplicates()`
4. **Standardize text**: `df['Gender'] = df['Gender'].str.capitalize()`
5. **Rename**: `df.rename(...)`
6. **Convert types**: `df['Age'] = df['Age'].astype(int)`
7. **Outlier filter** (optional): IQR method on `annual_income_k`
8. **Save**: `df.to_csv('Task1_DataCleaning_Preprocessing.csv', index=False)`

---

