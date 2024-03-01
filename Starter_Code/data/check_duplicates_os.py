import os
import sys
import pandas as pd

import os
import sys
import pandas as pd

def check_duplicates(csv_file):
    df = pd.read_csv(csv_file)
    duplicates = df[df.duplicated(subset=['emp_no'])]
    if not duplicates.empty:
        print("Duplicate values found in 'emp_no' column:")
        print(duplicates)
    else:
        print("No duplicates found in 'emp_no' column.")

# Get the full path of the current script file
current_directory = os.path.dirname(os.path.abspath(sys.argv[0]))
print("Current directory:", current_directory)

# Construct the full file path dynamically
csv_file = os.path.join(current_directory, 'dept_manager.csv')
print("CSV file path:", csv_file)

check_duplicates(csv_file)