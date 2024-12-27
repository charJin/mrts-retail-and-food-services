import pandas as pd
import glob
import os

# Folder path containing all CPI files
folder_path = "../data/cpi"  # Update this to your folder path
all_files = glob.glob(os.path.join(folder_path, "*.xlsx"))

combined_data = []  # Store data from all files
month_map = {
    "01": "Jan",
    "02": "Feb",
    "03": "Mar",
    "04": "Apr",
    "05": "May",
    "06": "Jun",
    "07": "Jul",
    "08": "Aug",
    "09": "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec",
}

# Track whether 'Expenditure category' has been added
expenditure_category_added = False
expenditure_category_column = "Expenditure category"

for file in all_files:
    filename = os.path.basename(file)
    if filename.startswith("cpi-u-201701") and filename.endswith(".xlsx"):
        try:
            # Extract year and month from filename
            year_month = filename.split("-")[2].replace(".xlsx", "")
            year = year_month[:4]  # Extract year (first 4 characters)
            month = year_month[4:]  # Extract month (last 2 characters)

            # Construct the target column name
            if month == "05":
                column_to_extract = f"{month_map[month]}\n{year}"
            else:
                column_to_extract = f"{month_map[month]}.\n{year}"           

            # Read the file
            df = pd.read_excel(file, header=[3,7])  # Read without assuming a single header row
            # print("After the 4 rows, columns are: ", df.columns)
            print("columns levels: ", df.columns.levels)
            print("columns list: ", df.columns.to_list())  # Lists all column tuples

        
        except Exception as e:
            print(f"Error processing file '{filename}': {e}")
