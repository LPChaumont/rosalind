library(stringi)
library(Biostrings)

seq <- readDNAStringSet("data/rosalind_revp.txt")
seq <- as.character(seq[[1]])
comp_seq <- chartr("ATCG","TAGC", seq)

for(i in 1:nchar(seq)){
  for(j in c(3,5,7,9,11)){
    string_1 <- substring(seq, i, j+i)
    string_2 <- substring(comp_seq, i, i+j)
    if(nchar(string_1) <= j){
      break
    }
    if(string_1 == stri_reverse(string_2)){
      cat(i, " ", j+1, "\n", sep = "")
    }
  }
}
