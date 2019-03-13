setwd("C:/Users/paul/Documents/R-projects/AoC 2015/day_03")
input <- readLines("input_day_03.txt")
inp   <- unlist(strsplit(input, ""))
x     <- as.numeric(c(-1, 0, 0, 1, inp)[match(inp, c("<", "^", "v", ">", inp))])
y     <- as.numeric(c(0, -1, 1, 0, inp)[match(inp, c("<", "^", "v", ">", inp))])

# Part One
houses <- paste(cumsum(x), cumsum(y))
result <- length(unique(houses))
cat(result)

# Part Two
seq_s <- seq(1, length(inp), by = 2)
seq_r <- seq(2, length(inp), by = 2)
x_s <- x[seq_s]
y_s <- y[seq_s]
x_r <- x[seq_r]
y_r <- y[seq_r]

houses_s <- paste(cumsum(x_s), cumsum(y_s))
houses_r <- paste(cumsum(x_r), cumsum(y_r))
result   <- length(unique(c(houses_s, houses_r)))
cat(result)
