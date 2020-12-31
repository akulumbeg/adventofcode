# Day 1 - Part 1 ----------------------------------------------------------

input <- readLines("2015/data/day01.txt", warn = F) # load the data

# rule - trying to avoid looping

input <- unlist(strsplit(input, ""))    # convert to vector of individual characters
input[which(input == "(")] <- "+1"      # replace every "(" with a "+1" (string)
input[which(input == ")")] <- "-1"      # replace every ")" with a "-1" (string)
input <- as.numeric(input)              # convert to numeric. R converts also + and -

sum(input)                              # sum of +1s and -1s reveals the answer/floor

# Day 1 - Part 2 ----------------------------------------------------------

input <- readLines("2015/data/day01.txt", warn = F)

# rule - trying to avoid looping

input <- unlist(strsplit(input, ""))
input[which(input == "(")] <- "+1"
input[which(input == ")")] <- "-1"
input <- as.numeric(input)

which(cumsum(input) == -1)[1]           # every element of the vector is the addition
                                        # of itself and the element i. We are looking
                                        # for the first occurence of -1