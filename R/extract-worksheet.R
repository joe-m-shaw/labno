extract_worksheet <- function(input){
  
  output <- stringr::str_extract(string = input,
                                 pattern = regex_ids()$worksheet)
  
  return(output)
  
}
