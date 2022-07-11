# Day 7 - Part 1 ----------------------------------------------------------

input <- readLines("2015/data/day06.txt", warn = F) # load the data
input <- trimws(gsub("turn", "", input))
input <- strsplit(input, " |,")
input <- as.data.frame(matrix(data = do.call(rbind, input), ncol = 6))

grid <- matrix(0, 1000,1000)

switch <- function(x) {
  
  if (x[1] == "on") {
    grid[x[2]:x[5], x[3]:x[6]] <- 1  
  } else if (x[1] == "off") {
    grid[x[2]:x[5], x[3]:x[6]] <- 0
  } else {
    grid[x[2]:x[5], x[3]:x[6]] <- ifelse(grid[x[2]:x[5], x[3]:x[6]] == 0, 1, 0)
  }
  
  return(grid)
  
}

apply(input, 1, switch)

switch(input[,1])

# Day 7 - Part 2 ----------------------------------------------------------


