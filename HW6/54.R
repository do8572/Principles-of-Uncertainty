library(ggplot2)

set.seed(17)

nsamps <- 1000

beta <- 1
alfa <- 1

rx <- rgamma(nsamps, alfa, beta)
ryx <- rpois(nsamps, rx)
ggplot(data = data.frame(x = rx, y = ryx), aes(x = x, y = y)) + geom_point()

py <- function(y){
  return(1/factorial(y) * beta^alfa / gamma(alfa) *
           gamma(y + alfa) / (1 + beta)^(y + alfa))
}

ty <- seq(0, 10, length.out = 1000)
mar <- py(ty)

ggplot(data = data.frame(x = rx, y = ryx), aes(x = y)) +
  geom_bar(aes(y = (..count..)/sum(..count..))) +
  stat_function(fun = py, color = "red")
