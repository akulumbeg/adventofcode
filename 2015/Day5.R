# --- Day 5: Doesn't He Have Intern-Elves For This? ---
# Santa needs help figuring out which strings in his text file are naughty or nice.
# 
# A nice string is one with all of the following properties:
# 
# It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
# It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
# For example:
# 
# ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), 
# a double letter (...dd...), and none of the disallowed substrings.
# aaa is nice because it has at least three vowels and a double letter, 
# even though the letters used by different rules overlap.
# 
# jchzalrnumimnmhp is naughty because it has no double letter.
# haegwjzuvuyypxyu is naughty because it contains the string xy.
# dvszwmarrgswjxmb is naughty because it contains only one vowel.
# 
# How many strings are nice?

# Prepare the data
texts <- as.data.frame(readr::read_lines("2015/data/Day5.txt"), stringsAsFactors = F)
names(texts)[1] <- "text"

nice_or_naughty <- function(textdf) {
  
  duplicatedletters <- paste0(letters, letters)                           # df of 2 columns of letters
  dupletstring <- paste(duplicatedletters, sep = "|", collapse = "|")     # bind the columns create one string of pairs
                                                                          # separated by | as a regex pattern
  
  textdf$condition1 <- grepl("[aeiou].*[aeiou].*[aeiou]", textdf$text)    # checks for 3 vowels
  textdf$condition2 <- grepl(paste0("(",dupletstring,")"), textdf$text)   # checks for presence of consecutive duplicates
  textdf$condition3 <- !grepl("(ab|cd|pq|xy)", textdf$text)               # checks for presence of given strings 
                                                                          # TRUE if they are missing
    
  textdf$nice <- textdf$condition1 & textdf$condition2 & textdf$condition3# checks if all 3 conditions are TRUE
  
  return(textdf)
}

texts <- nice_or_naughty(texts)

sum(texts$nice)

# --- Part Two ---
# Realizing the error of his ways, Santa has switched to a better model of determining whether 
# a string is naughty or nice. None of the old rules apply, as they are all clearly ridiculous.
# 
# Now, a nice string is one with all of the following properties:
#   
# It contains a pair of any two letters that appears at least twice in the string without overlapping, 
# like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
# It contains at least one letter which repeats with exactly one letter between them, like xyx, 
# abcdefeghi (efe), or even aaa.
# 
# For example:
#   
# qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj) and a letter that 
# repeats with exactly one letter between them (zxz).
# xxyxx is nice because it has a pair that appears twice and a letter that repeats with one between, 
# even though the letters used by each rule overlap.
# uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat with a single letter between them.
# ieodomkazucvgmuy is naughty because it has a repeating letter with one between (odo), 
# but no pair that appears twice.
# How many strings are nice under these new rules?

# Prepare the data
texts <- as.data.frame(readr::read_lines("2015/data/Day5.txt"), stringsAsFactors = F)
names(texts)[1] <- "text"

nice_or_naughty <- function(textdf) {
  
  duplicatedletters <- paste0(letters, letters)                           # df of 2 columns of letters
  dupletstring <- paste(duplicatedletters, sep = "|", collapse = "|")     # bind the columns create one string of pairs
  # separated by | as a regex pattern
  
  textdf$condition1 <- grepl("[aeiou].*[aeiou].*[aeiou]", textdf$text)    # checks for 3 vowels
  textdf$condition2 <- grepl(paste0("(",dupletstring,")"), textdf$text)   # checks for presence of consecutive duplicates
  textdf$condition3 <- !grepl("(ab|cd|pq|xy)", textdf$text)               # checks for presence of given strings 
  # TRUE if they are missing
  
  textdf$nice <- textdf$condition1 & textdf$condition2 & textdf$condition3# checks if all 3 conditions are TRUE
  
  return(textdf)
}

texts <- nice_or_naughty(texts)

sum(texts$nice)