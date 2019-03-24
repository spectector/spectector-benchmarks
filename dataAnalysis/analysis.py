import json
from os import listdir
from os.path import isfile, join
import glob
from pprint import pprint
import matplotlib.pyplot as plt
import numpy as np


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

## load the json data. 
def loadData(path):
    extension = "*.json"
    jsonFiles = glob.glob(path+"/"+extension)
    data = {}
    for filename in jsonFiles:
        with open(filename) as f:
            content = f.read()
            ## needed to handle bug in the JSON generation :-)
            if content.endswith(","):
                content = content[:-1]
            data[filename.replace(path+"/","").replace(".json","")] = json.loads(content)
    return data

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
            else:
                print "Unsupported mode"
                return 0

            if val < max and val >= min:
                if (min,max) not in data1:
                    data1[(min,max)] = {}
                data1[(min,max)][function] = data[function]
    return data1

def getResult (entry):
    if entry["status"] == "timeout":
            return "timeout"
    if entry["status"] == "segfault":
            return "segfault"
    if entry["status"] == "parsing":
            return "parsing"
    if not unknown_ins(entry):
        if entry["status"] == "safe":
            return "safe"
        elif entry["status"] == "data":
            return "data"
        elif entry["status"] == "control":
            return "control"
        else:
            assert False
    else:
        if entry["status"] == "safe":
            return "safeUnk"
        elif entry["status"] == "data":
            return "dataUnk"
        elif entry["status"] == "control":
            return "controlUnk"
        else:
            assert False


## group the functions 
def groupByClass(data, mode):
    data1 = {}
    for function in data:
        if mode == "result":
            value = getResult(data[function])
        else:
            print "Unsupported mode"
            return 0
        if value not in data1:
            data1[value] = {}
        data1[value][function] = data[function]
    return data1

def unknown_ins(entry):
    if "paths" in entry:
        for path in entry["paths"]:
            if path != 'length': ## needed because we have a length entry in the json
                pathData = entry["paths"][path]
                if pathData["unknown_ins"] > 0:
                    return True
    return False

def stackedBars(dataByLength,  intervals, ignoreParsingErrors = True, percentage = True, log=False, title="", xLabel="", yLabel=""):
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
                total = float(len([key for key in values.keys() if getResult(values[key]) != "parsing"]))
            else:
                total = float(len(values.keys()))

            safe = len([key for key in values.keys() if getResult(values[key]) == "safe" ])
            data = len([key for key in values.keys() if getResult(values[key]) == "data" ])
            ctrl = len([key for key in values.keys() if getResult(values[key]) == "control" ])
            safeUnk = len([key for key in values.keys() if getResult(values[key]) == "safeUnk" ])
            dataUnk = len([key for key in values.keys() if getResult(values[key]) == "dataUnk" ])
            ctrlUnk = len([key for key in values.keys() if getResult(values[key]) == "controlUnk" ])
            segfault = len([key for key in values.keys() if getResult(values[key]) == "segfault" ])
            timeout = len([key for key in values.keys() if getResult(values[key]) == "timeout" ])

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


  
    plt.figure(figsize=(50,10))

    p1 = plt.bar(ind, safeVals, width, color=green, edgecolor='black', log=log)
    p2 = plt.bar(ind, safeUnkVals, width, bottom=safeVals, color=green, edgecolor='black', hatch='//', log=log)
    p3 = plt.bar(ind, dataVals, width, bottom=safeVals+safeUnkVals, color=brightRed, edgecolor='black', log=log)
    p4 = plt.bar(ind, ctrlVals, width, bottom=safeVals+safeUnkVals+dataVals, color=darkRed, edgecolor='black', log=log)
    p5 = plt.bar(ind, dataUnkVals, width, bottom=safeVals+safeUnkVals+dataVals+ctrlVals, color=brightRed, edgecolor='black', hatch='//', log=log)
    p6 = plt.bar(ind, ctrlUnkVals, width, bottom=safeVals+safeUnkVals+dataVals+ctrlVals+dataUnkVals, color=darkRed, edgecolor='black', hatch='//', log=log)
    p7 = plt.bar(ind, segfaultVals, width, bottom=safeVals+dataVals+ctrlVals+safeUnkVals+dataUnkVals+ctrlUnkVals, color=yellow, edgecolor='black', log=log)
    p8 = plt.bar(ind, timeoutVals, width, bottom=safeVals+dataVals+ctrlVals+safeUnkVals+dataUnkVals+ctrlUnkVals+segfaultVals, color=blue, edgecolor='black', log=log)

    plt.ylabel(yLabel)
    plt.xlabel(xLabel)

    plt.title(title)
    plt.xticks(ind, intervals)
    # plt.yticks(np.arange(0, 101, 10))
    plt.legend((p1[0], p2[0], p3[0], p4[0], p5[0], p6[0], p7[0], p8[0],), ('safe', 'safeUnk', 'data', 'ctrl', 'dataUnk', 'ctrlUnk', 'segfault','timeout'))

    plt.show()

