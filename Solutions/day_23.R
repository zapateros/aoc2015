input <- readLines("input_day_23.txt")
jmps  <- as.numeric(gsub("[^[:digit:]-]","", input))
inp   <- gsub(",", "", input)
inp   <- gsub("a", "1", inp)
inp   <- gsub("b", "2", inp)
i     <- 1
i_max <- length(inp)


run <- function(a, b){
  regs <- c(a, b)
  while(TRUE){
    rel <- unlist(strsplit(inp[i], " "))
    if(rel[1] == "inc"){
      regs[as.numeric(rel[2])] <- regs[as.numeric(rel[2])] + 1
      i <- i + 1
    }else if(rel[1] == "jmp"){
      i <- i + jmps[i]
    }else if(rel[1] == "jio"){
      if(regs[as.numeric(rel[2])] == 1){
        i <- i + jmps[i]
      }else{
        i <- i + 1
      }
    }else if(rel[1] == "hlf"){
      regs[as.numeric(rel[2])] <- regs[as.numeric(rel[2])] / 2
      i <- i + 1
    }else if(rel[1] == "tpl"){
      regs[as.numeric(rel[2])] <- regs[as.numeric(rel[2])] * 3
      i <- i + 1
    }else if(rel[1] == "jie"){
      if((regs[as.numeric(rel[2])] %% 2) == 0){
        i <- i + jmps[i]
      }else{
        i <- i + 1
      }
    }
    if(i > i_max){
      return(regs[2])
      break
    }
  }
}

# Part One
run(0, 0)

# Part Two
run(1, 0)
