# Day 8 - Part 1 ----------------------------------------------------------

# Several approaches possible here, but I took the lazy way

# Preprocessing
input <- readLines("2021/data/day8.txt", warn = F)
input <- strsplit(input, split = " ", fixed = T)
input <- do.call(rbind.data.frame, input)

# Only take whatever is after the | delimiter (always 4 numbers)
# count the number of characters 
lengths <- sapply(input[,12:15], nchar)

# It is given that number 1 uses 2 segments, 4 uses 4, 7 uses 3, 8 uses 7
# The segment counts are unique to those numbers
# So simply check which numbers consist of the respective segment counts
sum(lengths %in% c(2,4,3,7))


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
    eight <- signal[i,which(nchar(signal[i, ]) == 7)]
    
    strsplit(signal[i,], "")
    
    #zero <-
    #two <-
    #three <-
    #five <-
    #six <-
    #nine <- 
    
    translate <- data.frame(var = c(zero, one, two, three, four, five, six, sever, eight, nine),
                            val = c(0:9))
    
    output[]  
    
  }
  
  
  number <- sum(output)
  return(number)
  
}


# sum output
