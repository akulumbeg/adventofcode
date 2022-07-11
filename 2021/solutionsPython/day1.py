# Imports -----------------------------------------------------------------
import numpy as np
import pandas as pd

# Day 1 - Part 1 ----------------------------------------------------------

with open("2021/data/day1.txt") as file:
    inp = [int(line.strip("\n")) for line in file]

print(np.sum(np.diff(inp) > 0))

# Day 1 - Part 2 ----------------------------------------------------------

with open("2021/data/day1.txt") as file:
    inp = [int(line.strip("\n")) for line in file]

inp = pd.DataFrame(inp)
print(sum(inp.iloc[:, 0].diff(3) > 0))
