library(Biostrings)

data <- readDNAStringSet("data/rosalind_lcsm.txt")

lcs <- function(x){
  
  seq <- strsplit(toString(x), ", ")[[1]]
  n <- length(seq)
  s <- seq[which.min(nchar(seq))][[1]]
  l <- nchar(s)
  allsubstring <- vector(mode = "list", length = l)
  res <- c("")
  
  # vector of all possible substrings of the shortest sequence
  for(i in 1:l){
    allsubstring[[i]] <- unique(substring(s, 1:(nchar(s) - i + 1), i:nchar(s)))
  }
  allsubstring <- unlist(allsubstring)
  
  # check for the longest substring that is in all sequences
  for(j in length(allsubstring):1){
    if(all(grepl(allsubstring[j], seq, fixed = TRUE))){
      res <- allsubstring[j]
      break
    }
  }
  return(res)
}


lcs(data)