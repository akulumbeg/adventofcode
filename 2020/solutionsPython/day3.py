# Day 3 - Part 1 ----------------------------------------------------------

with open("2020/data/day3.txt") as file:
    inp = [line.strip("\n") for line in file]


def slope(right, down):
    trees = 0
    i, j = 0, 0

    width = len(inp[0])

    while not i >= len(inp)-1:

        j += right
        i += down

        if j >= width:
            j -= width
        if inp[i][j] == "#":
            trees += 1

    return trees


slope(3, 1)


# Day 3 - Part 2 ----------------------------------------------------------


with open("2020/data/day3.txt") as file:
    inp = [line.strip("\n") for line in file]


def slope(right, down):
    trees = 0
    i, j = 0, 0

    width = len(inp[0])

    while not i >= len(inp)-1:

        j += right
        i += down

        if j >= width:
            j -= width
        if inp[i][j] == "#":
            trees += 1

    return trees

slope(1,1) * slope(3,1) * slope(5,1) * slope(7,1) * slope(1,2)
