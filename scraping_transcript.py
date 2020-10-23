#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 23 15:19:07 2020

@author: adernild
"""

#%% Importing libraries
import pandas as pd
import requests
from bs4 import BeautifulSoup
import re

#%% Modifying function from: https://github.com/vastava/data-science-projects/blob/master/debate-drinking-game/debates_scape%20transcripts.ipynb
def scrapeTranscriptFormat1(url):
    html = requests.get(url)
    html = html.text
    bs = BeautifulSoup(html, "lxml")
    paragraphs = bs.findAll("p")

    # remove 'u' tags embedded within each paragraph tag
    for paragraph in paragraphs:
        try:
            paragraph.find('u').decompose()
        except:
            continue

    # Retrieve speaker and speech from each paragraph tag
    speaker = []
    speech = []
    time = []
    pattern = r'\[.*?\]'

    for paragraph in paragraphs:
        try:
            speechText = paragraph.text.replace(u'\xa0', u'') # remove space
            speechText = re.sub(pattern, '', speechText) # remove brackets and their contents
            speech.append(re.search("[0-9]{2}\)[\r\n]+(.*)", speechText).group(1).strip(" ")) 
            speaker.append(re.search("(.*?):", speechText).group(1)) # search for speaker name, append to list
            time.append(re.search("\((.+)\)", speechText).group(1)) # search for timecode, append to list
        except:
            continue
    # Convert to dataframe
    return pd.DataFrame({'name': speaker, 'time' : time, 'speech': speech})

#%% Scraping transcript

deb = pd.read_csv('debates.csv') # list of debates and transcript url


df = scrapeTranscriptFormat1(deb.url[0])

df_2 = scrapeTranscriptFormat1(deb.url[1])

#%% Manually converting timecode to UTC-time

j = 0
for i in df.time:
    if len(i) < 6:
        df.time[j] = "2020-09-30 01:" + i # the debate was held 09/29 9PM EDT which is 09/30 1AM UTC
        j += 1
    else:
        df.time[j] = "2020-09-30 02" + i[2:8]
        j += 1

j = 0
for i in df_2.time:
    if len(i) < 6:
        df_2.time[j] = "2020-10-23 01:" + i # the final debate was held 10/22 9PM EDT which is 10/23 1AM UTC
        j += 1
    else:
        df_2.time[j] = "2020-10-23 02" + i[2:8]
        j += 1


df.to_csv('data/debate/transcript_first.csv', index=False)
df_2.to_csv('data/debate/transcript_final.csv', index=False)

