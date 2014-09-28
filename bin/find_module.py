import sys
import imp
import os.path

try:
    where = imp.find_module(sys.argv[1])[1]
    print os.path.dirname(where)
except IndexError:
    print '.'
    sys.exit(1)
