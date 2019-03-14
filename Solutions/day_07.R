inp       <- readLines("input_day_07.txt")
sep       <- matrix(unlist(strsplit(inp, " -> ")), ncol = 2, byrow = TRUE)
left      <- sep[,1]
output    <- sep[,2]
command   <- gsub("[^::A-Z::]", "", inp)
left_inps <- gsub("[::A-Z::]", "", left)

# Part One and Two
for(part in 1:2){
  mat <- NULL
  for(i in 1:nrow(sep)){
    pos   <- unlist(strsplit(left_inps[i], " ")) 
    input <- pos[which(pos != "")]
    mat   <- rbind(mat, cbind(input, input, output[i], command[i], "."))
  }
  
  if(part == 2){
    mat[which(mat[, 3] == "b"), c(1,2)] <- result
  }
  
  stop <- 0
  while(stop == 0){
    for(j in output){
      inds <- which(mat[,3] == j)
      inps <- mat[inds, 2]
      cmd  <- mat[inds[1], 4]
      pres <- mat[inds[1], 5]
      if(!any(inps %in% output) & pres == "."){
        if(cmd == ""){
          num <- inps
        }else if(cmd == "NOT"){
          bts   <- !as.numeric(intToBits(as.numeric(inps)))[1:16]
          num  <- sum(bts * 2 ^ c(0:15))
        }else if(cmd == "AND"){
          num <- bitwAnd(as.numeric(inps[1]), as.numeric(inps[2]))
        }else if(cmd == "OR"){
          num <- bitwOr(as.numeric(inps[1]), as.numeric(inps[2]))
        }else if(cmd == "LSHIFT"){
          num <- bitwShiftL(as.numeric(inps[1]), as.numeric(inps[2]))
        }else if(cmd == "RSHIFT"){
          num <- bitwShiftR(as.numeric(inps[1]), as.numeric(inps[2]))
        }
        mat[inds, 5] <- num
        mat[which(mat[,1] == j),2] <- num 
      }
      if(mat[which(mat[,3] == "a"), 5] != "."){
        stop <- 1
      }
    }
  }
  result <- mat[which(mat[,3] == "a"), 5]
  cat("Part", part, ":", result, "\n")
}
