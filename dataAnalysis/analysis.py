#!/usr/bin/python


import json
from os import listdir
from os.path import isfile, join
import glob
from pprint import pprint
import matplotlib.pyplot as plt
import numpy as np
import sys, getopt

from lineCount import sizesFromSource

from matplotlib.backends.backend_pdf import PdfPages
import copy
import matplotlib
from math import sqrt
SPINE_COLOR = 'gray'

def latexify(fig_width=None, fig_height=None, columns=1):
    """Set up matplotlib's RC params for LaTeX plotting.
    Call this before plotting a figure.

    Parameters
    ----------
    fig_width : float, optional, inches
    fig_height : float,  optional, inches
    columns : {1, 2}
    """

    # code adapted from http://www.scipy.org/Cookbook/Matplotlib/LaTeX_Examples

    # Width and max height in inches for IEEE journals taken from
    # computer.org/cms/Computer.org/Journal%20templates/transactions_art_guide.pdf

    assert(columns in [1,2])

    if fig_width is None:
        fig_width = 3.39 if columns==1 else 6.9 # width in inches

    if fig_height is None:
        golden_mean = (sqrt(5)-1.0)/2.0    # Aesthetic ratio
        fig_height = fig_width*golden_mean # height in inches

    MAX_HEIGHT_INCHES = 8.0
    if fig_height > MAX_HEIGHT_INCHES:
        print("WARNING: fig_height too large:" + fig_height + 
              "so will reduce to" + MAX_HEIGHT_INCHES + "inches.")
        fig_height = MAX_HEIGHT_INCHES

    params = {'backend': 'ps',
              'text.latex.preamble': ['\usepackage{gensymb}'],
              'axes.labelsize': 8, # fontsize for x and y labels (was 10)
              'axes.titlesize': 8,
              'text.fontsize': 8, # was 10
              'legend.fontsize': 8, # was 10
              'xtick.labelsize': 8,
              'ytick.labelsize': 8,
              'text.usetex': True,
              'figure.figsize': [fig_width,fig_height],
              'font.family': 'serif'
    }

    matplotlib.rcParams.update(params)


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
green =  "#31FD2E"
brightRed = "#FF0404"
darkRed = "#8F0000"
blue = "#1620A8"
yellow = "#C6A600"  
purple = "#800080"

def sanitize(text):
    keywords = ["status","name", "file", "entry"]
    for keyword in keywords:
        text = text.replace(keyword+":", "\""+keyword+"\":")
    return text


## load the json data. 
def loadData(path):
    print "Loading "+path
    extension = "*.json"
    jsonFiles = glob.glob(path+"/"+extension)
    data = {}
    for filename in jsonFiles:
        with open(filename) as f:
            content = f.read()
            ## needed to handle bug in the JSON generation :-)
            if content.endswith(","):
                content = content[:-1]
            content = sanitize(content)
            data[filename.replace(path+"/","").replace(".json","")] = json.loads(content)
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
                    pathData = functionData["paths"][path]
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
            return "safeUnk"
    elif status == "safe_bound":
        return "safeUnk"
    elif status == "data":
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
    elif status == "control":
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
            print "Unsupported mode "+unknownInstrMode
            assert False
    else:
        print "Unsupported status "+status
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
            print "Unsupported mode "+unknownInstrMode
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
            print "Unsupported mode "+unknownInstrMode
            assert False
    else:
        print "Unsupported status "+status
        assert False # unsupported value


## group the functions 
def groupByClass(data, mode, unknownInstrMode):
    data1 = {}
    for function in data:
        if mode == "result":
            value = getResult(data[function], unknownInstrMode)
        else:
            print "Unsupported mode"
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
            print "Unsupported mode"
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
            print "Unsupported status"
            print status
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

    print "COMPACT RESULTS: [SAFE, SAFEUNK, LEAK, LEAKUNK, TIMEOUT] = "+str(sizesIn)

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
            print fnct 
            print fnctName
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

    p1 = plt.bar(ind, filterStatus, width, color=blue, edgecolor='black', log=log) # autolabel(p1)
    plt.ylabel(yLabel)
    plt.xlabel(xLabel)

    plt.title(title)
    plt.xticks(ind, intervals)
    plt.show()
    # return fig


