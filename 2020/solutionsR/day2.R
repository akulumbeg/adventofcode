# Day 2 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day2.txt", warn = F) 

input <- gsub("-", " ", input)
# remove "-" and replace by a space " " in the range part
split <- as.data.frame(matrix(unlist(strsplit(input, " ")), ncol = 4, byrow = T))
# split by " " and rearrange by matrix into a dataframe with 4 columns
split[,3] <- gsub(":", "",split[,3])
# remove the ":" in the character
names(split) <- c("min", "max", "char", "pwd")
# rename
split$occur <- sapply(1:nrow(split), function(x) lengths(regmatches(split$pwd[x], gregexpr(split$char[x], split$pwd[x]))))
# create a new column that will count the number of occurences of "char" in the "pwd" for every row
# has to be done via sapply, because gregexpr() cannot work with vectors
split$valid <- ifelse(as.integer(split$min) <= split$occur & split$occur <= as.integer(split$max), T, F)
# conditionally determine the following -> if minimum <= actual occurence <= maximum, then T, else F

sum(split$valid) 
# sum the T values to get the answer


# Day 2 - Part 2 ----------------------------------------------------------

input <- readLines("2020/data/day2.txt", warn = F) 

input <- gsub("-", " ", input)
split <- as.data.frame(matrix(unlist(strsplit(input, " ")), ncol = 4, byrow = T))
split[,3] <- gsub(":", "",split[,3])
names(split) <- c("min", "max", "char", "pwd")
split$pos1 <- sapply(1:nrow(split), function(x) ifelse(as.integer(split$min[x]) %in% unlist(gregexpr(split$char[x], split$pwd[x])), T, F))
# conditionally check for each row if the min (now actually the first position) is in the enumeration of  
# positions of the checked letter in each string
# requires tinkering with unlist, as the gregexpr() output is by default a list
split$pos2 <- sapply(1:nrow(split), function(x) ifelse(as.integer(split$max[x]) %in% unlist(gregexpr(split$char[x], split$pwd[x])), T, F))
# same for the second position
split$valid <- ifelse(split$pos1 == split$pos2, F, T)
# as stated in the instructions, if T & T or F & F, then F, else T

sum(split$valid)
# sum the T values to get the answer


