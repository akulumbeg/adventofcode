# Day 4 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day4.txt", warn = F) 
# load the data

input <- unlist(strsplit(paste(input, sep = " ", collapse = " "), "  "))
input <- strsplit(input, " ")
input <- lapply(input, sort)
# a single passport is scattered across 2-3 lines
# 1. mash everything into one string using a space " " as a separator
# 2. the empty lines had one space already, so now one passport is separated by two whitespaces
# 3. sort categories alphabetically for each element in vector


valid <- which(sapply(input, function(x) isTRUE(length(x) == 8 | (length(x) == 7 & !any(grepl("cid", x))))))
# check whether true (every condition satisfied OR one condition missing AND it is cid missing)

length(valid)
# length of the vector of the valid passports is the answer.
# easy does it, this will not help for part 2

# Day 4 - Part 2 ----------------------------------------------------------

# input <- readLines("2020/data/day4.txt", warn = F)
# 
# input <- unlist(strsplit(paste(input, sep = " ", collapse = " "), "  "))
# input <- strsplit(input, " ")
# input <- lapply(input, sort)
# 
# #invalidate the following
# input <- input[-c(which(sapply(input, function(x) !isTRUE(length(x) == 8 | (length(x) == 7 & !any(grepl("cid", x)))))))]
# 
# input <- lapply(input, as.data.frame)
# input <- sapply(input, function(x) gsub("^.{0,3}","", x))
# 
# input <- input[-c(which(sapply(input, function(x) !isTRUE())))]

# #######Work in progress
