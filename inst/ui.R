library(shiny)
shinyUI(pageWithSidebar(
  
  headerPanel("Selectable tables"),
  
  sidebarPanel(
    tags$head(
      tags$link(rel="stylesheet", type="text/css", href="css/styles.css"),
      tags$script(type = 'text/javascript', src = 'js/responsiveTable.js')
    ), 
    actionButton("btnGen", label="Generate")
  ),
  
  mainPanel(
    htmlOutput(outputId = "testTbl1"),
    uiOutput(outputId = "testTbl2"),
    uiOutput(outputId = "testTbl3"),
    uiOutput(outputId = "testTbl4"),
    div(style = 'clear:both;', HTML('<hr>Table 1: plain, non-selectable
                                     <br>Table 2: selectable rows, returns row numbers
                                     <br>Table 3: selectable cells, returns row and column number
                                     <br>Table 4: selectable rows and conditional formatting'))
  )
))