# Day 3 - Part 1 ----------------------------------------------------------

map <- as.matrix(readLines("2020/data/day3.txt", warn = F))
maplist <- strsplit(map, "")
map <- matrix(unlist(maplist), byrow = T, ncol = 31)
# translate the data into a matrix as a map

trees <- c()                    # empty vector to add encountered trees to
i<-j<-1                         # initialize iterator (position on the grid)

while(i <= 323) {
  trees <- c(trees,map[i,j])    # for every iteration, add what is on [i,j]
  j <- j+3                      # move 3 right
  if(j > 31){                   # however, if the position is beyond right
    j <- j - 31                 # border, then subtract 31 to get us back
    }                           # to the start
  i <- i+1                      # move 1 down
}

sum(trees == "#")


# Day 3 - Part 2 ----------------------------------------------------------

map <- as.matrix(readLines("2020/data/day3.txt", warn = F))
maplist <- strsplit(map, "")
map <- matrix(unlist(maplist), byrow = T, ncol = 31)
# translate the data into a matrix as a map

toboggan <- function(input, right, down) {
  trees <- c()
  i<-j<-1
  while(i <= 323) {
    trees <- c(trees,map[i,j])
    j <- j+right
    if(j > 31)
    {j <- j - 31}
    i <- i+down
  }
  return(sum(trees == "#"))
}                                
# do the same as before but as a function, so that the coords can change

prod(toboggan(map, 1,1),
     toboggan(map, 3,1), 
     toboggan(map, 5,1), 
     toboggan(map, 7,1), 
     toboggan(map, 1,2))

# product of the functions - I am aware there are many more elegant ways
# to vectorize over coords, but for illustration, this is enough
# I will get back to this some other time to optimize the code


