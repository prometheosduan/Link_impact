#!/usr/bin/python
# -*- coding: utf-8 -*-
#coding=utf-8


import xlwt
import xlrd
import sys
from datetime import datetime

reload(sys)
sys.setdefaultencoding('utf8')
wb = xlrd.open_workbook('test.xlsx','r')
sh = wb.sheet_by_index(0)
before_june = []
after_june = []

# read and divide into list
for row_num in range(sh.nrows):
    if row_num != 0:
        time_str = sh.cell(row_num, 1).value
        time = datetime.strptime(time_str, "%Y-%m-%d %H:%M:%S.%f+00:00")
        if time < datetime(2016, 6, 1, 00, 00):
            before_june.append(sh.cell(row_num, 2).value)
        else:
            after_june.append(sh.cell(row_num, 2).value)

# write into different xls
f = xlwt.Workbook(encoding='utf-8')
table_before = f.add_sheet('before_june', cell_overwrite_ok=True)
table_after = f.add_sheet('after_june',  cell_overwrite_ok=True)
row_num_before = 0
row_num_after = 0
for text in before_june:
    table_before.write(row_num_before, 0, text)
    row_num_before += 1
for text in after_june:
    table_after.write(row_num_after, 0, text)
    row_num_after += 1


f.save('divided.xls')