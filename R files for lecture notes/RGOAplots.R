library(tidyverse)

ggplot() +
  xlim(c(1,30)) +
  geom_function(fun = function(x) RGOAIF(.01,.04,x),
                aes(color = "g = 1%")) +
  geom_function(fun = function(x) RGOAIF(.05,.04,x),
                aes(color = "g = 5%")) +
  labs(y = "Present Value", x = "Number of periods", color = "Growth Rate"
       , caption = "Assuming a valuation rate of 4%.") +
  theme_bw()



ggplot() +
  xlim(c(1,30)) +
  geom_function(fun = function(x) RGOAIF(.04,.01,x),
                aes(color = "v = 1%")) +
  geom_function(fun = function(x) RGOAIF(.04,.05,x),
                aes(color = "v = 5%")) +
  labs(y = "Present Value", x = "Number of periods", color = "Valuation Rate"
      , caption = "Assuming a growth rate of 4%") +
  theme_bw()