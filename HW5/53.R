library(ggplot2)
library(tidyverse)

set.seed(17)

x <- seq(0,1, length.out = 1000)
y <- c(0,0.1,0.5)

pxy <- function(x,y){
  return(6*(x - y)^2)
}

px <- function(x){
  return(6*(x^2-x+1/3))
}

py <- function(y){
  return(6*(y^2-y+1/3))
}

pxcy <- function(x,y){
  return(pxy(x,y)/py(y))
}

x_axis <- seq(0,1, length.out = 100)
y_axis <- seq(0,1, length.out = 100)
df <- expand.grid(x_axis, y_axis)
colnames(df) <- c("x", "y")
df <- cbind(df, pdf = pxy(df$x, df$y))

ggplot(df, aes(x=x, y=y, color=pdf)) + 
  geom_point()

samps <- NULL
for (i in 1:10000){
  tx <- runif(1, 0, 1)
  ty <- runif(1, 0, 1)
  pdf <- pxy(tx,ty)
  acc <- runif(1,0,6)
  if (acc <= pdf){
    samps <- rbind(samps, c(tx,ty))
  }
}
df <- as.data.frame(samps)
colnames(df) <- c("x", "y")
ggplot(df, aes(x=x, y=y)) +
  geom_point()

df <- tibble(
  x = x_axis,
  mar = px(x),
  y0 = pxcy(x,0),
  y0.1 = pxcy(x,0.1),
  y0.5 = pxcy(x,0.5),
) %>% gather(dist, value, -x)

ggplot(df, aes(x=x, y=value, color=dist)) +
  geom_line()
