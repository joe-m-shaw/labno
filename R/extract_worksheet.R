extract_worksheet <- function(input){
  
  output <- stringr::str_extract(string = input,
                                 pattern = "WS\\d{6}")
  
  return(output)
  
}
