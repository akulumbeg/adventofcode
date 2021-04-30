# Day 1 - Part 1 ----------------------------------------------------------
with open("2015/data/day01.txt") as data:
    aoc_input = data.read()

print(sum(+1 if inst == "(" else -1 for inst in aoc_input))

# one-liner using the ternary operator and the fact that python can evaluate
# int +1+1+1-1 as 2 implicitly

# Day 1 - Part 2 ----------------------------------------------------------
with open("2015/data/day01.txt") as data:
    aoc_input = data.read()

floor, pos = 0, 0          # position would be 1, but python iterates from 0
for inst in aoc_input:
    if floor == -1:
        print(pos)
        break
    else:
        if inst == "(":
            floor += 1
        else:
            floor -= 1
    pos += 1

print(pos)
