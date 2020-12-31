# Day 9 - Part 1 ----------------------------------------------------------

# need to break my rule of only using base R, because R does not support
# 64 bit integers by default
library(bit64)

input <- scan("2020/data/day9.txt", integer64())
preamb <- 25

checker <- Vectorize(function(input, start = 26) {
  
  test <- input[(start-25):(start-1)]
  x <- expand.grid(test, test)
  x$sum <- x$Var1 + x$Var2
  t26 <- input[start]
  
  if(any(t26 == x$sum)) {
    
    return(TRUE)
    
  } else {
    
    return(FALSE)
    
  }
  
  
})

i=26
while(input[i]%in%apply(combn(input[i-25:1],2),2,sum)){i <- i+1}
cat(input[i])

sapply(input, function(x) checker(input, x))



# Day 8 - Part 2 ----------------------------------------------------------


magic <- input[i]
k  <- 2
while(!any(apply(embed(input,k),1,sum)==magic)){k <- k+1}
res <- embed(input,k)
sum(range(res[which(apply(res,1,sum)==magic),]))



