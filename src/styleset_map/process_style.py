#!/usr/bin/python
import sys
import mapnik
import os.path

pathDefault = '/tileservice/run/OSMBright/style.xml'
if len(sys.argv) != 2:
    if (len(sys.argv) == 1 and os.path.isfile(pathDefault)):
        path = pathDefault
    else:
        print 'Usage: ./process_style.py PATH_OF_STYLE_XML\nYou can use >> to append output to renderd.conf file and then move it to after ATTRIBUTION='
        exit()
else:
    path = sys.argv[1]

def GetLevelFromRule(rootScale, rule):
    minLevel, maxLevel = -1, -1
    for i in range(0,30):
        scale = rootScale / (1 << i)
        if (scale <= rule.max_scale):
            minLevel = i
            break
    else:
        minLevel = 0

    for i in xrange(30,0,-1):
        scale = rootScale / (1 << i)
        if (scale >= rule.min_scale):
            maxLevel = i
            break
    else:
        maxLevel = 30

    if (maxLevel < minLevel):
        maxLevel = minLevel

    return minLevel, maxLevel


m = mapnik.Map(256, 256)
mapnik.load_map(m, path)
m.zoom_all()
rootScale = m.scale_denominator()
text = ''

for layer in m.layers:
    minLevel, maxLevel = -1, -1
    for styleName in layer.styles:
        try:
            style = m.find_style(styleName)
        except KeyError:
            print 'Error: style not found: ' + styleName
            exit()

        for rule in style.rules:
            minl, maxl = GetLevelFromRule(rootScale, rule)
            if (minLevel == -1):
                minLevel, maxLevel = minl, maxl
                continue
            if (minl < minLevel):
                minLevel = minl
            if (maxl > maxLevel):
                maxLevel = maxl

    text += layer.name + ',' +  str(minLevel) + ',' + str(maxLevel) + ";"

print text[:-1]
