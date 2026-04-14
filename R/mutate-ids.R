mutate_ids <- function(df, filename){
  
  #' Add sample identifiers from filename as additional data columns
  #'
  #' @param df The dataframe to add identifiers to
  #' @param filename The filename of the dataframe
  #'
  #' @returns The original dataframe with additional columns of identifiers 
  #' from the filename
  #' @export
  #'
  #' @examples 
  #' 
  #' data_df <- data.frame(
  #' "col1" = c(1, 2),
  #' "col2" = c("a", "b"))
  #' 
  #' mutate_ids(df = data_df,
  #' filename = "Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx")
  #' 

  filename_df <- filename_to_df(filename)
  
  output <- cbind(df, filename_df)
  
  return(output)
  
}
