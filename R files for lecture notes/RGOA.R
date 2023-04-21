#Equation for Regular Growth Ordinary Annuity (RGOA), p16
RGOA<-function(g,v,N) {
  (1-((1+g)^N)*(1+v)^(-N))/((v-g)/(1+g))
}

