# Part 1 ------------------------------------------------------------------

# Process the input in form of XXXXXX-YYYYYY
rm(list = ls())
input <- readLines("2019/data/Day4.txt")
input <- as.integer(unlist(strsplit(input,"-")))

password <- function(min = input[1], max = input[2]) {
  
  require(stringi)
  require(dplyr)
  vector <- as.character(min:max)
  dbl_digits <- stringi::stri_count_regex(vector, pattern = "(\\d)\\1+")
  vector <- vector[which(dbl_digits == 1)]
  
  vector <- strsplit(vector, "")
  vector <- lapply(vector, as.integer)
   
  return(vector)
          
   
}

password()



# Part 2 ------------------------------------------------------------------
