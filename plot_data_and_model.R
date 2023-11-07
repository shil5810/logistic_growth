#Script to plot data and model

growth_data <- read.csv("experiment3.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}


N0 <- 8696 #
  
r <-  0.004794#
  
K <- 4998000000 #

ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()

  #scale_y_continuous(trans='log10')

sink(file = "package-versions.txt")
sessionInfo()
sink()


