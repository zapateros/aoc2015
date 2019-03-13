input <- readLines("input_day_05.txt")

# Part One
rule_1 <- nchar(gsub("[^aeiou]","",input)) > 2
lt     <- paste(letters,letters, sep = "")
rule_2 <- matrix(sapply(input, function(x){any(sapply(lt, grepl, x))}))
forbid <- c("ab", "cd", "pq", "xy")
rule_3 <- matrix(sapply(input, function(x){!any(sapply(forbid, grepl, x))}))
rules  <- cbind(rule_1, rule_2, rule_3)
result <- sum(apply(rules, 1, function(x) sum(x) == 3))
cat(result)


# Part Two
nice <- 0
for(j in 1:length(input)){
  inp  <- input[j]
  ind  <- 0
  ind2 <- 0
  for(i in 1:14){
    ss <- substr(inp, 1 + (i - 1), 2 + (i - 1))
    n  <- nchar(gsub(ss, "", inp))
    if(substr(inp, i , i) == substr(inp, i + 2, i + 2)){
      ind2 <- 1
    }
    if(n < 13){
      ind <- 1
    }
  }
  if(ind2 == 1 & ind == 1){
    nice <- nice + 1
  }
}
cat(nice)
