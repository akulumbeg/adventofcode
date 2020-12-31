# Day 7 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day7.txt", warn = F)

input <- strsplit(input, "contain")
input <- lapply(input, trimws)

cleaner <- function(input) {
  bag <- sapply(input, "[[", 1)
  contains <- sapply(input, function(x)
    strsplit(x[2], ", "))
  bag <- rep(bag, lengths(contains))
  contains <- unlist(contains)
  bags <- data.frame(bag, contains)
  return(bags)
}

bags <- cleaner(input)
bags$contains[grep("no other", bags$contains)] <- "nothing"

bags$quantity <- ifelse(bags$contains == "nothing", 0, bags$contains)
bags$quantity <- as.integer(gsub("[^[:digit:]]", "",  bags$quantity))

bags$contains <- gsub("[^A-Za-z]", "",  bags$contains)
bags$contains <- gsub("bags", "bag",  bags$contains)
bags$contains <- gsub("bag", "",  bags$contains)

bags$bag <- gsub("[^A-Za-z]", "",  bags$bag)
bags$bag <- gsub("bags", "bag",  bags$bag)
bags$bag <- gsub("bag", "",  bags$bag)

colorfinder <- function(color, bags) {
  i <- which(bags$contains == color)
  
  if (length(i) > 0) {
    col1 = bags$bag[i]
    col2 = lapply(col1, colorfinder, bags = bags)
    vector = c(col1, do.call('c', col2))
  } else{
    vector = character(length = 0)
  }
  
  return(vector)
}

valid <- colorfinder("shinygold",  bags = bags[which(bags$quantity > 0), ])
length(unique(valid))

# Day 7 - Part 2 ----------------------------------------------------------

input <- readLines("2020/data/day7.txt", warn = F)

input <- strsplit(input, "contain")
input <- lapply(input, trimws)

cleaner <- function(input) {
  bag <- sapply(input, "[[", 1)
  contains <- sapply(input, function(x)
    strsplit(x[2], ", "))
  bag <- rep(bag, lengths(contains))
  contains <- unlist(contains)
  bags <- data.frame(bag, contains)
  return(bags)
}

bags <- cleaner(input)
bags$contains[grep("no other", bags$contains)] <- "nothing"

bags$quantity <- ifelse(bags$contains == "nothing", 0, bags$contains)
bags$quantity <- as.integer(gsub("[^[:digit:]]", "",  bags$quantity))

bags$contains <- gsub("[^A-Za-z]", "",  bags$contains)
bags$contains <- gsub("bags", "bag",  bags$contains)
bags$contains <- gsub("bag", "",  bags$contains)

bags$bag <- gsub("[^A-Za-z]", "",  bags$bag)
bags$bag <- gsub("bags", "bag",  bags$bag)
bags$bag <- gsub("bag", "",  bags$bag)


colorcounter <- function(color, bags, quantity){
  i <- which(bags$bag == color)
  quantity <- bags$quantity[i]
  inner <- bags$color[i]
  
  if(length(i) == 1){
    if(quantity > 0){
      vector <- colorcounter(color = inside, bags = bags, quantity = quantity)
    } else{
      vector = 0
    }
  } else if(length(i) > 1){
    vector = mapply(FUN = function(clr, m){
      colorcounter(color = clr, bags = bags, quantity = m)
    }, col = inner, m = quantity,
    SIMPLIFY = TRUE)
  }
  vector = quantity + sum(vector*quantity)
  
  return(vector)
}

all_bags = sort(unique(bags$bag))
contain = sapply(all_bags, colorcounter, bags = bags, quantity = 1)
full_count = data.frame(color = all_bags,
                        Nbags = contain - 1,
                        row.names = NULL,
                        stringsAsFactors = FALSE)
full_count[which(full_count$color == 'shiny_gold'), ]


