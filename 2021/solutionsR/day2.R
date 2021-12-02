# Day 2 - Part 1 ----------------------------------------------------------

input <- readLines("2021/data/day2.txt", warn = F)

# define a function which sums numbers for each command based on string splitting
values <- function(x) {
  values <- sum(as.integer(gsub(x, "", input[grep(x, input)])))       
}

forward <- values("forward ") # sum values of "forward " commands
up <- values("up ")           # sum values of "up " commands
down <- values("down ")       # sum values of "down " commands

position <- (down-up) * forward  # depth * horizontal position // down is +
position

# Day 2 - Part 2 ----------------------------------------------------------

input <- data.frame(cmd = readLines("2021/data/day2.txt", warn = F))

# There are more efficient ways, but I wanted to stick with Base R

attach(input)                # avoid "input$dir" etc.

dir <- as.character(unlist(strsplit(cmd, " ")))[which((1:2000)%%2==1)] # only odd numbers
val <- na.omit(as.integer(unlist(strsplit(cmd, " "))))                 # extract values
cmd <- NULL
aim <- cumsum(ifelse(dir == "up", val * -1, ifelse(dir == "forward", 0, val))) 

position <- sum(ifelse(dir == "forward", val, 0)) *  sum(ifelse(dir == "forward", val * aim, 0))

detach(input)

position
