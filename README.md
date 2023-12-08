#Question 1

- The analysis done in this practical was of a bacteria culture in growth media, which rapidly increased its population size to start with, but didn't have any more food resources added to it. Causing it to reach its carrying capacity.
- This meant the population growth curve, with time on the X-axis and population on the Y-axis had a logsitic shape. Starting off growing exponentially then slowing down. 
- We carried out analysis to find the intial population size (N0), the rate of growth (r) and the carrying capacity (K), of the experimental data from the experiment3.csv file.
-We were given three R scripts to help us with this analysis.
- The first, plot_data.R, was used to plot the experiment3.csv data, which showed it had a logistic curve. The second plot was with a Ln scale on the Y axis. Which was linear to start with then levelled off.
- Then the fit_linear_model.R script was used. The first section was used to estimate N0 and r, it did this by fitting a linear regression model, to the first part of the data which was linear when log(e) transformed, t<3000. The summary function was then used to find the co-efficients of the model. The gradient which = r, and the intercept which = N0. 
- The second part of this script was used to find K, a linear regression was fitted to the part of the curve where the line was horizontal, when t>4000. The model fitted, only returned a intercept term, which is the average value of N when T was above 4000, which is our estimate for K.
- With these estimates for N0, r and K we had enough information to be able to fit a curve to the data.
- For this we used the plot_data_and_model.R script. To do this, we created a logistic growth function, set the N0, r and K parameters. Then overlayed this logistic curve over the experiment3.csv data. The logistic function had a very accurate fit to the experimental data. 
- The estimates I got were: N0 = 8696, r = 0.004794, K = 4998000000.

#Question 2

N0 = 8696 and r = 0.004794
Nt = N0e^rt
Nt = 8696*e^0.004794*4980
Nt = 2.031x10^14
Nt under logistic growth at t = 4980 would be at the carrying capacity of 4.998x10^9, however with continuous exponential growth Nt would be 2.031x10^14. This is 5 orders of magnitude larger, and is a less accurate prediction because it fails to account for density dependence caused by the limited resources. 

#Question 3

```{r}
#Reading experimental data in
growth_data <- read.csv("experiment3.csv")

#Setting parameters for logistic function

N0 <- 8696
r <-  0.004794
K <- 4998000000 

#Creating logistic function
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
}
#Creating exponential function
exponential_fun <- function(t) {
  N<- N0*exp(r*t)
}
#Plotting the two functions with the data so they can be compared
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  geom_function(fun=exponential_fun, colour= "green")+
  scale_y_continuous(limits = c(0, 8000000000))+
  
  geom_point(size=0.5)
```
Image of graph below
<img width="932" alt="image" src="https://github.com/shil5810/logistic_growth/assets/150165229/0d1b1fc0-3c47-4283-846b-202a79aa0900">

