# Day 4 - Part 1 ----------------------------------------------------------

# Most likely done easier through NumPy but I wanted to use only basic Python for this one
# might add a numpy solution later

from hashlib import md5                                         # importing hashlib for md5

with open("2015/data/day04.txt") as data:
    aoc_input = data.read()

numbers = [aoc_input+str(i) for i in list(range(1, 250001))]    # Create a list of numbers 1 to 250000 and append
                                                                # each number to the string obtained from data
                                                                # 250000 is just a guess

hashes = [md5(i.encode()).hexdigest() for i in numbers]         # MD5 hash of every element in the list
hashes = [x.startswith("00000") for i, x in enumerate(hashes)]  # Convert the hashes to true if they start with 00000

print(min([i+1 for i, val in enumerate(hashes) if val]))        # Print the position (index+1, Python starts with 0)
                                                                # of the first (in this case the only) appearance

# Day 4 - Part 2 ----------------------------------------------------------

# The code is the same here, so no comments. The only difference is creation of 5000000 numbers (also a wild guess).

from hashlib import md5

with open("2015/data/day04.txt") as data:
    aoc_input = data.read()

numbers = [aoc_input+str(i) for i in list(range(1, 5000001))]

hashes = [md5(i.encode()).hexdigest() for i in numbers]
hashes = [x.startswith("000000") for i, x in enumerate(hashes)]

print(min([i+1 for i, val in enumerate(hashes) if val]))
