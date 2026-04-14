extract_name <- function(input) {
  
  output <- stringr::str_extract(string = input,
                                 pattern = regex_filename()$filename_with_names,
                                 group = 4)
  
  return(output)
  
}
