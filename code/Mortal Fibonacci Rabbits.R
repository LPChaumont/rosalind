data <- read.table("data/rosalind_fibd.txt",
                 sep = "" ,
                 col.names = c("n", "m"))

fibd <- function(n,m){
  matrix <- matrix(data = 0, 
                   nrow = n,# row = month
                   ncol = m)# column = age
  matrix[1,1] <- 1
  
  for(i in 2:n){
    for(j in 1:m){
      if(j == 1){
        matrix[i,j] <- sum(matrix[(i-1),2:m])
      }
      else{
        matrix[i,j] <- matrix[(i-1),(j-1)]
      }
    }
  }
  return(cat(sum(matrix[n,])))
}

fibd(data$n, data$m)

# I am 95% certain the code is good but I think there may be
# some variability given the max integer number in R.
# That is why the answer is wrong in Rosalind

