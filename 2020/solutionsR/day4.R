# Day 4 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day4.txt", warn = F) 
# load the data

input <- unlist(strsplit(paste(input, sep = " ", collapse = " "), "  "))
input <- strsplit(input, " ")
input <- lapply(input, sort)
# a single passport is scattered across 2-3 lines
# 1. mash everything into one string using a space " " as a separator
# 2. the empty lines had one space already, so now one passport is separated by two whitespaces
# 3. sort categories alphabetically for each element in vector


valid <- which(sapply(input, function(x) isTRUE(length(x) == 8 | (length(x) == 7 & !any(grepl("cid", x))))))
# check whether true (every condition satisfied OR one condition missing AND it is cid missing)

length(valid)
# length of the vector of the valid passports is the answer.
# easy does it, this will not help for part 2

# Day 4 - Part 2 ----------------------------------------------------------

input <- readLines("2020/data/day4.txt", warn = F)

input <- unlist(strsplit(paste(input, sep = " ", collapse = " "), "  "))
input <- strsplit(input, " ")
input <- lapply(input, sort)

# from before - retain passports where 8 fields or 7 with CID missing
input <- input[-c(which(sapply(input, function(x) !isTRUE(length(x) == 8 | (length(x) == 7 & !any(grepl("cid", x)))))))]

input <- lapply(input, strsplit, ":")
input <- lapply(input, unlist)
input <- lapply(input, matrix, byrow = F, nrow = 2)
input <- lapply(input, as.data.frame)
# convert into list of dataframes, each list item is one passport

# here: a function to validate based on 7 conditions, which are evaluated in the end
validator <- function(x){
  cond_byr <- isTRUE( grepl("^[0-9]{4}$", x[2,which(x[1,]=="byr")]) &   # check if 4 digits
                        as.integer(x[2,which(x[1,]=="byr")]) >= 1920 &  # more than 1920
                        as.integer(x[2,which(x[1,]=="byr")]) <= 2002 )  # less then 2002
  
  cond_iyr <- isTRUE( grepl("^[0-9]{4}$", x[2,which(x[1,]=="iyr")]) &   # check if 4 digits
                        as.integer(x[2,which(x[1,]=="iyr")]) >= 2010 &  # more than 2010
                        as.integer(x[2,which(x[1,]=="iyr")]) <= 2020 )  # less than 2020
   
  cond_eyr <- isTRUE( grepl("^[0-9]{4}$", x[2,which(x[1,]=="eyr")]) &   # check if 4 digits
                        as.integer(x[2,which(x[1,]=="eyr")]) >= 2020 &  # more than 2020
                        as.integer(x[2,which(x[1,]=="eyr")]) <= 2030 )  # less than 2030

  hgt <- x[2,which(x[1,]=="hgt")]                                       # value of the field where height is stored
  last2chars <- substr(hgt,(nchar(hgt)+1)-2,nchar(hgt))                 # last two characters, we want "in" or "cm"
  number <- as.integer(substr(hgt,(nchar(hgt)-10),nchar(hgt)-2))        # all characters except the last 2 (10 is arbitrary)
  
  cond_hgt <- isTRUE(
    if(last2chars == "cm") {
      
      ifelse((number >= 150) & 
               (number <= 193), TRUE, FALSE)
      
    } else if (last2chars == "in" ){
      ifelse((number >= 56) & 
               (number <= 79), TRUE, FALSE)
    } else {
      FALSE
    }
    
  )                                                                     # long height condition, less verbose through vars
  
  cond_hcl <- isTRUE(grepl("^#{1}[0-9a-z]{6}$", x[2,which(x[1,]=="hcl")])) # regex for "#" followed by 6 numbers or letters
  
  cond_pid <- isTRUE(grepl("^[0-9]{9}$", x[2,which(x[1,]=="pid")]))     # regex for exactly 9 digits with leading zeros
      
  cond_ecl <- isTRUE(x[2,which(x[1,]=="ecl")] %in% c("amb", "blu", "brn", "gry", "grn", "hzl", "oth")) # is hair color in the colors?
  
  if(cond_byr & cond_iyr & cond_eyr & cond_hgt & cond_hcl & cond_pid & cond_ecl) {
    return(TRUE)
  } else {
    return(FALSE)
  }                                                                     # final evaluation
}

sum(sapply(input, validator))                      # apply validator on every df in the list (i.e. every passport) and sum TRUE values
