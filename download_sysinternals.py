from bs4 import BeautifulSoup
import requests
import os
import wget

sysinternals_url = "https://live.sysinternals.com/tools/" # Binaries hosted on this page

response = requests.get(sysinternals_url) 

soup = BeautifulSoup(response.content, "html.parser") # Create BeautifulSoup object to extract the names of the binaries

os.chdir("sysinternals") # Move into the sysinternals directory

# Because (almost) all the links on the page point to the binaries, we can parse through the href links to download the files.
for a in soup.find_all('a', href=True):
    
    # Check to make sure the file hasn't already been downloaded, and is not the link to the parent directory
    if a.text != "[To Parent Directory]":

        if not os.path.isfile(a.text):

            URL = sysinternals_url+a.text # Build the URL that points to the binary's download link

            print(f"\nDownloading {URL}")

            # Use wget to download the file
            file = wget.download(URL)

        else:
            print(f"File {a['href']} has already been saved.")

os.chdir('..') # Change back to the original directory