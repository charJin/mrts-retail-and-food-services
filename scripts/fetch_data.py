import os
import requests
import pandas as pd 

#https://api.census.gov/data/timeseries/eits/mrts?get=cell_value,time_slot_id,error_data,category_code&for&seasonally_adj&data_type_code&time=from+2017+to+2023-12&key=ed012dc3e41299f545cef6f21b051e481614c867
BASE_URL = 'https://api.census.gov/data/timeseries/eits/marts'
API_KEY = 'ed012dc3e41299f545cef6f21b051e481614c867'

DATA_DIR = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'data')
if not os.path.exists(DATA_DIR):
    os.makedirs(DATA_DIR)

def fetch_data(data_type_code, seasonally_adjusted, start=2017, end="2023-12"):
    """
    Fetch data from the Census API for the specified data_type_code and time range.

    Parameters:
    - data_type_code (str): The type of data to fetch ('SM' or 'E_SM in this instance).
    - seaasonlly_adjusted (str): yes or no value depending on data to be seasonally adjusted.
    - start_year (int): The starting time for the data (Defaults to 2017)
    - end_year (str): The ending time for the data. (Defaults to Dec 2023)

    Returns:
    - pd.DataFrame: A DataFrame containing the API response data.
    """

    params = {
        "get": "cell_value,time_slot_id,error_data,category_code",
        "for": "us",
        "seasonally_adj": seasonally_adjusted,
        "data_type_code": data_type_code,
        "time": f"from {start} to {end}",
        "key": API_KEY
    }
    try:
        response = requests.get(BASE_URL, params=params)
        print(f"Requesting URL: {response.url}")  # Debugging: Check constructed URL

        if response.status_code != 200:
            raise requests.exceptions.RequestException(
                f"API returned status code {response.status_code}: {response.text}"
            )

        data = response.json()

        if not data or len(data) < 2:
            raise ValueError("Invalid Data Returned")
        
        df = pd.DataFrame(data[1:], columns=data[0])
        return df

    except requests.exceptions.RequestException as e:
        print(f"API Request Error: {e}")
    except ValueError as e:
        print(f"Data Error: {e}")
    except Exception as e:
        print(f"Unexpected Error: {e}")
    return pd.DataFrame() # Empty dataframe when failed

def save_data(df, filename):
    """
    Save the DataFrame to a CSV file in the data folder

    Parameters:
    - df (pd.DataFrame): DataFrame to save.
    - filename (str): Name of the file.
    """
    file_path = os.path.join(DATA_DIR, filename)
    try:
        df.to_csv(file_path, index=False)
        print(f"Data saved to {file_path}")
    except Exception as e:
        print(f"Error saving data: {e}")


def main():
    print("Fetching data for SM...")
    sm_data_adjusted = fetch_data("SM", "yes")
    
    print("Fetching data for E_SM...")
    esm_data_adjusted = fetch_data("E_SM", "yes")
    
    # Combine
    if not sm_data_adjusted.empty and not esm_data_adjusted.empty:
        combined_data_adjusted = pd.concat([sm_data_adjusted, esm_data_adjusted])
        save_data(combined_data_adjusted, "combined_data_season_adjusted.csv")

    # Not seasonally adjusted
    print("Fetching for data not seasonally adjusted")
    print("Fetching data for SM...")
    sm_data_not_adjusted = fetch_data("SM", "no")
    
    print("Fetching data for E_SM...")
    esm_data_not_adjusted = fetch_data("E_SM", "no")
    
    # Combine
    if not sm_data_not_adjusted.empty and not esm_data_not_adjusted.empty:
        combined_data_not_adjusted = pd.concat([sm_data_not_adjusted, esm_data_not_adjusted])
        save_data(combined_data_not_adjusted, "combined_data_season_not_adjusted.csv")


if __name__ == "__main__":
    main()