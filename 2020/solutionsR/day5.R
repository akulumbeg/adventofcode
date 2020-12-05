# Day 5 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day5.txt", warn = F)

binpart <- function(inst) {
  if (nchar(inst) == 10) {
    row <- c(0, 127)
    col <- c(0, 7)
    
    rowinst <- substr(inst, 1, 7)
    colinst <- substr(inst, 8, 10)
    
    for (rows in unlist(strsplit(rowinst, ""))) {
      range <- row[2] - row[1]
      
      if (rows == "F") {
        range <- floor(range / 2)
        row[2] <- row[1] + range
        
      } else if (rows == "B") {
        range <- floor(range / 2)
        row[1] <- row[2] - range
        
      }
    }
    
    row <- row[1]
    
    for (cols in unlist(strsplit(colinst, ""))) {
      range <- col[2] - col[1]
      
      if (cols == "L") {
        range <- floor(range / 2)
        col[2] <- col[1] + range
        
      } else if (cols == "R") {
        range <- floor(range / 2)
        col[1] <- col[2] - range
        
      }
    }
    
    col <- col[1]
    
    seatID <- (row * 8) + col
    return(seatID)
    
  } else {
    return("not a valid seat instruction")
  }
}

max(sapply(input, binpart))


# Day 5 - Part 2 ----------------------------------------------------------

list <- sort(sapply(input, binpart))

min(list); max(list)

full <- seq(from = min(list), to = max(list), by = 1)

setdiff(full,list)
