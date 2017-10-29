
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$mapa <- renderLeaflet({
      map <- leaflet()
      map <- addTiles(map)
      map <- addMarkers(map, mapa_loko$long, mapa_loko$lat, label = mapa_loko$sigla,popup = paste0("<center><b>",mapa_loko$sigla,"</center></b><br>","<b>Media prof GDE: </b>",round(mapa_loko$media_prof,2),"<br><b>Media evasao ult. 5 anos: </b>",mapa_loko$evasao_5anos,"<br><b>Percentual de reprovacao de alunos: </b>",mapa_loko$perc_reprovacao))
      map
  })
#     
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2]
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
  output$mapa2<-renderLeaflet({
    load('batata')
    map <- leaflet()
    map <- addTiles(map)
    map <- leaflet(batata) %>% addTiles() %>%
      addCircles(batata$long, batata$lat, weight = 1,
                 radius = ((batata$X.1)*0.3), opacity = 0.9, label = batata$sigla, popup = paste0("<b>Orcamento para manutencao predial (2016): R$</b>",(round(as.double(batata$X.1)*100)),2))
    map
  })
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white')
  output$plot2<-renderPlotly({
    g <- ggplot(test, aes(x=variable, y=value, group=as.factor(Curso))) +geom_line(mapping = aes(group = as.factor(Curso), color= as.factor(Curso))) + theme(legend.position = "none")
    g
})
})
