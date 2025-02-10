import subprocess
from bs4 import BeautifulSoup
import requests
import os
import wget

sysinternals_url = "https://live.sysinternals.com"

response = requests.get(sysinternals_url)
soup = BeautifulSoup(response.content, "html.parser")

os.chdir("sysinternals")

for a in soup.find_all('a', href=True):
    if not os.path.isfile(a['href']):
        URL = sysinternals_url+a['href']
        print(f"\nDownloading {URL}")
        file = wget.download(URL)
    else:
        print(f"File {a['href']} has already been saved.")

os.chdir('..')