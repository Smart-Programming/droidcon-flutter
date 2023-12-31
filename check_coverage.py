#!/usr/bin/python3
import os
import re
import string
import sys

from bs4 import BeautifulSoup

# set the coverage threshbold
THRESHOLD = 100

current_dir = os.getcwd()
coverage_file_path = os.path.join(current_dir, "coverage/index.html")
cov = None

# map through the html file to obtain the coverage amount

with open(coverage_file_path) as file:
    soup = BeautifulSoup(file, "lxml")
    covHi = soup.find(attrs={"class": "headerCovTableEntryHi"})
    covMed = soup.find(attrs={"class": "headerCovTableEntryMed"})
    covLow = soup.find(attrs={"class": "headerCovTableEntryLo"})

    if hasattr(covHi, "string") and covHi.string != "-":
        cov = covHi.string
    elif hasattr(covMed, "string") and covMed.string != "-":
        cov = covMed.string
    elif hasattr(covLow, "string") and covLow.string != "-":
        cov = covLow.string

pattern = r"[{}]".format(string.punctuation)
cov = re.sub(pattern, "", cov).strip().lower()
cov = int(cov)
cov = (cov / 1000) * 100



# 
if cov < THRESHOLD:
    print(
        "Coverage failure: Expected {}%. Found {}%".format((THRESHOLD), cov)
    )
    sys.exit(1)
else:
    print("Coverage achieved {}% 🚀".format(cov))
    sys.exit(0)
