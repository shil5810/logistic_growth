#Script to plot the logistic growth data

growth_data <- read.csv("experiment3.csv")

install.packages("ggplot2")
library(ggplot2)

ggplot(aes(t,N), data = growth_data)+
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

#Plotting the same graph with a log 10n scale on the Y access

ggplot(aes(t,log10(N)), data = growth_data)+
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')
