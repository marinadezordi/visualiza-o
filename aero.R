library(dplyr)
library(plotly)

install.packages("plotly")

aeronave = read.csv("aeronave.csv")
ocorrencia = read.csv("ocorrencia.csv")
fabricantes = aeronave$fabricante
fab = data.frame(table(fabricantes))
fab = fab[order(fab$Freq, decreasing = TRUE), ]
fab = fab[1:18, ]
fab = fab[-8, ]
outros = data.frame(fabricantes="OUTROS", Freq=212)
fab <- bind_rows(fab, outros)

g <- plot_ly(x = fab$Freq, y = fab$fabricantes, type = 'bar', orientation = 'h')%>%   
  layout(margin = list(l = 200, r = 50, b = 50, t = 50, pad = 4))

g

