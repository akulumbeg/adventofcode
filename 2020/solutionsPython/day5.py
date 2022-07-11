# Day 5 - Part 1 ----------------------------------------------------------

with open("2020/data/day5.txt") as file:
    inp = [line.strip("\n") for line in file]


def binpart(seat: str) -> int:

    row = seat[0:7].replace("B", "1").replace("F", "0")
    col = seat[7:10].replace("R", "1").replace("L", "0")

    row = int(row, 2)
    col = int(col, 2)

    seatID = (row * 8) + col

    return seatID


seats = [binpart(x) for x in inp]
max(seats)

# Day 5 - Part 2 ----------------------------------------------------------

with open("2020/data/day5.txt") as file:
    inp = [line.strip("\n") for line in file]


def binpart(seat: str) -> int:

    row = seat[0:7].replace("B", "1").replace("F", "0")
    col = seat[7:10].replace("R", "1").replace("L", "0")

    row = int(row, 2)
    col = int(col, 2)

    seatID = (row * 8) + col

    return seatID


seats_taken = [binpart(x) for x in inp]
seats_taken.sort()
seats_all = [x for x in range(min(seats_taken), max(seats_taken))]

set(seats_all).difference(set(seats_taken))
