# Day 9 - Part 1 ----------------------------------------------------------

input <- strsplit(readLines("2021/data/day13.txt", warn = F)[1:983], ",")
input <- lapply(input, as.integer)
input <- as.data.frame(do.call(rbind, input))
input <- input + 1

folds <- substr(readLines("2021/data/day13.txt", warn = F)[985:996], 11, 18)
folds <- trimws(folds)
folds <- strsplit(folds, "=")
folds <- as.data.frame(do.call(rbind, folds))
folds[,2] <- as.integer(folds[,2])+1 

grid <- matrix(data = ".", nrow = max(input), ncol = max(input))

for (i in 1:nrow(input)) {
  
  grid[input[i,1], input[i,2]] <- "#"
  
}





# Day 8 - Part 2 ----------------------------------------------------------

input <- readLines("2021/data/day8.txt", warn = F)
input <- strsplit(input, split = " ", fixed = T)
input <- do.call(rbind.data.frame, input)

