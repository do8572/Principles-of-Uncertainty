library(ggplot2)

set.seed(17)

alpha <- 10
beta <- 2

x <- seq(0, 25, by = 0.01)
y <- dgamma(x, shape = alpha, rate = beta)

df <- data.frame(x = x, y = y)

ggplot(df, aes(x = x, y = y)) + 
    geom_line() +
    geom_segment(aes(x = 5, y = 0,
                     xend = 5, yend = dgamma(5, shape = 10, rate = 2)),
                 color = "red") +
    stat_function(fun = dgamma, args = list(shape = 10, rate = 2),
                  xlim = c(5 - sqrt(10/4), 5 + sqrt(10/4)),
                  geom = "area", fill = "gray", alpha = 0.4)
