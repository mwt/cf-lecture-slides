#Improved equation for Regular Growth Ordinary Annuity (RGOA), p16
RGOAIF<-function(g,v,N) {
  if (g==v) {
    N
    }
  else {
    (1-((1+g)^N)*(1+v)^(-N))/((v-g)/(1+g))
  }
}

