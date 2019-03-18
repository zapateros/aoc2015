input <- readLines("input_day_14.txt")
inp   <- matrix(unlist(strsplit(input, " ")), ncol = 15, byrow = TRUE)
mt    <- matrix(as.numeric(inp[,c(4, 7, 14)]), ncol = 3)
t     <- 2503

# Part One
speeds <- NULL
for(i in 1:nrow(mt)){
  x1     <- mt[i, 1]
  x2     <- mt[i, 2]
  x3     <- mt[i, 3]
  n      <- ceiling(t / (x2 + x3))
  y      <- rep(c(rep(x1, x2), rep(0, x3)), n)[1:t]
  speeds <- cbind(speeds, y)
}

result <- max(colSums(speeds))
cat(result)

# Part Two
cm <- apply(speeds, 2, cumsum)
points <- rep(0, ncol(cm))
for(j in 1:nrow(cm)){
  rel  <- cm[j,]
  mx   <- max(rel)
  inds <- which(rel == mx)
  points[inds] <- points[inds] + 1
}
result <- max(points)
cat(result)
