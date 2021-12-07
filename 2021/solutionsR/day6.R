# Day 6 - Part  1 ----------------------------------------------------------

input <- scan("2021/data/day6.txt", sep=",")

# Instead of keeping track of all fish, we can aggregate them based on their timer
# which is computationally MUCH more efficient
# we start with 1-5, and other values are 0, 6, 7 and 8

input <- c(0, unname(table(input)),0,0,0) # 0 fish with timer 0, 0 with timer 6 etc.

days <- 0 # initialize the iterator

while (days < 80){
  
  # for 80 days, every day:
  
  fish <- c(input[-1], input[1])  # timer shifts by 1 for every fish 
                                  # (e.g. 109 fish with timer 1 will become
                                  # 109 fish with timer 0)
                                  # all the 0 fish are removed
                                  # and the same number is added to the end with timer 8
  
  fish[7] <- fish[7] + input[1]   # the same number of fish that reached the zero timer
                                  # will reset with the value of 6 
                                  # (counting from 0, the 7th position)
  
  input <- fish                   # the outcome of this operation 
                                  # becomes the new input for the next day
  
  days <- days + 1                # increment the iterator
  
}

# the result is the sum of all fish binned in every timer value
sum(fish)

# DO NOT USE FOR PART 2
# THIS WORKS PERFECTLY FOR 80 DAYS, BUT IT IS VERY INEFFICIENT (STUPID) 
# BECAUSE IT CAUSES A MEMORY OVERFLOW 

# days <- 0
# 
# while (days < 80) {
#   
#   zeros <- length(which(input == 0))
#   zero_pos <- which(input==0)
#   
#   input[which(input != 0)] <- input[which(input != 0)] - 1
#   
#   input[zero_pos] <- 6
#   
#   input <- c(input, rep(8, zeros))
#   
#   days <- days + 1
# 
# }
# 
# length(input)

# Day 6 - Part 2 ----------------------------------------------------------

input <- scan("2021/data/day6.txt", sep=",")

input <- c(0, unname(table(input)),0,0,0)

days <- 0

# same as before, just for 256 days

while (days < 256){
  
  fish <- c(input[-1], input[1])
  
  fish[7] <- fish[7] + input[1]
  
  input <- fish
  
  days <- days + 1
  
}

sum(fish)