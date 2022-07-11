# Day 1 - Part 1 ----------------------------------------------------------

input <- unlist(strsplit(readLines("2016/data/day1.txt", warn = F), ", "))

coords <- data.frame(direction = substr(input, 1,1), value = as.integer(substr(input, 2,nchar(input))))

position <- c(0,0)
direction <- 0

for (i in nrow(coords)) {
  if (coords[i, 1] == "R") {
   direction <- direction + 90
  } else {
    direction <- direction - 90
  }
  
} 

#dist( manhattan )



# Day 1 - Part 2 ----------------------------------------------------------