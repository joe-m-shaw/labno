regex_ids <- function(){
  
  output_list <- list(
    
    "worksheet" = "(WS\\d{6})",
    "labno" = "(\\d{8})",
    "suffix" = "(a|b|c|d|)",
    "name" = "([:alnum:]{2,30})"
  )
  
  return(output_list)
  
}
