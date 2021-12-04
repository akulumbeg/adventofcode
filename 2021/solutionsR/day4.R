# Day 4 - Part 1 ----------------------------------------------------------

# read in the picked numbers first
numbers <- readLines("2021/data/day4.txt", 1, warn = F)
numbers <- as.integer(unlist(strsplit(numbers, ",")))

# read in the boards
# can be done more efficiently with piping or a loop
# but I like this approach for clarity of steps
boards <- readLines("2021/data/day4.txt", warn = F)
boards <- boards[3:length(boards)]      # do not read the row with picked numbers and the empty one after
boards <- boards[which(boards != "")]   # remove the empty rows
boards <- trimws(boards)                # trim whitespaces surrounding some numbers
boards <- split(boards, ceiling(seq_along(boards) / 5)) # split by 5 rows 
boards <- lapply(boards, paste, sep = " ", collapse = " ") # collapse strings into a vector for each matrix
boards <- lapply(boards, gsub, pattern = "  ", replacement = " ") # remove double whitespaces again
boards <- lapply(boards, strsplit, split = " ") # split by whitespace
boards <- lapply(boards, unlist) # unlist into single elements
boards <- lapply(boards, as.integer) # convert to integer
boards <- lapply(boards, matrix, nrow = 5, ncol = 5, byrow = T) # create board matrices

bingo <- function(boards) {
  for(i in numbers){
    # replace the currently picked number in each board with NA
    boards <- lapply(boards, function(x) {x[x==i]<-NA;x})
    # everytime check if there is a row or column in a board where there are 5 NAs (i.e. hits)
    winner <- sapply(boards, function(x) any(rowSums(is.na(x))==5) | any(colSums(is.na(x))==5))
    # if there is any such row, break the loop
    if(any(winner)) break
  }
  # get the winning board, sum numbers other than NA, multiply by the current number
  winner <- sum(boards[winner][[1]], na.rm=T) * i
  return(winner)
}

winner <- bingo(boards)
winner

# credits to @plannapus - I was trying to do the EXACT same approach but got stuck 
# at trying to use lapply incorrectly. Borrowed their code, because it did exactly
# what I was trying to achieve, and adjusted it to reflect my original approach
# with a function

# Day 4 - Part 2 ----------------------------------------------------------

# read in the picked numbers first
numbers <- readLines("2021/data/day4.txt", 1, warn = F)
numbers <- as.integer(unlist(strsplit(numbers, ",")))

# read in the boards
# can be done more efficiently with piping or a loop
# but I like this approach for clarity of steps
boards <- readLines("2021/data/day4.txt", warn = F)
boards <- boards[3:length(boards)]      # do not read the row with picked numbers and the empty one after
boards <- boards[which(boards != "")]   # remove the empty rows
boards <- trimws(boards)                # trim whitespaces surrounding some numbers
boards <- split(boards, ceiling(seq_along(boards) / 5)) # split by 5 rows 
boards <- lapply(boards, paste, sep = " ", collapse = " ") # collapse strings into a vector for each matrix
boards <- lapply(boards, gsub, pattern = "  ", replacement = " ") # remove double whitespaces again
boards <- lapply(boards, strsplit, split = " ") # split by whitespace
boards <- lapply(boards, unlist) # unlist into single elements
boards <- lapply(boards, as.integer) # convert to integer
boards <- lapply(boards, matrix, nrow = 5, ncol = 5, byrow = T) # create board matrices

bingo <- function(x) {
  
  winning_order <- c()
  
  for(i in numbers){
    # replace the currently picked number in each board with NA
    boards <- lapply(boards,function(x){x[x==i]<-NA;x})
    # everytime check if there is a row or column in a board where there are 5 NAs (i.e. hits)
    won <- sapply(boards,function(x)any(rowSums(is.na(x))==5) | any(colSums(is.na(x))==5))
    # take the number of the currently winning board
    w <- which(won)
    # create a vector of all winning boards, add the ones which won and are not included yet
    winning_order <- c(winning_order,w[!w%in%winning_order])
    # once every board won, break the loop
    if(all(won)) break
  }
  # take the last winning board, sum all non-NA numbers, multiply by i
  sum(boards[tail(winning_order,1)][[1]],na.rm=T) * i
}

winner <- bingo(boards)
winner
