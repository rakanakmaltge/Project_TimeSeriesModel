## library
library("forecast")
library("ggplot2")

## input data
kings_data <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",
                   skip=3)
kings_data

## mengubah data menjadi time series
kings_ts <- ts(kings_data)
kings_ts

## plotting data
plot.ts(kings_ts)

## differencing
king_tsd1 <- diff(kings_ts, differences=1)
king_tsd1
plot.ts(king_tsd1)

## mencari acf dan membuat plot acf
acf(king_tsd1, lag.max=20, plot=FALSE)
acf(king_tsd1, lag.max=20)

## mencari pacf dan membuat plot pacf
pacf(king_tsd1, lag.max=20, plot=FALSE)
pacf(king_tsd1, lag.max=20)

## melakukan fit data terhadap model ARIMA(0,1,1)
king_tsarima <- arima(kings_ts, order=c(0,1,1))
king_tsarima

## membuat forecast
king_tsforecast <- forecast(king_tsarima, h=5)
king_tsforecast

## membuat plot forecast
plot(king_tsforecast)

## membuat plot resiudal
plot.ts(king_tsforecast$residuals)            

den <- density(king_tsforecast$residual)
plot(den, frame = FALSE, col = "blue",main = "Density plot")
