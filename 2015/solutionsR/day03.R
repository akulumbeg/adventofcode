# Day 3 - Part 1 ----------------------------------------------------------

input <- readLines("2015/data/day03.txt", warn = F) # load the data
input <- data.frame(command = unlist(strsplit(input, "")), x = NA, y = NA)
                                          
input$x[which(input == ">")] <- +1;input$y[which(input == ">")] <- 0 
input$x[which(input == "<")] <- -1;input$y[which(input == "<")] <- 0
input$x[which(input == "^")] <- 0; input$y[which(input == "^")] <- +1
input$x[which(input == "v")] <- 0; input$y[which(input == "v")] <- -1

start <- data.frame(x = 0, y = 0)                         # starting position
coords <- cbind(x = cumsum(input$x), y = cumsum(input$y)) # cumulatively add coordinates through +1 and -1 steps
coords <- rbind(start, coords)                            # bind with starting positions

nrow(unique(coords))                                      # unique coords/houses that received presents

# Day 3 - Part 2 ----------------------------------------------------------

input <- readLines("2015/data/day03.txt", warn = F) # load the data
input <- data.frame(command = unlist(strsplit(input, "")), x = NA, y = NA)

input$x[which(input == ">")] <- +1;input$y[which(input == ">")] <- 0 
input$x[which(input == "<")] <- -1;input$y[which(input == "<")] <- 0
input$x[which(input == "^")] <- 0; input$y[which(input == "^")] <- +1
input$x[which(input == "v")] <- 0; input$y[which(input == "v")] <- -1

start <- data.frame(x = 0, y = 0)                        # starting position
coordsSanta <- data.frame(x = cumsum(input$x[seq(1, length(input$x), 2)]), y = cumsum(input$y[seq(1, length(input$x), 2)]))
coordsRobosanta <- data.frame(x = cumsum(input$x[seq(2, length(input$x), 2)]), y = cumsum(input$y[seq(2, length(input$x), 2)]))
# cumulatively add coords based on steps for both Santa (every odd number, 1,3,5...) and Robosanta (2,4,6...)

coords <- rbind(start, start, coordsSanta, coordsRobosanta)
# starting position of both santa and robosanta bound with their coords

nrow(unique(coords))                                     # unique coords/houses that received presents