extract_labno <- function(input){
  
  output <- stringr::str_extract(string = input,
                                 pattern = regex_ids()$labno)
  
  return(output)
  
}

