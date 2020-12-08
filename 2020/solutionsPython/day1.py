# Day 1 - Part 1 ----------------------------------------------------------

input = open("2020/data/day1.txt", mode="w+")

input <- as.integer(readLines("2020/data/day1.txt", warn = F)) 

combinations <- expand.grid(input, input)
# grid of all possible combinations of elements
solmatrix <- combinations[which(rowSums(combinations) == 2020),]
# which combinations when summed add up to 2020? choose these
# result - 2x2 matrix created - 2 elements yield 2 combinations

(numbers <- as.integer(solmatrix[1,]))# retype and print out
sum(numbers)                          # check - the numbers sum to 2020
prod(numbers)                         # answer - product

#### Alternative solution ####
# input <- as.integer(readLines("2020/data/day1.txt"))
# input2 <- 2020 - input
# 
# inputs <- cbind(input, input2)
# numbers <- names(sort(table(inputs), decreasing = T)[1:2])
# (numbers <- as.integer(numbers))
# sum(numbers)
# prod(numbers)
