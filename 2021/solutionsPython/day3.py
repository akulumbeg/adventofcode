# Imports -----------------------------------------------------------------
from turtle import pos
import numpy as np
import pandas as pd

# Day 3 - Part 1 ----------------------------------------------------------

with open("2021/data/day3.txt") as file:
    inp = [line.strip("\n") for line in file]

most_common = ""
least_common = ""

for i in range(len(inp[0])):
    holder = ""
    for number in inp:
        holder = holder + number[i]
    if holder.count("1") >= holder.count("0"):
        most_common += "1"
        least_common += "0"
    else:
        most_common += "0"
        least_common += "1"

print(int(most_common, 2) * int(least_common, 2))

# Day 3 - Part 2 ----------------------------------------------------------

with open("2021/data/day3.txt") as file:
    inp = [line.strip("\n") for line in file]

most_common = ""
least_common = ""

for i in range(len(inp[0])):
    holder = ""
    for number in inp:
        holder = holder + number[i]
    if holder.count("1") >= holder.count("0"):
        most_common += "1"
        least_common += "0"
    else:
        most_common += "0"
        least_common += "1"
        

oxygen = inp
co2 = inp

for position in most_common:
    print()
    
    
    for number in oxygen:
        if number[position] == most_common[position.index()]:
            pass
        else:
            oxygen.remove(number)




