password.generator <- function(len=10, n=1){
  
  dummydt=data.frame(matrix(ncol=0,nrow=n))
  
  comb = c(LETTERS, letters, 0:9)
  
  p=c(rep(0.005,26), rep(0.035,26), rep(0.02,10))
  
  pw = replicate(nrow(dummydt),paste0(sample(comb, len, prob = p), collapse = ""))
  
  dummydt$pw = pw
  
  return(dummydt)
  
  
}


password.generator()
