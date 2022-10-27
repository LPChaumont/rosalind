data <- read.table("data/rosalind_iprb.txt",
                    col.names = c("k", "m", "n"))

k <- data[,"k"]
m <- data[,"m"]
n <- data[,"n"]
total_pop <- k+m+n


# prob_kk <- (k/total_pop)*((k-1))/(total_pop-1)

# prob_kk can be simplify to
# prob_kk <- (k^2-k)/(total_pop^2-total_pop)

# same for all the events that produce a dominant individual

# prob_km <- (k*m)/(total_pop^2-total_pop)
# prob_mk <- (m*k)/(total_pop^2-total_pop)
# prob_nk <- (n*k)/(total_pop^2-total_pop)
# prob_kn <- (n*k)/(total_pop^2-total_pop)
# prob_mm <- (0.75*(m^2-m))/(total_pop^2-total_pop)
# prob_mn <- (0.5(m*n))/(total_pop^2-total_pop)
# prob_nm <- (0.5(n*m))/(total_pop^2-total_pop)

# it can all be simplify into one equation

total_prob <- ((k^2-k) + (2*k*m) + (2*k*n) + (0.75*(m^2-m)) + (m*n)) / (total_pop^2 - total_pop)

cat(total_prob)

