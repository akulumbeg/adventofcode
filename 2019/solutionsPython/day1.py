# Imports -----------------------------------------------------------------
import numpy as np

# Day 1 - Part 1 ----------------------------------------------------------
with open("2019/data/day1.txt") as file:
    inp = [int(line.strip("\n")) for line in file]

inp = np.array(inp)
inp = np.floor(inp / 3) - 2

int(np.sum(inp))

# Day 1 - Part 2 ----------------------------------------------------------
with open("2019/data/day1.txt") as file:
    inp = [int(line.strip("\n")) for line in file]

inp = np.array(inp)
inp = np.floor(inp / 3) - 2

int(np.sum(inp))

