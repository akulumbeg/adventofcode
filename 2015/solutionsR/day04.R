# Day 4 - Part 1 ----------------------------------------------------------

input <- readLines("2015/data/day04.txt", warn = F) # load the data

input <- paste0(input, 1:250000) # 250000 is a wild guess

# I have to break my rule of not using external packages
# because I cannot code an md5 generator from scratch

install.packages("digest")
library(digest)

outcome <- sapply(input, function(x) digest(x, algo = "md5", serialize = F))
# perform the function on every element of the large char vector
# serialize = F assures consistency with online md5 generators

which(grepl("^00000", outcome, perl = T, useBytes = T)) # which element starts with 5 0s?

# Day 4 - Part 2 ----------------------------------------------------------

input <- readLines("2015/data/day04.txt", warn = F) # load the data

input <- paste0(input, 1:5000000) # 5000000 is a also a guess

# I have to break my rule of not using external packages
# because I cannot code an md5 generator from scratch

install.packages("digest")
library(digest)

outcome <- sapply(input, function(x) digest(x, algo = "md5", serialize = F))
# perform the function on every element of the large char vector
# serialize = F assures consistency with online md5 generators

which(grepl("^000000", outcome, perl = T, useBytes = T)) # which element starts with 6 0s?
                                                         # might take a bit at first