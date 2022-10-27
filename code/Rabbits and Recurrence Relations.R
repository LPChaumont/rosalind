nk <- read.table("data/rosalind_fib.txt",
           sep = "" ,
           col.names = c("K", "N"))

n <- nk[1,1]
k <- nk[1,2]

fib <- c(1, 1)

for(i in 3:n){
  fib[i] <- fib[i-1] + fib[i-2]*k
  if(i == n){
    print(format(fib[i], scientific = FALSE))
  }
}

