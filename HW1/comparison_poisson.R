set.seed(17)

samp <- rpois(n = 1000, lambda = 10)
samp <- table(s) / 1000
theoretical <- dpois(strtoi(names(samp)), 10)
ts <- rbind(samp, theoretical)
barplot(ts, beside=T, 
        col=c( "#1b1dbf",  "#e71d11" ),
        xlab="Num. of Events",
        ylab="Probability",
        legend.text=c("sampled distribution", "theoretical distribution"))
