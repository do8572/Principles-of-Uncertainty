set.seed(17)

mu <- 0.4
sigma <- 0.5
x <- rnorm(100000, mean = mu, sd = sigma)

mean(2*x + 4)

2 * mu + 4

mean(x^2)

mu^2 + sigma^2

mean(exp(x))

exp((2*mu+sigma^2)/2)
