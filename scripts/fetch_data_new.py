import os
import requests
import pandas as pd 

#https://api.census.gov/data/timeseries/eits/mrts?get=cell_value,time_slot_id,error_data,category_code&for&seasonally_adj&data_type_code&time=from+2017+to+2023-12&key=ed012dc3e41299f545cef6f21b051e481614c867
BASE_URL = 'https://api.census.gov/data/timeseries/eits/mrts'
API_KEY = 'ed012dc3e41299f545cef6f21b051e481614c867'

DATA_DIR = os.path.join(os.path.dirname(os.path.dirname(__file__)), 'data')
if not os.path.exists(DATA_DIR):
    os.makedirs(DATA_DIR)

def fetch_data(data_type_code, seasonally_adjusted, start="2017", end="2023-12"):
    """
    Fetch data from the Census MRTS API for the specified parameters.

    Parameters:
    - data_type_code (str): Type of data (e.g., 'SM' or 'E_SM').
    - seasonally_adjusted (str): Whether data is seasonally adjusted ('yes' or 'no').
    - start (str): Start year or month in ISO-8601 format (default is '2017').
    - end (str): End year or month in ISO-8601 format (default is '2023-12').

    Returns:
    - pd.DataFrame: A DataFrame containing the API response data.
    """

    params = {
        "get": "cell_value,time_slot_id,data_type_code,category_code,error_data",
        "for": "us", 
        "seasonally_adj": seasonally_adjusted,
        "data_type_code": data_type_code,
        "time": f"from {start} to {end}",
        "key": API_KEY
    }
    try:
        response = requests.get(BASE_URL, params=params)
        print(f"Requesting URL: {response.url}")

        if response.status_code != 200:
            raise requests.exceptions.RequestException(
                f"API returned status code {response.status_code}: {response.text}"
            )

        data = response.json()

        if not data or len(data) < 2:
            raise ValueError("No valid data returned from API")

        df = pd.DataFrame(data[1:], columns=data[0])
        return df

    except requests.exceptions.RequestException as e:
        print(f"API Request Error: {e}")
    except ValueError as e:
        print(f"Data Error: {e}")
    except Exception as e:
        print(f"Unexpected Error: {e}")

    return pd.DataFrame()  # Return an empty DataFrame in case of failure.

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
    
    
    if not sm_data_adjusted.empty:
        save_data(sm_data_adjusted, "MRTS_adjusted.csv")

    # Not seasonally adjusted
    print("Fetching data for non-seasonally adjusted data")
    print("Fetching data for SM...")
    sm_data_not_adjusted = fetch_data("SM", "no")
    
    if not sm_data_not_adjusted.empty:
        save_data(sm_data_not_adjusted, "MRTS_not_adjusted.csv")


if __name__ == "__main__":
    main()
