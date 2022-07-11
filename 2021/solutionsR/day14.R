# Day 14 - Part 1 ---------------------------------------------------------

input <- readLines("2021/data/day14.txt", warn = F)[1]

rules <- strsplit(readLines("2021/data/day14.txt", warn = F)[3:102], " -> ")
rules <- do.call(rbind, rules)



insertion <- function(input) {
  
  code <- substr(input, 1, 1)
  
  for(i in 2:nchar(input)) {
    
    if(substr(input, i-1, i) %in% rules[,1]) {
      code <- c(code, rules[rules[,1] == substr(input, i-1, i), 2], substr(input, i, i))
    } else {
      code <- c(code, substr(input, i, i))
    }
  }
  
  input <- paste(code, collapse="")
  return(input)
  
}

run <- function(input, n) {
  if (n == 0) return(input)
  Recall(insertion(input), n - 1)
}

quantities <- table(strsplit(run(input, 10),""))
result <- max(quantities) - min(quantities)

result


# Day 14 - Part 2 ---------------------------------------------------------

input <- readLines("2021/data/day14.txt", warn = F)[1]

rules <- strsplit(readLines("2021/data/day14.txt", warn = F)[3:102], " -> ")
rules <- do.call(rbind, rules)



insertion <- function(input) {
  
  code <- substr(input, 1, 1)
  
  for(i in 2:nchar(input)) {
    
    if(substr(input, i-1, i) %in% rules[,1]) {
      code <- c(code, rules[rules[,1] == substr(input, i-1, i), 2], substr(input, i, i))
    } else {
      code <- c(code, substr(input, i, i))
    }
  }
  
  input <- paste(code, collapse="")
  return(input)
  
}

run <- function(input, n) {
  if (n == 0) return(input)
  Recall(insertion(input), n - 1)
}


quantities <- table(strsplit(run(input, 40),""))



