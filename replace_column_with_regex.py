#!/usr/bin/python
# -*- coding: utf-8 -*-
#coding=utf-8


import xlwt
import xlrd
import sys
import re

reload(sys) 
sys.setdefaultencoding('utf8')


wb = xlrd.open_workbook('test.xlsx','r')
sh = wb.sheet_by_index(0)
sheetdict = {}
# read and replace
for row_num in range(sh.nrows):
    raw_string = sh.cell(row_num,2).value
    string_regex = re.search('[^:]*$', raw_string)
    if string_regex:
        sheetdict[row_num] = string_regex.group(0)
    else:
        sheetdict[row_num] = raw_string

# write
f = xlwt.Workbook(encoding = 'utf-8')
table = f.add_sheet('regexed', cell_overwrite_ok = True)
for row_num in sheetdict.keys():
    table.write(row_num, 0, sheetdict[row_num])
f.save('ret.xls')

