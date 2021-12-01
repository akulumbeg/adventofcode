# Day 1 - Part 1 ----------------------------------------------------------

input <- as.integer(readLines("2021/data/day1.txt", warn = F)) 

length(which(diff(input) > 0)) 
# the length of vector of differences which are larger than 0

# an even shorter alternative:
sum(diff(input) > 0)

# Day 1 - Part 2 ----------------------------------------------------------

input <- as.integer(readLines("2021/data/day1.txt", warn = F))

length(which(diff(input, lag = 3) > 0))
# the length of vector of differences lagged by 3 which are larger than 0

# an even shorter alternative:
sum(diff(input, lag = 3) > 0)
