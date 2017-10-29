library(leaflet)
library(ggplot2)
load("mapalokers")
library(reshape2)
library(ggplot2)
library(plotly)
load("psico_area_grad")
load("psico_area_pos")
psico_area_grad<-read.csv("psico_area_grad.csv")

dadosCV_CR<-read.csv("dadosCV_CR.csv")
colnames(dadosCV_CR)[4:26] <- as.numeric(gsub("X","",colnames(dadosCV_CR)[4:26]))
dadosCR <- subset(dadosCV_CR, (as.numeric(rownames(dadosCV_CR)) %% 2)==0)
artesCR <- as.character(as.vector(dadosCV_CR[2,]))
artesCR <- as.numeric(artesCR[4:26])
dadosCRpeq <- dadosCR[,c(1,2,4:26)]

test<-melt(dadosCRpeq,id.vars = c("Curso", "Area"))

test$value[which(test$value<0)] <- 0.3525714

