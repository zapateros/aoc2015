input <- readLines("input_day_16.txt")
inp   <- gsub(":", "", input)
inp   <- gsub(",", "", inp)
inp   <- matrix(unlist(strsplit(inp, " ")), ncol = 8, byrow = TRUE)
mat   <- inp[, -c(1:2)]
props <- unique(mat[,1])
prv   <- c(2, 0, 3, 0, 3, 1, 3, 7, 5, 2)

# Part One
for(i in 1:nrow(mat)){
  rel <- mat[i, ]
  x1  <- prv[which(props == rel[1])] == as.numeric(rel[2])
  x2  <- prv[which(props == rel[3])] == as.numeric(rel[4])
  x3  <- prv[which(props == rel[5])] == as.numeric(rel[6])
  if(sum(c(x1, x2, x3)) == 3){
    break
  }
}
cat(i)


# Part Two
for(i in 1:nrow(mat)){
  y <- 0
  for(j in 1:3){
    n   <- 1 + (j - 1) * 2
    k   <- n + 1
    prp <- mat[i, n]
    pv1 <- as.numeric(mat[i, k])
    pv2 <- prv[which(props == prp)]
    if(prp == "cats" | prp == "trees"){
      x <- pv1 > pv2
    }else if(prp == "pomeranians" | prp == "goldfish"){
      x <- pv1 < pv2
    }else{
      x <- pv1 == pv2
    }
    y <- y + x
  }
  if(y == 3){
    break
  }
}
cat(i)
