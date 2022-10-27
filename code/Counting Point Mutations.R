library(Biostrings)

seq <- DNAStringSet(readLines("data/rosalind_hamm.txt",
                              warn = FALSE))

mutation_count <- function(x){
  count <- 0
  for(i in 1:nchar(x[1])){
    if(x[[1]][i] != x[[2]][i]){
      count <- count + 1
    }
  }
  return(count)
}

cat(mutation_count(seq))
