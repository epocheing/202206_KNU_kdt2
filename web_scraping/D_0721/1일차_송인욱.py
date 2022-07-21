from multiprocessing.connection import wait
from urllib.error import HTTPError
from urllib.request import urlopen

from bs4 import BeautifulSoup

try:
    html = urlopen("https://forecast.weather.gov/MapClick.php?lat=37.7772&lon=-122.4168")
except HTTPError:
    pass

weather = BeautifulSoup(html, "html.parser")
a = weather.find_all("div", {"class": "tombstone-container"})
b = weather.find("div", {"class": "tombstone-container"}).find_all("p")

print(b)
