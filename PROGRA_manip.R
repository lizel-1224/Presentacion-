setwd("C:/Users/Marcos/Downloads")
library("tidyverse")
dts <- read_csv("datos.csv")
vls <- as.matrix(dts[,2:13])
vls <- t(vls)
vls <- matrix(vls, ncol = 1)
df <- data.frame(Año = rep(1975:2013, rep(12, 39)),as.data.frame(vls))
names(df) <- c("AÑO", "pp")
md <- mean(df$pp)
dvs <- sd(df$pp)
qtl <- quantile(df$pp, probs = c(0.25, 0.75))
ric <- qtl[2] - qtl[1] 
paso <- 1.5 * ric
CEi <- qtl[2] + paso 
CEs <- qtl[2] + 2*paso

plot(df$pp, col = ifelse(df$pp > CEs, "red" , "gray70"))
