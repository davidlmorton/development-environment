#!/usr/bin/env python

import argparse
import pstats

def stats(input_filename):
    p = pstats.Stats(input_filename)
    p.strip_dirs().sort_stats('time').print_stats(15)

def parse_command_line():
    parser = argparse.ArgumentParser()
    parser.add_argument('filename', help='File containing a profile.')
    return parser.parse_args()

if '__main__' == __name__:
    args = parse_command_line()
    stats(args.filename)