# def plotSizes(dataByLength,  intervals,  title="", xLabel="", yLabel="", log=False):
#     sizes = []
#     for min,max in intervals:
#         if (min,max) in dataByLength:
#             values = dataByLength[(min,max)]
#             sizes.append(len(values.keys()))
#         else:
#             sizes.append(0)

#     plt.figure(figsize=(50,10))
    
#     N = len(intervals)    
#     ind = np.arange(N)    # the x locations for the groups
#     width = 0.35    

#     p1 = plt.bar(ind, sizes, width,  edgecolor='black', title=title, xlabel=xLabel, ylabel=yLabel, log=log)


#     plt.show()

## visualize lengths
def plotValue(data, mode, title="", xLabel="", yLabel="", log=False):
    y = []
    x = []
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
        else:
            print "Unsupported mode"
            return 0
        x.append(len(x))
        y.append(val+1 if log else val)   
    # plt.scatter(x,y)
    # plt.show()

    fig = plt.figure()
    ax = plt.gca()
    ax.scatter(x ,y , c='blue', alpha=1, edgecolors='none')
    if log:
        ax.set_yscale('log')
    plt.title(title)    
    plt.xlabel(xLabel)
    plt.ylabel(yLabel)
    plt.show()

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
    safe = len(data["safe"].keys())
    dataV = len(data["data"].keys())
    ctrl = len(data["control"].keys())
    safeUnk = len(data["safeUnk"].keys())
    dataUnk = len(data["dataUnk"].keys())
    ctrlUnk = len(data["controlUnk"].keys())
    segfault = len(data["segfault"].keys())
    timeout = len(data["timeout"].keys())
    sizes = [safe, safeUnk, dataV, ctrl, dataUnk, ctrlUnk, segfault, timeout]
    explode = (0, 0, 0, 0, 0, 0, 0, 0) 
    colors = [green,green,brightRed, darkRed, brightRed, darkRed, blue, yellow]

    fig1, ax1 = plt.subplots()
    patches = ax1.pie(sizes, explode=explode, colors=colors, labels=labels, autopct='%1.1f%%',
             startangle=90)[0]

    patches[1].set_hatch('//') 
    patches[4].set_hatch('//')
    patches[5].set_hatch('//') 

    #draw circle
    centre_circle = plt.Circle((0,0),0.70,fc='white')
    fig = plt.gcf()
    fig.gca().add_artist(centre_circle)

    
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

    # plt.tight_layout()
    plt.savefig(filename)
    plt.show()

