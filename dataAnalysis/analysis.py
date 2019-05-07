#!/usr/bin/python


import json
from os import listdir
from os.path import isfile, join
import glob
from pprint import pprint
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import sys, getopt
import datetime
import re

from lineCount import sizesFromSource

from matplotlib.backends.backend_pdf import PdfPages
import copy
import matplotlib

from scipy.optimize import curve_fit
from scipy.stats import linregress
from math import sqrt
SPINE_COLOR = 'gray'

# def latexify(fig_width=None, fig_height=None, columns=1):
#     """Set up matplotlib's RC params for LaTeX plotting.
#     Call this before plotting a figure.

#     Parameters
#     ----------
#     fig_width : float, optional, inches
#     fig_height : float,  optional, inches
#     columns : {1, 2}
#     """

#     # code adapted from http://www.scipy.org/Cookbook/Matplotlib/LaTeX_Examples

#     # Width and max height in inches for IEEE journals taken from
#     # computer.org/cms/Computer.org/Journal%20templates/transactions_art_guide.pdf

#     assert(columns in [1,2])

#     if fig_width is None:
#         fig_width = 3.39 if columns==1 else 6.9 # width in inches

#     if fig_height is None:
#         golden_mean = (sqrt(5)-1.0)/2.0    # Aesthetic ratio
#         fig_height = fig_width*golden_mean # height in inches

#     MAX_HEIGHT_INCHES = 8.0
#     if fig_height > MAX_HEIGHT_INCHES:
#         print("WARNING: fig_height too large:" + fig_height + 
#               "so will reduce to" + MAX_HEIGHT_INCHES + "inches.")
#         fig_height = MAX_HEIGHT_INCHES

#     params = {'backend': 'ps',
#               'text.latex.preamble': ['\usepackage{gensymb}'],
#               'axes.labelsize': 8, # fontsize for x and y labels (was 10)
#               'axes.titlesize': 8,
#               'text.fontsize': 8, # was 10
#               'legend.fontsize': 8, # was 10
#               'xtick.labelsize': 8,
#               'ytick.labelsize': 8,
#               'text.usetex': True,
#               'figure.figsize': [fig_width,fig_height],
#               'font.family': 'serif'
#     }

#     matplotlib.rcParams.update(params)


def format_axes(ax):

    for spine in ['top', 'right']:
        ax.spines[spine].set_visible(False)

    for spine in ['left', 'bottom']:
        ax.spines[spine].set_color(SPINE_COLOR)
        ax.spines[spine].set_linewidth(0.5)

    ax.xaxis.set_ticks_position('bottom')
    ax.yaxis.set_ticks_position('left')

    for axis in [ax.xaxis, ax.yaxis]:
        axis.set_tick_params(direction='out', color=SPINE_COLOR)

    return ax

## colors
green =  "#24BF1D" #"#31FD2E"
brightRed = "#FF0404"
darkRed = "#8F0000"
blue = "#1620A8"
yellow = "#C6A600"  
purple = "#800080"

def sanitizeData(text):
     ## needed to handle bugs in the JSON generation :-)
    if text.endswith(","):
        text = text[:-1]
    keywords = ["status","name", "file", "entry"]
    for keyword in keywords:
        text = text.replace(keyword+":", "\""+keyword+"\":")
    return text


def sanitizePathData(text):
     ## needed to handle bugs in the JSON generation :-)
    if text.endswith(","):
        text = text[:-1]
    text += "]"
    keywords = ["status","name", "file", "entry"]
    for keyword in keywords:
        text = text.replace(keyword+":", "\""+keyword+"\":")
    toRemove = re.findall( r'\"path[0-9]*\"=', text)
    for kywd in toRemove:
        text = text.replace(kywd, "")
    return text


## load the json data. 
def loadData(path):
    print("Loading data from "+path)
    extension = "*.json"
    jsonFiles = glob.glob(path+"/"+extension)
    data = {}
    for filename in jsonFiles:
        with open(filename) as f:
            content = f.read()
            content = sanitizeData(content)
            try:
                data[filename.replace(path+"/","").replace(".json","")] = json.loads(content)
            except:
                print("File %s cannot be decoded!"%(filename.replace(path+"/","").replace(".json","")))
                assert False
    
    print("Loaded %d files"%len(data))
    return data

def loadPaths(path):
    print("Loading path data from "+path)
    extension = "*.json_paths"
    jsonFiles = glob.glob(path+"/"+extension)
    data = []
    for filename in jsonFiles:
        with open(filename) as f:
            content = f.read()
            content = sanitizePathData(content)
            jsonContent = json.loads(content)
            for path in jsonContent:
                path["name"] = filename
            data.extend(jsonContent)

    print("Loaded %d paths"%len(data))
    return data

def loadAndMergePaths(pathCtrl,pathData):
    print("Loading ctrl_path data from "+pathCtrl)
    print("Loading data_path data from "+pathData)
    extension = "*.json_paths"
    jsonFiles = glob.glob(pathCtrl+"/"+extension)
    data = []
    for filename in jsonFiles:
        with open(filename) as f:
            content = f.read()
            content = sanitizePathData(content)
            jsonContent = json.loads(content)
            for path in jsonContent:
                path["name"] = filename
            data.extend(jsonContent)

    print("Loaded %d paths"%len(data))
    return data

def loadSizes(path):
    with open(path) as f:
        data = json.load(f)
        return data

def collectPaths(data):
    paths = []
    for function in data.keys():
        functionData = data[function]
        if "paths" in functionData.keys():
            for path in functionData["paths"]:
                if path != 'length': ## needed because we have a length entry in the json
                    #### OLD
                    # pathData = functionData["paths"][path]
                    # paths.append(copy.deepcopy(pathData))
                    #### END OLD
                    pathData = functionData["paths"][path]
                    pathData = copy.deepcopy(pathData)
                    pathData["name"] = function
                    paths.append(pathData)
    return paths


## get lenght
def getTotalSteps(entry):
    length = 0
    if "paths" in entry:
        for path in entry["paths"]:
            if path != 'length': ## needed because we have a length entry in the json
                pathData = entry["paths"][path]
                steps = pathData["steps"]
                length = length + steps
    return length

## get lenght
def getTracesLength(entry):
    length = 0
    if "paths" in entry:
        for path in entry["paths"]:
            if path != 'length': ## needed because we have a length entry in the json
                pathData = entry["paths"][path]
                traceLength = pathData["trace_length"]
                length = length + traceLength
    return length

## get number of uniquely executed instructions
def getTotalPc(entry):
    pcs = set()
    if "paths" in entry:
        for path in entry["paths"]:
            if path != 'length': ## needed because we have a length entry in the json
                pathData = entry["paths"][path]
                pcs.update(pathData["pc"].keys())
    return len(pcs)


## get number of explored paths
def getTotalPaths(entry):
    if "paths" in entry:
        if "length" in entry["paths"].keys():
            return len(entry["paths"])-1 ### the data contains 
        else:
            return len(entry["paths"])
    return 0

## get time
def getTime(entry, mode):
    time = 0
    if "paths" in entry:
        if mode == "total":
            time += entry["total_time"]
        else:
            for path in entry["paths"]:
                if path != 'length': ## needed because we have a length entry in the json
                    pathData = entry["paths"][path]
                    if mode == "symbExec":
                        time += pathData["time_trace"]
                    if mode == "sni":
                        time += pathData["time_solve"]
    return time


## group the functions 
def groupByIntervals(data, intervals, mode):
    data1 = {}
    for function in data:
        for min, max in intervals:
            if mode == "steps":
                val = getTotalSteps(data[function])
            elif mode == "instructions":
                val = getTotalPc(data[function])
            elif mode == "paths":
                val = getTotalPaths(data[function])
            elif mode == "totalTime":
                val = getTime(data[function],"total")
            elif mode == "symbExecTime":
                val = getTime(data[function],"symbExec")
            elif mode == "sniTime":
                val = getTime(data[function],"sni")
            elif mode == "LOC":
                val = data[function]["LOC"]
            elif mode == "trace":
                val = getTracesLength(data[function])
            else:
                print("Unsupported mode")
                assert False

            if val < max and val >= min:
                if (min,max) not in data1:
                    data1[(min,max)] = {}
                data1[(min,max)][function] = data[function]
    return data1


## group the functions 
def groupPathsByIntervals(data, intervals, mode):
    data1 = {}
    for path in data:
        for min, max in intervals:
            if mode == "SNI_time":
                val = path["time_solve"]
            elif mode == "trace_length":
                val = path["trace_length"]
            elif mode == "steps":
                val = path["steps"]
            elif mode == "symbolic_length":
                if "symbolic_length" not in path.keys():
                    continue
                val = path["symbolic_length"]
            else:
                print("Unsupported mode")
                assert False

            if val < max and val >= min:
                if (min,max) not in data1:
                    data1[(min,max)] = []
                data1[(min,max)].append(path)
    return data1


def getResult (entry, unknownInstrMode):
    status = entry["status"]
    
    if status == "timeout":
            return "timeout"
    elif status == "unknown_error":
            return "segfault" ## TODO FIX THIS!
    elif status == "segfault":
            return "segfault"
    elif status == "parsing":
            return "parsing"
    elif status == "safe":
        if not unknown_ins(entry):
            return "safe"
        else:
            # print(" UNK1: "+entry["file"])
            return "safeUnk"
    elif status == "safe_bound":
        # print(" UNK2: "+entry["file"])
        return "safeUnk"
    elif status == "data"  or status == "data_bound":
        if  unknownInstrMode == "stop":
            return "data"
        elif unknownInstrMode == "skip":
            if not unknown_ins_lastTrace(entry):
                return "data"
            else:
                return "dataUnk"
        elif unknownInstrMode == "merge":
            return getResult (entry, entry["mode"])
        else:
            assert False
    elif status == "control" or status == "control_bound":
        if  unknownInstrMode == "stop":
            return "control"
        elif unknownInstrMode == "skip":
            if not unknown_ins_lastTrace(entry):
                return "control"
            else:
                return "controlUnk"
        elif unknownInstrMode == "merge":
            return getResult (entry, entry["mode"])
        else:
            print("Unsupported mode "+unknownInstrMode)
            assert False
    elif status == "unknown_noninter":
            return "timeout_sni"
    else:
        print("Unsupported status "+status)
        assert False # unsupported value


def getTraceResult (entry, unknownInstrMode):
    status = entry["status"]
    
    if status == "timeout":
            return "timeout"
    elif status == "segfault":
            return "segfault"
    elif status == "parsing":
            return "parsing"
    elif status == "safe":
        if entry["unsupported_ins"] == 0 and len(entry["unknown_labels"]) == 0:
            return "safe"
        else:
            return "safeUnk"
    elif status == "safe_bound":
        return "safeUnk"
    elif status == "data":
        if  unknownInstrMode == "stop":
            return "data"
        elif unknownInstrMode in {"skip","merge"}:
            if entry["unsupported_ins"] == 0 and len(entry["unknown_labels"]) == 0:
                return "data"
            else:
                return "dataUnk"
        else:
            print ("Unsupported mode "+unknownInstrMode )
            assert False
    elif status == "control":
        if  unknownInstrMode == "stop":
            return "control"
        elif unknownInstrMode in {"skip","merge"}:
            if entry["unsupported_ins"] == 0 and len(entry["unknown_labels"]) == 0:
                return "control"
            else:
                return "controlUnk"
        else:
            print("Unsupported mode "+unknownInstrMode)
            assert False
    elif status == "unknown_noninter":
        return "timeout_sni"
    elif status == "global_timeout":
        return "global_timeout"
    else:
        print("Unsupported status "+status)
        assert False # unsupported value


## group the functions 
def groupByClass(data, mode, unknownInstrMode):
    data1 = {}
    for function in data:
        if mode == "result":
            value = getResult(data[function], unknownInstrMode)
        else:
            print("Unsupported mode "+mode)
            assert False
        if value not in data1:
            data1[value] = {}
        data1[value][function] = data[function]
    return data1

