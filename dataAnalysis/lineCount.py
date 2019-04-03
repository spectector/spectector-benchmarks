def isBeginFunction(line):
    chunks = line.split(":")
    if line.endswith("# @"+chunks[0]):
        return chunks[0]
    else:
        return None

def ignore(line):
    return  line.startswith("#") or line.startswith(".")

def isCall(line):
    return line.startswith("callq")

def dereference(callee):
    return callee.startswith("*")

def callee(line):
    chunks = line.split("callq")
    if len(chunks) > 2:
        assert False
    if dereference(chunks[1].strip()):
        return None
    else:
        return chunks[1].strip()

def read(file):
    lengths = {}
    deps = {}
    currentFnc = None
    total = 0
    for line in open(file):
        line = line.strip()
        total += 1
        if isBeginFunction(line) is not None:
            #function declaration
            currentFnc = isBeginFunction(line)
            lengths[currentFnc] = 0
            deps[currentFnc] = set({})
        elif  not ignore(line) and not currentFnc is None:
            lengths[currentFnc] += 1
            if isCall(line):
                target = callee(line)
                if not target == None:
                    deps[currentFnc].add(callee(line))
    print "Total lines: %d"%total
    return (lengths,deps)

def recursiveLengths(lengths, deps):
    recLengths = {}
    change = True
    while change:
        change = False
        for f in lengths.keys():
            # if f == "unxz":
            value = lengths[f]
            for dp in deps[f]:
                if dp != f:
                    value += recLengths[dp] if dp in recLengths.keys() else (lengths[dp] if dp in lengths.keys() else 0)
            if  not f in recLengths.keys(): # or not recLengths[f] == value:
                change = True
                # print "Update %s from %d to %d"%(f,recLengths[f] if f in recLengths.keys() else 0,value )
                recLengths[f] = value
    return recLengths

lengths, deps = read("/Users/marco/spectector-results/general.s")
deepLengths = recursiveLengths(lengths, deps)
max = 0
key = None
for f in deepLengths.keys():
    if deepLengths[f] > max:
        max = deepLengths[f]
        key = f

import json
with open('/Users/marco/spectector-results/sizes.json', 'w') as outfile:
    json.dump(deepLengths, outfile)