input <- input <- readLines("input_day_25.txt")
nms   <- gsub("[^[:digit:]]", " ", input)
nms   <- as.numeric(unlist(strsplit(nms, " ")))
nms   <- nms[!is.na(nms)]
n     <- sum(1:nms[2]) + sum(nms[2]:(sum(nms) - 2))
x     <- 252533
y     <- 33554393
num   <- 20151125
for(i in 1:(n-1)){
  num <- (num * x) %% y
}
cat(num)
