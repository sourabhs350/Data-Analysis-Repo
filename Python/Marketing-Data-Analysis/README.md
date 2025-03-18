# Marketing Data Analysis Project

## Overview
The **Marketing Data Analysis Project** focuses on data exploration, feature engineering, and outlier detection to analyze customer behavior and marketing effectiveness. The project includes handling outliers using the **Interquartile Range (IQR)** method.

## Objectives

- Perform data exploration and cleanup.
- Engineer new features to derive insights.
- Detect and treat outliers using statistical methods.
- Analyze marketing data trends using visualizations.
- Provide actionable insights for marketing strategy optimization.

## Data Sources
The dataset includes the following:

- **Marketing Data**: Contains information about customer engagement, transactions, and campaign effectiveness.
- **Demographic Data**: Customer segmentation based on various attributes.
- **Sales and Conversion Data**: Performance metrics from different marketing channels.

## Technologies Used

- **Python**: Data processing and analysis.
- **Jupyter Notebook**: Interactive data exploration.
- **Pandas & NumPy**: Data manipulation and computation.
- **Matplotlib & Seaborn**: Data visualization.
- **SciPy**: Statistical analysis.

## Installation and Setup

### Prerequisites

Ensure you have the following installed:

- Python 3.x
- Jupyter Notebook
- Pandas, NumPy, Matplotlib, Seaborn, SciPy

### Steps to Set Up

1. **Clone the repository**:
   ```sh
   git clone https://github.com/yourusername/marketing-data-analysis.git
   cd marketing-data-analysis
   ```
2. **Install dependencies**:
   ```sh
   pip install pandas numpy matplotlib seaborn scipy jupyter
   ```
3. **Launch Jupyter Notebook**:
   ```sh
   jupyter notebook
   ```
4. **Open the provided Jupyter notebooks** for analysis.

## Project Structure

```
marketing-data-analysis/
│-- data/
│   ├── marketing_data.csv
│-- notebooks/
│   ├── data_exploration.ipynb
│   ├── feature_engineering.ipynb
│   ├── outlier_detection.ipynb
│-- visualizations/
│   ├── charts/
│-- README.md
│-- requirements.txt
```

## Example Analysis

### **1. Data Exploration**
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime
from scipy.stats import ttest_ind, f_oneway

# Loading Dataset
marketing_df = pd.read_csv("data/marketing_data.csv")

# Basic data exploration
print(marketing_df.shape)
print(marketing_df.head())
```

### **2. Feature Engineering**
```python
# Creating a new column for Total Spending by summing relevant columns
marketing_df['TotalSpending'] = marketing_df.filter(like="Mnt", axis=1).sum(axis=1)
```

### **3. Outlier Detection & Treatment (IQR Method)**
```python
Q1 = marketing_df['Total_Spend'].quantile(0.25)
Q3 = marketing_df['Total_Spend'].quantile(0.75)
IQR = Q3 - Q1

# Defining bounds for outlier detection
lower_bound = Q1 - 1.5 * IQR
upper_bound = Q3 + 1.5 * IQR

# Filtering outliers
filtered_df = marketing_df[(marketing_df['Total_Spend'] >= lower_bound) & (marketing_df['Total_Spend'] <= upper_bound)]
```

## Insights & Findings

- **Feature Engineering**: Created a new **TotalSpending** column to aggregate spending data.
- **Outlier Treatment**: Applied **Interquartile Range (IQR)** method to handle extreme values.
- **Customer Segmentation**: Identified key customer segments based on spending behavior.

## Future Enhancements

- Implement **predictive modeling** for customer churn and revenue forecasting.
- Develop **automated reporting dashboards**.
- Integrate **real-time data processing** for live campaign tracking.


---
🚀 **Let's drive marketing success with data!**

