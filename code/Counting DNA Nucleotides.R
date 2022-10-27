library(Biostrings)
library(glue)

seq <- readLines("data/rosalind_dna.txt")

seq <- DNAStringSet(seq)

res <- alphabetFrequency(seq)

glue("{res[1]} {res[2]} {res[3]} {res[4]}")

