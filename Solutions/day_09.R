library(igraph)
input  <- readLines("input_day_09.txt")
inp    <- matrix(unlist(strsplit(input, " ")), ncol = 5, byrow = TRUE)[, c(1, 3, 5)]
cities <- unique(c(inp[,c(1, 2)]))
g      <- graph_from_edgelist(inp[,c(1, 2)], directed = FALSE)
mat    <- rbind(inp, inp[,c(2, 1, 3)])
m1     <- paste(mat[,1], mat[,2], sep = "-")
m2     <- as.numeric(mat[,3])

shortest <- Inf
longest  <- 0
for(k in cities){
  pts <- all_simple_paths(g, from = k)
  for(i in 1:length(pts)){
    rel <- names(unlist(pts[[i]]))
    if(length(rel) == 8){
      cnt <- 0
      for(j in 1:7){
        x   <- paste(rel[j], rel[j + 1], sep = "-")
        num <- m2[which(m1 == x)] 
        cnt <- cnt + num
      }
      if(cnt < shortest){
        shortest <- cnt
      }
      if(cnt > longest){
        longest <- cnt
      }
    } 
  }
}

# Part One
cat(shortest)

# Part Two
cat(longest)
