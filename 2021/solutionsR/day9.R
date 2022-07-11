# Day 9 - Part 1 ----------------------------------------------------------

input <- strsplit(readLines("2021/data/day9.txt", warn = F), "")
input <- lapply(input, as.integer)
input <- as.matrix(do.call(rbind, input))

copy <- input

minmax <- function(min, value, max) {
  
  if (value >= min & value <= max) {
    return(value)
  } else if (value > max) {
    return(max)
  } else if (value < min) {
    return(min)
  }
  
}

for(i in 1:nrow(input)) {
  for (j in 1:ncol(input)) {
    
    a <- ifelse(i != nrow(input), input[i,j] < input[i+1,j], TRUE)
    b <- ifelse(i != 1, input[i,j] < input[i-1,j], TRUE)
    c <- ifelse(j != ncol(input), input[i,j] < input[i,j+1], TRUE)
    d <- ifelse(j != 1, input[i,j] < input[i,j-1], TRUE)
    
    
    if (a&b&c&d) {
      
      copy[i,j] <- input[i,j]
      
    } else {
      
      copy[i,j] <- 0
      
    }
  }
}

risk <- length(which(copy != 0))
sum(copy)




# Day 8 - Part 2 ----------------------------------------------------------

input <- readLines("2021/data/day8.txt", warn = F)
input <- strsplit(input, split = " ", fixed = T)
input <- do.call(rbind.data.frame, input)

names(input) <- NULL

signal <- input[,1:10]
output <- input[,12:15]

decoder <- function(signal, output) {
  
  for (i in 1:nrow(signal)) {
    
    one <- signal[i,which(nchar(signal[i, ]) == 2)]
    
    four <- signal[i,which(nchar(signal[i, ]) == 4)]
    seven <- signal[i,which(nchar(signal[i, ]) == 3)]
    
    "abcdefg"
    output[i, ]  
    
  }
  
  
  number <- sum(output)
  return(number)
  
}
