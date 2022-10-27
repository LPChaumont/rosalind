seq <- readLines("data/rosalind_rna.txt")

res <- gsub("T", "U", seq)

print(res)

