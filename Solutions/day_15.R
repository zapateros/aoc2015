library(partitions)

input <- readLines("input_day_15.txt")
nms   <- gsub("[^[:digit:] ., -]", "", input)
mat   <- matrix(as.numeric(unlist(strsplit(nms, ","))), ncol = 5, byrow = TRUE)
cmbs  <- blockparts(rep(100, 4), 100)
mx_1  <- 0
mx_2  <- 0
for(i in 1:ncol(cmbs)){
  ings <- cmbs[, i] * mat
  sms <- colSums(ings[, c(1:4)])
  sms[sms < 0] <- 0
  x <- prod(sms)
  if(x > mx_1){
    mx_1 <- x
  }
  if(sum(ings[,5]) == 500){
    if(x > mx_2){
      mx_2 <- x
    }
  }
}

# Part One
cat(mx_1)

# Part Two
cat(mx_2)
