# Part 1 ------------------------------------------------------------------
rm(list = ls())

modules <- as.data.frame(readLines("2019/data/Day1.txt"), stringsAsFactors = FALSE)
names(modules)[1] <- "mass"
modules$mass <- as.integer(modules$mass)

modules$fuel <- as.integer(floor(modules$mass / 3) - 2)  # Extremely simple math operation

sum(modules$fuel)

# Explanation:
# Doesn't get any simpler - A simple math operation solves the problem.

# Part 2 ------------------------------------------------------------------

rm(list = ls())

modules <- as.data.frame(readLines("2019/data/Day1.txt"), stringsAsFactors = FALSE)
names(modules)[1] <- "mass"
modules$mass <- as.integer(modules$mass)
modules$fuel2 <- NA  # initialize the recursive column

for (i in 1:nrow(modules)) {
  modules$fuel2[i] <- as.integer(floor(modules$mass[i] / 3) - 2) # first value inherited from mass
  helper <- modules$fuel2[i]           # helper variable to store the interim result
  
  while (modules$fuel2[i] > 0) {     # recursive while loop
    modules$fuel2[i] <- as.integer(floor(modules$fuel2[i] / 3) - 2)
    helper <- helper + modules$fuel2[i] # careful, in the last iteration it will add the negative number
  }
  
  modules$fuel2[i] <- helper - modules$fuel2[i] # fix the last added number issue
}

sum(modules$fuel2)

# Explanation:
# Pretty sure it can be solved in a nicer way with a recursive function, 
# but I chose for loops in this case.
# Withing the for loop, there is a recursive while statement, which keeps on going, 
# until the value is <= 0
# However, in the last iteration, the negative number will be added (because the evaluation happens 
# after the operation), so we need to subtract it afterwards to obtain the correct result.
