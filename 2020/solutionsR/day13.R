# Day 13 - Part 1 ---------------------------------------------------------

input <- readLines("2020/data/day13.txt", warn = F)
timestamp <- as.integer(input[1])
busIDs <- gsub("x", "0", input[2])
busIDs <- unlist(strsplit(busIDs, ","))
busIDs <- as.integer(busIDs[-which(busIDs == 0)])


M <- prod(m)
x <- 0
for (i in 1:n) {
  Mmi <- prod(m[-i])  # or: Mmi <- M/m[i]
  mmi <- modinv(Mmi, m[i])
  x <- x + a[i] * Mmi * mmi
}
return(x %% M)


result <- 


  
  
  

# Day 13 - Part 2 ---------------------------------------------------------