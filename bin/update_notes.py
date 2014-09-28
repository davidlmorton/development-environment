#!/usr/bin/python
import sys
from datetime import datetime, timedelta
from subprocess import call
import tempfile
import re

DATE_FORMAT = r'%A %B %d, %Y'

def get_latest_date(filename):
    with open(filename, 'r') as infile:
        for line in infile.readlines():
            match = re.search(r"^==== (.*) ====", line)
            if match is not None:
                return datetime.strptime(match.group(1), DATE_FORMAT).date()

def new_dates(latest_date, num_days):
    last_date = datetime.today().date() + timedelta(days=num_days)
    if last_date <= latest_date:
        return []
    else:
        dates = [last_date]
        while(dates[-1] > latest_date + timedelta(days=1)):
            dates.append(dates[-1] - timedelta(days=1))
        return dates

def print_dates(dates, outfile):
    for date in dates:
        outfile.write("==== %s ====\n" % date.strftime(DATE_FORMAT))

def update_dates(filename, num_days):
    latest_date = get_latest_date(filename)

    outfile = tempfile.NamedTemporaryFile(mode='w', delete=False)
    print_dates(new_dates(latest_date, num_days), outfile)
    outfile.close()

    tmpfile = tempfile.NamedTemporaryFile(mode='w', delete=False)
    call(['cat', outfile.name, filename], stdout=tmpfile)
    tmpfile.close()
    call(['mv', '-f', tmpfile.name, filename])
    call(['rm', '-f', tmpfile.name, outfile.name])

if __name__ == '__main__':
    filename = sys.argv[1]
    num_days = int(sys.argv[2])
    update_dates(filename, num_days)