def scatterPlotPathsValue(data, mode, unknownInstrMode, title="", xLabel="", yLabel="", xValues = "incremental", threshold=10000, colorsMode= "status" , log=False, avoidReps = False):
    y = []
    x = []
    colors=[]
    skip = 0
    plotted = set({})
    for path in data:
        if mode == "sni_time":
            if "time_solve" not in path.keys():
                continue
        if mode == "symbolic_time":
            if "symbolic_time" not in path.keys():
                continue
        if mode == "trace_length":
            if "trace_length" not in path.keys():
                continue
        if mode == "symbolic_length":
            if "symbolic_length" not in path.keys():
                continue
        if xValues != "incremental":
            if xValues not in path.keys():
                continue
        if colorsMode not in path.keys():
            continue


        if mode == "sni_time":
            val = path["time_solve"]
        elif mode == "symbolic_time":
            val = path["symbolic_time"]
        elif mode == "symbolic_length":
            val = path["symbolic_length"]
        elif mode == "trace_length":
            val = path["trace_length"]
        else:
            print "Unsupported mode"
            assert False

        if xValues != "incremental" and path[xValues] > threshold:
            skip += 1
            continue

        xVal = len(x) if xValues == "incremental" else path[xValues]
        yVal = val+1 if log else val

        if avoidReps:
            if (xVal,yVal) in plotted:
                continue
            else:
                x.append(xVal)
                y.append(yVal)  
        else:        
            x.append(xVal)
            y.append(yVal)   
        
        plotted.add((xVal,yVal))

        if colorsMode == "status":
            if getTraceResult(path,unknownInstrMode) in {"safe", "safeUnk"}:
                colors.append(green)
            elif getTraceResult(path,unknownInstrMode) in {"data", "control", "dataUnk", "controlUnk"}:
                colors.append(brightRed)
            elif getTraceResult(path,unknownInstrMode) == "timeout":
                colors.append(yellow)
            else:
                print "Unsupported status"
                assert False
        elif colorsMode == "symbolic_status":
            if path[colorsMode] == "sat":
                colors.append(green)
            elif path[colorsMode] == "unsat":
                colors.append(brightRed)
            else:
                print "Unsupported status"
                assert False
        else:
            print "Unsupported color mode"
            assert False


    
    print "Plotted %d data"%len(plotted)

    fig = plt.figure()
    ax = plt.gca()

    x = np.array(x)
    y = np.array(y)

    ax.scatter(x ,y , c=colors, alpha=0.3, edgecolors='none')
    if log:
        ax.set_yscale('log')
    plt.title(title)    
    plt.ylim([0, y.max()])
    plt.xlim([0, x.max()])
    # plt.grid()
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)
    
    print "Ignored %d paths over the threshold %d"%(skip,threshold)

    return fig


def scatterClusteredCategorical(data, intervals, mode, unknownInstrMode, title = "", xLabel = "", yLabel = "", colorsMode = "status", log = False):
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
                    print "Unsupported mode"
                    assert False
                x.append(n)
                y.append(val+1 if log else val)   
                
                if colorsMode == "status":
                    if getTraceResult(path,unknownInstrMode) in {"safe", "safeUnk"}:
                        colors.append(green)
                    elif getTraceResult(path,unknownInstrMode) in {"data", "control", "dataUnk", "controlUnk"}:
                        colors.append(brightRed)
                    elif getTraceResult(path,unknownInstrMode) == "timeout":
                        colors.append(yellow)
                    else:
                        print "Unsupported status"
                        assert False
                else:
                    print "Unsupported colors mode"
                    assert False
        n+=1

    fig = plt.figure()
    ax = plt.gca()
    x = np.array(x)
    y = np.array(y)
    ax.scatter(x ,y , c=colors, alpha=.5, edgecolors='none')
    if log:
        ax.set_yscale('log')
    
    plt.ylim([0, y.max()])
    plt.xlim([0, x.max()])
    plt.title(title)    
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)
    
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
        print "[%d,%d]: MIN %d MAX %d # %d"%(min,max, (minVal if minVal != None else 0), (maxVal if maxVal != None else 0), traceNr )

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
    print "safe: "+str(safe)+" data: "+str(dataV)+" ctrl: "+str(ctrl)+" safeUnk: "+str(safeUnk)+" dataUnk: "+str(dataUnk)+" ctrlUnk: "+str(ctrlUnk)+" segfault: "+str(segfault)+" timeout: "+str(timeout)+" parsing: "+str(parsing)

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
            print "[%d,%d]: ANALYZED %d (SAFE = %d, UNSAFE = %d) TIMEOUT %d TOTAL %d"%(min,max, success, (safe+safeUnk), (data + control + dataUnk + controlUnk), fail, total  )