def plotDoublePie(data):
    labelsOut = ['safe', 'data', 'ctrl', 'segfault', 'timeout']
    safeAll = len(data["safe"].keys())+ len(data["safeUnk"].keys())
    dataAll = len(data["data"].keys())+len(data["dataUnk"].keys())
    ctrlAll = len(data["control"].keys())+len(data["controlUnk"].keys())
    segfault = len(data["segfault"].keys())
    timeout = len(data["timeout"].keys())
    safe = len(data["safe"].keys())
    dataV = len(data["data"].keys())
    ctrl = len(data["control"].keys())
    safeUnk = len(data["safeUnk"].keys())
    dataUnk = len(data["dataUnk"].keys())
    ctrlUnk = len(data["controlUnk"].keys())

    sizesOut = [safeAll, dataAll, ctrlAll, segfault, timeout]
    explodeOut = (0, 0, 0, 0, 0) 
    colorsOut = [green,brightRed, darkRed, blue, yellow]

    sizesIn = [safe, safeUnk, dataV, dataUnk, ctrl, ctrlUnk, segfault, timeout]
    explodeIn = (0, 0, 0, 0, 0, 0, 0, 0) 
    colorsIn = [green,green,brightRed,  brightRed, darkRed, darkRed, blue, yellow]


    plt.pie(sizesOut, labels=labelsOut, colors=colorsOut, startangle=90, pctdistance=0.85, autopct='%1.1f%%')
    patches = plt.pie(sizesIn,colors=colorsIn,radius=0.75,startangle=90)[0]
    patches[1].set_hatch('//') 
    patches[3].set_hatch('//')
    patches[5].set_hatch('//') 

    #draw circle
    centre_circle = plt.Circle((0,0),0.5,fc='white')
    fig = plt.gcf()
    fig.gca().add_artist(centre_circle)

    plt.axis('equal')
    plt.show()

    plt.show()





######## 

def stepAnalysis(data):
    intervals = generateIntervals(0,1900,100)
    dataBySteps = groupByIntervals(data, intervals, "steps")
    stackedBars(dataBySteps, intervals, ignoreParsingErrors=True, percentage=False, log=True, title="Results by steps", xLabel="Number of steps", yLabel="Number of programs")
    stackedBars(dataBySteps, intervals, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by steps", xLabel="Number of steps", yLabel="Percentage")
    plotValue(data, "steps", title="Steps", xLabel="Programs", yLabel="Number of steps", log=False)

def instructionsAnalysis(data):
    intervals = generateIntervals(0,1900,100)
    dataBySteps = groupByIntervals(data, intervals, "instructions")
    stackedBars(dataBySteps, intervals, ignoreParsingErrors=True, percentage=False, log=False, title="Results by instructions", xLabel="Number of instructions", yLabel="Number of programs")
    stackedBars(dataBySteps, intervals, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by instructions", xLabel="Number of instructions", yLabel="Percentage")
    plotValue(data, "instructions", title="instructions", xLabel="Programs", yLabel="Number of instructions", log=False)

def resultsAnalysis(data):
    dataByResult = groupByClass(data, "result")
    plotPie(dataByResult)
    plotDoublePie(dataByResult)

def timeAnalysis(data):
    dataByTime = groupByIntervals(data, generateIntervals(0,40000,5000), "totalTime")
    stackedBars(dataByTime,generateIntervals(0,40000,5000), ignoreParsingErrors=True, percentage=False, log=False)
    plotValue(data, "totalTime", title="Total Time", xLabel="Programs", yLabel="Total time", log=False)

def pathAnalysis(data):
    intervals = generateIntervals(0,30,2)
    dataByPaths = groupByIntervals(data, intervals, "paths")
    stackedBars(dataByPaths, intervals, ignoreParsingErrors=True, percentage=False, log=False, title="Results by paths", xLabel="Number of instructions", yLabel="Number of programs")
    stackedBars(dataByPaths, intervals, ignoreParsingErrors=True, percentage=True, log=False,  title="Results by paths", xLabel="Number of instructions", yLabel="Percentage")
    plotValue(data, "paths", title="Paths", xLabel="Programs", yLabel="Number of paths", log=False)

path = "/tmp/spectector_results/results_xen_clang_linked/out"
data = loadData(path)
print "Number of files "+str(len(data))

# latexify()

resultsAnalysis(data)
# pathAnalysis(data)
# instructionsAnalysis(data)
# stepAnalysis(data)
# timeAnalysis(data)



