data("AirPassengers")
str(AirPassengers)

plot(AirPassengers, main = "International Airline Passengers")
library(astsa)
plot(decompose(AirPassengers))

library(prophet)
AirPassengers.df = data.frame(
  ds=zoo::as.yearmon(time(AirPassengers)), 
  y=AirPassengers)
m = prophet::prophet(AirPassengers.df)

f = prophet::make_future_dataframe(m, periods=20, freq="quarter")

p = predict(m, f)
plot(m,p)