def getSymbolicStatus(stats, pathLength):
    return "sat" if (pathLength == min([key["len"] for key in stats])) else "unsat"


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
                                pathData["symbolic_status"] = getSymbolicStatus(stats, entry["len"])
                                paths.append(pathData)
                                n+=1
                        else:
                            paths.append(pathData)
                            m +=1
                    else:
                        paths.append(pathData)
                        m +=1
    print "%d paths with symbolic information and %d paths without symbolic information"%(n,m)
    return paths
    




#############
############# ANALYSES
#############

def stepAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,18000,2000)
    dataBySteps = groupByIntervals(data, intervals, "steps")
    plt1 = stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by steps", xLabel="Number of steps", yLabel="Number of programs")
    plt2 = stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by steps", xLabel="Number of steps", yLabel="Percentage")
    plt3 = plotValue(data, "steps",unknownInstrMode, title="Steps", xLabel="Programs", yLabel="Number of steps", log=False)
    plt4 = compactStackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="", xLabel="Number of steps", yLabel="Number of programs (logscale)", onlyAnalyzed = True)
    toPDF(reportName+"steps.pdf", [plt1, plt2, plt3,plt4])

def instructionsAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,1000,100)
    dataBySteps = groupByIntervals(data, intervals, "instructions")
    plt1 = stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by instructions", xLabel="Number of instructions", yLabel="Number of programs")
    plt2 = stackedBars(dataBySteps, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by instructions", xLabel="Number of instructions", yLabel="Percentage")
    plt3 = plotValue(data, "instructions", unknownInstrMode, title="instructions", xLabel="Programs", yLabel="Number of instructions", log=False)
    toPDF(reportName+"instructions.pdf", [plt1, plt2, plt3])

def resultsAnalysis(data, unknownInstrMode, reportName, plotParsing=False):
    dataByResult = groupByClass(data, "result", unknownInstrMode)
    printSummaryResults(dataByResult)
    # plt = plotDoublePie(dataByResult, plotParsing=plotParsing)
    plt = plotCompactDoublePie(dataByResult, plotParsing=False)
    toPDF(reportName+"results.pdf", [plt])

def timeAnalysis(data, unknownInstrMode, reportName):
    intervals =  generateIntervals(0,40000,5000)
    dataByTime = groupByIntervals(data, intervals, "totalTime")
    plt1 = stackedBars(dataByTime,intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False)
    plt2 = plotValue(data,  "totalTime", unknownInstrMode, title="Total Time", xLabel="Programs", yLabel="Total time", log=False)
    toPDF(reportName+"time.pdf", [plt1, plt2])

def pathAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,30,2)
    dataByPaths = groupByIntervals(data, intervals, "paths")
    plt1 = stackedBars(dataByPaths, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by paths", xLabel="Number of instructions", yLabel="Number of programs")
    plt2 = stackedBars(dataByPaths, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by paths", xLabel="Number of instructions", yLabel="Percentage")
    plt3 = plotValue(data, "paths", unknownInstrMode, title="Paths", xLabel="Programs", yLabel="Number of paths", log=False)
    toPDF(reportName+"paths.pdf", [plt1, plt2, plt3])

def locAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,9000,1000)
    dataByLOC = groupByIntervals(data, intervals, "LOC")
    # printSummaryByIntervals(data,intervals)
    # plt3 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs")
    # plt4 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by LOC", xLabel="Number of LOC", yLabel="Percentage")
    plt1 = compactStackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs")
    plt3 = compactStackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs", onlySafe = True)
    plt2 = compactStackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by LOC", xLabel="Number of LOC", yLabel="Percentage")
    toPDF(reportName+"LOC.pdf", [plt1,plt2, plt3]) #, plt3,plt4])

def traceAnalysis(data, unknownInstrMode, reportName):
    intervals = generateIntervals(0,9000,1000)
    dataByTrace = groupByIntervals(data, intervals, "trace")
    # printSummaryByIntervals(data,intervals)
    # plt3 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=False, title="Results by LOC", xLabel="Number of LOC", yLabel="Number of programs")
    # plt4 = stackedBars(dataByLOC, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by LOC", xLabel="Number of LOC", yLabel="Percentage")
    plt1 = compactStackedBars(dataByTrace, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=False, log=True, title="", xLabel="Traces length", yLabel="Number of programs", onlyAnalyzed = True)
    plt2 = compactStackedBars(dataByTrace, intervals, unknownInstrMode, ignoreParsingErrors=True, percentage=True, log=False,  title="", xLabel="Traces length", yLabel="Percentage")
    plt3 = plotValue(data, "trace", unknownInstrMode, title="Traces", xLabel="Programs", yLabel="Trace Length", log=False)
    toPDF(reportName+"trace.pdf", [plt1,plt2, plt3])

def sniAnalysis(data, mode):
    dataByResult = groupByClass(data, "result", mode)
    printSummaryResults(dataByResult)
    paths = collectPaths(data)
    print "Total paths %d"%len(paths)
    #### TODO - We must gather path information also for those functions that time-out
    #### TODO - We need partial path information for the symbolic execution 

    intervals = generateIntervals(0,5000,50)

    clusteredData = groupPathsByIntervals(paths, intervals, "trace_length")
    printSummary(clusteredData, intervals, "trace_length")
    plt1 = scatterClusteredCategorical(clusteredData, intervals, mode="sni_time", unknownInstrMode=mode,  title = "", xLabel = "", yLabel = "",  colorsMode="status", log = True)
    plt2 = scatterPlotPathsValue(paths, "sni_time", unknownInstrMode=mode, title="", xLabel="", yLabel="", colorsMode="status", log=True)
    plt3 = scatterPlotPathsValue(paths, "trace_length", unknownInstrMode=mode, title="", xLabel="", yLabel="", colorsMode="status", log=True)
    plt4 = scatterPlotPathsValue(paths, "sni_time", unknownInstrMode=mode, title="", xLabel="", yLabel="", xValues="trace_length", colorsMode="status", threshold=5000, log=True)
    toPDF(mode+"_sni.pdf", [plt1, plt2, plt3, plt4])

def symbExecAnalysis(data,mode):
    paths = extractSymbExecDataAndCollectPaths(data)
    print "Total paths %d"%len(paths)

    plt = scatterPlotPathsValue(paths, "symbolic_time", unknownInstrMode=mode, title="", xLabel="", yLabel="", xValues="symbolic_length", colorsMode="symbolic_status", threshold=2500, log=True, avoidReps = False)
    toPDF(mode+"_symb.pdf", [plt])

#############
############# MAIN
#############

def main(argv):
    try:
        opts, args = getopt.getopt(argv,'', ["source=","sizes=", "unsupported-as-skip=", "unsupported-as-stop=", "mode=", "analysis="])
    except getopt.GetoptError:
        print "Wrong usage. See below."
        print "Usage: dataAnalysis [options]"
        print "Options:"
        print "     --source <file>                 Source file"
        print "     --sizes <file>                  JSON file with the function sizes"
        print "     --unsupported-as-skip <file>    Logs generated using unsupported-as-skip"
        print "     --unsupported-as-stop <file>    Logs generated using unsupported-as-stop"
        print "     --merge                         Merge unsupported-as-skip and unsupported-as-stop logs"
        sys.exit(2)

    ### Initialized from cmd line
    pathSrc = None
    pathSize = None
    pathStop = None
    pathSkip = None
    merge = False
    analysis = None
    dataSkip = None
    dataStop = None
    pathSize = None
    sizes = None
    for opt, arg in opts:
        if opt == '-h':
            print "Usage: dataAnalysis [options]"
            print "Options:"
            print "     --source <file>                 Source file"
            print "     --sizes <file>                  JSON file with the function sizes"
            print "     --unsupported-as-skip <file>    Logs generated using unsupported-as-skip"
            print "     --unsupported-as-stop <file>    Logs generated using unsupported-as-stop"
            print "     --mode  (skip|stop|merge)       Choose which data to plot"
            print "     --analysis (all|                Choose analysis type"
            sys.exit()
        elif opt == "--source":
            pathSrc = arg
        elif opt == "--sizes":
            pathSize = arg
        elif opt == "--unsupported-as-skip":
            pathSkip = arg
        elif opt == "--unsupported-as-stop":
            pathStop = arg
        elif opt == "--mode":
            mode = arg
        elif opt == "--analysis":
            analysis = arg
        else:
            print "Unsupported option" + opt
            assert False



    ### load data
    if pathStop is not None:
        dataStop = loadData(pathStop)
    if pathSkip is not None:
        dataSkip = loadData(pathSkip) 
    if pathSize is not None:
        sizes = loadSizes(pathSize)
    elif pathSrc is not None:
        sizes = sizesFromSource(pathSrc)
    

    if analysis == "all":
        if mode == "skip":
            if dataSkip is not None:
                data = dataSkip
            else:
                print "Pass a file with the --unsupported-as-skip option"
                assert False
        elif mode == "stop":
            if dataStop is not None:
                data = dataStop
            else:
                print "Pass a file with the --unsupported-as-stop option"
                assert False
        elif mode == "merge":
            if dataSkip is not None:
                if dataStop is not None:
                    data = merge1(dataSkip, dataStop)
                else:
                    print "Pass a file with the --unsupported-as-stop option"
                    assert False
            else:
                print "Pass a file with the --unsupported-as-skip option"
                assert False
        else:
            print "Unsupported mode"
            assert False
        print "Number of files: %d"%len(data)
        resultsAnalysis(data, unknownInstrMode=mode, reportName=mode+"_")
        pathAnalysis(data, unknownInstrMode=mode, reportName=mode+"_")
        instructionsAnalysis(data, unknownInstrMode=mode, reportName=mode+"_")
        stepAnalysis(data, unknownInstrMode=mode, reportName=mode+"_")
        timeAnalysis(data, unknownInstrMode=mode, reportName=mode+"_")
    elif analysis == "sni":
        if mode == "skip":
            if dataSkip is not None:
                data = dataSkip
            else:
                print "Pass a file with the --unsupported-as-skip option"
                assert False
        elif mode == "stop":
            if dataStop is not None:
                data = dataStop
            else:
                print "Pass a file with the --unsupported-as-stop option"
                assert False
        elif mode == "merge":
            if dataSkip is not None:
                if dataStop is not None:
                    data = merge1(dataSkip, dataStop)
                else:
                    print "Pass a file with the --unsupported-as-stop option"
                    assert False
            else:
                print "Pass a file with the --unsupported-as-skip option"
                assert False
        else:
            print "Unsupported mode"
            assert False

        sniAnalysis(data, mode)
    elif analysis == "symb":
        if mode == "skip":
            if dataSkip is not None:
                data = dataSkip
            else:
                print "Pass a file with the --unsupported-as-skip option"
                assert False
        elif mode == "stop":
            if dataStop is not None:
                data = dataStop
            else:
                print "Pass a file with the --unsupported-as-stop option"
                assert False
        elif mode == "merge":
            if dataSkip is not None:
                if dataStop is not None:
                    data = merge1(dataSkip, dataStop)
                else:
                    print "Pass a file with the --unsupported-as-stop option"
                    assert False
            else:
                print "Pass a file with the --unsupported-as-skip option"
                assert False
        else:
            print "Unsupported mode"
            assert False
        symbExecAnalysis(data,mode)
    elif analysis == "fnct_size":
        if dataSkip is not None:
            if dataStop is not None:
                if sizes is not None:
                    ### PLOT BY FUNCTION SIZE
                    data = merge1(dataSkip, dataStop)
                    data = mergeSizes(data,sizes)
                    locAnalysis(data, unknownInstrMode="merge", reportName="merge_")
                    traceAnalysis(dataSkip, unknownInstrMode="skip", reportName="merge_")
                    traceAnalysis(dataStop, unknownInstrMode="stop", reportName="merge_")
                else:
                    print "Pass either a file containing function sizes with the --sizes option or a source file with the --source option"
                    assert False
            else:
                print "Pass a file with the --unsupported-as-stop option"
                assert False
        else:
            print "Pass a file with the --unsupported-as-skip option"
            assert False
    else:
        print "Unsupported analysis"
        assert False

if __name__ == "__main__":
   main(sys.argv[1:])

