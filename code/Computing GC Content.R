library(Biostrings)
library(glue)

seq <- readDNAStringSet("data/rosalind_gc.txt")

gc_content <- function(x){
  for(i in 1:length(x)){
    res <- rep(NA, length(x))
    gc <- alphabetFrequency(x[i])
    res[i] <- (gc[,"G"] + gc[,"C"])/width(x[i]) * 100
  }
  return(glue("{names(seq[which.max(res)])}
              {res[which.max(res)]}"))
}

gc_content(seq)
