# Imports

from scipy.spatial.distance import cityblock

# Day 1 - Part 1 ----------------------------------------------------------

with open("2016/data/day1.txt") as file:
    inp = file.readline().split(", ")

rotation = {"L": 1, "R": -1}

coords = [0, 0]
direction = 0

for command in inp:
    rot = command[0]
    step = int(command[1:])

    if step == "R":
        direction =+ 90
        if direction == 360:
            direction = 0
    else:
        direction =- 90
        if direction == -90:
            direction = 270

    match direction:
        case 0:
            coords[1] += step
        case 90:
            coords[0] += step
        case 180:
            coords[1] -= step
        case 270:
            coords[0] -= step


coords

cityblock([0, 0], [-915, 0])





with open('2016/data/day1.txt', 'r') as infile:
    directions = infile.readline().split(', ')

ROTATION = {
    'L': 1j,
    'R': -1j
}

current_direction = 1j
location = 0+0j

visited_locations = set()
passed_twice = False


def find_manhattan(loc):
    return int(abs(loc.real) + abs(loc.imag))


for instruction in directions:
    rot, dist = instruction[0], int(instruction[1:])
    current_direction *= ROTATION[rot]

    for _ in range(dist):
        location += current_direction
        if not passed_twice and location in visited_locations:
            print("This looks familiar! "
                  f"I must have been at {location} before!")
            print("The distance from the start is:", find_manhattan(location))
            passed_twice = True
        else:
            visited_locations.add(location)

print('....')
print("Ok, I've come to the end of your instructions and I'm at:", location)
print(f"That's {find_manhattan(location)} blocks away from the the start.")