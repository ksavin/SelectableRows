library(shiny)
shinyServer(function(input, output, session) {

  # generates test data frame
  testdf <- reactive({if (input$btnGen!=0) 
                        data.frame(year = 2000:2013, value = runif(14,-1,1))
                     })
  output$testTbl <- renderUI({
    if (!is.null(testdf()))
        HTML(df2html(testdf(), class = "tbl halfWidth selectable", id = "testTbl"))
    })

  # prints table row returned from client. -1 when nothing selected. NULL when table is not generated
  observe({print(input$testTbl)})
})

#generates html table tags from data frame, id is mandatory for binding
df2html <- function(df, class = NULL, id = NULL){
  out <- paste0("<table ", 
                ifelse(is.null(class), "", paste0(" class = \"",class, "\"")),
                ifelse(is.null(id), "", paste0(" id = \"", id, '\"')),
                ">", "<tr>")
  for (i in 1:length(names(df)))
    out <- paste0(out, "<th scope = \"col\">", names(df)[i], "</th>")
  for (i in 1: nrow(df)){
    out <- paste0(out, "<tr>")
    for (j in 1:ncol(df))
      out <- paste0(out,"<td>",df[i, j],"</td>")
    out <- paste0(out, "</tr>")
  }
  return(paste0(out, "</table>"))
}