library(seqinr)

rna <- ((readLines("data/rosalind_prot.txt",
                 warn = FALSE)))

dna <- chartr("U","T", rna)

dna <- s2c(dna)

prot <- translate(dna)

cat(prot, sep = "")

