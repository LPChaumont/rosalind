data <- read.csv("data/rosalind_iev.txt", sep = " ", header = F)

# probability of offspring displaying the dominant phenotype 
# in the next generation according to each genotype
p_dom <- c(1, 1, 1, 0.75, 0.5, 0)

prob <- data * p_dom

res <- sum(prob)*2

print(res)
