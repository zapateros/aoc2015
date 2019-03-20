input <- readLines("input_day_19.txt")
med <- input[length(input)]
inp1 <- input[-length(input)]
inp <- matrix(unlist(strsplit(inp1, " => ")), ncol = 2, byrow = TRUE)

# Part One
meds<- NULL
for(i in 1:nrow(inp)){
  chrs <- inp[i, 1]
  n    <- nchar(chrs)
  repl <- inp[i, 2]
  inds <- unlist(gregexpr(chrs, med))
  
  for(j in inds){
    if(j != -1){
      x1 <- substr(med, 1, j - 1)
      x2 <- substring(med, j + n)
      nw <- paste0(x1, repl, x2)
      meds <- c(meds, nw)
    }
  }
}
result <- length(unique(meds))
cat(result)

# Part Two
subs <- inp[rev(order(nchar(inp[, 2]))),]
med <- input[length(input)]
i <- 1
count <- 0
while(TRUE){
  if(med == "e"){
    break
  }
  sb <- subs[i, 2]
  if(length(grep(sb, med)) != 0){
    med <- sub(sb, subs[i, 1], med)
    count <- count + 1
    i <- 1
  }else{
    i <- i + 1
  }
}
cat(count)
