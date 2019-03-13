setwd("C:/Users/paul/Documents/R-projects/AoC 2015/day_02")
input  <- readLines("input_day_02.txt")
inp    <- matrix(as.numeric(unlist(strsplit(input,"x"))), ncol = 3, byrow = TRUE)
paper  <- 0
ribbon <- 0
for(i in 1:nrow(inp)){
  rel <- inp[i,]
  sm  <- rel[1] * rel[2] + rel[2] * rel[3] + rel[3] * rel[1]
  or  <- rel[order(rel)]
  l   <- or[1] * or[2]
  r1  <- or[1] + or[2]
  r2  <- rel[1] * rel[2] * rel[3]
  
  paper  <- paper + 2 * sm + l
  ribbon <- ribbon + 2 * r1 + r2
}

# Part One
cat(paper)

# Part Two
cat(ribbon)