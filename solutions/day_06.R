input <- readLines("input_day_06.txt")
input <- gsub(" through ", ",", input)
input <- gsub("turn on ", "1,", input)
input <- gsub("turn off ", "-1,", input)
input <- gsub("toggle ", "0,", input)
inp   <- matrix(as.numeric(unlist(strsplit(input,","))), ncol = 5, byrow = TRUE) + 1

# Part One
mt    <- matrix(rep(-1, 1000^2), ncol = 1000)
for(i in 1:nrow(inp)){
  rel <- inp[i,]
  if(rel[1] == 0){
    mt[rel[2]:rel[4], rel[3]:rel[5]] <- -1
  }else if(rel[1] == 1){
    mt[rel[2]:rel[4], rel[3]:rel[5]] <- mt[rel[2]:rel[4], rel[3]:rel[5]] * -1
  }else{
    mt[rel[2]:rel[4], rel[3]:rel[5]] <- 1
  }
}
result <- sum(mt == 1)
cat(result)

# Part Two
mt    <- matrix(rep(0, 1000^2), ncol = 1000)
for(i in 1:nrow(inp)){
  rel <- inp[i,]
  if(rel[1] == 0){
    mt[rel[2]:rel[4], rel[3]:rel[5]] <- mt[rel[2]:rel[4], rel[3]:rel[5]] - 1
    mt[mt < 0] <- 0
  }else if(rel[1] == 1){
    mt[rel[2]:rel[4], rel[3]:rel[5]] <- mt[rel[2]:rel[4], rel[3]:rel[5]] + 2
  }else{
    mt[rel[2]:rel[4], rel[3]:rel[5]] <- mt[rel[2]:rel[4], rel[3]:rel[5]] + 1
  }
}
result <- sum(mt)
cat(result)
