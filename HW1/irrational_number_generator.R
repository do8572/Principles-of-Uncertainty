set.seed(17)

n_iter = 1000

is_rational<-function(decimal){
  for(exp in 1:n_iter){
    if((decimal * 2^exp) %% 1 == 0){
      return(T)
    }
  }
  return(F)
}

n_tries = 1000

irr_runif<-function(){
  for(iter in 1:n_tries){
    s <- runif(1, 0, 1)
    if(!is_rational(s)){
      return(s)
    }
  }
  print("maxiter reached")
  return(-1)
}

