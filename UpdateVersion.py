import os, sys

versionFilePath = sys.argv[1]

version = int([line.rstrip() for line in file(versionFilePath)][0]) + 1

versionFile = open(versionFilePath, 'w')
versionFile.write("%i" % version)
versionFile.close()