def unknown_ins(entry):
    if "paths" in entry:
        for path in entry["paths"]:
            if path != 'length': ## needed because we have a length entry in the json
                pathData = entry["paths"][path]
                if pathData["unsupported_ins"] > 0:
                    return True
                if len(pathData["unknown_labels"]):
                    return True
    return False

def unknown_ins_lastTrace(entry):
    if "paths" in entry:
        lastPath = entry["paths"]["length"]
        pathData = entry["paths"][str(int(lastPath) -1)]
        if pathData["unsupported_ins"] > 0:
            return True
        if len(pathData["unknown_labels"]):
            return True
    return False



def stackedBars(dataByLength,  intervals, unknownInstrMode, ignoreParsingErrors = True, percentage = True, log=False, title="", xLabel="", yLabel=""):
    # def autolabel(rects):
    #     # Attach some text labels.
    #     for rect in rects:
    #         plt.text(rect.get_x() + rect.get_width() / 2.,
    #                 rect.get_y() + rect.get_height() / 2.,
    #                 '%f'%rect.get_height(),
    #                 ha = 'center',
    #                 va = 'center')
    
    safeVals = []
    dataVals = []
    ctrlVals = []
    safeUnkVals = []
    dataUnkVals = []
    ctrlUnkVals = []
    segfaultVals = []
    timeoutVals = []
    for min,max in intervals:
        if (min,max) in dataByLength:
            values = dataByLength[(min,max)]

            if ignoreParsingErrors:
                total = float(len([key for key in values.keys() if getResult(values[key], unknownInstrMode) != "parsing"]))
            else:
                total = float(len(values.keys()))

            safe = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "safe" ])
            data = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "data" ])
            ctrl = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "control" ])
            safeUnk = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "safeUnk" ])
            dataUnk = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "dataUnk" ])
            ctrlUnk = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "controlUnk" ])
            segfault = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "segfault" ])
            timeout = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "timeout" ])

            if percentage:
                safeVals.append(100*safe/total)
                dataVals.append(100*data/total)
                ctrlVals.append(100*ctrl/total)
                safeUnkVals.append(100*safeUnk/total)
                dataUnkVals.append(100*dataUnk/total)
                ctrlUnkVals.append(100*ctrlUnk/total)
                segfaultVals.append(100*segfault/total)
                timeoutVals.append(100*timeout/total)
            else:
                safeVals.append(safe)
                dataVals.append(data)
                ctrlVals.append(ctrl)
                safeUnkVals.append(safeUnk)
                dataUnkVals.append(dataUnk)
                ctrlUnkVals.append(ctrlUnk)
                segfaultVals.append(segfault)
                timeoutVals.append(timeout)
        else:
            safeVals.append(0)
            dataVals.append(0)
            ctrlVals.append(0)
            safeUnkVals.append(0)
            dataUnkVals.append(0)
            ctrlUnkVals.append(0)
            segfaultVals.append(0)
            timeoutVals.append(0)

    #set up the plot
    N = len(intervals)    
    ind = np.arange(N)    # the x locations for the groups
    width = 0.35       # the width of the bars: can also be len(x) sequence

  

    # convert datasets to numpy

    safeVals = np.array(safeVals)
    dataVals = np.array(dataVals)
    ctrlVals = np.array(ctrlVals)
    safeUnkVals = np.array(safeUnkVals)
    dataUnkVals = np.array(dataUnkVals)
    ctrlUnkVals = np.array(ctrlUnkVals)
    timeoutVals = np.array(timeoutVals)
    segfaultVals = np.array(segfaultVals)


  
    fig = plt.figure()#(figsize=(50,10))

    p1 = plt.bar(ind, safeVals, width, color=green, edgecolor='black', log=log)
    p2 = plt.bar(ind, safeUnkVals, width, bottom=safeVals, color=green, edgecolor='black', hatch='//', log=log)
    p3 = plt.bar(ind, dataVals, width, bottom=safeVals+safeUnkVals, color=brightRed, edgecolor='black', log=log)
    p4 = plt.bar(ind, ctrlVals, width, bottom=safeVals+safeUnkVals+dataVals, color=darkRed, edgecolor='black', log=log)
    p5 = plt.bar(ind, dataUnkVals, width, bottom=safeVals+safeUnkVals+dataVals+ctrlVals, color=brightRed, edgecolor='black', hatch='//', log=log)
    p6 = plt.bar(ind, ctrlUnkVals, width, bottom=safeVals+safeUnkVals+dataVals+ctrlVals+dataUnkVals, color=darkRed, edgecolor='black', hatch='//', log=log)
    p7 = plt.bar(ind, segfaultVals, width, bottom=safeVals+dataVals+ctrlVals+safeUnkVals+dataUnkVals+ctrlUnkVals, color=yellow, edgecolor='black', log=log)
    p8 = plt.bar(ind, timeoutVals, width, bottom=safeVals+dataVals+ctrlVals+safeUnkVals+dataUnkVals+ctrlUnkVals+segfaultVals, color=blue, edgecolor='black', log=log)
    # autolabel(p1)
    plt.ylabel(yLabel)
    plt.xlabel(xLabel)

    plt.title(title)
    plt.xticks(ind, zip(*intervals)[1])
    # plt.yticks(np.arange(0, 101, 10))
    plt.legend((p1[0], p2[0], p3[0], p4[0], p5[0], p6[0], p7[0], p8[0],), ('safe', 'safeUnk', 'data', 'ctrl', 'dataUnk', 'ctrlUnk', 'segfault','timeout'))

    # plt.show()
    return fig

def compactStackedBars(dataByLength,  intervals, unknownInstrMode, ignoreParsingErrors = True, percentage = True, log=False, title="", xLabel="", yLabel="", onlyAnalyzed = False, onlySafe = False):
    # def autolabel(rects):
    #     # Attach some text labels.
    #     for rect in rects:
    #         plt.text(rect.get_x() + rect.get_width() / 2.,
    #                 rect.get_y() + rect.get_height() / 2.,
    #                 '%f'%rect.get_height(),
    #                 ha = 'center',
    #                 va = 'center')

    def autolabel(rects):
        for rect in rects:
            height = rect.get_height()
            plt.text(rect.get_x() + rect.get_width()/2., 1.05*height,
                    '%d' % int(height),
                    ha='center', va='bottom')
    
    analyzedVals = []
    timeoutVals = []
    for min,max in intervals:
        if (min,max) in dataByLength:
            values = dataByLength[(min,max)]

            if ignoreParsingErrors:
                total = float(len([key for key in values.keys() if getResult(values[key], unknownInstrMode) != "parsing"]))
            else:
                total = float(len(values.keys()))

            if onlySafe:
                analyzed = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) in {"safe",  "safeUnk"} ])
            else:
                analyzed = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) in {"safe", "data", "control",  "safeUnk", "dataUnk", "controlUnk"} ])
            timeout = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) in {"timeout","segfault"} ])

            if percentage:
                analyzedVals.append(100*analyzed/total)
                timeoutVals.append(100*timeout/total)
            else:
                analyzedVals.append(analyzed)
                timeoutVals.append(timeout)
        else:
            if log:
                analyzedVals.append(1)
                timeoutVals.append(1)
            else:
                analyzedVals.append(0)
                timeoutVals.append(0)

    #set up the plot
    N = len(intervals)    
    ind = np.arange(2*N, step = 2)    # the x locations for the groups
    width = 0.35       # the width of the bars: can also be len(x) sequence

  

    # convert datasets to numpy

    analyzedVals = np.array(analyzedVals)
    timeoutVals = np.array(timeoutVals)

    fig = plt.figure()#(figsize=(50,10))

    if percentage:
        p1 = plt.bar(ind, analyzedVals, width, color=blue, edgecolor='black', log=log)
        if not onlyAnalyzed:
            p2 = plt.bar(ind, timeoutVals, width, bottom=analyzedVals, color=yellow, edgecolor='black', log=log)
    else:
        p1 = plt.bar(ind, analyzedVals, width, color=blue, edgecolor='black', log=log)
        if not onlyAnalyzed:
            p2 = plt.bar(ind+width, timeoutVals, width, color=yellow, edgecolor='black', log=log)

    plt.ylabel(yLabel)
    plt.xlabel(xLabel)

    plt.title(title)
    plt.xticks(ind+width, zip(*intervals)[1], fontsize=14, rotation=90)
    if not onlyAnalyzed:
        plt.legend((p1[0], p2[0]), ('Analyzed', 'Timeout'))

    return fig


## visualize lengths
def plotValue(data, mode, unknownInstrMode, title="", xLabel="", yLabel="", log=False):
    y = []
    x = []
    colors=[]
    for function in data:
        if mode == "steps":
            val = getTotalSteps(data[function])
        elif mode == "instructions":
            val = getTotalPc(data[function])
        elif mode == "paths":
            val = getTotalPaths(data[function])
        elif mode == "totalTime":
            val = getTime(data[function],"total")
        elif mode == "symbExecTime":
            val = getTime(data[function],"symbExec")
        elif mode == "sniTime":
            val = getTime(data[function],"sni")
        elif mode == "trace":
            val = getTracesLength(data[function])
        else:
            print ("Unsupported mode "+mode)
            assert False

        status = getResult(data[function],unknownInstrMode)
        if  status == "safe" or  status ==  "safeUnk":
            colors.append(green)
        elif status == "data" or  status==  "dataUnk":
            colors.append(brightRed)
        elif status == "control" or  status ==  "controlUnk":
            colors.append(darkRed)
        elif status in {"segfault", "unknown_error"}:
            colors.append(blue)
        elif status == "timeout":
            colors.append(yellow)
        elif status == "parsing":
            colors.append(purple)
        else:
            print("Unsupported status "+status)
            assert False

        x.append(len(x))
        y.append(val+1 if log else val)   

    fig = plt.figure()
    ax = plt.gca()
    ax.scatter(x ,y , c=colors, alpha=1, edgecolors='none')
    if log:
        ax.set_yscale('log')
    plt.title(title)    
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)
    return fig

def any_number_range(a,b,s=1):
    if (a == b):
        return a
    else:
        mx = max(a,b)
        mn = min(a,b)
        result = []
        # inclusive upper limit. If not needed, delete '+1' in the line below
        while(mn < mx + 1):
            # if step is positive we go from min to max
            if s > 0:
                result.append(mn)
                mn += s
            # if step is negative we go from max to min
            if s < 0:
                result.append(mx)
                mx += s
        return result

def generateIntervals(min,max, step):
    initValues = any_number_range(min,max,step)
    intervals = []
    for val in initValues:
        intervals.append((val,val+step))
    return intervals

def plotPie(data,filename="tmp.pdf"):
    labels = ['safe', 'safeUnk', 'data', 'ctrl', 'dataUnk', 'ctrlUnk', 'segfault', 'timeout']
    safe = len(data["safe"].keys()) if "safe" in data.keys() else 0
    dataV = len(data["data"].keys())  if "data" in data.keys() else 0
    ctrl = len(data["control"].keys())  if "control" in data.keys() else 0
    safeUnk = len(data["safeUnk"].keys())  if "safeUnk" in data.keys() else 0
    dataUnk = len(data["dataUnk"].keys()) if "dataUnk" in data.keys() else 0
    ctrlUnk = len(data["controlUnk"].keys()) if "controlUnk" in data.keys() else 0
    segfault = len(data["segfault"].keys()) if "segfault" in data.keys() else 0
    timeout = len(data["timeout"].keys()) if "timeout" in data.keys() else 0
    sizes = [safe, safeUnk, dataV, ctrl, dataUnk, ctrlUnk, segfault, timeout]
    explode = (0, 0, 0, 0, 0, 0, 0, 0) 
    colors = [green,green,brightRed, darkRed, brightRed, darkRed, blue, yellow]


    fig1, ax1 = plt.subplots()
    patches = ax1.pie(sizes, explode=explode, colors=colors, labels=labels, autopct='%1.1f%%',
             startangle=90)[0]

    patches[1].set_hatch('///') 
    patches[4].set_hatch('///')
    patches[5].set_hatch('///') 

    #draw circle
    centre_circle = plt.Circle((0,0),0.70,fc='white')
    fig = plt.gcf()
    fig.gca().add_artist(centre_circle)

    
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

    return fig1

