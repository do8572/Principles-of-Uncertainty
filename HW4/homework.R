py <- function(y, mu, std){
  return(exp((-(log(y)-mu)^2/(2*std^2)))/(sqrt(2*pi)*std*y))
}

s_y <- sample(seq(1,100, 0.01), 10000, replace=T)
s_py <- py(s_y, 0.5, 0.4)
hist(s_py)
s_logy <- log(s_y)
hist(py(s_logy, 0.5, 0.4))