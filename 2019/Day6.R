# Part 1 ------------------------------------------------------------------

rm(list = ls())

map <- data.frame(con = readLines("2019/data/Day6.txt"), stringsAsFactors = F)

orbits <- function(map) {
  require(tidyr)
  require(igraph)
  map <- map %>% separate(con, c("orbited", "orbiting"), "\\)")
  
  graph <- igraph::graph_from_data_frame(map, directed = T) %>% distances(to = "COM") %>% sum()
  
  return(graph)
}


orbits(map)

# Explanation
# This solution is a bit of cheating as I am not programming my own solution, but relying on an existing library...
# The "map commands" are split into two columns by ")" and the resulting dataframe is fed into igraph's function
# which creates an igraph object with all connections of vertices. The following function distances calculates
# distance from every single vertex to the one defined.


# Part 2 ------------------------------------------------------------------
rm(list = ls())

map <- data.frame(con = readLines("2019/data/Day6.txt"), stringsAsFactors = F)

orbits <- function(map) {
  require(tidyr)
  require(dplyr)
  require(igraph)
  map <- map %>% separate(con, c("orbited", "orbiting"), "\\)")
  
  you_orbits <- dplyr::filter(map, orbiting == "YOU") %>% pull("orbited")
  san_orbits <- dplyr::filter(map, orbiting == "SAN") %>% pull("orbited")
  
  graph <- igraph::graph_from_data_frame(map, directed = T) %>%
    distances(v = you_orbits,to = san_orbits) -> map
  
  return(map)
}


orbits(map)

# Explanation
# The exact same principle, just changing the distances function to calculate distance 
# between object that YOU is orbiting (in my case 785) 
# and the one SAN is orbiting, in my case D1K. 
