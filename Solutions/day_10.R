input <- readLines("input_day_10.txt")
look_and_say <- function(x){
  vec    <- unlist(strsplit(as.character(x), ""))
  rlevec <- rle(vec)
  lngs   <- as.character(rlevec$lengths)
  vals   <- rlevec$values
  newstr <- as.vector(rbind(lngs, vals))
  paste(newstr, collapse="")
}

for(i in 1:50){
  input <- look_and_say(input)
  if(i == 40){
    cat("Part One:", nchar(input), "\n")
  }
  if(i == 50){
    cat("Part Two:", nchar(input))
  }
}
