library(ggplot2)
library(tidyverse)

set.seed(17)

pxy <- function(x,y){
  return(1/(y+1)*exp(-x/(y+1))*0.5^(y+1))
}

py <- function(y){
  0.5 * (1 - 0.5)^y
}

pxcy <- function(x,y){
  return(pxy(x,y)/py(y))
}

y <- rgeom(100000, 0.5)

ggplot(data=data.frame(y = y), aes(x = y)) +
  geom_bar()

x <- rexp(100000, rate = 1 / (y+1)) 

ggplot(data=data.frame(x = x), aes(x = x)) +
  geom_density()

xcy <- x[y == 5] 

mean(xcy) # E[X|Y = 5]

mean(x) # E[X]
