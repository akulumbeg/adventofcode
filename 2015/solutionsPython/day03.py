# Day 3 - Part 1 ----------------------------------------------------------
with open("2015/data/day03.txt") as data:
    aoc_input = data.read()

# using tuples, which are immutable

char = ('>', '<', '^', 'v')                                       # tuple holding possible characters
posx = (1, -1, 0, 0)                                              # tuple holding x values for characters
posy = (0, 0, 1, -1)                                              # tuple holding y values for characters

coord = (0, 0)
coords = set()                                                     # set is Python's datatype that only holds unique values
coords.add(coord)                                                  # add initial position (0, 0)

for i in aoc_input:
    n = char.index(i)                                              # n is the index of the currently iterated command
    coord = (coord[0] + posx[n], coord[1] + posy[n])               # current coord is the previous coord updated by the position
    coords.add(coord)                                              # add to the coords set

print(len(coords))                                                 # print coords set (only unique values)

# Day 3 - Part 2 ----------------------------------------------------------

with open("2015/data/day03.txt") as data:
    aoc_input = data.read()

char = ('>', '<', '^', 'v')                                        # tuple holding possible characters
posx = (1, -1, 0, 0)                                               # tuple holding x values for characters
posy = (0, 0, 1, -1)                                               # tuple holding y values for characters

coord_s = (0, 0)                                                   # santa's initial coords
coord_rs = (0, 0)                                                  # robo-santa's initial coords
coords = set()                                                     # create a set (unique values only)
coords.add((0,0))                                                  # add the initial position. It's (0,0) for both, so adding once is enough

for i, x in enumerate(aoc_input):
    n = char.index(x)                                              # n is the index of the currently iterated command
    if i % 2 == 0:                                                 # if divisible by 2, it's santa' command
        coord_s = (coord_s[0] + posx[n], coord_s[1] + posy[n])     # current coord = prev coord updated by the position
        coords.add(coord_s)                                        # add santa's coord
    else:                                                          # if not divisible by 2, it's robosanta's command
        coord_rs = (coord_rs[0] + posx[n], coord_rs[1] + posy[n])  # current coord = prev coord updated by the position
        coords.add(coord_rs)                                       # add robosanta's coord

print(len(coords))