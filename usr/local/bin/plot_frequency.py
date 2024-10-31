import pandas as pd
import matplotlib.pyplot as plt
import os

# Define the file path using os.path.expanduser to handle the user directory dynamically
file_path = os.path.expanduser('/home/troll/Documents/constant-files/journalinglog')

# Check if the file exists
if not os.path.isfile(file_path):
    raise FileNotFoundError(f"The file at {file_path} does not exist.")

# Read the log file into a DataFrame
df = pd.read_csv(file_path, header=None, names=['Date'], parse_dates=['Date'])

# Extract the year-month and day columns
df['YearMonth'] = df['Date'].dt.to_period('M')
df['Day'] = df['Date'].dt.day

# Count unique days per month
unique_days_per_month = df.groupby('YearMonth')['Day'].nunique()

# Plot the data
plt.figure(figsize=(12, 6))
unique_days_per_month.plot(kind='bar', color='skyblue')
plt.title('Number of Unique Days Accessed per Month')
plt.xlabel('Month')
plt.ylabel('Number of Unique Days')
plt.xticks(rotation=45)
plt.grid(axis='y')

# Save the plot
plt.tight_layout()
plt.savefig('unique_days_per_month.png')
plt.show()

