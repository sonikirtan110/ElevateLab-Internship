# Task 5: Exploratory Data Analysis (EDA)

**Objective:**  
Perform a statistical and visual exploration of the Titanic dataset to uncover insights, patterns, and relationships.

---

## 📁 File Structure
```plaintext
Task5_Exploratory_Data_Analysis(EDA)/
├── README.md                 # This file (including report content summary)
├── train.csv                 # Raw Titanic training data
├── gender_submission.csv     # Passenger survival predictions (sample)
└── task5.ipynb           # Jupyter Notebook with all EDA code
```

---

## ⚡ How to Run

1. Clone the folder into your local machine (or workspace).  
2. Install required Python packages:
   ```bash
   pip install pandas numpy matplotlib seaborn
   ```  
3. Launch Jupyter Notebook:
   ```bash
   jupyter lab
   ```  
4. Open and run **Task5_EDA.ipynb** from top to bottom.  
5. After completing analysis, export **report.pdf** from your notebook.

---

## 📑 Deliverables

- **Jupyter Notebook** (`task5.ipynb`) containing: data loading, cleaning checks, visualizations, and observations.  

---

## 📄 Report Content

### 1. Introduction
The Titanic dataset records passenger information for the 1912 maritime disaster. Our goals are to:

- Analyze demographic and ticket-related factors affecting survival.  
- Identify patterns in age, gender, class, family structure, and fare.  
- Provide actionable insights and recommendations for further modeling.

### 2. Data Overview
- **Rows:** 891 passenger records.  
- **Columns:** 12 features including `Survived`, `Pclass`, `Sex`, `Age`, `SibSp`, `Parch`, `Fare`, `Embarked`, etc.  
- **Missing Data:**  
  - `Age` ≈19.9% missing  
  - `Cabin` ≈77% missing  
  - `Embarked` ≈0.2% missing  

### 3. Methodology
1. **Data Profiling:** `.info()`, `.describe()`, and missing-value heatmap.  
2. **Univariate Analysis:** Distribution plots for `Survived`, `Pclass`, `Sex`, `Age`, `Fare`, `Embarked`.  
3. **Bivariate Analysis:** Survival rates by class, gender, age groups, embarkation, family size.  
4. **Multivariate Analysis:** Correlation matrix and pairplot for key numeric features.  
5. **Feature Engineering:** Derived `FamilySize` and extracted `Title` from passenger names.  
6. **Report Writing:** Document observations under each section and summarize findings.

### 4. Key Findings

#### 4.1 Missing Value Insights
- **Age** missing entries were imputed or analyzed separately—missingness not random, older passengers less likely to have missing age.  
- **Cabin** dropped due to high missing rate; considered for future text-mining.

#### 4.2 Univariate Patterns
- **Survival Rate:** ≈38% survived overall.  
- **Passenger Class:** Pclass 1 survival ≈63% vs. Pclass 3 ≈24%.  
- **Gender:** Female survival ≈75% vs. male ≈20%.  
- **Age:** Children (Age <16) had slightly higher survival; median age ≈28.  
- **Fare:** Right-skewed; higher fares correlate with higher survival.  
- **Embarked:** Passengers from C (Cherbourg) had higher survival (~55%) compared to S (Southampton) or Q (Queenstown).

#### 4.3 Bivariate Relationships
- **Class & Survival:** Clear decreasing survival from Pclass 1 → 3.  
- **Gender & Survival:** Very low male survival vs. high female survival.  
- **Age vs. Survival:** Younger children more likely to survive; adult survival dips with age.  
- **FamilySize:** Solo travelers and very large families had lower survival; families of size 2–4 saw higher rates.

#### 4.4 Multivariate Correlation
- **Correlation Matrix:** `Pclass` negatively correlated with `Fare` and `Survived`. `Fare` positively correlated with `Age` and `Survived`.  
- **Pairplot Highlights:** Clusters of survivors in higher fare and younger ages.

### 5. Recommendations
- **Impute Missing Ages** using median by title (e.g., Mr, Mrs, Miss) for improved modeling.  
- **Engineer Cabin Feature** by extracting deck letters for additional signal.  
- **Focus on High-Impact Variables** (`Sex`, `Pclass`, `Fare`, `FamilySize`) in predictive models.
