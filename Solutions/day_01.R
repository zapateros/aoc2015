input <- readLines("input_day_01.txt")
inp   <- unlist(strsplit(input,""))
nums  <- gsub("\\(","1",inp)
nums  <- gsub(")","-1",nums)
nm    <- as.numeric(nums)

# Part One
result <- sum(nm)
cat(result)

# Part Two
floor <- cumsum(nm)
result <- min(which(floor == -1))
cat(result)
