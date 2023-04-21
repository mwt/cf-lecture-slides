nsp <- function(mdata,age,term,v) {
  
  age <- as.integer(age)
  term <- as.integer(term)
  
  mdata <- mdata[mdata$x>=age & mdata$x<=age+term-1,]
  # select the relevant rows from the data table
  
  px <- 1 - mdata$qx
  
  cump <- c(1,cumprod(px)[-term])

  discount <- 1/(1+v)^(mdata$x-age+1)
  
  pvoutflow = mdata$qx * cump * discount
  pvpremium = cump * discount * (1+v)
  
  
  
  underlyingdata <- data.frame(
    x = mdata$x,
    qx = mdata$qx,
    px = px,
    cump = cump,
    discount = discount,
    pvoutflow,
    pvpremium
  )
  
  #return(underlyingdata)
  nsp <- sum(underlyingdata$pvoutflow)
  annualpremium <- nsp / sum(underlyingdata$pvpremium)
  output <- 1000000*c(nsp,annualpremium)
  #return(1000000*nsp)
  #return(1000000*annualpremium)
  return(output)
}