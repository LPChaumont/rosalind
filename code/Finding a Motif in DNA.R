library(Biostrings)

seq <- DNAStringSet(readLines("data/rosalind_subs.txt",
                              warn = FALSE))

cat(start(matchPattern(seq[[2]], seq[[1]])))

