# Day 15 - Part 1 ---------------------------------------------------------

input <- strsplit(readLines("2021/data/day15.txt", warn = F), "")
input <- lapply(input, as.integer)
input <- do.call(rbind, input)

ltr <- c()

i = 1;j = 1
active <- input[i,j]

while(i<(nrow(input) + 1)){
  while(j<(ncol(input)+1)){
  
  print("i")
  i = i + 1
  
  
}


# Day 15 - Part 2 ---------------------------------------------------------
