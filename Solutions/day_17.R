input <- as.numeric(readLines("input_day_17.txt"))
k     <- length(input)
sm    <- 0
am    <- NULL
for(i in 1:2^k){
  n  <- as.numeric(intToBits(i))[1:k]
  m  <- c(1:k)[n == 1]
  tr <- sum(input[m]) == 150
  if(tr){
    am <- c(am, length(m))
  }
  sm <- sm + tr
}

# Part One
cat(sm)

# Part Two
result <- cat(table(am)[1])
cat(result)
