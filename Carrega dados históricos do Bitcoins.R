## Bitcoin price ##

## LIBRARIES
library(tidyverse)
library(quantmod)
library(dplyr)


# ## Cotação Bitcoin 
atv <- getSymbols("BTC-USD", src = "yahoo")
atv <- na.omit(atv)
tab_btc <- as.data.frame(`BTC-USD`) %>%
  rownames_to_column() %>%
  transmute(data = rowname, 
            btc_opening = format(round(as.numeric(`BTC-USD.Open`),2),decimal.mark = ","), 
            btc_high = format(round(as.numeric(`BTC-USD.High`),2),decimal.mark = ","),
            btc_low = format(round(as.numeric(`BTC-USD.Low`),2),decimal.mark = ","),
            btc_close = format(round(as.numeric(`BTC-USD.Close`),2),decimal.mark = ","),
            btc_volume = format(round(as.numeric(`BTC-USD.Volume`),2),decimal.mark = ",")
  )

write.csv(tab_btc, "D:\\Users\\z141983\\Documents\\GitHub\\Bitcoin\\ds_bitcoin.csv", row.names = F)
