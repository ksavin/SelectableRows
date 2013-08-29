#---df2html description----
# generates html table tags from data frame
# df - data frame to display
# class - CSS class to style table. "tbl" class is used in styles.css example
# add selRow or selCell to class to enable row or cell selection
# e.g. class = 'tbl selCell', class = 'tbl selRow'
# id - mandatory for binding. Must be the same as input name
# cellClass - a matrix of the same size as df with strings representing CSS class for each cell. 
# Use for conditional formatting. Use NA to leave default cell format. 
# cellRed and cellGreen classes would change cell background to respective colors (defined in styles.css)
#-------------------------
df2html <- function(df, class = NULL, id = NULL, cellClass = NULL){
  if (is.null(cellClass))
    cellClass = matrix(NA, nrow(df), ncol(df))
  out <- paste0("<table ", 
                ifelse(is.null(class), "", paste0(" class = \"",class, "\"")),
                ifelse(is.null(id), "", paste0(" id = \"", id, '\"')),
                ">", "<tr>")
  for (i in 1:length(names(df)))
    out <- paste0(out, "<th scope = \"col\">", names(df)[i], "</th>")
  for (i in 1: nrow(df)){
    out <- paste0(out, "<tr>")
    for (j in 1:ncol(df))
      out <- paste0(out,"<td", 
                    ifelse(is.na(cellClass[i,j]), '', paste0(" class = \"", cellClass[i,j], "\"")),
                    '>', df[i, j],"</td>")
    out <- paste0(out, "</tr>")
  }
  return(paste0(out, "</table>"))
}