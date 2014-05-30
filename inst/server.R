library(shiny)
source('df2html.R')
shinyServer(function(input, output, session) {

  # generates test data frame
  testdf <- reactive({if (input$btnGen!=0) 
                        data.frame(year = 2000:2013, value = runif(14,-1,1))
                     })
  # prints plain table
  output$testTbl1 <- renderText({
    if (!is.null(testdf()))
      HTML(df2html(testdf(), class = 'tbl'))
  })
  # prints table with selectable rows
  output$testTbl2 <- renderUI({
    if (!is.null(testdf()))
        HTML(df2html(testdf(), class = "tbl selRow", id = "testTbl2"))
    })
  
  # prints table with selectable cells
  output$testTbl3 <- renderUI({
    if (!is.null(testdf()))
      HTML(df2html(testdf(), class = "tbl selCell", id = "testTbl3"))
  })
  
  # prints table with selectable rows and conditional formatting
  output$testTbl4 <- renderUI({
    if (!is.null(testdf()))
      HTML(df2html(testdf(), class = "tbl selRow", id = "testTbl4", 
                   cellClass = cbind(rep(NA, nrow(testdf())), ifelse(testdf()[,2]>=0, 'cellGreen', 'cellRed'))
                  )
      )
  })

  # prints row and column numbers of selected cell. 
  # -1 when nothing selected. NULL when table is not generated
  observe({print(paste0("Table 2: ", ifelse(is.null(input$testTbl2), "NULL", input$testTbl2)))})
  observe({print(paste0("Table 3: ", ifelse(is.null(input$testTbl3), "NULL", 
                                            paste0(input$testTbl3[1], ',',input$testTbl3[2]))))})
  observe({print(paste0("Table 4: ", ifelse(is.null(input$testTbl4), "NULL", input$testTbl4)))})
})