# Day 2 - Part 1 ----------------------------------------------------------

input <- readLines("2015/data/day02.txt", warn = F) # load the data
input <- as.data.frame(input)                       # convert to df 1000x1
input <- strsplit(input[[1]], "x")                  # split by "x" to get each side separately
input <- lapply(input, as.integer)                  # convert to integers
input <- do.call(rbind, input)                      # 1000x3 df
names(input) <- c("w", "l", "h")                    # column names - sides - width, length, height

lowest <- apply(input, 1, function(x) (sort(x))[1]) # find the lowest number (smallest side)
lowest2<- apply(input, 1, function(x) (sort(x))[2]) # find the 2nd lowest number

input$extra <- lowest * lowest2                     # extra paper is the product/area of the smallest sides

input$paper <- (2*input$w*input$l)+(2*input$l*input$h)+(2*input$w*input$h)+input$extra # 2*l*w + 2*w*h + 2*h*l + extra

sum(input$paper)        

# Day 2 - Part 2 ----------------------------------------------------------

input <- readLines("2015/data/day02.txt", warn = F) # load the data
input <- as.data.frame(input)                       # convert to df 1000x1
input <- strsplit(input[[1]], "x")                  # split by "x" to get each side separately
input <- lapply(input, as.integer)                  # convert to integers
input <- do.call(rbind, input)                      # 1000x3 df
names(input) <- c("w", "l", "h")                    # column names - sides - width, length, height

lowest <- apply(input, 1, function(x) (sort(x))[1]) # find the lowest number (smallest side)
lowest2<- apply(input, 1, function(x) (sort(x))[2]) # find the 2nd lowest number

input$wrap <- (lowest*2)+(lowest2*2)                # shortest distance around (smallest) sides
input$bow <- input$w*input$l*input$h                # volume

input$ribbon <- input$wrap + input$bow              # put together to get the ribbon length needed

sum(input$ribbon)