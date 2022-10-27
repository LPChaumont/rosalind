library(seqinr)

myseq <- read.alignment("data/rosalind_cons.txt",
                        "fasta",
                        forceToLower = FALSE)

myseq <- as.matrix(myseq)

profile <- consensus(myseq, method = "profile")

consensus <- consensus(myseq, method = "majority")

# make a text file
sink("res_cons.txt")
cat(toupper(consensus), "\n", sep = "")
cat("A: ", profile["a",],"\n", sep = " ")
cat("C: ", profile["c",],"\n", sep = " ")
cat("G: ", profile["g",],"\n", sep = " ")
cat("T: ", profile["t",],"\n", sep = " ")
sink()

# remove the text file
unlink("res_cons.txt")

