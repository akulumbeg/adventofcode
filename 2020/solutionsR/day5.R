# Day 5 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day5.txt", warn = F)

binpart <- function(inst){
                                           # for every instruction:
  inst <- gsub("(B|R)", "1", inst)         # replace Bs and Rs with 1
  inst <- gsub("(F|L)", "0", inst)         # replace Fs and Ls with 0
                                           # ultimately, you get a binary number
  row <- as.integer(substr(inst, 1, 7))    # retype the first part of the instruction
  col <- as.integer(substr(inst, 8, 10))   # retype the second part of the instruction
  
  row <- strtoi(row, base = 2)             # translate to decimal
  col <- strtoi(col, base = 2)             # translate to decimal
    
  seatID <- (row * 8) + col                # seat ID as per the assignment
  return(seatID)
}

max(sapply(input, binpart))                # find the highest seat ID

# and yes, this can be shortened by magrittr/pipe,
# but I am sticking to base R where possible


#### My original solution ####
# works perfectly, but is very cumbersome and uses for loops :(
# the idea was to iterate through every letter in the instruction
# and do the binary halving manually
# I completely forgot that this can be simply translated to binary code...

# binpart <- function(inst) {
#   row <- c(0, 127)
#   col <- c(0, 7)
#   
#   rowinst <- substr(inst, 1, 7)
#   colinst <- substr(inst, 8, 10)
#   
#   for (rows in unlist(strsplit(rowinst, ""))) {
#     range <- row[2] - row[1]
#     
#     if (rows == "F") {
#       range <- floor(range / 2)
#       row[2] <- row[1] + range
#       
#     } else if (rows == "B") {
#       range <- floor(range / 2)
#       row[1] <- row[2] - range
#       
#     }
#   }
#   
#   row <- row[1]
#   
#   for (cols in unlist(strsplit(colinst, ""))) {
#     range <- col[2] - col[1]
#     
#     if (cols == "L") {
#       range <- floor(range / 2)
#       col[2] <- col[1] + range
#       
#     } else if (cols == "R") {
#       range <- floor(range / 2)
#       col[1] <- col[2] - range
#       
#     }
#   }
#   
#   col <- col[1]
#   
#   seatID <- (row * 8) + col
#   return(seatID)
# }
# 
# max(sapply(input, binpart))

# Day 5 - Part 2 ----------------------------------------------------------

input <- readLines("2020/data/day5.txt", warn = F)

binpart <- function(inst){
                                           # for every instruction:
  inst <- gsub("(B|R)", "1", inst)         # replace Bs and Rs with 1
  inst <- gsub("(F|L)", "0", inst)         # replace Fs and Ls with 0
                                           # ultimately, you get a binary number
  row <- as.integer(substr(inst, 1, 7))    # retype the first part of the instruction
  col <- as.integer(substr(inst, 8, 10))   # retype the second part of the instruction
  
  row <- strtoi(row, base = 2)             # translate to decimal
  col <- strtoi(col, base = 2)             # translate to decimal
  
  seatID <- (row * 8) + col                # seat ID as per the assignment
  return(seatID)
}

seats_taken <- sort(sapply(input, binpart))                 # get taken seat IDs and sort them
                                                            # identical to previous solution
seats_all <- seq(from = min(seats_taken), to = max(seats_taken), by = 1)  # get all possible seat IDs knowing
                                                            # that our seat isn't min nor max

setdiff(seats_all, seats_taken)                             # subtract one from another, the seat
                                                            # which is not in "taken" is our seat!
