input <- readLines("input_day_18.txt")
inp   <- matrix(unlist(strsplit(input, "")), ncol = 100, byrow = TRUE)
mt    <- rbind(".", inp, ".")

# Functions
nb <- function(matrix, y, x){
  z <- c(matrix[y - 1, x - 1], matrix[y - 1, x], matrix[y - 1, x + 1],
         matrix[y, x - 1], matrix[ y, x + 1],
         matrix[y + 1, x - 1], matrix[y + 1, x], matrix[y + 1, x + 1])
  sum(z == "#")
}

run <- function(part){
  mat <- cbind(".", mt, ".")
  for(k in 1:100){
    mt_n <- matrix(rep(".", 102^2), ncol = 102)
    for(i in 2:101){
      for(j in 2:101){
        n <- nb(mat, j, i)
        
        if(mat[j, i] == "#"){
          if(n == 2 | n == 3){
            mt_n[j, i] <- "#"
          }
        }else{
          if(n == 3){
            mt_n[j, i] <- "#"
          }
        }
      }
    }
    if(part == 2){
      mt_n[2, 2] <- mt_n[2, 101] <- mt_n[101, 2] <- mt_n[101, 101] <- "#"
    }
    mat <- mt_n
  }
  result <- sum(mat == "#")
  cat(result)
}

# Part One
run(1)

# Part Two
run(2)
