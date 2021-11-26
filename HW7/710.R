library(ggplot2)
library(tidyverse)
library(data.table)

set.seed(17)

nsamps <- c(5,10,100,1000)
niter <- 10000

mu <- 2
sigma <- sqrt(6)

X <- matrix(data=NA, nrow=niter, ncol = length(nsamps))
ind <- 1

for (nsamp in nsamps){
  for (i in 1:niter){
    X[i, ind] <- mean(rnorm(nsamp, mean=mu, sd=sigma))
  }
  ind <- ind + 1
}

colnames(X) <- nsamps
X <- melt(as.data.frame(X))

ggplot(data=X, aes(x= value, color=variable)) +
  geom_density() +
  stat_function(data  = data.frame(x = seq(-2, 6, by = 0.01)), aes(x = x), 
                fun   = dnorm, 
                args  = list(mean = mu, sd = sigma), 
                color = "black")
