extract_suffix <- function(input){
  
  regex_labno_suffix <- paste0(".*", 
                               regex_ids()$labno,
                               regex_ids()$suffix,
                               ".*")
  
  output <- stringr::str_extract(string = input,
                                 pattern = regex_labno_suffix,
                                 group = 2)
  
  return(output)
  
}
