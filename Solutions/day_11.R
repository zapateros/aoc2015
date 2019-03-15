input       <- readLines("input_day_11.txt")
password    <- unlist(strsplit(input, ""))
not_allowed <- c("i", "o", "l")
allowed_l   <- letters[!letters %in% not_allowed ]

# Create increasing letter pairs
incs <- NULL
for(i in 1:24){
  x <- paste(letters[i:(i + 2)], collapse = "")
  incs <- c(incs, x)
}
incs <- paste(incs, collapse = "|")

# functions
iol <- function(vector){
  !any(not_allowed  %in% vector)
}

inc <- function(vector){
  string <- paste(vector, collapse = "")
  grp    <- grep(incs, string)
  
  length(grp) > 0
}

prs <- function(vector){
  run_length <- rle(vector)
  ind <- run_length$lengths > 1
  if(any(ind)){
    pairs <- run_length$values[ind]
    length(table(pairs)) > 1
  }else{
    FALSE
  }
}

nxt <- function(i = length(password)){
  n   <- which(allowed_l == password[i])
  n_n <- n %% length(allowed_l) + 1
  password[i] <<- allowed_l[n_n]
  k   <- i - 1
  
  if(n == length(allowed_l)){
    if(password[k] == "z"){
      nxt(k)
    }else{
      kn <- which(allowed_l == password[k])
      password[k] <<- allowed_l[kn + 1]
      
    }
  }
  return(password)
}

# Run
part <- 1
while(TRUE){
  t1 <- iol(password)
  t2 <- inc(password)
  t3 <- prs(password)
  if(t1 & t2 & t3){
    cat("Part", part, ":",paste(password, collapse = ""), "\n")
    part <- part + 1
    if(part == 3){
      break
    }
  }
  nxt()
}
