# Day 6 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day6.txt", warn = F) 
# load the data

input <- unlist(strsplit(paste(input, sep = " ", collapse = " "), "  ")) 
input <- gsub(" ", "", input)
# an empty element is a group separator
# the first command merges group answers together
# the second command merges group answers into one string/element

input <- lapply(input, function(x) unique(unlist(strsplit(x, ""))))
# unique letter = unique YES answer, duplicates do not count
# for each group, select all unique "YES" answers

sum(lengths(input))
# sum them up and there is the solution

# note: this could be done more efficiently with the stringr package (str_count)
# but as per my rule, I am sticking to base R. I might add the tidyverse solution later.

# Day 6 - Part 2 ----------------------------------------------------------

input <- readLines("2020/data/day6.txt", warn = F) 
input <- unlist(strsplit(paste(input, sep = " ", collapse = " "), "  "))
# an empty element is a group separator
# the first command merges group answers together

groupmmbrs <- sapply(input, function(x) length(grepRaw(" ", x, all = T))+1, simplify = T)
# before merging group answers, count the group members. The number of " "+1
# is the number of group members. Save in separate vector.

input <- gsub(" ", "", input)
# merge group answers as before
input <- lapply(input, function(x) unlist(strsplit(x, "")))
input <- lapply(input, function(x) sort(table(x), decreasing = T))
# split the groups into separate answers per group
# and sort their frequency
# the logic is that if everyone answered, the answers/letter's frequency
# must be equal to groupmmbrs for that particular group

comb <- c(0)

for(i in 1:length(groupmmbrs)) {
  
comb <- c(comb, length(which(input[[i]] == groupmmbrs[i])))  

}

# comb initially holds a 0 and then after every iteration, the number of characters
# where the condition is satisfied is added to the vector

# I admit I broke my rule of avoiding the for loops as this is quite efficient.
# I will come up with a better alternative later.

sum(comb)    
# sum for answer