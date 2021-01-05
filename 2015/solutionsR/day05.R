# Day 5 - Part 1 ----------------------------------------------------------

input <- readLines("2015/data/day05.txt", warn = F)

input <- input[-grep("(ab)|(cd)|(pq)|(xy)", input, perl = T)] # Start with Rule 3, it is exclusive
input <- input[grep("([a-z])\\1", input, perl = T)]           # Rule 2
input <- input[grep("(.*[aeiou]){3}", input, perl = T)]       # Rule 1

length(input)

# Day 5 - Part 2 ----------------------------------------------------------

input <- readLines("2015/data/day05.txt", warn = F)

input <- input[grep("([a-z]).\\1", input, perl = T)]          # Start with Rule 2 to avoid conflict of overlap
input <- input[grep("([a-z][a-z]).*\\1", input, perl = T)]    # Rule 1

length(input)