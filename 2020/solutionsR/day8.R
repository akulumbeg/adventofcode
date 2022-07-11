# Day 8 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day8.txt", warn = F)
input <- as.data.frame(matrix(unlist(strsplit(input, " ")), ncol = 2, byrow = T))
input$iter <- F  
names(input) <- c("inst", "val", "iter")
 
acc <- 0
pos <- 1
inst <- " "
visited <- c()

bootcode <- function(input, acc, pos) {
  
  inst <<- input$inst[pos]
  
  # if (input$iter[pos] == T) {
  #   
  #   return (pos)
  #   #return(acc - as.integer(input$val[pos]))
  #   
  # } else {
      

    visited <<- c(visited, pos)
    
    
    
    if (inst == "nop") {
      pos <<- pos+1
    } else if (inst == "acc") {
      acc <<- acc + as.integer(input$val[pos])
      pos <<- pos+1
    } else {
      pos <<- pos + as.integer(input$val[pos])
    }
    
    if (pos %in% visited) {
      return("done")
    } else {
      bootcode(input, acc, pos)
    }
    
    
    
}



bootcode(input, acc, pos)





# Day 8 - Part 2 ----------------------------------------------------------

