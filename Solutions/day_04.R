input <- readLines("input_day_04.txt")
library(digest)

# Part One
i <- 0
while(TRUE){
  i <- i + 1
  h_inp <- paste0(input, i)
  hash <- digest(h_inp, algo = "md5", serialize = F)
  h_l <- unlist(strsplit(hash, ""))
  frs <- h_l[1:5]
  if(sum(frs == 0) == 5){
    break
  }
}
cat(i)


# Part Two
zs <- NULL
i  <- 0
while(TRUE){
  i <- i + 1
  h_inp <- paste0(input, i)
  hash <- digest(h_inp, algo = "md5", serialize = F)
  h_l <- unlist(strsplit(hash, ""))
  frs <- h_l[1:6]
  zs <- c(zs, sum(frs == 0))
  if(sum(frs == 0) == 6){
    break
  }
}
cat(i)
