import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Generate sample data
def generate_sample_data():
    data = {
        'property_id': [1, 2, 3, 4, 5],
        'property_type': ['Apartment', 'House', 'Apartment', 'House', 'Condo'],
        'tenant_gender': ['Male', 'Female', 'Male', 'Male', 'Female'],
        'rent': [1200, 1500, 1100, 1600, 1000],
        'maintenance_issue': ['Plumbing', 'Electrical', 'HVAC', 'Plumbing', 'Other'],
        'month': ['Jan', 'Feb', 'Mar', 'Apr', 'May']
    }
    return pd.DataFrame(data)

# Data Cleaning and Preprocessing
def clean_data(data):
    # No cleaning needed for sample data
    return data

# Exploratory Data Analysis (EDA)
def perform_eda(data):
    # Basic statistics
    print(data.describe())
    # Visualize distributions
    sns.histplot(data['rent'], kde=True)
    plt.show()

# Analysis Functions
def tenant_behavior_analysis(data):
    # Example analysis: Tenant demographics
    tenant_demographics = data['tenant_gender'].value_counts()
    print("Tenant Demographics:\n", tenant_demographics)

def rental_performance_analysis(data):
    # Example analysis: Rental income trends
    monthly_income = data.groupby('month')['rent'].sum()
    print("Monthly Rental Income:\n", monthly_income)

def maintenance_optimization(data):
    # Example analysis: Common maintenance issues
    common_issues = data['maintenance_issue'].value_counts()
    print("Common Maintenance Issues:\n", common_issues)

def market_trends_analysis(data):
    # Example analysis: Rental prices compared to market benchmarks
    rental_prices = data['rent']
    market_benchmarks = [1000, 1100, 1050]  # Example market rental prices
    # Compare rental prices to market benchmarks and identify trends

# Main Function
def main():
    # Generate sample data
    data = generate_sample_data()
    
    # Data Cleaning and Preprocessing
    data = clean_data(data)
    
    # Exploratory Data Analysis
    perform_eda(data)
    
    # Analysis
    tenant_behavior_analysis(data)
    rental_performance_analysis(data)
    maintenance_optimization(data)
    market_trends_analysis(data)
    
if __name__ == "__main__":
    main()
