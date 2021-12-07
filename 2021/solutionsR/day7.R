# Day 7 - Part 1 ----------------------------------------------------------

input <- scan("2021/data/day7.txt", sep=",")

# median value is implicitly the most optimal
fuel <- abs(input - median(input))  # take the abs distance of each element 
                                    # from median
sum(fuel)                           # add everything up

# Day 7 - Part 2 ----------------------------------------------------------

input <- scan("2021/data/day7.txt", sep=",")

# the formula for the linearly increasing fuel cost
# can be expressed as n * ((n+1)/2), where n is the distance
fpd <- function(dist) {
  dist * (dist + 1) / 2
}                      

# the most efficient distances is the one closest to the mean
# the fpd function produces fuel per crab's distance
fuel <- fpd(abs(floor(mean(input)) - input))

sum(fuel)                           # add everything up