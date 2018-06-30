#!/usr/bin/python
# -*- coding: utf-8 -*-

import sqlite3 as lite
import sys
import os.path

con = lite.connect('/tmp/.output.db')

with con:
    cur = con.cursor()
    cur.execute("create table cache (id INTEGER PRIMARY KEY,domain TEXT,type TEXT, result TEXT)")
    file = open("/tmp/.unbound-cache.tmp", "r")
    for line in file:
        if "    " in line:
            ar_line = line.split()
            cur.execute("insert into cache (domain,type,result) VALUES (?,?,?)", (ar_line[0], ar_line[3], ar_line[4])),

