set.seed(17)

nsamps <- 10000
x <- runif(nsamps,0,1)
y <- runif(nsamps,0,x)

1/24

cov(x,y)

(1/24)/(sqrt(7 / (12 * 144)))

cor(x,y)

ggplot(data.frame(x = x, y = y), aes(x = x, y = y)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm")