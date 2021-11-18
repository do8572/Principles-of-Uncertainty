library(ggplot2)
library(tidyverse)

nsamples <- 1000
x <- rnorm(nsamples)
y <- rnorm(nsamples)

df <- data.frame(x,y)

ggplot(df, aes(x = x, y = y)) +
  geom_point()

y1 <- rnorm(nsamples, mean=1*x)
y2 <- rnorm(nsamples, mean=0*x)
y3 <- rnorm(nsamples, mean=-0.5*x)

df <- tibble(
      x = c(x,x,x),
      y = c(y1,y2,y3),
      a = c(rep(1, nsamples),rep(0, nsamples),rep(-0.5, nsamples))
)

ggplot(df, aes(x=x, y=y)) +
  geom_point() +
  facet_wrap(~a) +
  coord_equal(ratio=1)

##COMENT: Parameter is the covariance of x and y.
##        Assuming it is normalized it is the correlation
##        and geometrically it is the angle at which y is
##        on average from the diagonal given x.

ggplot(df, aes(x=y)) +
  geom_density() +
  facet_wrap(~a)
