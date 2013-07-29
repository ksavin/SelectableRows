library(shiny)
shinyUI(pageWithSidebar(
  
  headerPanel("Selectable Table"),
  
  sidebarPanel(
    tags$head(
      tags$link(rel="stylesheet", type="text/css", href="css/styles.css"),
      tags$script(type = 'text/javascript', src = 'js/responsiveTable.js')
    ), 
    actionButton("btnGen", label="Generate")
  ),
  
  mainPanel(
    uiOutput(outputId="testTbl")    
  )
))