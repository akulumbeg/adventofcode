# Day 3 - Part 1 ----------------------------------------------------------

input <- strsplit(readLines("2021/data/day3.txt", warn = F), "")
input <- matrix(as.integer(unlist(input)), ncol = 12, byrow = T) # as matrix

gamma <- ifelse(colMeans(input) > 0.5, 1, 0) # col mean > 0.5 = more 1s than 0s
epsilon <- 1-gamma                           # invert 

gamma <- paste(as.character(gamma), collapse = "") # collapse into a string 
epsilon <- paste(as.character(epsilon), collapse = "")

consumption <- strtoi(gamma, 2) * strtoi(epsilon, 2) # convert base2 str to int
consumption

# Day 3 - Part 2 ----------------------------------------------------------

input <- strsplit(readLines("2021/data/day3.txt", warn = F), "")
input <- matrix(as.integer(unlist(input)), ncol = 12, byrow = T)

remover <- function(input, most = T) {
# Remover - Iteratively removes the redundant rows from columns
  
  input <- as.data.frame(input) # convert into df because of last 
                                # otherwise last matrix row converts into vector
  
  # I really want to avoid for loops, but couldn't think of a better solution

  for (i in 1:ncol(input)) {
    
    if((length(table(input[, i])) == 2) & (table(input[, i])[1] == table(input[, i])[2])) {
      # if there is an equal amount of 1s and 0s, force the following
      n_m <- 1  # the most common condition -> n will be 1
      n_l <- 0  # the least common -> n will be 0
    } else {
      # otherwise n_m and n_l are the most common and least common n, respectively
      n_m <- as.integer(names(sort(table(input[, i]), decreasing = T)))[1]
      n_l <- as.integer(names(sort(table(input[, i]), decreasing = T)))[2]
    }
    
    if (most == T) {
      # searching for most common, in the given iteration/column
      # keep only rows which have the n_m number
      input <- input[input[,i] == n_m, ]
    } else {
      # same but for the least common number
      input <- input[input[,i] == n_l, ]
    }
    
    # break the loop if last row appears prematurely
    if (nrow(input) == 1) break 
  }
  
  return(strtoi(paste(as.character(input), collapse = ""),2)) # converted int
}

oxygen <- remover(input, T)
co2 <- remover(input, F)

lifesupport <- oxygen * co2
lifesupport
