extract_name <- function(input) {
  
  output <- stringr::str_extract(string = input,
                                 pattern = regex_filename(),
                                 group = 4)
  
  return(output)
  
}
