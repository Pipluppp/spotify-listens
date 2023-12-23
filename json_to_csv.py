# Merge Spotify streaming history json files to csv, for a quick one-time export in pgAdmin 
import pandas as pd
import json

dfs = []
file_list = ["Streaming_History_Audio_2023_7.json", "Streaming_History_Audio_2023_6.json",
             "Streaming_History_Audio_2022-2023_5.json", "Streaming_History_Audio_2022_4.json", 
             "Streaming_History_Audio_2021-2022_3.json", "Streaming_History_Audio_2021_2.json",
             "Streaming_History_Audio_2021_1.json", "Streaming_History_Audio_2014-2021_0.json"]

for file in file_list:
    data = pd.DataFrame(json.load(open(file, encoding="utf8")))
    dfs.append(data)

df = pd.concat(dfs, ignore_index=True)

df.to_csv("python_json.csv", sep=',', encoding='utf-8', index=False)