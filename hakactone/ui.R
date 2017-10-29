
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Hack the Campus"),
  tags$br(),
  tags$br(),
  tabsetPanel(type="tabs",tabPanel("Introdução",
    mainPanel(
      leafletOutput("mapa",width="150%"),
      htmlOutput("html")
      )
    ),
  tabPanel("Dados de orçamento para manutenção predial por instituto na Unicamp",
           leafletOutput("mapa2",width="150%")),tabPanel("Avaliação CR por curso",
           plotlyOutput("plot2"),
           htmlOutput("html2")))
    )
)
