#! /bin/env python
import os
import csv

times={}

for filename in os.listdir("../results/time/"): # Collect the times
    f=open("../results/time/"+filename)
    for line in f:
        (key,val) = line.split(': ')
        if key[:-4] not in times.keys(): times[key[:-4]] = []
        times[key[:-4]].append(float(val))

stats={}
for k in times.keys(): # Write down the stats
    l = times[k]
    stats[k] = {'avg': (sum(l)/len(l)), 'max': max(l), 'min': min(l) }

w=csv.writer(open("../results/times.csv", "w")) # Write on a csv file
w.writerow(["Program", "avg", "max", "min"])
for key, val in stats.items():
    w.writerow([key]+list(val.values()))
