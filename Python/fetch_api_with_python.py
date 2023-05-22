# Plubic API Spotify Top 20 by monthly listners
"""

import requests
import pandas as pd
import time
import os

from dotenv import load_dotenv
load_dotenv('api.env')

api_key = os.environ.get('API_KEY')
api_host = os.environ.get('API_HOST')

url = "https://spotify81.p.rapidapi.com/top_20_by_monthly_listeners"

headers = {
	"X-RapidAPI-Key": "api_key",
	"X-RapidAPI-Host": "api_host"
}

response = requests.request("GET", url, headers=headers)

print(response.text)

# check status code
response.status_code # 200 Success!

# preview data
result = response.json()
result[5]

# get data
rank = []
artist = []
monthly_listener = []

for i in range(0,20):
    rank.append(result[i]['rank'])
    artist.append(result[i]['artist'])
    monthly_listener.append(result[i]['monthlyListeners'])
    time.sleep(2)

print("Success!")

# Create DataFrame
df = pd.DataFrame({"Rank":rank,"Artist":artist,"Monthly_listeners":monthly_listener}, index=None)

df
