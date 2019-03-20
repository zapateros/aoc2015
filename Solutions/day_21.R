input <- readLines("input_day_21.txt")

stats <- as.numeric(gsub("[^[:digit:]]","", input))
hp    <- 100
e_hp  <- stats[1]
e_at  <- stats[2]
e_df  <- stats[3]
at    <- rep(c(1:10), each = 10)
de    <- rep(c(1:10), 10)

battle <- function(attack, defense){
  a_eff <- attack - e_df
  if(a_eff < 1){
    a_eff <- 1
  }
  d_eff <- e_at - defense
  if(d_eff < 1){
    d_eff <- 1
  }
  rounds <- ceiling(e_hp / a_eff)
  win    <- hp - (rounds - 1) * d_eff
  win    > 0
}

wins <- NULL
for(i in 1:100){
  wins <- c(wins, battle(at[i], de[i]))
}

wl <- cbind(at, de, wins)
# Manual from here