def plotDoublePie(data, plotParsing=False):
    labelsOut = ['safe', 'data', 'ctrl', 'segfault', 'timeout']
    safeAll = ( len(data["safe"].keys())  if "safe" in data.keys() else 0 )+ ( len(data["safeUnk"].keys())  if "safeUnk" in data.keys() else 0)
    dataAll = ( len(data["data"].keys())  if "data" in data.keys() else 0 ) + ( len(data["dataUnk"].keys())  if "dataUnk" in data.keys() else 0)
    ctrlAll = ( len(data["control"].keys())  if "control" in data.keys() else 0) +( len(data["controlUnk"].keys())  if "controlUnk" in data.keys() else 0)
    segfault = len(data["segfault"].keys())  if "segfault" in data.keys() else 0
    timeout = len(data["timeout"].keys())  if "timeout" in data.keys() else 0
    safe = len(data["safe"].keys())  if "safe" in data.keys() else 0
    dataV = len(data["data"].keys())  if "data" in data.keys() else 0
    ctrl = len(data["control"].keys())  if "control" in data.keys() else 0
    safeUnk = len(data["safeUnk"].keys())  if "safeUnk" in data.keys() else 0
    dataUnk = len(data["dataUnk"].keys())  if "dataUnk" in data.keys() else 0
    ctrlUnk = len(data["controlUnk"].keys())  if "controlUnk" in data.keys() else 0

    sizesOut = [safeAll, dataAll, ctrlAll, segfault, timeout]
    # explodeOut = (0, 0, 0, 0, 0) 
    colorsOut = [green,brightRed, darkRed, blue, yellow]

    sizesIn = [safe, safeUnk, dataV, dataUnk, ctrl, ctrlUnk, segfault, timeout]
    # explodeIn = (0, 0, 0, 0, 0, 0, 0, 0) 
    colorsIn = [green,green,brightRed,  brightRed, darkRed, darkRed, blue, yellow]

    if plotParsing:
        labelsOut.append('parsing')
        parsing = len(data["parsing"].keys())  if "parsing" in data.keys() else 0
        sizesOut.append(parsing)
        colorsOut.append(purple)
        sizesIn.append(parsing)
        colorsIn.append(purple)

    fig = plt.figure()
    plt.pie(sizesOut, labels=labelsOut, colors=colorsOut, startangle=90, pctdistance=0.85, autopct='%1.1f%%')
    patches = plt.pie(sizesIn,colors=colorsIn,radius=0.75,startangle=90)[0]
    patches[1].set_hatch('///') 
    patches[3].set_hatch('///')
    patches[5].set_hatch('///') 

    #draw circle
    centre_circle = plt.Circle((0,0),0.5,fc='white')
    fig = plt.gcf()
    fig.gca().add_artist(centre_circle)

    plt.axis('equal')
    return fig
    # plt.show()

    # plt.show()



def plotCompactDoublePie(data, plotParsing=False):
    
    safeAll = ( len(data["safe"].keys())  if "safe" in data.keys() else 0 )+ ( len(data["safeUnk"].keys())  if "safeUnk" in data.keys() else 0)
    leakAll = ( len(data["data"].keys())  if "data" in data.keys() else 0 ) + ( len(data["dataUnk"].keys())  if "dataUnk" in data.keys() else 0) + ( len(data["control"].keys())  if "control" in data.keys() else 0) +( len(data["controlUnk"].keys())  if "controlUnk" in data.keys() else 0)
    timeoutAll = (len(data["segfault"].keys())  if "segfault" in data.keys() else 0) + (len(data["timeout"].keys())  if "timeout" in data.keys() else 0)
    safe = len(data["safe"].keys())  if "safe" in data.keys() else 0
    leak = (len(data["data"].keys())  if "data" in data.keys() else 0) +(len(data["control"].keys())  if "control" in data.keys() else 0)
    safeUnk = len(data["safeUnk"].keys())  if "safeUnk" in data.keys() else 0
    leakUnk = (len(data["dataUnk"].keys())  if "dataUnk" in data.keys() else 0) + ( len(data["controlUnk"].keys())  if "controlUnk" in data.keys() else 0)
    labelsOut = ["Secure", "Leak", "Timeout"]
    sizesOut = [safeAll, leakAll,  timeoutAll]
    # explodeOut = (0, 0, 0, 0, 0) 
    colorsOut = [green,brightRed, yellow]

    sizesIn = [safe, safeUnk, leak, leakUnk,  timeoutAll]
    # explodeIn = (0, 0, 0, 0, 0, 0, 0, 0) 
    colorsIn = [green,green,brightRed,  brightRed, yellow]

    print ("COMPACT RESULTS: [SAFE, SAFEUNK, LEAK, LEAKUNK, TIMEOUT] = "+str(sizesIn))

    def labels(pct, values):
        absolute = int(pct/100.*np.sum(values))
        return "{:.1f}%\n({:d})".format(pct, absolute)

    if plotParsing:
        labelsOut.append('parsing')
        parsing = len(data["parsing"].keys())  if "parsing" in data.keys() else 0
        sizesOut.append(parsing)
        colorsOut.append(purple)
        sizesIn.append(parsing)
        colorsIn.append(purple)

    plt.rcParams['patch.linewidth'] = 0  
    fig = plt.figure()
    # labelsOut = ["Secure %.2f%% (%d)"% ( (float(safeAll)*100/(safeAll+leakAll+timeoutAll)) , safeAll ), 
    #     "Leak %.2f%% (%d)"% ( (float(leakAll)*100/(safeAll+leakAll+timeoutAll)) , leakAll ), 
    #     "Timeout %.2f%% (%d)"% ( (float(timeoutAll)*100/(safeAll+leakAll+timeoutAll)) , timeoutAll )]
    
    plt.pie(sizesOut, labels=labelsOut, colors=colorsOut, startangle=90,  pctdistance=0.8, labeldistance=1.1, autopct=lambda pct: labels(pct, sizesOut))
    patches = plt.pie(sizesIn,colors=colorsIn,radius=1,startangle=90)[0] 
    patches[1].set_hatch('///') 
    patches[3].set_hatch('///')

    #draw circle
    centre_circle = plt.Circle((0,0),0.5,fc='white')
    fig = plt.gcf()
    fig.gca().add_artist(centre_circle)

    plt.axis('equal')
    return fig


def toPDF(filename, figs):
    pp = PdfPages(filename)
    for fig in figs:
        pp.savefig(fig)
        plt.close(fig)
    pp.close()


def merge(dataSkip, dataStop):
    functions = set(dataSkip.keys()).union(set(dataStop.keys()))
    data1 ={}
    for function in functions:
        valueSkip = ""
        if function in dataSkip.keys():
            valueSkip = getResult(dataSkip[function], "skip")
        valueStop = ""
        if function in dataStop.keys():
            valueStop = getResult(dataStop[function], "stop")
    
        if valueStop == "control":
            if valueStop not in data1:
                data1[valueStop] = {}
            data1[valueStop][function] = dataStop[function]
        elif valueStop == "data":
            if valueStop not in data1:
                data1[valueStop] = {}
            data1[valueStop][function] = dataStop[function]
        else:
            if function in dataSkip.keys():
                if valueSkip not in data1:
                    data1[valueSkip] = {}
                data1[valueSkip][function] = dataSkip[function]
    return data1

def merge1(dataSkip, dataStop):
    functions = set(dataSkip.keys()).union(set(dataStop.keys()))
    data1 ={}
    for function in functions:
        valueSkip = ""
        if function in dataSkip.keys():
            valueSkip = getResult(dataSkip[function], "skip")
        valueStop = ""
        if function in dataStop.keys():
            valueStop = getResult(dataStop[function], "stop")
    
        if valueStop == "control":
            data1[function] = dataStop[function]
            data1[function]["mode"] = "stop"
        elif valueStop == "data":
            data1[function] = dataStop[function]
            data1[function]["mode"] = "stop"
        else:
            if function in dataSkip.keys():
                data1[function] = dataSkip[function]
                data1[function]["mode"] = "skip"
        
    return data1

def mergeSizes(data, sizes):
    for fnct in data.keys():
        fnctName = fnct.split(".")[-1]
        
        if fnctName in sizes.keys():
            data[fnct]["LOC"] = sizes[fnctName]
        else:
            assert False
    return data

def compactData(data,unknownInstrMode,compactTimeout, compactLeak):
    for fnct in data.keys():
        entry = data[fnct]
        if getResult(entry, unknownInstrMode) == "segfault" and compactTimeout:
            entry["status"] = "timeout"
        if getResult(entry, unknownInstrMode) == "control" and compactLeak:
            entry["status"] = "data"
    return data


def pathLengthTimes(dataByLength, intervals, unknownInstrMode, filterStatus, title, yLabel, xLabel, ignoreParsingErrors=True):
     # def autolabel(rects):
    #     # Attach some text labels.
    #     for rect in rects:
    #         plt.text(rect.get_x() + rect.get_width() / 2.,
    #                 rect.get_y() + rect.get_height() / 2.,
    #                 '%f'%rect.get_height(),
    #                 ha = 'center',
    #                 va = 'center')
    
    vals = []
    for min,max in intervals:
        if (min,max) in dataByLength:
            values = dataByLength[(min,max)]

            if ignoreParsingErrors:
                total = float(len([key for key in values.keys() if getResult(values[key], unknownInstrMode) != "parsing"]))
            else:
                total = float(len(values.keys()))

            val = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) in filterStatus ])

        
            vals.append(vals)
        else:
            vals.append(0)

    #set up the plot
    N = len(intervals)    
    ind = np.arange(N)    # the x locations for the groups
    width = 0.35       # the width of the bars: can also be len(x) sequence

    # convert datasets to numpy
    vals = np.array(vals)

    fig = plt.figure()#(figsize=(50,10))

    p1 = plt.bar(ind, filterStatus, width, color=blue, edgecolor='black') # autolabel(p1)
    plt.ylabel(yLabel)
    plt.xlabel(xLabel)

    plt.title(title)
    plt.xticks(ind, intervals)
    plt.show()
    # return fig


