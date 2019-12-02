# Part 1 ------------------------------------------------------------------
rm(list = ls())

intcode <- readLines("2019/data/Day2.txt")
intcode <- as.vector(strsplit(intcode, split = ","))
intcode <- as.integer(unlist(intcode))

intcode

#as stated in instructions
intcode[2] <- 12
intcode[3] <- 2

for (i in 1:153) {
  
  pos1 <- intcode[i + 1] + 1
  pos2 <- intcode[i + 2] + 1
  pos3 <- intcode[i + 3] + 1 
  
  if (i %% 4 == 1) {
    if (intcode[i] == 1) {
      intcode[pos3] <- intcode[pos1] + intcode[pos2]
    } else if (intcode[i] == 2) {
      intcode[pos3] <- intcode[pos1] * intcode[pos2]
    } else if (intcode[i] == 99) {
      break
    }
  } else if (i %% 4 == 2) {
    next()
  } else if (i %% 4 == 3) {
    next()
  } else if (i %% 4 == 0) {
    next()
  }
}

answer <- intcode[1]
answer

# Explanation:
# After loading in the data, the values 1 and 2 (R indexing starts with 1, so here 2 and 3)
# are replaced according to the instructions. In a for loop, we iterate over every element.
# In each iteration, we define where the three integers after the Opcode are located.
# If the iterator division gives us any other number than 1, 
# the iteration continues to the next Opcode.
# If the remain of the iterator divided by 4 gives us 1, it's the Opcode (first digit).
# We check, if it's one, two or 99. If 99, the loop breaks. 

# Part 2 ------------------------------------------------------------------



rm(list = ls())

intcode <- readLines("2019/data/Day2.txt")
intcode <- as.vector(strsplit(intcode, split = ","))
intcode <- as.integer(unlist(intcode))

intcode
intcodebkp <- intcode

par_combos <- expand.grid(noun = 0:99, verb = 0:99)

for (j in 1:nrow(par_combos)) {
  intcode[2] <- par_combos$noun[j]
  intcode[3] <- par_combos$verb[j]
  
  for (i in 1:153) {
    pos1 <- intcode[i + 1] + 1
    pos2 <- intcode[i + 2] + 1
    pos3 <- intcode[i + 3] + 1
    
    if (i %% 4 == 1) {
      if (intcode[i] == 1) {
        intcode[pos3] <- intcode[pos1] + intcode[pos2]
      } else if (intcode[i] == 2) {
        intcode[pos3] <- intcode[pos1] * intcode[pos2]
      } else if (intcode[i] == 99) {
        break
      }
    } else if (i %% 4 == 2) {
      next()
    } else if (i %% 4 == 3) {
      next()
    } else if (i %% 4 == 0) {
      next()
    }
  }
  if (intcode[1] != 19690720) {
    intcode <- intcodebkp
  } else {
    print(par_combos[j,])
    print(paste0("The answer is ", (100 * par_combos[j,1]) + par_combos[j,2]))
    break
  }
}

# Explanation:
# We know that we are looking for a combination of numbers ranging from 0:99 in both
# positions 1 and 2 (2 and 3 in R), so that the position 0 (1 in R) is equal to 19690720
# With expand.grid, we create a dataframe with all possible combinations. 100^2 means 
# 10000 rows. We iterate over every combinations and within each iteration we plug the values
# into positions 1 and 2 (2 and 3 in R) and run the first loop over the intcode.
# Inside every iteration, the last condition checks whether the 0 element (1st in R) is equal
# to the desired number. If yes, it prints the values and the answer and breaks the loop.

