# Day 1 - Part 1 ----------------------------------------------------------

input <- as.integer(readLines("2020/data/day1.txt", warn = F))                                   
input2 <- input                      # make a copy

combinations <- expand.grid(input, input2)
# grid of all possible combinations of elements
solmatrix <- combinations[which(combinations[1] + combinations[2] == 2020),]
# which combinations when summed add up to 2020? choose these
# result - 2x2 matrix created - 2 elements yield 2 combinations

numbers <- solmatrix[1,]             # only the first combination needed
(numbers <- as.integer(numbers))     # retype and print out
sum(numbers)                         # check - the numbers sum to 2020
prod(numbers)                        # answer - product

#### Alternative solution ####
# input <- as.integer(readLines("2020/data/day1.txt"))
# input2 <- 2020 - input
# 
# inputs <- cbind(input, input2)
# numbers <- names(sort(table(inputs), decreasing = T)[1:2])
# (numbers <- as.integer(numbers))
# sum(numbers)
# prod(numbers)

# Day 1 - Part 2 ----------------------------------------------------------

input <- as.integer(readLines("2020/data/day1.txt", warn = F))
input2 <- input                      # 2 copies needed
input3 <- input                      # as we are combining 3 elements
                                  
combinations <- expand.grid(input, input2, input3)
# grid of all possible combinations of elements
solmatrix <- combinations[which(combinations[1] + combinations[2] + combinations[3] == 2020),]
# which combinations when summed add up to 2020? choose these
# result - 6x3 matrix created - 3 elements yield 6 combinations

numbers <- solmatrix[1,]             # only the first combination needed
(numbers <- as.integer(numbers))     # retype and print out
sum(numbers)                         # check - the numbers sum to 2020
prod(numbers)                        # answer - product