def scatterPlotPathsValue(data, mode, unknownInstrMode, title="", xLabel="", yLabel="", xValues = "incremental", threshold=10000, colorsMode= "status", markersize=None, log=False, avoidReps = False, rasterized=True, plotRegression = False, splitSymExAndNonSymExData = True):
    y = []
    x = []
    colors=[]
    skip = 0
    plotted = set({})
    globalTimeouts = 0
    i = 0
    xSymb = []
    ySymb = []
    xNoSymb = []
    yNoSymb = []
    for path in data:

        result = getTraceResult(path,unknownInstrMode)
        if result == "global_timeout":
            globalTimeouts += 1
            continue

        if mode == "sni_time":
            if "time_solve" not in path.keys() and not ("time_data"  in path.keys() and "time_control" in path.keys() ):
                print("Ignore data point (no sni_time)")
                continue
        if mode == "symbolic_time":
            if "symbolic_time" not in path.keys():
                # print("Ignore data point (no symbolic_time)")
                continue
        if mode == "time_trace":
            if "time_trace" not in path.keys():
                # print("Ignore data point (no time_trace)")
                continue
        if mode == "trace_length":
            if "trace_length" not in path.keys():
                # print("Ignore data point (no trace_length)")
                continue
        if mode == "steps":
            if "steps" not in path.keys():
                print("Ignore data point (no steps)")
                continue
        if mode == "symbolic_length":
            if "symbolic_length" not in path.keys():
                # print("Ignore data point (no symbolic_length)")
                continue
        
        if xValues != "incremental":
            if xValues not in path.keys():
                # print("Ignore data point (no xValue "+xValues+")")
                continue
        if (colorsMode != "noColor" and colorsMode != "symbConcise") and colorsMode not in path.keys():
            # print("Ignore data point (no colorsMode "+colorsMode+")")
            continue


        if mode == "sni_time":
            if "time_solve" in path.keys():
                val = path["time_solve"]
            else:
                val = path["time_data"] + path["time_control"]
        elif mode == "symbolic_time":
            val = path["symbolic_time"]
        elif mode == "symbolic_length":
            val = path["symbolic_length"]
        elif mode == "trace_length":
            val = path["trace_length"]
        elif mode == "time_trace":
            val = path["time_trace"]
        elif mode == "steps":
            val = path["steps"]
        elif mode == "time_data":
            val = path["time_data"]
        elif mode == "time_control":
            val = path["time_control"]
        else:
            print ("Unsupported mode "+mode)
            assert False

        if xValues != "incremental" and path[xValues] > threshold:
            skip += 1
            continue


        xVal = len(x) if xValues == "incremental" else path[xValues]
        # yVal = val+1 if log else val
        yVal = val

        if avoidReps:
            if (xVal,yVal) in plotted:
                continue
            else:
                x.append(xVal)
                y.append(yVal)  
        else:        
            x.append(xVal)
            y.append(yVal)   

        if splitSymExAndNonSymExData:
            if result != "timeout_sni":
                # if xVal > 1 and yVal > 1:
                    if len(path["concolic_stats"]) > 0:
                        xSymb.append(xVal)
                        ySymb.append(yVal)
                    else:
                        xNoSymb.append(xVal)
                        yNoSymb.append(yVal)
        
        plotted.add((xVal,yVal))

        if colorsMode == "status":
            if result in {"safe", "safeUnk"}:
                colors.append(green)
            elif result in {"data","dataUnk"}: 
                colors.append(darkRed) #%(brightRed)
            elif result in {"control", "controlUnk"}:
                colors.append(darkRed)
            elif result == "timeout_sni":
                i+=1
                colors.append(blue)
            else:
                print("Unsupported status "+result)
                assert False
        elif colorsMode == "symbolic_status":
            symbResult = path[colorsMode]
            if symbResult == "sat":
                colors.append(green)
            elif symbResult == "unsat":
                colors.append(darkRed) #(brightRed)
            elif symbResult == "unknown":
                colors.append(blue)
                i+=1
            else:
                print("Unsupported status "+symbResult)
                assert False
        elif colorsMode == "noColor":
            colors.append(blue)
        elif colorsMode == "symbConcise":
            if len(path["concolic_stats"]) == 0:
                colors.append(yellow)
            else:
                colors.append(blue)
        else:
            print("Unsupported color mode")
            assert False


    
    print("Plotted %d data"%len(plotted))
    print("Plotted timeouts %d"%i)
    print("Ignored %d paths due to global timeouts"%globalTimeouts)
    fig = plt.figure()
    ax = plt.gca()

    x = np.array(x)
    y = np.array(y)

    if markersize is not None:
        ax.scatter(x ,y , c=colors, alpha=0.3, edgecolors='none', s = markersize, rasterized=rasterized)
    else:
        ax.scatter(x ,y , c=colors, alpha=0.3, edgecolors='none', rasterized=rasterized)
    if log:
        ax.set_yscale('log')
    plt.title(title)    
    plt.ylim([0, y.max()])
    plt.xlim([0, threshold * 1.1]) #x.max()])
    print("X : min %.4f max %.4f"%(x.min(), x.max()))
    print("Y : min %.4f max %.4f"%(y.min(), y.max()))
    # plt.grid()
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)

    
    print("Ignored %d paths over the threshold %d"%(skip,threshold))

    if plotRegression:
        print("=== Adding regression ===")
        print("Data with symbolic information: %d"%len(xSymb))
        print("Data without symbolic information: %d"%len(xNoSymb))

        xSymb = np.array(xSymb,  np.float)
        xNoSymb = np.array(xNoSymb,  np.float)
        ySymb = np.array(ySymb,  np.float)
        yNoSymb = np.array(yNoSymb,  np.float)

        #### Plot linear regression for data with symbExec

        ## Let's fit an exponential function.  
        ## This looks like a line on a log-log plot.
        # def myFunc(x, a,b, c):
        #     return a * np.power(x,1)  
        # def myFunc( x, a, b):
        #     return a * np.log10(x) + b
        if mode == "time_trace":
            def myFunc(x, a, b, c, d):
                return a*x**3 + b*x**2 +c*x + d
                # return a*x**2 + b*x +c
            popt, pcov = curve_fit(myFunc, xSymb, ySymb)
            # newX = np.logspace(-2, 100,  base=10)
            newX = np.linspace(1,5000)
            ax.plot(newX, myFunc(newX, *popt), color="blue")
            print("[Only SymbExec data] Fitting the curve y = %.4f * x^3 + %.4f * x ^2 + %.4f * x  + %.4f "%(popt[0], popt[1], popt[2], popt[3]) )
            # print("[Only SymbExec data] Fitting the curve y = %.4f * x^2 + %.4f * x  + %.4f  "%(popt[0], popt[1], popt[2]) )

            popt, pcov = curve_fit(myFunc, xNoSymb, yNoSymb)
            # newX = np.logspace(-2, 6,  base=10)
            ax.plot(newX, myFunc(newX, *popt), color="magenta")
            print("[Only NoSymbExec data] Fitting the curve y = %.4f * x^3 + %.4f * x ^2 + %.4f * x  + %.4f "%(popt[0], popt[1], popt[2], popt[3]) )
            # print("[Only NoSymbExec data] Fitting the curve y = %.4f * x^2 + %.4f * x +  %.4f "%(popt[0], popt[1], popt[2]) )
        else:
            def myFunc(x, a, b, c, d):
                return a*x**3 + b*x**2 +c*x + d
            popt, pcov = curve_fit(myFunc, x, y)
            # newX = np.logspace(-2, 6,  base=10)
            newX = np.linspace(1,5000)
            ax.plot(newX, myFunc(newX, *popt), color="blue")
            print("Fitting the curve y = %.4f * x^3 + %.4f * x ^2 + %.4f * x  + %.4f "%(popt[0], popt[1], popt[2], popt[3]) )

    return fig




def doubleScatterPlotPathsValue(data, unknownInstrMode, title="", xLabel="", yLabel="", xValues = "incremental", yValues= "incremental", xThreshold=10000, yThreshold=10000, colorsMode= "status" , markersize=None, xLog=False, yLog=False, avoidReps = False, rasterized=True, plotRegression = False, splitSymExAndNonSymExData = True, plotGrid = True, countGridDistribution = True):
    
    def powerLawFnct(x,a,b):
        return a *x**b
    
    y = []
    x = []
    colors=[]
    skip = 0
    plotted = set({})
    gridDistr = {}
    xSymb = []
    ySymb = []
    xNoSymb = []
    yNoSymb = []
    globalTimeouts = 0
    i = 0
    for path in data:


        result = getTraceResult(path,unknownInstrMode)
        if result == "global_timeout":
            globalTimeouts += 1
            continue

        
        if xValues != "incremental":
            if xValues == "sni_time":
                if "time_solve" not in path.keys() and not ("time_data"  in path.keys() and "time_control" in path.keys() ):
                    continue    
        elif xValues not in path.keys():
                # print("Ignore data point (no xValue "+xValues+")")
                continue
        if yValues != "incremental":
            if xValues == "sni_time":
                 if "time_solve" not in path.keys() and not ("time_data"  in path.keys() and "time_control" in path.keys() ):
                    continue
            elif yValues not in path.keys():
                # print("Ignore data point (no xValue "+xValues+")")
                continue
        if colorsMode not in { "noColor","symbConcise" } and colorsMode not in path.keys():
            # print("Ignore data point (no colorsMode "+colorsMode+")")
            continue



        if xValues == "sni_time":
            if "time_solve" in path.keys():
                xVal = path["time_solve"]
            else:
                xVal = path["time_data"] + path["time_control"]
        elif xValues == "symbolic_time":
            xVal = path["symbolic_time"]
        elif xValues == "symbolic_length":
            xVal = path["symbolic_length"]
        elif xValues == "trace_length":
            xVal = path["trace_length"]
        elif xValues == "time_trace":
            xVal = path["time_trace"]
        elif xValues == "time_data":
            xVal = path["time_data"]
        elif xValues == "time_control":
            xVal = path["time_control"]
        else:
            print ("Unsupported xValue "+xValues)
            assert False

        if yValues == "sni_time":
            if "time_solve" in path.keys():
                yVal = path["time_solve"]
            else:
                yVal = path["time_data"] + path["time_control"]
        elif yValues == "symbolic_time":
            yVal = path["symbolic_time"]
        elif yValues == "symbolic_length":
            yVal = path["symbolic_length"]
        elif yValues == "trace_length":
            yVal = path["trace_length"]
        elif yValues == "time_trace":
            yVal = path["time_trace"]
        elif yValues == "time_data":
            yVal = path["time_data"]
        elif yValues == "time_control":
            yVal = path["time_control"]
        else:
            print ("Unsupported yValue "+yValues)
            assert False

        # print ("(%d,%d)"%(xVal,yVal))

        if xValues != "incremental" and xVal > xThreshold:
            skip += 1
            continue
        
        if yValues != "incremental" and yVal > yThreshold:
            skip += 1
            continue


        # if result == "timeout_sni": 
        #     if xVal >= 120000:
        #         print("High")
        #         print("Time data: %d"%path["time_data"])
        #         print("Time control: %d"%path["time_control"])
        #     elif xVal >= 60000 and xVal <= 90000:
        #         print("Low")
        #         print("Time data: %d"%path["time_data"])
        #         print("Time control: %d"%path["time_control"])


        xVal = len(x) if xValues == "incremental" else xVal
        yVal = len(y) if yValues == "incremental" else yVal


        if avoidReps:
            if (xVal,yVal) in plotted:
                continue
            else:
                x.append(xVal)
                y.append(yVal)  
        else:        
            x.append(xVal)
            y.append(yVal)   
        
        if splitSymExAndNonSymExData:
            if result != "timeout_sni":
                # if xVal > 1 and yVal > 1:
                    if len(path["concolic_stats"]) > 0:
                        xSymb.append(xVal)
                        ySymb.append(yVal)
                    else:
                        xNoSymb.append(xVal)
                        yNoSymb.append(yVal)


        if countGridDistribution:
            if result != "timeout_sni":
                for i in range(1,10):
                    if powerLawFnct(xVal, 10**(i-1), 1) <= yVal and  powerLawFnct(xVal, 10**(i), 1) > yVal:              
                        if i not in gridDistr.keys():
                            gridDistr[i]=0
                        gridDistr[i] += 1
                        break
                    if powerLawFnct(xVal, 10**-(i), 1) <= yVal and powerLawFnct(xVal, 10**-(i-1), 1) > yVal:
                        if -i not in gridDistr.keys():
                            gridDistr[-i]=0
                        gridDistr[-i] += 1
                        break
                


        plotted.add((xVal,yVal))

        if colorsMode == "status":
            if result in {"safe", "safeUnk"}:
                colors.append(green)
            elif result in {"data","dataUnk"}: 
                colors.append(brightRed)
            elif result in {"control", "controlUnk"}:
                colors.append(darkRed)
            elif result == "timeout_sni":
                i+=1
                colors.append(blue)
            else:
                print("Unsupported status "+result)
                assert False
        elif colorsMode == "symbolic_status":
            symbResult = path[colorsMode]
            if symbResult == "sat":
                colors.append(green)
            elif symbResult == "unsat":
                colors.append(brightRed)
            elif symbResult == "unknown":
                colors.append(blue)
                i+=1
            else:
                print("Unsupported status "+symbResult)
                assert False
        elif colorsMode == "noColor":
                colors.append(blue)
        elif colorsMode == "symbConcise":
            if len(path["concolic_stats"]) == 0:
                colors.append(yellow)
            else:
                colors.append(blue)
        else:
            print("Unsupported color mode")
            assert False


    
    print("Plotted %d data"%len(plotted))
    print("Plotted timeouts %d"%i)
    print("Ignored %d paths over the threshold (%d,%d)"%(skip,xThreshold, yThreshold))
    print("Ignored %d paths due to global timeouts"%globalTimeouts)
    fig = plt.figure()
    ax = plt.gca()

    x = np.array(x, np.float)
    y = np.array(y, np.float)

    if plotGrid:

        newX = np.logspace(-2, 6, num=9, base=10)
        for i in range(10):
            plt.plot(newX, powerLawFnct(newX, 10**i, 1), color="lightgrey", alpha=0.7,zorder=1)
            plt.plot(newX, powerLawFnct(newX, 10**(-i), 1), color="lightgrey", alpha=0.7,zorder=1)



    if markersize is not None:
        ax.scatter(x ,y , c=colors, alpha=0.3, edgecolors='none', s = markersize, rasterized=rasterized,zorder=2)
    else:
        ax.scatter(x ,y , c=colors, alpha=0.3, edgecolors='none', rasterized=rasterized,zorder=2)



    if xLog:
        ax.set_xscale('log')
    if yLog:
        ax.set_yscale('log')
    plt.title(title)    
    plt.ylim([min(x.min(),y.min()), max(x.max(),y.max())])
    plt.xlim([min(x.min(),y.min()), max(x.max(),y.max())])
    print("X : min %.4f max %.4f"%(x.min(), x.max()))
    print("Y : min %.4f max %.4f"%(y.min(), y.max()))


    # plt.grid()
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)

    total = 0
    for i in range(-10,10):
        if i in gridDistr.keys():
            total += gridDistr[i]
    print("=== PARTITION IN SLICES ===")
    print("TOTAL : %d"%total)
    for i in range(-10,10):
        if i in gridDistr.keys():
            perc = 100*(gridDistr[i]/float(total))
            print("%d slice: %d paths (%.4f )"%(i, gridDistr[i], perc ))

    if plotRegression:
        print("=== Adding linear regression ===")
        print("Data with symbolic information: %d"%len(xSymb))
        print("Data without symbolic information: %d"%len(xNoSymb))

        xSymb = np.array(xSymb,  np.float)
        xNoSymb = np.array(xNoSymb,  np.float)
        ySymb = np.array(ySymb,  np.float)
        yNoSymb = np.array(yNoSymb,  np.float)

        #### Plot linear regression for data with symbExec

        ## Let's fit an exponential function.  
        ## This looks like a line on a log-log plot.
        # def myFunc(x, a,b, c):
        #     return a * np.power(x,1)  
        def myFunc( x, a):
            return a * x 
        popt, pcov = curve_fit(myFunc, np.log10(xSymb), np.log10(ySymb))
        newX = np.logspace(-2, 6, num=9, base=10)
        plt.plot(newX, myFunc(newX, *popt), color="blue")
        print("[Only SymbExec data] Fitting the curve y = %.4f * x"%(popt[0]) )

        # def myFunc1(x, a,b):
        #     return a * np.power(x,b)   
        # popt, pcov = curve_fit(myFunc1, xSymb, ySymb)
        # newX = np.logspace(-2, 6, num=9, base=10)
        # plt.plot(newX, myFunc1(newX, *popt),marker='o', color="magenta")
        # print("[Only SymbExec data] Fitting the curve y = %.4f * x^%4f"%(popt[0],popt[1]) )


        

        # popt, pcov = curve_fit(myFunc, xNoSymb, yNoSymb)
        # plt.plot(newX, myFunc(newX, *popt), color="magenta")
        # print("[Only NoSymbExec data] Fitting the curve y = %.4f * x^%.4f"%(popt[0],popt[1]) )

        # newX =  np.logspace(-2, 6, num=9, base=10)
        # slope, intercept, r_value, p_value, std_err = linregress(np.log10(xSymb), np.log10(ySymb))
        # print("[Only SymbExec data] Fitting the curve y = %.6f * x+%.6f"%(slope,intercept) )
        # print("[Only symbExec data] r^2_value: %f p_value: %f std_err: %.4f "%( r_value**2, p_value, std_err))
        # ax.plot(newX, newX*slope+intercept,  marker='o', color="blue")
        # slope, intercept, r2_value, p_value, std_err = linregress(np.log10(xNoSymb), np.log10(yNoSymb))
        # print("[Only NoSymbExec data] slope: %.4f intercept: %.4f r_value: %f p_value: %f std_err: %.4f "%(slope, intercept, r_value, p_value, std_err))
        # ax.plot(newX, newX*slope+intercept, color="yellow")

        # newX = np.logspace(-2, 6, base=10)
        # a, b = np.polyfit(np.log10(xSymb), np.log10(ySymb), deg=1)
        # # fitting line
        # newY = a * newX + b
        # print("[Only SymbExec data] Fitting the curve y = %.4f * x+%.4f"%(a,b) )
        # ax.plot(newX, newY, color="red")

    return fig


