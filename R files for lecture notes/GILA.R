GILA<-function(x,v,m,b){
  integrand<-function(t){exp(-v*t + exp((x-m)/b)*(1-exp(t/b)))}
  integrate(integrand,0,Inf)$value
}

