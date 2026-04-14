regex_filename <- function() {
  
  output_list <- list(
    
    "filename_with_names" = paste0("^.*",
                               regex_ids()$worksheet,
                               "_",
                               regex_ids()$labno,
                               regex_ids()$suffix,
                               "_",
                               regex_ids()$name,
                               ".*$"))
  
  return(output_list)
  
}
