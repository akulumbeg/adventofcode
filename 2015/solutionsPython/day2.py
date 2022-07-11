# Day 2 - Part 1 ----------------------------------------------------------
with open("2015/data/day2.txt") as file:
    inp = [line.strip("\n").split("x") for line in file]

inp = [sorted([int(j) for j in i]) for i in inp]

sides = [2*gift[0]*gift[1] + 2*gift[1]*gift[2] + 2*gift[2]*gift[0] for gift in inp]
extra = [gift[0] * gift[1] for gift in inp]
wrapper = [sides[i] + extra[i] for i in range(len(sides))]

sum(wrapper)

# Day 2 - Part 2 ----------------------------------------------------------
with open("2015/data/day2.txt") as file:
    inp = [line.strip("\n").split("x") for line in file]

inp = [sorted([int(j) for j in i]) for i in inp]
dist = [gift[0]*2 + gift[1]*2 for gift in inp]
bow = [gift[0]*gift[1]*gift[2] for gift in inp]

ribbon = [dist[i] + bow[i] for i in range(len(dist))]

sum(ribbon)
