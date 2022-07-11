# Imports -----------------------------------------------------------------
import numpy as np
import pandas as pd

# Day 2 - Part 1 ----------------------------------------------------------

with open("2021/data/day2.txt") as file:
    inp = [line.strip("\n")
               .replace("forward", "0")
               .replace("up", "-1")
               .replace("down", "1")
               .split(" ") for line in file]
    
inp = np.array([[int(x) for x in element] for element in inp])
inp = sum(inp)


# Day 2 - Part 2 ----------------------------------------------------------

with open("2021/data/day2.txt") as file:
    inp = [line.strip("\n") for line in file]