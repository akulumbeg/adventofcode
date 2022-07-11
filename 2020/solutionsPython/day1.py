# Imports
from itertools import combinations
from math import prod

# Day 1 - Part 1 ----------------------------------------------------------

with open("2020/data/day1.txt") as file:
    inp = [int(line) for line in file]

combo = list(combinations(inp, 2))

combosum, combomul = [sum(x) for x in combo], [prod(x) for x in combo]

combomul[combosum.index(2020)]

# Creating a list of sums of each combination tuple
# and a list of products of each combo
# then find the index of which tuple/combination sums to 2020
# and take the product on the same position

# Day 1 - Part 2 ----------------------------------------------------------

with open("2020/data/day1.txt") as file:
    inp = [int(line) for line in file]

combo = list(combinations(inp, 3))

cmbsum, cmbprod = [sum(x) for x in combo], [prod(x) for x in combo]

cmbprod[cmbsum.index(2020)]
