# Eqn 8.5
fairNSP <- function(q,v,P=1,x=NA,n=NA) {
  # Enforce types
  q <- as.numeric(q)
  v <- as.numeric(v)[1]
  x <- as.integer(x)[1]
  n <- as.integer(n)[1]
  
  # If x is defined, trim (assume vector starts at age zero)
  if (!is.na(x) & x > 1) {
    q <- q[-(1:x)]
  }
  
  # Check if n is undefined
  # If so, set n to length of q
  # If not, remove irrelevant length from q
  if (!is.na(n)) {
    stopifnot(n <= length(q))
    q <- q[1:n]
  } else {
    n <- length(q)
  }
  
  # I think p is just the cumulative product of 1-q?
  # In the table, p starts at 0p = 1. Shift by 1.
  # Note that the [-n] simply eliminates the 10th element from the cumprod
  p <- c(
    1,
    cumprod(1-q)[-n]
  )
  
  pv_denom <- (1+v)^(1:n)
  
  return(data.frame(
    q = q,
    p = p,
    excomp = P*q*p,
    pv_excomp = (P*q*p)/pv_denom
  ))
}