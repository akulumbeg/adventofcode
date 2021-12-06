# Day 5 - Part 1 ----------------------------------------------------------

input <- readLines("2021/data/day5.txt", warn = F)
input <- gsub(" -> ", ",", input)
input <- as.integer(unlist(strsplit(input, ",")))
input <- matrix(input, ncol = 4, byrow = T)

# consider only horizontal or vertical lines
input <- input[ (input[,1] == input[,3] | input[,2] == input[, 4]) , ] #347 rows

grid <- array(0, c(max(input), max(input))) # sparse matrix 989x989

for (i in 1:nrow(input)) {                  # for each row in coords
  
  if(input[i,1] == input[i,3]) {            # if X coords remain the same
    
    for(j in seq(from = input[i,2], to = input[i,4])) { # seq from y1 to y2 by 1
      
      grid[input[i,1], j] <- grid[input[i,1], j] + 1    # increase every coordinate's number by 1 
    }
    
  } else if (input[i,2] == input [i,4]) {   # if y coords remain the same
    
    for(j in seq(from = input[i,1], to = input[i,3])) { # seq from x1 to x2 by 1
      
      grid[j, input[i,2]] <- grid[j, input[i,2]] + 1    # increase every coordinate's number by 1 
    }
    
  } else {
    print("Invalid coordinates")
  }
  
}

sum(grid > 1)     # sum all TRUEs where the value of a given coord is more than 1



# Day 5 - Part 2 ----------------------------------------------------------


input <- readLines("2021/data/day5.txt", warn = F)
input <- gsub(" -> ", ",", input)
input <- as.integer(unlist(strsplit(input, ",")))
input <- matrix(input, ncol = 4, byrow = T)

grid <- array(0, c(max(input), max(input)))

for (i in 1:nrow(input)) {
  
  if(input[i,1] == input[i,3]) {
    
    for(j in seq(from = input[i,2], to = input[i,4])) {
      
      grid[input[i,1], j] <- grid[input[i,1], j] + 1
    }
    
  } else if (input[i,2] == input [i,4]) {
    
    for(j in seq(from = input[i,1], to = input[i,3])) {
      
      grid[j, input[i,2]] <- grid[j, input[i,2]] + 1
      
    }
    
    # additional condition - if neither x1=x2 nor y1=y2
  } else if (input[i,2] != input[i,4] & input[i,1] != input[i,3]) {
    
    
    # if diagonals can only be increased by [1,1], it must mean that 
    # difference between x1 and x2 is the same as between y1 and y2
    # hence, it is certain that both sequences will have the same length
    
    # construct a nx2 matrix where n is the number of sequenced numbers
    # for x and y coords
    
    diag <- matrix(data = c(seq(from = input[i,1], to = input[i,3]), 
                            seq(from = input[i,2], to = input[i,4])),
                            ncol = 2, byrow = F)
    
    # for every row of this matrix
    for (j in 1:nrow(diag)) {
      
      grid[diag[j,1], diag[j,2]] <- grid[diag[j,1], diag[j,2]] + 1 # increase by 1
                                                                   # eg. 531,128 -> 532,129
    }
    
  } else {
    print("Invalid coordinates")
  }
  
}

sum(grid > 1) # sum all TRUEs where the value of a given coord is more than 1