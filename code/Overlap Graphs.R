# more elegant version at the end
library(Biostrings)
library(tidyverse)

# import data
data <- readDNAStringSet("data/rosalind_grph.txt")

# transform data into a data frame
dna <- data.frame(id = names(data),
                  seq = as.character(data)) %>%
  mutate(seq = strsplit(seq, ""))

# add prefix and suffix of length k = 3 to the data frame
dna <- dna %>%
  mutate(prefix = as.list(as.data.frame(sapply(dna$seq, head, 3))),
         suffix = as.list(as.data.frame(sapply(dna$seq, tail, 3)))) %>%
  select(- seq)

# all the combination of two sequences
seq_combination <- (combn(nrow(dna), 2))

# put all the combination of sequences u and v in a list
# this way we can iterate over two variables of same length
# using a single a single index that acts as an index for 
# referencing elements (variables) in a list
index <- list(u = seq_combination[1,],
              v = seq_combination[2,])

# function that check if the prefix and suffix match
# if it does, concatenate and print the names of the sequences (id)
# x is the the index
O3 <- function(x){
  for(i in 1:length(x$u)){
    if(dna[x$u[i],]$prefix %in% dna[x$v[i],]$suffix == TRUE){
      cat(dna[x$v[i],]$id,
          dna[x$u[i],]$id,
          "\n")
    }
  }
  
  for(i in 1:length(x$u)){
    if(dna[x$v[i],]$prefix %in% dna[x$u[i],]$suffix == TRUE){
      cat(dna[x$u[i],]$id,
          dna[x$v[i],]$id,
          "\n")
    }
  }
}
# be cautious to express you results in the form
# suffix + prefix in rosalind

# text file with the results
sink("res_grph.txt")
O3(index)
sink()

# remove the text file
unlink("res_grph.txt")

# 
# 
# 
# more elegant version
library(Biostrings)

# import data
data <- readDNAStringSet("data/rosalind_grph.txt")

# transform data into a data frame with prefix and suffix
seq <- strsplit(toString(data), ", ")[[1]]
dna <- as.data.frame(seq)
dna$names <- names(data)
dna$prefix <- substr(dna$seq, 0, 3)
dna$suffix <- apply(dna,1, FUN = function(row){s<-row[1]; substr(s, nchar(s)-2, nchar(s))})
dna <- subset(dna, select = - seq)

# data frame with all the combination possible of two sequences
n <- length(data)
eg <- expand.grid(1:n,1:n)

# remove the combination of the same sequence
eg <- eg[eg$Var1 != eg$Var2,]

# add the name of the sequence in the data frame
eg$name1<-dna[eg$Var1,]$name
eg$name2<-dna[eg$Var2,]$name

# text file with the results
sink("res_grph.txt")

# print the name of the sequences if the suffix is equal to the prefix
print(eg[dna[eg$Var1,]$suffix == dna[eg$Var2,]$prefix, c("name1","name2")], row.names=F, col.names=F)
sink()

# remove the text file
unlink("res_grph.txt")