def scatterClusteredCategorical(data, intervals, mode, unknownInstrMode, title = "", xLabel = "", yLabel = "", colorsMode = "status", log = False, rasterized=True):
    y = []
    x = []
    colors=[]

    N = len(intervals)    
    ind = np.arange(N)

    n = 0 

    for min, max in intervals:
        if (min,max) in data.keys():
            for path in data[(min,max)]:
                if mode == "sni_time":
                    val = path["time_solve"]
                else:
                    print("Unsupported mode")
                    assert False
                x.append(n)
                y.append(val+1 if log else val)   
                
                if colorsMode == "status":
                    if getTraceResult(path,unknownInstrMode) in {"safe", "safeUnk"}:
                        colors.append(green)
                    elif getTraceResult(path,unknownInstrMode) in {"data", "control", "dataUnk", "controlUnk"}:
                        colors.append(brightRed)
                    elif getTraceResult(path,unknownInstrMode) == "timeout_sni":
                        colors.append(yellow)
                    else:
                        print("Unsupported status "+getTraceResult(path,unknownInstrMode))
                        assert False
                else:
                    print("Unsupported colors mode")
                    assert False
        n+=1

    fig = plt.figure()
    ax = plt.gca()
    x = np.array(x)
    y = np.array(y)
    ax.scatter(x ,y , c=colors, alpha=.5, edgecolors='none', rasterized = rasterized)
    if log:
        ax.set_yscale('log')
    
    plt.ylim([0, y.max()])
    plt.xlim([0, x.max()])
    plt.title(title)    
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)
    
    return fig

def pathStackedBars(pathsByIntervals,  intervals, unknownInstrMode, ignoreParsingErrors = True, percentage = True, log=False, title="", xLabel="", yLabel="", onlyAnalyzed = False, onlyTimeout = False, onlySafe = False, onlyConcError = False, colorsMode = "status"):
    # def autolabel(rects):
    #     # Attach some text labels.
    #     for rect in rects:
    #         plt.text(rect.get_x() + rect.get_width() / 2.,
    #                 rect.get_y() + rect.get_height() / 2.,
    #                 '%f'%rect.get_height(),
    #                 ha = 'center',
    #                 va = 'center')

    def autolabel(rects):
        for rect in rects:
            height = rect.get_height()
            plt.text(rect.get_x() + rect.get_width()/2., 1.05*height,
                    '%d' % int(height),
                    ha='center', va='bottom')
    
    greenVals = []
    redVals = []
    blueVals = []
    for min,max in intervals:
        if (min,max) in pathsByIntervals:
            paths = pathsByIntervals[(min,max)]

            greenVal = 0
            redVal = 0
            blueVal = 0

            if colorsMode == "status":
                greenVal = len([path for path in paths if getTraceResult(path,unknownInstrMode) in {"safe", "safeUnk"}])
                redVal = len([path for path in  paths if getTraceResult(path,unknownInstrMode) in {"data", "control", "dataUnk", "controlUnk"}])
                blueVal = len([path for path in  paths if getTraceResult(path,unknownInstrMode) in {"timeout", "segfault", "timeout_sni"}])
            elif colorsMode == "symbolic_status":
                greenVal = len([path for path in  paths if path[colorsMode] == "sat"])
                redVal = len([path for path in  paths if path[colorsMode] == "unsat"])
                blueVal = len([path for path in  paths if path[colorsMode] == "unknown"])
            else:
                print("Unsupported color mode "+colorsMode)
                assert False

            total = float(greenVal + redVal + blueVal)


            if percentage:
                if total != 0:
                    greenVals.append(100*greenVal/total)
                    redVals.append(100*redVal/total)
                    blueVals.append(100*blueVal/total)
                else:
                    greenVals.append(0)
                    redVals.append(0)
                    blueVals.append(0)
            else:
                greenVals.append(greenVal)
                redVals.append(redVal)
                blueVals.append(blueVal)
        else:
            if log:
                greenVals.append(1)
                redVals.append(1)
                blueVals.append(1)
            else:
                greenVals.append(0)
                redVals.append(0)
                blueVals.append(0)

    #set up the plot
    N = len(intervals)    
    ind = np.arange(2*N, step = 2)    # the x locations for the groups
    width = 1       # the width of the bars: can also be len(x) sequence

  

    # convert datasets to numpy

    greenVals = np.array(greenVals)
    redVals = np.array(redVals)
    blueVals = np.array(blueVals)

    if onlyAnalyzed:
        blueVals = greenVals + redVals

    fig = plt.figure()#(figsize=(50,10))

    if percentage:
        if onlyAnalyzed:
            p1 = plt.bar(ind,  greenVals + redVals, width, color=blue, edgecolor='black', log=log)
        elif onlyTimeout: 
            p1  = plt.bar(ind,  blueVals, width, color=blue, edgecolor='black', log=log)
        else:
            p1  = plt.bar(ind,  blueVals, width, color=blue, edgecolor='black', log=log)
            p2 = plt.bar(ind, greenVals, width, bottom=blueVals, color=green, edgecolor='black', log=log)
            p3 = plt.bar(ind, redVals, width, bottom=blueVals+greenVals, color=brightRed, edgecolor='black', log=log)
    else:
        if onlyAnalyzed:
            p1 = plt.bar(ind, greenVals + redVals, width, color=blue, edgecolor='black', log=log)
        elif onlyTimeout:
            p1 = plt.bar(ind, blueVals, width, color=blue, edgecolor='black', log=log)
        else:
            p1 = plt.bar(ind, blueVals, width, color=blue, edgecolor='black', log=log)
            p2 = plt.bar(ind+width, greenVals, width, color=green, edgecolor='black', log=log)
            p3 = plt.bar(ind+2*width, redVals, width, color=brightRed, edgecolor='black', log=log)

    plt.ylabel(yLabel)
    plt.xlabel(xLabel)

    plt.title(title)
    plt.xticks(ind+width, zip(*intervals)[1], fontsize=14, rotation=90)

    if percentage:
        plt.ylim([0, 100])
        # plt.xlim([0, x.max()])
    # else:
    #     plt.ylim([0, y.max()])
    #     # plt.xlim([0, x.max()])

    return fig




def printSummary(clusteredData, intervals, attr):
    for min,max in intervals:
        minVal = None
        maxVal = None
        traceNr = 0
        if (min,max) in clusteredData.keys():
            traceNr = len(clusteredData[(min,max)])
            for path in clusteredData[(min,max)]:
                if minVal == None:
                    minVal = path[attr]
                if maxVal == None:
                    minVal = path[attr]
                if path[attr] < minVal:
                    minVal = path[attr]
                if path[attr] > maxVal:
                    maxVal = path[attr]
        print("[%d,%d]: MIN %d MAX %d # %d"%(min,max, (minVal if minVal != None else 0), (maxVal if maxVal != None else 0), traceNr ))

