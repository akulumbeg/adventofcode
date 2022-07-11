# Imports
import json
import numpy as np

# Day 2 - Part 1 ----------------------------------------------------------

with open("2016/data/day2.txt") as file:
    inp = [line.strip("\n") for line in file]

coords = []

coords = [[json.loads(char.replace("U", "[0, 1]")
                          .replace("D", "[0, -1]")
                          .replace("R", "[1, 0]")
                          .replace("L", "[-1, 0]")) for char in string] for string in inp]
    
coords = [json.loads(string) for string in coords]
