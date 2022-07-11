# Imports -----------------------------------------------------------------
from dis import Instruction
import numpy as np
import json

# Day 6 - Part 1 ----------------------------------------------------------

with open("2015/data/day6.txt") as file:
    inp = [line.strip("\n")
               .removeprefix("turn ")
               .replace(" through ", " ")
               .split(" ") for line in file]

grid = np.zeros((1000, 1000))

for instruction in inp:
    start = np.array(json.loads("[" + instruction[1] + "]"))
    end = np.array(json.loads("[" + instruction[2] + "]"))
    coords = []
    match instruction[0]:
        case "on":
            grid[coords[0], coords[1]] = 1
        case "off":
            grid[coords[0], coords[1]] = 0
        case "toggle":
            if grid[coords[0], coords[1]] == 0:
                grid[coords[0], coords[1]] == 1
            else:
                grid[coords[0], coords[1]] == 0
                

grid.sum()
