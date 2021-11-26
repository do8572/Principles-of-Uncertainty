set.seed(17)

x <- c(2.1, -0.5, 1, -2, 4)
y <- c(8, 11, 10, 12, 9)

mx <- mean(x)
my <- mean(y)

covxy <- sum((x - mx) * (y - my)) / (length(x) - 1)
covxy

varx <- sum((x - mx) * (x - mx)) / (length(x) - 1)
vary <- sum((y - my) * (y - my)) / (length(y) - 1)
varx
vary

corxy <- covxy / sqrt(varx * vary)
corxy

4 * varx + 9 * vary - 12 * covxy
