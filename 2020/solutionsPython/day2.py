# Day 2 - Part 1 ----------------------------------------------------------

with open("2020/data/day2.txt") as file:
    inp = [line.strip("\n") for line in file]

valid = 0

for row in inp:
    row = row.split()
    minmax = tuple(map(int, row[0].split("-")))
    letter = row[1][0]
    pwd = row[2]
    if minmax[0] <= pwd.count(letter) <= minmax[1]:
        valid += 1

valid

# Day 2 - Part 2 ----------------------------------------------------------

with open("2020/data/day2.txt") as file:
    inp = [line.strip("\n") for line in file]

valid = 0

for row in inp:
    row = row.split()
    position = tuple(map(int, row[0].split("-")))
    letter = row[1][0]
    pwd = row[2]
    if (pwd[position[0]-1] is letter) ^ (pwd[position[1]-1] is letter):
        valid += 1

valid