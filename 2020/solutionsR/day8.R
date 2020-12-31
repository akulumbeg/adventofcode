# Day 8 - Part 1 ----------------------------------------------------------

input <- readLines("2020/data/day8.txt", warn = F)
input <- strsplit(input, " ")
input <- as.data.frame(matrix(unlist(input), ncol = 2, byrow = T))
names(input) <- c("inst", "value")
input$value <- as.integer(input$value)
input$accu <- NA
input$checked <- FALSE

# jumper <- function(input, i = 1) {
#   
#   if(input$inst[i] == "acc" & input$checked[i] == FALSE) {
#     
#     input$checked[i] == T
#     
#   } else if (input$inst[i] == "jmp" & input$checked[i] == FALSE) {
#     
#     input$checked[i] == T
#     
#   } else if (input$inst[i] == "nop" & input$checked[i] == FALSE) {
#     
#     input$checked[i] == T
#     jumper(input, i + 1)
#     
#   } else {
#     return("Error")
#   }
#   
#   
#   
#   
#   return(input)
# }

while (i <= length(input)) {
  if (input$checked == F) {
    
  }
}

outputdf <- jumper(input, 1)


# Day 8 - Part 2 ----------------------------------------------------------

