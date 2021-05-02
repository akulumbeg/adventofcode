# Day 2 - Part 1 ----------------------------------------------------------
with open("2015/data/day02.txt") as data:
    aoc_input = data.read().splitlines()

# done through list comprehension

aoc_input = [i.split("x") for i in aoc_input]                         # split into three-element-sublists
aoc_input = [sorted([int(j) for j in i]) for i in aoc_input]          # sort dimensions in each sublist

sides = [2*e[0]*e[1] + 2*e[1]*e[2] + 2*e[2]*e[0] for e in aoc_input]  # sublist == all sides combined
extra = [elem[0] * elem[1] for elem in aoc_input]                     # extra paper is the product of 2 shortest sides
wrapper = [sides[i] + extra[i] for i in range(len(sides))]            # sum sides and extra paper of each present

sum(wrapper)                                                          # sum the list to get all paper needed

# Day 2 - Part 2 ----------------------------------------------------------
with open("2015/data/day02.txt") as data:
    aoc_input = data.read().splitlines()

aoc_input = [i.split("x") for i in aoc_input]                         # split into three-element-sublists
aoc_input = [sorted([int(j) for j in i]) for i in aoc_input]          # sort dimensions in each sublist

dist = [elem[0]*2 + elem[1]*2 for elem in aoc_input]                  # 2 shortest distances across smallest sides
bow = [elem[0]*elem[1]*elem[2] for elem in aoc_input]                 # bow of each present as defined

ribbon = [dist[i] + bow[i] for i in range(len(dims))]                 # sum the distances and bow of each present

sum(ribbon)                                                           # sum the list to get all ribbon needed
