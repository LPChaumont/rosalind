library(Biostrings)

seq <- readLines("data/rosalind_revc.txt")

seq <- DNAStringSet(seq)

res <- reverseComplement(seq)

as.character(res)

