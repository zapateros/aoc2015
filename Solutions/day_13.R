input <- readLines("input_day_13.txt")
input <- gsub("\\.", "", input)

# Create weight matrix
inp    <- matrix(unlist(strsplit(input, " ")), ncol = 11, byrow = TRUE)
gains  <- inp[,c(3,4)]
gains  <- matrix(as.numeric(c(-1, 1, gains)[match(gains, c("lose", "gain", gains))]), ncol = 2)
wgt    <- gains[,1] * gains[,2]
mat    <- cbind(rbind(inp[,c(1, 11)], inp[,c(11, 1)]), wgt)
un     <- unique(mat[,1])
n      <- length(un)
nms    <- as.numeric(c(c(1:n), mat)[match(mat, c(un, mat))])
mt     <- matrix(nms, ncol = 3)
person <- NULL

# Functions
happiness <- function(vector){
  vc <- c(vector, vector[1])
  sum <- 0
  for(i in 1:n){
    n <- which(mt[,1] == vc[i] & mt[,2] == vc[i + 1])
    sum <- sum + sum(mt[n, 3])
    
  }  
  return(sum)
}

bridge <- function(){
  for(i in 1:n){
    if(ref[i, 2] != 1){
      person    <<- c(person, i)
      ref[i, 2] <<- 1
      bridge()
      if(length(person) == n){
        sm <- happiness(person)
        if(sm > hp){
          hp <<- sm
        }
      }
      ref[i, 2] <<- 0
      person    <<- person[-length(person)]
    }
  }
  return(hp)
}

# Part One
ref <- cbind(c(1:n), 0)
hp  <- 0
bridge()

# Part Two
n <- n + 1
me <- rbind(cbind(c(1:(n-1)), n, 0 ),cbind(n, c(1:(n-1)), 0 ))
mt <- rbind(mt, me)
ref <- cbind(c(1:n), 0)
hp <- 0
bridge()