def printSummaryResults(dataGrouped):
    safe = len(dataGrouped["safe"].keys())  if "safe" in dataGrouped.keys() else 0
    dataV = len(dataGrouped["data"].keys())  if "data" in dataGrouped.keys() else 0
    ctrl = len(dataGrouped["control"].keys())  if "control" in dataGrouped.keys() else 0
    safeUnk = len(dataGrouped["safeUnk"].keys())  if "safeUnk" in dataGrouped.keys() else 0
    dataUnk = len(dataGrouped["dataUnk"].keys())  if "dataUnk" in dataGrouped.keys() else 0
    ctrlUnk = len(dataGrouped["controlUnk"].keys())  if "controlUnk" in dataGrouped.keys() else 0
    segfault = len(dataGrouped["segfault"].keys())  if "segfault" in dataGrouped.keys() else 0
    timeout = len(dataGrouped["timeout"].keys())  if "timeout" in dataGrouped.keys() else 0
    parsing = len(dataGrouped["parsing"].keys())  if "parsing" in dataGrouped.keys() else 0
    print("safe: "+str(safe)+" data: "+str(dataV)+" ctrl: "+str(ctrl)+" safeUnk: "+str(safeUnk)+" dataUnk: "+str(dataUnk)+" ctrlUnk: "+str(ctrlUnk)+" segfault: "+str(segfault)+" timeout: "+str(timeout)+" parsing: "+str(parsing))

def printSummaryByIntervals(data,intervals, unknownInstrMode):
    for min,max in intervals:
        if (min,max) in data:
            values = data[(min,max)]
            safe = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "safe" ])
            data = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "data" ])
            control = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "control" ])
            safeUnk = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "safeUnk" ])
            dataUnk = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "dataUnk" ])
            controlUnk = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "controlUnk" ])
            segfault = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "segfault" ])
            timeout = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "timeout" ])
            parsing = len([key for key in values.keys() if getResult(values[key],unknownInstrMode) == "parsing" ])
            success = (safe + data + control + safeUnk + dataUnk + controlUnk)
            fail = (segfault + parsing + timeout)
            total = success + fail
            print("[%d,%d]: ANALYZED %d (SAFE = %d, UNSAFE = %d) TIMEOUT %d TOTAL %d"%(min,max, success, (safe+safeUnk), (data + control + dataUnk + controlUnk), fail, total  ))




def printPaperSummary(functions,paths,unknownInstrMode, stepThreshold, pathThreshold):

    ### TOTAL NUMBERS
    print("Total number of functions: %d"%len(functions.keys()))
    print("Total number of paths: %d"%len(paths))

    ### IMPACT OF PATH LIMIT
    fnctsOverThreshold = [fnct for fnct in functions.keys() if "paths" in functions[fnct].keys() and functions[fnct]["paths"]["length"] == pathThreshold]
    # fnctsOverThreshold = []
    # for fnct in functions.keys():
    #     f = functions[fnct]
    #     if "paths" in f.keys():
    #         p = f["paths"]
    #         if "length" in p.keys():
    #             if p["length"] == "25":
    #                 fnctsOverThreshold.append(f)
    #         else:
    #             print(f)
    #             assert False
    print("Number of functions with %d paths: %d"%(pathThreshold,len(fnctsOverThreshold)))

    ### IMPACT OF STEP LIMIT
    pathsOverThreshold = [path for path in paths if path["steps"] == stepThreshold]
    print("Number of paths with %d steps: %d"%(stepThreshold,len(pathsOverThreshold)))
    fnctsOverStepThreshold = set([path["name"] for path in pathsOverThreshold])
    print("Number of functions containing paths with more than %d steps: %d"%(stepThreshold,len(fnctsOverStepThreshold)))


    ### UNSUPPORTED INSTRUCTIONS
    pathsWithUnsupportedInstrs = [path for path in  paths if path["unsupported_ins"] > 0 or len(path["unknown_labels"]) > 0 or len(path["indirect_jumps"]) > 0]
    fnctsWithUnsupportedInstrs = set([path["name"] for path in pathsWithUnsupportedInstrs])
    print("Functions with unsupported instructions: %d"%len(fnctsWithUnsupportedInstrs))
    print("Paths with unsupported instructions: %d"%len(pathsWithUnsupportedInstrs))

    ### FULL ANALYSIS

    fullyAnalyzedFncts = [fnct for fnct in functions.keys() if getResult(functions[fnct],unknownInstrMode) not in {"segfault", "timeout_sni", "timeout"}]
    timedOutPaths = [path for path in paths if getTraceResult(path,unknownInstrMode) in {"timeout_sni"}]
    print("Fully analyzed functions: %d"%len(fullyAnalyzedFncts))
    print("Timed-out functions: %d"%(len(functions.keys())-len(fullyAnalyzedFncts)))
    print("Timed-out paths: %d"%(len(timedOutPaths)))

    ### SAFE STATUS
    safePaths = [path for path in  paths if getTraceResult(path,unknownInstrMode) in {"safe"}]
    safeUnkPaths = [path for path in  paths if getTraceResult(path,unknownInstrMode) in {"safeUnk"}]
    safeFncts = [fnct for fnct in functions.keys() if getResult( functions[fnct], unknownInstrMode) in {"safe"}]
    safeUnkFncts = [fnct for fnct in functions.keys() if getResult( functions[fnct], unknownInstrMode) in {"safeUnk"}]
    print("SAFE paths: %d"%len(safePaths))
    print("SAFE-UNK paths: %d"%len(safeUnkPaths))
    print("SAFE functions: %d"%len(safeFncts))
    print("SAFE-UNK functions: %d"%len(safeUnkFncts))

    ### DATA STATUS
    dataPaths = [path for path in  paths if getTraceResult(path,unknownInstrMode) in {"data"}]
    dataUnkPaths = [path for path in  paths if getTraceResult(path,unknownInstrMode) in {"dataUnk"}]
    dataFncts = [fnct for fnct in functions.keys() if getResult( functions[fnct], unknownInstrMode) in {"data"}]
    dataUnkFncts = [fnct for fnct in functions.keys() if getResult( functions[fnct], unknownInstrMode) in {"dataUnk"}]
    print("DATA paths: %d"%len(dataPaths))
    print("DATA-UNK paths: %d"%len(dataUnkPaths))
    print("DATA functions: %d"%len(dataFncts))
    print("DATA-UNK functions: %d"%len(dataUnkFncts))

    ### CTRL STATUS
    ctrlPaths = [path for path in  paths if getTraceResult(path,unknownInstrMode) in {"control"}]
    ctrlUnkPaths = [path for path in  paths if getTraceResult(path,unknownInstrMode) in {"controlUnk"}]
    ctrlFncts = [fnct for fnct in functions.keys() if getResult( functions[fnct], unknownInstrMode) in {"control"}]
    ctrlUnkFncts = [fnct for fnct in functions.keys() if getResult( functions[fnct], unknownInstrMode) in {"controlUnk"}]
    print("CTRL paths: %d"%len(ctrlPaths))
    print("CTRL-UNK paths: %d"%len(ctrlUnkPaths))
    print("CTRL functions: %d"%len(ctrlFncts))
    print("CTRL-UNK functions: %d"%len(ctrlUnkFncts))

    

    ### DATA-OR-CTRL 
    # dataorctrlPaths = set(dataPaths).union(set(ctrlPaths))
    # dataorctrlUnkPaths = set(dataUnkPaths).union(set(ctrlUnkPaths))
    # dataorctrlFncts = set(dataFncts).union(set(ctrlFncts))
    # dataorctrlUnkFncts = set(dataUnkFncts).union(set(ctrlUnkFncts))
    # print("DATA-OR-CTRL paths: %d"%len(dataorctrlPaths))
    # print("DATA-OR-CTRL-UNK paths: %d"%len(dataorctrlUnkPaths))
    # print("DATA-OR-CTRL functions: %d"%len(dataorctrlFncts))
    # print("DATA-OR-CTRL-UNK functions: %d"%len(dataorctrlUnkFncts))


    ### 
    print("Safe and Unsafe Paths with unsupported instruction: %d"%( len(safeUnkPaths) + len(dataUnkPaths) + len(ctrlUnkPaths)  ))

def getSymbolicStatus(stats, pathLength):
    return "sat" if (pathLength == min([key["len"] for key in stats])) else "unsat"


def extractSymbExecData(paths, mode):
    newPaths = []
    n = 0
    m = 0
    for path in paths:
        if "concolic_stats" in path.keys():
            stats = path["concolic_stats"]
            pathData = {} # copy.deepcopy(path)
            if len(stats) >0:
                if mode == "expand":
                    for entry in stats:
                        pathData = {} # copy.deepcopy(path)
                        pathData["symbolic_length"] = entry["len"]
                        pathData["symbolic_time"] = entry["time"]
                        pathData["symbolic_status"] = entry["status"]
                        newPaths.append(pathData)
                        n+=1
                elif mode == "incremental":
                    length = None
                    time = 0
                    status = None
                    for entry in stats:
                        if length is None:
                            length = int(entry["len"])
                            status = entry["status"]
                            time = float(entry["time"])
                        else:
                            time += float(entry["time"])
                            if int(entry["len"]) < length:
                                status = entry["status"]
                                # length = int(entry["len"]) ### see below!
                            if int(entry["len"]) > length:
                                length = int(entry["len"])
                    pathData["symbolic_length"] = length
                    pathData["symbolic_time"] = time
                    pathData["symbolic_status"] = status 
                    pathData["time_trace"] = path["time_trace"]
                    pathData["trace_length"] = path["trace_length"]
                    newPaths.append(pathData)
                    n+=1
                else:
                    print("Unsupported mode "+mode)
                    assert False
            else:
                newPaths.append(path)
                m +=1
        else:
            newPaths.append(path)
            m +=1
    print("%d paths with symbolic information and %d paths without symbolic information"%(n,m))
    return newPaths

def extractSymbExecDataAndCollectPaths(data):
    paths = []
    n = 0
    m = 0
    for function in data.keys():
        functionData = data[function]
        if "paths" in functionData.keys():
            for path in functionData["paths"]:
                if path != 'length': ## needed because we have a length entry in the json
                    pathData = functionData["paths"][path]
                    if "concolic_stats" in pathData.keys():
                        stats = pathData["concolic_stats"]
                        if len(stats) >0:
                            for entry in stats:
                                pathData = copy.deepcopy(pathData)
                                pathData["symbolic_length"] = entry["len"]
                                pathData["symbolic_time"] = entry["time"]
                                pathData["symbolic_status"] = entry["status"] # getSymbolicStatus(stats, entry["len"])
                                paths.append(pathData)
                                n+=1
                        else:
                            paths.append(pathData)
                            m +=1
                    else:
                        paths.append(pathData)
                        m +=1
    print("%d paths with symbolic information and %d paths without symbolic information"%(n,m))
    return paths

def extractSymbExecDataAndCollectPathsIncremental(data):
    paths = []
    n = 0
    m = 0
    for function in data.keys():
        functionData = data[function]
        if "paths" in functionData.keys():
            for path in functionData["paths"]:
                if path != 'length': ## needed because we have a length entry in the json
                    pathData = functionData["paths"][path]
                    if "concolic_stats" in pathData.keys():
                        stats = pathData["concolic_stats"]
                        if len(stats) >0:
                            length = None
                            time = 0
                            status = None
                            for entry in stats:
                                if length is None:
                                    length = int(entry["len"])
                                    status = entry["status"]
                                    time = float(entry["time"])
                                else:
                                    time += float(entry["time"])
                                    if int(entry["len"]) < length:
                                        length = int(entry["len"])
                                        status = entry["status"]
                            pathData = copy.deepcopy(pathData)
                            pathData["symbolic_length"] = length
                            pathData["symbolic_time"] = time
                            pathData["symbolic_status"] = status # getSymbolicStatus(stats, entry["len"])
                            paths.append(pathData)
                            n+=1
                        else:
                            paths.append(pathData)
                            m +=1
                    else:
                        paths.append(pathData)
                        m +=1
    print("%d paths with symbolic information and %d paths without symbolic information"%(n,m))
    return paths
    




