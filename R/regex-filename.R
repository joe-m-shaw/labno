regex_filename <- function() {
  
  #' Regular expressions for filenames
  #'
  #' @returns A named list of regular expressions for different filename formats
  #' @export
  #'
  #' @examples regex_filename()$filename_with_names
  
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
