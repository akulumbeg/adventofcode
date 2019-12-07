# Part 1 ------------------------------------------------------------------

# Process the input in form of XXXXXX-YYYYYY
rm(list = ls())
input <- readLines("2019/data/Day4.txt")
input <- as.integer(unlist(strsplit(input,"-")))

passwords <- function(min = input[1], max = input[2]) {
  
  require(stringi)
  require(dplyr)
  vector <- as.character(min:max)
  
  vh <- tibble(d1 = as.integer(substring(vector, 1, 1)),
                         d2 = as.integer(substring(vector, 2, 2)),
                         d3 = as.integer(substring(vector, 3, 3)),
                         d4 = as.integer(substring(vector, 4, 4)),
                         d5 = as.integer(substring(vector, 5, 5)),
                         d6 = as.integer(substring(vector, 6, 6))
                                         )
  
  vh <- vh %>% 
    filter(d6 >= d5 & d5 >= d4 & d4 >= d3 & d3 >= d2 & d2 >= d1) %>%
    filter(d1 == d2 | d2 == d3 | d3 == d4 | d4 == d5 | d5 == d6)
  
  return(vh)
          
   
}

nrow(passwords())

# Explanation
# The first two conditions (range and 6 digits) are fulfilled by default, so we only check for the other two.
# The function splits the number in string format and puts every digit in integer form into a separate column.
# From there, we filter using two criteria: The number in the column to the right can be equal or larger,
# and numbers in any two adjacent columns must be equal.


# Part 2 ------------------------------------------------------------------
# Process the input in form of XXXXXX-YYYYYY
rm(list = ls())
input <- readLines("2019/data/Day4.txt")
input <- as.integer(unlist(strsplit(input,"-")))

passwords <- function(min = input[1], max = input[2]) {
  
  require(stringi)
  require(dplyr)
  vector <- as.character(min:max)
  
  vh <- tibble(d1 = as.integer(substring(vector, 1, 1)),
               d2 = as.integer(substring(vector, 2, 2)),
               d3 = as.integer(substring(vector, 3, 3)),
               d4 = as.integer(substring(vector, 4, 4)),
               d5 = as.integer(substring(vector, 5, 5)),
               d6 = as.integer(substring(vector, 6, 6))
  )
  
  vh <- vh %>% 
    filter(d6 >= d5 & d5 >= d4 & d4 >= d3 & d3 >= d2 & d2 >= d1) %>%
    filter((d1 == d2 & d2 != d3)| 
             (d2 == d3 & (d2 != d1 & d3 != d4)) | 
             (d3 == d4 & (d3 != d2 & d4 != d5)) | 
             (d4 == d5 & (d4 != d3 & d5 != d6)) |
             (d5 == d6 & d5 != d4))
  
  return(vh)
  
  
}

nrow(passwords())

# Explanation
# The same principle with slight modification, in the second filtering condition, we assure that
# adjacent numbers are the same, but also exclude the cases when adjacent numbers to our compared pair
# are the same as any one of the numbers in the compared pair.