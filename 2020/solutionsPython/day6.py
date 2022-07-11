# Imports

from itertools import groupby

# Day 5 - Part 1 ----------------------------------------------------------

with open("2020/data/day6.txt") as file:
    inp = [line.strip("\n") for line in file]

inp = [list(s) for e, s in groupby(inp, key=bool) if e]
inp = [''.join(x) for x in inp]
inp = sum([len(set(x)) for x in inp])

inp

# Day 5 - Part 2 ----------------------------------------------------------

