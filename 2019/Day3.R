rm(list = ls())

wires <- readLines("2019/data/Day3.txt")
instructions <- strsplit(wires, ",")
wire1 <- unlist(instructions[1])
wire2 <- unlist(instructions[2])
rm(wires, instructions)

# This one got me unprepared, and I was unable to come up with an efficient solution.
# All credit goes to u/turtlegraphics, 
# I just did some minor changes in names and the manhattan function.

wire <- function (wire) {
  require(dplyr)
  steps <- as.integer(substr(wire,2,1000))
  dx <- recode(substr(wire,1,1), R = 1, L = -1, U = 0, D = 0)
  dy <- recode(substr(wire,1,1), R = 0, L =  0, U = 1, D = -1)
  x <- cumsum(rep(dx,steps))
  y <- cumsum(rep(dy,steps))
  data.frame(x,y) %>% mutate(step = row_number())
}

wire1 <- wire(wire1)
wire2 <- wire(wire2)

manhattan <- function(px,py,qx,qy) {
  return(abs(px - qx) + abs(py - qy))
}

intersections <- inner_join(wire1,wire2,by=c("x","y")) %>%
  mutate(dist = manhattan(x,y,0,0), steps = step.x + step.y)

# part 1
print(min(intersections$dist)) 
# part 2
print(min(intersections$steps))

# Explanation
# The wire function creates a dataframe with distances and their directions and by replication
# write every single coordinate that a wire goes through, creating a "map".
# The manhattan function is defined and used in the intersections variable, which performs
# an inner join on the two "maps" and calculates the manhattan distances of all intersections
# The first part answer then looks for the intersection with the smallest distance 
# from the center point (0,0). The second part answer looks for the minimal combined 
# steps needed to reach the nearest intersection.
