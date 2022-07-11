# Day 9 - Part 1 ----------------------------------------------------------

input <- readLines("2015/data/day09.txt", warn = F)       
input <- strsplit(input, "( to )|( = )")
input <- data.frame(do.call(rbind, input))
names(input) <- c("from", "to", "dist")
input$dist <- as.integer(input$dist)
input$fromto <- paste0(input$from, input$to)

#matrix
names <- sort(unique(c(unique(input$from), unique(input$to))))
matrix(input$dist, length(input$dist)/2, length(input$dist)/2)


M <- matrix(,8,8)

# Day 9 - Part 2 ----------------------------------------------------------


x <- matrix(rnorm(100), nrow = 5)
dist(x)
