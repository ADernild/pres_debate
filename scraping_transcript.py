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
from datetime import datetime

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
    t = []
    pattern = r'\[.*?\]'

    for paragraph in paragraphs:
        try:
            speechText = paragraph.text.replace(u'\xa0', u'') # remove space
            speechText = re.sub(pattern, '', speechText) # remove brackets and their contents
            speech.append(re.search("[0-9]{2}\)[\r\n]+(.*)", speechText).group(1).strip(" ")) 
            speaker.append(re.search("(.*?):", speechText).group(1)) # search for speaker name, append to list
            t.append(re.search("\((.+)\)", speechText).group(1)) # search for timecode, append to list
        except:
            continue
    # Convert to dataframe
    return pd.DataFrame({'name': speaker, 'time' : t, 'speech': speech})

#%% Scraping transcripts from rev.com 

deb = pd.read_csv('debates.csv') # list of debates and transcript url


df = scrapeTranscriptFormat1(deb.url[0])

df_2 = scrapeTranscriptFormat1(deb.url[1])

#%% Manually converting timecode to UTC-time first transcript

# First problem: timecode resets one times, throughout the transcript which adding delt should fix.
# Second problem: I want to transform the timecode to the corresponding live UTC time, 
# which adding delt2 should fix.

delt = datetime.strptime(df.time[178], "%M:%S") - datetime.strptime("00:00", "%M:%S")
delt2 = datetime.strptime("2020-09-30 01:00:00", "%Y-%m-%d %H:%M:%S") - datetime.strptime("00:00", "%M:%S")

new = []

for i in df.time[0:179]:
    d = datetime.strptime(i, "%M:%S")
    new.append(d + delt2)

for i in df.time[179:724]:
    d = datetime.strptime(i, "%M:%S")
    new.append(d + delt + delt2)

for i in df.time[724:790]:
    d = datetime.strptime(i, "%H:%M:%S")
    new.append(d + delt + delt2)

df.time = new

#%% Manually converting timecode to UTC-time final transcript

# First problem: timecode resets one times, throughout the transcript, which adding delt the first time 
# and delt_ the second time should fix.
# Second problem: I want to transform the timecode to the corresponding live UTC time, 
# which adding delt2 should fix.

delt = datetime.strptime(df_2.time[88], "%M:%S") - datetime.strptime("00:00", "%M:%S")
delt2 = datetime.strptime("2020-10-23 01:00:00", "%Y-%m-%d %H:%M:%S") - datetime.strptime("00:00", "%M:%S")

new = []

for i in df_2.time[0:89]:
    d = datetime.strptime(i, "%M:%S")
    new.append(d + delt2)

for i in df_2.time[89:337]:
    d = datetime.strptime(i, "%M:%S")
    new.append(d + delt + delt2)

delt_ = new[336] - datetime.strptime("00:00", "%M:%S")

for i in df_2.time[337:512]:
    d = datetime.strptime(i, "%M:%S")
    new.append(d + delt_)

df_2.time = new

#%% Saving transcripts as .csv

df.to_csv('data/debate/transcript_first.csv', index=False)
df_2.to_csv('data/debate/transcript_final.csv', index=False)