#############
############# ANALYSES
#############

def stepAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,18000,2000)
    dataBySteps = groupByIntervals(data, intervals, "steps")
    plots = []
    plots.append(stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by steps", xLabel="Number of steps", yLabel="Number of programs"))
    plots.append(stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by steps", xLabel="Number of steps", yLabel="Percentage"))
    plots.append(plotValue(data, "steps",unknownInstrMode, title="Steps", xLabel="Programs", yLabel="Number of steps", log=False))
    plots.append(compactStackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="", xLabel="Number of steps", yLabel="Number of programs (logscale)", onlyAnalyzed = True))
    toPDF(reportName+"steps.pdf", plots)

def instructionsAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,1000,100)
    dataBySteps = groupByIntervals(data, intervals, "instructions")
    plots = []
    plots.append(stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by instructions", xLabel="Number of instructions", yLabel="Number of programs"))
    plots.append(stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by instructions", xLabel="Number of instructions", yLabel="Percentage"))
    plots.append(plotValue(data, "instructions", unknownInstrMode, title="instructions", xLabel="Programs", yLabel="Number of instructions", log=False))
    toPDF(reportName+"instructions.pdf", plots)

def resultsAnalysis(data, unknownInstrMode, reportName, plotParsing=False):
    dataByResult = groupByClass(data, "result", unknownInstrMode)
    printSummaryResults(dataByResult)
    # plt = plotDoublePie(dataByResult, plotParsing=plotParsing)
    plots = []
    plots.append(plotCompactDoublePie(dataByResult, plotParsing=False))
    toPDF(reportName+"results.pdf", plots)

def timeAnalysis(data, unknownInstrMode, reportName):
    intervals =  generateIntervals(0,40000,5000)
    dataByTime = groupByIntervals(data, intervals, "totalTime")
    plots = []
    plots.append(stackedBars(dataByTime,intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False))
    plots.append(plotValue(data,  "totalTime", unknownInstrMode, title="Total Time", xLabel="Programs", yLabel="Total time", log=False))
    toPDF(reportName+"time.pdf", plots)

def pathAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,30,2)
    dataByPaths = groupByIntervals(data, intervals, "paths")
    plots = []
    plots.append(stackedBars(dataByPaths, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by paths", xLabel="Number of instructions", yLabel="Number of programs"))
    plots.append(stackedBars(dataByPaths, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by paths", xLabel="Number of instructions", yLabel="Percentage"))
    plots.append(plotValue(data, "paths", unknownInstrMode, title="Paths", xLabel="Programs", yLabel="Number of paths", log=False))
    toPDF(reportName+"paths.pdf", plots)

def locAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,9000,1000)
    dataByLOC = groupByIntervals(data, intervals, "LOC")
    # printSummaryByIntervals(data,intervals)
    # plt3 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs")
    # plt4 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by LOC", xLabel="Number of LOC", yLabel="Percentage")
    
    plots = []
    plots.append(compactStackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs"))
    plots.append(compactStackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs", onlySafe = True))
    plots.append(compactStackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by LOC", xLabel="Number of LOC", yLabel="Percentage"))
    toPDF(reportName+"LOC.pdf", plots)

def traceAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,9000,1000)
    dataByTrace = groupByIntervals(data, intervals, "trace")
    # printSummaryByIntervals(data,intervals)
    # plt3 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs")
    # plt4 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by LOC", xLabel="Number of LOC", yLabel="Percentage")
    plots = []
    plots.append(compactStackedBars(dataByTrace, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="", xLabel="Traces length", yLabel="Number of programs", onlyAnalyzed = True))
    plots.append(compactStackedBars(dataByTrace, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="", xLabel="Traces length", yLabel="Percentage"))
    plots.append(plotValue(data, "trace", unknownInstrMode, title="Traces", xLabel="Programs", yLabel="Trace Length", log=False))
    toPDF(reportName+"trace.pdf", plots)

def sniAnalysis(data, paths, mode, prefix):
    threshold = 5000
    dataByResult = groupByClass(data, "result", mode)
    printSummaryResults(dataByResult)
    print("Total paths %d"%len(paths))

    #### TODO - We must gather path information also for those functions that time-out
    #### TODO - We need partial path information for the symbolic execution 

    intervals = generateIntervals(0,5000,200)

    clusteredData = groupPathsByIntervals(paths, intervals, "trace_length")
    printSummary(clusteredData, intervals, "trace_length")

    plots = []
    # plots.append(scatterClusteredCategorical(clusteredData, intervals, mode="sni_time", unknownInstrMode=mode,  title = "", xLabel = "", yLabel = "",  colorsMode="status", log = True))
    # plots.append(scatterPlotPathsValue(paths, "sni_time", unknownInstrMode=mode, title="", xLabel="", yLabel="", colorsMode="status", log=True))
    # plots.append(scatterPlotPathsValue(paths, "trace_length", unknownInstrMode=mode, title="", xLabel="", yLabel="", colorsMode="status", log=True))
    plots.append(scatterPlotPathsValue(paths, "sni_time", unknownInstrMode=mode, title="", xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="trace_length", colorsMode="status", threshold=threshold, log=True,markersize =  6))
    plots.append(pathStackedBars(clusteredData,  intervals, unknownInstrMode=mode, percentage = True, log=False, title="", xLabel="", yLabel="", colorsMode = "status", onlyAnalyzed = False, onlyTimeout = True))
    
    plots.append(doubleScatterPlotPathsValue(paths,  unknownInstrMode=mode, title="", xLabel="SNI Time", yLabel="PathTime [ms (logscale)]", xValues="sni_time", yValues = "time_trace", colorsMode="status", xThreshold=threshold*100000, yThreshold=threshold*100000, xLog=True, yLog=True, markersize =  6))
    plots.append(doubleScatterPlotPathsValue(paths,  unknownInstrMode=mode, title="", xLabel="SNI Time", yLabel="PathTime [ms (logscale)]", xValues="sni_time", yValues = "time_trace", colorsMode="status", xThreshold=threshold*100000, yThreshold=threshold*100000, xLog=False, yLog=False, markersize =  6))

    toPDF(prefix+"_"+mode+"_sni.pdf", plots)

def symbExecAnalysis(data, paths, mode, prefix):
    pathsIncr = extractSymbExecData(paths, "incremental")
    pathsExtd = extractSymbExecData(paths, "expand")


    # paths = extractSymbExecDataAndCollectPaths(data)
    # paths = extractSymbExecDataAndCollectPathsIncremental(data)
    print("Total paths %d"%len(paths))
    intervals = generateIntervals(0,40000,500)

    clusteredData = groupPathsByIntervals(pathsExtd, intervals, "symbolic_length")

    plots = []
    plots.append(scatterPlotPathsValue(pathsExtd, "symbolic_time", unknownInstrMode=mode, title="", xLabel="SMT formula's length [number of conjuncts]", yLabel="Running time [ms (logscale)]", xValues="symbolic_length", colorsMode="symbolic_status", threshold=40000, log=True, avoidReps = False,markersize=6))
    plots.append(scatterPlotPathsValue(pathsIncr, "time_trace", unknownInstrMode=mode, title="", xLabel="Number of conjuncts", yLabel="Running time [ms (logscale)]", xValues="symbolic_length", colorsMode="noColor", threshold=40000, log=True, avoidReps = False,markersize=6))
    plots.append(scatterPlotPathsValue(pathsIncr, "time_trace", unknownInstrMode=mode, title="", xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="trace_length", colorsMode="noColor", threshold=5000, log=True, avoidReps = False,markersize=6))
    plots.append(scatterPlotPathsValue(pathsIncr, "symbolic_time", unknownInstrMode=mode, title="", xLabel="Number of conjuncts", yLabel="Running time [ms (logscale)]", xValues="symbolic_length", colorsMode="noColor", threshold=40000, log=True, avoidReps = False,markersize=6))
    plots.append(scatterPlotPathsValue(pathsIncr, "symbolic_time", unknownInstrMode=mode, title="", xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="trace_length", colorsMode="noColor", threshold=5000, log=True, avoidReps = False,markersize=6))
    plots.append(pathStackedBars(clusteredData,  intervals, unknownInstrMode=mode, percentage = True, log=False, title="", xLabel="", yLabel="", colorsMode = "symbolic_status", onlyAnalyzed = False, onlyTimeout = False))
    # plots.append(scatterPlotPathsValue(paths, "symbolic_length", unknownInstrMode=mode, title="", xLabel="", yLabel="", colorsMode="symbolic_status", log=False))
    # plots.append(pathStackedBars(clusteredData,  intervals, unknownInstrMode=mode, percentage = True, log=False, title="", xLabel="", yLabel="", colorsMode = "symbolic_status", onlyAnalyzed = False, onlyTimeout = True))
    toPDF(prefix+"_"+mode+"_symb.pdf", plots)

def paperAnalysisTrace(data, paths, mode, prefix):
    threshold = 5000
    dataByResult = groupByClass(data, "result", mode)
    printSummaryResults(dataByResult)

    print("<><><><> SUMMARY")
    printPaperSummary(data,paths,mode, 10000, 25)
    print("<><><><> PLOTS")

    intervals = generateIntervals(0,5000,200)
    clusteredData = groupPathsByIntervals(paths, intervals, "trace_length")

    plots = []
    print("<><><><> SNI TIME")
    plots.append(scatterPlotPathsValue(paths, "sni_time", unknownInstrMode=mode, 
        title="", #" SNI Check", 
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="trace_length", colorsMode="status", threshold=threshold, log=True,markersize =  6))
    print("<><><><> SNI TOUT")
    plots.append(pathStackedBars(clusteredData,  intervals, unknownInstrMode=mode, percentage = True, log=False, 
        title="", #"SNI Check", 
        xLabel="Trace length", yLabel="Percentage of time out", colorsMode = "status", onlyAnalyzed = False, onlyTimeout = True))
    print("<><><><> DATA TIME")
    plots.append(scatterPlotPathsValue(paths, "time_data", unknownInstrMode=mode, title= "", #"="MemCheck",
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="trace_length", colorsMode="status", threshold=threshold, log=True,markersize =  6))
    print("<><><><> CTRL TIME")
    plots.append(scatterPlotPathsValue(paths, "time_control", unknownInstrMode=mode, title= "", #"="CtrlCheck",
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="trace_length", colorsMode="status", threshold=threshold, log=True,markersize =  6))
    print("<><><><> SYMB TIME")
    plots.append(scatterPlotPathsValue(paths, "time_trace", unknownInstrMode=mode, title= "", #"="Discover Symbolic path", 
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="trace_length", colorsMode="symbConcise", threshold=threshold, log=True, avoidReps = False,markersize=6))    
    print("<><><><> SNI-VS-SYMB")
    plots.append(doubleScatterPlotPathsValue(paths,  unknownInstrMode=mode, title= "", #"="SNI vs Symbolic", 
        xLabel="Speculative non-interference  [ms (logscale)]", yLabel="Symbolic Execution [ms (logscale)]", xValues="sni_time", yValues = "time_trace", colorsMode="symbConcise", xThreshold=threshold*100000, yThreshold=threshold*100000, xLog=True, yLog=True, markersize =  6))

    toPDF(prefix+"_"+mode+"_paper.pdf", plots)

def paperAnalysisSteps(data, paths, mode, prefix):
    threshold = 10000
    dataByResult = groupByClass(data, "result", mode)
    printSummaryResults(dataByResult)

    print("<><><><> SUMMARY")
    printPaperSummary(data,paths,mode, 10000, 25)
    print("<><><><> PLOTS")

    intervals = generateIntervals(0,10000,200)
    clusteredData = groupPathsByIntervals(paths, intervals, "steps")

    plots = []
    print("<><><><> SNI TIME")
    plots.append(scatterPlotPathsValue(paths, "sni_time", unknownInstrMode=mode, 
        title="", #" SNI Check", 
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="steps", colorsMode="status", threshold=threshold, log=True,markersize =  6))
    print("<><><><> SNI TOUT")
    plots.append(pathStackedBars(clusteredData,  intervals, unknownInstrMode=mode, percentage = True, log=False, 
        title="", #"SNI Check", 
        xLabel="Trace length", yLabel="Percentage of time out", colorsMode = "status", onlyAnalyzed = False, onlyTimeout = True))
    print("<><><><> DATA TIME")
    plots.append(scatterPlotPathsValue(paths, "time_data", unknownInstrMode=mode, title= "", #"="MemCheck",
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="steps", colorsMode="status", threshold=threshold, log=True,markersize =  6))
    print("<><><><> CTRL TIME")
    plots.append(scatterPlotPathsValue(paths, "time_control", unknownInstrMode=mode, title= "", #"="CtrlCheck",
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="steps", colorsMode="status", threshold=threshold, log=True,markersize =  6))
    print("<><><><> SYMB TIME")
    plots.append(scatterPlotPathsValue(paths, "time_trace", unknownInstrMode=mode, title= "", #"="Discover Symbolic path", 
        xLabel="Trace length", yLabel="Running time [ms (logscale)]", xValues="steps", colorsMode="symbConcise", threshold=threshold, log=True, avoidReps = False,markersize=6))    
    print("<><><><> SNI-VS-SYMB")
    plots.append(doubleScatterPlotPathsValue(paths,  unknownInstrMode=mode, title= "", #"="SNI vs Symbolic", 
        xLabel="Speculative non-interference  [ms (logscale)]", yLabel="Symbolic Execution [ms (logscale)]", xValues="sni_time", yValues = "time_trace", colorsMode="symbConcise", xThreshold=threshold*100000, yThreshold=threshold*100000, xLog=True, yLog=True, markersize =  6))

    toPDF(prefix+"_"+mode+"_paper.pdf", plots)

#############
############# MAIN
#############

def main(argv):
    try:
        opts, args = getopt.getopt(argv,'h', ["source=","sizes=", "unsupported-as-skip=", "unsupported-as-stop=", "unsupported-as-skip-paths=", "unsupported-as-stop-paths=", "mode=", "analysis=", "prefix="])
    except getopt.GetoptError:
        print("Wrong usage. See below.")
        print("Usage: dataAnalysis [options]")
        print("Options:")
        print("     --source <file>                     Source file")
        print("     --sizes <file>                      JSON file with the function sizes")
        print("     --unsupported-as-skip <folder>      Logs generated using unsupported-as-skip")
        print("     --unsupported-as-stop <folder>      Logs generated using unsupported-as-stop")
        print("     --unsupported-as-skip-path <folder> Logs generated using unsupported-as-skip (paths)")
        print("     --unsupported-as-stop-path <folder> Logs generated using unsupported-as-stop (paths)")
        print("     --mode  (skip|stop|merge)           Choose which data to plot")
        print("     --analysis                          Choose analysis type")
        print("     --prefix                            Prefix for output files (default is date)")
        sys.exit(2)

    ### Initialized from cmd line
    pathSrc = None
    pathSize = None
    pathStop = None
    pathSkip = None
    pathStopPaths = None
    pathSkipPaths = None
    merge = False
    analysis = None
    dataSkip = None
    dataStop = None
    dataSkipPaths = None
    dataStopPaths = None
    pathSize = None
    sizes = None
    prefix = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
    for opt, arg in opts:
        if opt == '-h':
            print("Usage: dataAnalysis [options]")
            print("Options:")
            print("     --source <file>                     Source file")
            print("     --sizes <file>                      JSON file with the function sizes")
            print("     --unsupported-as-skip <folder>      Logs generated using unsupported-as-skip")
            print("     --unsupported-as-stop <folder>      Logs generated using unsupported-as-stop")
            print("     --unsupported-as-skip-path <folder> Logs generated using unsupported-as-skip (paths)")
            print("     --unsupported-as-stop-path <folder> Logs generated using unsupported-as-stop (paths)")
            print("     --mode  (skip|stop|merge)           Choose which data to plot")
            print("     --analysis                          Choose analysis type")
            print("     --prefix                            Prefix for output files (default is date)")
            sys.exit()
        elif opt == "--source":
            pathSrc = arg
        elif opt == "--sizes":
            pathSize = arg
        elif opt == "--unsupported-as-skip":
            pathSkip = arg
        elif opt == "--unsupported-as-stop":
            pathStop = arg
        elif opt == "--unsupported-as-skip-paths":
            pathSkipPaths = arg
        elif opt == "--unsupported-as-stop-paths":
            pathStopPaths = arg
        elif opt == "--mode":
            mode = arg
        elif opt == "--analysis":
            analysis = arg
        elif opt == "--prefix":
            prefix = arg
        else:
            print("Unsupported option" + opt)
            sys.exit(2)



    ### load data
    if pathStop is not None:
        dataStop = loadData(pathStop)
        if pathStopPaths is not None:
            dataStopPaths = loadPaths(pathStopPaths)
        else:
            dataStopPaths =   collectPaths(dataStop)
    if pathSkip is not None:
        dataSkip = loadData(pathSkip) 
        if pathSkipPaths is not None:
            dataSkipPaths = loadPaths(pathSkipPaths)
        else:
            dataSkipPaths =   collectPaths(dataSkip)
    if pathSize is not None:
        sizes = loadSizes(pathSize)
    elif pathSrc is not None:
        sizes = sizesFromSource(pathSrc)
    
    

    if analysis == "all":
        if mode == "skip":
            if dataSkip is not None:
                data = dataSkip
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        elif mode == "stop":
            if dataStop is not None:
                data = dataStop
            else:
                print("Pass a file with the --unsupported-as-stop option")
                sys.exit(2)
        elif mode == "merge":
            if dataSkip is not None:
                if dataStop is not None:
                    data = merge1(dataSkip, dataStop)
                else:
                    print("Pass a file with the --unsupported-as-stop option")
                    sys.exit(2)
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        else:
            print("Unsupported mode")
            sys.exit(2)
        print("Number of files: %d"%len(data))
        resultsAnalysis(data, unknownInstrMode=mode, reportName=prefix+"_"+mode+"_")
        pathAnalysis(data, unknownInstrMode=mode, reportName=prefix+"_"+mode+"_")
        instructionsAnalysis(data, unknownInstrMode=mode, reportName=prefix+"_"+mode+"_")
        stepAnalysis(data, unknownInstrMode=mode, reportName=prefix+"_"+mode+"_")
        timeAnalysis(data, unknownInstrMode=mode, reportName=prefix+"_"+mode+"_")
    elif analysis == "sni":
        if mode == "skip":
            if dataSkip is not None:
                data = dataSkip
                pathData = dataSkipPaths
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        elif mode == "stop":
            if dataStop is not None:
                data = dataStop
                pathData = dataStopPaths
            else:
                print("Pass a file with the --unsupported-as-stop option")
                sys.exit(2)
        elif mode == "merge":
            if dataSkip is not None:
                if dataStop is not None:
                    data = merge1(dataSkip, dataStop)
                else:
                    print("Pass a file with the --unsupported-as-stop option")
                    sys.exit(2)
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        else:
            print("Unsupported mode")
            sys.exit(2)
        if len(data) == 0 or len(pathData) == 0:
            print("There are no data to process")
            sys.exit()
        sniAnalysis(data,pathData, mode, prefix)
    elif analysis == "paper":
        if mode == "skip":
            if dataSkip is not None:
                data = dataSkip
                pathData = dataSkipPaths
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        elif mode == "stop":
            if dataStop is not None:
                data = dataStop
                pathData = dataStopPaths
            else:
                print("Pass a file with the --unsupported-as-stop option")
                sys.exit(2)
        elif mode == "merge":
            if dataSkip is not None:
                if dataStop is not None:
                    data = merge1(dataSkip, dataStop)
                else:
                    print("Pass a file with the --unsupported-as-stop option")
                    sys.exit(2)
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        else:
            print("Unsupported mode")
            sys.exit(2)
        if len(data) == 0 or len(pathData) == 0:
            print("There are no data to process")
            sys.exit()
        paperAnalysisTrace(data,pathData, mode, prefix)
    elif analysis == "symb":
        if mode == "skip":
            if dataSkip is not None:
                data = dataSkip
                pathData = dataSkipPaths
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        elif mode == "stop":
            if dataStop is not None:
                data = dataStop
                pathData = dataStopPaths
            else:
                print("Pass a file with the --unsupported-as-stop option")
                sys.exit(2)
        elif mode == "merge":
            if dataSkip is not None:
                if dataStop is not None:
                    data = merge1(dataSkip, dataStop)
                else:
                    print("Pass a file with the --unsupported-as-stop option")
                    sys.exit(2)
            else:
                print("Pass a file with the --unsupported-as-skip option")
                sys.exit(2)
        else:
            print("Unsupported mode")
            sys.exit(2)

        if len(data) == 0 or len(pathData) == 0:
            print("There are no data to process")
            sys.exit()
        symbExecAnalysis(data, pathData ,mode, prefix)
    elif analysis == "fnct_size":
        if dataSkip is not None:
            if dataStop is not None:
                if sizes is not None:
                    ### PLOT BY FUNCTION SIZE
                    data = merge1(dataSkip, dataStop)
                    data = mergeSizes(data,sizes)
                    if len(data) == 0:
                        print("There are no data to process")
                        sys.exit()
                    locAnalysis(data, unknownInstrMode="merge", reportName=prefix+"_merge_")
                    traceAnalysis(dataSkip, unknownInstrMode="skip", reportName=prefix+"_merge_")
                    traceAnalysis(dataStop, unknownInstrMode="stop", reportName=prefix+"_merge_")
                else:
                    print("Pass either a file containing function sizes with the --sizes option or a source file with the --source option")
                    sys.exit(2)
            else:
                print("Pass a file with the --unsupported-as-stop option")
                sys.exit(2)
        else:
            print("Pass a file with the --unsupported-as-skip option")
            sys.exit(2)
    elif analysis == "coverage":
        fullCoverage = set({})
        fullCoverageBelow25= set({})
        for f in dataStop.keys():
            longData = dataStop[f]
            shortData = dataSkip[f]
            if "paths" in longData.keys() and "paths" in shortData.keys():
                if longData["paths"]["length"]  == shortData["paths"]["length"]:
                    fullCoverage.add(f)
                    if longData["paths"]["length"] < 25:
                        fullCoverageBelow25.add(f)

        print("Full coverage : %d"%len(fullCoverage))
        print("Full coverage below 25 : %d"%len(fullCoverageBelow25))
        print("Total: %d"%min(len(dataStop.keys()), len(dataSkip.keys())))

        # print(fullCoverageBelow25)

        pathsOverThreshold = [path for path in dataSkipPaths if path["steps"] == 10000]
        fnctsOverStepThreshold = set([path["name"].replace(".json_paths","").split("/")[-1] for path in pathsOverThreshold])

        # print(fnctsOverStepThreshold)

        pathsWithUnsupportedInstrs = [path for path in  dataSkipPaths if path["unsupported_ins"] > 0 or len(path["unknown_labels"]) > 0 or len(path["indirect_jumps"]) > 0]
        fnctsWithUnsupportedInstrs = set([path["name"].replace(".json_paths","").split("/")[-1] for path in pathsWithUnsupportedInstrs])

        # print(fnctsOverStepThreshold)

        soundCoverage = set({})
        for f in dataStop.keys():
            if f not in fullCoverageBelow25 and f not in fnctsOverStepThreshold and  f not in fnctsWithUnsupportedInstrs:
                soundCoverage.add(f)

        print("Sound full coverage: %d"%len(soundCoverage))

       
    else:
        print("Unsupported analysis "+analysis)
        sys.exit(2)

if __name__ == "__main__":
   main(sys.argv[1:])

