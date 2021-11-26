set.seed(17)

nsamps <- 1000

means_n <- vector(mode = "numeric", length = nsamps)
means_c   <- vector(mode = "numeric", length = nsamps)
medians_n <- vector(mode = "numeric", length = nsamps)
medians_c <- vector(mode = "numeric", length = nsamps)

for (i in 1:nsamps){
  tmp_n <- rnorm(i)
  tmp_c <- rcauchy(i)
  means_n[i]   <- mean(tmp_n)
  means_c[i]   <- mean(tmp_c)
  medians_n[i] <- median(tmp_n)
  medians_c[i] <- median(tmp_c)
}

df <- data.frame("distribution" = c(rep("normal", 2 * nsamps),
                                    rep("Cauchy", 2 * nsamps)),
                 "type"         = c(rep("mean", nsamps),
                                    rep("median", nsamps),
                                    rep("mean", nsamps),
                                    rep("median", nsamps)),
                 "value"        = c(means_n, medians_n, means_c, medians_c),
                 "n"            = rep(1:nsamps, times=4))

ggplot(data=df, aes(x = n, y = value)) +
  geom_line(alpha = 0.5) +
  facet_wrap(~ type + distribution, scales = "free")

