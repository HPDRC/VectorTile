#!/usr/bin/python
import sys
import mapnik
import os.path

class DLayer:
    def __init__(self, description):
        tmp = description.split(',')
        self.name = tmp[0]
        self.minlevel = int(tmp[1])
        self.maxlevel = int(tmp[2])
        self.contained = False

    def printme(self):
        print '%s,%d,%d' % (self.name, self.minlevel, self.maxlevel)

class DGroup:
    def __init__(self, description):
        tmp = description.split(',')
        self.name = tmp[0]
        self.layers = tmp[1:]
        self.minlevel = -1
        self.maxlevel = -1

    def calcRange(self, dlayers):
        for dl in dlayers:
            hasLayer = False
            for layer in self.layers:
                if (dl.name == layer):
                    hasLayer = True
                    break
            if (hasLayer):
                dl.contained = True
                if (self.minlevel == -1):
                    self.minlevel,self.maxlevel = dl.minlevel, dl.maxlevel
                else:
                    if (self.minlevel>dl.maxlevel+1 or self.maxlevel<dl.minlevel-1):
                        print 'Cannot merge level range for %s,%d,%d and %s,%d,%d' % (self.name, self.minlevel, self.maxlevel, dl.name, dl.minlevel, dl.maxlevel)
                        exit()
                    else:
                        newmin = min(self.minlevel,dl.minlevel)
                        newmax = max(self.maxlevel,dl.maxlevel)
                        self.minlevel,self.maxlevel = newmin,newmax
         
    def printme(self):
        print '%s,%d,%d' % (self.name, self.minlevel, self.maxlevel)

if len(sys.argv) != 3:
    print 'Usage: ./calc_group_range.py "dataLayer_string" "dataGroup_string"'
    exit()

dataLayer = sys.argv[1]
dataGroup = sys.argv[2]
dlayers = []
dgroups = []
for description in dataLayer.split(';'):
    dlayers.append(DLayer(description))
for description in dataGroup.split(';'):
    dgroups.append(DGroup(description))
for dg in dgroups:
    dg.calcRange(dlayers)
for dl in dlayers:
    if (True != dl.contained):
        dl.printme()
for dg in dgroups:
    dg.printme()
